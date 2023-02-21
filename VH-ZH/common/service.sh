#!/system/bin/sh

# Code
# Automatically turn off the module if 100 seconds wait at the logo
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
rm -fr /data/system/package_cache/* /data/resource-cache/* /data/dalvik-cache/*/*framework*
reboot
fi
sleep 1
done


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
