---
type: Troubleshooting
title: macOS App Launch Issues on Apple Silicon
description: Diagnose and fix slow or broken app launches caused by Rosetta, quarantine xattr, and ad-hoc code signing on Apple Silicon Macs.
tags: [macos, apple-silicon, rosetta, quarantine, code-signing, amfi, pyinstaller, mixed-architecture, gatekeeper]
timestamp: 2026-07-29T00:00:00Z
---

# Overview

Apps built with mixed architectures (universal binaries + x86_64-only backends), PyInstaller
bundles, or distributed via DMG often fail to launch or take minutes on first run. Three root
causes interact: Rosetta absence, quarantine xattr on every extracted file, and ad-hoc code
signatures triggering AMFI rejection. This guide covers diagnosis, fix ordering, and platform
facts every macOS developer needs.

# Triage Checklist

Run these 5 checks in order. If all pass, the problem is elsewhere.

| Step | Command | Expected |
|---|---|---|
| 1. Apple Silicon? | `uname -m` | `arm64` |
| 2. Mixed architecture? | `file <binary>` | Look for `x86_64` portion on arm64 |
| 3. Rosetta working? | `arch -x86_64 /bin/echo "Rosetta works!"` | `Rosetta works!` |
| 4. Quarantine count? | `find <data-dir> -xattrname com.apple.quarantine \| wc -l` | `0` |
| 5. Binary actually runs? | `arch -x86_64 <binary> &` | Runs >1 second |

# Decision Tree

```
uname -m = "arm64" ?
├── NO  → STOP: Not Apple Silicon
└── YES → Check backend binary architecture
           ├── arm64  → STOP: Fully native
           └── x86_64 → Check Rosetta
                          ├── WORKING  → Check quarantine count
                          │               ├── 0      → Check if binary runs
                          │               │            ├── RUNNING  → STOP: Problem elsewhere
                          │               │            └── CRASHED  → GOTO: Root Cause A
                          │               └── >0      → GOTO: Root Cause B
                          └── BROKEN   → GOTO: Root Cause C
```

# Root Cause A — Ad-hoc Code Signatures Blocking AMFI

**Symptom:** Binary exits immediately with `library load disallowed by system policy`.

**Why:** PyInstaller ad-hoc-signs every `.dylib` and `.so`. When the quarantine trust chain
breaks (e.g. quarantine was never properly established), AMFI refuses to load libraries
even within the same app.

**Diagnose:**
```sh
arch -x86_64 <binary> 2>/tmp/diag.log &
sleep 2; kill %1 2>/dev/null
grep "library load disallowed" /tmp/diag.log && echo "CONFIRMED: Root Cause A"
```

**Fix:**
```sh
# Remove signatures from ALL bundled binaries (must do AFTER quarantine removal)
for f in <data-dir>/*.dylib <data-dir>/*.so; do
  codesign --remove-signature "$f" 2>/dev/null
done
codesign --remove-signature <data-dir>/server.bin

# Recurse into subdirectories for nested packages
for dir in <data-dir>/*/; do
  find "$dir" -name "*.so" -o -name "*.dylib" | while read f; do
    codesign --remove-signature "$f" 2>/dev/null
  done
done
```

# Root Cause B — Quarantine Xattr on Data Files

**Symptom:** Same `library load disallowed` error as Root Cause A, OR app hangs on first launch.

**Why:** DMG extraction applies `com.apple.quarantine` to EVERY file, not just the `.app`
bundle. Each flagged `.dylib`/`.so` is rejected by AMFI regardless of signature validity.
**This produces the same error message as Root Cause A** — the only way to distinguish
is checking the quarantine count.

**Diagnose:**
```sh
find <data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l
# Any non-zero count confirms quarantine is blocking
```

**Fix:**
```sh
xattr -dr com.apple.quarantine <data-dir>
xattr -dr com.apple.quarantine <app-bundle>
```

# Root Cause C — Rosetta 2 Not Installed

**Symptom:** `Bad CPU type in executable` on any x86_64 binary. Backend never spawns.

**Why:** `/usr/libexec/rosetta/` files ship with macOS but the kernel translation mechanism
must be formally registered. Without `softwareupdate --install-rosetta`, the kernel rejects
x86_64 binaries at the `posix_spawnp`/`execve` level.

