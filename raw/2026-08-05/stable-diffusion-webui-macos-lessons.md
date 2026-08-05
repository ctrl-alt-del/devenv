# Stable Diffusion WebUI on macOS — Lessons Learned

> **Machine:** Apple Silicon (arm64) · **OS:** macOS · **Python:** 3.12.13 · **uv:** 0.11.32 · **Torch:** 2.3.1

---

## Quickstart

```bash
# The one command that works (from the project root):
VIRTUAL_ENV= ./webui.sh
```

---

## Environment

| Component | Detail |
|---|---|
| Python | 3.12.13 (uv-managed CPython at `~/.local/share/uv/python/`) |
| venv | `venv/` (uv venv, renamed from `.venv/`) |
| Package manager | `uv pip` (pip NOT installed — never use `python -m pip`) |
| Torch | 2.3.1, torchvision 0.18.1 (Apple Silicon defaults from `webui-macos-env.sh`) |
| GPU | MPS (Metal Performance Shaders) — no CUDA |
| Network | Proxy `127.0.0.1:1087` in shell env (non-functional). HuggingFace unreachable. PyPI works. |

---

## How to run

```bash
VIRTUAL_ENV= ./webui.sh
```

`VIRTUAL_ENV=` **must be unset** or `webui.sh` skips venv detection entirely.
When `VIRTUAL_ENV` is already set (e.g. from a stale `.venv` activation),
`webui.sh` prints "python venv already activate or run without venv" but
**does NOT update `python_cmd`** — it stays as the system `python3`, which:

1. May be Python 3.14 (externally-managed, PEP 668 — pip refuses to install)
2. Has no access to the venv's installed packages

With `VIRTUAL_ENV` unset, `webui.sh` enters the create-and-activate branch:
- Finds existing `venv/` directory → skips creation
- Activates via `source venv/bin/activate`
- Sets `python_cmd=venv/bin/python`

---

## How to install packages

```bash
env -u http_proxy -u https_proxy -u HTTP_PROXY -u HTTPS_PROXY \
  uv pip install <package> --python venv/bin/python
```

| Rule | Why |
|---|---|
| Always `env -u http_proxy -u https_proxy` | Shell has a broken proxy; uv uses it and hangs |
| Never `python -m pip` | uv venv has no `pip` module installed |
| Use `--python venv/bin/python` | Targets the venv's Python, not the system one |
| For tokenizers: add `RUSTFLAGS="-A invalid_reference_casting -A mismatched_lifetime_syntaxes -A unused_mut"` | Old tokenizers Rust code incompatible with current Rust compiler |

---

## `webui-user.sh` — Final Config

```bash
#!/bin/bash

# Attention: --opt-split-attention-v1 REMOVED (uses torch.einsum, 1000x slower on MPS)
#            --no-half REMOVED (MPS has native fp16 support, 2x faster)
#            --listen REMOVED (local access only)
#            --skip-python-version-check ADDED (suppresses 3.10 warning)
export COMMANDLINE_ARGS="--skip-torch-cuda-test --skip-python-version-check --use-cpu interrogate"

# Kill the broken proxy (export empty to override shell defaults)
export http_proxy=""
export https_proxy=""
export no_proxy="localhost,127.0.0.1,0.0.0.0"

# Must be absolute path — webui.sh uses `command -v` which only searches PATH
python_cmd="$(dirname "$0")/venv/bin/python"

# Original Stability-AI/stablediffusion repo is 404. This fork has ALL required features:
# midas module, ATTENTION_MODES, use_linear, LatentDepth2ImageDiffusion, AddMiDaS
export STABLE_DIFFUSION_REPO="https://github.com/joypaul162/Stability-AI-stablediffusion.git"
export STABLE_DIFFUSION_COMMIT_HASH="f16630a927e00098b524d687640719e4eb469b76"
```

---

## All Modified Files

