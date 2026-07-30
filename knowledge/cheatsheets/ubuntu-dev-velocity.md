---
type: Cheatsheet
title: Ubuntu Developer Velocity
description: Quick reference for modern CLI tools, bash aliases, and shell functions that accelerate development on Ubuntu.
tags: [ubuntu, bash, cli, cheatsheet, aliases, functions]
timestamp: 2026-07-30T00:00:00Z
---

# Ubuntu Dev Velocity Cheatsheet

## Keystrokes

| Key | Action |
|---|---|
| `Ctrl+R` | Fuzzy search shell history (fzf) |
| `Ctrl+T` | Fuzzy find file and paste path (fzf) |

## Navigation

| Command | Action |
|---|---|
| `..` / `...` / `....` | Jump up 1 / 2 / 3 directory levels |
| `z <dirname>` | Jump to most-visited matching dir (zoxide) |
| `zi` | Interactive fuzzy directory picker (zoxide) |

## Listing

| Command | Action |
|---|---|
| `ll` | eza -l (long listing with icons) |
| `la` | eza -la --git (all files + git status) |
| `lt` | eza -l --tree (directory tree) |
| `lg` | eza -l --git (git status in listing) |

## Git

| Command | Action |
|---|---|
| `g` | git |
| `gs` | git status -s |
| `gc "msg"` | git commit -v -m "msg" |
| `glg` | git log --graph --oneline --decorate --all |
| `gp` | git push |
| `gco` | git checkout |
| `gcb` | git checkout -b |
| `gst` | git stash |
| `gpf` | git push --force-with-lease |
| `gbdel` | Interactive branch delete (fzf) |

## Search

| Command | Action |
|---|---|
| `rg <pattern>` | Recursive code search (ripgrep) |
| `rg -l <pattern>` | List matching files only |
| `rg -g '!*.py' <pat>` | Exclude glob |
| `fd <name>` | Fast file find (fd) |
| `fd -e py` | Find by extension |
| `hg <term>` | Search shell history |

## System Info

| Command | Action |
|---|---|
| `psg <name>` | ps aux \| grep |
| `ports` | Listening TCP ports |
| `meminfo` | Memory usage summary |
| `topcpu` | Top processes by CPU |
| `topmem` | Top processes by memory |
| `bigfiles` | Largest files in current dir |

## Network

| Command | Action |
|---|---|
| `myip` | Public IP address |
| `localip` | Local IP address |
| `p8` | ping 8.8.8.8 |
| `ipinfo [ip]` | GeoIP lookup |

## Functions

| Command | Action |
|---|---|
| `mkcd <dir>` | mkdir -p + cd |
| `extract <file>` | Universal archive extractor |
| `serve [port]` | Python HTTP server (default :8000) |
| `bak <file>` | Backup file to .bak |
| `unbak <file>` | Restore .bak backup |
| `touchp <path>` | mkdir -p dirname + touch |
| `fcd [dir]` | Fuzzy cd (fzf) |
| `fkill` | Fuzzy process killer (fzf) |
| `cheat <cmd>` | tldr with man fallback |
| `tmpd` | Create temp dir + cd |
| `please` | sudo last command |

## Utility Aliases

| Command | Action |
|---|---|
| `reload` | Reload bash config |
| `path` | Print PATH, one entry per line |
| `batcat` → `bat` | Alias for bat (Debian pkg name) |
| `fdfind` → `fd` | Alias for fd (Debian pkg name) |

## Tool Package Names (Debian/Ubuntu)

| Tool Binary | Install Package | Debian Note |
|---|---|---|
| `fzf` | `fzf` | — |
| `rg` | `ripgrep` | — |
| `fdfind` / `fd` | `fd-find` | bin: `fdfind`; alias to `fd` |
| `batcat` / `bat` | `bat` | bin: `batcat`; alias to `bat` |
| `eza` | `eza` | — |
| `zoxide` | `zoxide` | — |
| `tldr` | `tldr` | Ubuntu uses `tealdeer` pkg |
| `delta` | `git-delta` | — |

## Related

- [Ubuntu Platform](/platforms/ubuntu.md) — setup guide
- [Shell Toolkit](/tools/shell-toolkit.md) — tool details
- [Shell Configuration](/concepts/shell-configuration.md) — config patterns
- Source: [../../raw/2026-07-30/dev-velocity-setup.md](../../raw/2026-07-30/dev-velocity-setup.md)
- Source: [../../raw/2026-07-30/dev-velocity-lessons.md](../../raw/2026-07-30/dev-velocity-lessons.md)
