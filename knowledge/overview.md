---
type: Overview
title: Developer Environment Knowledge Base
description: Curated knowledge for setting up and maintaining development environments across macOS, Windows, Ubuntu, and Fedora.
tags: [meta, documentation, developer-tools]
timestamp: 2026-07-24T00:00:00Z
---

# Overview

This knowledge base captures setup guides, tool configurations, shell customizations,
and troubleshooting patterns for developer environments across multiple operating systems.

## Scope

- **Platforms**: macOS, Windows, Ubuntu, Fedora, LXLE, Android
- **Languages**: Java, Python, JavaScript/Node.js, Ruby, Go, Rust, Scala, PHP, C#, Elm
- **Tools**: Package managers, build tools, editors, IDEs, terminals, browsers, databases, caches
- **Depth**: Installation steps, configuration patterns, known issues, cross-platform differences

## Architecture

Three layers following the OKF v0.1 specification:

1. **Raw sources** (`./` directory tree) — Immutable README files and setup scripts
   organized by technology domain. These are the source of truth; never modified.

2. **Knowledge bundle** (`knowledge/`) — LLM-maintained OKF concepts with typed
   frontmatter and cross-links. Concepts compile knowledge from raw sources into
   structured, searchable pages.

3. **Memory** (`MEMORY.md` + `memory/`) — Accumulated insights: gotchas, patterns,
   decisions, facts. Evolves through automated collection and manual `/learn` triggers.

## Audience

- Individual developers setting up their machines
- Team leads standardizing development environments
- AI coding agents assisting with setup and troubleshooting

## Related

- [OKF v0.1 Specification](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
- [Google Cloud Blog: Introducing OKF](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
