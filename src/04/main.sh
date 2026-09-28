#!/bin/bash

if [[ "$#" -ne 0 ]]; then
    echo -e "\033[31mERROR:\033[0m Скрипт запускается без аргументов."
    exit 1
fi


source ./config.conf


if [[ ! "$column1_background" =~ ^[1-6]$ ]]; then

    column1_background=2
    column1_background_color_default=true

else
    
    column1_background_color_default=false

fi


if [[ ! "$column1_font_color" =~ ^[1-6]$ ]]; then

    column1_font_color=4
    column1_font_color_default=true

else

    column1_font_color_default=false

fi


if [[ ! "$column2_background" =~ ^[1-6]$ ]]; then

    column2_background=6
    column2_background_color_default=true

else

    column2_background_color_default=false

fi


if [[ ! "$column2_font_color" =~ ^[1-6]$ ]]; then

    column2_font_color=1
    column2_font_color_default=true

else

    column2_font_color_default=false

fi


if [[ "$column1_background" == "$column1_font_color" || "$column2_background" == "$column2_font_color" ]]; then

    echo -e "\033[31mERROR:\033[0m Цвета шрифта и фона одного столбца не должны совпадать. ;)"
    exit 1

fi



source ./colors.sh

source ./config.sh

echo 

if [[ "$column1_background_color_default" == true ]]; then

    echo "Column 1 background = default ($what_color_column1_background)"

else

    echo "Column 1 background = $column1_background ($what_color_column1_background)"

fi


if [[ "$column1_font_color_default" == true ]]; then

    echo "Column 1 font color = default ($what_color_column1_font)"

else

    echo "Column 1 font color = $column1_font_color ($what_color_column1_font)"

fi


if [[ "$column2_background_color_default" == true ]]; then

    echo "Column 2 background = default ($what_color_column2_background)"

else

    echo "Column 2 background = $column2_background ($what_color_column2_background)"

fi


if [[ "$column2_font_color_default" == true ]]; then

    echo "Column 2 font color = default ($what_color_column2_font)"

else

    echo "Column 2 font color = $column2_font_color ($what_color_column2_font)"

fi