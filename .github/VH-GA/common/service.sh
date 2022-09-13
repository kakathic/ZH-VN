# Kakathic

# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh

# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

# Code

module_exec() {
    if [ ! -z magiskhide ]; then
        MONGWU_SAID=`magisk --denylist $@`
    else
        MONGWU_SAID=`magiskhide $@`
    fi
}
if [ -e $MODPATH/NO ];then
sleep 15
boot=`getprop sys.boot_completed`
if [ $boot -eq 1 ]; then
    module_exec enable
    sleep 5
    module_exec rm com.google.android.gms
    sleep 5
    pm install -g $MODPATH/system/product/priv-app/GmsCore/GmsCore.apk
    sleep 10
    pm uninstall com.google.android.gms
    sleep 10
    # pm clear com.google.android.gms
    module_exec add com.google.android.gms
    sleep 5
    module_exec rm com.google.android.gms
fi
fi
