# Kakathic
# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.
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

chmod 0731 /data/system/theme

# Continues operation if the module is not disabled 
# Code

for tenapk in $(find ${0%/*}/sys_app/*.txt); do
su -mm -c mount -o bind ${tenapk%.*} "$(cat $tenapk)"
done

while true; do
if [ -e /sdcard/Android ];then
break
else
sleep 1
fi
done

for tenapk in $(find ${0%/*}/app/*.txt); do
su -mm -c mount -o bind ${tenapk%.*} "$(cat $tenapk)"
killall $tenapk
done
