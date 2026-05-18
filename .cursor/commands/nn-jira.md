# Work With Jira

Use the configured Atlassian MCP server to complete the Jira action the user asks for. When the user refers to local todos, use the structured `## Jira data` section created by `/nn-jira-start` as reusable Jira context.

## Instructions

1. Confirm that an Atlassian MCP server is available.
   - If Jira MCP tools are not available, tell the user to configure the Atlassian MCP server in Cursor and stop.
2. Interpret the user's message as a Jira action.
3. Resolve the Jira target from the user's request using any useful available context:
   - Issue keys or Jira URLs in the user's message
   - Summary text, project keys, labels, people, status names, sprint names, or other Jira fields
   - Jira search through the Atlassian MCP server
   - Optional todo context from `todos/*.md` when the user clearly refers to a local todo
   - Structured `## Jira data` values in the matched todo file, including project, parent, epic, and active sprint lines
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
7. When using todo context, parse the matched file before acting:
   - Read the `## Jira data` section if it exists.
   - Parse `Project: KEY - Project name` as the default Jira project for new issues.
   - Parse `High-level parent: KEY - Summary` as the default high-level parent when the requested Jira action needs one.
   - Parse any line ending in `epic: KEY - Summary` as an available epic, preserving its label for matching against todo section names.
   - Parse matching `<label> link: https://.../browse/KEY` lines as the Jira URLs for those keys.
   - Parse `Add new Jira stories from this todo to the latest active sprint` as an instruction to place new stories in the stored active sprint.
   - Parse `Current active sprint: SPRINT_ID - Sprint name, board BOARD_ID` as the default sprint and board for new stories when Jira supports setting sprint.
   - Identify subtask lines: any `- [ ]` or `- [x]` line indented with 2 spaces, 4 spaces, or a tab directly under a parent task line is a **subtask** of that parent. Build a parent→subtasks map. A Jira key on an indented line is a **subtask issue key**, not a story key.
8. When creating Jira stories from todo items:
   - Use the stored project unless the user names a different project.
   - Use the epic whose label best matches the todo section, such as `Build infra` matching `Build infra epic`.
   - Use the stored high-level parent when Jira requires or supports a parent and no more specific epic is appropriate.
   - Add the new story to the stored active sprint when the Jira data includes the active sprint instruction and Jira supports setting sprint.
   - Detect existing inline Jira keys or URLs on todo lines and update, fetch, or skip those issues instead of creating duplicates.
   - If a todo section has no clear matching epic and multiple stored epics are plausible, ask one short clarification before creating issues.
   - For each parent task that has indented subtask lines: create (or detect) the parent story first, then create each subtask line that has no Jira key yet as a **Jira subtask** with the parent story as its parent issue. Do not set sprint on subtasks; they inherit sprint from the parent story.
   - Never create a Jira subtask for an indented line that already contains an issue key or Jira URL.
9. If the Jira action changes the meaning of a local todo, update only that exact todo line when the user clearly requested it.
   - For example, if the user asks to rename the Jira issue and todo, update both Jira and the todo text while preserving the Jira marker.
   - If the user only asks to update Jira, leave the todo file unchanged.
   - If the user asks to create Jira stories from todos and a new issue is created, append the new issue key to only the matching todo line when the user requested local todo tracking.
   - When a subtask Jira issue is created, append its new issue key to the matching **indented** todo line.
   - When the user acts on a key found on an indented line (transition, comment, assign, rename, etc.), resolve it as a subtask issue and apply the action to that subtask. Update only the indented line if a local change is needed.
10. Preserve existing section headings, section order, task text, Jira markers, `## Jira data`, and blank-line style unless the requested action explicitly changes the todo text. Indented subtask lines must remain indented after any edit.
11. After completing the action, briefly confirm:
   - The Jira issue key or target that was used
   - The Jira action completed
   - Any project, parent, epic, active sprint, or local todo context that was used
   - When subtasks were created, list each subtask key and the parent story it belongs to

## Safety

- Never edit files outside `todos/`.
- Never remove, complete, or rewrite todos unless the user explicitly asks for that local todo change.
- Prefer asking a short clarification question over guessing when an action could affect the wrong Jira issue or create incorrect Jira data.
- Never create duplicate Jira stories for todo lines that already include an issue key or Jira URL.
- Never create duplicate Jira subtasks for indented lines that already include an issue key or Jira URL.
- Never promote an indented subtask line to a top-level Jira story.

## Examples

- `/nn-jira show status for APP-123` fetches the issue status.
- `/nn-jira create a bug for login failing on Safari` creates a Jira issue when the MCP server supports issue creation.
- `/nn-jira add comment to APP-123: backend is ready` comments on the issue.
- `/nn-jira move APP-123 to In Progress` transitions the issue.
- `/nn-jira assign APP-123 to me` assigns the issue when Jira supports it.
- `/nn-jira create stories from the Build infra todos` reads the matched todo file, uses its `## Jira data` project, `Build infra epic`, and current active sprint, then avoids todo lines that already have Jira keys.
- `/nn-jira create stories from the Build infra todos` with a todo like `- [ ] Build login\n  - [ ] Add OAuth\n  - [ ] Add tests` creates story `RND-100` for "Build login", then creates subtasks `RND-101` and `RND-102` under `RND-100`, and appends the keys to each matching line.
- `/nn-jira move APP-456 to Done` where `APP-456` appears on an indented subtask line transitions only that subtask issue.
