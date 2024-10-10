#!/bin/bash

DIR="/path/to/directory"

find $DIR -type f -mtime +30 -exec rm {} \;

echo "Deleted files older than 30 days in $DIR."