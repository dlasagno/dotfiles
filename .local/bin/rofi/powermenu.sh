#!/usr/bin/env sh

# Open a powermenu with options to:
# - power off
# - reboot
# - lock
# - suspend
# - log out

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock=""
suspend=""
log_out=""

# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(printf "%b" "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        "$MIELE_SCRIPTS/lock-screen.sh"
        ;;
    $suspend)
        # mpc -q pause
        # amixer set Master mute
        systemctl suspend
        ;;
    $log_out)
        bspc quit
        ;;
esac
