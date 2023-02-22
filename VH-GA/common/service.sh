# Kakathic

# Home module magisk
MODPATH="${0%/*}"
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
rm -fr /data/system/package_cache/* /data/resource-cache/* /data/dalvik-cache/*/*framework*
reboot
fi
sleep 1
done

if [ ! -e $MODPATH/Vip ];then
sleep 100

jdhfjd(){
for kdhddj in $1; do
appops set $2 $kdhddj allow
done; }

jdhfjd "READ_CALENDAR
WRITE_CALENDAR" com.google.android.syncadapters.calendar

jdhfjd "
MANAGE_CREDENTIALS
GET_ACCOUNTS
READ_CONTACTS
WRITE_CONTACTS
" com.google.android.syncadapters.contacts

jdhfjd "
ACTIVATE_PLATFORM_VPN
ACTIVATE_VPN
ACTIVITY_RECOGNITION
FINE_LOCATION
COARSE_LOCATION
MOCK_LOCATION
" com.google.android.gms.location.history

jdhfjd "
FINE_LOCATION
COARSE_LOCATION
READ_CONTACTS
READ_CALL_LOG
READ_EXTERNAL_STORAGE
READ_CONTACTS
WRITE_EXTERNAL_STORAGE
WRITE_CONTACTS
WRITE_CALL_LOG
" com.google.android.apps.restore

echo > $MODPATH/Vip
fi


if [ ! -e $MODPATH/ON ];then
sleep 500
am start com.google.android.apps.restore/com.google.android.apps.pixelmigrate.migrate.component.D2dWizardManager
echo > $MODPATH/ON
fi
