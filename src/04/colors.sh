get_background_color() {
    local color="$1"

    case "$color" in
        1)
            echo "47"
            ;;
        2)
            echo "41"
            ;;
        3)
            echo "42"
            ;;
        4)
            echo "44"
            ;;
        5)
            echo "45"
            ;;
        6)
            echo "40"
            ;;
    esac
}

get_font_color() {
    local color="$1"

    case "$color" in

        1)
            echo "37"
            ;;
        2)
            echo "31"
            ;;
        3)
            echo "32"
            ;;
        4)
            echo "34"
            ;;
        5)
            echo "35"
            ;;
        6)
            echo "30"
            ;;
    esac
}

column1_background=$(get_background_color "$column1_background_color")
column1_font=$(get_font_color "$column1_font_color")
column2_background=$(get_background_color "$column2_background_color")
column2_font=$(get_font_color "$column2_font_color")


column1_color="\033[${column1_background};${column1_font}m"
column2_color="\033[${column2_background};${column2_font}m"
reset_color="\033[0m"

source ./system_info.sh



