#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Нужно передать ровно один аргумент."
    exit 1
fi

if [[ ! "$1" =~ /$ ]]; then
    echo "Путь должен заканчиваться символом /"
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "Указанной директории не существует."
    exit 1
fi

path="$1"

folders_count=$(find "$path" -type d | wc -l)

echo "Количество директорий: $folders_count"

du -h "$path" | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}'

file_count=$(find "$path" -type f | wc -l)

echo "Количество файлов: $file_count"

file_cfg_cont=$(find "$path" -name "*.conf" | wc -l )

echo "Количество конфигурационных файлов: $file_cfg_cont"

file_txt_cont=$(find "$path" -name "*.conf" | wc -l )

echo "Количество текстовый файлов: $file_txt_cont"