# Add Todo Items

Add todo items to the todo list at `todos/main.md`.

## Instructions

1. Read `todos/main.md` to see existing sections (marked with `##`)
2. For each todo item in the user's message, analyze its content and determine the best category:
   - Look for keywords to match existing sections
   - Common categories: Shopping, Work, Health, Development, Home, Finance, Personal
3. If a matching section exists, add the todo under that section
4. If no matching section exists, create a new `## Category Name` section
5. Add items as `- [ ] Task description`
6. Use `## Uncategorized` as fallback for ambiguous items
7. Keep `## Completed` section always at the bottom (move `- [x]` items there)

## Category Matching Examples

- "buy milk", "groceries" → Shopping
- "finish report", "meeting" → Work  
- "call dentist", "gym" → Health
- "fix bug", "deploy" → Development
- "clean garage", "fix sink" → Home

## After Adding

1. Stage the changed files: `git add .`
2. Commit with message: `git commit -m "Add todo: brief description"`
3. Push to remote: `git push`
