#!/usr/bin/env sh

# Opens a rofi based prompt
# The first argument is the prompt text.
# If "--hide" is passed as the second argument
# the prompt will hide the input

[ "$2" = "--hide" ] && hide="-password"

rofi \
  -dmenu \
  -p "$1" \
  $hide \
  -theme themes/prompt.rasi
