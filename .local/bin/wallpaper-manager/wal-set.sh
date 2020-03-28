#!/usr/bin/env sh

# This script is used to set a wallpaper
# The script can be called in of those ways:
# - wal-set <[+/-]tag-name>...
# - wal-set <image>
# If a "-" is passed, takes image file from stdin

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"


# Check arguments
if [ -z "$1" ]; then
   printf "Use: wal-set <[+/-]tag-name>...\n"
   printf "Use: wal-set <image>\n"
   exit 1
fi

# Get the wallpaper path
if [ -f "$1" ]; then
   wallpaper="$1"
elif [ "$1" = "-" ]; then
   read -r wallpaper
   if ! [ -f "$wallpaper" ]; then
      printf "%s: No such file\n" "$wallpaper" >&2
      exit 2
   fi
else
   wallpaper=$("$MIELE_SCRIPTS/wallpaper-manager/wal-tag.sh" query "$WALLPAPERS_DIR/" "$@" | shuf -n 1)
   if ! [ -f "$wallpaper" ]; then
      printf "Couldn't find any wallpaper with the specified tags\n" >&2
      exit 2
   fi
fi

# Is it a multi-monitor compatible?
if [ "$("$MIELE_SCRIPTS/wallpaper-manager/wal-prop.sh" get "$wallpaper" multi-monitor)" = "true" ]; then
   multi_monitor="--no-randr"
fi

# Adjust saturation if specified
if [ -n "$("$MIELE_SCRIPTS/wallpaper-manager/wal-prop.sh" get "$wallpaper" saturation)" ]; then
   saturation="--saturate $("$MIELE_SCRIPTS/wallpaper-manager/wal-prop.sh" get "$wallpaper" saturation)"
fi

# Use a different backend if specified
if [ -n "$("$MIELE_SCRIPTS/wallpaper-manager/wal-prop.sh" get "$wallpaper" backend)" ]; then
   backend="--backend $("$MIELE_SCRIPTS/wallpaper-manager/wal-prop.sh" get "$wallpaper" backend)"
fi

# Run pywal to generate color scheme and update it
wal \
   -i "$wallpaper" \
   -o "$HOME/.config/wal/done.sh" \
   -n \
   $backend \
   $saturation

# Set the wallpaper
xwallpaper --zoom "$wallpaper" $multi_monitor

# feh \
#   "$wallpaper" \
#   --no-fehbg \
#   --bg-fill \
#   $multi_monitor
