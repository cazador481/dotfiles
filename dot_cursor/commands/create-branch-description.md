# create-branch-description

## Purpose

Write a merge description. The merge description will be stored in the git branch description field

## Instructions:
This is an interactive process, ask questions.

1. If the parent branch is not provided, it can be gotten by the command `git parent`, defaults to p4/master if not set
2. If the ticket is not provided, get the jira ticket id. If the branch name starts with HWINFCI, then that is the ticket. If not you can use the command `git get-jira`
3. Use the information from the jira ticket, the diff between head and the parent branch, and the current branch description for input into creating the merge request description.
4. Ask if manual testing was done, if not provided.
5. Come up with the description using the format below, then verify with the user before setting.
6. Add the description to the branch description using: `git config branch.<branch>.description <description>`

## Format

The branch description must follow this format based on the Code Quality Guidelines:

```
[CATEGORY] BUG #/HWINFCI-####/No Bug: Summary description

Detailed explanation of the change and why it's necessary.

# Changes made:
- Specific change 1
- Specific change 2
- Specific change 3

# Testing

## New tests, or Updated tests
<Description of automated testing added or changed, or "None">

## Manual Testing:
<Description of manual testing or "None">

# Review info
Review: http://cr#review:id=
```

### Review info:
If there isn't a review link already set, use the `http://cr#review:id=` placeholder

### Categories

Choose the appropriate category:

**MAJOR (backward incompatible changes):**
- `[MAJOR]` - Major version bump
- `[API CHANGE]` - Breaking API changes

**MINOR (new features, backward compatible):**
- `[MINOR]` - Minor version bump
- `[NEW FEATURE]` - New functionality
- `[ENHANCEMENT]` - Enhancement to existing feature

**PATCH (bug fixes, documentation):**
- `[PATCH]` - Patch version bump
- `[BUG FIX]` - Bug fixes
- `[DOCUMENTATION]` - Documentation updates
- `[INTERNAL]` - Internal changes, refactoring

### Example

```
[BUG FIX] HWINFCI-7969: Remove feature flags that blocks running w/i nvci, and outside of SC

This change removes restrictions that prevented TotUtil from running in NVCI environments and outside of SC.

# Changes made:
- Removed SC-only check from bin/totutil that prevented execution outside SC environment
- Removed experimental --nvci flag from Command::Break::Auto
- Removed conditional logic that blocked bucketization/breaking when running under NVCI

# Testing

## Automated testing
Added a new test to t/t0-FUT.t to do ...

## Manual Testing:
Tested in NVCI environment and verified tool runs without errors.

# Review info
Review: http://cr#review:id=
```

## Command to Set Description

```bash
git config branch.<branch>.description "$(cat <<'EOF'
[CATEGORY] TICKET: Description

Details...

Changes made:
- Change 1
- Change 2

Manual Testing:
Testing details

Review: (to be added)
EOF
)"
```

## Reference

Format source: Confluence document: https://nvidia.atlassian.net/wiki/spaces/CI/pages/2795602250/Code+Quality+Guidelines
