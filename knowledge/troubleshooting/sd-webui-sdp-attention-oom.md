---
type: Troubleshooting
title: SDP Attention OOM on High-Resolution VAE Encoding
description: Fix out-of-memory crashes in Stable Diffusion WebUI when encoding high-resolution images, caused by SDP attention materializing the full attention matrix on CPU.
tags: [ai, stable-diffusion, webui, attention, oom, vae, cpu, memory]
timestamp: 2026-08-03T00:00:00Z
---

# Overview

High-resolution img2img (e.g., 4096×3072) with `--opt-sdp-no-mem-attention` can crash the VAE
encoder with `Cannot allocate memory`. The VAE's `AttnBlock` calls
`torch.nn.functional.scaled_dot_product_attention()`, which materializes the full quadratic
attention matrix. On CPU the SDP kernel context manager is a no-op, so the matrix is always
materialized — no memory-efficient kernel to save you.

# Symptom

```
RuntimeError: [enforce fail at alloc_cpu.cpp:127] err == 0. DefaultCPUAllocator: can't allocate memory: you tried to allocate 154618822656 bytes. Error code 12 (Cannot allocate memory)
```

154 GB requested for a 4096×3072 source — the VAE mid-block runs at 1/8 resolution
(512×384 spatial = 196,608 tokens), and `(196608)² × 4 bytes ≈ 154 GB` in float32.

# Root Cause

The VAE encoder `AttnBlock` computes attention over the flattened spatial tokens. Memory for the
attention matrix grows **quadratically** with token count. `torch.backends.cuda.sdp_kernel` only
selects memory-efficient kernels on CUDA; on CPU the fallback materializes the full matrix.

# Fix

**File:** `modules/sd_hijack_optimizations.py` — **Function:** `sdp_attnblock_forward` (line 637)

Add a dynamic memory-aware fallback: estimate the SDP memory before executing and, if it exceeds
50% of available memory, delegate to `sub_quad_attnblock_forward` (chunked, sub-quadratic attention).

```python
sdp_mem_estimate = bytes_per_element * batch * (tokens**2 + tokens * channels * 3)
if sdp_mem_estimate > available_mem * 0.5:
    return sub_quad_attnblock_forward(...)   # memory-bounded chunked path
```

## Memory estimate formula

- `tokens²` — the `(seq_len × seq_len)` attention matrix
- `tokens × channels × 3` — q, k, v tensors (each `b × tokens × c`)
- Exit threshold: `sdp_mem_estimate > available_mem × 0.5`

## Why the 0.5 safety factor?

The 50% headroom covers intermediate tensor allocations during SDP, output/rearrange operations,
non-model pressure (OS, other processes), and multiple attention blocks stacking during VAE encoding.

## Behavior across RAM sizes

| RAM Available | Max tokens (float32) | Max image resolution |
|---|---|---|
| 8 GB  | ~22K tokens | ~1400×1400 |
| 16 GB | ~32K tokens | ~2000×2000 |
| 32 GB | ~46K tokens | ~2900×2900 |
| 64 GB | ~63K tokens | ~4000×4000 |

Images under the threshold use the fast SDP path; larger ones fall back to chunked sub-quadratic
attention. In practice only very high-resolution VAE encoding triggers the fallback — U-Net
attention at 64×64 / 128×128 stays on the fast path.

## Reuses existing infrastructure

- `get_available_vram()` (line 166) — GPU VRAM on CUDA, else `psutil.virtual_memory().available`
- `sub_quad_attnblock_forward()` (line 665) — already adaptive-chunked
- `psutil` (imported line 3)

# Pitfalls

1. `torch.backends.cuda.sdp_kernel()` is **CUDA-only** — no effect on CPU; don't rely on it there.
2. The `FutureWarning: torch.backends.cuda.sdp_kernel() is deprecated` log line is a separate issue —
   update to a newer PyTorch or use `torch.nn.attention.sdpa_kernel()`.
3. Tiling the img2img VAE encoder (`Settings → Stable Diffusion → Encoder for img2img → tiled`)
   complements this fix by bounding per-tile memory.

# Related

- [Stable Diffusion WebUI](/tools/sd-webui.md) — CPU optimization context and settings
- Source: [../../raw/2026-08-03/sdp-attention-oom-fix.md](../../raw/2026-08-03/sdp-attention-oom-fix.md)

# Citations

[1] [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
