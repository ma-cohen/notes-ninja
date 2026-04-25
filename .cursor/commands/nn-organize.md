# Reorganize Notes

Reorganize existing notes in the `notes/` folder based on the user's instructions.

## Instructions

1. List all `.md` files in the `notes/` folder
2. Read each note's frontmatter, headings, and entries to understand the current organization
3. Interpret the user's requested organization change, such as:
   - Combining related note files
   - Splitting mixed-topic note files
   - Renaming files or topics
   - Moving entries to better topic files
   - Cleaning up duplicate or confusing structure
4. Keep the work scoped to `notes/` unless the user explicitly asks to reorganize other files
5. Preserve all meaningful content, dates, and context from the original notes
6. Keep or create valid frontmatter for every note file:
   - Set `title` to the note topic
   - Preserve or merge relevant `tags`
   - Preserve the original `created` date when renaming or combining; use the earliest relevant source date for split files
7. Use descriptive kebab-case filenames for new or renamed files
8. Remove a note file only when all of its meaningful content has been moved elsewhere
9. Summarize the reorganization and list the files changed

## Safety

- Ask one concise clarification before editing if the requested organization is ambiguous or risks losing meaning
- Never delete note content unless it is an exact duplicate created by the reorganization
- When combining files, merge tags, preserve entry dates, and keep related entries grouped clearly
- When splitting files, create focused topic files instead of broad catch-all files
- Do not change `todos/` unless the user explicitly requests it

## Note File Format

```markdown
---
title: Topic Name
created: YYYY-MM-DD
tags: [tag1, tag2]
---

## Entry - YYYY-MM-DD
Content here...
```
