#!/bin/bash

# ============================
# Script: server-info.sh
# Author: Moein Afshari
# Description: Display minishop server information
# ============================

system_info() {
  sys_info="$(hostnamectl)"
  printf "\nSystem Information\n================\n%s\n" "$sys_info"
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
  cpu_c="$(nproc)"
  printf "\nNumber of CPU Cores: %s\n" "$cpu_c"
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
read -rp "Select an option: " selection

# condition for answer to user
if [ "$selection" = "1" ];then
  system_info
elif [ "$selection" = "2" ];then
  disk_info
elif [ "$selection" = "3" ];then
  ram_info
elif [ "$selection" = "4" ];then
  cpu_cores
elif [ "$selection" = "5" ];then
  show_all
else
  printf "\nWrong selection!\n"
fi

}

# the first script running 
prompt
read -rp "Do you want to continue? (y/n)" answer

# if user wanted, prompt function run again
while [ "$answer" = 'y' ]
do
  prompt
  read -rp "Do you want to continue? (y/n)" answer
done
