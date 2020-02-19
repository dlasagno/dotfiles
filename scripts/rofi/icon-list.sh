#!/usr/bin/env sh

# Give rofi a list of unicode icons from remix icon to copy.
# Shows the selected icon in dunst if running.

unicode_modi_path="$HOME/scripts/rofi/modi/copy-unicode.sh"
remixicon_list="${XDG_DATA_HOME:-$HOME/.local/share}/miele/remixicon-list"
fontawesome_list="${XDG_DATA_HOME:-$HOME/.local/share}/miele/fontawesome-list"
emoji_list="${XDG_DATA_HOME:-$HOME/.local/share}/miele/emoji-list"

remixicon_modi="\"$unicode_modi_path\" \"$remixicon_list\""
fontawesome_modi="\"$unicode_modi_path\" \"$fontawesome_list\""
emoji_modi="\"$unicode_modi_path\" \"$emoji_list\""


# Check if xclip is installed(in order to copy)
xclip -h >/dev/null 2>&1 || exit

rofi \
  -modi "remixicon:$remixicon_modi,fontawesome:$fontawesome_modi,emoji:$emoji_modi" \
  -show remixicon \
  -theme themes/iconsmenu.rasi \
  "$@"
