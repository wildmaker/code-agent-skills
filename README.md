# README

## 整体设计思想

1. codex 始终保持 `skills` 与 `repo/codex/` 软链接，也就是真实的 skill 目录只存放在 repo 中
2. 使用/codex/skills/sync-with-cloud/scripts 下的脚本将文件复制到 ~/.cursor/skills
3. 除了 claude 外的其他 agent 工具的 skill 也软链接到 `repo/codex`

