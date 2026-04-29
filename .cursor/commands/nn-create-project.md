# Create Project

Create an empty Notes Ninja project folder in this repository.

## Instructions

1. Interpret the user's message as the project name.
2. Determine the project folder name:
   - Use the exact project name when the user provides one, converted to kebab-case for the folder.
   - Ask one concise clarification question if no name is provided.
   - Never create the project outside the current workspace/repository.
   - Do not overwrite an existing folder.
3. Create this project structure:

```text
<project-name>/
├── .cursor/
├── notes/
└── todos/
    └── main.md
```

4. Copy the current workspace's `.cursor` folder to `<project-name>/.cursor` so the destination contains the same files as the source `.cursor` folder, not a nested `.cursor/.cursor`.
5. Create `<project-name>/todos/main.md` with this content:

```markdown
# Todo List

## Uncategorized

## Completed
```

6. Leave `<project-name>/notes/` empty.
7. After creating the project, briefly confirm the folder name and the files created.

## Safety

- Ask before editing if the requested folder name is ambiguous.
- Never overwrite or merge into an existing folder unless the user explicitly confirms exactly how to proceed.
- Never move existing todos or notes. Use `/nn-split-project` when existing work should move into the new project.

## Examples

- "personal website" creates `personal-website/`.
- "create project kitchen renovation" creates `kitchen-renovation/`.
