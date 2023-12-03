#!/bin/bash

# Function to execute a chosen Git command
execute_git_command() {
    local dir=$1
    local command=$2

    echo "Running 'git $command' in $dir"
    (cd "$dir" && git $command)
}

# Prompt for the action to be applied to all repositories
echo "Choose an action to apply to all repositories:"
echo "1) git status"
echo "2) git pull"
echo "3) git fetch"
echo "Enter your choice (1/2/3):"
read global_choice

# Determine the command based on the choice
case $global_choice in
    1) command="status" ;;
    2) command="pull" ;;
    3) command="fetch" ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

# Main loop to execute the command in each repository
for dir in */ ; do
    if [[ -d "$dir" && -d "${dir}.git" ]]; then
        execute_git_command "$dir" "$command"
    fi
done
