#!/bin/bash

count="$#"
arg="$@"

if [[ "$count" -ne "4" ]]; then

    echo -e "\033[31mERROR:\033[0m Введи ровно 4 аргумента ;)"
    exit 1

fi

for arg in "$@"; do
    if [[ "$arg" =~ ^[1-6]$ ]]; then

        continue

    else

        echo -e "\033[31mERROR:\033[0m Введи аргумент число от 1 до 6. :) \n $arg - не входит в диапозон ;)"
        exit 1

    fi
done

if [[ "$1" == "$2" || "$3" == "$4" ]]; then

    echo -e "\033[31mERROR:\033[0m Цвета шрифта и фона одного столбца не должны совпадать. ;)"
    echo -e "\033[32mРекомендэйшн:\033[0m Повторно запусти скрипт с другими аргументами. :)"
    exit 1

fi

source ./colors.sh
