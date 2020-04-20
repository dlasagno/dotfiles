#!/usr/bin/env sh

# Gives rofi a list of unicode icons to copy.
# The sets available are:
# - remixicon
# - fontawesome
# - emoji

unicode_modi_path="$MIELE_SCRIPTS/rofi/modi/copy-unicode.sh"
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
  -theme themes/icon-list.rasi \
