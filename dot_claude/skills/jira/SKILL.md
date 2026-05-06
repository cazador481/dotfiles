---
name: jira
description: "Jira issue management via jira-cli. ALWAYS use this skill whenever the user mentions anything Jira-related — this includes: any issue key like HWINFCI-1234 or PROJ-123 appearing anywhere in the message; words like ticket, issue, epic, initiative, sprint, story, bug (in a project-tracking context); actions like create/view/assign/move/transition/comment/list applied to issues; blocking or blocker relationships between tickets; adding issues to a sprint; syncing or fixing assignees across epics and initiatives; bulk Jira workflows. Also triggers on casual phrasing: 'pull up HWINFCI-8479', 'what's blocking X', 'move X to In Progress', 'add a comment to X', 'list my open tickets', 'add X to the active sprint', 'epics are unassigned fix them', 'sync epic owners from initiatives', 'who owns the POR-FY27 epics'. Do NOT use for GitHub issues, Linear tickets, Trello cards, git blame/commits, CI build status, or PR reviews."
argument-hint: "[command] [args...]"
model: haiku
allowed-tools:
  - AskUserQuestion
  - Read
  - Bash
---

You are helping the user interact with Jira using the `jira` CLI tool (ankitpokhrel/jira-cli).

## Reference Docs

Load these with the Read tool **only when needed**:

| Doc | Path | Load when… |
|-----|------|------------|
| Commands | `references/commands.md` | Need flag syntax or list filter examples |
| HWINFCI | `references/hwinfci.md` | Working with any HWINFCI ticket |
| Workflows | `references/workflows.md` | Multi-step workflows, `sync-epic-assignees`, bulk creation |
| Scripts | `references/helper-scripts.md` | `blocked`, `blockers`, `blocks`, `jira-components.py` |

## Argument Parsing

`$ARGUMENTS` is the user's input. Parse it:
- Bare issue key (e.g. `HWINFCI-123`) → `view`
- Starts with a verb (view, create, list, …) → that command
- "fix issue KEY" or similar → `view` first, then act
- `blocked` → run `find_blocked_issues.sh` (load Scripts doc)
- `blockers KEY` / `blocks KEY` → run `find_issue_blockers.py` (load Scripts doc)
- `sync-epic-assignees` → load Workflows doc

## Core Commands

```
view    KEY                    jira issue view KEY
list    [filters]              jira issue list [flags]
create  [summary]              jira issue create --no-input -t TYPE -s "SUMMARY" -P PARENT [opts]
comment KEY [text]             jira issue comment add KEY "TEXT"
assign  KEY USER               jira issue assign KEY USER
move    KEY STATUS             jira issue move KEY STATUS
edit    KEY [opts]             jira issue edit KEY --no-input [opts]
open    KEY                    jira open KEY
sprint list                    jira sprint list --table --plain --state active
sprint add SPRINT KEY…         jira sprint add SPRINT KEY1 KEY2 …
blocked / blockers KEY         see Scripts doc
sync-epic-assignees            see Workflows doc
```

## Key Rules

- **`dangerouslyDisableSandbox: true`** on every Bash call — the CLI fails with `bwrap` error in sandbox
- **`--no-input`** on every `create` and `edit` — otherwise the CLI hangs waiting for input
- **Parent (`-P`) required** for `create` in this instance
- **Assignee** must be jira username, not email — use `jira me` to look it up
- **`jira issue create` has no sprint flag** — always a separate `jira sprint add` call after creation
- Default project: `HWINFCI`

## Interactive Handling

- Missing required fields for `create` → use AskUserQuestion (type, summary, parent, component)
- Missing comment text → use AskUserQuestion
- Missing transition for `move` → run `jira issue view KEY` first to see transitions

## Error Handling

- Auth failure (401 / Login Required) → tell user, AskUserQuestion to fix (`jira init`), then retry
- Permission denied → tell user, AskUserQuestion to fix, then retry
- Invalid issue key → check format (PROJ-123)

## Output Format

- Creation: show new issue key + URL
- View: structured key fields
- List: readable table
- Mutations: confirm what changed
