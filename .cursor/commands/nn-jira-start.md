# Gather Jira Data For Todos

Bootstrap reusable Jira context for one todo file using the configured Atlassian MCP server, then write the findings under `## Jira data` in that todo file.

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
   - Jira issue keys or URLs mentioned anywhere in the file, including inline keys like `- [ ] Task text - RND-12345`
5. Search Jira through the Atlassian MCP server for the context needed to create or work with stories from this todo file:
   - Todo text
   - Section names
   - Existing Jira issue keys mentioned anywhere in the todo file
   - Project keys, product names, labels, people, or other obvious hints from the user's request and todo file
6. Gather findings only; do not change Jira issues. Identify and record:
   - The Jira project key and project name
   - The high-level parent, initiative, or project issue when one clearly owns the work
   - Relevant epics that map to todo sections or major workstreams
   - The board that owns the work when it can be inferred from the project, parent, epics, or existing issue keys
   - The latest active sprint for that board
   - Whether new Jira stories from this todo file should be added to that sprint
   - Related issues only when they help explain or validate the selected context
7. Prefer confidence over coverage:
   - Use exact Jira issue keys and their parent, epic, sprint, project, and board fields as the strongest signal.
   - Use section names to map todo groups to epics only when the connection is clear from Jira summaries, issue relationships, or search results.
   - If multiple projects, boards, parents, epics, or active sprints are plausible, ask one concise clarification question before writing the `## Jira data` section.
   - If active sprint lookup is not supported by the MCP server, write the rest of the context and include `- Current active sprint: Unknown - active sprint lookup was not available`.
8. Update the target todo file by adding or replacing a `## Jira data` section with a markdown list:

```markdown
## Jira data

- Project: RND - Aidoc R&D
- High-level parent: RND-10535 - Mobile App Web Migration
- High-level parent link: https://aidoc.atlassian.net/browse/RND-10535
- Project skeleton epic: RND-10541 - Web App Project Sceleton
- Project skeleton epic link: https://aidoc.atlassian.net/browse/RND-10541
- Build infra epic: RND-10883 - Web App Build Infra
- Build infra epic link: https://aidoc.atlassian.net/browse/RND-10883
- Add new Jira stories from this todo to the latest active sprint
- Current active sprint: 356 - FY27-S08 (Q2-S01), board 485
```

9. Use stable labels that `/nn-jira` can reuse later:
   - `Project: KEY - Project name`
   - `High-level parent: KEY - Summary`
   - `<Section or workstream> epic: KEY - Summary`
   - Matching `<label> link: https://.../browse/KEY` lines when Jira URLs are available
   - `Add new Jira stories from this todo to the latest active sprint` when the active sprint should be used for new stories
   - `Current active sprint: SPRINT_ID - Sprint name, board BOARD_ID`
10. If no useful Jira context is found, still add or replace `## Jira data` with a clear empty-result list item:

```markdown
## Jira data

- No Jira project, parent, epic, or active sprint context found.
```

11. Preserve existing section headings, section order, task text, checkbox state, inline Jira keys, and blank-line style outside the `## Jira data` section.
12. After editing, briefly confirm:
   - Which todo file was updated
   - Which project, parent, epics, board, and active sprint were recorded
   - Any uncertainty or search limits that might affect the findings

## Safety

- Never edit files outside `todos/`.
- Never create Jira issues.
- Never transition, assign, comment on, link, or otherwise update Jira issues.
- Never remove, complete, rewrite, or reorder todos while gathering Jira data.
- Never append inline Jira markers to todo lines from this command.
- Prefer asking one short clarification question over guessing when the target todo file or Jira context is unclear.

## Examples

- `/nn-jira-start todos/work.md` gathers reusable Jira project, parent, epic, and active sprint context for `todos/work.md` and writes it under `## Jira data`.
- `/nn-jira-start work` uses the existing work todo set when that match is clear.
- `/nn-jira-start` uses the only todo file when there is one, or asks which todo file to inspect when there are multiple.
