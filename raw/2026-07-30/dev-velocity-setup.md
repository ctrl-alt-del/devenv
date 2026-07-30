# Developer Velocity Setup Plan
## Environment: Ubuntu 26.04 LTS / Bash 5.3.9

---

### Step 1 — Install Modern CLI Tools

```bash
sudo apt update && sudo apt install -y fzf ripgrep fd-find bat eza zoxide tldr git-delta
```

| Tool | Replaces | What it does |
|---|---|---|
| `fzf` | — | Fuzzy finder: Ctrl+R history, Ctrl+T files, pipe anything into it |
| `ripgrep` | `grep -r` | 10x faster recursive code search, respects `.gitignore` |
| `fd-find` | `find` | Smarter `find`, 5x faster, color output |
| `bat` | `cat` | Syntax highlighting, line numbers, git diffs in output |
| `eza` | `ls` | Colors, icons, git status inline, tree view |
| `zoxide` | `cd` | Learns most-visited dirs, `z projects` jumps there instantly |
| `tldr` | `man` | Practical examples instead of full manual pages |
| `git-delta` | `git diff` | Side-by-side diffs with syntax highlighting, line numbers |

---

### Step 2 — `~/.bash_aliases`

70+ aliases across 7 sections:

| Section | Examples |
|---|---|
| **Navigation** | `..`→`cd ..`, `...`→`../..`, `....`→`../../..` |
| **Safety** | `cp`/`mv`/`rm` default to `-i` (interactive) |
| **Listing** | `ll`→`eza -l`, `la`→`eza -la`, `lt`→`eza --tree`, `lg`→`eza -l --git` |
| **Git** | `g`→`git`, `gs`→`status -s`, `gc`→`commit -v`, `glg`→log graph, `gp`→push, `gco`→checkout, `gcb`→checkout -b, `gst`→stash, `gpf`→`push --force-with-lease` |
| **System** | `psg`→ps+grep, `ports`→listening ports, `meminfo`, `topcpu`, `topmem`, `bigfiles` |
| **Network** | `myip`→public IP, `localip`, `p8`→ping 8.8.8.8 |
| **Utilities** | `reload`→restart shell, `hg`→history grep, `please`→sudo last cmd, `path`→print PATH |

---

### Step 3 — `~/.bash_functions`

| Function | Description |
|---|---|
| `mkcd <dir>` | `mkdir -p` + `cd` |
| `extract <file>` | Universal archive extractor (tar.gz, zip, 7z, rar, etc.) |
| `serve [port]` | Python HTTP server (default :8000) |
| `bak <file>` | Backup file to `.bak` |
| `unbak <file>` | Restore `.bak` file |
| `touchp <path>` | `mkdir -p dirname` + `touch` |
| `fcd [dir]` | Fuzzy cd (needs fzf) |
| `fkill` | Fuzzy process killer (needs fzf) |
| `cheat <cmd>` | `tldr` with `man` fallback |
| `tmpd` | Create temp dir + cd into it |
| `ipinfo [ip]` | GeoIP lookup via ipinfo.io |
| `gbdel` | Interactive branch delete (needs fzf) |

---

### Step 4 — `~/.bashrc` edits

**Added** (~8 lines above Linux Lite managed block):
```bash
# ── Developer tooling ──
export FZF_DEFAULT_OPTS='--height 40% --border --layout=reverse --preview "bat --style=numbers --color=always {}"'
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
eval "$(zoxide init bash)"
[ -f ~/.bash_aliases ]   && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions
# ── End developer tooling ──
```

**Removed** duplicate uppercase proxy exports (3 lines).

---

### Quick reference

| Keystroke / Command | What it does |
|---|---|
| `..`, `...`, `....` | Jump up directories |
| `gs` | `git status -s` |
| `gc "msg"` | `git commit -v -m "msg"` |
| `glg` | Pretty git log graph |
| `Ctrl+R` | Fuzzy search shell history |
| `Ctrl+T` | Fuzzy find file + paste path |
| `mkcd foo/bar` | Create nested dirs + cd |
| `serve 3000` | HTTP server on :3000 |
| `z projects` | Jump to most-visited dir matching "projects" |
| `rg TODO` | Search all files for "TODO" |
| `fd config.yaml` | Find files named "config.yaml" |
| `ll` | Colored `ls` with icons + git status |
| `ports` | Show listening TCP ports |
| `cheat tar` | Practical examples for `tar` |
| `please !!` | Re-run last command with sudo |

---

### No changes to
- `~/.profile`, `~/.bash_profile`, `~/.bash_logout`
- `~/.config/starship.toml`
- `~/.gitconfig`
- Proxy settings
