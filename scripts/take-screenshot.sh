#!/bin/sh

# Script to take screenshots


SCREENSHOT="$HOME/Pictures/screenshots/$(date +%s).png"

mkdir -p "$HOME/Pictures/screenshots"

maim > "$SCREENSHOT"
notify-send "Screenshot acquired" -i "$SCREENSHOT"
