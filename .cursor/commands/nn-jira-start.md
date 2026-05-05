# Start Jira From Todos

Create Jira stories from open todo items in `todos/` using the configured Atlassian MCP server, then write the created Jira issue keys back to the todo lines.

## Instructions

1. Confirm that an Atlassian MCP server is available.
   - If Jira MCP tools are not available, tell the user to configure the Atlassian MCP server in Cursor and stop.
2. List existing todo sets by reading markdown files in `todos/*.md`.
3. Find open tasks written as `- [ ] Task description`.
4. Skip any todo that already has a Jira marker matching `<!-- jira: KEY-123 -->`.
5. Group unlinked open todos by todo-set file and existing `##` section.
6. Ask the user what Jira creation context to use for each todo-set file before creating issues:
   - Jira project key
   - Issue type, defaulting to Story if the user does not specify another type
   - Epic, parent, or initiative when relevant
   - Labels, components, priority, assignee, or sprint when relevant
   - Any description or acceptance-criteria rules the user wants applied
7. Summarize the issues that will be created and ask for confirmation before calling Jira MCP tools.
8. For each confirmed todo, create one Jira issue through the Atlassian MCP server:
   - Use the todo text as the Jira summary unless the user gave a different title rule.
   - Include the source todo file and section in the Jira description.
   - Include useful context from nearby section headings, but do not invent requirements.
   - Prefer Story as the issue type unless the user requested another type.
9. After each issue is created, append its key to the exact todo line using this marker:

```markdown
- [ ] Build login flow <!-- jira: PROJ-123 -->
```

10. Preserve existing section headings, section order, task text, and blank-line style.
11. Do not create duplicate Jira issues for todos that already have a Jira marker.
12. If some Jira issues are created and a later creation fails, keep the markers for successfully created issues and clearly tell the user which todos still need attention.
13. After editing, briefly confirm:
   - Which todo files were updated
   - Which Jira issues were created
   - Which todos were skipped because they were already linked or could not be created

## Safety

- Never edit files outside `todos/`.
- Never remove or complete todos while creating Jira issues.
- Never create Jira issues until the user confirms the creation summary.
- If required Jira fields are missing and cannot be inferred from the user's context, ask one concise clarification question before creating issues.

## Examples

- `/nn-jira-start` scans all todo sets and asks for Jira project details before creating issues.
- `/nn-jira-start use project APP for my development todos` creates linked Jira stories for unlinked development todos after confirmation.
- A todo already ending with `<!-- jira: APP-123 -->` is skipped.
