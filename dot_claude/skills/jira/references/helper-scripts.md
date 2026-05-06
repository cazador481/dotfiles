# Helper Scripts

## find_blocked_issues.sh

Find tickets blocked by other tickets.

```bash
bash ~/.claude/skills/jira/scripts/find_blocked_issues.sh [filter]
```

- Default filter: `--history` (recent issues)
- Other examples: `"@me"`, `"-s~Done"`, `"-tBug"`
- Auto-excludes Done tickets and Done blockers

```bash
bash ~/.claude/skills/jira/scripts/find_blocked_issues.sh          # history
bash ~/.claude/skills/jira/scripts/find_blocked_issues.sh "@me"    # assigned to you
```

## find_issue_blockers.py

Find what blocks a specific ticket and what it blocks.

```bash
python3 ~/.claude/skills/jira/scripts/find_issue_blockers.py <issue-key>
```

- Auto-excludes Done tickets from all sides
- Shows inward (blocked by) and outward (blocks) relationships

## jira-components.py

List all HWINFCI components with their leads/owners.

```bash
~/scripts/jira-utils/jira-components.py
```

Output: component name, lead display name, lead username. If a component has no owner, assign to the user requesting the ticket.

## Raw JSON Reference

`issueLinks` field (capital L) in issue JSON:
- `inwardIssue` → this ticket **is blocked by** that one
- `outwardIssue` → this ticket **blocks** that one
- Link type: `type.name == "Blocks"`
