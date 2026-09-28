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

echo "Total number of folders (including all nested ones) = $folders_count"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

du -h "$path" | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}'

file_count=$(find "$path" -type f | wc -l)

echo "Total number of files = $file_count"

file_cfg_count=$(find "$path" -type f -name "*.conf" | wc -l )

echo "Number of:"

echo "Configuration files (with the .conf extension) = $file_cfg_count"

file_txt_count=$(find "$path" -type f -name "*.txt" | wc -l )

echo "Text files: $file_txt_count"

file_executable_count=$(find "$path" -type f -executable | wc -l)

echo "Executable files = $file_executable_count"

file_log_count=$(find "$path" -type f -name "*.log" | wc -l )

echo "Log files (with the extension .log) = $file_log_count"

file_archive_count=$(find "$path" -type f \( -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.rar" -o -name "*.7z" \) | wc -l)

echo "Archive files = $file_archive_count"

file_symlink_count=$(find "$path" -type l | wc -l)

echo "Symbolic links = $file_symlink_count"