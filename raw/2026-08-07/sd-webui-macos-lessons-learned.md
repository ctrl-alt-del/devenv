# Stable Diffusion WebUI on macOS (Apple Silicon) — Lessons Learned

> Condensed knowledge from setting up and debugging AUTOMATIC1111 stable-diffusion-webui on an Apple Silicon Mac.
> PII removed: usernames, absolute home paths, and machine-specific identifiers replaced with placeholders.

---

## 1. Environment Summary

| Component | Detail |
|---|---|
| OS / Hardware | macOS, Apple Silicon (MPS — Metal Performance Shaders, no CUDA) |
| Python | 3.12 (uv-managed CPython) |
| Package manager | `uv` (uv venvs do NOT contain `pip` by default) |
| Torch | 2.3.1 / torchvision 0.18.1 (Apple Silicon defaults) |
| WebUI | v1.10.1 (AUTOMATIC1111) |
| venv location | `<project>/venv/` (uv-created, renamed from `.venv/`) |

---

## 2. How to Run

```bash
VIRTUAL_ENV= ./webui.sh
```

**Why `VIRTUAL_ENV=` must be unset:** if `VIRTUAL_ENV` is already set (e.g. stale `.venv` activation), `webui.sh` skips its venv detection branch AND leaves `python_cmd` pointing at the system Python. The system Python (PEP 668 externally-managed) can't pip install and doesn't have the venv's packages. Unsetting it makes `webui.sh` find and activate the local `venv/` itself.

**Wait for `Model loaded in X.Xs`** in the startup log before generating — requests arriving during the model-load window can intermittently fail (see §9).

---

## 3. Installing Packages (uv)

```bash
env -u http_proxy -u https_proxy -u HTTP_PROXY -u HTTPS_PROXY \
  uv pip install <package> --python venv/bin/python
```

- **Never use `python -m pip`** in a uv venv — `pip` isn't installed. If `launch_utils.py` triggers `run_pip()` it crashes with "No module named pip".
- Proxy env vars (`http_proxy`/`https_proxy` pointing to a local proxy) persist in the shell and hang `uv` — strip them with `env -u`.
- `curl --noproxy '*'` bypasses the proxy for manual downloads.
- For `tokenizers==0.13.3` (old Rust code), build with relaxed lints:
  ```bash
  RUSTFLAGS="-A invalid_reference_casting -A mismatched_lifetime_syntaxes -A unused_mut" \
    uv pip install tokenizers==0.13.3 --python venv/bin/python
  ```

---

## 4. `webui-user.sh` — Final Config

```bash
export COMMANDLINE_ARGS="--skip-torch-cuda-test --skip-python-version-check --use-cpu interrogate --no-half-vae"
export http_proxy=""
export https_proxy=""
export no_proxy="localhost,127.0.0.1,0.0.0.0"
python_cmd="$(dirname "$0")/venv/bin/python"   # absolute path — command -v only searches PATH

# Original Stability-AI/stablediffusion repo is 404; this mirror has ALL required features
export STABLE_DIFFUSION_REPO="https://github.com/joypaul162/Stability-AI-stablediffusion.git"
export STABLE_DIFFUSION_COMMIT_HASH="f16630a927e00098b524d687640719e4eb469b76"
```

Flag rationale:
- `--skip-torch-cuda-test` — no CUDA on Mac
- `--skip-python-version-check` — running 3.12, tested on 3.10
- `--use-cpu interrogate` — keep interrogate models off MPS
- `--no-half-vae` — **critical**: VAE in fp32 avoids the MPS fp16 VAE crash (see §9)
- Removed `--opt-split-attention-v1` and `--no-half` — see §7

---

## 5. Stable Diffusion Repo Saga

**`github.com/Stability-AI/stablediffusion` is gone (404).** The CompVis fork (`CompVis/stable-diffusion`) is an older codebase **missing features the webui requires**:

| Feature (in ldm package) | CompVis | working mirror |
|---|---|---|
| `ldm/modules/midas/` (depth estimation) | ✗ | ✓ |
| `ldm/data/util.py` (`AddMiDaS` transform) | ✗ | ✓ |
| `BasicTransformerBlock.ATTENTION_MODES` | ✗ | ✓ |
| `SpatialTransformer.use_linear` attr | ✗ | ✓ |
| `UNetModel(use_linear_in_transformer=...)` | ✗ | ✓ |
| `LatentDepth2ImageDiffusion` class | ✗ | ✓ |

