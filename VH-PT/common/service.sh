# Kakathic
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

# Code
chmod 731 /data/system/theme

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

for ksik in $(ls -1 ${0%/*}/app); do
tenapk="$(echo -n "$ksik" | base64 -d)"
Pathapk="$(pm path "$tenapk" | cut -d : -f2)"
chcon u:object_r:apk_data_file:s0 ${0%/*}/app/$ksik
su -mm -c mount -o bind ${0%/*}/app/$ksik "$Pathapk"
killall $tenapk
done
