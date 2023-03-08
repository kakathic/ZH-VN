#!/system/bin/sh

# Code
# Automatically turn off the module if 100 seconds wait at the logo
MODPATH="${0%/*}"
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
sleep 5
reboot
fi
sleep 1
done

resetprop ro.khu.vuc VN
resetprop ro.vi.tri vn
resetprop ro.khu.vuc.cn CN
resetprop ro.vi.tri.cn cn

# Continues operation if the module is not disabled 
# Code

RD="$RANDOM"
while true; do
echo > /sdcard/$RD
if [ -e /sdcard/$RD ];then
rm -fr /sdcard/$RD
break
else
sleep 2
fi
done

cmd settings put global GPUTUNER_SWITCH true
pm disable com.miui.analytics

sleep 200
for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn >&2
appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
done

