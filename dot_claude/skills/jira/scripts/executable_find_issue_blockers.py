#!/usr/bin/env python3
"""Find what blocks a specific ticket (excluding Done tickets)"""

import json
import subprocess
import sys

if len(sys.argv) < 2:
    print("Usage: find_issue_blockers.py <issue-key>")
    sys.exit(1)

issue_key = sys.argv[1]

try:
    # Get all issues with raw data
    result = subprocess.run(
        f"~/bin/jira issue list --history --raw 2>/dev/null",
        shell=True,
        capture_output=True,
        text=True
    )

    issues = json.loads(result.stdout)

    issue = None
    for i in issues:
        if i.get("key") == issue_key:
            issue = i
            break

    if issue is None:
        print(f"Issue '{issue_key}' not found in recent history")
        sys.exit(1)

    # Skip if ticket itself is Done
    if issue['fields']['status']['name'] == "Done":
        print(f"Issue '{issue_key}' is in Done state - skipping")
        sys.exit(0)

    links = issue.get("fields", {}).get("issueLinks", [])

    if not links:
        print(f"No blocking relationships found for {issue_key}")
        sys.exit(0)

    print(f"Issue: {issue['key']} - {issue['fields']['summary']}")
    print(f"Status: {issue['fields']['status']['name']}")
    print()

    # Find blocks relationships, excluding Done tickets
    blocked_by = [
        l for l in links
        if l.get("type", {}).get("name") == "Blocks"
        and l.get("inwardIssue")
        and l["inwardIssue"]["fields"]["status"]["name"] != "Done"
    ]
    blocks = [
        l for l in links
        if l.get("type", {}).get("name") == "Blocks"
        and l.get("outwardIssue")
        and l["outwardIssue"]["fields"]["status"]["name"] != "Done"
    ]

    if blocked_by:
        print(f"Blocked by ({len(blocked_by)}):")
        for link in blocked_by:
            issue_ref = link["inwardIssue"]
            print(f"  ❌ {issue_ref['key']}: {issue_ref['fields']['summary']} [{issue_ref['fields']['status']['name']}]")
    else:
        print("Not blocked by any active issue (Done blockers ignored)")

    print()

    if blocks:
        print(f"Blocks ({len(blocks)}):")
        for link in blocks:
            issue_ref = link["outwardIssue"]
            print(f"  🔗 {issue_ref['key']}: {issue_ref['fields']['summary']} [{issue_ref['fields']['status']['name']}]")
    else:
        print("Does not block any active issue (Done blocked tickets ignored)")

except json.JSONDecodeError as e:
    print(f"Error parsing JSON: {e}", file=sys.stderr)
    sys.exit(1)
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
