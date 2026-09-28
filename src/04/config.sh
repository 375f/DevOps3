#!/bin/bash

get_what_color(){
    local color="$1"

    case "$color" in
        1)
            echo "white"
            ;;
        2)
            echo "red"
            ;;
        3)
            echo "green"
            ;;
        4)
            echo "blue"
            ;;
        5)
            echo "purple"
            ;;
        6)
            echo "black"
            ;;
    esac
}

what_color_column1_background=$(get_what_color $column1_background_color)
what_color_column1_font=$(get_what_color $column1_font_color)
what_color_column2_background=$(get_what_color $column2_background_color)
what_color_column2_font=$(get_what_color $column2_font_color)