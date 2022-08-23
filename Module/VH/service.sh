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
pm disable com.xiaomi.joyose
# pm disable com.google.android.gms/.chimera.GmsIntentOperationService

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
am set-standby-bucket $Ksksn 10
done

[ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh | tee -a ${0%/*}/widget.log