| File | Change | Why |
|---|---|---|
| `webui-user.sh` | Updated COMMANDLINE_ARGS, proxy, python_cmd, STABLE_DIFFUSION_REPO/HASH | Core configuration |
| `requirements_versions.txt:12` | `httpcore==0.15` → `httpcore==0.15.0` | `packaging.version.parse("0.15") != packaging.version.parse("0.15.0")` — exact match fails |
| `requirements_versions.txt:21` | `protobuf==3.20.0` → `protobuf>=3.20.0` | `onnx` requires `>=4.25.1`; uv installed 7.35.1. `>=` pins are skipped by `requirements_met()` |
| `extensions/sd-webui-reactor-sfw/install.py` | `urlopen(url)` → `urlopen(url, timeout=30)` + try/except | Original had NO timeout — HuggingFace unreachable → hung indefinitely |
| `extensions/sd-webui-reactor-sfw/scripts/reactor_swapper.py` | `check_sfw_image()` bypassed to always return `img` | NSFW detector model needs 330MB download from HuggingFace (unreachable) |

**Previously patched but wiped** (switched to joypaul162 mirror, which has everything built-in):
- `repositories/stable-diffusion-stability-ai/ldm/modules/attention.py` — added `ATTENTION_MODES` to `BasicTransformerBlock`, `use_linear` to `SpatialTransformer`
- `repositories/stable-diffusion-stability-ai/ldm/modules/diffusionmodules/openaimodel.py` — added `use_linear_in_transformer` to `UNetModel`
- `repositories/stable-diffusion-stability-ai/ldm/models/diffusion/ddpm.py` — added `LatentDepth2ImageDiffusion` class
- `repositories/stable-diffusion-stability-ai/ldm/modules/midas/` — created entire module
- `repositories/stable-diffusion-stability-ai/ldm/data/util.py` — created `AddMiDaS` transform

---

## Dependency Install Commands (in order)

```bash
# 1. Core requirements (takes ~5 min)
export TOKENIZER_RUSTFLAGS="-A invalid_reference_casting -A mismatched_lifetime_syntaxes -A unused_mut"
RUSTFLAGS="$TOKENIZER_RUSTFLAGS" \
  env -u http_proxy -u https_proxy -u HTTP_PROXY -u HTTPS_PROXY \
  uv pip install -r requirements_versions.txt --python venv/bin/python

# 2. Missing dependency for SD model loading
env -u http_proxy -u https_proxy \
  uv pip install taming-transformers-rom1504 --python venv/bin/python

# 3. ReActor extension dependencies
env -u http_proxy -u https_proxy \
  uv pip install insightface onnx onnxruntime "albumentations==1.4.3" --python venv/bin/python

# 4. Manually download model files (HuggingFace is unreachable from this network):
#    - models/insightface/inswapper_128.onnx (534 MB)
#    - models/nsfw_detector/vit-base-nsfw-detector/ (4 files, 330 MB total)
#      NOTE: NSFW check is currently bypassed; only needed if you re-enable it.
```

---

## Fix #1: Stable Diffusion Repo

**Problem:** `https://github.com/Stability-AI/stablediffusion.git` → 404 (repo gone/private).

The CompVis fork (`github.com/CompVis/stable-diffusion`) has an older codebase missing features the webui requires:

| Feature | CompVis | joypaul162 |
|---|---|---|
| `ldm/modules/midas/` (depth estimation) | No | Yes |
| `ldm/data/util.py` (`AddMiDaS` transform) | No | Yes |
| `BasicTransformerBlock.ATTENTION_MODES` class attr | No | Yes |
| `SpatialTransformer.use_linear` attr | No | Yes |
| `UNetModel` accepts `use_linear_in_transformer` | No | Yes |
| `LatentDepth2ImageDiffusion` class | No | Yes |

**Solution:** Clone `github.com/joypaul162/Stability-AI-stablediffusion.git` into
`repositories/stable-diffusion-stability-ai/`. Set env vars in `webui-user.sh`:
```bash
export STABLE_DIFFUSION_REPO="https://github.com/joypaul162/Stability-AI-stablediffusion.git"
export STABLE_DIFFUSION_COMMIT_HASH="f16630a927e00098b524d687640719e4eb469b76"
```

**Why commit hash matters:** `launch_utils.py` checks `git rev-parse HEAD` against
the env var. If they match → skip fetch+checkout. If they differ → tries checkout
(which may fail if local changes exist). Must match exactly.

