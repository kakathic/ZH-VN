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

pm disable com.miui.analytics
pm disable com.xiaomi.joyose
# pm disable com.google.android.gms/.chimera.GmsIntentOperationService

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
am set-standby-bucket $Ksksn 10
cmd package compile -m speed $Ksksn
done

( [ -e /data/data/com.miui.personalassistant/files/maml/res/0 ] && Appvault.sh | tee -a ${0%/*}/widget.log ) & (

db_dir="/data/data/com.miui.powerkeeper/databases"
alias user_configure="/data/tools/bin/sqlite3 $db_dir/user_configure.db"
fps_group='{"list60":"","list90":""}'
user_configure "update misc set value = '$fps_group' where name = 'fps_group'"
user_configure "update misc set value = '$fps_group' where name = 'fps_top_video_pkg'"
user_configure "update misc set value = '$fps_group' where name = 'fps_exclude_pkg'"
user_configure "update misc set value = '$fps_group' where name = 'fps_smart_group'"
user_configure "update misc set value = '$fps_group' where name = 'key_priv_names'"

pm disable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
#pm enable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
)
