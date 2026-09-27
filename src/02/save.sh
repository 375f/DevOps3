#!/bin/bash

info=$(bash ./system_info.sh)

echo "$info"

filename=$(date "+%d_%m_%y_%H_%M_%S.status")

echo "$info" > "$filename"