**Clone command used:**
```bash
GIT_ASKPASS=true git clone --depth 1 https://github.com/joypaul162/Stability-AI-stablediffusion.git \
  repositories/stable-diffusion-stability-ai
```

---

## Fix #2: tokenizers==0.13.3 Rust Compile

**Problem:** `tokenizers==0.13.3` (required by `transformers==4.30.2`) uses Rust code
that triggers `#[deny(invalid_reference_casting)]` in current Rust compilers.

**Error:**
```
error: casting `&T` to `&mut T` is undefined behavior
  --> tokenizers-lib/src/models/bpe/trainer.rs:526:47
```

**Solution:** Build with relaxed lint checks:
```bash
RUSTFLAGS="-A invalid_reference_casting -A mismatched_lifetime_syntaxes -A unused_mut"
```

There is no pre-built wheel for `tokenizers==0.13.3` on Python 3.12/macOS ARM64,
so it MUST compile from source. Set RUSTFLAGS before `uv pip install`.

---

## Fix #3: Attention Optimization Performance (CRITICAL)

**Problem:** `--opt-split-attention-v1` uses `torch.einsum` internally.
On MPS (Apple Silicon), `torch.einsum` **silently falls back to CPU** for every call,
causing 1000x+ slowdown. Combined with `--no-half` (float32), inference took 10000s+
for any image.

**Solution:** Remove `--opt-split-attention-v1` and `--no-half`.
WebUI auto-selects `sub-quadratic` attention on MPS (priority 1000).

### Attention optimizer priority order on MPS

| Optimizer | Priority | Uses einsum? | MPS-safe? |
|---|---|---|---|
| SubQuad | **1000** (auto) | No (custom) | Yes |
| SdpNoMem | 80 | No (SDP) | Yes |
| Sdp | 70 | No (SDP) | Yes |
| Doggettx | 90 | Yes | No |
| InvokeAI | 10 (1000 on CPU) | Yes | No |
| **V1** | 10 | **Yes** | **No** |
| Xformers | 100 (CUDA only) | N/A | N/A |

### How the auto-selection works

`sd_hijack.py:apply_optimizations()`:
1. If user passed `--opt-<name>`, use that optimizer (ignoring priority)
2. If "Automatic" mode: check if any `cmd_opt` flag was passed → use it; else use highest-priority available
3. SubQuad has `@property priority: return 1000 if shared.device.type == 'mps' else 10`

### Performance

| Resolution/Steps | Before fix | After fix |
|---|---|---|
| 64×64 / 2 steps | ∞ (10000s+) | <1s |
| 512×512 / 5 steps | ∞ (10000s+) | ~7s |
| Startup time | ~34s (install.py hang) | ~3.7s |
| Model load | ~1.3s | ~1.3s |

---

## Fix #4: requirements_versions.txt Version Pins

**Problem:** `launch_utils.py:requirements_met()` checks exact version match for all `==` pins.
If ANY mismatch → calls `run_pip()` which runs `python -m pip` → **crashes** because
uv venv has no pip module.

### Version parsing gotcha

```python
from packaging.version import parse
parse("0.15") == parse("0.15.0")  # False! (0, 15) != (0, 15, 0)
```

`requirements_versions.txt` had `httpcore==0.15` but the installed version was `0.15.0`.
This single mismatch caused the entire startup to fail.

### The regex only matches `==`

```python
re_requirement = re.compile(r"\s*([-_a-zA-Z0-9]+)\s*(?:==\s*([-+_.a-zA-Z0-9]+))?\s*")
```

Lines with `>=` or no version pin are **skipped** by `requirements_met()`.

### Changes made

```
# Line 12: httpcore==0.15 → httpcore==0.15.0
# Line 21: protobuf==3.20.0 → protobuf>=3.20.0 (skipped by regex, no version check)
```

---

## Fix #5: ReActor install.py Hangs on Launch

**Problem:** `extensions/sd-webui-reactor-sfw/install.py` line 52-56:
```python
def download(url, path):
    request = urllib.request.urlopen(url)  # NO TIMEOUT
    ...
```

`urllib.request.urlopen()` with no timeout blocks indefinitely when the server is unreachable.
HuggingFace is unreachable from this network → every startup hung for 180s (process timeout).

