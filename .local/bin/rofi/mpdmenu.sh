#!/usr/bin/env bash

# Show a rofi menu for controlling mpd

rofi \
    -theme themes/mpdmenu.rasi \
    -modi "mpd:$MIELE_SCRIPTS/rofi/modi/mpd-modi.sh" \
    -show mpd
