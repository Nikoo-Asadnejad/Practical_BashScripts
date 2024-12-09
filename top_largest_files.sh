#!/bin/bash


DIRECTORY="/"
LIMIT=10


usage() {
    echo "Usage: $0 [-d <directory>] [-n <number_of_files>]"
    echo "  -d: Directory to search (default is /)"
    echo "  -n: Number of largest files to display (default is 10)"
    exit 1
}


while getopts "d:n:" opt; do
    case "$opt" in
        d) DIRECTORY="$OPTARG" ;;
        n) LIMIT="$OPTARG" ;;
        *) usage ;;
    esac
done

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' not found."
    exit 1
fi

echo "Searching for the $LIMIT largest files in '$DIRECTORY'..."

# Find and display the largest files
find "$DIRECTORY" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n "$LIMIT"
