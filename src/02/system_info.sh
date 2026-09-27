#!/bin/bash

if ! command -v ifconfig > /dev/null 2>&1; then
    sudo apt update
    sudo apt install -y net-tools
fi

echo "HOSTNAME = $HOSTNAME"

echo "TIMEZONE = $(timedatectl show -p Timezone --value) UTC $(date +%z | sed -E 's/00$//; s/^([+-])0/\1/')"

echo "USER = $USER"

echo "OS = $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')"

echo "DATE = $(date '+%d %B %Y %T')"

echo "UPTIME = $(uptime -p)"

echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"

interface=$(ip route | grep "default" | awk '{print $5}' | head -n 1)

echo "IP = $(ip -4 addr show "$interface" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)"

echo "MASK = $(ifconfig "$interface" | grep 'netmask' | awk '{print $4}')"

echo "GATEWAY = $(ip route | grep 'default' | awk '{print $3}' | head -n 1)"

echo "RAM_TOTAL = $(free -m | grep Mem | awk '{gb=$2/1024; printf("%.3f GB", gb)}')"

echo "RAM_USED = $(free -m | grep Mem | awk '{gb=$3/1024; printf("%.3f GB", gb)}')"

echo "RAM_FREE = $(free -m | grep Mem | awk '{gb=$4/1024; printf("%.3f GB", gb)}')"

echo "SPACE_ROOT = $(df -m / | awk 'NR==2 {printf("%.2f MB", $2)}')"

echo "SPACE_ROOT_USED = $(df -m / | awk 'NR==2 {printf("%.2f MB", $3)}')"

echo "SPACE_ROOT_FREE = $(df -m / | awk 'NR==2 {printf("%.2f MB", $4)}')"