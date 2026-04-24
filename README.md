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

## Updating

To get the latest commands, run from your notes directory:

```bash
curl -fsSL https://raw.githubusercontent.com/ma-cohen/notes-ninja/main/update.sh | bash
```

Your notes and todos are never touched - only the `.cursor` folder is updated.

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

## How It Works

- **Todos** are stored in `todos/main.md` as a simple checkbox list
- **Notes** are stored in `notes/` as markdown files, organized by topic
- After each write operation, changes are automatically committed and pushed to GitHub

## File Structure

```
my-notes/
├── .cursor/commands/    # Slash commands
│   ├── nn-todo.md
│   ├── nn-add.md
│   └── nn-ask.md
├── notes/               # Your notes (auto-organized)
└── todos/main.md        # Your todo list
```

## Tips

- Keep your notes atomic - one idea per `/nn-add` command
- Use `/nn-ask` to find things you've forgotten
- Your data is safe in GitHub - commit history preserves everything
