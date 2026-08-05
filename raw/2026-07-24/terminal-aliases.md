# Terminal Aliases & Shortcuts

> Installed at `~/.oh-my-zsh/custom/aliases.zsh` (auto-sourced by Oh My Zsh)
>
> Date: 2026-07-24

## Git

| Type     | Alias   | Expansion                                                |
| -------- | ------- | -------------------------------------------------------- |
| alias    | `g`     | `git`                                                    |
| alias    | `gs`    | `git status`                                             |
| alias    | `ga`    | `git add`                                                |
| alias    | `gap`   | `git add -p` (interactive staging)                       |
| alias    | `gl`    | `git pull`                                               |
| alias    | `gd`    | `git diff`                                               |
| alias    | `glg`   | `git log --oneline --graph --decorate --all`             |
| alias    | `gclean`| Delete merged local branches (keeps main/master/develop) |
| alias    | `gundo` | `git reset --soft HEAD~1` (undo last commit, keep files) |
| function | `gfs`   | `git fetch && git status`                                |

## Navigation / Filesystem

| Alias   | Expansion                            | Notes                            |
| ------- | ------------------------------------ | -------------------------------- |
| `..`    | `cd ..`                              |                                  |
| `...`   | `cd ../..`                           |                                  |
| `....`  | `cd ../../..`                        |                                  |
| `~`     | `cd ~`                               |                                  |
| `l`     | `ls -lh`                             |                                                  |
| `ll`    | `ls -lha`                            |                                                  |
| `la`    | `ls -la`                             |                                                  |
| `lt`    | `ls -ltrh`                           | Newest files at bottom                   |
| `tree`  | `find . -print \| sed ...`           | Fallback; install `tree` via brew if desired |
| `mkdirp`| `mkdir -p`                           |                                  |

## General Productivity

| Alias    | Expansion                                |
| -------- | ---------------------------------------- |
| `reload` | `source ~/.zshrc`                        |
| `path`   | `echo $PATH \| tr ":" "\n"` (one per line) |
| `myip`   | `curl -s ifconfig.me && echo` (public IP) |
| `week`   | `date +%V` (ISO week number)             |
| `untar`  | `tar -xzvf`                              |
| `tgz`    | `tar -czvf`                              |
| `zshrc`  | `vim ~/.zshrc`                           |

## Reloading

Run `reload` (or open a new terminal tab) for changes to take effect.
