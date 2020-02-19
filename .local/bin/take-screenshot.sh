#!/usr/bin/env sh

# Script to take screenshots


SCREENSHOT="$HOME/Pictures/screenshots/$(date +%s).png"


mkdir -p "$HOME/Pictures/screenshots"

"$MIELE_SCRIPTS/rofi/capture-menu.sh" > "$SCREENSHOT"

if [ ! -s "$SCREENSHOT" ]; then
  cat "$SCREENSHOT"
  rm "$SCREENSHOT"
  exit 1
fi

notify-send "Screenshot acquired" -i "$SCREENSHOT"

if [ "$1" = "--clipboard" ]; then
  xclip -selection clipboard -t image/png  -i "$SCREENSHOT"
fi
