#!/bin/sh

#       ___           ___                   
#      /\  \         /\  \                  
#     _\:\  \       /::\  \                 
#    /\ \:\  \     /:/\:\  \                
#   _\:\ \:\  \   /:/ /::\  \   ___     ___ 
#  /\ \:\ \:\__\ /:/_/:/\:\__\ /\  \   /\__\
#  \:\ \:\/:/  / \:\/:/  \/__/ \:\  \ /:/  /
#   \:\ \::/  /   \::/__/       \:\  /:/  / 
#    \:\/:/  /     \:\  \        \:\/:/  /  
#     \::/  /       \:\__\        \::/  /   
#      \/__/         \/__/         \/__/    


# ▰▰▰ bspwm colors ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

# source the colors.
. "${HOME}/.cache/wal/colors.sh"

# Set the border colors.
bspc config normal_border_color "${color0:?}"
bspc config active_border_color "${color7:?}"
bspc config focused_border_color "${color1:?}"
bspc config presel_feedback_color "${color1:?}"


# ▰▰▰ symlinks ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: zathura, termite, dunst
# ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

mkdir -p  "${HOME}/.config/zathura"
ln -sf    "${HOME}/.cache/wal/zathurarc"  "${HOME}/.config/zathura/zathurarc"

mkdir -p  "${HOME}/.config/termite"
ln -sf    "${HOME}/.cache/wal/termite"    "${HOME}/.config/termite/config"

mkdir -p  "${HOME}/.config/dunst"
ln -sf    "${HOME}/.cache/wal/dunstrc"    "${HOME}/.config/dunst/dunstrc"


# ▰▰▰ dunst ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

# Restart dunst with the new color scheme
pkill dunst
dunst &


# ▰▰▰ sxiv ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

xrdb -override "${HOME}/.cache/wal/sxiv.Xresources"
