# Split Project

Create a new project folder in this repository and move the relevant todos and notes into it.

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
5. Review `notes/` for relevant notes:
   - List markdown files in `notes/`.
   - Read frontmatter, headings, and entries to understand each note.
   - Treat a full note file as relevant only when the whole file is clearly about the project.
   - Treat individual entries or sections as relevant when a mixed note contains clearly project-specific content.
   - If relevance is uncertain, include it in the confirmation as optional or ask before editing.
6. Before editing, ask the user to confirm:
   - The project folder that will be created.
   - The exact todo lines that will move from `todos/main.md`.
   - The note files, sections, or entries that will move from `notes/`.
   - Any notes that looked related but were left out because they were ambiguous.
7. Do not edit any files until the user explicitly approves the split.
8. After approval, create the project structure:

```text
<project-name>/
├── .cursor/
├── notes/
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
12. Move the approved notes:
   - Move entire note files when all meaningful content in the file belongs to the project.
   - For mixed note files, copy only the approved relevant sections or dated entries into an appropriate file under `<project-name>/notes/`, then remove those exact sections or entries from the parent note file.
   - Preserve frontmatter, titles, tags, dates, headings, and meaningful context.
   - If creating a new project note from extracted entries, use descriptive kebab-case filenames and valid frontmatter.
   - Remove a parent note file only when all meaningful content has moved.
13. Preserve existing section headings, section order, and blank-line style in edited parent files.
14. After editing, briefly confirm:
   - The project folder created.
   - The todos moved.
   - The notes moved.
   - Any relevant notes that were intentionally left in place.

## Safety

- Never move completed todos unless the user explicitly asks.
- Never move note content that is only weakly related without confirmation.
- Never delete note content unless it was moved into the project or is an exact duplicate created during the split.
- Never overwrite an existing project folder.

## Examples

- "split the kitchen renovation work into a project" creates a folder like `kitchen-renovation/`, moves matching open todos into `kitchen-renovation/todos/main.md`, and moves relevant notes into `kitchen-renovation/notes/`.
- "create project app launch from the launch todos and notes" creates a folder like `app-launch/` and asks for confirmation before moving matched todos and notes.
