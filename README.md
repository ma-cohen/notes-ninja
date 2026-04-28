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

```
/nn-todo @todos/b-app-launch.md follow up with designer
```

The assistant adds todos to `todos/main.md` by default. When you tag one project todo file like `todos/b-app-launch.md`, it adds the todo there instead.

### /nn-todo-split - Split Project Todos

```
/nn-todo-split move the app launch tasks into their own project
```

```
/nn-todo-split split kitchen renovation todos into b-kitchen-renovation
```

The assistant finds matching open tasks in `todos/main.md`, proposes a focused project file whose name starts with `b-`, and asks you to confirm before moving anything.

### /nn-remove-task - Remove Completed Todo Items

```
/nn-remove-task finished buy groceries
```

```
/nn-remove-task done with call mom and book dentist
```

The assistant will remove matching open tasks from `todos/main.md`. You can remove one task or several at once.

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

### /nn-organize - Reorganize Notes

```
/nn-organize combine my Python notes into one file
```

```
/nn-organize split mixed app ideas into separate topic files
```

The assistant will reorganize files in `notes/` based on your request while preserving note content, dates, and frontmatter.

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
- **Project todos** are stored in focused `todos/b-*.md` files and can receive new tasks when tagged with `/nn-todo`
- **Notes** are stored in `notes/` as markdown files, organized by topic and reorganized with `/nn-organize` when needed
- **Syncing** happens when you run `/nn-push`, so commits and pushes are always user-initiated

## File Structure

```
my-notes/
├── .cursor/commands/    # Slash commands
│   ├── nn-todo.md
│   ├── nn-todo-split.md
│   ├── nn-remove-task.md
│   ├── nn-add.md
│   ├── nn-ask.md
│   ├── nn-organize.md
│   ├── nn-just-do-it.md
│   └── nn-push.md
├── notes/               # Your notes (auto-organized)
└── todos/
    ├── main.md          # Your main todo list
    └── b-project-name.md # Example focused project todo list
```

## Tips

- Keep your notes atomic - one idea per `/nn-add` command
- Use `/nn-todo-split` when `todos/main.md` gets crowded with one project's work
- Use `/nn-ask` to find things you've forgotten
- Use `/nn-organize` when related notes should be combined, split, renamed, or moved
- Run `/nn-push` when you want to save your latest changes to GitHub
- Your data is safe in GitHub - commit history preserves everything
