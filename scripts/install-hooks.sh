#!/bin/bash
# install-hooks.sh — install git hooks for the devenv repository
# Run once: ./scripts/install-hooks.sh

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HOOKS_DIR="$REPO_ROOT/.git/hooks"

# ── post-commit hook ───────────────────────────────────────────────────────

cat > "$HOOKS_DIR/post-commit" << 'HOOK'
#!/bin/bash
# Post-commit: gather observations in the background
REPO_ROOT="$(git rev-parse --show-toplevel)"
if [ -f "$REPO_ROOT/scripts/memory-collect.sh" ]; then
    bash "$REPO_ROOT/scripts/memory-collect.sh" &
fi
HOOK
chmod +x "$HOOKS_DIR/post-commit"

echo "Installed post-commit hook"
echo "  $HOOKS_DIR/post-commit"
