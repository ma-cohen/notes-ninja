# Split Project

Create a new project folder in this repository and move the relevant open todos into it.

## Instructions

1. Interpret the user's message as the project to split out.
2. Determine the project folder name:
   - Use an explicit name from the user when provided.
   - Otherwise derive a short descriptive kebab-case name from the project focus.
   - Ask one concise clarification question if the project name or focus is unclear.
   - Never create the project outside the current workspace/repository.
   - Do not overwrite an existing folder.
3. Read `todos/main.md` and find open tasks written as `- [ ] Task description`.
4. Identify todos that belong in the new project:
   - Use exact matches when possible.
   - Use clear partial or semantic matches when the user's wording obviously refers to specific tasks.
   - Do not move unrelated tasks just because they share a broad category.
   - If matching is ambiguous or too broad, ask one short clarification question before editing.
5. Do not review, copy, move, or delete anything in `notes/`. Notes stay in the parent workspace's global knowledge base.
6. Before editing, ask the user to confirm:
   - The project folder that will be created.
   - The exact todo lines that will move from `todos/main.md`.
7. Do not edit any files until the user explicitly approves the split.
8. After approval, create the project structure:

```text
<project-name>/
├── .cursor/
└── todos/
    └── main.md
```

9. Copy the current workspace's `.cursor` folder to `<project-name>/.cursor` so the destination contains the same files as the source `.cursor` folder, not a nested `.cursor/.cursor`.
10. Create `<project-name>/todos/main.md` using this structure:

```markdown
# Todo List

## Uncategorized

## Completed
```

11. Move the approved todos:
   - Remove each approved `- [ ]` line from the parent `todos/main.md`.
   - Add each task to `<project-name>/todos/main.md` as `- [ ] Task description`.
   - Preserve the original task text.
   - Put tasks under matching existing `##` sections when useful.
   - Use `## Uncategorized` as fallback.
   - Keep `## Completed` at the bottom.
12. Preserve existing section headings, section order, and blank-line style in edited parent files.
13. After editing, briefly confirm:
   - The project folder created.
   - The todos moved.
   - That notes were left in the parent workspace.

## Safety

- Never move completed todos unless the user explicitly asks.
- Never move, copy, or delete note content during a project split.
- Never overwrite an existing project folder.

## Examples

- "split the kitchen renovation work into a project" creates a folder like `kitchen-renovation/`, moves matching open todos into `kitchen-renovation/todos/main.md`, and leaves notes in the parent workspace.
- "create project app launch from the launch todos" creates a folder like `app-launch/` and asks for confirmation before moving matched todos.
