#!/bin/bash

# ============================
# Script: server-info.sh
# Author: Moein Afshari
# Description: Display minishop server information
# ============================


# server information functions

system_info() {
  sys_info="$(hostnamectl)"
  printf "\nSystem Information\n"
  printf "================\n%s\n" "$sys_info"
} 

disk_info() {
  read -r total used free <<< "$(df -h / | awk 'NR==2 {print $2, $3, $4}')"
  printf "\nRoot Disk Usage: %s is total size, %s is used, %s is available\n" "$total" "$used" "$free"
}

ram_info() {
  read -r total used free <<< "$(free -h | awk '/Mem:/ {print $2, $3, $4}')"
  printf "\nRAM Space Usage: %s is total space, %s is used, %s is free\n" "$total" "$used" "$free"
}

cpu_cores() {
	printf "\nNumber of CPU Cores: %s\n" "$(nproc)"
}

show_all() {
  system_info
  disk_info
  ram_info
  cpu_cores
}

prompt() {
  # initial prompt
  printf "===================\n"
  printf "MiniShop Server Information\n"
  printf "===================\n"
  # show items to select by user
  printf "Show:\n\n"
  printf "1- System Info\n\n"
  printf "2- Disk\n\n"
  printf "3- RAM\n\n"
  printf "4- CPU\n\n"
  printf "5- All\n\n"
  printf "6- Exit\n\n"
}


# user selection function

select_item() {
  read -rp "Select an option: " selection
  
  # condition for answer to user
  case "$selection" in
  1)
    system_info
    ;;
  2)
    disk_info
    ;;
  3)
    ram_info
    ;;
  4)
    cpu_cores
    ;;
  5)
    show_all
    ;;
  6)
    exit 0
    ;;
  *)
    printf "Wrong number entered!"
    ;;
  esac
  
  # continue or not
  read -rp "Do you want to continue?(y/n) " answer
}


# main function

main() {
  answer="y"
  while [ "$answer" = "y" ]
  do
    prompt
    select_item
  done
  # if user answer was n (no)
  printf "Goodbye!"
  exit 0
}


# start the script
main
