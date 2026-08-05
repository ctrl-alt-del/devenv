---
type: Tool
title: Zsh + Oh My Zsh
description: Z Shell with Oh My Zsh framework for plugins, themes, and customizable terminal experience.
resource: https://ohmyz.sh
tags: [shell, terminal, zsh, oh-my-zsh, customization, productivity]
timestamp: 2026-07-29T00:00:00Z
---

# Overview

Zsh (Z Shell) is a Unix shell with powerful completion, globbing, and customization
features. Oh My Zsh is a framework that manages Zsh configuration through plugins,
themes, and auto-sourced custom directories.

# Installation

## macOS
```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Ubuntu
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Custom Directory

Files in `~/.oh-my-zsh/custom/` are auto-sourced by Oh My Zsh on shell startup.
Organizing configuration here avoids polluting `~/.zshrc` directly:

```
~/.oh-my-zsh/custom/
├── aliases.zsh      # Shell aliases (auto-sourced)
├── functions.zsh    # Custom functions
├── exports.zsh      # Environment variables
└── plugins/         # Custom plugins
```

# Alias Patterns

The single-letter convention for common operations improves terminal speed:

## Git Shortcuts

| Alias | Expansion | Use Case |
|-------|-----------|----------|
| `g` | `git` | Prefix for all git commands |
| `gs` | `git status` | Most-used command |
| `ga` | `git add` | Stage files |
| `gap` | `git add -p` | Interactive patch staging |
| `gl` | `git pull` | Fetch and merge |
| `gd` | `git diff` | See what changed |
| `glg` | `git log --oneline --graph --decorate --all` | Compact history |
| `gundo` | `git reset --soft HEAD~1` | Undo last commit, keep changes staged |
| `gclean` | Delete merged local branches | Keeps main/master/develop |

## Compound Commands

Functions can chain multiple operations:
```bash
# git fetch + status — see remote changes at a glance
gfs() { git fetch && git status; }
```

## Navigation

| Alias | Result |
|-------|--------|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |

## Listing

| Alias | Command | Notes |
|-------|---------|-------|
| `l` | `ls -lh` | Human-readable sizes |
| `ll` | `ls -lha` | All files, human-readable |
| `la` | `ls -la` | All files including dotfiles |
| `lt` | `ls -ltrh` | Sorted by time, newest at bottom |

## Convenience

| Alias | Purpose |
|-------|---------|
| `reload` | `source ~/.zshrc` — apply changes without new tab |
| `path` | Print PATH one entry per line |
| `zshrc` | Quick edit of `~/.zshrc` |
| `myip` | Show public IP address |
| `week` | Current ISO week number |
| `untar` / `tgz` | Shorthand for tar extract/create |

## Tree Fallback

When `tree` package is not installed, use `find` as a fallback:
```bash
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
```
Or install the real thing: `brew install tree` / `sudo apt install tree`.

# Reloading

After editing shell configuration, apply changes without restarting the terminal:
```bash
reload          # alias: source ~/.zshrc
```
Or open a new terminal tab, which triggers Oh My Zsh's auto-sourcing.

# Related

- [Git](/tools/git.md) — version control setup and aliases
- [macOS Setup](/platforms/macos.md) — dev environment setup including shell config
- Source: [../../../terminal/zsh/README.md](../../terminal/zsh/README.md)
- Source: [../../../terminal/zsh/oh-my-zsh/README.md](../../terminal/zsh/oh-my-zsh/README.md)
- Source: [../../../raw/2026-07-24/terminal-aliases.md](../../raw/2026-07-24/terminal-aliases.md)

# Citations

[1] [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
[2] [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
