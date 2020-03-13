#!/usr/bin/env sh

# Puts a border only on the focused windows
# The script requires the width of border as an argument

bspc subscribe node_focus | while read -r event; do
  node=$(echo "$event" | awk '{print $4}')
  if [ -n "$last_node" ]; then
    bspc config -n "$last_node" border_width 0
  fi
  bspc config -n "$node" border_width "$1"
  last_node="$node"
done
