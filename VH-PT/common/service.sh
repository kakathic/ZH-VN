# Kakathic
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
chmod 731 /data/system/theme

while true; do
if [ -e /sdcard/Android ];then
break
else
sleep 1
fi
done

# Hỗ trợ nếu bị treo
/system/bin/Support &>/dev/null &

for tenapk in $(ls -1 ${0%/*}/app); do
Pathapk="$(pm path "$tenapk" | cut -d : -f2)"
chcon u:object_r:apk_data_file:s0 ${0%/*}/app/$tenapk
su -mm -c mount -o bind ${0%/*}/app/$tenapk "$Pathapk"
killall $tenapk
done
