# macOS App Slow First Launch — Full Diagnosis & Resolution

**Date:** 2026-07-25
**System:** macOS on Apple Silicon (arm64), Darwin 26.5.1
**App:** `<your-app>` v1.0.0 (`<bundle-id>`), Tauri 2 GUI + Python 3.10 backend
**Archive:** `/Applications/<your-app>.app`
**Data dir:** `/Users/$USER/<your-app-data-dir>`

---

## Keywords (for AI/agent search retrieval)

```
rosetta, apple-silicon, x86_64, arm64, quarantine, code-signature, amfi,
library-load-disallowed, bad-cpu-type, pyinstaller, slow-first-launch,
mixed-architecture, gatekeeper, adhoc-signing, translocated-app,
com.apple.quarantine, codesign-remove, oahd, notarization
```

---

## Triage Checklist

Run these 5 checks in order. If all pass, this doc does NOT apply.

### Check 1: Is this an Apple Silicon Mac?

```sh
# EXPECTED: "arm64" — if "x86_64", Rosetta is irrelevant, skip this doc
uname -m
```

### Check 2: Does the app have mixed architecture?

```sh
# EXPECTED: "Mach-O universal binary with 2 architectures" — indicates x86_64 portion
file /Applications/<your-app>.app/Contents/MacOS/<your-app>

# ALSO CHECK the backend binary (often x86_64-only in mixed apps):
# EXPECTED: "Mach-O 64-bit executable x86_64" on arm64 = needs Rosetta
file /Users/$USER/<your-app-data-dir>/server.bin
```

### Check 3: Is Rosetta installed and functional?

```sh
# EXPECTED: "Rosetta works!" — if "Bad CPU type in executable", Rosetta is missing
arch -x86_64 /bin/echo "Rosetta works!"

# ALTERNATIVE: check for the daemon
# EXPECTED: "oahd" process ID or non-empty output
pgrep -l oahd

# FALLBACK: check for Rosetta runtime files
# EXPECTED: directory listing with oahd, runtime, translate_tool
ls /usr/libexec/rosetta/
```

### Check 4: Are there quarantine xattrs on data files?

```sh
# EXPECTED: 0 — any non-zero count means quarantine is blocking library loads
find /Users/$USER/<your-app-data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l
```

### Check 5: Does the backend binary actually run?

```sh
# EXPECTED: process runs for >1 second before exit
# FAILURE SIGNS: "Bad CPU type" → Rosetta issue
#                "Library not loaded ... library load disallowed" → quarantine/signing issue
arch -x86_64 /Users/$USER/<your-app-data-dir>/server.bin &
SRV_PID=$!
sleep 3
kill -0 $SRV_PID 2>/dev/null && echo "RUNNING" && kill $SRV_PID || echo "CRASHED"
wait $SRV_PID 2>/dev/null
```

---

## Decision Tree

```
uname -m = "arm64" ?
├── NO  → STOP: Not Apple Silicon, this doc does not apply
└── YES → Check server.bin architecture
           ├── arm64  → STOP: Fully native, problem is elsewhere
           └── x86_64 → Check Rosetta
                          ├── WORKING  → Check quarantine xattr count
                          │               ├── 0      → Check if server.bin runs
                          │               │            ├── RUNNING  → STOP: Problem is NOT architecture/quarantine/signing
                          │               │            └── CRASHED  → GOTO: Root Cause A (code signatures)
                          │               └── >0      → GOTO: Root Cause B (quarantine)
                          └── BROKEN   → GOTO: Root Cause C (Rosetta not installed)
```

---

## Root Causes

### Root Cause A — Ad-hoc Code Signatures Blocking AMFI

**Symptom:** `server.bin` exits immediately with:
```
dyld[PID]: Library not loaded: @executable_path/libpython3.10.dylib
  Referenced from: .../server.bin
  Reason: ... 'code signature in <HASH> ...' not valid for use in process:
          library load disallowed by system policy
```

**Why it happens:** PyInstaller-bundled apps ad-hoc-sign every `.dylib` and `.so` file. When quarantine is removed from the `.app` bundle (or was never properly established), the transitive trust chain breaks. AMFI (Apple Mobile File Integrity) then refuses to load the libraries even though they're part of the same app.

