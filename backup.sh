#!/bin/bash
# backup.sh
#
# Description:
#   Takes source and destination directories as command-line arguments,
#   then creates a compressed backup archive with the current date.
#
# Usage:
#   ./backup.sh /path/to/source /path/to/backup
#
# Example:
#   ./backup.sh ~/Documents /mnt/backups

if [ "$#" -ne 2 ]; then
  echo "❌ Usage: $0 <source_directory> <backup_directory>"
  exit 1
fi

SOURCE_DIR="$1"
BACKUP_DIR="$2"
DATE=$(date +%Y-%m-%d)
BACKUP_NAME="backup-$DATE.tar.gz"

# Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# Log the backup
echo "Backup of $SOURCE_DIR completed at $DATE" >> "$BACKUP_DIR/backup.log"

echo "Backup completed: $BACKUP_DIR/$BACKUP_NAME"
