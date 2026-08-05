# Project Memory

Accumulated knowledge from years of maintaining this developer environment guide.
Entries are tagged, confidence-scored, and linked to source evidence.

---

```yaml
---
type: gotcha
title: Homebrew path differs on Apple Silicon vs Intel
confidence: 0.95
tags: [macos, homebrew, apple-silicon, intel, arm64]
source: manual
last_verified: 2026-07-24
times_referenced: 0
---
On Apple Silicon Macs, Homebrew installs to `/opt/homebrew`. On Intel Macs,
it uses `/usr/local`. Any script or PATH configuration must check the
architecture before using either path. Apple Silicon users need to add
`eval "$(/opt/homebrew/bin/brew shellenv)"` to their shell profile.
```

```yaml
---
type: gotcha
title: macOS uses system Python by default even after brew install
confidence: 0.90
tags: [macos, python, homebrew, path]
source: git:0c1ed21
last_verified: 2026-07-24
times_referenced: 0
---
Installing Python via `brew install python` does not override the system
Python on macOS. The system `/usr/bin/python` takes precedence in PATH.
Users must ensure `/usr/local/bin` (Intel) or `/opt/homebrew/bin` (Apple
Silicon) comes before `/usr/bin` in their shell profile, or use virtualenv
to isolate the brew-installed Python.
```

```yaml
---
type: gotcha
title: Git Bash on Windows forgets command history
confidence: 0.85
tags: [windows, git, bash, terminal]
source: terminal/git/README.md
last_verified: 2026-07-24
times_referenced: 0
---
On Windows, Git Bash does not persist command history between sessions.
Workaround: add `PROMPT_COMMAND='history -a'` to `~/.bash_profile`:
```bash
touch ~/.bash_profile
echo "PROMPT_COMMAND='history -a'" >> ~/.bash_profile
```
```

```yaml
---
type: gotcha
title: Ubuntu graphics driver issues on certain hardware
confidence: 0.70
tags: [ubuntu, graphics, nvidia, hardware]
source: git:b4f8ad4
last_verified: 2026-07-24
times_referenced: 0
---
Some Ubuntu installations encounter graphics card issues, particularly
with NVIDIA hardware. The setup guide should include steps for checking
and installing proprietary drivers when necessary. This area needs
expansion based on more recent Ubuntu versions.
```

```yaml
---
type: decision
title: Cross-platform documentation is organized by tool/domain rather than by OS
confidence: 1.0
tags: [architecture, organization, cross-platform]
source: manual
last_verified: 2026-07-24
times_referenced: 0
---
The repository organizes guides by technology domain (language/, terminal/,
database/) rather than by operating system. Within each domain directory,
README files cover all supported OSes with platform-specific sections.
The os/ directory holds only setup scripts, not documentation. This
decision was made early and has been consistent across 1,184 commits.
```

```yaml
---
type: fact
title: Homebrew install command has evolved over time
confidence: 1.0
tags: [homebrew, macos, setup, maintenance]
source: terminal/package-manager/homebrew/README.md
last_verified: 2026-07-24
times_referenced: 0
---
The raw homebrew README documents the old install command using
`/usr/bin/ruby -e ...` which referenced the now-deprecated `master`
branch. The current official install command uses bash instead of ruby
and the `HEAD` branch. When ingesting setup guides, always verify
Homebrew install commands match the current documentation at brew.sh.
```

```yaml
---
type: gotcha
title: Rosetta 2 is not installed by default on Apple Silicon
confidence: 1.0
tags: [macos, apple-silicon, rosetta, diagnostics]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
`/usr/libexec/rosetta/` files ship with macOS but the kernel translation
mechanism must be formally installed via `softwareupdate --install-rosetta`.
Without this, x86_64 binaries fail with "Bad CPU type in executable".
GUI apps trigger automatic Rosetta install; CLI commands do not.
```

```yaml
---
type: gotcha
title: "arch -x86_64 /bin/echo test" is the ONLY authoritative Rosetta check
confidence: 1.0
tags: [macos, apple-silicon, rosetta, diagnostics]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
File system checks for `/usr/libexec/rosetta/` are misleading — those files
ship with macOS even without Rosetta installed. Only `arch -x86_64 /bin/echo test`
verifies kernel-level Rosetta registration. Do not trust filesystem presence.
```

