# Kakathic
chmod 731 /data/system/theme
while true; do
echo > /sdcard/1998kk
if [ -e /sdcard/1998kk ];then
rm -fr /sdcard/1998kk
break
else
sleep 2
fi
done

sleep 5

pm disable com.miui.analytics
#pm disable com.xiaomi.joyose
pm disable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
# pm disable com.google.android.gms/.chimera.GmsIntentOperationService

echo > ${0%/*}/app.log
echo > ${0%/*}/widget.log

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn
cmd appops set $Ksksn START_FOREGROUND allow
cmd appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
cmd appops set $Ksksn 10008 allow
cmd appops set $Ksksn 10007 allow
am set-standby-bucket $Ksksn active
cmd package compile -m speed $Ksksn
echo "$Ksksn" >> ${0%/*}/app.log
done

[ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh >> ${0%/*}/widget.log 
