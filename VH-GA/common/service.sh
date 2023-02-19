# Kakathic

# Home module magisk
MODPATH="${0%/*}"

if [ ! -e $MODPATH/ON ];then
sleep 500
am start com.google.android.apps.restore/com.google.android.apps.pixelmigrate.migrate.component.D2dWizardManager
echo > $MODPATH/ON
fi
