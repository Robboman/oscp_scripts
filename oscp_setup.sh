#!/bin/bash

# Script Title: OSCP VPN Setup Helper
# Date: 06/23/2024
# Author: Robboman
# GitHub: https://github.com/Robboman
# Version: 1.0
# Description: This script is intended to automation the initial setup and VPN connection of a Kali machine to use against OffSec's platform. Use of alias recommended for easier script init.
# Requirments: Xdotool (https://github.com/jordansissel/xdotool)

# Declare start time elapsed variables
start_time=$(date +%s)

# Define color variables
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

# Validate arguments
if [ $# -lt 2 ]; then
    printf "${red}Usage: $0 <platform> [type]${nc}\n"
    printf "${red}Example: setup oscp universal${nc}\n"
    exit 1
fi

# Extract arguments
platform=$1
type=$2

# Start VPN
sudo openvpn /mnt/hgfs/shared/openvpn/$platform/$type.ovpn &

# Terminal commands
sleep 10
xdotool key alt+shift+s && sleep 0.5 && xdotool type "vpn" && xdotool key Return
xdotool key ctrl+shift+t && sleep 0.5 && xdotool key alt+shift+s && sleep 0.5 && xdotool type "pivot" && xdotool key Return && sleep 0.5 && xdotool key ctrl+shift+d && sleep 0.5 && xdotool type "ligolo -selfcert" && xdotool key Return && sleep 0.5 && xdotool key ctrl+shift+r
xdotool key ctrl+shift+t && sleep 0.5 && xdotool key alt+shift+s && sleep 0.5 && xdotool type "transfer" && xdotool key Return && sleep 0.5 && xdotool key ctrl+shift+r && sleep 0.5 && xdotool key ctrl+shift+r && sleep 0.5 && xdotool key alt+Left && xdotool key alt+Left && sleep 0.5 && xdotool type "http 82 --directory=/home/kali/Transfer" && xdotool key Return && sleep 0.5 && xdotool type "kali" && xdotool key Return && sleep 0.5 && xdotool key ctrl+shift+r && sleep 0.5 && xdotool type "tree Transfer -L 3" && xdotool key Return
xdotool key ctrl+shift+t && sleep 0.5 && xdotool key alt+shift+s && sleep 0.5 && xdotool type "exploits" && xdotool key Return && cd /home/kali/Transfer/exploits
xdotool key ctrl+shift+t && sleep 0.5 && cd ~ && xdotool key alt+shift+s && sleep 0.5 && xdotool type "bloodhound" && xdotool key Return && sleep 0.5 && xdotool key ctrl+shift+d && sleep 0.5 && xdotool type "sudo neo4j start" && xdotool key Return && sleep 0.5 && xdotool type "kali" && xdotool key Return && sleep 7 && xdotool key ctrl+shift+r && sleep 0.5 && xdotool type "bloodhound" && xdotool key Return

end_time=$(date +%s)
duration=$((end_time - start_time))
printf "$green Overall elapsed time: $duration seconds.${nc}\n"