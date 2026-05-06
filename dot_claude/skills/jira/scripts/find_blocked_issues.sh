#!/bin/bash
# Find blocked tickets and their blockers
# Usage: find_blocked_issues.sh [filter]
# Note: Ignores tickets that are in Done state (both blocked tickets and blockers)

FILTER="${1:---history}"

~/bin/jira issue list "$FILTER" --raw 2>/dev/null | jq -r '
  def format_blocked:
    "Ticket: \(.key) - \(.summary)\nStatus: \(.status)\nBlocked by:\n" +
    (.blockedBy | map("  - \(.key): \(.summary)") | join("\n")) + "\n";

  [
    .[] |
    select(.fields.issueLinks | length > 0) |
    select(.fields.status.name != "Done") |
    select(.fields.issueLinks[] | select(.type.name == "Blocks" and .inwardIssue and .inwardIssue.fields.status.name != "Done")) |
    {
      key: .key,
      summary: .fields.summary,
      status: .fields.status.name,
      blockedBy: [.fields.issueLinks[] | select(.type.name == "Blocks" and .inwardIssue and .inwardIssue.fields.status.name != "Done") | {key: .inwardIssue.key, summary: .inwardIssue.fields.summary}]
    }
  ] |
  if length == 0 then
    "No blocked tickets found (excluding Done tickets)"
  else
    "Found \(length) blocked ticket(s):\n" + (map(format_blocked) | join("\n"))
  end
'
