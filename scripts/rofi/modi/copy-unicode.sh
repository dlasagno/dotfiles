#!/usr/bin/env sh

# Give rofi a list of unicode characters to choose from:
# the choosen char will be copy to clipboard with xclip.
# Shows the selected icon in dunst if running.

chars_list="$1"


selected="$2"
if [ -z "$selected" ]; then

  if [ -e "$chars_list" ]; then
    cat "$chars_list"
  else
    printf "Couldn't find the unicode char list at %s:\n" "$chars_list" >&2
    printf "exit code 1 - file with chars missing\n" >&2
    exit 1
  fi

else

  icon=$(printf "%s" "$selected" | sed "s/\s.*//")
  printf "%s" "$icon" | xclip -selection clipboard >/dev/null
  notify-send "$icon copied to clipboard." &

fi
