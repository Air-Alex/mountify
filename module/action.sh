#!/bin/sh
# action.sh
# this script is part of mountify
# No warranty.
# No rights reserved.
# This is free software; you can redistribute it and/or modify it under the terms of The Unlicense.
PATH=/data/adb/ap/bin:/data/adb/ksu/bin:/data/adb/magisk:$PATH
MODDIR="/data/adb/modules/mountify"

echo "[+] mountify"
echo "[+] extended status"
printf "\n\n"

# hunt logging floder
[ -w /tmp ] && LOG_FOLDER=/tmp/mountify
[ -w /sbin ] && LOG_FOLDER=/sbin/mountify
[ -w /debug_ramdisk ] && LOG_FOLDER=/debug_ramdisk/mountify

if [ -f "$LOG_FOLDER/before" ] && [ -f "$LOG_FOLDER/after" ]; then
	diff "$LOG_FOLDER/before" "$LOG_FOLDER/after" | grep "overlay /"
else
	echo "[!] no logs found!"
fi

# ksu and apatch auto closes
# make it wait 20s so we can read
if [ -z "$MMRL" ] && [ -z "$KSU_NEXT" ]  && { [ "$KSU" = "true" ] || [ "$APATCH" = "true" ]; }; then
	sleep 20
fi

# EOF
