---
type: Overview
title: Developer Environment Knowledge Base
description: Curated knowledge for setting up and maintaining development environments, AI/ML tools, and platform diagnostics across macOS, Windows, and Ubuntu.
tags: [meta, documentation, developer-tools, ai, macos, troubleshooting]
timestamp: 2026-08-07T00:00:00Z
---

# Overview

This knowledge base captures setup guides, tool configurations, shell customizations,
AI/ML tool configuration, network diagnostics, and platform-specific troubleshooting
across multiple operating systems.

## Scope

- **Platforms**: macOS, Windows, Ubuntu, Fedora, LXLE, Android
- **Languages**: Java, Python, JavaScript/Node.js, Ruby, Go, Rust, Scala, PHP, C#, Elm
- **Tools**: Package managers, build tools, editors, IDEs, terminals, browsers, databases, caches, AI/ML tools
- **Networking**: Proxy configuration, CLI network debugging, SOCKS vs HTTP ports
- **Platform Diagnostics**: Apple Silicon Rosetta, quarantine xattr, code signing, MPS attention/VAE issues
- **AI/ML Tooling**: Stable Diffusion WebUI (CPU + Apple Silicon), ReActor, FaceFusion, face-swap performance
- **Depth**: Installation steps, configuration patterns, known issues, cross-platform differences

## Architecture

Three layers following the OKF v0.1 specification:

1. **Raw sources** (`raw/YYYY-MM-DD/`) — Immutable source documents organized by
   ingestion date. These are the source of truth; never modified. Original README files
   and scripts in the repository root remain untouched.

2. **Knowledge bundle** (`knowledge/`) — LLM-maintained OKF concepts with typed
   frontmatter and cross-links. Concepts compile knowledge from raw sources into
   structured, searchable pages.

3. **Memory** (`MEMORY.md` + `memory/`) — Accumulated insights: gotchas, patterns,
   decisions, facts. Auto-collected by `scripts/memory-collect.sh` via post-commit
   hook and nightly cron. Evolved through manual `/learn` and `/evolve` triggers.

## Audience

- Individual developers setting up their machines
- Team leads standardizing development environments
- AI coding agents assisting with setup and troubleshooting

## Related

- [OKF v0.1 Specification](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
- [Google Cloud Blog: Introducing OKF](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
