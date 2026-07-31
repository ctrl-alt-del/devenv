---
type: Tool
title: Shell Toolkit
description: Suite of modern CLI tools (fzf, ripgrep, fd-find, bat, eza, zoxide, tldr, git-delta) that replace traditional Unix utilities on Ubuntu/Debian.
tags: [cli, ubuntu, bash, productivity, terminal]
timestamp: 2026-07-30T00:00:00Z
---

# Overview

Eight modern CLI tools replace slow, low-contrast traditional Unix utilities. They are installable via `apt` on Ubuntu/Debian and integrate with bash through aliases, functions, and shell init scripts.

# Tool Reference

## fzf — Fuzzy Finder

[GitHub](https://github.com/junegunn/fzf)

| | |
|---|---|
| **Replaces** | (new capability) |
| **Package** | `fzf` |
| **Binary** | `fzf` |

```bash
# Key bindings (source in .bashrc)
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
```

| Keybinding | Action |
|---|---|
| `Ctrl+R` | Fuzzy search shell history |
| `Ctrl+T` | Fuzzy find file, paste path |
| Pipe `\| fzf` | Fuzzy filter any input |

## ripgrep — Fast Code Search

[GitHub](https://github.com/BurntSushi/ripgrep)

| | |
|---|---|
| **Replaces** | `grep -r` |
| **Package** | `ripgrep` |
| **Binary** | `rg` |

```bash
rg TODO                  # Search for pattern recursively
rg -l pattern            # List matching files only
rg --type py pattern     # Search only Python files
rg -g '!*.py' pattern    # Exclude glob
```

Respects `.gitignore` by default. ~10x faster than `grep -r` on large codebases.

## fd-find — Fast File Find

[GitHub](https://github.com/sharkdp/fd)

| | |
|---|---|
| **Replaces** | `find` |
| **Package** | `fd-find` |
| **Binary** | `fdfind` (alias: `fd`) |

> **Debian quirk**: Binary is `fdfind` due to name conflict. Add `alias fd='fdfind'`.

```bash
fd config.yaml           # Find by name
fd -e py                 # Filter by extension
fd pattern /path         # Search in specific dir
```

## bat — Cat with Syntax

[GitHub](https://github.com/sharkdp/bat)

| | |
|---|---|
| **Replaces** | `cat` |
| **Package** | `bat` |
| **Binary** | `batcat` (alias: `bat`) |

> **Debian quirk**: Binary is `batcat` due to name conflict. Add `alias bat='batcat'`.

```bash
bat file.py              # Syntax highlighted output
bat --style=numbers      # With line numbers
bat --show-all           # Show non-printing chars
```

## eza — Modern ls

[GitHub](https://github.com/eza-community/eza)

| | |
|---|---|
| **Replaces** | `ls` |
| **Package** | `eza` |
| **Binary** | `eza` |

```bash
eza -l                   # Long listing with icons
eza -la --git            # All files + git status
eza --tree               # Directory tree view
eza -l --sort=modified   # Sort by modification time
```

## zoxide — Smart cd

[GitHub](https://github.com/ajeetdsouza/zoxide)

| | |
|---|---|
| **Replaces** | `cd` |
| **Package** | `zoxide` |
| **Binary** | `zoxide` (init: `eval "$(zoxide init bash)"`) |

```bash
z projects               # Jump to most-visited dir matching "projects"
z foo bar                # Match "foo" then "bar" in path
zi projects              # Interactive fuzzy picker
```

Learns your most-visited directories over time.

## tldr — Practical Examples

[GitHub](https://github.com/tldr-pages/tldr)

| | |
|---|---|
| **Replaces** | `man` |
| **Package** | `tldr` (Ubuntu: `tealdeer`) |
| **Binary** | `tldr` |

> **Debian quirk**: Package is named `tealdeer` on Ubuntu repos, but the command is `tldr`.

```bash
tldr tar                 # Practical tar examples
tldr git rebase          # Common git rebase patterns
tldr --update            # Refresh the offline cache
```

## git-delta — Rich Git Diff

[GitHub](https://github.com/dandavison/delta)

| | |
|---|---|
| **Replaces** | `git diff` |
| **Package** | `git-delta` |
| **Binary** | `delta` |

```bash
# Enable in ~/.gitconfig:
# [core]
#   pager = delta
# [interactive]
#   diffFilter = delta --color-only
# [delta]
#   side-by-side = true
# [merge]
#   conflictstyle = diff3
git diff                  # Side-by-side diffs with syntax highlighting
git log -p                # Rich log output with delta
```

# Quick Install

```bash
sudo apt update && sudo apt install -y fzf ripgrep fd-find bat eza zoxide tldr git-delta
```

Post-install: add fallback aliases for renamed Debian binaries:
```bash
alias bat='batcat'
alias fd='fdfind'
```

# Related

- [Ubuntu](/platforms/ubuntu.md) — full Ubuntu dev environment
- [Shell Configuration](/concepts/shell-configuration.md) — organizing bash config
- Source: [../../raw/2026-07-30/dev-velocity-setup.md](../../raw/2026-07-30/dev-velocity-setup.md)
- Source: [../../raw/2026-07-30/dev-velocity-lessons.md](../../raw/2026-07-30/dev-velocity-lessons.md)

# Citations

[1] [fzf](https://github.com/junegunn/fzf)
[2] [ripgrep](https://github.com/BurntSushi/ripgrep)
[3] [fd](https://github.com/sharkdp/fd)
[4] [bat](https://github.com/sharkdp/bat)
[5] [eza](https://github.com/eza-community/eza)
[6] [zoxide](https://github.com/ajeetdsouza/zoxide)
[7] [tldr](https://github.com/tldr-pages/tldr)
[8] [delta](https://github.com/dandavison/delta)
