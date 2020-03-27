#!/usr/bin/env sh

# Opens a rofi based binary prompt.
# Receives the prompt text as argument.
# Exits with 0 if "Yes", 1 if "No"

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
  exit 1
fi
