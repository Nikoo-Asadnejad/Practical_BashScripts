#!/bin/bash
# delete_files.sh
#
# Description:
#   Deletes files older than a month in a directory.
#
# Usage:
#   ./delete_files.sh /path/to/folder 7
#
# Example:
#   ./delete_files.sh /tmp 30

DIR="/path/to/directory"

find $DIR -type f -mtime +30 -exec rm {} \;

echo "Deleted files older than 30 days in $DIR."
