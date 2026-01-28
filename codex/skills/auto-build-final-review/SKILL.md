---
name: auto-build-final-review
description: 在 auto build 项目所有 task PR 合并到 project 分支后执行最终复核（design-implementation-review），产出整体对照报告，便于人工集中检查与测试。用于 auto-build 收尾阶段。
version: 0.0.0
---

# auto-build-final-review

## What this skill does
- 确认本期项目的所有 backlog items 已完成并合并到 project 分支
- 调用 `design-implementation-review` 产出“设计 vs 实现”的最终复核报告
- 将项目停留在 project 分支，便于人工集中检查/测试（除非用户明确要求合并到 main）

## Constraints
- 不要自动把 project 分支合并到 main；除非用户明确提出

## Allowed commands
- `design-implementation-review`
- `git`
- `cat`
- `rg`

## Steps
1. 确认本期项目在根目录 `BACKLOG.md` 的分组下所有 items 均为完成状态，且对应 PR 已合并到 project 分支。
2. 切换到 `project/<document-name>` 并拉取最新。
3. 调用 `design-implementation-review` 输出最终复核报告（包含缺口、偏差、风险与建议测试点）。
4. 提醒用户：当前 project 分支用于人工集中检查/测试；如需合并到 main 再另行发起。

