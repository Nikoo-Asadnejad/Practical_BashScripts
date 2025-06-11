#!/bin/bash
# cpu_usage_alert.sh
#
# Description:
#   Sends an alert if CPU usage exceeds a defined threshold.
#
# Usage:
#   ./cpu_usage_alert.sh
#
# Example:
#   ./cpu_usage_alert.sh

THRESHOLD=80

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

if (( $(echo "$CPU_USAGE > $THRESHOLD" |bc -l) )); then
    echo "High CPU usage detected: $CPU_USAGE%" | mail -s "CPU Usage Alert" nikoo.a.14@gmail.com
    echo "Alert sent! CPU usage is $CPU_USAGE%."
else
    echo "CPU usage is normal: $CPU_USAGE%."
fi
