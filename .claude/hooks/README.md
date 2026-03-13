# Branch Protection Hooks

PreToolUse hooks that prevent Claude from pushing directly to protected branches or creating PRs that target `main`.

## How they work

These scripts are meant to be registered as `PreToolUse` hooks (matcher: `Bash`) in `.claude/settings.json`. Claude pipes a JSON payload to stdin before executing any Bash command. Each script parses the `tool_input.command` field and exits with code 2 (plus a `{"block": true, ...}` message on stderr) to block the action.

## Scripts

### block-push-protected.sh

Blocks `git push` to `main` or `staging`. Forces work through feature branches and PRs.

```
git push origin main    # blocked
git push origin staging # blocked
git push origin my-feat # allowed
```

### block-pr-to-main.sh

Blocks `gh pr create` when the base branch is `main`. PRs should target `staging` instead.

```
gh pr create --base main    # blocked
gh pr create --base staging # allowed
```

## Registration

Add to `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": ".claude/hooks/block-push-protected.sh" },
          { "type": "command", "command": ".claude/hooks/block-pr-to-main.sh" }
        ]
      }
    ]
  }
}
```

## Workflow enforced

```
feature branch ──PR──> staging ──PR──> main
```

No direct pushes to `main` or `staging`. No PRs that skip `staging`.
