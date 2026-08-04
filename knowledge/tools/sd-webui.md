---
type: Tool
title: Stable Diffusion WebUI (CPU-only)
description: Running Stable Diffusion WebUI on CPU-only machines — optimizations, performance tuning, extensions, and settings for face-swap workflows.
tags: [ai, stable-diffusion, webui, cpu, python, face-swap, reactor, controlnet]
timestamp: 2026-08-03T00:00:00Z
---

# Overview

Stable Diffusion WebUI (AUTOMATIC1111) can run entirely on CPU (`--use-cpu all`). It is slow, but a
combination of memory optimizations, input resizing, and the right extensions makes it usable for
face-swap and image-edit workflows. This page captures the optimization stack, the learning path,
and the settings that worked.

# Running on CPU

Launch with all compute on CPU:

```bash
./webui.sh --use-cpu all
```

Environment levers that matter:

| Lever | Effect |
|---|---|
| `OMP_NUM_THREADS` | OpenMP thread count; SD workloads often peak at `nproc/2` (physical cores). Test 2/4/8 on identical images |
| `HF_HUB_OFFLINE=1` | HuggingFace offline mode; stops startup from trying to download detector/NSFW models |
| TCMalloc | Memory allocator that reduces fragmentation and peak RSS |

# Optimizations

- Remove the NSFW detector (`vit-base-nsfw-detector`) when not needed — saves download + inference.
- Keep the HF model cache local and run offline to avoid network stalls on startup.
- Apply the [SDP attention OOM fallback](/troubleshooting/sd-webui-sdp-attention-oom.md) for high-res VAE encoding.
- Set the img2img VAE encoder to `tiled` (`Settings → Stable Diffusion → Encoder for img2img`) to bound per-tile memory.

# Performance Tuning

## Resize inputs before img2img (biggest win)

The VAE operates at 1/8 resolution. A 4096×3072 source → 512×384 latent spatial = 196K tokens per
attention block. Downscaling to 1024× before img2img gives 128×96 = 12K tokens — a **3–10× speedup**.
Resize input first, then upscale output via the Extras tab.

## OpenVINO (heavier)

Intel's optimized runtime is 2–4× faster than PyTorch on Intel CPUs, but requires converting models
to IR format (`pip install openvino_diffusers`) and custom integration — not a WebUI extension.

## Hardware

CPU inference is ~100× slower than a modern GPU. PyTorch 2.x dropped CUDA support below compute
capability 7.5, so old laptop GPUs don't help. If this is a regular workflow, a used
RTX 3060 12GB-class card (~$200) is the only real speed upgrade.

# Extensions

| Extension | Purpose |
|---|---|
| [ReActor SFW](https://github.com/Gourieff/sd-webui-reactor-sfw) | Face swap, blending, mask correction, saved face models. See the [migration concept](/concepts/sd-webui-extension-migration.md) for the roop→ReActor path |
| [ControlNet](https://github.com/Mikubill/sd-webui-controlnet) | OpenPose (lock head/pose), Canny (preserve contours). Models: `lllyasviel/ControlNet-v1-1` |
| [ADetailer](https://github.com/Bing-su/adetailer) | Post-generation face detection + targeted inpainting; complements ReActor mask correction |

# Learning Path

1. **ReActor** — save face models (`.safetensors` in `models/reactor/faces/`), face blending,
   mask correction, batch/folder mode, X/Y/Z grid for parameter exploration.
2. **Prompt engineering for face swap** — CFG scale ≤ 2 keeps the swap faithful; `(keyword:1.1)`
   weights influence; avoid anime/illustration keywords for realistic photos.
3. **ControlNet** — pose/edge conditioning; works on CPU, slow but functional.
4. **ADetailer** — auto-refine each swapped face (`face_yolov8n.pt`, denoising 0.3–0.4).
5. **Model exploration** — checkpoints (`models/Stable-diffusion/`), LoRA (`models/Lora/`),
   face-swap models (`models/insightface/`).

# Key Numbers

| Setting | Best Practice |
|---|---|
| CFG Scale | ≤ 2 |
| Sampler | DPM++ 2M |
| Steps | 20–30 |
| Denoising (img2img) | 0.3–0.6 |
| CodeFormer weight | 0.5 default; try 0.3–0.7 |
| Face mask correction | Enable |
| Postprocessing order | Restore → Upscale (default) |

# Related

- [SDP Attention OOM](/troubleshooting/sd-webui-sdp-attention-oom.md) — high-res VAE encoding fix
- [Extension Migration](/concepts/sd-webui-extension-migration.md) — roop → ReActor SFW worked example
- Source: [../../raw/2026-08-03/sd-webui-cpu-learning-roadmap.md](../../raw/2026-08-03/sd-webui-cpu-learning-roadmap.md)

# Citations

[1] [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
[2] [Gourieff/sd-webui-reactor-sfw](https://github.com/Gourieff/sd-webui-reactor-sfw)
[3] [Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)
[4] [Bing-su/adetailer](https://github.com/Bing-su/adetailer)
