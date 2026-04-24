#!/bin/bash

# Check for any uncommitted changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

# Stage everything and commit
git add -A
git commit -m "Update notes"
git push

exit 0
