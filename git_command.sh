#!/bin/bash

# Function definition
execute_git_command() {
	local dir=$1
	local command=$2

	echo "Running 'git $command' in $dir..."
	(cd "$dir" && git $command)
}

# The Main
for dir in */ ; do
	if [[ -d "$dir" && -d "${dir}.git" ]]; then
		echo "Repository found in $dir."

		echo "Choose an action for this repository:"
		echo "1) git status "
		echo "2) git pull"
		echo "3) git fetch"
		echo "Enter your choice (1/2/3):"
		read choice

		case $choice in
			1) execute_git_command "$dir" "status" ;;
			2) execute_git_command "$dir" "pull" ;;
			3) execute_git_command "$dir" "fetch" ;;
			*) echo "Invalid choice. Skipping $dir." ;;
		esac
	fi
done
