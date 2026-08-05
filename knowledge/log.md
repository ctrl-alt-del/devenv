# Knowledge Log

## 2026-08-05
* **Update**: Updated AGENTS.md (two → three layers, added raw/ date convention and memory collection)
* **Update**: Updated knowledge/overview.md (expanded scope with AI/ML, networking, platform diagnostics;
  updated architecture for raw/YYYY-MM-DD/ convention and auto-collected memory)
* **Ingest**: Ingested raw/2026-08-05/stable-diffusion-webui-macos-lessons.md (SD WebUI on macOS: attention optimizers, uv venv, ReActor, git+proxy fixes)
* **New**: Created tools/sd-webui-macos.md — Apple Silicon config, MPS attention priority, uv pip patterns, 6 fixes, 10 gotchas
* **Update**: Added 8 MEMORY.md entries (torch.einsum MPS fallback, VIRTUAL_ENV trap, uv venv no pip, version segment mismatch, command -v PATH requirement, extension installer startup runs, git keychain, os.path.exists empty dir)

## 2026-08-04
* **Ingest**: Ingested raw/2026-07-24/terminal-aliases.md (Zsh aliases, git shortcuts, navigation, productivity)
* **New**: Created tools/zsh.md — Zsh + Oh My Zsh setup, alias patterns, custom directory, reloading
* **Update**: Added 2 MEMORY.md entries (Oh My Zsh custom directory pattern, git single-letter alias convention)
* **Ingest**: Ingested raw/2026-08-04/proxy-debug-lessons.md (CLI tools ignore a running proxy: missing env vars, SOCKS vs HTTP ports, shell file placement)
* **New**: Created troubleshooting/cli-ignores-running-proxy.md — diagnosis checklist, root cause, fix locations, pitfalls
* **Update**: Updated 2 index files (root, troubleshooting) with the new entry
* **Update**: Cross-linked concepts/shell-configuration.md to the proxy troubleshooting page
* **Update**: Added 3 MEMORY.md entries (GUI proxy ≠ CLI proxy, SOCKS5 port ≠ HTTP port, interactive-shell guard in .bashrc)
* **Ingest**: Ingested raw/2026-08-03/sd-webui-cpu-learning-roadmap.md, raw/2026-08-03/roop-to-reactor-migration.md, raw/2026-08-03/sdp-attention-oom-fix.md (CPU-only Stable Diffusion WebUI: optimizations, tuning, extension migration, SDP OOM fix)
* **New**: Created tools/sd-webui.md — CPU-only SD WebUI optimizations, tuning, extensions, key numbers
* **New**: Created troubleshooting/sd-webui-sdp-attention-oom.md — quadratic attention-matrix OOM on high-res VAE encoding, memory-aware chunked fallback
* **New**: Created concepts/sd-webui-extension-migration.md — landscape evaluation + migration workflow, roop → ReActor SFW worked example
* **Update**: Updated 4 index files (root, tools, concepts, troubleshooting) with new entries
* **Update**: Cross-linked the three new pages to each other
* **Update**: Added 3 MEMORY.md entries (SDP OOM on CPU, resize-before-img2img, archived-extension migration)

## 2026-07-30
* **Ingest**: Ingested raw/2026-07-30/dev-velocity-setup.md and raw/2026-07-30/dev-velocity-lessons.md (Ubuntu developer velocity: CLI tools, bash config, aliases, functions)
* **New**: Created platforms/ubuntu.md — Ubuntu 26.04 dev environment setup with modern CLI toolkit
* **New**: Created concepts/shell-configuration.md — Patterns for organizing bash config across multiple files
* **New**: Created tools/shell-toolkit.md — Bundle of 8 modern CLI replacements with Debian package quirks
* **New**: Created cheatsheets/ubuntu-dev-velocity.md — Quick reference for aliases, functions, and keystrokes
* **Update**: Updated 5 index files (root, platforms, tools, concepts, cheatsheets) with new entries
* **Update**: Added 5 MEMORY.md entries from dev velocity lessons (package renaming, sudo TTY, verify-after-install, config separation, conditional loading)

## 2026-07-29
* **Ingest**: Ingested raw/2026-07-25/macos-app-launch-diagnosis.md (Rosetta, quarantine, code signing)
* **New**: Created troubleshooting/macos-app-launch-issues.md (3 root causes, 5 rosetta facts, 4 patterns, 5 pitfalls)
* **Update**: Seeded 9 MEMORY.md entries from Rosetta, quarantine, and code signing learnings

## 2026-07-29
* **Fix**: Trimmed index.md to only list existing concepts (was showing phantom pages)
* **Fix**: Added AI agent pointer to README.md for human discoverability
* **Init**: Created concepts/, cheatsheets/, troubleshooting/ directories with index placeholders

## 2026-07-29
* **Init**: Created OKF knowledge bundle with seed concepts (homebrew, git, macos)
* **Init**: Created CONVENTIONS.md with type taxonomy and writing rules
* **Init**: Seeded MEMORY.md with known gotchas from raw sources
* **Init**: Installed memory-collect.sh for automated observation gathering
