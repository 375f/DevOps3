#!/bin/bash

chmod +x system_info.sh

source ./system_info.sh

echo "СОхранить информацию в файл? Y/N"

read answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then

    chmod +x save.sh
    sourse ./save.sh

else
    exit
fi