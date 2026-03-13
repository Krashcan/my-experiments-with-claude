#!/bin/bash
input=$(cat)
cmd=$(echo "$input" | python3 -c "
import sys, json
print(json.load(sys.stdin).get('tool_input', {}).get('command', ''))
" 2>/dev/null)

if echo "$cmd" | grep -qE 'git push.*(origin )?(main|staging)'; then
  echo '{"block": true, "message": "Direct push to main/staging not allowed. Use a feature branch and PR to staging."}' >&2
  exit 2
fi
