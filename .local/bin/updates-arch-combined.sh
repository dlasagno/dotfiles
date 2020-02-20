#!/usr/bin/env bash

# Counts the number of updates available on an arch based system
# yay should be installed for aur
# checkupadtes should be installed for repo, but yay works too
# nothing is printed if the aren't any updates available
# -t --total prints the total number of updates without distinguishing aur and repo
# -c --compact just prints numbers without text

if command -v checkupdates > /dev/null; then
    updates_arch=$(checkupdates 2> /dev/null | wc -l )
else
    updates_arch=$(yay -Qu --repo 2> /dev/null | wc -l )
fi

if ! [ "$updates_arch" ]; then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qu --aur 2> /dev/null | wc -l); then
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
