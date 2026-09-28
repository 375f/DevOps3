#!/bin/bash

#source ./colors.sh
source ./config.conf

if [[ ! "$column1_background" =~ ^[1-6]$ ]]; then
    column1_background=6
    column1_background_default=true
else
    column1_background_default=false
fi


echo "$column1_background"
echo "$column1_font_color"
echo "$column2_background"
echo "$column2_font_color"


