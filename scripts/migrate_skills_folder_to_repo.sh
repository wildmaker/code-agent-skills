#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$HOME/.codex/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DEST_DIR="$REPO_DIR/codex/skills"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source skills folder not found: $SOURCE_DIR" >&2
  exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
  echo "Destination skills folder not found: $DEST_DIR" >&2
  exit 1
fi

if [ -t 0 ]; then
  read -r -p "Migrate skills from $SOURCE_DIR to $DEST_DIR? [yes/no] " reply
  if [ "$reply" != "yes" ]; then
    echo "Aborted."
    exit 1
  fi
fi

for skill_path in "$SOURCE_DIR"/*; do
  skill_name="$(basename "$skill_path")"

  if [ "$skill_name" = ".system" ] || [ "$skill_name" = "LICENSE" ]; then
    continue
  fi

  if [ -L "$skill_path" ]; then
    # Skip symlinks pointing back into the repo to avoid rsync conflicts.
    continue
  fi

  if [ ! -f "$skill_path/SKILL.md" ]; then
    # Only migrate fully-defined skills.
    continue
  fi

  rsync -a "$skill_path" "$DEST_DIR/"
done

echo "[OK] Skills migrated to $DEST_DIR"
