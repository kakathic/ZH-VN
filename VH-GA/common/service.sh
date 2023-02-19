# Kakathic

# Home module magisk
MODPATH="${0%/*}"
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
reboot
fi
sleep 1
done

if [ ! -e $MODPATH/ON ];then
sleep 500
am start com.google.android.apps.restore/com.google.android.apps.pixelmigrate.migrate.component.D2dWizardManager
echo > $MODPATH/ON
fi