**Diagnose (verify this is the cause):**

```sh
# Step 1: Run the binary and capture stderr
arch -x86_64 /Users/$USER/<your-app-data-dir>/server.bin 2>/tmp/diag_err.log &
sleep 2; kill %1 2>/dev/null; wait 2>/dev/null

# Step 2: Check for the signature error
# EXPECTED MATCH: "library load disallowed by system policy"
grep "library load disallowed" /tmp/diag_err.log && echo "CONFIRMED: Root Cause A"
```

**Fix:**

```sh
# IMPORTANT: Must do quarantine removal FIRST (Root Cause B) before stripping signatures,
#            or you may need to re-strip after quarantine removal.

# Step 1: Remove code signatures from ALL bundled binaries
for f in /Users/$USER/<your-app-data-dir>/*.dylib /Users/$USER/<your-app-data-dir>/*.so; do
  codesign --remove-signature "$f" 2>/dev/null
done

# Step 2: Also remove from the main binary
codesign --remove-signature /Users/$USER/<your-app-data-dir>/server.bin

# Step 3: Recurse into subdirectories for nested packages (onnxruntime, cv2, numpy, etc.)
for dir in /Users/$USER/<your-app-data-dir>/*/; do
  find "$dir" -name "*.so" -o -name "*.dylib" 2>/dev/null | while read f; do
    codesign --remove-signature "$f" 2>/dev/null
  done
done
```

**Verify:**

```sh
# Step 1: Confirm signatures are stripped
# EXPECTED: "code object is not signed at all"
codesign -dv /Users/$USER/<your-app-data-dir>/libpython3.10.dylib 2>&1

# Step 2: Confirm the binary now runs
arch -x86_64 /Users/$USER/<your-app-data-dir>/server.bin 2>/tmp/diag_err.log &
sleep 5
grep "library load disallowed" /tmp/diag_err.log && echo "STILL BROKEN" || echo "FIXED"
kill %1 2>/dev/null; wait 2>/dev/null
```

---

### Root Cause B — Quarantine Xattr on Data Files

**Symptom:** Same `library load disallowed` error as Root Cause A, OR `server.bin` never starts from the GUI app. May also manifest as the app hanging indefinitely on first launch.

**Why it happens:** When a `.dmg` is extracted, macOS applies `com.apple.quarantine` to EVERY extracted file, not just the `.app` bundle. The app's data directory can have hundreds of files individually flagged. Each flagged `.dylib` and `.so` is rejected by AMFI regardless of code signature validity.

**Diagnose (verify this is the cause):**

```sh
# Count quarantined files in the data directory
# EXPECTED: >0 (0 means quarantine is not the issue, look elsewhere)
find /Users/$USER/<your-app-data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l

# Check a specific file's quarantine status
# EXPECTED: output includes "com.apple.quarantine" with a hex timestamp
xattr -l /Users/$USER/<your-app-data-dir>/libpython3.10.dylib | grep quarantine
```

**Fix:**

```sh
# Remove quarantine from the entire data directory recursively
xattr -dr com.apple.quarantine /Users/$USER/<your-app-data-dir>

# Also remove from the .app bundle itself (belt-and-suspenders)
xattr -dr com.apple.quarantine /Applications/<your-app>.app
```

**Verify:**

```sh
# EXPECTED: 0
find /Users/$USER/<your-app-data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l
```

---

### Root Cause C — Rosetta 2 Not Installed

**Symptom:** Any attempt to run x86_64 binaries fails with:
```
Bad CPU type in executable
```
`server.bin` never spawns. GUI app process exists but backend never appears.

**Why it happens:** Apple Silicon Macs do not ship with Rosetta 2 enabled by default. The Rosetta runtime files exist at `/usr/libexec/rosetta/` (shipped with macOS) but must be formally "installed" — which registers the kernel's translation mechanism. Without this, `posix_spawnp` and `execve` reject x86_64 binaries at the kernel level.

**Diagnose (verify this is the cause):**

