#!/usr/bin/env sh

# Puts a border only on the focused windows
# The script requires the width of border as an argument
# If the focused window is alone the border isn't applied

# Wait for a window to get focus
bspc subscribe node_focus | while read -r event; do
  node=$(echo "$event" | awk '{print $4}')
  desktop=$(echo "$event" | awk '{print $3}')

  # Remove border from the previous focused window
  if [ -n "$last_node" ]; then
    bspc config -n "$last_node" border_width 0
  fi

  # Apply border to the focused window if not alone on its desktop
  windows_number="$(bspc query -N -d "$desktop" -n .leaf | wc -l)"
  if [ "$windows_number" -gt 1 ]; then
    bspc config -n "$node" border_width "$1"
  fi

  last_node="$node"
done
