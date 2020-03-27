#!/usr/bin/env sh

# Puts a border only on the focused windows
# The border width is taken from the current one
# If the focused window is alone the border isn't applied

border_width="$(bspc config border_width)"

# Remove all borders
bspc config border_width 0

# Wait for a window to get focus
bspc subscribe node_focus | while read -r event; do
  node=$(echo "$event" | cut -d' ' -f4)
  desktop=$(echo "$event" | cut -d' ' -f3)

  # Remove border from the previous focused window
  [ -n "$last_node" ] && bspc config -n "$last_node" border_width 0

  # Apply border to the focused window if not alone on its desktop
  windows_number="$(bspc query -N -d "$desktop" -n .leaf | wc -l)"
  [ "$windows_number" -gt 1 ] && bspc config -n "$node" border_width "$border_width"

  last_node="$node"
done