Using CompVis produces a cascade of errors (`No module named 'taming'`, `no attribute 'ATTENTION_MODES'`, `no attribute 'use_linear'`, `No module named 'ldm.modules.midas'`). Fix: clone a complete mirror, set `STABLE_DIFFUSION_REPO` + `STABLE_DIFFUSION_COMMIT_HASH` (must match the clone's HEAD or the webui tries a fetch+checkout on every launch).

Also: `taming-transformers-rom1504` is a required extra package (`ldm.models.autoencoder` imports `taming`).

---

## 6. `requirements_versions.txt` Gotchas

`launch_utils.py:requirements_met()` does **exact `==` version comparison** using `packaging.version`. Any mismatch makes it call `run_pip()` → `python -m pip` → **crash in a uv venv (no pip)**.

- `packaging.version.parse("0.15") != parse("0.15.0")` — the release tuple `(0,15)` vs `(0,15,0)` differs. Pin exact segment counts: `httpcore==0.15.0`.
- The parser regex only matches `==` pins; `>=` lines and unpinned lines are skipped. Change `protobuf==3.20.0` → `protobuf>=3.20.0` if another package (e.g. onnx) requires a newer protobuf.

---

## 7. Attention Optimization Performance (10000s → 7s)

**`--opt-split-attention-v1` uses `torch.einsum`, which silently falls back to CPU on MPS** — every attention layer shuttles data MPS→CPU→MPS. With `--no-half` (fp32) this made inference take 10000+ seconds per image.

Fix: remove both flags. On MPS the webui auto-selects `sub-quadratic` attention (priority 1000 for MPS, uses custom code, no einsum). Log line to expect: `Applying attention optimization: sub-quadratic... done.`

Optimizer priority (MPS): SubQuad 1000 > Doggettx 90 > SdpNoMem 80 > Sdp 70 > V1 10. Avoid all einsum-based optimizers (V1, Doggettx, InvokeAI) on MPS.

Benchmarks (MPS, fp16 UNet): 512×512/5 steps ≈ 7s; startup ≈ 3.5s; model load ≈ 1.3s.

---

## 8. MPS + `convolution_overrideable` (img2img VAE encode crash)

**Symptom (intermittent):**
```
NotImplementedError: convolution_overrideable not implemented.
You are likely triggering this with tensor backend other than CPU/CUDA/MKLDNN
```
during img2img VAE encode (`images_tensor_to_samples` → `encode_first_stage` → `conv_in`), via `manual_cast_forward` → LoRA `network_Conv2d_forward` → `F.conv2d`.

**Root cause (verified experimentally):**
- In torch 2.3.1, `torch.ops.aten.convolution_overrideable` is **NOT implemented for the MPS backend** — calling it directly with MPS tensors always raises.
- Normal `F.conv2d` on MPS works because it dispatches to `_mps_convolution` (verified via profiler), NOT the overrideable path.
- The crash occurs when a conv is routed through the overrideable path — which happens under abnormal module state (mixed-dtype module mid-cast), a state the fp16 VAE + `manual_cast(fp16)` wrapper + LoRA global patch chain can transiently produce on MPS.
- Single-threaded VAE encode loops pass 20/20 in both fp16 and fp32 — the failure needs a race/interleaving (e.g., requests during the background model-load thread, or overlapping generations).
- Identical img2img API requests intermittently returned 503 (empty body) vs 200, timing-dependent around model load.

**Fix (applied):**
- `--no-half-vae` → VAE runs in fp32; MPS never hits the broken fp16 conv path in the VAE. Community-standard fix for MPS VAE issues.
- Avoid generating during the model-load window (watch for `Model loaded in X.Xs`).

**Note:** `torch.backends.mps` has many dtype/device quirks in torch 2.3.1; upgrading torch (≥2.4) is the deeper fix if issues persist.

---

## 9. ReActor Extension (`sd-webui-reactor-sfw`)

- Runs face swap on **CPU** via onnxruntime (no CUDA on Mac); logs `Running v0.7.1-b3 on Device: CPU`.
- `install.py` runs on **every launch** (extension installers are re-run each startup). Its model download used `urllib.request.urlopen()` **without a timeout** — with unreachable hosts (e.g. HuggingFace blocked) it hung the whole startup. Fix: added `timeout=30` + try/except with a manual-download hint.
- Model file: `models/insightface/inswapper_128.onnx` (~534 MB). If missing, ReActor logs "You should at least have one model in models directory" but the webui still launches.
- **Version tolerance:** `install.py` strictly checks `insightface==0.7.3` and prints an error for 1.0.1, but the extension works fine with the newer version.
- **NSFW detector:** `check_nsfwdet_model()` only checks `os.path.exists(path)` — an **empty directory fools it** (created by a failed download run) and it skips downloading. At inference, `pipeline("image-classification")` then crashes because `config.json` is missing. Two fixes:
  - Download 4 files from `huggingface.co/AdamCodd/vit-base-nsfw-detector` into `models/nsfw_detector/vit-base-nsfw-detector/`, OR
  - Bypass: `check_sfw_image()` in `scripts/reactor_swapper.py` → `return img` (skips NSFW check entirely).
- `last_device.txt` is auto-created in the extension dir on first run.
- Face-detection errors like `Age Detection: No face with index = 0 was found` are usage issues (no detectable face / thresholds), not bugs — lower detection confidence or use a clearer source face.

---

## 10. Gotchas Checklist

1. **uv venv has no pip** — `python -m pip` always fails; keep `requirements_met()` satisfied or install pip.
2. **`packaging.version` compares release tuples exactly** — `0.15` ≠ `0.15.0`.
3. **`os.path.exists()` on an empty dir returns True** — download-on-first-run checks that test the directory (not a file inside) silently skip; check for the actual file.
4. **`$0` in a sourced script** is the caller's name — in `webui-user.sh` sourced from `webui.sh`, `$(dirname "$0")` resolves to the project root.
5. **`command -v` only searches PATH** — set `python_cmd` to an absolute path.
6. **Stale `VIRTUAL_ENV`** breaks `webui.sh` venv handling — launch with `VIRTUAL_ENV=`.
7. **`torch.einsum` on MPS silently falls back to CPU** — avoid einsum-based attention optimizers.
8. **macOS git `osxkeychain` credential helper** fails non-interactively ("could not read Username") — use `GIT_ASKPASS=true` for public/404 repos.
9. **`convolution_overrideable` unimplemented on MPS (torch 2.3.1)** — fp16 VAE convs can route to it under race conditions; use `--no-half-vae`.
10. **Extension installers run every launch** — a hanging download in any extension blocks startup.
11. **HuggingFace may be unreachable** — plan for manual model downloads; add timeouts to any download code you touch.

---

## 11. Harmless Warnings (ignore)

- `no module 'xformers'. Processing without...` — CUDA-only, irrelevant on MPS.
- `Torch not compiled with CUDA enabled, memory monitor disabled` — expected.
- `FutureWarning: Importing from timm.models.layers is deprecated` — harmless.
- `SyntaxWarning: invalid escape sequence` — Python 3.12 compat, harmless.
- `INCOMPATIBLE PYTHON VERSION` — suppressed via `--skip-python-version-check`.
- `Sampler Scheduler autocorrection` — harmless normalization.
- `resource_tracker: leaked semaphore objects` — known Python multiprocessing shutdown warning.

---

## 12. Troubleshooting Decision Tree

```
./webui.sh fails?
├─ "No module named 'pip'" → requirements_met() mismatch → check §6 pins, or install pip
├─ "No module named 'insightface'" → uv pip install insightface onnx onnxruntime
├─ "No module named 'ldm.data.util'" / "'SpatialTransformer' no attribute 'use_linear'"
│   → wrong SD repo; use the joypaul162 mirror (§5)
├─ Hangs after "Commit hash: ..." → extension install.py stuck on network; add timeout (§9)
├─ "Couldn't install requirements" → pip missing in uv venv (§6)
├─ txt2img takes 10000s+ → remove --opt-split-attention-v1 / --no-half (§7)
├─ img2img "convolution_overrideable not implemented" → add --no-half-vae; wait for model load (§8)
├─ ReActor "You should at least have one model" → place inswapper_128.onnx in models/insightface/
└─ ReActor NSFW pipeline crash → bypass check_sfw_image or download vit-base-nsfw-detector (§9)
```