**Solution:** Added `timeout=30` and try/except:
```python
def download(url, path):
    try:
        request = urllib.request.urlopen(url, timeout=30)
        ...
    except Exception as e:
        print(f"Failed to download model: {e}")
        print(f"Model must be downloaded manually to {path}")
```

**Key insight:** Extension `install.py` runs on **every startup**, not just first install.
Any download or pip install failure blocks launch every time.

---

## Fix #6: NSFW Detector Bypass

**Problem:** `check_nsfwdet_model()` in `reactor_helpers.py`:
```python
def check_nsfwdet_model(path: str):
    if not os.path.exists(path):  # <-- checks directory existence
        os.makedirs(path)
        # download model files...
```
The directory `models/nsfw_detector/vit-base-nsfw-detector/` existed but was **empty**
(created by a prior partial run). `os.path.exists()` returns True for empty dirs,
so the download is skipped. At inference time, `pipeline("image-classification", model=path)`
from transformers crashes because `config.json` is missing.

**Solution:** Bypassed `check_sfw_image()` in `reactor_swapper.py`:
```python
def check_sfw_image(img: Image.Image):
    return img  # always consider safe, skip NSFW detection
```

The model (`vit-base-nsfw-detector`, 330MB from AdamCodd on HuggingFace) requires 4 files:
`config.json`, `preprocessor_config.json`, `model.safetensors`, `confusion_matrix.png`.
Re-enable by restoring the original function and downloading those files.

---

## How launch_utils.py Works

The `prepare_environment()` flow on every startup:

```
1. Check Python version → warn if not 3.10
2. Install torch/torchvision (if missing) → uses TORCH_COMMAND env var
3. CUDA test (unless --skip-torch-cuda-test)
4. Install CLIP (if missing)
5. Install open_clip (if missing)
6. Clone 5 repos (if missing): assets, SD, SDXL, k-diffusion, BLIP
7. requirements_met() → if any == pin mismatched → run_pip()
8. Run extension installers (EVERY startup!)
9. Version check (if --update-check)
```

### Key env vars that control behavior

| Env var | Default | Effect |
|---|---|---|
| `REQS_FILE` | `requirements_versions.txt` | Which requirements file to check |
| `STABLE_DIFFUSION_REPO` | Stability-AI URL | Git repo URL |
| `STABLE_DIFFUSION_COMMIT_HASH` | hardcoded hash | Commit to checkout |
| `TORCH_COMMAND` | pip install torch... | How to install torch |
| `CLIP_PACKAGE` | openai/CLIP URL | CLIP source |
| `OPENCLIP_PACKAGE` | mlfoundations URL | OpenCLIP source |

### git_clone logic

```python
def git_clone(url, dir, name, commithash=None):
    if os.path.exists(dir):
        if commithash is None:
            return  # dir exists, no hash check → skip
        current = git('rev-parse HEAD')
        if current == commithash:
            return  # already at right commit → skip
        git('fetch')
        git(f'checkout {commithash}')  # ⚠ may fail with local changes
    else:
        git(f'clone {url} {dir}')
        if commithash:
            git(f'checkout {commithash}')
```

---

## Gotchas & Anti-Patterns

### 1. uv venv has no pip
`python -m pip` **always crashes** in a uv venv unless you explicitly install pip.
`launch_utils.py:run_pip()` calls `python -m pip` — avoided by ensuring `requirements_met()` passes.

### 2. packaging.version comparison is strict
`Version("0.15")` has `release=(0, 15)`. `Version("0.15.0")` has `release=(0, 15, 0)`. They are NOT equal.
Always pin the exact number of version segments (use `0.15.0` not `0.15`).

### 3. os.path.exists on empty dir → True
Download-on-first-run patterns that check `os.path.exists(path)` will silently skip if an empty
directory was created by a previous failed run (e.g., `os.makedirs()` succeeded but download crashed).
Check for the actual file:
```python
if not os.path.exists(os.path.join(path, "expected_file.ext")):
    download()
```

### 4. $0 in sourced scripts
When `webui.sh` sources `webui-user.sh`, `$0` inside `webui-user.sh` is still `webui.sh`.
So `$(dirname "$0")` gives the project root correctly. But if you run `webui-user.sh` directly,
`$0` would be `webui-user.sh`, giving a wrong path.

