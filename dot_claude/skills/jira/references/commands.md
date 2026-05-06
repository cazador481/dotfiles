# Jira CLI Command Reference

## issue create

```bash
jira issue create --no-input -t TYPE -s "SUMMARY" -P PARENT [opts]
```

Flags: `-t` type, `-s` summary, `-b` body, `-P` parent (required), `-y` priority, `-a` assignee, `-l` label, `-C` component

## issue list / search

```bash
jira issue list [flags]
```

| Filter | Flag |
|--------|------|
| Status | `-s"In Progress"` / `-s~Done` (negate) |
| Type | `-tBug` `-tStory` `-tEpic` |
| Assignee | `-a@me` / `-ax` (unassigned) |
| Priority | `-yHigh` `-yMedium` |
| Label | `-lnightly -lurgent` |
| Created | `--created today` / `--created week` |
| Updated | `--updated -7d` |
| History | `--history` |
| Watching | `--watching` |
| JQL | `-q"project = PROJ AND status = Open"` |
| Active only | `-q"project = HWINFCI AND statusCategory != Done"` |

Output flags: `--plain` (text), `--raw` (JSON), `--table`

## issue comment add

```bash
jira issue comment add KEY "TEXT"
```

Pass text as positional arg, not `-m`.

## issue move

```bash
jira issue move KEY "STATUS"
```

## issue edit

```bash
jira issue edit KEY -lLABEL --no-input
```

Always `--no-input` in non-interactive contexts.

## sprint

```bash
jira sprint list --table --plain --state active   # get active sprint ID
jira sprint add SPRINT_ID KEY1 KEY2 …             # up to 50 keys at once
```

## other

```bash
jira issue assign KEY USERNAME
jira open KEY
jira me                    # current user's username
jira issue view KEY
jira board --help
```

Config file: `~/.config/.jira/.config.yml`
