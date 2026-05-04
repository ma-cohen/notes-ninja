# Prioritize Todo Tasks

Reorder open todo items in one existing todo set by inferred dependency chains.

## Instructions

1. List existing todo sets by reading markdown files in `todos/*.md`.
2. Choose the target todo file:
   - If the user explicitly names an existing todo set, prioritize that file.
   - If the user names a todo set that does not exist, tell them it could not be found and stop.
   - If no todo set is explicit, use `todos/main.md`.
3. Read the target todo file and find open tasks written as `- [ ] Task description`.
4. If there are no open tasks, tell the user they have no todos to prioritize in that todo set right now.
5. Infer what should happen before what using the task text and surrounding section headings:
   - Research, gather information, decide, or plan before building, buying, scheduling, or committing.
   - Set up, install, create, or prepare before using, testing, publishing, or sharing.
   - Buy, collect, or arrange materials before tasks that depend on those materials.
   - Design before implement; implement before test; test before deploy, publish, or announce.
   - Ask, email, call, or get approval before tasks that rely on the answer or approval.
   - Parent or broad tasks before obvious follow-up tasks when the wording shows a sequence.
6. Reorder open tasks into dependency chains:
   - Put prerequisites before dependent tasks.
   - Keep closely related tasks together.
   - Preserve each task's original text exactly.
   - Prefer the existing section for each task when the dependency order is local to that section.
   - If a dependency chain clearly crosses sections, move the affected open tasks to the section where the chain best fits.
7. Preserve existing section headings, heading order, and blank-line style as much as possible.
8. Keep completed tasks written as `- [x]` unchanged, and keep `## Completed` at the bottom if it exists.
9. Do not ask the user clarification questions while prioritizing:
   - Make the best ordering you can infer.
   - If a dependency is uncertain, choose the safest practical order.
   - Mention important uncertainty in the final response.
10. After editing, briefly summarize:
   - Which todo set was prioritized.
   - The main dependency chains you created.
   - Any tasks whose ordering was uncertain.
   - That the user can send a correction if the order is wrong.

## Examples

- "prioritize my todos" reorders all open tasks by inferred dependencies.
- "prioritize work" reorders the existing work todo set.
- "figure out what comes first" groups related tasks into practical chains.
- If both "buy paint" and "paint bedroom" exist, put "buy paint" first.
- If both "test signup flow" and "deploy signup changes" exist, put testing before deployment.