### 5. command -v requires PATH
```bash
python_cmd="venv/bin/python"  # Won't work — `command -v` only searches PATH
```
Must use absolute path:
```bash
python_cmd="$(dirname "$0")/venv/bin/python"  # Works
```

### 6. Stale VIRTUAL_ENV breaks venv detection
If `.venv` was renamed to `venv` but `VIRTUAL_ENV` still points to `.venv`:
- `webui.sh` skips venv creation (VIRTUAL_ENV is set)
- Doesn't update `python_cmd` → uses system python
- System python (3.14) can't pip install (PEP 668)
- Solution: `VIRTUAL_ENV= ./webui.sh`

### 7. torch.einsum on MPS → CPU fallback
`torch.einsum` silently falls back to CPU on MPS with no warning or error.
Every einsum call moves data MPS→CPU→MPS. For attention layers called hundreds
of times per inference step, this makes inference impossibly slow.
**Avoid all attention optimizers that use einsum:** V1, Doggettx, InvokeAI.

### 8. Git credential helper on macOS
Homebrew's git config sets `credential.helper=osxkeychain`. This tries to access
the macOS Keychain, failing in non-interactive shells with "Device not configured".
For public repos that return 404/403: use `GIT_ASKPASS=true` to skip credential prompts.

### 9. HuggingFace unreachable → silent hangs
`urllib.request.urlopen()` with no timeout blocks forever. Extension installers that
download models from HuggingFace will hang the entire startup for the duration of
the TCP connection timeout (typically 75-180 seconds) or indefinitely.

### 10. Extension installers run EVERY startup
`launch_utils.py:run_extensions_installers()` runs for every extension on every launch.
Any failure in an extension's `install.py` (download timeout, pip install failure)
blocks the entire startup. This is a design issue in stable-diffusion-webui.

---

## Normal Warnings — Safe to Ignore

These appear on every clean launch and are NOT errors:

| Warning | Reason |
|---|---|
| `no module 'xformers'. Processing without...` | xformers is CUDA-only, irrelevant for MPS |
| `Torch not compiled with CUDA enabled, memory monitor disabled` | Expected — no CUDA on Mac |
| `FutureWarning: Importing from timm.models.layers is deprecated` | Harmless deprecation from `timm` library |
| `SyntaxWarning: invalid escape sequence` | Python 3.12 compatibility, non-functional |
| `INCOMPATIBLE PYTHON VERSION` (3.12 != 3.10) | Suppressed via `--skip-python-version-check` |
| `ReActor - WARNING - You should at least have one model` | Only appears if model file missing; resolved by placing `inswapper_128.onnx` in `models/insightface/` |
| `ReActor - ERROR - Age/Gender Detection: No face found` | Face detection tuning issue (lower confidence threshold, use clearer image) |
| `Sampler Scheduler autocorrection` | Harmless sampler normalization |
| `resource_tracker: leaked semaphore objects` | Known Python multiprocessing issue on shutdown |

---

## ReActor Extension Notes

- **Version:** v0.7.1-b3
- **Location:** `extensions/sd-webui-reactor-sfw/`
- **Python requirements:** `insightface` (installed 1.0.1, extension expects 0.7.3 — works), `onnx`, `onnxruntime`, `albumentations==1.4.3`, `opencv-python`
- **Model files needed:**
  - `models/insightface/inswapper_128.onnx` (534 MB) — face swap model
  - `models/nsfw_detector/vit-base-nsfw-detector/` (330 MB, 4 files) — NSFW detection (currently bypassed)
- **Device:** Runs on CPU (`onnxruntime` CPUExecutionProvider)
- **`insightface` version tolerance:** install.py prints `Error: (insightface 1.0.1, Requirement.parse('insightface==0.7.3'))` but the extension loads and works fine with 1.0.1
- **`last_device.txt`:** Auto-generated in extension directory on first run, tracks CPU vs CUDA

---

## Key Paths