```yaml
---
type: fact
title: oahd is demand-launched, not a persistent daemon
confidence: 1.0
tags: [macos, apple-silicon, rosetta, oahd]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
`pgrep -l oahd` returns empty after Rosetta install — this is NORMAL.
`oahd` starts when the first x86_64 process spawns and stops after an
idle timeout. Run `pgrep -l oahd` immediately after running any x86_64
binary to see it. Do not panic when the daemon is absent after install.
```

```yaml
---
type: gotcha
title: GUI apps auto-trigger Rosetta install; CLI commands do not
confidence: 1.0
tags: [macos, apple-silicon, rosetta, gui, cli]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
When Finder launches an x86_64 app, macOS automatically triggers Rosetta
installation. CLI commands (`arch -x86_64`, `posix_spawnp`) fail silently
with "Bad CPU type" if Rosetta is not installed. Never trust "it works
from the GUI" as proof that Rosetta is installed system-wide.
```

```yaml
---
type: gotcha
title: "softwareupdate --install-rosetta hangs without piped input"
confidence: 1.0
tags: [macos, apple-silicon, rosetta, automation]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
The Rosetta license prompt ("Type A and press return to agree:") is
invisible when piping. In scripts and automation, always use:
`echo "A" | softwareupdate --install-rosetta`
```

```yaml
---
type: gotcha
title: DMG extraction quarantines files BEYOND the .app bundle
confidence: 1.0
tags: [macos, quarantine, dmg, xattr, gatekeeper]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
`xattr -dr com.apple.quarantine` on the .app is NOT sufficient. DMG
extraction quarantines EVERY extracted file individually, including data
directories. This is the most commonly missed issue because the error
message ("library load disallowed by system policy") looks identical to
a code signing problem. Always check data directories separately:
`find <data-dir> -xattrname com.apple.quarantine | wc -l`
```

```yaml
---
type: gotcha
title: Quarantine and code signing errors produce IDENTICAL error messages
confidence: 1.0
tags: [macos, quarantine, code-signing, amfi, diagnostics]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
"library load disallowed by system policy" can be caused by quarantine
xattr OR ad-hoc code signatures. The only way to distinguish them is to
check the quarantine count: `find <data-dir> -xattrname com.apple.quarantine | wc -l`.
If the count is >0, fix quarantine first before touching signatures.
```

```yaml
---
type: decision
title: Fix order is non-negotiable — Rosetta → quarantine → signatures → warm-cache
confidence: 1.0
tags: [macos, debugging, ordering, quarantine, code-signing, rosetta]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
The correct fix order for Apple Silicon app launch issues:
1. Install Rosetta (nothing runs without it)
2. Remove quarantine xattr
3. Remove ad-hoc code signatures
4. Run a warm-cache loop for 60-90 seconds

Any other order causes re-blocking. If you strip signatures first, then
remove quarantine, the system silently re-applies ad-hoc signatures,
re-breaking the app. Quarantine removal must always precede signature
removal.
```

```yaml
---
type: gotcha
title: Debian/Ubuntu renames some CLI tool binaries
confidence: 1.0
tags: [ubuntu, debian, apt, package-management, cli-tools]
source: raw/2026-07-30/dev-velocity-lessons.md
last_verified: 2026-07-30
times_referenced: 0
---
bat installs as `batcat` (conflicts with bacula-console), fd-find installs
as `fdfind` (conflicts with another `fd`), and the `tldr` command comes from
the `tealdeer` package (not `tldr`). Always add fallback aliases:
`alias bat='batcat'`, `alias fd='fdfind'`. Do not trust that the package
name matches the binary name.
```

```yaml
---
type: gotcha
title: Sudo requires a TTY; cannot run from automated tools
confidence: 0.95
tags: [ubuntu, sudo, automation, apt]
source: raw/2026-07-30/dev-velocity-lessons.md
last_verified: 2026-07-30
times_referenced: 0
---
Password-protected sudo commands (like `sudo apt install`) fail with
"A terminal is required to authenticate" when run from automated tools
or scripts. Automated workflows must either: split the command so the
user runs sudo manually, use passwordless sudo, or detect the environment
and skip sudo steps.
```

