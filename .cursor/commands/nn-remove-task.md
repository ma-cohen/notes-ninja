# Remove Completed Tasks

Remove one or more completed todo items from `todos/main.md`.

## Instructions

1. Read `todos/main.md` and find open tasks written as `- [ ] Task description`
2. Interpret the user's message as one or more tasks they finished
3. Match each finished task to an existing open task:
   - Use exact matches when possible
   - Use clear partial or semantic matches when the user's wording is obviously referring to one task
   - If a requested task matches multiple open tasks, ask one short clarification question before editing
   - If a requested task does not confidently match any open task, tell the user which task could not be found
4. Remove each confidently matched `- [ ]` line from `todos/main.md`
5. Do not move removed tasks to `## Completed`; remove them entirely
6. Preserve existing section headings, section order, and blank-line style
7. Keep `## Completed` at the bottom if it exists
8. After editing, briefly confirm which tasks were removed and mention any tasks that were not found or need clarification

## Examples

- "finished buy groceries" removes the matching open grocery task
- "done with call mom and book dentist" removes both matching open tasks
- "finished the report" asks for clarification if multiple report tasks exist
