#!/usr/bin/env bash

# Script to launch polybar bars


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Load wal colors
(cat ~/.cache/wal/sequences &)

# Choose the primary bar based on the type of computer
case $(cat /sys/class/dmi/id/chassis_type) in
  9|10|19)
    PRIMARY_BAR=bar-laptop
    ;;
  *)
    PRIMARY_BAR=bar-primary
    ;;
esac

# Launch polybar on every monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
  echo $m
  if [ ! -z "$(polybar --list-monitors | awk -v m="$m" '$0 ~ m && /primary/')" ]; then
    MONITOR=$m polybar --reload $PRIMARY_BAR &
    echo primary
  else
    MONITOR=$m polybar --reload bar-secondary &
    echo secondary
  fi
done

echo "Bars launched..."