```yaml
---
type: pattern
title: Always verify binary presence after package installation
confidence: 1.0
tags: [ubuntu, verification, debugging, apt, package-management]
source: raw/2026-07-30/dev-velocity-lessons.md
last_verified: 2026-07-30
times_referenced: 0
---
After installing packages, verify each binary is actually available with
`which <binary> && <binary> --version`. Do not trust that `apt install`
succeeded for every package just because the command didn't error —
package names can differ from binary names (e.g., `tldr` vs `tealdeer`),
and individual packages can fail silently within a batch install.
```

```yaml
---
type: pattern
title: Separate bash config into .bash_aliases and .bash_functions
confidence: 0.95
tags: [bash, shell, configuration, dotfiles, organization]
source: raw/2026-07-30/dev-velocity-lessons.md
last_verified: 2026-07-30
times_referenced: 0
---
Keep aliases in `~/.bash_aliases` and functions in `~/.bash_functions`.
Source both from `~/.bashrc` with conditional guards (`[ -f file ] && . file`).
Benefits: each file can be version-controlled independently; disabling
or debugging a category only requires renaming one file; `.bash_aliases`
is natively supported by bash. This pattern is portable across distros.
```

```yaml
---
type: pattern
title: Conditional loading protects against missing tools in shell config
confidence: 1.0
tags: [bash, shell, dotfiles, portability, defensive-configuration]
source: raw/2026-07-30/dev-velocity-lessons.md
last_verified: 2026-07-30
times_referenced: 0
---
Wrap tool-dependent aliases and functions in `if command -v <tool>` guards:
```bash
if command -v eza &> /dev/null; then
  alias ll='eza -l'
else
  alias ll='ls -l'
fi
```
This ensures shell config works even before tools are installed, making
dotfiles portable across machines and resilient to partial setups.
```

```yaml
---
type: pattern
title: PyInstaller apps need all three checks on Apple Silicon
confidence: 1.0
tags: [macos, pyinstaller, apple-silicon, mixed-architecture, diagnostics]
source: raw/2026-07-25/macos-app-launch-diagnosis.md
last_verified: 2026-07-29
times_referenced: 0
---
Any PyInstaller-bundled Python app on Apple Silicon should be triaged for:
1. Mixed architecture — `file <binary>` showing x86_64 portion on arm64
2. Quarantine xattr count — DMG source means every .so/.dylib may be flagged
3. Ad-hoc code signatures — `codesign -dv` showing adhoc on bundled libs

All three must pass for the app to launch without Rosetta delays or AMFI
blocking. The triage order matters: architecture → quarantine → signatures.
```

```yaml
---
type: gotcha
title: GUI proxy running does not mean CLI tools can reach the internet
confidence: 1.0
tags: [proxy, network, cli, environment-variables, curl, git]
source: raw/2026-08-04/proxy-debug-lessons.md
last_verified: 2026-08-04
times_referenced: 0
---
CLI tools never auto-detect a running proxy daemon. A proxy client can work
fine in the GUI while `curl`, `wget`, and `git` all time out (curl returns
`000`) because `HTTP_PROXY` / `HTTPS_PROXY` / `ALL_PROXY` are unset. Always
check `env | grep -i proxy` before assuming the proxy is broken.
```

