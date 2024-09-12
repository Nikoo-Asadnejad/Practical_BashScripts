
# Bash Scripts Collection

This repository contains a collection of useful Bash scripts for Linux systems. Each script serves a specific purpose,
ranging from system maintenance to monitoring and automation tasks.
Below is a description of each script along with instructions on how to use them.

## 1. Backup Script (`backup.sh`)

This script creates a backup of a specified directory and stores it in a backup directory with the current date.

- **Usage**: Update the `SOURCE_DIR` and `BACKUP_DIR` variables with the paths you want to back up and where you want to store the backup.
- **Command**: `./backup.sh`


## 2. Disk Usage Alert (disk_usage_alert.sh)

This script checks the disk usage of the root partition and sends an alert email if it exceeds a specified threshold.
- **Usage**: Set the THRESHOLD variable to the desired disk usage limit (in percentage) and update the EMAIL variable with the recipient’s email address.
- **Command**: `./disk_usage_alert.sh`

## 3. System Update and Cleanup (system_update_cleanup.sh)
This script updates the system, cleans up unnecessary files, and removes unused packages to free up space.

- **Usage**: Run the script with root privileges to update and clean the system.
- **Command**: `sudo ./system_update_cleanup.sh`

## 4. Monitor Server Uptime (monitor_uptime.sh)
This script logs the server uptime to a file. It can be set to run at regular intervals using a cron job.
- **Usage**: Run the script to log the uptime periodically.
- **Command**: `./monitor_uptime.sh`

## 6. Service Status Check (service_status_check.sh)
This script checks the status of a specified service and restarts it if it is not running.
- **Usage**: Set the SERVICE variable to the service you want to monitor (e.g., nginx) and update the EMAIL variable with the recipient’s email address.
- **Command**: `.sudo ./service_status_check.sh`

</br>

-	Ensure you have the required permissions to run the scripts (use chmod +x script_name.sh to make them executable).
- Some scripts may require root privileges; use sudo where applicable.
