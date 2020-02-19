#!/usr/bin/env bash

rofi_command="rofi -theme themes/capture-menu.rasi"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; maim
        ;;
    $area)
        maim -s
        ;;
    $window)
        sleep 1; maim -i $(xdotool getactivewindow)
        ;;
esac
