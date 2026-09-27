#!/bin/bash

chmod +x system_info.sh

source ./system_info.sh

echo "СОхранить информацию в файл? Y/N"

read answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then

    info=$(bash ./system_info.sh)
    echo "$info"

else
    exit
fi