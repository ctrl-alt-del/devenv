# roop → ReActor SFW Migration Plan

**Date:** 2026-08-03
**Machine:** Ubuntu 26.04, CPU-only (`--use-cpu all`)
**Current:** `s0md3v/sd-webui-roop` (archived Mar 2026)
**Target:** `Gourieff/sd-webui-reactor-sfw` v0.7.1β3 (309 stars, last push Jan 2025)

---

## Extension Landscape (August 2026)

| Extension | Stars | Last Push | Status |
|---|---|---|---|
| s0md3v/sd-webui-roop | — | Mar 2026 | Archived |
| **Gourieff/sd-webui-reactor-sfw** | **309** | **Jan 2025** | **Dormant, feature-complete** |
| glucauze/sd-webui-faceswaplab | 820 | Sep 2023 | 3 years dead, 61 open issues |
| monster0318/sd-webui-reactor-sfw | 11 | Jun 2025 | Fork with CPU opts, untested |
| 2aronS/sd-faceswap | 7 | May 2026 | Too new, 0 forks |

**Decision:** ReActor SFW — most complete, most tested, most compatible.

---

## What you gain

| roop | ReActor SFW |
|---|---|
| Basic face swap | Face swap + blending |
| One model only | Safetensors face models (reusable) |
| No mask correction | Face mask correction (no pixelation) |
| No gender detection | Gender detection |
| Single source face | Multiple source faces / folder / random |
| — | Save original (pre-swap) images |
| — | X/Y/Z grid for parameter exploration |
| — | Postprocessing order control |

---

## Steps

### 1. Backup
```bash
cp models/roop/inswapper_128.onnx /tmp/inswapper_128.onnx.backup
```

### 2. Remove old roop extension
Stop WebUI, then:
```bash
rm -rf extensions/sd-webui-roop/
```

### 3. Downgrade insightface
```bash
venv/bin/pip install insightface==0.7.3
```
(roop was the only insightface consumer; 1.0.1 → 0.7.3 is safe)

### 4. Install ReActor SFW
- Start WebUI → Extensions → "Install from URL"
- URL: `https://github.com/Gourieff/sd-webui-reactor-sfw`
- Install → restart

### 5. Move model
```bash
mkdir -p models/insightface
mv models/roop/inswapper_128.onnx models/insightface/inswapper_128.onnx
```

### 6. Install new dependency
```bash
venv/bin/pip install albumentations==1.4.3
```

### 7. Verify
```bash
venv/bin/python -c "import insightface; print(insightface.__version__)"
```
Expected: `0.7.3`

### 8. Settings parity
Map roop settings to ReActor:
- `Model` → Same (now reads `models/insightface/`)
- `Face number(s)` → Same (now supports spaces)
- `Restore Face: CodeFormer` → Same
- `Restore visibility` → Same slider
- `Upscaler` → Same + "Force Upscale"
- `Swap in source/generated` → Same checkboxes

New to enable:
- **Face Mask Correction** — reduces pixelation
- **Postprocessing order** — restore→upscale (better than roop's upscale→restore)

### 9. Test
1. Simple 512×512 txt2img face swap
2. img2img with 4096×3072 source (SDP attention fix already in place)
3. CodeFormer + upscaling

---

## Rollback
```bash
rm -rf extensions/sd-webui-reactor-sfw
pip install insightface==1.0.1
git clone https://github.com/s0md3v/sd-webui-roop.git extensions/sd-webui-roop
cp /tmp/inswapper_128.onnx.backup models/roop/inswapper_128.onnx
```

## Future improvements
1. Explore newer face swap models beyond `inswapper_128.onnx`
2. Build and save face models (safetensors) for frequently used faces
3. Experiment with face blending for hybrid looks
