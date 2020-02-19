#!/bin/bash

# This script is used to manage the tags of the wallpapers

case $1 in
  add)
    # wal-tag add <wallpaper-name> <tags>...
    shift

    wallpaper=$1
    shift

    # check arguments
    if [ -z "$wallpaper" ] || [ -z "$1" ]; then
      printf "Use: wal-tag add <wallpaper-name> <tags>...\n"
      exit 1;
    fi

    # add tags to the filename
    for tag in "$@"; do
      if [ -e "$wallpaper" ]; then
        if ! echo "$wallpaper" | grep -q "\[$tag\]"; then
          tmp=$(echo "$wallpaper" | sed "s|\([^/]*\)$|[$tag]\1|")
          mv "$wallpaper" "$tmp"
          wallpaper=$tmp
        fi
      else
        printf "Couldn't find '%s'\n" "$wallpaper"
        exit 2
      fi
    done
    ;;
  remove)
    # wal-tag remove <wallpaper-name> <tags>...
    shift

    wallpaper=$1
    shift

    # check arguments
    if [ -z "$wallpaper" ] || [ -z "$1" ]; then
      printf "Use: wal-tag remove <wallpaper-name> <tags>...\n"
      exit 1;
    fi

    # remove tags from the filename
    for tag in "$@"; do
      if [ -e "$wallpaper" ]; then
        tmp=$(echo "$wallpaper" | sed "s|\[$tag\]\([^/]*\)$|\1|")
        if [ "$wallpaper" != "$tmp" ]; then
          mv "$wallpaper" "$tmp"
          wallpaper=$tmp
        fi
      else
        printf "Couldn't find '%s'\n" "$wallpaper"
        exit 2
      fi
    done
    ;;
  query)
    # wal-tag query <wallpapers-dir> [+-]<tags>...
    shift

    wallpapers_dir=$1
    shift

    # check arguments
    if [ -z "$wallpapers_dir" ] || [ -z "$1" ]; then
      printf "Use: wal-tag query <wallpapers-dir> [+-]<tags>...\n"
      exit 1;
    fi

    # search filenames with the specified tags
    tag_filter=""
    for tag in "$@"; do
      if [ -z "$(printf "%s" "$tag" | awk '/^[+-]/')" ]; then
        echo "$tag is not a valid tag format: use + or - in front of the tag name"
        exit 1
      fi
      tag_filter="${tag_filter}$([ "${tag:0:1}" = "-" ] && printf "!")/\[${tag:1}\][^\/]*/ && "
    done
    tag_filter="${tag_filter}1"

    find "$wallpapers_dir/" | awk "$tag_filter"
    ;;
  *)
    printf "Use: wal-tag <command> [<args>]\n"
    exit 1
    ;;
esac
