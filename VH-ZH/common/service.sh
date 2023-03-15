#!/system/bin/sh

# Code
# Automatically turn off the module if 100 seconds wait at the logo
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > ${0%/*}/disable
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
sleep 5
reboot
fi
sleep 1
done

# Continues operation if the module is not disabled 
# Code

while true; do
if [ -e /sdcard/Android ];then
break
else
sleep 1
fi
done

${0%/*}/system/bin/Upapk.sh > ${0%/*}/Up.log &

sleep 100
cmd settings put global GPUTUNER_SWITCH true
pm disable com.miui.analytics

sleep 100
for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn >&2
appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
done