```sh
# EXPECTED: "Bad CPU type in executable" if Rosetta is NOT installed
# EXPECTED: "Rosetta works!" if it IS installed
arch -x86_64 /bin/echo "Rosetta works!" 2>&1

# The daemon (oahd) may not be running even if Rosetta is installed.
# It is demand-launched by the kernel when the first x86_64 process spawns.
# Check the process list AFTER attempting to run an x86_64 binary:
# EXPECTED: non-empty output if Rosetta is installed and functioning
pgrep -l oahd
```

**Fix:**

```sh
# Install Rosetta 2 (requires license agreement acceptance)
# NOTE: This command may prompt for password on some macOS versions.
#       If it hangs at "Type A and press return to agree:", pipe "A\n".
echo "A" | softwareupdate --install-rosetta 2>&1

# Expected output on success:
#   "Install of Rosetta 2 finished successfully"
```

**Verify:**

```sh
# Test 1: Basic Rosetta functionality
# EXPECTED: "Rosetta works!"
arch -x86_64 /bin/echo "Rosetta works!"

# Test 2: The daemon starts on demand
# Run ANY x86_64 binary to trigger oahd launch
arch -x86_64 /bin/true
# EXPECTED: shows oahd PID
pgrep -l oahd
```

---

## Execution Order (Critical!)

**The order matters.** Applying fixes out of order can cause re-blocking:

```
1. Root Cause C (Rosetta install)    ← MUST be first: nothing runs without it
2. Root Cause B (quarantine removal) ← MUST be before signature stripping
3. Root Cause A (signature removal)  ← MUST be last: quarantine re-applies ad-hoc sigs
4. Warm-cache run                    ← Trigger AOT translation of all binaries
```

### Warm-Cache Run

After all fixes, run the backend for ~60 seconds to force Rosetta to translate and cache all binaries:

```sh
echo "=== Pre-warming Rosetta AOT translation cache ==="
echo "This may take 60-90 seconds on first run after fixes."

START=$(date +%s)
arch -x86_64 /Users/$USER/<your-app-data-dir>/server.bin 1>/tmp/warm.log 2>/tmp/warm_err.log &
SRV_PID=$!

# Wait for the server to indicate readiness (or 120s timeout)
for i in {1..120}; do
  if grep -q "Listening on" /tmp/warm_err.log 2>/dev/null; then
    ELAPSED=$(($(date +%s) - $START))
    echo "Backend ready after ${ELAPSED}s — Rosetta cache populated."
    break
  fi
  if ! kill -0 $SRV_PID 2>/dev/null; then
    echo "Backend crashed during warm-up — check /tmp/warm_err.log"
    tail -20 /tmp/warm_err.log
    exit 1
  fi
  sleep 1
done

kill $SRV_PID 2>/dev/null
wait $SRV_PID 2>/dev/null

TOTAL=$(($(date +%s) - $START))
echo "Warm-cache complete in ${TOTAL}s"
```

---

## Additional Findings

### Network & Security

- Processing is entirely local — all ONNX models (~795 MB) are stored at `/Users/$USER/<your-app-data-dir>/models/`. No network calls during inference.
- Model download capability exists — `urllib.request.urlopen` and a `download_and_unzip` function are bundled. This would only trigger if models were absent.
- No telemetry/analytics — No update check, crash reporter, or analytics SDKs found in either the Tauri GUI or the Python backend.
- CSP is restrictive — `default-src 'self' asset:` with `connect-src: http://localhost:8023` only.
- **WARNING: `0.0.0.0` bind** — The Bottle WSGI server binds to `0.0.0.0:8023`, not `127.0.0.1:8023`. Other devices on the LAN can reach the API. No authentication is implemented.

### App Architecture

```
<your-app>.app/
├── Contents/MacOS/<your-app>    [Tauri 2 / Rust / WKWebView — universal arm64+x86_64]
│   └── spawns → server.bin via tauri-plugin-shell
│
/Users/$USER/<your-app-data-dir>/        [Python 3.10 backend — x86_64 only]
├── server.bin                            [34 MB PyInstaller bundle]
├── *.dylib                               [FFmpeg+SciPy+Python dylibs]
├── *.so                                  [Python C extensions: numpy, cv2, onnx, etc.]
├── models/                               [ONNX models]
├── onnxruntime/                          [ONNX Runtime C API]
├── numpy/
├── cv2/
└── ...
```

### Stats (Representative)

