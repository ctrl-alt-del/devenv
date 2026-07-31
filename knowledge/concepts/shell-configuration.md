---
type: Concept
title: Shell Configuration
description: Patterns for organizing bash configuration across multiple files with conditional loading, managed config blocks, and cleanup-on-edit.
tags: [bash, shell, configuration, aliases, functions, dotfiles]
timestamp: 2026-07-30T00:00:00Z
---

# Overview

Organizing shell configuration into separate files (`~/.bash_aliases`, `~/.bash_functions`, `~/.bashrc`) improves maintainability, enables per-file version control, and allows for portable, tool-agnostic config.

# Patterns

## Separate Files by Concern

| File | Contents | Sourced by |
|---|---|---|
| `~/.bashrc` | Environment variables, tool initialization, source directives | Bash on startup |
| `~/.bash_aliases` | Shortcut aliases (70+ organized into 7 categories) | `.bashrc` |
| `~/.bash_functions` | Shell functions (12 functions for file, git, fuzzy ops) | `.bashrc` |

**Benefits**:
- Disable/rename single files for debugging
- Version-control each file independently
- `.bash_aliases` is widely supported by bash out of the box

## Conditional Loading

Always source config files with a presence check to prevent errors if they don't exist:

```bash
[ -f ~/.bash_aliases ]   && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions
```

Conditional guards are also essential within the files themselves — define tool-dependent aliases and functions only when the tool is installed:

```bash
# Only activate eza aliases if eza exists; fall back to ls
if command -v eza &> /dev/null; then
  alias ll='eza -l'
  alias la='eza -la'
else
  alias ll='ls -l'
  alias la='ls -A'
fi
```

**Benefit**: Config is portable across machines — works even before tools are installed.

## Managed Config Blocks

Some distributions (e.g., Linux Lite) manage sections of `.bashrc` between marker comments (`<<<` and `>>>`). These sections have explicit instructions like "Put your own edits ABOVE this block."

**Rule**: Always read the target file first, identify managed sections, and insert custom config above or below (not inside) them.

## Cleanup-on-Edit

When adding new configuration, review the file for:
- Duplicate settings (e.g., proxy exports defined in both lowercase and uppercase)
- Stale or conflicting entries
- Unnecessary comments or commented-out code

Adding configuration is also an opportunity to clean up.

# Schema

```yaml
aliases:
  category: string           # Navigation, Safety, Listing, Git, System, Network, Utilities
  entries:
    - shortcut: string       # e.g., "gs"
      command: string        # e.g., "git status -s"
      description: string    # e.g., "Short git status"
  tool_dependent: boolean    # Whether aliases require a specific tool

functions:
  - name: string             # e.g., "mkcd"
    description: string      # e.g., "mkdir -p + cd"
    depends_on: [string]     # Optional tool dependencies (e.g., ["fzf"])

sourcing:
  order: [".bashrc", ".bash_aliases", ".bash_functions"]
  guards: "[ -f file ] && . file"  # Always conditionally source
```

# Examples

## Tool initializers in `.bashrc`

```bash
export FZF_DEFAULT_OPTS='--height 40% --border --layout=reverse'
eval "$(zoxide init bash)"
```

## Tool-dependent aliases in `.bash_aliases`

```bash
# Git shortcuts
alias g='git'
alias gs='git status -s'
alias gc='git commit -v'
alias glg='git log --graph --oneline --decorate --all'
alias gco='git checkout'
alias gcb='git checkout -b'

# eza listing with git (only if eza installed)
if command -v eza &> /dev/null; then
  alias ll='eza -l'
  alias la='eza -la --git'
  alias lt='eza -l --tree'
  alias lg='eza -l --git'
fi
```

## Shell functions in `.bash_functions`

```bash
mkcd() { mkdir -p "$1" && cd "$1" || return; }

serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}
```

# Related

- [Ubuntu](/platforms/ubuntu.md) — Ubuntu developer environment setup
- Source: [../../raw/2026-07-30/dev-velocity-setup.md](../../raw/2026-07-30/dev-velocity-setup.md)
- Source: [../../raw/2026-07-30/dev-velocity-lessons.md](../../raw/2026-07-30/dev-velocity-lessons.md)

# Citations

[1] [Bash Manual — Aliases](https://www.gnu.org/software/bash/manual/html_node/Aliases.html)
[2] [Bash Manual — Shell Functions](https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html)
