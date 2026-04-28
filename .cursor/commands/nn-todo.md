# Add Todo Items

Add todo items to `todos/main.md` or to a tagged project todo file.

## Instructions

1. Determine the target todo file:
   - If the user tags exactly one `todos/b-*.md` file, use that file
   - If the user does not tag a project todo file, use `todos/main.md`
2. Read the target todo file to see existing sections (marked with `##`)
3. For each todo item in the user's message, remove any file tag from the task text, then analyze the content and determine the best category:
   - Look for keywords to match existing sections
   - Common categories: Shopping, Work, Health, Development, Home, Finance, Personal
4. If a matching section exists, add the todo under that section
5. If no matching section exists, create a new `## Category Name` section
6. Add items as `- [ ] Task description`
7. Use `## Uncategorized` as fallback for ambiguous items
8. Keep `## Completed` section always at the bottom (move `- [x]` items there)

## Project Todo Files

- Focused project todo files live in `todos/`
- Project todo filenames must start with `b-`, for example `todos/b-app-launch.md`
- Use `/nn-todo-split` to move related tasks from `todos/main.md` into a project todo file

## Category Matching Examples

- "buy milk", "groceries" -> Shopping
- "finish report", "meeting" -> Work
- "call dentist", "gym" -> Health
- "fix bug", "deploy" -> Development
- "clean garage", "fix sink" -> Home

