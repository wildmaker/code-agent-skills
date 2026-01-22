#!/usr/bin/env bash
set -euo pipefail

#######################################
# 配置区（按需修改）
#######################################

# repo 根目录（不是 skills 目录）
REPO_ROOT="/Users/wildmaker/Documents/Projects/skills-sync"

# repo 中 codex skills 的最终位置
REPO_CODEX_SKILLS_DIR="$REPO_ROOT/codex/skills"

# Cursor 本地 skills 目录
CURSOR_SKILLS_DIR="$HOME/.cursor/skills"

#######################################
# 预检查
#######################################

echo "Repo codex skills dir : $REPO_CODEX_SKILLS_DIR"
echo "Cursor skills dir     : $CURSOR_SKILLS_DIR"
echo

if [[ ! -d "$REPO_CODEX_SKILLS_DIR" ]]; then
  echo "❌ Repo codex skills 目录不存在"
  exit 1
fi

mkdir -p "$CURSOR_SKILLS_DIR"

#######################################
# 主逻辑
#######################################

for SKILL_PATH in "$REPO_CODEX_SKILLS_DIR"/*; do
  SKILL_NAME="$(basename "$SKILL_PATH")"
  TARGET_PATH="$REPO_CODEX_SKILLS_DIR/$SKILL_NAME"
  LINK_PATH="$CURSOR_SKILLS_DIR/$SKILL_NAME"

  # 跳过隐藏/系统目录（如 .system）
  if [[ "$SKILL_NAME" == .* ]]; then
    echo "↪ 跳过（系统目录）: $SKILL_NAME"
    continue
  fi

  # 只处理目录
  [[ -d "$SKILL_PATH" ]] || continue

  if [[ -L "$LINK_PATH" ]]; then
    LINK_TARGET="$(readlink "$LINK_PATH")"
    if [[ "$LINK_TARGET" == "$TARGET_PATH" ]]; then
      echo "↪ 已存在软链接: $SKILL_NAME"
      continue
    fi
    echo "⚠️  已有软链接但指向不同目标: $SKILL_NAME"
    echo "   当前指向: $LINK_TARGET"
    echo "   期望指向: $TARGET_PATH"
    continue
  fi

  if [[ -e "$LINK_PATH" ]]; then
    echo "⚠️  已存在非软链接条目，跳过: $SKILL_NAME"
    continue
  fi

  ln -s "$TARGET_PATH" "$LINK_PATH"
  echo "✅ 创建软链接: $SKILL_NAME"

done

echo
echo "✅ 完成"
