#!/usr/bin/env sh

# Continuosly sends a dummy notification
# It is possible to specify the number of seconds
# to wait between each notification (default = 5s)

interval="${1:-5}"

while true; do
  notify-send "test-notification" "This is only a test"
  sleep "$interval";
done

