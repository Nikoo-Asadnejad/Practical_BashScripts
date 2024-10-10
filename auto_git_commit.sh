#!/bin/bash

MESSAGE=$1

if [ -z "$MESSAGE" ]; then
    MESSAGE="Auto-commit on $(date)"
fi

git add .
git commit -m "$MESSAGE"
git push origin main  

echo "Changes pushed to the repository with message: $MESSAGE"