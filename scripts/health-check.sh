#!/bin/bash

# =======================================
# Script: health-check.sh
# Author: Moein Afshari
# Description: Display basic system health information
# =======================================

ram_usage() {
  read -r total used free <<< "$(free -h | awk '/Mem:/ {print $2, $3, $4}')"
  printf "RAM Usage: total size %s, used %s, free %s\n" "$total" "$used" "$free"
}

root_disk() {
  read -r size used avail use <<< "$(df -h / | awk 'NR==2 {print $2, $3, $4, $5}')"
  printf "Root Disk Usage: %s is total size, %s(%s) is used, %s is available\n" "$size" "$use" "$used" "$avail"
}

cpu_cores() {
  printf "CPU Count: %s cores\n" "$(nproc)"
}

uptime_time() {
  printf "Uptime: %s\n" "$(uptime -p)"
}

current_user() {
  printf "Current User: %s\n" "$USER"
}

prompt() {
  printf "========================\n"
  printf "Health Check Information\n"
  printf "========================\n"
}

# show all health checking information function
show_all() {
  prompt
  ram_usage
  root_disk
  uptime_time
  current_user
}

# show all
show_all
