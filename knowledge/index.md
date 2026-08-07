---
okf_version: "0.1"
---

# Knowledge Index

Developer environment setup and maintenance knowledge across platforms and tools.

## Platforms

* [macOS](platforms/macos.md) — macOS development environment setup
* [Ubuntu](platforms/ubuntu.md) — Ubuntu development environment with modern CLI toolkit

## Tools

* [Homebrew](tools/homebrew.md) — macOS package manager
* [Git](tools/git.md) — Distributed version control
* [Zsh + Oh My Zsh](tools/zsh.md) — Shell customization, aliases, and Oh My Zsh framework
* [Shell Toolkit](tools/shell-toolkit.md) — Modern CLI replacements for grep, find, cat, ls, cd, man, git diff
* [Stable Diffusion WebUI](tools/sd-webui.md) — CPU-only optimization, tuning, extensions, and settings
* [SD WebUI — macOS Setup](tools/sd-webui-macos.md) — Apple Silicon configuration, attention optimization, and fixes
* [ReActor](tools/reactor.md) — Face swap extension: CoreML providers, insightface drift, ecosystem status
* [FaceFusion](tools/facefusion.md) — Video/lip-sync face-swap successor with CoreML support

## Concepts

* [SD WebUI Extension Migration](concepts/sd-webui-extension-migration.md) — Evaluating and migrating between WebUI extensions (roop → ReActor worked example)
* [Shell Configuration](concepts/shell-configuration.md) — Organizing bash config across multiple files

## Cheatsheets

* [Ubuntu Dev Velocity](cheatsheets/ubuntu-dev-velocity.md) — Quick reference for CLI tools, aliases, and functions

## Troubleshooting

* [CLI Tools Ignore a Running Proxy](troubleshooting/cli-ignores-running-proxy.md) — Missing proxy env vars cause CLI timeouts; SOCKS vs HTTP ports
* [SD WebUI SDP Attention OOM](troubleshooting/sd-webui-sdp-attention-oom.md) — High-res VAE encoding OOM on CPU; memory-aware chunked attention fallback
* [MPS convolution_overrideable Crash](troubleshooting/mps-convolution-overrideable.md) — Intermittent img2img VAE crash on Apple Silicon; `--no-half-vae` and code-level fixes
* [macOS App Launch Issues](troubleshooting/macos-app-launch-issues.md) — Rosetta, quarantine, and code signing on Apple Silicon

## More to Come

Additional concepts ([Concepts](concepts/)), tools, platforms, and reference pages
([Cheatsheets](cheatsheets/)) will be added via `/ingest` as raw sources are processed.
