#!/bin/bash
set -e

REPO_URL="https://raw.githubusercontent.com/ma-cohen/notes-ninja/main"
DIR_NAME="${1:-my-notes}"

if [ -d "$DIR_NAME" ]; then
  echo "Error: Directory '$DIR_NAME' already exists"
  exit 1
fi

echo "Creating $DIR_NAME..."
mkdir -p "$DIR_NAME/.cursor/commands" "$DIR_NAME/todos" "$DIR_NAME/notes"

echo "Downloading commands..."
curl -fsSL "$REPO_URL/.cursor/commands/nn-todo.md" -o "$DIR_NAME/.cursor/commands/nn-todo.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-remove-task.md" -o "$DIR_NAME/.cursor/commands/nn-remove-task.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-add.md" -o "$DIR_NAME/.cursor/commands/nn-add.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-ask.md" -o "$DIR_NAME/.cursor/commands/nn-ask.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-organize.md" -o "$DIR_NAME/.cursor/commands/nn-organize.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-just-do-it.md" -o "$DIR_NAME/.cursor/commands/nn-just-do-it.md"
curl -fsSL "$REPO_URL/.cursor/commands/nn-push.md" -o "$DIR_NAME/.cursor/commands/nn-push.md"

echo "Setting up starter files..."
curl -fsSL "$REPO_URL/todos/main.md" -o "$DIR_NAME/todos/main.md"

cd "$DIR_NAME"
git init -q

echo ""
echo "Done! Your notes are ready at ./$DIR_NAME"
echo ""
echo "Next steps:"
echo "  cd $DIR_NAME"
echo "  cursor ."
echo ""
echo "To sync with GitHub:"
echo "  1. Create a new repo on GitHub"
echo "  2. git remote add origin https://github.com/YOU/YOUR-REPO.git"
echo "  3. git add . && git commit -m 'Initial setup'"
echo "  4. git push -u origin main"
echo ""
echo "After that, run /nn-push in Cursor whenever you want to commit and push changes."
