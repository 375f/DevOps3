#!/bin/bash

hostname_value=$(hostname)
echo "HOSTNAME = $hostname_value пися попа"
echo TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3}') $(date +%z)
echo USER = $USER
echo OS = $OSTYPE
echo DATE = $(date +%d) $(date +%b) $(date +%Y) $(date +%T)
echo UPTAME = $(uptime -p)
