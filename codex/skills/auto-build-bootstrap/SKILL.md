---
name: auto-build-bootstrap
description: 初始化一次 auto build 项目（确认设计文档与项目根目录、创建 project 分支、确定后续所有 task PR 的 base 分支）。用于 auto-build 流程的第 0 阶段。
version: 0.0.0
---

# auto-build-bootstrap

## What this skill does
- 明确本次 auto build 的设计文档路径与项目根目录
- 创建并切换到 `project/<document-name>` 作为本期项目承载分支
- 固化分支/PR 规则：所有 `task/<backlog-id>` 的 PR 必须以该 project 分支为 base（不是 main）

## Constraints
- 不得开始编码
- 未确认 `project/<document-name>` 的命名与目标仓库时必须先询问

## Allowed commands
- `git`
- `cat`
- `rg`

## Steps
1. 确认设计文档路径（相对/绝对）与项目根目录（默认文档所在目录）。
2. 生成并与用户确认 `project/<document-name>` 分支名。
3. 创建并切换到 project 分支（如已存在，先确认是否复用或新建）。
4. 明确并记录：后续所有 task 分支 PR 的 base 分支 = 该 project 分支（不是 main）。

