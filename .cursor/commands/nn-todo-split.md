# Split Project Todos

Move related todo items from `todos/main.md` into a focused project todo file.

## Instructions

1. Read `todos/main.md` and find open tasks written as `- [ ] Task description`
2. Interpret the user's message as the focus area or project they want to split from the main todo list
3. Identify matching open tasks:
   - Use exact matches when possible
   - Use clear partial or semantic matches when the user's wording obviously refers to specific tasks
   - If the request is ambiguous or matches too many unrelated tasks, ask one short clarification question before editing
4. Choose a destination file in `todos/`:
   - If the user names or tags an existing `todos/b-*.md` file, use that file
   - If the user gives a project name, create a descriptive kebab-case filename from it
   - The destination filename must always start with `b-`, for example `todos/b-kitchen-renovation.md`
5. If the destination file does not exist, plan to create it with this structure:

```markdown
# Todo List

## Uncategorized

## Completed
```

6. Before moving anything, ask the user to confirm:
   - The destination file
   - The exact `- [ ]` tasks that will move from `todos/main.md`
7. Do not edit any files until the user explicitly approves the move
8. After approval:
   - Create the destination file if needed
   - Remove each approved `- [ ]` task line from `todos/main.md`
   - Add each task to the destination file as `- [ ] Task description`
   - Preserve the original task text
   - Put tasks under matching existing `##` sections when possible
   - Create new `## Category Name` sections when helpful
   - Use `## Uncategorized` as fallback for ambiguous items
9. Preserve existing section headings, section order, and blank-line style
10. Keep `## Completed` at the bottom of both todo files if it exists
11. After editing, briefly confirm which tasks moved and where they moved

## Examples

- "split the kitchen renovation todos" moves matching open tasks into a file like `todos/b-kitchen-renovation.md`
- "move auth work to @todos/b-app-launch.md" moves matching open tasks into `todos/b-app-launch.md`
- "split dentist and gym tasks into health project" asks for confirmation before creating a file like `todos/b-health-project.md`
