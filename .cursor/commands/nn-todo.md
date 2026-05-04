# Add Todo Items

Add todo items to an existing todo set in `todos/`.

## Instructions

1. List existing todo sets by reading markdown files in `todos/*.md`.
2. Choose the target todo file:
   - If the user explicitly names an existing todo set, use that file.
   - Match names by file name, title, or obvious wording, for example "work", "work todo", or `todos/work.md`.
   - If the user names a todo set that does not exist, do not create it. Tell the user to run `/nn-new-todo <name>` first, or ask whether to add the item to `todos/main.md`.
   - If no todo set is explicit, infer the best existing todo set from the task wording and file names.
   - If inference is unclear, use `todos/main.md`.
3. Read the target todo file to see existing sections (marked with `##`).
4. For each todo item in the user's message, analyze the content and determine the best category:
   - Look for keywords to match existing sections
   - Common categories: Shopping, Work, Health, Development, Home, Finance, Personal
5. If a matching section exists, add the todo under that section.
6. If no matching section exists, create a new `## Category Name` section.
7. Add items as `- [ ] Task description`.
8. Use `## Uncategorized` as fallback for ambiguous items.
9. Keep `## Completed` section always at the bottom (move `- [x]` items there).
10. After editing, briefly confirm which todo set received the new item or items.

## Safety

- Never create a new todo-set file from `/nn-todo`; use `/nn-new-todo` for that.
- Never edit files outside `todos/`.

## Category Matching Examples

- "buy milk", "groceries" -> Shopping
- "finish report", "meeting" -> Work
- "call dentist", "gym" -> Health
- "fix bug", "deploy" -> Development
- "clean garage", "fix sink" -> Home

