#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt autoclean

sudo apt autoremove -y

echo "System updated and cleaned on $(date)" >> /var/log/sys_update.log