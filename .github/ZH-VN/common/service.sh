# Kakathic

# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh

# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

# Code

# Automatically turn off the module if 100 seconds wait at the logo
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
echo '
[ -e /data/unencrypted/magisk_modules ] && Adb=/data/unencrypted/magisk_modules || Adb=/data/adb/modules
while [ "$(getprop sys.boot_completed)" != "1" ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
for sksb in $Adb/*; do
echo > "$sksb/disable"
done
rm -fr /data/dalvik-cache/*/*framework* /data/system/package_cache/* /data/resource-cache/* /data/adb/service.d/Tol.sh
reboot
fi
done
' > /data/adb/service.d/Tol.sh
chmod 777 /data/adb/service.d/Tol.sh
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

pm disable com.miui.analytics
#pm disable com.xiaomi.joyose
#pm disable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
#pm disable com.google.android.gms/.chimera.GmsIntentOperationService

echo > ${0%/*}/app.log
echo > ${0%/*}/widget.log

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
cmd package compile -m speed $Ksksn
dumpsys deviceidle whitelist +$Ksksn
am set-standby-bucket $Ksksn active
cmd appops set $Ksksn 10008 allow
cmd appops start $Ksksn 10008
cmd appops set $Ksksn START_FOREGROUND allow
cmd appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
cmd appops set $Ksksn READ_CLIPBOARD allow
cmd appops set $Ksksn WRITE_CLIPBOARD allow
echo "$Ksksn" >> ${0%/*}/app.log
done

[ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh >> ${0%/*}/widget.log 
