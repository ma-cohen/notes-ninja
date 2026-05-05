# Work With Jira Todo

Use a linked Jira issue from an existing todo to complete the Jira action the user asks for through the configured Atlassian MCP server.

## Instructions

1. Confirm that an Atlassian MCP server is available.
   - If Jira MCP tools are not available, tell the user to configure the Atlassian MCP server in Cursor and stop.
2. List existing todo sets by reading markdown files in `todos/*.md`.
3. Find todos written as `- [ ] Task description` or `- [x] Task description`.
4. Match the user's request to one todo:
   - Use exact matches when possible.
   - Use clear partial or semantic matches when the user's wording obviously refers to one task.
   - If the user explicitly names an existing todo set, search only that file.
   - If the user names a todo set that does not exist, tell them it could not be found and stop.
   - If multiple todos match, ask one short clarification question before using Jira MCP tools.
   - If no todo matches, tell the user no matching todo was found.
5. Require the matched todo to have a Jira marker matching `<!-- jira: KEY-123 -->`.
   - If the todo has no Jira marker, tell the user to run `/nn-jira-start` first.
   - Do not create Jira issues from `/nn-jira`.
6. Interpret the user's message as a Jira action for the linked issue key.
7. Use the Atlassian MCP server to perform the requested action, such as:
   - Fetch issue details or status
   - Add a comment
   - Update summary or description
   - Transition status
   - Assign or unassign the issue
   - Set priority, labels, components, sprint, or parent when supported
   - Link related issues
8. If the requested action is ambiguous, destructive, or missing required Jira fields, ask one concise clarification question before using Jira MCP tools.
9. If the Jira action changes the meaning of the local todo, update only that exact todo line when the user clearly requested it.
   - For example, if the user asks to rename the Jira issue and todo, update both Jira and the todo text while preserving the Jira marker.
   - If the user only asks to update Jira, leave the todo file unchanged.
10. Preserve existing section headings, section order, task text, Jira markers, and blank-line style unless the requested action explicitly changes the todo text.
11. After completing the action, briefly confirm:
   - The todo that was used
   - The Jira issue key
   - The Jira action completed
   - Any local todo update that was made

## Safety

- Never edit files outside `todos/`.
- Never create Jira issues from `/nn-jira`; use `/nn-jira-start` for creation.
- Never remove, complete, or rewrite todos unless the user explicitly asks for that local todo change.
- Prefer asking a short clarification question over guessing when an action could affect the wrong Jira issue.

## Examples

- `/nn-jira show status for login flow` fetches the linked Jira issue status.
- `/nn-jira add comment to login flow: backend is ready` comments on the linked issue.
- `/nn-jira move login flow to In Progress` transitions the linked issue.
- `/nn-jira assign login flow to me` assigns the linked issue when Jira supports it.
