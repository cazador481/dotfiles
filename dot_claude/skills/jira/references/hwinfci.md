# HWINFCI Project Specifics

## Priority Format

Must use exact strings — others return 400:
- `"P0 - Must have"`
- `"P1 - Should have"`
- `"P2 - Could have"`

## Transition Names

"In Progress" is called **`Begin work`** in HWINFCI. Run `jira issue view KEY` to see available transitions if unsure.

## Component Requirement

`-C` (component) is required for all HWINFCI issues — omitting it returns `400 Bad Request`.

Run `~/scripts/jira-utils/jira-components.py` to list components and their owners.

## Issue Types Under an Epic

When parent is an Epic: only `-tTask` and `-tBug` are valid. `-tStory` is rejected.

## Known Parent Epics

| Key | Purpose |
|-----|---------|
| HWINFCI-8480 | Request Inbox FY27 (Human Ask / Work Intake) |
| HWINFCI-8531 | CI Operational Inbox (Auto/Alerts) |
| HWINFCI-5529 | make4python default parent |

## make4python Defaults

```bash
-P HWINFCI-5529 -C make4python
```
