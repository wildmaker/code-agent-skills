---
name: auto-build-backlog-sync
description: 在 auto build 项目中执行“计划 -> BACKLOG 生成 -> GitHub Issue 同步”的串联流程（design-plan + backlog-generate + backlog-issue-sync），产出可执行的 backlog。用于 auto-build 的准备阶段。
version: 0.0.0
---

# auto-build-backlog-sync

## What this skill does
- 调用 `design-plan` 产出开发计划并收集缺失上下文
- 调用 `backlog-generate` 在仓库根目录 `BACKLOG.md` 追加本项目分组与原子任务
- 调用 `backlog-issue-sync` 为 backlog items 创建 GitHub Issues，并按需回写到 `BACKLOG.md`

## Constraints
- 未完成本阶段前不得开始编码
- 必须使用仓库根目录 `BACKLOG.md`；不要为项目新建子目录或独立 BACKLOG

## Allowed commands
- `design-plan`
- `backlog-generate`
- `backlog-issue-sync`
- `cat`
- `rg`
- `gh`

## Steps
1. 调用 `design-plan`，补齐执行本项目所需的缺失上下文（如需要，向用户提问并等待回答）。
2. 调用 `backlog-generate`，将设计文档拆解为可独立完成的 backlog items，并写入根目录 `BACKLOG.md` 的本项目分组。
3. 调用 `backlog-issue-sync`，为每个 backlog item 创建 Issue；必要时将 issue 编号回写到 `BACKLOG.md`。
4. 验证：`BACKLOG.md` 已包含本项目分组，且 backlog items 与 issues 一一对应后再进入编码阶段。

