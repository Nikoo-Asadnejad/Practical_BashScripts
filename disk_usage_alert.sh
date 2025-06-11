#!/bin/bash
# disk_usage_alert.sh
#
# Description:
#   Monitors disk space and alerts when usage exceeds a specified percentage.
#   Change Email value with your email.
#
# Usage:
#   ./disk_usage_alert.sh
#
# Example:
#   ./disk_usage_alert.sh

THRESHOLD=80
EMAIL="nikoo.a.14@gmail.com"

DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g') 
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is above $THRESHOLD%. Current usage: $DISK_USAGE%" | mail -s "Disk Usage Alert" "$EMAIL"
fi
