---
type: Troubleshooting
title: MPS convolution_overrideable Crash
description: Intermittent NotImplementedError: convolution_overrideable not implemented during img2img VAE encode/decode on Apple Silicon (torch 2.3.1) — root cause, --no-half-vae and code-level fixes.
tags: [ai, stable-diffusion, webui, macos, apple-silicon, mps, torch, vae, img2img, troubleshooting]
timestamp: 2026-08-07T00:00:00Z
---

# Symptom

Intermittent failure during img2img on Apple Silicon:

```
NotImplementedError: convolution_overrideable not implemented.
You are likely triggering this with tensor backend other than CPU/CUDA/MKLDNN
```

Occurs in both directions of the VAE trip:

- **Encode** (`images_tensor_to_samples` → `encode_first_stage` → `conv_in`) via
  `manual_cast_forward` → LoRA `network_Conv2d_forward` → `F.conv2d`.
- **Decode** (`decode_latent_batch` → VAE decoder → `F.conv2d`).

The failure is timing-dependent: identical img2img API requests intermittently
returned 503 (empty body) vs 200 around the model-load window; single-threaded VAE
encode loops passed 20/20 in both fp16 and fp32. The crash needs a race/interleaving
(e.g., requests during the background model-load thread, or overlapping generations).

# Root Cause

In torch 2.3.1, `torch.ops.aten.convolution_overrideable` is **NOT implemented for
the MPS backend** — calling it directly with MPS tensors always raises. Normal
`F.conv2d` on MPS works because it dispatches to `_mps_convolution` (verified via
profiler), not the overrideable path.

A conv is routed through the overrideable path under abnormal module state —
mixed-dtype module mid-cast — a state that the fp16 VAE + `manual_cast(fp16)` wrapper
+ LoRA global patch chain can transiently produce on MPS.

# Fixes

## Fix 1: `--no-half-vae` (env config, applied)

Run the VAE in fp32 so MPS never hits the broken fp16 conv path:

```bash
export COMMANDLINE_ARGS="... --no-half-vae"
```

Community-standard fix for MPS VAE issues. Also avoid generating during the
model-load window (watch for `Model loaded in X.Xs`).

## Fix 2: Code-level VAE offload (verified alternative)

In `modules/sd_samplers_common.py`, when `torch.backends.mps.is_available()`,
temporarily move `model.first_stage_model` (the VAE) to CPU, decode, and move it
back — guarded by try/finally. Localizing the affected component on CPU fixes the
crash even when `--no-half-vae` is not enough.

**Note:** the two fixes disagree on the framing — Fix 1 treats it as a dtype issue
(fp16), Fix 2 argues the conv issue is device-, not dtype-, related. Both have been
verified to work; prefer the code-level fix when dtype flags alone are insufficient.

# What Does NOT Work

`PYTORCH_ENABLE_MPS_FALLBACK=1` (the standard advice) does **not** cover this
specific upsample-convolution path on PyTorch 2.3.1, and it is never a substitute
for testing the actual failing operation.

# Prevention

- Upgrade torch to ≥2.4 — many MPS dtype/device quirks in 2.3.1 are fixed there.
- Avoid requests during the model-load window.
- On MPS, treat PyTorch as a partial implementation: verify with a minimal repro
  (load model → decode) before assuming env-var fallbacks apply.

# Related

- [SD WebUI — macOS Setup](/tools/sd-webui-macos.md) — full Apple Silicon config including `--no-half-vae`
- [ReActor](/tools/reactor.md) — LoRA patch chain context and face swap tuning
- [SD WebUI SDP Attention OOM](/troubleshooting/sd-webui-sdp-attention-oom.md) — different VAE failure on CPU
- Source: [../../raw/2026-08-07/sd-webui-macos-lessons-learned.md](../../raw/2026-08-07/sd-webui-macos-lessons-learned.md)
- Source: [../../raw/2026-08-07/faceswap-performance-tuning-lessons.md](../../raw/2026-08-07/faceswap-performance-tuning-lessons.md)

# Citations

[1] [stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
[2] [PyTorch MPS backend](https://pytorch.org/docs/stable/notes/mps.html)
