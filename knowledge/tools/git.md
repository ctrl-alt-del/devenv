---
type: Tool
title: Git
description: Distributed version control and source code management system.
resource: https://git-scm.com
tags: [version-control, terminal, configuration]
timestamp: 2026-07-24T00:00:00Z
---

# Overview

Git is a distributed version control system available on all major platforms.
It is typically the first tool installed when setting up a development environment.

# Installation

## macOS
```bash
brew install git
```

## Windows
Download the installer from [git-scm.com](https://git-scm.com/download/win) and install
under `%USERPROFILE%/Applications/Git`. Default configuration options work fine.

## Ubuntu
```bash
sudo apt install git
```

# Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global core.autocrlf input    # macOS/Linux
git config --global core.autocrlf true     # Windows
```

## Shortcuts

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
```

## Changing Default Editor

```bash
git config --global core.editor "code --wait"   # VS Code
git config --global core.editor "vim"           # Vim
```

# Known Issues

On Windows, Git Bash may not remember command history correctly. Fix it by adding
these lines to `~/.bash_profile`:
```bash
touch ~/.bash_profile
echo "PROMPT_COMMAND='history -a'" >> ~/.bash_profile
```

# Related

- [Homebrew](/tools/homebrew.md) — macOS package manager for installing Git
- [Bash Cheatsheet](/cheatsheets/bash) — Shell commands reference
- Source: [../../terminal/git/README.md](../../terminal/git/README.md)

# Citations

[1] [Git Documentation](https://git-scm.com/doc)