| Metric | Count |
|---|---|
| Total data directory size | ~1.0 GB |
| Binaries needing translation | 121 (1 bin + 72 dylibs + 48 so) |
| Files with quarantine (before fix) | up to 163 |
| Files with ad-hoc signatures (before fix) | up to 141 |
| Largest single binary | `libscipy_openblas64_.dylib` (65 MB) |
| Translation cache warm-up time | ~60-90 seconds |

---

## Reusable Patterns (Generalizable Heuristics)

### Pattern 1 — PyInstaller on Apple Silicon

> Any app that uses PyInstaller to bundle a Python backend on macOS will have:
> 1. A `server.bin` (or similar) that may be x86_64 only
> 2. Ad-hoc code signatures on every `.so` and `.dylib`
> 3. Individual quarantine flags on extracted data files
>
> **Always check all three.**

### Pattern 2 — Quarantine Beyond .app Bundles

> `xattr -dr com.apple.quarantine` on the `.app` is NOT sufficient.
> Check the **data directory** separately. DMG extraction quarantines every
> file individually, not just the bundle. This is the most commonly missed
> issue and the hardest to diagnose because the error message looks like
> a code signing problem.

### Pattern 3 — Ad-hoc Signatures + Quarantine = Toxic Combo

> Removing quarantine first, then removing signatures, is the correct order.
>
> If you strip signatures first, then remove quarantine, the system may
> re-apply ad-hoc signatures during the quarantine removal, silently
> re-breaking the app. Always:
> ```
> quarantine removal → signature removal → verify → warm-cache
> ```

### Pattern 4 — Rosetta Check on Every New macOS Install

> `arch -x86_64 /bin/echo test` is the authoritative test.
> Do NOT trust the presence of `/usr/libexec/rosetta/` files — they ship
> with macOS but may not be registered with the kernel.
> `softwareupdate --install-rosetta` is the only reliable fix.

---

## Quick Reference (Commands Only)

```sh
# ── TRIAGE ──
uname -m
file /Applications/<your-app>.app/Contents/MacOS/<your-app>
file /Users/$USER/<your-app-data-dir>/server.bin
arch -x86_64 /bin/echo "Rosetta works!"
find /Users/$USER/<your-app-data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l

# ── FIX C: Install Rosetta ──
echo "A" | softwareupdate --install-rosetta

# ── FIX B: Remove quarantine ──
xattr -dr com.apple.quarantine /Users/$USER/<your-app-data-dir>
xattr -dr com.apple.quarantine /Applications/<your-app>.app

# ── FIX A: Remove ad-hoc signatures ──
for f in /Users/$USER/<your-app-data-dir>/*.dylib /Users/$USER/<your-app-data-dir>/*.so; do
  codesign --remove-signature "$f" 2>/dev/null
done
codesign --remove-signature /Users/$USER/<your-app-data-dir>/server.bin

# ── VERIFY ──
codesign -dv /Users/$USER/<your-app-data-dir>/libpython3.10.dylib
arch -x86_64 /Users/$USER/<your-app-data-dir>/server.bin &
sleep 3; kill %1 2>/dev/null; wait 2>/dev/null
```

---

## Pitfalls Encountered

1. **`softwareupdate --install-rosetta` hung waiting for input** — The prompt "Type A and press return to agree:" is not visible when piping. Solution: `echo "A" | softwareupdate --install-rosetta`.

2. **`arch -x86_64` from within an existing process context failed** even though the GUI could spawn x86_64 binaries. This was because Rosetta wasn't installed at the kernel level. GUI apps trigger automatic Rosetta installation; CLI commands don't.

3. **`codesign --remove-signature` returned "signed []"** on already-stripped files. This is normal; the command is idempotent and safe to run on already-unsigned files.

4. **The server binary failed immediately after quarantine removal** but before signature stripping. The quarantine removal changed the trust evaluation, causing the existing ad-hoc signatures to be re-validated and rejected. Signature stripping must follow quarantine removal.

5. **`pgrep -l oahd` returned empty** even after Rosetta install. `oahd` is demand-launched by the kernel, not a persistent daemon. It starts when the first x86_64 process is spawned and stops after idle timeout. Use `pgrep -l oahd` immediately after running an x86_64 binary to see it.
