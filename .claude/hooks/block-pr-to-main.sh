#!/bin/bash
input=$(cat)
cmd=$(echo "$input" | python3 -c "
import sys, json
print(json.load(sys.stdin).get('tool_input', {}).get('command', ''))
" 2>/dev/null)

if echo "$cmd" | grep -qE 'gh pr create.*(--base main|-B main)'; then
  echo '{"block": true, "message": "PRs to main not allowed. Target staging instead: gh pr create --base staging"}' >&2
  exit 2
fi
