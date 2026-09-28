#!/bin/bash

count="$#"
arg="$@"

if [[ "$count" -ne "4" ]]; then

    echo "Введи ровно 4 аргумента"
    exit 1

fi

for arg in "$@"; do
    if [[ "$arg" =~ ^[1-6]$ ]]; then

        continue

    else

        echo "Введи аргумент число от 1 до 6."
        exit 1

    fi
done

if [[ "$1" == "$2" || "$3" == "$4" ]]; then

    echo "Цвета шрифта и фона одного столбца не должны совпадать."
    echo "Повторно запусти скрипт с другими аргументами."
    exit 1

fi

source ./colors.sh
