# Gather Jira Data For Todos

Only gather related Jira findings for one todo file using the configured Atlassian MCP server, then write the findings under `## Jira data` in that todo file.

## Instructions

1. Confirm that an Atlassian MCP server is available.
   - If Jira MCP tools are not available, tell the user to configure the Atlassian MCP server in Cursor and stop.
2. List existing todo sets by reading markdown files in `todos/*.md`.
3. Choose exactly one target todo file:
   - If the user provides a path like `todos/work.md`, use that file.
   - If the user names an existing todo set, match it by file name, title, or obvious wording.
   - If no todo file is explicit and there is only one todo file, use it.
   - If no todo file is explicit and there are multiple candidates, ask one concise clarification question.
   - If the named todo file does not exist, tell the user it could not be found and stop.
4. Read the target todo file and collect context from:
   - Open tasks written as `- [ ] Task description`
   - Completed tasks written as `- [x] Task description` when they clarify the project context
   - Existing `##` section headings
   - Any existing `## Jira data` section, so it can be refreshed instead of duplicated
5. Search Jira through the Atlassian MCP server for related issues using:
   - Todo text
   - Section names
   - Existing Jira issue keys mentioned anywhere in the todo file
   - Project keys, product names, labels, people, or other obvious hints from the user's request and todo file
6. Gather findings only; do not change Jira issues. For each related Jira issue, collect:
   - Issue key
   - Summary
   - Status
   - Assignee when available
   - Priority, labels, parent, epic, sprint, or fix version when relevant
   - A short explanation of why the issue appears connected to this todo list
7. Update the target todo file by adding or replacing a `## Jira data` section with a markdown list:

```markdown
## Jira data

- `APP-123`: Issue summary - status, assignee, and why it appears related to this todo list.
- `APP-456`: Issue summary - status, assignee, and relevant connection.
```

8. If no related Jira issues are found, still add or replace `## Jira data` with a clear empty-result list item:

```markdown
## Jira data

- No related Jira issues found.
```

9. Preserve existing section headings, section order, task text, checkbox state, and blank-line style outside the `## Jira data` section.
10. After editing, briefly confirm:
   - Which todo file was updated
   - How many Jira issues were listed
   - Any uncertainty or search limits that might affect the findings

## Safety

- Never edit files outside `todos/`.
- Never create Jira issues.
- Never transition, assign, comment on, link, or otherwise update Jira issues.
- Never remove, complete, rewrite, or reorder todos while gathering Jira data.
- Never append inline Jira markers to todo lines from this command.
- Prefer asking one short clarification question over guessing when the target todo file is unclear.

## Examples

- `/nn-jira-start todos/work.md` gathers related Jira findings for `todos/work.md` and writes them under `## Jira data`.
- `/nn-jira-start work` uses the existing work todo set when that match is clear.
- `/nn-jira-start` uses the only todo file when there is one, or asks which todo file to inspect when there are multiple.
