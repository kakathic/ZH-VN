# Kakathic
# Tự động tắt module nếu bị treo logo
API=$(grep -m1 'ro.build.version.sdk=' /system/build.prop | cut -d = -f2)
while [ "$(getprop sys.boot_completed)" != "1" ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ] && [ "$API" -ge 30 ];then
echo > ${0%/*}/disable
rm -fr /data/system/theme_magic/*
rm -fr /data/system/theme/*
rm -fr /data/system/users/*/wallpaper*
rm -fr /data/dalvik-cache/*/*framework*
echo '
[ -e /data/unencrypted/magisk_modules ] && Adb=/data/unencrypted/magisk_modules || Adb=/data/adb/modules
while [ "$(getprop sys.boot_completed)" != "1" ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
for sksb in $Adb/*; do
echo > "$sksb/disable"
done
rm -fr /data/dalvik-cache/*/*framework*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
reboot
fi
done
' > /data/adb/service.d/Tol.sh
chmod 777 /data/adb/service.d/Tol.sh
reboot
fi
sleep 1
done
