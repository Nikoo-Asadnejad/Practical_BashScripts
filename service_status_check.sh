#!/bin/bash

# Variables
SERVICE="nginx"
EMAIL="admin@example.com"

# Check service status
if ! systemctl is-active --quiet "$SERVICE"; then
    # Restart service
    systemctl restart "$SERVICE"
    
    # Send alert
    echo "$SERVICE was down and has been restarted on $(hostname)" | mail -s "$SERVICE Restart Alert" "$EMAIL"
fi