#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$REPO_DIR/codex/skills"
CURSOR_DIR="$HOME/.cursor"
CURSOR_SKILLS="$CURSOR_DIR/skills"

mkdir -p "$CURSOR_DIR"

if [ -e "$CURSOR_SKILLS" ] && [ ! -L "$CURSOR_SKILLS" ]; then
  backup_path="$CURSOR_DIR/skills.bak.$(date +%Y%m%d%H%M%S)"
  mv "$CURSOR_SKILLS" "$backup_path"
  echo "[WARN] Moved existing skills folder to $backup_path"
fi

ln -sfn "$TARGET_DIR" "$CURSOR_SKILLS"

echo "[OK] Cursor skills symlinked to $TARGET_DIR"
