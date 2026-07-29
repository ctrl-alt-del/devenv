# Knowledge Conventions

## Concept types

Use one of these `type` values in every concept's YAML frontmatter:

| Type | Use for |
|---|---|
| `Tool` | Software tool or utility (homebrew, git, docker, vscode) |
| `Platform` | Operating system (macOS, Ubuntu, Windows, Fedora) |
| `Language` | Programming language (Python, Java, Ruby, Go, JavaScript) |
| `Concept` | Cross-cutting abstraction (package-management, shell-configuration) |
| `HowTo` | Procedural setup guide with step-by-step instructions |
| `Cheatsheet` | Quick reference page with commands and syntax tables |
| `Troubleshooting` | Known issue, its cause, and the fix |
| `Overview` | Top-level summary of a domain or the entire bundle |

## Naming

- **Concept files**: lowercase, hyphen-separated (e.g., `package-management.md`, `shell-configuration.md`)
- **Directories**: lowercase, plural noun (e.g., `tools/`, `platforms/`, `cheatsheets/`)
- **Path as identity**: the file path within `knowledge/` is the concept's unique ID

## Links

- **Between concepts**: bundle-relative absolute paths starting with `/`
  ```markdown
  See the [Homebrew guide](/tools/homebrew.md) for installation steps.
  ```
- **To raw sources**: relative path from the concept file to the raw README
  ```markdown
  Source: [../../terminal/package-manager/homebrew/README.md](../../terminal/package-manager/homebrew/README.md)
  ```
- **External references**: absolute URLs in `# Citations` section at bottom
- **Never use**: `[[]]` wikilink syntax (Obsidian-specific, not portable)

## Frontmatter

Every concept file must have YAML frontmatter delimited by `---`.

```yaml
---
type: Tool                          # REQUIRED — one of the types above
title: Homebrew                     # Human-readable name
description: Package manager for macOS  # One-line summary
resource: https://brew.sh           # Canonical URI (optional)
tags: [macos, package-manager]      # YAML list of short strings
timestamp: 2026-07-24T00:00:00Z     # ISO 8601 last-modified time
---
```

## Body

- Favor structural markdown: headings, lists, tables, fenced code blocks
- Use `# Schema` for structured field descriptions
- Use `# Examples` for concrete usage examples
- Use `# Citations` for external sources backing claims
- Link back to raw source files for provenance

## Index files

Every `index.md` (except the root) has no frontmatter. The root `knowledge/index.md` carries
`okf_version: "0.1"` in its frontmatter — the only index.md with frontmatter per OKF §11.

Index files list directory contents grouped by concept type:

```markdown
# Section Heading

* [Title](file.md) — one-line description
```
