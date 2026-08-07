# Lessons Learned: Face Swap Performance Tuning (Stable Diffusion WebUI + ReActor + FaceFusion)

Date: 2026-08-05
Platform: macOS (Apple Silicon), A1111 stable-diffusion-webui, Python 3.12 venv, PyTorch 2.3.1

## Session TL;DR

1. Fixed a macOS MPS crash in the SD VAE decoder by patching webui code (not env vars).
2. Discovered ReActor's ONNX models were running on CPU despite a CoreML-capable onnxruntime being installed — patching the provider list gave a **5.4x speedup** on face swap inference.
3. Benchmarked ReActor vs FaceFusion on the same images; ReActor+CoreML won on both speed and identity fidelity.
4. Uncovered an insightface 1.0.1 API behavior change vs 0.7.3 (the version ReActor pins) that silently breaks multi-face swap loops.

---

## 1. macOS MPS VAE crash: `convolution_overrideable not implemented`

**Symptom:** img2img fails at `decode_latent_batch` → VAE decoder → `F.conv2d` raises `NotImplementedError: convolution_overrideable not implemented`.

**What did NOT work:** `PYTORCH_ENABLE_MPS_FALLBACK=1` (the standard advice). On PyTorch 2.3.1 this env var does not cover this specific upsample-convolution path, and it is never a substitute for testing the actual failing operation.

**What worked:** A code-level workaround in `modules/sd_samplers_common.py` — when `torch.backends.mps.is_available()`, temporarily move `model.first_stage_model` (the VAE) to CPU, decode, move it back (guarded by try/finally).

**Lesson:** On MPS, treat PyTorch as a partial implementation. Verify with a minimal repro (load model → decode) before assuming env-var fallbacks apply. Prefer localizing the affected component (VAE on CPU) over disabling precision flags like `--no-half-vae` alone — the conv issue is device-, not dtype-, related.

## 2. Check what is actually installed before optimizing

The venv already had `onnxruntime 1.28.0` **with CoreMLExecutionProvider available** (a CoreML-enabled build). ReActor's `reactor_swapper.py` however hardcoded providers:

```python
PROVIDERS = ["CUDAExecutionProvider"] if device == "CUDA" else ["CPUExecutionProvider"]
```

So every detection and swap ran on CPU while a GPU/ANE accelerator sat unused.

**Fix:** resolve providers dynamically:

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

**Measured impact (inswapper_128):**

| Step | CPU | CoreML | Speedup |
|---|---|---|---|
| Face detection (buffalo_l) | 0.069s | 0.056s | 1.2x |
| Swap (inswapper_128) | 0.669s | 0.123s | **5.4x** |

First-run CoreML load is slower (~3.4s model compilation) — one-time cost, cached afterward.

**Lesson:** Before tuning anything, enumerate available execution providers and check which one the code path actually uses. "It works" ≠ "it uses the fast backend."

## 3. The benchmark script, not the tool, was broken (double-check in-place semantics)

Initial comparison: FaceFusion output showed identity similarity ~0.84, ReActor-path output ~0.11 (= target identity). It looked like ReActor's swap silently failed.

**Root cause:** a bug in my own test script. With insightface **1.0.1**, `INSwapper.get(img, ...)` does **not** modify `img` in place — it returns a new array (in 0.7.3 it mutated and returned the same object). My loop called `get()` on the original image every iteration, discarding earlier swaps, so only the last face survived. The tool itself was fine.

ReActor's own loop (`result = swapped_image` after each call) accumulates correctly and is immune to this behavior difference.

**Verification:** `out is inp` → `False`; `np.array_equal(inp, original)` → `True`; plus per-face identity checks showed each single-face swap worked.

**Lessons:**
- When a swap "does nothing," check the input array for mutation and the returned object identity before blaming the model.
- Benchmark on images with **multiple faces** and check identity per face — single-face tests mask ordering/accumulation bugs.
- Use per-face ArcFace cosine similarity (target vs source embedding) as an objective quality proxy; ~0.8+ = strong identity preservation, ~0.1 = unswapped.

## 4. ReActor ecosystem status (as of Aug 2026)

- Original `Gourieff/sd-webui-reactor` repo is **disabled by GitHub Staff** (TOS).
- The SFW fork `Gourieff/sd-webui-reactor-sfw` still exists but has been **stalled since Jan 2025**.
- roop is archived; `roop_unleashed` was removed; a continuation (Future-Roop) has low activity.
- **FaceFusion** is the actively developed successor (images + video, CoreML support, regular releases).
- Newer generative identity methods (InstantID, PuLID, PhotoMaker, IP-Adapter FaceID) are a different paradigm (identity generation, not latent swapping), slower, and VRAM-hungrier — not drop-in replacements.

**Verdict from benchmarks:** keep ReActor for in-pipeline image swapping (faster + slightly better identity fidelity after the CoreML patch); FaceFusion earns its place only for video/lip-sync work.

## 5. FaceFusion operational quirks

- **Model sources:** GitHub releases `facefusion/facefusion-assets` and HF mirror `facefusion/{release-base}`; installs validate every `.onnx` against a sibling `.hash` file (**zlib crc32**, 8 hex chars) — verify downloaded models this way before use.
- **Output extension must match target extension** (`same_file_extension` check) — `.jpg` target + `.png` output exits with a confusing "match the target and output extension!" message and produces nothing.
- **Default swapper is NOT inswapper_128** — it's `hyperswap_1a_256`; pass `--face-swapper-model inswapper_128` for a fair comparison with ReActor.
- **Requires ffmpeg** installed on PATH even for image jobs.
- **Slow first run:** downloads ~1GB of models before doing anything; run in background with logging rather than a blocking foreground call.
- FaceFusion's per-image pipeline (masker, fairface, color adjustment, encode) costs ~3.5s on CPU — about 10x ReActor's steady-state cost — and its plain `onnxruntime` also lacks CoreML (installing `onnxruntime-silicon` in its venv would close the gap).

## 6. macOS-specific gotchas collected

- `./venv/bin/pip` may not exist; use `./venv/bin/python -m pip`.
- `webui-user.sh` may pin custom forks/commits (`STABLE_DIFFUSION_REPO`/`COMMIT_HASH`) — check before assuming upstream behavior.
- VAE decode is routinely forced to `target_device=devices.cpu` by webui; the model's own device can still be MPS, and `.to(dtype)` converts dtype only — verify both device and dtype when tracing device-mismatch errors.
- ReActor pins `insightface==0.7.3` but the venv had `1.0.1`; version drift between the extension's requirements and installed packages is common and can change runtime semantics silently (see lesson 3).

## Bottom line

- Verify the actual execution backend before tuning parameters.
- Fix device-specific issues in code, not with env vars that may not cover the failing op.
- Re-test benchmarks with multi-face images and per-face metrics — your script is the most likely source of a "broken" result.
- ReActor + CoreML provider patch is the cheapest high-impact win on Apple Silicon; keep FaceFusion in reserve for video.
