# Kakathic

# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh
# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

# Code
# Automatically turn off the module if 100 seconds wait at the logo
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ] && [ "$API" -ge 30 ];then
echo > $MODPATH/disable
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

sleep 10

#pm disable com.xiaomi.joyose
#pm disable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
#pm disable com.google.android.gms/.chimera.GmsIntentOperationService

echo > ${0%/*}/app.log
echo > ${0%/*}/widget.log

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
#cmd package compile -m speed $Ksksn
dumpsys deviceidle whitelist +$Ksksn
am set-standby-bucket $Ksksn active
#cmd appops start $Ksksn 10008
cmd appops set $Ksksn START_FOREGROUND allow
cmd appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
cmd appops set $Ksksn 10008 allow
echo "$Ksksn" >> ${0%/*}/app.log
done

cmd settings put global GPUTUNER_SWITCH true
pm disable com.miui.analytics

[ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh >> ${0%/*}/widget.log &
