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
