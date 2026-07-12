#!/bin/bash

# =======================================
# Script: health-check.sh
# Author: Moein Afshari
# Description: Display basic system health information
# =======================================

ram_usage() {
  read -r used free <<< "$(free -h | awk '/Mem:/ {print $3, $4}')"
  printf "RAM Usage: used %s, free %s\n" "$used" "$free"
}

root_disk() {
  disk_usage="$(df -h / | awk 'NR==2 {print $5}')"
  printf "Root Disk Usage: %s is used\n" "$disk_usage"
}

cpu_cores() {
  cpu_c="$(nproc)"
  printf "CPU Count: %s cores\n" "$cpu_c"
}

uptime_time() {
  u_time="$(uptime -p)"
  printf "Uptime: %s\n" "$u_time"
}

current_user() {
  printf "Current User: %s\n" "$USER"
}

prompt() {
  printf "========================\n"
  printf "Health Check Information\n"
  printf "========================\n"
}

show_all() {
  prompt
  ram_usage
  root_disk
  uptime_time
  current_user
}

show_all
