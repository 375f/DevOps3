#!/bin/bash

count="$#"
arg="$1"

if [[ "$count" -ne 1 || "$arg" =~ ^[+-]?[0-9]+([.,][0-9]+)?$ ]]; then
    
    echo "Некорректный ввод"

else

    echo "$arg"

fi