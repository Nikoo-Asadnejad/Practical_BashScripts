#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
DATE=$(date +%Y-%m-%d)
BACKUP_NAME="backup-$DATE.tar.gz"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

echo "Backup of $SOURCE_DIR completed at $DATE" >> "$BACKUP_DIR/backup.log"