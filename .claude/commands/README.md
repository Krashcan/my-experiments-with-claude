# Slash Commands

Project-level slash commands live in `.claude/commands/` as Markdown files. Each file becomes a `/project:command-name` command in Claude Code.

## Commands

### /project:commit-and-pr

Commits staged changes and raises a PR to `staging` in one step.

**What it does:**

1. Reviews `git diff --staged` to understand the changes
2. Writes a clear commit message and commits
3. Pushes the current branch to origin
4. Creates a PR targeting `staging` with a descriptive title and body
5. Reports the PR URL

**Usage:**

Stage your changes, then run:

```
/project:commit-and-pr
```

**How it fits with hooks:**

The hooks in `.claude/hooks/` block pushes to protected branches and PRs to `main`. This command is the guided path through those guardrails — it always targets `staging` as the PR base.

```
feature branch ──/project:commit-and-pr──> staging ──PR──> main
```
