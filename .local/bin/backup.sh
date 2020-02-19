#!/usr/bin/env sh

DAY="$(date +%a)"
BACKUP_FOLDER="/media/shared-storage/arch-linux-backup"
FOLDERS_TO_BACKUP="/home /etc"
TO_EXCLUDE="/home/dani/.cache/*"  


# check if today a backup has already been done
if [ "$1" != "-f" ]; then
  grep "$(date +"%_d %b %Y")" "$BACKUP_FOLDER/log" > /dev/null && echo "Backup already colpeted today" && exit
fi


# creates a folder for the backup
mkdir -p "$BACKUP_FOLDER/$DAY"

# creates a list of the installed packages
pacman -Qqe > "$BACKUP_FOLDER/$DAY/installed-packages"

# creates a backup of the specified folders
for FOLDER in $FOLDERS_TO_BACKUP; do
  rsync -aAXv --delete "$FOLDER" "$BACKUP_FOLDER/$DAY" --exclude="$TO_EXCLUDE"
done

# log the backup
echo "Backup completed on:  $(date)" >> "$BACKUP_FOLDER/log"


# tell the user the state of the backup
notify-send " Backup completed"
