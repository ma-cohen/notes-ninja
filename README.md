# Notes Ninja

A personal assistant for Cursor that manages your notes and todos using simple commands.

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

That's it! The assistant is ready to use.

## Commands

### #todo - Add Todo Items

```
#todo buy groceries
```

Add multiple at once:
```
#todo batch
- call mom
- finish report
- book dentist appointment
```

### #add - Add Notes/Ideas

```
#add learned that Python decorators are just syntactic sugar for higher-order functions
```

Add multiple at once:
```
#add batch
- idea: app that tracks water intake
- remember: meeting with John next Tuesday
- tip: use `git stash` to save uncommitted changes
```

The assistant will automatically find the best file to add your note to, or create a new one if needed.

### #ask - Query Your Notes

```
#ask what ideas do I have about apps?
#ask what did I learn about Python?
#ask what todos do I have?
```

## How It Works

- **Todos** are stored in `todos/main.md` as a simple checkbox list
- **Notes** are stored in `notes/` as markdown files, organized by topic
- After each write operation, changes are automatically committed and pushed to GitHub

## File Structure

```
notes-ninja/
├── .cursor/rules/       # Cursor rules (the assistant brain)
├── notes/               # Your notes (auto-organized)
├── todos/main.md        # Your todo list
└── README.md
```

## Tips

- Keep your notes atomic - one idea per `#add` command
- Use `#ask` to find things you've forgotten
- Your data is safe in GitHub - commit history preserves everything
