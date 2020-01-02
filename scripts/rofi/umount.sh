#!/usr/bin/env sh

# A dmenu prompt to unmount drives.
# Provides you with mounted partitions, select one to unmount.
# Drives mounted at /, /boot and /home will won't be listed.

unmountusb() {
	[ -z "$drives" ] && exit
	chosen=$(echo "$drives" | rofi -dmenu -i -p "Unmount which drive?" | awk '{print $1}')
	[ -z "$chosen" ] && exit
	sudo -A umount "$chosen" && notify-send " USB unmounting" "$chosen unmounted."
}

unmountandroid() { \
	chosen=$(awk '/simple-mtpfs/ {print $2}' /etc/mtab | dmenu -i -p "Unmount which device?")
	[ -z "$chosen" ] && exit
	sudo -A umount -l "$chosen" && notify-send " Android unmounting" "$chosen unmounted."
}

asktype() { \
	case "$(printf "USB\\nAndroid" | dmenu -i -p "Unmount a USB drive or Android device?")" in
		USB) unmountusb ;;
		Android) unmountandroid ;;
	esac
}

drives=$(lsblk -nrpo "name,type,size,mountpoint" | awk '$2=="part"&&$4!~/\/boot|\/home$|SWAP/&&length($4)>1{printf "%s (%s)\n",$4,$3}')

if ! grep simple-mtpfs /etc/mtab; then
	[ -z "$drives" ] && notify-send " USB unmounting" "Couldn't find anything to unmount." &&  exit
	echo "Unmountable USB drive detected."
	unmountusb
else
	if [ -z "$drives" ]
	then
		echo "Unmountable Android device detected."
	       	unmountandroid
	else
		echo "Unmountable USB drive(s) and Android device(s) detected."
		asktype
	fi
fi
