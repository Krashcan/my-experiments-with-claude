# Hooks

This directory contains simple Python and Go scripts used to validate that Claude Code hooks fire correctly. When Claude edits or writes files, linting runs automatically. When Claude finishes a turn, tests run automatically.

## Configuration

Hooks are stored in `.claude/settings.json` under the `"hooks"` key.

## Hooks in this project

### PostToolUse (matcher: `Edit|Write`)
Runs `make lint` every time Claude uses the Edit or Write tool. This ensures that any file Claude creates or modifies is immediately checked for syntax errors — Python via `py_compile`, Go via `go vet`.

### Stop (matcher: all)
Runs `make test` when Claude finishes a turn. This closes the TDD feedback loop — after Claude writes code, the full test suite runs automatically so failures are caught before moving on.

### Notification (matcher: all)
Triggers a macOS notification ("Claude needs your input") and terminal bell when Claude sends a notification event (e.g., permission prompts, idle prompts). Useful for knowing when Claude is waiting on you while you're in another window.

## Files

- `hello.py` — prints "Hello from hooks experiment"
- `hello.go` — prints "Hello from hooks experiment"
- `test_hello.py` — pytest test for hello.py
- `hello_test.go` — Go test for hello.go
