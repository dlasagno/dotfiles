#!/usr/bin/env sh

# Gives rofi a list of unicode characters to choose from:
# the choosen char will be copied to the clipboard with "xclip".
# Requires a file containing the characters list as an argument.

chars_list="$1"
selected="$2"


if [ -z "$selected" ]; then

  if [ -e "$chars_list" ]; then
    cat "$chars_list"
  else
    printf "%s: No such file or directory\n" "$chars_list" >&2
    exit 1
  fi

else

  icon=$(printf "%s" "$selected" | sed "s/\s.*//")
  printf "%s" "$icon" | xclip -selection clipboard >/dev/null
  notify-send "Copy unicode" "$icon copied to clipboard." &

fi
