---
type: Platform
title: Ubuntu Development Environment
description: Setup guide for Ubuntu 26.04 LTS with modern CLI tools, shell aliases, and bash functions for developer productivity.
tags: [ubuntu, bash, developer-velocity, cli-tools]
timestamp: 2026-07-30T00:00:00Z
---

# Overview

Setting up a high-velocity developer environment on Ubuntu involves replacing traditional Unix tools with faster, modern alternatives, organizing shell configuration into structured files, and adding productivity shortcuts.

# Prerequisites

- Ubuntu 26.04 LTS (or compatible Debian-based distribution)
- Bash 5.3+
- Administrator access (`sudo`)
- Internet connection

# Setup Steps

## 1. Install Modern CLI Tools

```bash
sudo apt update && sudo apt install -y fzf ripgrep fd-find bat eza zoxide tldr git-delta
```

| Tool | Replaces | Purpose |
|---|---|---|
| `fzf` | — | Fuzzy finder for history, files, and piped input |
| `ripgrep` (`rg`) | `grep -r` | ~10x faster recursive search, respects `.gitignore` |
| `fd-find` (`fdfind`) | `find` | Faster, smarter file search with color output |
| `bat` (`batcat`) | `cat` | Syntax highlighting, line numbers, git diffs |
| `eza` | `ls` | Colors, icons, git status, tree view |
| `zoxide` | `cd` | Learns visited dirs; jump with `z <name>` |
| `tldr` (`tealdeer`) | `man` | Practical command examples |
| `git-delta` | `git diff` | Side-by-side diffs with syntax highlighting |

> **Debian package name warning**: `bat` installs as `batcat`, `fd-find` installs as `fdfind`, and the `tldr` command comes from the `tealdeer` package. Create fallback aliases for portability.

## 2. Configure `~/.bashrc`

Add a developer tooling block above any managed config sections:

```bash
# ── Developer tooling ──
export FZF_DEFAULT_OPTS='--height 40% --border --layout=reverse --preview "bat --style=numbers --color=always {}"'
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
eval "$(zoxide init bash)"
[ -f ~/.bash_aliases ]   && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions
# ── End developer tooling ──
```

Key principles:
- Conditional sourcing (`[ -f file ] && . file`) prevents errors if files don't exist
- fzf key bindings provide `Ctrl+R` (history) and `Ctrl+T` (files)
- zoxide replaces `cd` with directory learning

## 3. Create `~/.bash_aliases`

Organize aliases into sections: Navigation, Safety, Listing, Git, System, Network, Utilities. See the [Shell Configuration](/concepts/shell-configuration.md) concept for patterns.

## 4. Create `~/.bash_functions`

Common shell functions: `mkcd` (mkdir + cd), `extract` (universal archiver), `serve` (HTTP server), `fcd` (fuzzy cd), `cheat` (tldr with man fallback), and more.

# Related

- [Shell Toolkit](/tools/shell-toolkit.md) — individual tool details
- [Shell Configuration](/concepts/shell-configuration.md) — organizing bash config
- [Ubuntu Dev Velocity Cheatsheet](/cheatsheets/ubuntu-dev-velocity.md) — quick reference
- Source: [../../raw/2026-07-30/dev-velocity-setup.md](../../raw/2026-07-30/dev-velocity-setup.md)

# Citations

[1] [fzf GitHub](https://github.com/junegunn/fzf)
[2] [ripgrep GitHub](https://github.com/BurntSushi/ripgrep)
[3] [zoxide GitHub](https://github.com/ajeetdsouza/zoxide)
