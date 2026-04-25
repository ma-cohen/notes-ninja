# Notes Ninja

A personal assistant for Cursor that manages your notes and todos using slash commands.

## Installation

Run the install script with your preferred folder name:

```bash
curl -fsSL https://raw.githubusercontent.com/ma-cohen/notes-ninja/main/install.sh | bash -s my-notes
cd my-notes
cursor .
```

To sync your notes with GitHub:

1. Create a new repository on GitHub (any name you like)
2. Connect and push:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/your-repo-name.git
   git add . && git commit -m "Initial setup"
   git push -u origin main
   ```

That's it! The commands are ready to use.

After you connect a GitHub remote, use `/nn-push` in Cursor whenever you want to commit and push your latest notes and todos.

## Updating

To get the latest commands, run from your notes directory:

```bash
curl -fsSL https://raw.githubusercontent.com/ma-cohen/notes-ninja/main/update.sh | bash
```

Your notes and todos are never touched - only the `.cursor` folder is updated.

If you installed an older version that auto-committed after changes, updating replaces that behavior with the manual `/nn-push` command.

## Commands

Type `/` in chat to see available commands:

### /nn-todo - Add Todo Items

```
/nn-todo buy groceries
```

```
/nn-todo call mom, finish report, book dentist
```

### /nn-add - Add Notes/Ideas

```
/nn-add learned that Python decorators are just syntactic sugar for higher-order functions
```

```
/nn-add idea: app that tracks water intake
```

The assistant will automatically find the best file to add your note to, or create a new one if needed.

### /nn-ask - Query Your Notes

```
/nn-ask what ideas do I have about apps?
```

```
/nn-ask what did I learn about Python?
```

```
/nn-ask what todos do I have?
```

### /nn-just-do-it - Interactive Task Coach

```
/nn-just-do-it
```

The assistant will review your open todos, help you pick one mission to do now, and wait for you to report back. When you finish, it removes that mission from `todos/main.md`.

### /nn-push - Commit and Push

```
/nn-push
```

The assistant will review your repository changes, create a meaningful commit, and push it to GitHub. You decide when to run it.

## How It Works

- **Todos** are stored in `todos/main.md` as a simple checkbox list
- **Notes** are stored in `notes/` as markdown files, organized by topic
- **Syncing** happens when you run `/nn-push`, so commits and pushes are always user-initiated

## File Structure

```
my-notes/
├── .cursor/commands/    # Slash commands
│   ├── nn-todo.md
│   ├── nn-add.md
│   ├── nn-ask.md
│   ├── nn-just-do-it.md
│   └── nn-push.md
├── notes/               # Your notes (auto-organized)
└── todos/main.md        # Your todo list
```

## Tips

- Keep your notes atomic - one idea per `/nn-add` command
- Use `/nn-ask` to find things you've forgotten
- Run `/nn-push` when you want to save your latest changes to GitHub
- Your data is safe in GitHub - commit history preserves everything
