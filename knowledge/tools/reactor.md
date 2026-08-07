---
type: Tool
title: ReActor (SD WebUI Face Swap Extension)
description: ReActor face swap extension for stable-diffusion-webui — CoreML provider tuning on Apple Silicon, insightface version drift, model files, and ecosystem status.
tags: [ai, stable-diffusion, webui, face-swap, reactor, onnxruntime, coreml, insightface, macos, apple-silicon]
timestamp: 2026-08-07T00:00:00Z
---

# Overview

ReActor (SFW fork) is the de facto face-swap extension for stable-diffusion-webui.
On Apple Silicon it runs via ONNX Runtime; a CoreML-enabled build of onnxruntime
provides a major speedup if the extension's hardcoded provider list is patched.
This page covers performance tuning, version drift, models, and ecosystem status.

# Execution Providers on Apple Silicon

ReActor hardcodes providers instead of resolving them:

```python
PROVIDERS = ["CUDAExecutionProvider"] if device == "CUDA" else ["CPUExecutionProvider"]
```

With `onnxruntime 1.28.0` (CoreML-enabled build) installed, every detection and swap
ran on CPU while the GPU/ANE accelerator sat unused. Resolve providers dynamically:

```python
def _get_providers(device=None):
    if (device or DEVICE) == "CUDA":
        return ["CUDAExecutionProvider"]
    try:
        import onnxruntime as ort
        if sys.platform == "darwin" and platform.machine() == "arm64" \
           and "CoreMLExecutionProvider" in ort.get_available_providers():
            return ["CoreMLExecutionProvider", "CPUExecutionProvider"]
    except Exception:
        pass
    return ["CPUExecutionProvider"]
```

## Measured impact (inswapper_128, MPS Mac)

| Step | CPU | CoreML | Speedup |
|---|---|---|---|
| Face detection (buffalo_l) | 0.069s | 0.056s | 1.2x |
| Swap (inswapper_128) | 0.669s | 0.123s | **5.4x** |

First-run CoreML load is slower (~3.4s model compilation) — a one-time cost, cached afterward.

# Version Drift

- ReActor pins `insightface==0.7.3` in `install.py` and prints an error for `1.0.1`,
  but the extension works fine with the newer version.
- **API change in insightface 1.0.1:** `INSwapper.get(img, ...)` no longer modifies
  `img` in place — it returns a new array (in 0.7.3 it mutated and returned the same
  object). Loops that reuse the original image and discard the return value silently
  keep only the last face swap. ReActor's own loop (`result = swapped_image` after
  each call) accumulates correctly and is immune.
- Verify: `out is inp` → `False`; `np.array_equal(inp, original)` → `True` when
  the API no longer mutates in place.

# Benchmarking

- Test on images with **multiple faces** and check identity per face — single-face
  tests mask ordering/accumulation bugs.
- Use per-face ArcFace cosine similarity (target vs source embedding) as an objective
  quality proxy: ~0.8+ = strong identity preservation, ~0.1 = unswapped.

# Models and Extension Files

- `models/insightface/inswapper_128.onnx` (~534 MB) — face swap model; if missing,
  ReActor logs "You should at least have one model in models directory" but the
  webui still launches.
- `models/nsfw_detector/vit-base-nsfw-detector/` (4 files, ~330 MB) — NSFW detection.
  `check_nsfwdet_model()` only checks `os.path.exists(path)` — an empty directory
  fools it and skips the download, crashing at inference (`config.json` missing).
  Bypass via `check_sfw_image()` returning `img`, or download the 4 files.
- `last_device.txt` is auto-created in the extension dir on first run.
- `install.py` runs on **every launch**; its model download used `urllib.request.urlopen()`
  **without a timeout**, hanging startup when HuggingFace is unreachable. Add `timeout=30`.
- Face-detection errors like `Age Detection: No face with index = 0 was found` are
  usage issues (no detectable face / thresholds), not bugs — lower detection
  confidence or use a clearer source face.
- See [SD WebUI — macOS Setup](/tools/sd-webui-macos.md) for install.py/NSFW fixes.

# Ecosystem Status (Aug 2026)

- Original `Gourieff/sd-webui-reactor` repo is **disabled by GitHub Staff** (TOS).
- The SFW fork `Gourieff/sd-webui-reactor-sfw` still exists but has been **stalled
  since Jan 2025**.
- roop is archived; `roop_unleashed` was removed; a continuation (Future-Roop) has
  low activity.
- [FaceFusion](/tools/facefusion.md) is the actively developed successor (images +
  video, CoreML support, regular releases).
- Newer generative identity methods (InstantID, PuLID, PhotoMaker, IP-Adapter FaceID)
  are a different paradigm (identity generation, not latent swapping), slower, and
  VRAM-hungrier — not drop-in replacements.

**Verdict:** keep ReActor for in-pipeline image swapping (faster + slightly better
identity fidelity after the CoreML patch); FaceFusion earns its place for video/lip-sync work.

# Related

- [SD WebUI — macOS Setup](/tools/sd-webui-macos.md) — install.py timeout, NSFW bypass, MPS VAE crash
- [FaceFusion](/tools/facefusion.md) — video/lip-sync successor
- [MPS convolution_overrideable](/troubleshooting/mps-convolution-overrideable.md) — img2img VAE crash
- [SD WebUI Extension Migration](/concepts/sd-webui-extension-migration.md) — roop → ReActor migration
- Source: [../../raw/2026-08-07/faceswap-performance-tuning-lessons.md](../../raw/2026-08-07/faceswap-performance-tuning-lessons.md)

# Citations

[1] [sd-webui-reactor-sfw](https://github.com/Gourieff/sd-webui-reactor-sfw)
[2] [ReActor](https://github.com/Gourieff/ReActor)
[3] [FaceFusion](https://github.com/facefusion/facefusion)
[4] [insightface](https://github.com/deepinsight/insightface)
