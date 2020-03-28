#!/usr/bin/env bash

# Uses rofi as a mpd controller

# Options icons
play=""
pause=""
stop=""
next=""
previous=""
tog_repeat=""
tog_random=""

# Do the chosen action
if [ -n "$1" ]; then
    case $1 in
        $play)       mpc -q play ;;
        $pause)      mpc -q pause ;;
        $stop)       mpc -q stop ;;
        $next)       mpc -q next ;;
        $previous)   mpc -q prev ;;
        $tog_repeat) mpc -q repeat ;;
        $tog_random) mpc -q random ;;
    esac
fi

# Gets the current status of mpd
status="$(mpc status)"

# Defines the Play / Pause option content
if [[ $status == *"[playing]"* ]]; then
    play_pause="$pause"
else
    play_pause="$play"
fi

# Display if repeat mode is on / off
if [[ $status == *"repeat: on"* ]]; then
    active="4"
elif [[ $status == *"repeat: off"* ]]; then
    urgent="4"
else
    tog_repeat=" Parsing error"
fi

# Display if random mode is on / off
if [[ $status == *"random: on"* ]]; then
    [ -n "$active" ] && active+=",5" || active="5"
elif [[ $status == *"random: off"* ]]; then
    [ -n "$urgent" ] && urgent+=",5" || urgent="5"
else
    tog_random=" Parsing error"
fi

# Get the current playing song
current=$(mpc current)
[ -z "$current" ] && current="-"

# List options
echo "$play_pause"
echo "$stop"
echo "$previous"
echo "$next"
echo "$tog_repeat"
echo "$tog_random"

# Update rofi
echo -e "\x00prompt\x1f$current"
echo -e "\x00active\x1f$active"
echo -e "\x00urgent\x1f$urgent"
