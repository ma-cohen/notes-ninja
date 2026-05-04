# Create Todo Set

Create a new empty todo set in `todos/`.

## Instructions

1. Interpret the user's message as the todo-set name.
2. Determine the todo-set file name:
   - Use the exact name when the user provides one, converted to kebab-case.
   - Create the file as `todos/<name>.md`.
   - Ask one concise clarification question if no name is provided.
   - Never create files outside `todos/`.
   - Do not overwrite an existing todo-set file.
3. Create the new file with this content:

```markdown
# Todo List

## Uncategorized

## Completed
```

4. Do not add tasks to the new file. Use `/nn-todo` after the list exists.
5. After creating the todo set, briefly confirm the file that was created.

## Safety

- Never overwrite or merge into an existing todo-set file unless the user explicitly confirms exactly how to proceed.
- Never move existing todos or notes. Use `/nn-split-todo` when existing todos should move into a new todo set.

## Examples

- "personal website" creates `todos/personal-website.md`.
- "create todo list kitchen renovation" creates `todos/kitchen-renovation.md`.
