# SD WebUI CPU Learning Roadmap

**Date:** 2026-08-03
**Machine:** Ubuntu 26.04, quad-core laptop CPU (4C/8T), high RAM, CPU-only (`--use-cpu all`)
**WebUI:** v1.10.1, CPU-only (`--use-cpu all`)
**Face swap:** ReActor SFW v0.7.1β3

---

## Optimizations Completed

- [x] TCMalloc memory allocator
- [x] NSFW detector removed (`vit-base-nsfw-detector`)
- [x] HuggingFace offline mode (`HF_HUB_OFFLINE=1`)
- [x] SDP attention OOM fallback (high-res VAE encoding)
- [x] ReActor reference card (recommended defaults in UI)
- [x] roop → ReActor SFW migration

---

## Performance (what's left)

### Quick: Tune thread count (5 min)

`OMP_NUM_THREADS=4` is set in `webui-user.sh`. A 4C/8T CPU has 4 physical cores + 4 hyperthreads = 8 logical. SD workloads often peak at `nproc/2`.

Test 2, 4, and 8 threads on identical images, compare wall-clock time:

```bash
export OMP_NUM_THREADS=2   # try this
export OMP_NUM_THREADS=8   # then this
```

### Quick: Resize inputs before img2img (manual)

High-resolution source images (e.g., 4096×3072) waste most of the CPU time. The VAE operates at 1/8 resolution — that's 512×384 latent spatial = 196K tokens per attention block. Downscaling to 1024× before img2img gives 128×96 latent spatial = 12K tokens. **3–10× speedup**, just resize the input image first, then upscale the output via Extras tab.

### Medium: VAE tiling

`Settings → Stable Diffusion → Encoder for img2img` → set to `tiled`. This complements the SDP attention fallback fix and reduces per-tile memory. Particularly useful with the high-resolution images processed.

### Heavy: OpenVINO inference

Intel's optimized runtime for Intel CPUs. 2–4× faster than PyTorch on CPU. Requires converting models to IR format. Research starting point:

```bash
pip install openvino_diffusers
```

Not a WebUI extension — needs custom integration. Worth exploring if staying on CPU long-term.

### Hardware: Used GPU

An RTX 3060 12GB-class card ≈ \$200 used. A low-end laptop GPU (compute capability 6.1) is below the 7.5 cutoff PyTorch 2.x dropped CUDA support at. A modern GPU is **100× faster** than CPU inference. Nothing else comes close.

---

## Learning Path

### Week 1–2: Master ReActor

| Feature | Where | Why |
|---|---|---|
| Save face models | ReActor → Save button | Creates `.safetensors` in `models/reactor/faces/`. Skip face detection entirely on future runs |
| Face blending | Tools → Face Models → Blend | Merge two faces into a hybrid model |
| Face Mask Correction | Checkbox in ReActor panel | Reduces pixelation around face contours |
| Batch processing | Multiple Images / Folder mode | Process many images with one source face |
| X/Y/Z grid | Script dropdown → X/Y/Z plot | Find optimal CodeFormer weight, restorer visibility, mask correction |

### Week 2–3: Prompt Engineering for Face Swap

The prompt still controls lighting, expression, and style even after swapping:

```
Positive: (sharp focus:1.2), (soft studio lighting:0.8), portrait, detailed eyes
Negative: deformed, blurry, bad anatomy, disfigured, extra fingers, fused features, low quality
```

- `(keyword:1.1)` increases influence, `(keyword:0.9)` decreases it
- CFG scale ≤ 2 keeps the swap faithful to the source image
- For realistic results, avoid anime/illustration keywords if source is a photograph

### Week 3–4: Add ControlNet

```bash
# Install via Extensions tab, URL:
https://github.com/Mikubill/sd-webui-controlnet
```

- **OpenPose**: Lock head position and body angle while swapping faces. Source and target pose must match for natural results
- **Canny**: Preserve face contours and edges during the swap. Helps when the target face shape differs significantly from the source
- Works on CPU — slow but functional. Download models from `https://huggingface.co/lllyasviel/ControlNet-v1-1`

### Week 4–5: Add ADetailer

```bash
# Install via Extensions tab, URL:
https://github.com/Bing-su/adetailer
```

- Auto-detects faces post-generation using the same detection model
- Applies targeted inpainting to refine each swapped face
- Complements ReActor's mask correction — ADetailer handles edge blending, ReActor handles the swap itself
- Settings: Detection model = `face_yolov8n.pt`, Inpaint denoising = 0.3–0.4

### Ongoing: Model Exploration

| What | Where | Description |
|---|---|---|
| SD checkpoints | `models/Stable-diffusion/` | Try different base models for your art style (realistic, anime, illustration) |
| LoRA models | `models/Lora/` | Fine-tuned additions for specific face characteristics, lighting styles |
| Face swap models | `models/insightface/` | Beyond `inswapper_128.onnx` — ReActor supports additional face swap models |

---

## Key Numbers

| Setting | Best Practice |
|---|---|
| CFG Scale | ≤ 2 |
| Sampler | DPM++ 2M |
| Steps | 20–30 |
| Denoising (img2img) | 0.3–0.6 |
| CodeFormer weight | 0.5 (default), try 0.3–0.7 |
| Face mask correction | Enable |
| Postprocessing order | Restore first → Upscale (default) |

---

## Honest Tradeoffs

CPU inference will always be slow. Everything above improves quality and reduces frustration, but doesn't make it fast. A low-end laptop GPU is too old for PyTorch CUDA — even if it worked, 2GB VRAM limits output to 512×512 at best.

If this is a regular workflow, a used GPU is the only real speed upgrade. A used RTX 3060 12GB-class card at \$200 pays for itself in saved time within a month of active use.

Until then, the two highest-impact actions are:
1. **Resize inputs before processing** — single biggest CPU speedup
2. **Learn ControlNet** — single biggest quality improvement
