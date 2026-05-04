# Remove Completed Tasks

Remove one or more completed todo items from existing todo sets in `todos/`.

## Instructions

1. List existing todo sets by reading markdown files in `todos/*.md`.
2. Choose where to search:
   - If the user explicitly names an existing todo set, search only that file.
   - If the user does not name a todo set, search all `todos/*.md` files.
   - If the user names a todo set that does not exist, tell them it could not be found and stop.
3. Find open tasks written as `- [ ] Task description`.
4. Interpret the user's message as one or more tasks they finished.
5. Match each finished task to an existing open task:
   - Use exact matches when possible
   - Use clear partial or semantic matches when the user's wording is obviously referring to one task
   - If a requested task matches multiple open tasks, ask one short clarification question before editing
   - If a requested task does not confidently match any open task, tell the user which task could not be found
6. Remove each confidently matched `- [ ]` line from its todo file.
7. Do not move removed tasks to `## Completed`; remove them entirely.
8. Preserve existing section headings, section order, and blank-line style.
9. Keep `## Completed` at the bottom if it exists.
10. After editing, briefly confirm which tasks were removed, from which todo set, and mention any tasks that were not found or need clarification.

## Examples

- "finished buy groceries" removes the matching open grocery task
- "done with call mom and book dentist" removes both matching open tasks
- "finished the report" asks for clarification if multiple report tasks exist
- "finished report in work" searches the existing work todo set only
