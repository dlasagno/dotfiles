#!/usr/bin/env sh

lock_screen_wal='.cache/blurred-wal.jpg'

# source the colors and the wallpaper
. "$HOME/.cache/wal/colors.sh"

# prepare a blurred copy of the wallpaper
convert "${wallpaper:?}" \
  -resize 1920x1080^ \
  -gravity center \
  -extent 1920x1080 \
  -blur 0x3 \
  -quality 85% \
  "$HOME/$lock_screen_wal"

# lock the screen
i3lock \
  --insidevercolor="${background:?}ff"    \
  --ringvercolor="${color1:?}90"          \
  \
  --insidewrongcolor="${background:?}ff"  \
  --ringwrongcolor="${color3:?}90"        \
  \
  --insidecolor="${background:?}ff"       \
  --ringcolor="${background:?}90"         \
  --linecolor="${background:?}00"         \
  --separatorcolor="${background:?}00"    \
  \
  --verifcolor="${foreground:?}ff"        \
  --wrongcolor="${foreground:?}ff"        \
  --timecolor="${foreground:?}ff"         \
  --datecolor="${foreground:?}ff"         \
  --layoutcolor="${foreground:?}ff"       \
  --keyhlcolor="${color1:?}ff"            \
  --bshlcolor="${color1:?}ff"             \
  \
  --screen 1                          \
  --clock                             \
  --indicator                         \
  --timestr="%H:%M"                   \
  --datestr="%d %m %Y"                \
  --image="$HOME/$lock_screen_wal"    \
  --tiling                            \
