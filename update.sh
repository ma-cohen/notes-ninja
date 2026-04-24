#!/bin/bash
set -e

REPO_URL="https://raw.githubusercontent.com/ma-cohen/notes-ninja/main"

if [ ! -d ".cursor/commands" ]; then
  echo "Error: Run this from your notes directory (where .cursor/commands exists)"
  exit 1
fi

echo "Updating commands..."
curl -fsSL "$REPO_URL/.cursor/commands/nn-todo.md" -o ".cursor/commands/nn-todo.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-add.md" -o ".cursor/commands/nn-add.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-ask.md" -o ".cursor/commands/nn-ask.md"

echo "Done! Commands updated."
