# Notes Ninja

A personal assistant for Cursor that manages your notes and todos using slash commands.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/notes-ninja.git
   cd notes-ninja
   ```

2. Open in Cursor:
   ```bash
   cursor .
   ```

3. Set up your remote (to sync your notes):
   ```bash
   git remote set-url origin https://github.com/YOUR_USERNAME/notes-ninja.git
   ```

That's it! The commands are ready to use.

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
notes-ninja/
├── .cursor/commands/    # Slash commands
│   ├── nn-todo.md
│   ├── nn-add.md
│   └── nn-ask.md
├── notes/               # Your notes (auto-organized)
├── todos/main.md        # Your todo list
└── README.md
```

## Tips

- Keep your notes atomic - one idea per `/nn-add` command
- Use `/nn-ask` to find things you've forgotten
- Your data is safe in GitHub - commit history preserves everything
