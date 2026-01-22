---
name: sync-with-cloud
description: Update the local skills-sync repo, run the migration script to move codex/skills folders into the repo, then push updates.
---

# Sync Skills With Cloud

Use this skill when asked to keep the skills-sync repo in `/Users/wildmaker/Documents/Projects/skills-sync` up to date (git pull, local updates), then call the migration script that moves skill folders under `./codex/skills` into the skills-sync repo, and finally push updates.

## Quick start

1. In the skills-sync repo, update the local repo first:

```bash
git fetch
git pull --rebase
```

2. Run the migration script from this skill:

```bash
./scripts/migrate_skills_folder_to_repo.sh
```

3. If the migration script prompts for confirmation, answer `yes`.

4. Stage and commit changes, then push to publish the skills-sync updates to the remote repo:

```bash
git add .
git commit -m "<type>(<id>): <summary>"
git push
```

## What the script does

- `git fetch` and `git pull --rebase` in the skills-sync repo.
- If conflicts happen during rebase, resolve them, then continue.
- Run `migrate_skills_folder_to_repo.sh` to move one or many folders from `./codex/skills` into the skills-sync repo.
- `git add .`, `git commit`, then `git push` to keep the cloud repo updated.

## Notes

- The migration script is `./scripts/migrate_skills_folder_to_repo.sh`.
- This skill should not modify any files outside the skills-sync repo and `~/.codex/skills`.
- If the repo path or migration script changes, update the script in `scripts/`.