```yaml
---
type: gotcha
title: SOCKS5 inbound port is not an HTTP proxy port
confidence: 1.0
tags: [proxy, network, socks5, http, ports]
source: raw/2026-08-04/proxy-debug-lessons.md
last_verified: 2026-08-04
times_referenced: 0
---
A proxy client's default inbound is often SOCKS5 (e.g., 10808), not HTTP.
Tools that only support HTTP proxies need `socks5://` URL syntax or a separate
HTTP inbound (e.g., 10809). Don't assume the HTTP port exists, and don't
hardcode ports without checking the client's inbound configuration.
```

```yaml
---
type: gotcha
title: Interactive-shell guard in .bashrc skips proxy exports in scripts and CI
confidence: 0.95
tags: [bash, bashrc, proxy, non-interactive-shell, environment]
source: raw/2026-08-04/proxy-debug-lessons.md
last_verified: 2026-08-04
times_referenced: 0
---
Many `.bashrc` files start with `case $- in *i*) ;; *) return;; esac`, which
exits the file immediately in non-interactive shells. Proxy exports placed in
`.bashrc` therefore never reach scripts, cron, or CI. Put them in `~/.profile`
or `/etc/environment` for non-interactive coverage, or prefix each command.
```

```yaml
---
type: gotcha
title: SDP attention materializes the full attention matrix on CPU
confidence: 1.0
tags: [ai, stable-diffusion, webui, attention, oom, vae, cpu, memory]
source: raw/2026-08-03/sdp-attention-oom-fix.md
last_verified: 2026-08-03
times_referenced: 0
---
`torch.backends.cuda.sdp_kernel` is CUDA-only — it has no effect on CPU. Under
`--opt-sdp-no-mem-attention`, high-resolution VAE encoding materializes the full
quadratic attention matrix (4096×3072 → 196K tokens → ~154 GB in float32) and
crashes with `Cannot allocate memory`. Fix: estimate `tokens²` memory before
SDP and fall back to chunked sub-quadratic attention when it exceeds ~50% of
available RAM.
```

```yaml
---
type: pattern
title: Resize input images before img2img for CPU speedup
confidence: 1.0
tags: [ai, stable-diffusion, webui, cpu, performance, img2img]
source: raw/2026-08-03/sd-webui-cpu-learning-roadmap.md
last_verified: 2026-08-03
times_referenced: 0
---
The VAE operates at 1/8 resolution, so a 4096×3072 source is 196K attention
tokens while 1024× is only 12K tokens. Downscaling inputs before img2img is the
single biggest CPU speedup (3–10×): resize input first, then upscale the output
via the Extras tab. Complement with tiled VAE encoding.
```

```yaml
---
type: decision
title: Migrate to the most complete maintained extension, not the newest
confidence: 0.9
tags: [ai, stable-diffusion, webui, extension, migration, maintenance]
source: raw/2026-08-03/roop-to-reactor-migration.md
last_verified: 2026-08-03
times_referenced: 0
---
When a WebUI extension is archived, evaluate the successor landscape on
archived status, last push, stars, forks, and open issues — then choose the most
complete, tested, compatible candidate, not the most recently pushed. A dormant
feature-complete extension can beat a new buggy one. Migrate with: backup shared
model, remove old extension, pin dependency versions, move model to the new
path, verify with an import check, and keep a documented rollback.
```

```yaml
---
type: pattern
title: Organize shell aliases in Oh My Zsh custom directory for auto-sourcing
confidence: 1.0
tags: [zsh, oh-my-zsh, shell, configuration, aliases]
source: raw/2026-07-24/terminal-aliases.md
last_verified: 2026-07-29
times_referenced: 0
---
Place aliases in `~/.oh-my-zsh/custom/aliases.zsh` rather than directly in
`~/.zshrc`. Oh My Zsh auto-sources every file in the `custom/` directory,
keeping config organized by category (aliases.zsh, functions.zsh, exports.zsh).
Changes take effect with `source ~/.zshrc` (alias: `reload`) or a new terminal.
```

```yaml
---
type: gotcha
title: torch.einsum silently falls back to CPU on MPS with NO warning
confidence: 1.0
tags: [ai, stable-diffusion, macos, apple-silicon, mps, torch, attention]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
torch.einsum on MPS silently moves data MPS→CPU→MPS for every call with no
warning or error. For attention layers called hundreds of times per step,
this causes 1000x+ slowdown. Avoid all attention optimizers that use einsum
internally: V1, Doggettx, InvokeAI. Let the WebUI auto-select sub-quadratic
(priority 1000 on MPS) or use SDP variants.
```

```yaml
---
type: pattern
title: Git single-letter alias convention for terminal speed
confidence: 0.95
tags: [git, zsh, shell, productivity, aliases]
source: raw/2026-07-24/terminal-aliases.md
last_verified: 2026-07-29
times_referenced: 0
---
Single-letter git aliases reduce typing friction for common operations:
`g`=git, `gs`=status, `ga`=add, `gap`=add -p, `gd`=diff, `gl`=pull,
`gundo`=reset --soft HEAD~1, `gclean`=delete merged branches.
Combine commands in functions: `gfs() { git fetch && git status; }`.
This pattern is universal across repos and machines.
```

```yaml
---
type: gotcha
title: Stale VIRTUAL_ENV env var breaks venv detection in webui.sh
confidence: 1.0
tags: [ai, stable-diffusion, macos, venv, python, environment-variables]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
When VIRTUAL_ENV is already set (e.g., from a stale .venv activation after
renaming the dir), webui.sh skips venv detection entirely. It does NOT update
python_cmd and falls back to system Python which cannot pip install (PEP 668).
Fix: always run with VIRTUAL_ENV= ./webui.sh to ensure the env var is unset.
```

```yaml
---
type: gotcha
title: uv venv has no pip module — python -m pip always crashes
confidence: 1.0
tags: [ai, python, uv, venv, pip, packaging]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
uv-created venvs do NOT include pip. Any code calling python -m pip will crash
with ModuleNotFoundError. This is critical for tools like stable-diffusion-webui
whose launch_utils.py:run_pip() calls python -m pip. Avoid by ensuring all
version pins pass requirements_met() checks, or install pip explicitly:
uv pip install pip --python venv/bin/python
```

```yaml
---
type: gotcha
title: "packaging.version: parse('0.15') != parse('0.15.0')"
confidence: 1.0
tags: [python, packaging, version, semantic-versioning, dependency-management]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
Python's packaging.version.parse handles segment count strictly:
parse("0.15") has release=(0, 15). parse("0.15.0") has release=(0, 15, 0).
They are NOT equal. This causes exact-match version checks to fail silently
in tools that compare installed vs pinned versions. Always pin the exact
number of version segments: use 0.15.0 not 0.15.
```

```yaml
---
type: gotcha
title: "command -v only searches PATH — relative paths silently fail"
confidence: 1.0
tags: [bash, shell, scripting, path, portability]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
`command -v` only searches PATH directories, not relative paths. Setting
`python_cmd="venv/bin/python"` silently fails because command -v returns empty
for relative paths. Must use absolute path: `$(dirname "$0")/venv/bin/python`.
This is especially dangerous when webui.sh sources webui-user.sh — $0 stays
as webui.sh, so dirname "$0" gives the correct project root.
```

```yaml
---
type: gotcha
title: Extension installers run on EVERY startup, not just first install
confidence: 1.0
tags: [ai, stable-diffusion, webui, extensions, reliability]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
stable-diffusion-webui's launch_utils.py:run_extensions_installers() runs
every extension's install.py on every launch. Any download timeout, pip
install failure, or missing model in an extension's install.py blocks the
entire startup. urllib.request.urlopen() with no timeout hangs indefinitely
when HuggingFace is unreachable. Always add timeout=30 and try/except to
extension installers.
```

```yaml
---
type: gotcha
title: Git credential.helper=osxkeychain fails in non-interactive shells on macOS
confidence: 0.90
tags: [macos, git, homebrew, keychain, non-interactive-shell]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
Homebrew's git config sets credential.helper=osxkeychain. This tries to
access the macOS Keychain, failing in non-interactive shells with
"Device not configured". For public repo cloning in scripts, bypass with
GIT_ASKPASS=true git clone <url> <dir>.
```

```yaml
---
type: gotcha
title: os.path.exists on empty directory returns True — silent download skip
confidence: 1.0
tags: [python, filesystem, download, os-path, defensive-programming]
source: raw/2026-08-05/stable-diffusion-webui-macos-lessons.md
last_verified: 2026-08-05
times_referenced: 0
---
Download-on-first-run patterns that check os.path.exists(dir) will silently
skip if an empty directory was created by a prior failed run (os.makedirs
succeeded but download crashed). At inference time, the missing files crash.
Always check for a specific expected file:
os.path.exists(os.path.join(dir, "expected_file.ext")) instead of os.path.exists(dir).
```
