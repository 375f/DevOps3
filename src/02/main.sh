#!/bin/bash

source ./system_info.sh

echo "СОхранить информацию в файл? Y/N"

read answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then

    sourse ./save.sh

else
    exit
fi