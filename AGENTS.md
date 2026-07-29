This is a developer environment knowledge repository following the
Open Knowledge Format (OKF) v0.1.

Two knowledge layers operate in parallel:
- `knowledge/` — structured OKF bundle with typed concepts, cross-links, and YAML frontmatter
- Raw source files — the existing README-based directory tree treated as immutable sources

## Available operations

| Command | Purpose |
|---|---|
| `/ingest <path>` | Read raw source → extract concepts → create/update files in `knowledge/` with frontmatter and standard markdown links |
| `/query <question>` | Search `knowledge/` via `index.md` → synthesize answer citing concept pages and raw sources |
| `/lint` | Health check: broken links, missing frontmatter, stale timestamps, orphan concepts, contradictions |
| `/research <topic>` | Web search → save findings to `memory/raw/` → ingest into `knowledge/` if valuable |
| `/learn` | Distill observations from `memory/raw/` into `MEMORY.md` entries with YAML frontmatter |
| `/evolve` | Consolidate similar entries, connect related entries, flag stale entries for review |
| `/visualize` | Generate an interactive HTML dashboard from `knowledge/` + `MEMORY.md` on demand |

## Core rules

1. Raw sources are immutable — never modify existing README files or scripts
2. Every file in `knowledge/` must have YAML frontmatter with a non-empty `type` field
3. Use standard markdown links `[text](path.md)` — never `[[]]` wikilinks
4. Update `knowledge/log.md` after every mutation
5. Read `knowledge/index.md` first before searching deeper
6. Read `knowledge/CONVENTIONS.md` before writing any concept
7. Read `MEMORY.md` before writing specs or making decisions to avoid repeating known issues
8. Concepts link back to their raw source files and cite external references under `# Citations`
