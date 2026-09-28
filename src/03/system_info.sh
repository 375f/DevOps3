#!/bin/bash

if ! command -v ifconfig > /dev/null 2>&1; then
    sudo apt update
    sudo apt install -y net-tools
fi

echo -e "${column1_color}HOSTNAME${reset_color} = ${column2_color}$HOSTNAME${reset_color}"

echo -e "${column1_color}TIMEZONE${reset_color} = ${column2_color}$(timedatectl show -p Timezone --value) UTC $(date +%z | sed -E 's/00$//; s/^([+-])0/\1/')${reset_color}"

echo -e "${column1_color}USER${reset_color} = ${column2_color}$USER${reset_color}"

echo -e "${column1_color}OS${reset_color} = ${column2_color}$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')${reset_color}"

echo -e "${column1_color}DATE${reset_color} = ${column2_color}$(date '+%d %B %Y %T')${reset_color}"

echo -e "${column1_color}UPTIME${reset_color} = ${column2_color}$(uptime -p)${reset_color}"

echo -e "${column1_color}UPTIME_SEC${reset_color} = ${column2_color}$(awk '{print $1}' /proc/uptime)${reset_color}"

interface=$(ip route | grep "default" | awk '{print $5}' | head -n 1)

echo -e "${column1_color}IP${reset_color} = ${column2_color}$(ip -4 addr show "$interface" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)${reset_color}"

echo -e "${column1_color}MASK${reset_color} = ${column2_color}$(ifconfig "$interface" | grep 'netmask' | awk '{print $4}')${reset_color}"

echo -e "${column1_color}GATEWAY${reset_color} = ${column2_color}$(ip route | grep 'default' | awk '{print $3}' | head -n 1)${reset_color}"

echo -e "${column1_color}RAM_TOTAL${reset_color} = ${column2_color}$(free -m | grep Mem | awk '{gb=$2/1024; printf("%.3f GB", gb)}')${reset_color}"

echo -e "${column1_color}RAM_USED${reset_color} = ${column2_color}$(free -m | grep Mem | awk '{gb=$3/1024; printf("%.3f GB", gb)}')${reset_color}"

echo -e "${column1_color}RAM_FREE${reset_color} = ${column2_color}$(free -m | grep Mem | awk '{gb=$4/1024; printf("%.3f GB", gb)}')${reset_color}"

echo -e "${column1_color}SPACE_ROOT${reset_color} = ${column2_color}$(df -m / | awk 'NR==2 {printf("%.2f MB", $2)}')${reset_color}"

echo -e "${column1_color}SPACE_ROOT_USED${reset_color} = ${column2_color}$(df -m / | awk 'NR==2 {printf("%.2f MB", $3)}')${reset_color}"

echo -e "${column1_color}SPACE_ROOT_FREE${reset_color} = ${column2_color}$(df -m / | awk 'NR==2 {printf("%.2f MB", $4)}')${reset_color}"