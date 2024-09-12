#!/bin/bash

LOG_FILE="/var/log/uptime.log"

UPTIME=$(uptime -p)

echo "$(date): $UPTIME" >> "$LOG_FILE"