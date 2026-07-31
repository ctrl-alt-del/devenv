# Developer Velocity Setup — Lessons Learned

## Summary

Set up a comprehensive developer productivity environment on Ubuntu 26.04 LTS (Linux Lite 8.0) with Bash 5.3.9. Created aliases, functions, and installed modern CLI replacements for common Unix tools.

---

## What We Did

| Step | File/Action | Result |
|---|---|---|
| 1 | Installed 8 CLI tools via apt | fzf, ripgrep, fd-find, bat, eza, zoxide, tealdeer, git-delta |
| 2 | Created `~/.bash_aliases` | 70+ aliases across 7 categories |
| 3 | Created `~/.bash_functions` | 12 functions (mkcd, extract, serve, fcd, fkill, etc.) |
| 4 | Edited `~/.bashrc` | Added dev tooling block + removed duplicate proxy exports |
| 5 | Exported plan to setup document | Reference document |

---

## Lessons Learned

### 1. Ubuntu/Debian renames some packages
- `bat` → binary is `batcat` (conflicts with `bacula-console`)
- `fd-find` → binary is `fdfind` (conflicts with another `fd`)
- `tldr` package → actually `tealdeer` on Ubuntu repos
- **Fix**: Always add fallback aliases: `alias bat='batcat'`, `alias fd='fdfind'`

### 2. Sudo requires a TTY
- `sudo apt install` failed with *"A terminal is required to authenticate"*
- Cannot run password-protected sudo from automated tools
- **Fix**: User must run sudo commands manually; verify installation afterwards

### 3. Always verify after claiming "done"
- User reported `tldr` missing despite the `apt install` command including it
- The package name was wrong (`tldr` vs `tealdeer`)
- **Fix**: Verify each binary with `which` + `--version` after installation; don't trust package names blindly

### 4. Separate bash config into multiple files
- `~/.bash_aliases` for aliases (widely supported by bash)
- `~/.bash_functions` for functions (cleaner separation)
- Source both from `.bashrc` conditionally (`[ -f file ] && . file`)
- **Benefit**: Easy to disable, debug, or version-control individually

### 5. Conditional loading protects against missing tools
- eza listing aliases only activate if `eza` is installed (fallback to `ls`)
- fzf functions (`fcd`, `fkill`) only defined if fzf exists
- `cheat` function only loads if `tldr` is available
- **Benefit**: Config works even if tools aren't installed yet — graceful degradation

### 6. Respect managed config blocks
- Linux Lite manages a section of `.bashrc` (between `<<<` and `>>>` markers)
- The comment explicitly says *"Put your own edits ABOVE this block"*
- **Rule**: Read the file first, find managed sections, insert before/after them

### 7. Remove duplicate config when adding new ones
- Found 6 proxy exports (3 lowercase + 3 uppercase duplicates)
- Removed the 3 uppercase duplicates while adding dev tooling
- **Lesson**: Adding config is also an opportunity to clean up

---

## Final File State

```
~/.bashrc           ← 45 lines (added dev block + removed dup proxies)
~/.bash_aliases     ← 90 lines (new)
~/.bash_functions   ← 85 lines (new)
```

## Quick Reference for Future Use

| Command/Key | What |
|---|---|
| `..`, `...`, `....` | Jump up directories |
| `gs`, `gc`, `glg`, `gp`, `gco` | Git shortcuts |
| `ports`, `psg ssh`, `meminfo` | System info |
| `myip`, `localip`, `p8` | Network |
| `ll`, `la`, `lt`, `lg` | eza listing with git status |
| `mkcd dir`, `serve`, `extract` | File/dir functions |
| `Ctrl+R` | Fuzzy history search (fzf) |
| `Ctrl+T` | Fuzzy file finder (fzf) |
| `z dirname` | Smart cd (zoxide) |
| `rg pattern` | Fast code search (ripgrep) |
| `fd name` | Fast file find (fd) |
| `cheat cmd` | Practical examples (tldr) |
| `reload` | Reload bash config |
