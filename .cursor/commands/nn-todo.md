# Add Todo Items

Add todo items to `todos/main.md` in the current workspace.

## Instructions

1. Use `todos/main.md` as the target todo file.
2. Read the target todo file to see existing sections (marked with `##`).
3. For each todo item in the user's message, analyze the content and determine the best category:
   - Look for keywords to match existing sections
   - Common categories: Shopping, Work, Health, Development, Home, Finance, Personal
4. If a matching section exists, add the todo under that section
5. If no matching section exists, create a new `## Category Name` section
6. Add items as `- [ ] Task description`
7. Use `## Uncategorized` as fallback for ambiguous items
8. Keep `## Completed` section always at the bottom (move `- [x]` items there)

## Category Matching Examples

- "buy milk", "groceries" -> Shopping
- "finish report", "meeting" -> Work
- "call dentist", "gym" -> Health
- "fix bug", "deploy" -> Development
- "clean garage", "fix sink" -> Home

