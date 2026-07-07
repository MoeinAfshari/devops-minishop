#!/bin/bash

# Display basic system information

printf "Current User: %s\n" $(whoami)
printf "Current Directory: %s\n" $(pwd)
printf "Date & Time: %s %s\n" $(date +'%Y-%m-%d %H:%M')
printf "Host Name: %s\n" $(hostname)
printf "Kernel Version: %s\n" $(uname -r)
echo -e "System Uptime: $(uptime)"
printf "Number of CPUs: %s\n" $(nproc)
printf "RAM Space(GB): %s\n" $(free -g | grep Mem: | awk '{print $2}')
printf "Disk Empty Space(GB): %s\n" $(df -h --total | grep total | awk '{print $4}')
printf "IP Address: %s\n" $(hostname -I | awk '{print $1}')
