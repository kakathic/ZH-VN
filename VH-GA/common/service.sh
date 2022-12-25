# Kakathic

# Home module magisk
MODPATH="${0%/*}"

# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

# Code
module_exec() {
    if [ ! -z magiskhide ]; then
        MONGWU_SAID=`magisk --denylist $@`
    else
        MONGWU_SAID=`magiskhide $@`
    fi
}
sleep 10

if [ -e $MODPATH/NO ];then
    module_exec enable
    module_exec rm com.google.android.gms
    pm install -g --dont-kill --install-reason 3 $MODPATH/system/product/priv-app/PrebuiltGmsCoreRvc/PrebuiltGmsCoreRvc.apk
    pm install -g --dont-kill --install-reason 3 $MODPATH/system/product/priv-app/Phonesky/Phonesky.apk
    sleep 10
    pm uninstall -k com.google.android.gms
    pm uninstall -k com.android.vending
    # pm clear com.google.android.gms
    module_exec add com.google.android.gms
    sleep 10
    module_exec rm com.google.android.gms
fi

if [ ! -e $MODPATH/ON ];then
sleep 500
am start com.google.android.apps.restore/com.google.android.apps.pixelmigrate.migrate.component.D2dWizardManager
echo > $MODPATH/ON
fi
