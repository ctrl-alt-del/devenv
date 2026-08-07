---
type: Concept
title: SD WebUI Extension Migration
description: Evaluating a WebUI extension landscape and migrating from an archived extension to a maintained successor, using the roop → ReActor SFW face-swap migration as a worked example.
tags: [ai, stable-diffusion, webui, extension, migration, face-swap, reactor, roop, facefusion]
timestamp: 2026-08-07T00:00:00Z
---

# Overview

WebUI extensions go dormant or archived. When the extension you rely on stops being maintained,
migrate to the most complete, tested successor rather than staying on dead code. This page captures
the decision criteria and a repeatable migration workflow, with the roop → ReActor SFW face-swap
migration as a worked example.

# Evaluate the Landscape

Gather these signals for every candidate:

| Signal | Why it matters |
|---|---|
| **Archived status** | Hard stop — an archived repo receives no fixes or security updates |
| **Last push** | Stale-but-feature-complete can still be a fine target; dead ≠ broken |
| **Stars** | Proxy for adoption and community testing |
| **Forks** | Check forks for CPU optimizations or bug fixes the upstream lacks |
| **Open issues** | Many open issues = unaddressed problems; few = healthy or inactive |
| **Age / forks ratio** | Very new with 0 forks is unproven; years-dead with many open issues is risky |

**Decision rule:** prefer the candidate that is most complete, most tested, and most compatible —
not necessarily the newest or most starred.

# Migration Workflow

1. **Backup the shared model** — the successor usually reuses the same underlying ONNX model
   (e.g., `inswapper_128.onnx`). Copy it before touching extensions.
2. **Remove the old extension** — stop WebUI, `rm -rf extensions/<old>/`.
3. **Pin dependency versions** — the old extension's requirements may conflict (e.g., roop pinned
   `insightface==0.7.3`; the successor may need different versions or extra deps).
4. **Install the successor** — Extensions tab → "Install from URL".
5. **Move the model** to the location the successor expects.
6. **Install new dependencies** (e.g., `albumentations==1.4.3`).
7. **Verify** the pinned dependency with an import/version check.
8. **Map settings parity** — carry over every knob; note *improvements* the new tool adds.
9. **Test** a small case first, then your real workload, then heavy features (restore + upscale).
10. **Keep a rollback plan** — document the exact reverse steps.

# Worked Example: roop → ReActor SFW

**Context:** `s0md3v/sd-webui-roop` archived Mar 2026. Candidates evaluated (Aug 2026):

| Extension | Stars | Last Push | Status |
|---|---|---|---|
| sd-webui-roop | — | Mar 2026 | Archived |
| **Gourieff/sd-webui-reactor-sfw** | 309 | Jan 2025 | Dormant, feature-complete |
| sd-webui-faceswaplab | 820 | Sep 2023 | 3 years dead, 61 open issues |
| reactor-sfw fork (CPU opts) | 11 | Jun 2025 | Fork, untested |
| sd-faceswap | 7 | May 2026 | Too new, 0 forks |

**Chosen:** ReActor SFW — most complete (blending, mask correction, saved face models, gender
detection, X/Y/Z grid, postprocessing order), most tested, most compatible.

**What you gain over roop:** reusable `.safetensors` face models, face mask correction (less
pixelation), multiple/random source faces, save-original option, X/Y/Z parameter grids.

**Key migration steps applied:** backed up `inswapper_128.onnx` → removed roop → pinned
`insightface==0.7.3` → installed ReActor SFW → moved model to `models/insightface/` → installed
`albumentations==1.4.3` → verified version → enabled **Face Mask Correction** and **postprocessing
order = restore→upscale** (better than roop's upscale→restore).

# Patterns

1. **Version pinning after migration** — always verify the successor's expected dependency versions;
   a leftover pinned version from the old extension can break the new one (and vice versa).
2. **Model reuse** — face-swap extensions share the `inswapper_128.onnx` model; migration is usually
   a path move, not a re-download.
3. **Dormant ≠ abandoned** — a feature-complete extension that stopped receiving commits can still be
   the best choice over a recently-pushed but buggy/unproven one.
4. **"Disabled by GitHub Staff" is a hard stop** — beyond archived, a repo can be disabled by GitHub
   Staff (TOS). Treat it like archived status with no way back: the code still exists but the
   canonical repo is gone.

# Ecosystem Update (Aug 2026)

- The original `Gourieff/sd-webui-reactor` repo is **disabled by GitHub Staff** (TOS);
  the SFW fork chosen in the worked example is still the best in-pipeline option even
  though it has been stalled since Jan 2025.
- roop is archived; `roop_unleashed` was removed; a continuation (Future-Roop) has low activity.
- **FaceFusion** is the actively developed successor (images + video, CoreML support) —
  see [FaceFusion](/tools/facefusion.md). It is ~10x slower per image than a CoreML-patched
  [ReActor](/tools/reactor.md); it earns its place for video/lip-sync work.
- Newer generative identity methods (InstantID, PuLID, PhotoMaker, IP-Adapter FaceID)
  are a **different paradigm** — identity *generation* rather than latent swapping —
  slower and VRAM-hungrier, not drop-in replacements for face-swap extensions.

# Related

- [Stable Diffusion WebUI](/tools/sd-webui.md) — the tool this pattern applies to
- [ReActor](/tools/reactor.md) — the chosen successor, with CoreML tuning and ecosystem status
- [FaceFusion](/tools/facefusion.md) — the active video/lip-sync successor
- Source: [../../raw/2026-08-03/roop-to-reactor-migration.md](../../raw/2026-08-03/roop-to-reactor-migration.md)
- Source: [../../raw/2026-08-07/faceswap-performance-tuning-lessons.md](../../raw/2026-08-07/faceswap-performance-tuning-lessons.md)

# Citations

[1] [s0md3v/sd-webui-roop](https://github.com/s0md3v/sd-webui-roop)
[2] [Gourieff/sd-webui-reactor-sfw](https://github.com/Gourieff/sd-webui-reactor-sfw)
[3] [glucauze/sd-webui-faceswaplab](https://github.com/glucauze/sd-webui-faceswaplab)
