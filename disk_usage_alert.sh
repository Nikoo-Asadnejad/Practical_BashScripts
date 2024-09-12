#!/bin/bash

THRESHOLD=80
EMAIL="nikoo.a.14@gmail.com"

DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g') 
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is above $THRESHOLD%. Current usage: $DISK_USAGE%" | mail -s "Disk Usage Alert" "$EMAIL"
fi