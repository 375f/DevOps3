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

source ./analysis.sh