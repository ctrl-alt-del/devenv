---
type: Tool
title: FaceFusion
description: FaceFusion face-swap tool (images + video) — model validation, output extension rules, default swapper, and performance profile on Apple Silicon.
tags: [ai, face-swap, facefusion, onnxruntime, coreml, macos, apple-silicon, video]
timestamp: 2026-08-07T00:00:00Z
---

# Overview

FaceFusion is the actively developed successor to roop/ReActor for face swapping,
covering both images and video with regular releases and CoreML support on Apple
Silicon. It is slower per image than a CoreML-patched [ReActor](/tools/reactor.md),
but earns its place for video and lip-sync work.

# Operational Quirks

- **Model validation:** models come from GitHub releases `facefusion/facefusion-assets`
  and the HF mirror `facefusion/{release-base}`. Installs validate every `.onnx`
  against a sibling `.hash` file (**zlib crc32, 8 hex chars**) — verify downloaded
  models this way before use.
- **Output extension must match target extension** (`same_file_extension` check) —
  a `.jpg` target with `.png` output exits with a confusing "match the target and
  output extension!" message and produces nothing.
- **Default swapper is NOT inswapper_128** — it's `hyperswap_1a_256`. Pass
  `--face-swapper-model inswapper_128` for a fair comparison with ReActor.
- **Requires ffmpeg** on PATH even for image jobs.
- **Slow first run:** downloads ~1GB of models before doing anything; run in
  background with logging rather than a blocking foreground call.

# Performance Profile (Apple Silicon)

- Per-image pipeline (masker, fairface, color adjustment, encode) costs ~3.5s on
  CPU — about **10x ReActor's steady-state cost**.
- Its plain `onnxruntime` also lacks CoreML; installing `onnxruntime-silicon` in its
  venv would close the gap.

# When to Use

- Video and lip-sync work (ReActor is image-only in-pipeline).
- When the actively developed ecosystem matters more than raw per-image speed.

# Related

- [ReActor](/tools/reactor.md) — faster in-pipeline image swapping; ecosystem comparison
- [SD WebUI — macOS Setup](/tools/sd-webui-macos.md) — webui context and MPS fixes
- Source: [../../raw/2026-08-07/faceswap-performance-tuning-lessons.md](../../raw/2026-08-07/faceswap-performance-tuning-lessons.md)

# Citations

[1] [facefusion/facefusion](https://github.com/facefusion/facefusion)
[2] [facefusion-assets](https://github.com/facefusion/facefusion-assets)
