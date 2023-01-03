#!/system/bin/sh

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

sleep 15

#pm disable com.xiaomi.joyose
#pm disable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
#pm disable com.google.android.gms/.chimera.GmsIntentOperationService

echo > ${0%/*}/widget.log

cmd settings put global GPUTUNER_SWITCH true
pm disable com.miui.analytics

[ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh >> ${0%/*}/widget.log &

while true; do
kncfgvv="$(grep -m1 "ListApp=" ${0%/*}/module.prop | cut -d "=" -f2 | tr ',' '\n')";
[ "$kncfgvv" ] || kncfgvv="$(pm list packages -3 | cut -d : -f2)";

for Ksksn in $kncfgvv; do
[ "$(cmd appops get $Ksksn | grep -cm1 'MIUIOP(10021)' | grep -cm1 'allow')" == 0 ] && ( cmd appops start $Ksksn 10021; cmd appops set $Ksksn 10021 allow )
[ "$(cmd appops get $Ksksn | grep -cm1 'MIUIOP(10008)' | grep -cm1 'allow')" == 0 ] && ( cmd appops start $Ksksn 10008; cmd appops set $Ksksn 10008 allow )
[ "$(cmd appops get $Ksksn | grep -cm1 'START_FOREGROUND' | grep -cm1 'allow')" == 0 ] && ( cmd appops start $Ksksn START_FOREGROUND; cmd appops set $Ksksn START_FOREGROUND allow )
[ "$(cmd appops get $Ksksn | grep -cm1 'RUN_ANY_IN_BACKGROUND' | grep -cm1 'allow')" == 0 ] && ( cmd appops start $Ksksn RUN_ANY_IN_BACKGROUND; cmd appops set $Ksksn RUN_ANY_IN_BACKGROUND allow )
[ "$(cmd appops get $Ksksn | grep -cm1 'RUN_IN_BACKGROUND' | grep -cm1 'allow')" == 0 ] && ( cmd appops start $Ksksn RUN_IN_BACKGROUND; cmd appops set $Ksksn RUN_IN_BACKGROUND allow )
done

done
