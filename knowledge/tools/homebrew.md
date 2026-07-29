---
type: Tool
title: Homebrew
description: Package manager for macOS that simplifies installing development tools and libraries.
resource: https://brew.sh
tags: [macos, package-manager, setup]
timestamp: 2026-07-24T00:00:00Z
---

# Overview

Homebrew is the de facto standard package manager for macOS. It installs packages
into `/usr/local` on Intel Macs and `/opt/homebrew` on Apple Silicon Macs.

# Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Key Commands

| Command | Purpose |
|---------|--------|
| `brew update` | Fetch latest formula versions |
| `brew outdated` | List packages with newer versions available |
| `brew upgrade` | Upgrade all installed packages |
| `brew install <pkg>` | Install a package |
| `brew search <term>` | Search for available formulae |
| `brew doctor` | Check for potential problems |

# Common Packages

- [Git](/tools/git.md) — `brew install git`
- Node.js — `brew install node`
- Python — `brew install python`
- Docker — `brew install --cask docker`

# Related

- [macOS Setup Guide](/platforms/macos.md) — full macOS development environment
- Source: [../../terminal/package-manager/homebrew/README.md](../../terminal/package-manager/homebrew/README.md)

# Citations

[1] [Homebrew Documentation](https://docs.brew.sh)
