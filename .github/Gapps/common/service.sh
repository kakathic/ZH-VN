# Kakathic

# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh

# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

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

module_exec() {
    if [ ! -z magiskhide ]; then
        MONGWU_SAID=`magisk --denylist $@`
    else
        MONGWU_SAID=`magiskhide $@`
    fi
}
    if [ -e $MODPATH/NO ];then
    module_exec enable
    module_exec rm com.google.android.gms
    pm install -g --dont-kill --install-reason 3 $MODPATH/system/product/priv-app/GmsCore/GmsCore.apk
    pm install -g --dont-kill --install-reason 3 $MODPATH/system/product/priv-app/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk
    pm uninstall -k com.google.android.gms
    pm uninstall -k com.android.vending
    module_exec add com.google.android.gms
    sleep 2
    module_exec rm com.google.android.gms
    fi
