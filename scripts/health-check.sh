#!/bin/bash

# =======================================
# Script: health-check.sh
# Author: Moein Afshari
# Description: Display basic system health information
# =======================================

# ram usage
read -r used free <<< "$(free -h | awk '/Mem:/ {print $3, $4}')"
printf "RAM Usage: used %s, free %s\n" "$used" "$free"

# root disk usage
printf "Root Disk Usage: %s is used\n" "$(df -h / | awk 'NR==2 {print $5}')"

printf "CPU Count: %s cores\n" "$(nproc)"

printf "Uptime: %s\n" "$(uptime -p)"

printf "Current User: %s\n" "$USER"
