#!/bin/bash
# check_internet.sh
#
# Description:
#   Checks for internet connectivity by pinging Google's DNS (8.8.8.8).
#
# Usage:
#   ./check_internet.sh
#
# Output:
#   "Internet is working" or "No internet"

ping -q -c 1 -W 1 8.8.8.8 > /dev/null && echo "✅ Internet is working" || echo "❌ No internet"
