# Push Notes

Commit and push the user's Notes Ninja changes to their Git remote.

## Instructions

1. Inspect the repository state:
   - Run `git status --short`
   - Run `git diff`
   - Run `git diff --cached`
   - Run `git log --oneline -5`
2. If there are no changes, tell the user everything is already up to date and stop.
3. Review changed and untracked files before staging:
   - Stage relevant Notes Ninja changes, usually files in `notes/`, `todos/`, and `.cursor/commands/`
   - Do not stage files that look like secrets, credentials, local environment files, or unrelated temporary files
4. Create a concise commit message:
   - Prefer a specific message that describes the notes or todos that changed
   - If the user provided a message with `/nn-push`, use it when it accurately describes the staged changes
   - Avoid generic messages like `Update notes` unless the change is truly broad
5. Commit the staged changes.
6. Push the commit:
   - If the current branch already tracks a remote branch, run `git push`
   - If it does not track a remote branch but `origin` exists, run `git push -u origin HEAD`
   - If no remote is configured, tell the user how to add one and stop after the commit
7. Report the commit hash and push result to the user.

## Safety

- Never amend, reset, rebase, force push, or delete branches.
- Never skip git hooks.
- If the commit or push fails, show the user the important error and stop.
