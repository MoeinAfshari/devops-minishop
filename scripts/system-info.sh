#!/bin/bash

# ==============================
# Script: system-info.sh
# Author: Moein Afshari
# Description: Displays basic system information
# ==============================

printf "Current User: %s\n" "$USER"
printf "Current Directory: %s\n" "$(pwd)"
printf "Date & Time: %s\n" "$(date +'%Y-%m-%d %H:%M')"
printf "Host Name: %s\n" "$(hostname)"
printf "Kernel Version: %s\n" "$(uname -r)"
printf "System Uptime: %s\n" "$(uptime -p)"
printf "Number of CPUs: %s\n" "$(nproc)"
printf "RAM Space(GB): %s\n" "$(free -h | awk '/Mem:/ {print $2}')"
printf "Root Disk Empty Space(GB): %s\n" "$(df -h / | awk 'NR==2 {print $4}')"
printf "IP Address: %s\n" "$(hostname -I | awk '{print $1}')"
