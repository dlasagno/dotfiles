#!/usr/bin/env sh

# Give rofi a list of unicode icons from remix icon to copy.
# Shows the selected icon in dunst if running.

remixicon_modi="\"$HOME/scripts/rofi/modi/copy-unicode.sh\" \"$HOME/.config/remix-icon-list\""
fontawesome_modi="\"$HOME/scripts/rofi/modi/copy-unicode.sh\" \"$HOME/.config/fontawesome-list\""
emoji_modi="\"$HOME/scripts/rofi/modi/copy-unicode.sh\" \"$HOME/.config/emoji-list\""


# Check if xclip is installed(in order to copy)
xclip -h >/dev/null 2>&1 || exit

rofi \
  -modi "remixicon:$remixicon_modi,fontawesome:$fontawesome_modi,emoji:$emoji_modi" \
  -show remixicon \
  -theme themes/iconsmenu.rasi \
  "$@"
