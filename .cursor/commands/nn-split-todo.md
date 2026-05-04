# Split Todo Set

Create a new todo set in `todos/` and move matching open todos into it.

## Instructions

1. Interpret the user's message as the todo set to split out.
2. Determine the new todo-set file name:
   - Use an explicit name from the user when provided.
   - Otherwise derive a short descriptive kebab-case name from the todo focus.
   - Ask one concise clarification question if the todo-set name or focus is unclear.
   - Create the file as `todos/<name>.md`.
   - Never create files outside `todos/`.
   - Do not overwrite an existing todo-set file.
3. Determine where to search for source todos:
   - If the user explicitly names an existing source todo set, read that file.
   - Otherwise read all existing `todos/*.md` files.
   - Do not use the new destination file as a source.
4. Find open tasks written as `- [ ] Task description`.
5. Identify todos that belong in the new todo set:
   - Use exact matches when possible.
   - Use clear partial or semantic matches when the user's wording obviously refers to specific tasks.
   - Do not move unrelated tasks just because they share a broad category.
   - If matching is ambiguous or too broad, ask one short clarification question before editing.
6. Before editing, ask the user to confirm:
   - The todo-set file that will be created.
   - The source todo-set file or files that will be edited.
   - The exact todo lines that will move.
7. Do not edit any files until the user explicitly approves the split.
8. After approval, create the new todo-set file with this structure:

```markdown
# Todo List

## Uncategorized

## Completed
```

9. Move the approved todos:
   - Remove each approved `- [ ]` line from its source todo-set file.
   - Add each task to the new todo-set file as `- [ ] Task description`.
   - Preserve the original task text.
   - Put tasks under matching existing `##` sections when useful.
   - Use `## Uncategorized` as fallback.
   - Keep `## Completed` at the bottom.
10. Preserve existing section headings, section order, and blank-line style in edited source files.
11. After editing, briefly confirm:
   - The todo-set file created.
   - The todos moved.
   - The source todo-set file or files updated.

## Safety

- Never move completed todos unless the user explicitly asks.
- Never move, copy, or delete note content during a todo split.
- Never create directories outside `todos/`.
- Never overwrite an existing todo-set file.

## Examples

- "split the kitchen renovation work into a todo set" creates `todos/kitchen-renovation.md`, asks for confirmation, then moves matching open todos into it.
- "split app launch from main" creates a file like `todos/app-launch.md` and asks for confirmation before moving matched todos from `todos/main.md`.
