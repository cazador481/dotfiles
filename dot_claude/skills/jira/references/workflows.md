# Common Workflows

## Create a Ticket and Add to Sprint

`jira issue create` has no sprint flag — always two steps:

```bash
# 1. Get active sprint ID
jira sprint list --table --plain --state active

# 2. Create
jira issue create -tTask -s "..." -b "..." -P HWINFCI-8480 -C make4python -a eash -y "P0 - Must have" --no-input

# 3. Add to sprint (skip if user didn't ask)
jira sprint add <sprint-id> <new-key>
```

## Bulk Ticket Creation

```bash
# 1. Get component owners
~/scripts/jira-utils/jira-components.py

# 2. Create all tickets
jira issue create -tBug -s "..." -b "..." -P PARENT -y "P0 - Must have" -C <component> -a <owner> --no-input
# repeat per ticket, capture each KEY

# 3. Get active sprint
jira sprint list --table --plain --state active

# 4. Batch add (up to 50 at once)
jira sprint add <sprint-id> KEY-1 KEY-2 KEY-3 ...

# 5. Labels if needed
jira issue edit KEY -lnightly --no-input
```

## Add Label-Filtered Tickets to Sprint

```bash
jira issue list -p HWINFCI -q"project = HWINFCI AND labels = nightly AND statusCategory != Done" --plain
jira sprint list --table --plain --state active
jira sprint add <sprint-id> KEY-1 KEY-2 ...
```

## sync-epic-assignees

Triggered by: `sync-epic-assignees`, "sync epic assignees", "assign unassigned epics", "fix epic owners".

**Args** (positional, both optional): project key (default `HWINFCI`), label (default `POR-FY27`)

**Steps:**

1. Fetch Initiatives with the label:
   ```bash
   jira issue list -p <PROJECT> -tInitiative -l<LABEL> --plain --raw > /tmp/initiatives.json
   ```

2. Parse inline Python: walk each initiative's `issueLinks`, keep links where:
   - `type.name == "Parent-Child"` AND `type.outward == "is parent of"` AND child `issueType.name == "Epic"`
   - Initiative assignee = `fields.assignee.displayName` (null/empty = unassigned)

3. Fetch full Epic data in one JQL call (linked data in step 1 is incomplete):
   ```bash
   jira issue list -p <PROJECT> -q "issueKey in (KEY-1,KEY-2,...)" --plain --raw > /tmp/epics.json
   ```

4. For each Epic — needs update if assignee is null, empty, or `"Nicole Magnus"`. Skip if parent initiative is also unassigned.

5. Assign:
   ```bash
   jira issue assign <EPIC-KEY> "<INITIATIVE-ASSIGNEE-DISPLAY-NAME>"
   ```

6. Print summary: EPICs updated (old → new, from initiative) and EPICs skipped (with reason).
