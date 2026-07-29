---
type: Platform
title: macOS Development Environment
description: Complete setup guide for a macOS-based development environment with Homebrew, Git, Node.js, Ruby, Python, and more.
tags: [macos, setup, apple-silicon, intel]
timestamp: 2026-07-24T00:00:00Z
---

# Overview

Setting up a development environment on macOS involves installing a package manager,
configuring the shell, and installing language runtimes and tools.

# Prerequisites

- macOS with administrator access
- Terminal application (iTerm2 recommended)
- Internet connection

# Setup Steps

## 1. Install Homebrew

Homebrew is the foundation. See the [Homebrew guide](/tools/homebrew.md) for details.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Install Git

```bash
brew install git
```

See the [Git guide](/tools/git.md) for configuration.

## 3. Configure Shell

Install Zsh and Oh-My-Zsh for an improved terminal experience:
```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 4. Install Language Runtimes

```bash
# Node.js
brew install node

# Ruby (via RVM)
curl -sSL https://get.rvm.io | bash -s stable --rails

# Python
brew install python
pip install virtualenv
```

## 5. Install Databases

```bash
brew install mysql
brew install postgresql
brew install redis
brew install sqlite3
```

## 6. Install Build Tools

```bash
brew install gradle
brew install maven
```

# Apple Silicon vs Intel

| Aspect | Intel (`/usr/local`) | Apple Silicon (`/opt/homebrew`) |
|---|---|---|
| Homebrew prefix | `/usr/local` | `/opt/homebrew` |
| PATH setup | Already on PATH | Add `eval "$(/opt/homebrew/bin/brew shellenv)"` to `.zshrc` |

# Related

- [Homebrew](/tools/homebrew.md) — macOS package manager
- [Git](/tools/git.md) — Version control setup
- Source: [../../os/mac/setup.sh](../../os/mac/setup.sh)

# Citations

[1] [Apple Developer Documentation](https://developer.apple.com/documentation)
