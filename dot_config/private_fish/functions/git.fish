function __git_new_workspace
    echo $argv
    set -l BRANCH $argv[1]
    set -l GIT_ROOT (git rev-parse --show-toplevel)
    set -l LOCAL_PATH (git rev-parse --show-prefix)

    if test -z "$BRANCH"
        echo "Branch name is required."
        return 1
    end

    if test -z "$GIT_ROOT"
        echo "This directory is not inside a git repository."
        return 1
    end

    # Calculate the worktree path
    set -l WORKTREE_PATH "$GIT_ROOT/../$BRANCH"
    echo $WORKTREE_PATH

    # Add the worktree for the branch
    echo git worktree add -b $BRANCH $WORKTREE_PATH p4/master
    git worktree add -b $BRANCH $WORKTREE_PATH p4/master

    # cd into the new working directory
    cd $WORKTREE_PATH/$LOCAL_PATH

    # If the branch name starts with HWINFCI, set the jira-ticket
    if string match -q "HWINFCI-*" $BRANCH
        git set-jira $BRANCH
    end
end

function git
    # Check if the first argument is 'nw'
    if test "$argv[1]" = "nw"
        # Remove 'nw' from the arguments list
        set -e argv[1]

        # Call the git-new-workspace function with the remaining arguments
        __git_new_workspace $argv
    else
        # If the first argument is not 'nw', pass all arguments to the regular git command
        command git $argv
    end
end
