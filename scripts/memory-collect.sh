#!/bin/bash
# memory-collect.sh — gather observations from git history, freshness checks, and link analysis
# Run nightly via cron: 0 2 * * * /path/to/devenv/scripts/memory-collect.sh
# Invoked by post-commit hook for real-time collection

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RAW_DIR="$REPO_ROOT/memory/raw"
mkdir -p "$RAW_DIR"

TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

# ── 1. Git log mining ─────────────────────────────────────────────────────

# Extract commits with fix/workaround/issue signals from the past week
echo "## Observations collected at $TIMESTAMP" > "$RAW_DIR/git-observations.md"
echo "" >> "$RAW_DIR/git-observations.md"

git -C "$REPO_ROOT" log --all --oneline --since="1 week ago" \
  --grep="fix\|workaround\|issue\|error\|problem\|bug\|revert\|hotfix\|address\|wrong\|broken" \
  | grep -ivE "typo|hyperlink" \
  >> "$RAW_DIR/git-observations.md" 2>/dev/null || true

# ── 2. Timestamp staleness check ───────────────────────────────────────────

echo "## Staleness check at $TIMESTAMP" > "$RAW_DIR/stale-flags.md"
echo "" >> "$RAW_DIR/stale-flags.md"

find "$REPO_ROOT/knowledge" -name "*.md" ! -name "index.md" ! -name "log.md" 2>/dev/null | while read -r f; do
    ts=$(grep -m1 'timestamp:' "$f" 2>/dev/null | sed 's/.*timestamp:\s*//' | tr -d ' ')
    if [ -n "$ts" ]; then
        ts_epoch=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "${ts}" +%s 2>/dev/null || date -jf "%Y-%m-%d" "${ts:0:10}" +%s 2>/dev/null)
        cutoff_epoch=$(date -v-180d +%s 2>/dev/null)
        if [ -n "$ts_epoch" ] && [ "$ts_epoch" -lt "$cutoff_epoch" ]; then
            rel="${f#$REPO_ROOT/}"
            echo "STALE (>180 days): $rel (last updated: $ts)" >> "$RAW_DIR/stale-flags.md"
        fi
    fi
done

# ── 3. Broken link scan ────────────────────────────────────────────────────

echo "## Broken link scan at $TIMESTAMP" > "$RAW_DIR/broken-links.md"
echo "" >> "$RAW_DIR/broken-links.md"

cd "$REPO_ROOT"
grep -rn '\[[^]]*\](\([^)]*\.md\))' knowledge/ 2>/dev/null | while IFS=: read -r file line text; do
    target=$(echo "$text" | grep -oP '(?<=\()[^)]*\.md(?=\))' 2>/dev/null)
    if [ -n "$target" ]; then
        # Resolve relative to the source file
        src_dir=$(dirname "$file")
        resolved=$(cd "$src_dir" 2>/dev/null && realpath --relative-to="$REPO_ROOT" "$target" 2>/dev/null)
        if [ -z "$resolved" ]; then
            continue
        fi
        if [ ! -f "$REPO_ROOT/$resolved" ]; then
            echo "BROKEN: $file:$line -> $target (resolved: $resolved not found)" >> "$RAW_DIR/broken-links.md"
        fi
    fi
done

# ── 4. Summary ─────────────────────────────────────────────────────────────

echo "memory-collect.sh finished at $TIMESTAMP"
wc -l "$RAW_DIR"/*.md 2>/dev/null | tail -1
