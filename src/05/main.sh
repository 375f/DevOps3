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

start_time=$(date +%s)

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

echo "Text files = $file_txt_count"

file_executable_count=$(find "$path" -type f -executable | wc -l)

echo "Executable files = $file_executable_count"

file_log_count=$(find "$path" -type f -name "*.log" | wc -l )

echo "Log files (with the extension .log) = $file_log_count"

file_archive_count=$(find "$path" -type f \( -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.rar" -o -name "*.7z" \) | wc -l)

echo "Archive files = $file_archive_count"

file_symlink_count=$(find "$path" -type l | wc -l)

echo "Symbolic links = $file_symlink_count"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

i=1

find "$path" -type f -exec du -h {} + | sort -hr | head -n 10 | while read -r size file; do

    type="${file##*.}"

    echo "$i - $file, $size, $type"

    ((i++))

done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

i=1

find "$path" -type f -executable -exec du -h {} + | sort -hr | head -n 10 | while read -r size file; do

    hash=$(md5sum "$file" | awk '{print $1}')

    echo "$i - $file, $size, $hash"

    ((i++))

done

end_time=$(date +%s)
final_time=$((end_time - start_time))

echo "Script execution time (in seconds) = $final_time"