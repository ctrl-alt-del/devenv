---
type: Tool
title: Stable Diffusion WebUI — macOS Apple Silicon Setup
description: Complete macOS configuration for stable-diffusion-webui on Apple Silicon with MPS, including attention optimization, uv venv, ReActor extension, MPS VAE crash fixes, and common gotchas.
tags: [ai, stable-diffusion, webui, macos, apple-silicon, mps, uvic, attention, reactor, torch, vae]
timestamp: 2026-08-07T00:00:00Z
---

# Overview

Running stable-diffusion-webui on macOS Apple Silicon requires specific configuration
to avoid 1000x+ slowdowns from MPS-incompatible attention optimizers, uv venv quirks
with pip-less environments, and network-related extension installer hangs.

# Quickstart

```bash
VIRTUAL_ENV= ./webui.sh
```

`VIRTUAL_ENV` must be unset. When it's already defined (e.g., from a stale venv
activation), `webui.sh` skips venv detection and uses the system Python, which
cannot install packages (PEP 668 externally-managed Python).

# `webui-user.sh` Configuration

```bash
#!/bin/bash

# --opt-split-attention-v1 REMOVED (uses torch.einsum, 1000x slower on MPS)
# --no-half REMOVED (MPS has native fp16 support, 2x faster)
# --no-half-vae ADDED (MPS fp16 VAE crashes with convolution_overrideable, see Fix 7)
# --skip-python-version-check ADDED (suppresses 3.10 warning on 3.12+)
export COMMANDLINE_ARGS="--skip-torch-cuda-test --skip-python-version-check --use-cpu interrogate --no-half-vae"

# Kill broken proxy
export http_proxy=""
export https_proxy=""

# Must be absolute path — webui.sh uses command -v which only searches PATH
python_cmd="$(dirname "$0")/venv/bin/python"

# joypaul162 mirror has ALL required features the CompVis fork is missing
export STABLE_DIFFUSION_REPO="https://github.com/joypaul162/Stability-AI-stablediffusion.git"
export STABLE_DIFFUSION_COMMIT_HASH="f16630a927e00098b524d687640719e4eb469b76"
```

# Package Installation

Always use `uv pip` with `--python venv/bin/python`. Never `python -m pip` —
uv venvs have no pip module:

```bash
env -u http_proxy -u https_proxy -u HTTP_PROXY -u HTTPS_PROXY \
  uv pip install <package> --python venv/bin/python
```

## Core Requirements

```bash
RUSTFLAGS="-A invalid_reference_casting -A mismatched_lifetime_syntaxes -A unused_mut" \
  env -u http_proxy -u https_proxy \
  uv pip install -r requirements_versions.txt --python venv/bin/python

# Missing dependency for SD model loading
uv pip install taming-transformers-rom1504 --python venv/bin/python

# ReActor extension dependencies
uv pip install insightface onnx onnxruntime "albumentations==1.4.3" --python venv/bin/python
```

# Fixes

## Fix 1: Stable Diffusion Repo (404 → joypaul162 Mirror)

The original `Stability-AI/stablediffusion` repo returns 404. The CompVis fork is missing
6 features the webui requires (midas depth estimation, ATTENTION_MODES, use_linear,
LatentDepth2ImageDiffusion, AddMiDaS). The joypaul162 mirror has all of them.

The commit hash must match exactly — `launch_utils.py` compares `git rev-parse HEAD`
against the env var and only skips fetch if they match.

## Fix 2: Attention Optimizer (CRITICAL — 1000x Speedup)

`--opt-split-attention-v1` uses `torch.einsum` which **silently falls back to CPU**
on MPS with no warning. Every call moves data MPS→CPU→MPS. Combined with `--no-half`
(float32), inference takes 10000s+ per image.

Remove both flags. The WebUI auto-selects `sub-quadratic` attention on MPS
(priority 1000), which uses custom ops that stay on MPS:

| Optimizer | MPS-safe? | Uses einsum? |
|---|---|---|
| SubQuad | Yes (auto-selected) | No |
| SdpNoMem | Yes | No |
| V1/InvokeAI/Doggettx | No | Yes |

### Performance After Fix

| Benchmark | Before | After |
|---|---|---|
| 512×512 / 5 steps | ∞ (10000s+) | ~7s |
| Startup time | ~34s | ~3.7s |

## Fix 3: requirements_versions.txt Version Pins

`launch_utils.py:requirements_met()` checks exact match for `==` pins. If any mismatch,
it calls `run_pip()` → `python -m pip` → crashes in uv venv.

**Version parsing trap:**
```python
parse("0.15") == parse("0.15.0")  # False! (0, 15) ≠ (0, 15, 0)
```

Lines with `>=` pins are **skipped** by the regex — they bypass version checking entirely.

**Changes needed in `requirements_versions.txt`:**
```
httpcore==0.15   → httpcore==0.15.0   (exact segment count)
protobuf==3.20.0 → protobuf>=3.20.0   (skip version check, onnx needs 4.25.1+)
```

