#!/usr/bin/env sh

# This script opens a rofi based prompt

if [ "$2" = "--hide" ]; then
  hide="-password"
else 
  hide=
fi

rofi \
  -dmenu \
  -p "$1" \
  $hide \
  -theme themes/prompt.rasi
