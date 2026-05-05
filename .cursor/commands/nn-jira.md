# Work With Jira

Use the configured Atlassian MCP server to complete the Jira action the user asks for.

## Instructions

1. Confirm that an Atlassian MCP server is available.
   - If Jira MCP tools are not available, tell the user to configure the Atlassian MCP server in Cursor and stop.
2. Interpret the user's message as a Jira action.
3. Resolve the Jira target from the user's request using any useful available context:
   - Issue keys or Jira URLs in the user's message
   - Summary text, project keys, labels, people, status names, sprint names, or other Jira fields
   - Jira search through the Atlassian MCP server
   - Optional todo context from `todos/*.md` when the user clearly refers to a local todo
4. Use the Atlassian MCP server to perform any requested action it supports, such as:
   - Fetch issue details or status
   - Search or list issues
   - Create issues
   - Add a comment
   - Update summary or description
   - Transition status
   - Assign or unassign the issue
   - Set priority, labels, components, sprint, or parent when supported
   - Link related issues
   - Any other Jira action exposed by the configured MCP server
5. If the requested action is ambiguous, destructive, or missing required Jira fields, ask one concise clarification question before using Jira MCP tools.
6. If the user asks to use local todo context, list existing todo sets by reading markdown files in `todos/*.md`, then match the user's wording to the relevant todo or Jira data.
   - Use exact matches when possible.
   - Use clear partial or semantic matches when the user's wording obviously refers to one task.
   - If the user explicitly names an existing todo set, search only that file.
   - If the user names a todo set that does not exist, tell them it could not be found and stop.
   - If multiple todos match, ask one short clarification question before using Jira MCP tools.
7. If the Jira action changes the meaning of a local todo, update only that exact todo line when the user clearly requested it.
   - For example, if the user asks to rename the Jira issue and todo, update both Jira and the todo text while preserving the Jira marker.
   - If the user only asks to update Jira, leave the todo file unchanged.
8. Preserve existing section headings, section order, task text, Jira markers, and blank-line style unless the requested action explicitly changes the todo text.
9. After completing the action, briefly confirm:
   - The Jira issue key or target that was used
   - The Jira action completed
   - Any local todo context or update that was used

## Safety

- Never edit files outside `todos/`.
- Never remove, complete, or rewrite todos unless the user explicitly asks for that local todo change.
- Prefer asking a short clarification question over guessing when an action could affect the wrong Jira issue or create incorrect Jira data.

## Examples

- `/nn-jira show status for APP-123` fetches the issue status.
- `/nn-jira create a bug for login failing on Safari` creates a Jira issue when the MCP server supports issue creation.
- `/nn-jira add comment to APP-123: backend is ready` comments on the issue.
- `/nn-jira move APP-123 to In Progress` transitions the issue.
- `/nn-jira assign APP-123 to me` assigns the issue when Jira supports it.
