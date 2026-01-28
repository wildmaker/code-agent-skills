---
name: auto-build-execute-item
description: 在 auto build 项目中执行单个 backlog item 的包装流程：从 project 分支创建 task 分支，完成编码后提交 PR 到 project 分支，并按评审意见修复直至可合并。用于 auto-build 的逐项执行阶段。
version: 0.0.0
---

# auto-build-execute-item

## What this skill does
- 以 “一次只做一个 backlog item” 为边界执行开发
- 强制本项目 PR 目标：`task/<backlog-id>` -> `project/<document-name>`
- 复用既有能力：主要委托给 `backlog-item-execute`（其内部会处理 PR 与评审修复）

## Constraints
- 必须只处理一个 backlog item
- PR base 分支必须为本期 `project/<document-name>` 分支（不是 main）
- 修复评审意见时，提交与推送前必须征得用户明确确认

## Allowed commands
- `backlog-item-execute`
- `git`
- `gh`
- `cat`
- `rg`

## Steps
1. 从根目录 `BACKLOG.md` 选择一个 backlog item（ID/描述/期望结果/对应 issue）。
2. 确认当前处于本期 project 分支；否则先切换到 `project/<document-name>`。
3. 调用 `backlog-item-execute` 完成该 item，但明确约束：PR 的 base 分支必须为本期 `project/<document-name>`（不是 main）。
