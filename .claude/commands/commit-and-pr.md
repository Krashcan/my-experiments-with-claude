---
description: Write commit message and raise PR to staging for current changes
---

1. Review the diff with `git diff --staged` to understand what changed
2. Write a clear commit message and commit
3. Push — `git push -u origin $(git branch --show-current)`
4. Raise PR to staging with a descriptive title and body explaining what was done and why — `gh pr create --base staging`
5. Report the PR URL
