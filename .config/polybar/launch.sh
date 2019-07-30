#!/usr/bin/env bash

#       ___         ___                                                   ___           ___     
#      /\  \       /\  \                                   _____         /\  \         /\  \    
#     /::\  \     /::\  \                       ___       /::\  \       /::\  \       /::\  \   
#    /:/\:\__\   /:/\:\  \                     /|  |     /:/\:\  \     /:/\:\  \     /:/\:\__\  
#   /:/ /:/  /  /:/  \:\  \   ___     ___     |:|  |    /:/ /::\__\   /:/ /::\  \   /:/ /:/  /  
#  /:/_/:/  /  /:/__/ \:\__\ /\  \   /\__\    |:|  |   /:/_/:/\:|__| /:/_/:/\:\__\ /:/_/:/__/___
#  \:\/:/  /   \:\  \ /:/  / \:\  \ /:/  /  __|:|__|   \:\/:/ /:/  / \:\/:/  \/__/ \:\/:::::/  /
#   \::/__/     \:\  /:/  /   \:\  /:/  /  /::::\  \    \::/_/:/  /   \::/__/       \::/~~/~~~~ 
#    \:\  \      \:\/:/  /     \:\/:/  /   ~~~~\:\  \    \:\/:/  /     \:\  \        \:\~~\     
#     \:\__\      \::/  /       \::/  /         \:\__\    \::/  /       \:\__\        \:\__\    
#      \/__/       \/__/         \/__/           \/__/     \/__/         \/__/         \/__/    


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Load wal colors
(cat ~/.cache/wal/sequences &)

# Launch bar1 and bar2
MONITOR=DP-1 polybar bar1 -r &
MONITOR=HDMI-0 polybar bar2 -r &
# for m in $(polybar --list-monitors | cut -d":" -f1); do
#     MONITOR=$m polybar --reload example &
# done

echo "Bars launched..."
