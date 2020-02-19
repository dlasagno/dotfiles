#!/usr/bin/env sh

# This script is used to manage the properties of the wallpapers


parse_prop() {
  prop=$1

  prop_name=$(printf "%s" "$prop" | sed "s|\s*:.*||")
  prop_value=$(printf "%s" "$prop" | sed "s|.*:\s*||")
}

get_prop() {
  wallpaper=$1
  prop_name=$2

  printf "%s" "$wallpaper" | sed -n "s|.*{\s*$prop_name\s*:\s*\(.*\)\s*}[^/]*|\1|p"
}

set_prop() {
  wallpaper=$1
  prop=$2

  parse_prop "$prop"
  

  if [ -z "$(get_prop "$wallpaper" "$prop_name")" ]; then
    tmp=$(echo "$wallpaper" | sed "s|\([^]/]*\)$|{$prop}\1|")
  else
    tmp=$(echo "$wallpaper" | sed "s|\(.*{\s*$prop_name\s*:\s*\).*\(\s*}[^/]*\)|\1$prop_value\2|")
  fi
  
  if [ "$wallpaper" != "$tmp" ]; then
    mv "$wallpaper" "$tmp"
  fi
  printf "%s" "$tmp"
}

unset_prop() {
  wallpaper=$1
  prop_name=$2


  tmp=$(echo "$wallpaper" | sed "s|{\s*$prop_name\s*:.*}||")
  
  if [ "$wallpaper" != "$tmp" ]; then
    mv "$wallpaper" "$tmp"
  fi
  printf "%s" "$tmp"
}


case $1 in
  set)
    # wal-prop set <wallpaper-name> <props>...
    shift

    wallpaper=$1
    shift

    # check arguments
    if [ -z "$wallpaper" ] || [ -z "$1" ]; then
      printf "Use: wal-prop set <wallpaper-name> <props>...\n"
      exit 1;
    fi

    # add props to the filename
    for prop in "$@"; do
      if [ -e "$wallpaper" ]; then
        wallpaper=$(set_prop "$wallpaper" "$prop")
      else
        printf "Couldn't find '%s'\n" "$wallpaper"
        exit 2
      fi
    done
    ;;
  unset)
    # wal-prop unset <wallpaper-name> <prop-names>...
    shift

    wallpaper=$1
    shift

    # check arguments
    if [ -z "$wallpaper" ] || [ -z "$1" ]; then
      printf "Use: wal-prop unset <wallpaper-name> <prop-names>...\n"
      exit 1;
    fi

    # remove props from the filename
    for prop_name in "$@"; do
      if [ -e "$wallpaper" ]; then
        wallpaper=$(unset_prop "$wallpaper" "$prop_name")
      else
        printf "Couldn't find '%s'\n" "$wallpaper"
        exit 2
      fi
    done
    ;;
  get)
    # wal-prop get <wallpaper-name> <prop>
    shift

    wallpaper=$1
    prop_name=$2

    # check arguments
    if [ -z "$wallpaper" ] || [ -z "$prop_name" ]; then
      printf "Use: wal-prop get <wallpaper-name> <prop-name>\n"
      exit 1;
    fi

    # get the value of the specified prop
    if [ -e "$wallpaper" ]; then
      printf "%s\n" "$(get_prop "$wallpaper" "$prop_name")"
    else
      printf "Couldn't find '%s'\n" "$wallpaper"
      exit 2
    fi
    ;;
  *)
    printf "Use: wal-prop <command> [<args>]\n"
    exit 1
    ;;
esac
