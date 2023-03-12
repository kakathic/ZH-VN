# Kakathic

# Home module magisk
MODPATH="${0%/*}"
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
sleep 5
reboot
fi
sleep 1
done

# Hỗ trợ nếu bị treo
/system/bin/Support &>/dev/null &

if [ ! -e $MODPATH/Vip ];then
sleep 200

dhrnfn(){ 
for rbeh in $2; do
pm grant "$1" $rbeh
done
appops get $1; }

# Danh bạ google 
dhrnfn com.google.android.syncadapters.contacts \
"
android.permission.GET_ACCOUNTS
android.permission.READ_CONTACTS
android.permission.WRITE_CONTACTS
"

# Lịch google 
dhrnfn com.google.android.syncadapters.calendar \
"
android.permission.WRITE_CALENDAR
android.permission.READ_CALENDAR
"

# khôi phục google 
dhrnfn com.google.android.apps.restore \
"
android.permission.ACCESS_FINE_LOCATION
android.permission.ACCESS_COARSE_LOCATION
android.permission.READ_EXTERNAL_STORAGE
android.permission.WRITE_EXTERNAL_STORAGE
android.permission.READ_CONTACTS
android.permission.READ_CALL_LOG
android.permission.WRITE_CONTACTS
android.permission.WRITE_CALL_LOG
"

# Lịch sử vị trí 
dhrnfn com.google.android.gms.location.history \
"
android.permission.ACTIVITY_RECOGNITION
android.permission.ACCESS_FINE_LOCATION
android.permission.ACCESS_COARSE_LOCATION
android.permission.ACCESS_BACKGROUND_LOCATION
android.permission.ACTIVITY_RECOGNITION
"

# khung dịch vụ 
dhrnfn com.google.android.gsf \
"
com.google.android.providers.talk.permission.READ_ONLY
com.google.android.providers.talk.permission.WRITE_ONLY
android.permission.WRITE_CONTACTS
android.permission.GET_ACCOUNTS
android.permission.READ_CONTACTS
android.permission.READ_LOGS
android.permission.READ_PHONE_STATE
android.permission.DUMP
android.permission.INTERACT_ACROSS_USERS
"

# Android auto
dhrnfn com.google.android.projection.gearhead \
"
android.permission.ACCESS_FINE_LOCATION
android.permission.ACCESS_COARSE_LOCATION
android.permission.CALL_PHONE
android.permission.BLUETOOTH_SCAN
android.permission.BLUETOOTH_CONNECT
android.permission.READ_CALENDAR
android.permission.READ_CONTACTS
android.permission.READ_CALL_LOG
android.permission.SEND_SMS
android.permission.RECORD_AUDIO
android.permission.RECEIVE_SMS
android.permission.READ_PHONE_STATE
android.permission.SYSTEM_ALERT_WINDOW
com.google.android.gms.permission.CAR_SPEED
"

echo > $MODPATH/Vip
fi

if [ ! -e $MODPATH/ON ];then
am start com.google.android.apps.restore/com.google.android.apps.pixelmigrate.migrate.component.D2dWizardManager
echo > $MODPATH/ON
fi
