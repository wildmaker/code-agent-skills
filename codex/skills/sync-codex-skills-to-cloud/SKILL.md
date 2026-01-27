---
name: sync-codex-skills-to-cloud
description: Migrate local non-symlink Codex skills from ~/.codex/skills into the skills-sync repo, replace them with symlinks, commit/push new skills, and sync to .cursor/skills. Use when asked to sync Codex skills to the cloud or to migrate local skills into the repo.
---

# Sync Codex Skills To Cloud

## Workflow

1. Run the migration script:

```bash
codex/skills/sync-codex-skills-to-cloud/scripts/migrate_local_skills.sh
```

- It moves non-symlink entries (excluding dot-prefixed directories) from `~/.codex/skills` into `codex/skills` and replaces them with symlinks.
- It prints `MOVED: <name>` for each migrated entry and `NO_CHANGES` when nothing moved.
- If it prints `CONFLICT:` for any name, stop and ask the user how to proceed before making changes.

2. If new skills were moved, commit and push from the repo root following the repo's commit conventions.

3. Run the cursor sync script to keep `.cursor/skills` aligned:

```bash
codex/skills/sync-with-cloud/scripts/ensure_cursor_skills_sync.sh
```
