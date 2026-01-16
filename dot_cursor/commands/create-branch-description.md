# create-branch-description

## Purpose

Write a merge description. The merge description will be stored in the git branch description field

# Instructions:
You can ask clarifying questions

1. Get the parent branch.  This can be gotten by the command `git parent`, defaults to p4/master
2. Get the jira ticket id. If the branch name starts with HWINFCI, then that is the ticket.  If not you can uset the command `git get-jira`
3. Use the information from the jira ticket, the diff, and the current branch description for input into creating the merge request description.
4. Verify that the contents is correct, then add the description to the branch description.
5. Ask the user if manual testing was done, if so what was it.

# Format:
Can be found at the confluence page https://confluence.nvidia.com/display/CI/Code+Quality+Guidelines
