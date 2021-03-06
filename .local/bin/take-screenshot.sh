#!/usr/bin/env sh

# Takes screenshots
# Passing "--clipboard" will copy the screenshot in the clipboard

SCREENSHOTS_DIR="$HOME/Pictures/screenshots"
SCREENSHOT="$SCREENSHOTS_DIR/$(date +%s).png"


if [ "$1" = "--clipboard" ]; then
  clipboard="yes"
else
  clipboard="no"
fi

mkdir -p "$SCREENSHOTS_DIR"

"$MIELE_SCRIPTS/rofi/capture-menu.sh" -p $clipboard > "$SCREENSHOT"

# Delete the screenshot if it was unsuccessful
if [ ! -s "$SCREENSHOT" ]; then
  cat "$SCREENSHOT"
  rm "$SCREENSHOT"
  exit 1
fi

notify-send "Screenshot acquired" -i "$SCREENSHOT"

[ "$1" = "--clipboard" ] && xclip -selection clipboard -t image/png  -i "$SCREENSHOT"
