#!/usr/bin/env sh

# This script opens a rofi based binary prompt

choice=$(printf "Yes\nNo" | rofi \
  -dmenu \
  -p "$1" \
  -i \
  -only-match \
  -theme themes/binary-prompt.rasi
)

if [ "$choice" = "Yes" ]; then
  exit 0
else
  return 1
fi
