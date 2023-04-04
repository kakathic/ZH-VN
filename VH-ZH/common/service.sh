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

#${0%/*}/system/bin/Upapk.sh > ${0%/*}/Up.log &

sleep 100
cmd settings put global GPUTUNER_SWITCH true
pm disable com.miui.analytics

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn >&2
appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
done

if [ -e /sdcard/vip ];then
while true; do
kncfgvv="$(grep -m1 "ListApp=" ${0%/*}/module.prop | cut -d "=" -f2 | tr ',' '\n')";
[ "$kncfgvv" ] || kncfgvv="$(pm list packages -3 | cut -d : -f2)";
for Ksksn in $kncfgvv; do
dumpsys deviceidle whitelist +$Ksksn >&2
appops set $Ksksn 10008 allow
appops set $Ksksn 10021 allow
appops set $Ksksn RUN_IN_BACKGROUND allow
appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
appops set $Ksksn START_FOREGROUND allow
done
sleep 120
done
fi