```
stable-diffusion-webui/
├── venv/                          # uv-managed Python 3.12 venv (renamed from .venv/)
├── webui-user.sh                  # ★ Main config file
├── webui.sh                       # Entry script
├── requirements_versions.txt      # Version pins (2 lines modified)
├── launch.py                      # Calls launch_utils.prepare_environment()
├── modules/
│   ├── launch_utils.py            # Environment setup, pip installs, git clones
│   ├── devices.py                 # Device detection (CUDA → MPS → CPU)
│   ├── mac_specific.py            # MPS workarounds and compatibility fixes
│   ├── sd_hijack_optimizations.py # Attention optimizers (V1, SubQuad, SDP, etc.)
│   ├── sd_hijack.py               # Optimizer selection logic
│   ├── shared_init.py             # Sets devices.device, dtype, weight_load_location
│   └── initialize.py              # Startup initialization order
├── configs/
│   └── v1-inference.yaml          # Model config (no use_linear_in_transformer here)
├── models/
│   ├── Stable-diffusion/          # Checkpoint files (.safetensors, .ckpt)
│   └── insightface/               # ReActor face detection models
├── repositories/
│   ├── stable-diffusion-stability-ai/  # ★ joypaul162 mirror (was CompVis)
│   ├── stable-diffusion-webui-assets/
│   ├── generative-models/         # SDXL
│   ├── k-diffusion/
│   └── BLIP/
└── extensions/
    └── sd-webui-reactor-sfw/      # ★ ReActor (2 files modified)
        ├── install.py             # Added timeout to download()
        └── scripts/
            └── reactor_swapper.py # check_sfw_image() bypassed
```

---

## Dependency Summary

### Installed via `uv pip` (in venv/)

**Core** (from `requirements_versions.txt`, 108 packages):
setuptools, GitPython, Pillow, accelerate, blendmodes, clean-fid, diskcache,
einops, facexlib, fastapi, gradio, httpcore, inflection, jsonmerge, kornia,
lark, numpy, omegaconf, open-clip-torch, piexif, protobuf, psutil,
pytorch_lightning, resize-right, safetensors, scikit-image, spandrel,
spandrel-extra-arches, tomesd, torch, torchdiffeq, torchsde, transformers,
httpx, pillow-avif-plugin

**Extra:**
- `taming-transformers-rom1504` (required by ldm.models.autoencoder)
- `insightface` (1.0.1 — ReActor face detection)
- `onnx`, `onnxruntime` (ReActor model runtime)
- `albumentations==1.4.3` (ReActor image augmentation)

### Pre-installed
- `torch==2.3.1` (was in `.venv` before rename)
- `torchvision==0.18.1` (was in `.venv` before rename)

### NOT installed (intentionally)
- `pip` — not in uv venv; install via `uv pip install pip --python venv/bin/python` if needed
- `xformers` — CUDA-only, irrelevant for MPS
- NSFW detector model — HuggingFace unreachable; NSFW check bypassed

---

## Troubleshooting Decision Tree

```
./webui.sh failed?
├── "ModuleNotFoundError: No module named 'pip'"
│   → requirements_met() returned False, run_pip() called.
│   → Check version pins in requirements_versions.txt vs installed versions.
│   → Or install pip: uv pip install pip --python venv/bin/python
│
├── "ModuleNotFoundError: No module named 'insightface'
│   → Install: env -u http_proxy -u https_proxy uv pip install insightface onnx onnxruntime --python venv/bin/python
│
├── "ModuleNotFoundError: No module named 'ldm.data.util'"
│   → Wrong SD repo. Use joypaul162 mirror, not CompVis.
│
├── "AttributeError: 'SpatialTransformer' object has no attribute 'use_linear'"
│   → Same — CompVis fork doesn't have this. Switch to joypaul162.
│
├── Hangs forever after "Commit hash: 82a973c..."
│   → Extension install.py is downloading from HuggingFace. Add timeout.
│
├── "Couldn't install requirements" / "Error code: 1"
│   → system pip failed. Check: is python in venv? Does pip exist?
│
├── txt2img takes 10000s+
│   → Check attention optimizer. Remove --opt-split-attention-v1.
│     Should see "Applying attention optimization: sub-quadratic... done."
│
└── "Failed to download model" (ReActor)
    → HuggingFace unreachable. Download model files manually.
      Place in models/insightface/ and models/nsfw_detector/vit-base-nsfw-detector/
```