**Diagnose:**
```sh
arch -x86_64 /bin/echo "Rosetta works!" 2>&1
# "Rosetta works!" = installed
# "Bad CPU type in executable" = NOT installed
```

**Fix:**
```sh
echo "A" | softwareupdate --install-rosetta
```

# Fix Execution Order (Critical)

The order is non-negotiable. Applying fixes out of order causes re-blocking:

```
1. Install Rosetta        ← nothing runs without it
2. Remove quarantine      ← MUST come before signature stripping
3. Remove ad-hoc sigs     ← quarantine removal can re-apply sigs
4. Warm-cache run         ← force AOT translation of all binaries
```

**Why order matters:** If you strip signatures first, then remove quarantine, the system may
silently re-apply ad-hoc signatures during quarantine removal, re-breaking the app.

## Warm-Cache Run

After all fixes, force 60-90 seconds of runtime to pre-populate the Rosetta AOT cache:

```sh
arch -x86_64 <binary> & SRV_PID=$!
for i in {1..120}; do
  kill -0 $SRV_PID 2>/dev/null || break
  sleep 1
done
kill $SRV_PID 2>/dev/null; wait 2>/dev/null
```

# Platform Facts: Rosetta 2

| Fact | Detail |
|---|---|
| Rosetta is NOT installed by default | `/usr/libexec/rosetta/` files exist but kernel mechanism is unregistered |
| Only authoritative check | `arch -x86_64 /bin/echo test` — do NOT trust filesystem presence |
| `oahd` is demand-launched | Starts on first x86_64 spawn, stops after idle. `pgrep oahd` empty after install is NORMAL |
| GUI apps auto-trigger install | Finder launches trigger automatic Rosetta install; CLI (`arch -x86_64`) does NOT |
| `softwareupdate --install-rosetta` hangs | License prompt requires `echo "A" \|` piping for automation |

# Reusable Patterns

1. **PyInstaller on Apple Silicon** — Always check: architecture (`file <binary>`), quarantine count (`find -xattrname`), code signatures (`codesign -dv`). All three.

2. **Quarantine Beyond .app Bundles** — `xattr -dr` on `.app` alone is insufficient. Check the data directory separately. Error messages look identical to code signing problems.

3. **Fix Order: quarantine → signatures → warm-cache** — Stripping signatures first causes silent re-application during quarantine removal.

4. **Rosetta Check on Every macOS Install** — `arch -x86_64 /bin/echo test` is the only reliable check. Filesystem presence does not equal kernel registration.

# Pitfalls

1. `softwareupdate --install-rosetta` hangs — invisible license prompt. Use `echo "A" |`.
2. CLI `arch -x86_64` fails but GUI works — GUI triggers auto-install, CLI doesn't.
3. `codesign --remove-signature` says `signed []` on stripped files — idempotent, not an error.
4. Binary fails after quarantine removal but before signature strip — order error. Re-do.
5. `pgrep oahd` empty after install — `oahd` is demand-launched, not persistent. Normal.

# Quick Reference

```sh
# ── TRIAGE ──
uname -m
file <app-binary>; file <data-dir>/server.bin
arch -x86_64 /bin/echo "Rosetta works!"
find <data-dir> -xattrname com.apple.quarantine 2>/dev/null | wc -l

# ── FIX (in this order) ──
echo "A" | softwareupdate --install-rosetta
xattr -dr com.apple.quarantine <data-dir>
xattr -dr com.apple.quarantine <app-bundle>
for f in <data-dir>/*.dylib <data-dir>/*.so; do codesign --remove-signature "$f" 2>/dev/null; done
codesign --remove-signature <data-dir>/server.bin
```

# Citations

[1] Source: [../../../raw/2026-07-25/macos-app-launch-diagnosis.md](../../../raw/2026-07-25/macos-app-launch-diagnosis.md)
[2] [Apple: Rosetta 2](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment)
[3] [Apple: Code Signing Guide](https://developer.apple.com/documentation/security/hardened_runtime)
[4] [Apple: Gatekeeper and Quarantine](https://developer.apple.com/documentation/security/apple-gatekeeper-and-quarantine)
