#!/usr/bin/env sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qu --aur 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    case $1 in
        -t|--total)
            echo "$updates"
            ;;
        -c|--compact)
            echo "$updates_arch - $updates_aur"
            ;;
        *)
            echo "Updates available: $updates ($updates_arch arch, $updates_aur aur)"
            ;;
    esac
fi