## Fix 4: ReActor install.py Timeout

`urllib.request.urlopen(url)` with **no timeout** blocks forever when HuggingFace
is unreachable. Extension installers run **on every startup**, not just first install.

```python
# Before (hangs indefinitely):
request = urllib.request.urlopen(url)

# After:
request = urllib.request.urlopen(url, timeout=30)
```

## Fix 5: NSFW Detector Bypass

`os.path.exists()` returns True for empty directories created by prior failed runs.
If the NSFW detector directory exists but is empty, the model download is silently
skipped, crashing at inference time with `config.json not found`.

Bypass if models cannot be downloaded (network restrictions):
```python
def check_sfw_image(img):
    return img  # Always consider safe
```

## Fix 6: Git Credential Helper on macOS

Homebrew git sets `credential.helper=osxkeychain` which fails in non-interactive shells.
For public repos returning 404/403:
```bash
GIT_ASKPASS=true git clone <url> <dir>
```

## Fix 7: MPS `convolution_overrideable` VAE Crash

Intermittent `NotImplementedError: convolution_overrideable not implemented` during
img2img VAE encode/decode on MPS. In torch 2.3.1, `torch.ops.aten.convolution_overrideable`
is **not implemented for the MPS backend** — the crash occurs when a conv is routed
through the overrideable path (a state that the fp16 VAE + `manual_cast(fp16)` wrapper +
LoRA global patch chain can transiently produce, especially during the model-load window).
Normal `F.conv2d` on MPS dispatches to `_mps_convolution` and works.

**Fix (applied):** `--no-half-vae` — VAE runs in fp32 and MPS never hits the broken
fp16 conv path. Also avoid generating during the model-load window (watch for
`Model loaded in X.Xs`).

**Alternative fix:** move the VAE to CPU around the decode in code
(see [MPS convolution_overrideable](/troubleshooting/mps-convolution-overrideable.md)
and [ReActor](/tools/reactor.md) for the full analysis).

# Gotchas

1. **uv venv has no pip** — `python -m pip` crashes. All installs must use `uv pip --python venv/bin/python`.
2. **Semantic version segments** — `parse("0.15") != parse("0.15.0")`. Always pin exact segment count.
3. **`os.path.exists` on empty dir** — Returns True; check for specific files instead.
4. **`$0` in sourced scripts** — `webui-user.sh` is sourced, so `$0` is still `webui.sh`.
5. **`command -v` requires PATH** — Must use absolute path for `python_cmd`.
6. **Stale `VIRTUAL_ENV`** — Breaks venv detection. Always prefix with `VIRTUAL_ENV= ./webui.sh`.
7. **`torch.einsum` on MPS** — Silent CPU fallback. Avoid all einsum-using optimizers.
8. **Extension installers run EVERY startup** — Any download/pip failure blocks launch.
9. **HuggingFace timeouts** — `urlopen()` with no timeout hangs 75-180s. Always add `timeout=30`.
10. **Tokenizers Rust compilation** — Old tokenizers need RUSTFLAGS to compile on new Rust toolchains.
11. **`convolution_overrideable` on MPS (torch 2.3.1)** — fp16 VAE convs can route to the unimplemented overrideable path under race conditions; use `--no-half-vae` (see Fix 7).
12. **Requests during model load** — img2img API requests in the model-load window intermittently return 503 (empty body) vs 200; wait for `Model loaded in X.Xs`.

# Safe-to-Ignore Warnings

| Warning | Why safe |
|---|---|
| `no module 'xformers'` | CUDA-only, irrelevant for MPS |
| `Torch not compiled with CUDA enabled` | Expected — no CUDA on Mac |
| `INCOMPATIBLE PYTHON VERSION` | Suppressed via `--skip-python-version-check` |

# Related

- [Stable Diffusion WebUI](/tools/sd-webui.md) — CPU-only optimization and general tuning
- [ReActor](/tools/reactor.md) — Face swap extension: CoreML providers, insightface drift, ecosystem status
- [FaceFusion](/tools/facefusion.md) — Video/lip-sync successor with CoreML support
- [MPS convolution_overrideable](/troubleshooting/mps-convolution-overrideable.md) — img2img VAE crash root cause and both fixes
- [SD WebUI SDP Attention OOM](/troubleshooting/sd-webui-sdp-attention-oom.md) — High-res VAE encoding OOM fix
- [SD WebUI Extension Migration](/concepts/sd-webui-extension-migration.md) — Extension evaluation and migration
- Source: [../../../raw/2026-08-05/stable-diffusion-webui-macos-lessons.md](../../raw/2026-08-05/stable-diffusion-webui-macos-lessons.md)
- Source: [../../../raw/2026-08-07/sd-webui-macos-lessons-learned.md](../../raw/2026-08-07/sd-webui-macos-lessons-learned.md)

# Citations

[1] [stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
[2] [joypaul162 SD mirror](https://github.com/joypaul162/Stability-AI-stablediffusion)
[3] [ReActor Extension](https://github.com/Gourieff/ReActor)
