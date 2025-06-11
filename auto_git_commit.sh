#!/bin/bash
# auto_git_commit.sh
#
# Description:
#   Automatically commits and push all changes in the current Git repo.
#
# Usage:
#   ./auto_git_commit.sh
#
# Example:
#   ./auto_git_commit.sh

MESSAGE=$1

if [ -z "$MESSAGE" ]; then
    MESSAGE="Auto-commit on $(date)"
fi

git add .
git commit -m "$MESSAGE"
git push origin main  

echo "Changes pushed to the repository with message: $MESSAGE"
