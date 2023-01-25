# Kakathic

ui_print "  Giai nen Gapps"
ui_print " "

# Unpack 
[ "$Tkkg" == 1 ] && unzip -qo "$ZIP" 'lib/*' -d /tmp || abort
chmod -R 755 $TMPI


ui_print "  Cai dat"
ui_print " "

[ "$API" == 32 ] && API=31
[ -e "$TMPI/FL-$API.zip" ] && unzip -qo "$TMPI/FL-$API.zip" -d $TMPI || abort "- Loi khong tim thay Gapps, API: $API"
set_perm_recursive $TMPI 0 0 0755 0644 2>/dev/null

[ -e /system/product/overlay ] && Tsssj="/system"
[ -e /system/system_ext/priv-app ] && Tsskk="/system"

if [ "$API" -le 29 ];then
Lxxx="$Tsssj/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
$Tsssj/product/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
$Tsssj/product/app/GoogleLocationHistory/GoogleLocationHistory.apk
$Tsssj/product/app/LatinImeGoogle/LatinImeGoogle.apk
$Tsssj/product/app/ModuleMetadataGooglePrebuilt/ModuleMetadataGooglePrebuilt.apk
$Tsssj/product/priv-app/AndroidAutoStub/AndroidAutoStub.apk
$Tsssj/product/priv-app/CarrierConfig/CarrierConfig.apk
$Tsssj/product/priv-app/CarrierServices/CarrierServices.apk
$Tsssj/product/priv-app/ConfigUpdater/ConfigUpdater.apk
$Tsssj/product/priv-app/GmsCore/GmsCore.apk
$Tsssj/product/priv-app/GoogleFeedback/GoogleFeedback.apk
$Tsssj/product/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
$Tsssj/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
$Tsssj/product/priv-app/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk
$Tsssj/product/priv-app/GoogleRestore/GoogleRestore.apk
$Tsssj/product/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
$Tsssj/product/priv-app/SetupWizard/SetupWizard.apk"
fi

if [ "$API" == 30 ];then
Lxxx="$Tsssj/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
$Tsssj/product/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
$Tsssj/product/app/GoogleLocationHistory/GoogleLocationHistory.apk
$Tsssj/product/app/LatinImeGoogle/LatinImeGoogle.apk
$Tsssj/product/app/com.google.android.modulemetadata/com.google.android.modulemetadata.apk
$Tsssj/product/priv-app/AndroidAutoStub/AndroidAutoStub.apk
$Tsssj/product/priv-app/CarrierServices/CarrierServices.apk
$Tsssj/product/priv-app/ConfigUpdater/ConfigUpdater.apk
$Tsssj/product/priv-app/GmsCore/GmsCore.apk
$Tsssj/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
$Tsssj/product/priv-app/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk
$Tsssj/product/priv-app/GoogleRestore/GoogleRestore.apk
$Tsskk/system_ext/priv-app/GoogleFeedback/GoogleFeedback.apk
$Tsskk/system_ext/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
$Tsskk/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
$Tsskk/system_ext/priv-app/SetupWizard/SetupWizard.apk"
fi

if [ "$API" == 31 ] ||  "$API" == 32 ];then
Lxxx="$Tsssj/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
$Tsssj/product/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
$Tsssj/product/app/GoogleLocationHistory/GoogleLocationHistory.apk
$Tsssj/product/app/LatinImeGoogle/LatinImeGoogle.apk
$Tsssj/product/app/com.google.android.modulemetadata/com.google.android.modulemetadata.apk
$Tsssj/product/app/com.google.mainline.telemetry/com.google.mainline.telemetry.apk
$Tsssj/product/priv-app/AndroidAutoStub/AndroidAutoStub.apk
$Tsssj/product/priv-app/CarrierServices/CarrierServices.apk
$Tsssj/product/priv-app/GmsCore/GmsCore.apk
$Tsssj/product/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
$Tsssj/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
$Tsssj/product/priv-app/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk
$Tsssj/product/priv-app/GoogleRestore/GoogleRestore.apk
$Tsskk/system_ext/priv-app/GoogleFeedback/GoogleFeedback.apk
$Tsskk/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
$Tsskk/system_ext/priv-app/SetupWizard/SetupWizard.apk"
fi

if [ "$API" -ge 33 ];then
Lxxx="$Tsssj/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
$Tsssj/product/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
$Tsssj/product/app/GoogleLocationHistory/GoogleLocationHistory.apk
$Tsssj/product/app/LatinImeGoogle/LatinImeGoogle.apk
$Tsssj/product/app/com.google.android.modulemetadata/com.google.android.modulemetadata.apk
$Tsssj/product/app/com.google.mainline.telemetry/com.google.mainline.telemetry.apk
$Tsssj/product/priv-app/AndroidAutoStub/AndroidAutoStub.apk
$Tsssj/product/priv-app/CarrierServices/CarrierServices.apk
$Tsssj/product/priv-app/ConfigUpdater/ConfigUpdater.apk
$Tsssj/product/priv-app/GmsCore/GmsCore.apk
$Tsssj/product/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
$Tsssj/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
$Tsssj/product/priv-app/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk
$Tsssj/product/priv-app/GoogleRestore/GoogleRestore.apk
$Tsssj/product/priv-app/PersonalSafety/PersonalSafety.apk
$Tsskk/system_ext/priv-app/GoogleFeedback/GoogleFeedback.apk
$Tsskk/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk"
fi

for gwmeg in $Lxxx; do
[ -e "$gwmeg" ] && rm -fr ${gwmeg%/*}
[ -L "$gwmeg" ] && rm -fr ${gwmeg%/*}
done

if [ -e $TMPI/product ];then
[ -e /system/product/overlay ] && PRODUCT="/system/product" || PRODUCT="/product"
cp -rf $TMPI/product/* $PRODUCT
fi

if [ -e $TMPI/system_ext ];then
[ -e /system/system_ext/app ] && SYSTEM_EXT="/system/system_ext" || SYSTEM_EXT="/system_ext"
cp -rf $TMPI/system_ext/* $SYSTEM_EXT
fi

# Dịch vụ gg
Ptkkf="$(echo $Tsssj/*/etc/permissions/*cn.google*.xml)"
if [ "$(grep -cm1 cn.google.services $Ptkkf)" == 1 ];then
sed -i -e '/cn.google.services/d' -e '/services_updater/d' "$Ptkkf"
fi

fnfnte="/system/priv-app/MiBrowser/MiBrowser.apk
/cust/priv-app/MiBrowser/MiBrowser.apk
/cust/app/SogouInput/SogouInput.apk
/system/app/SogouInput/SogouInput.apk
"
for kkddx in $fnfnte; do
[ -e "$kkddx" ] && rm -fr ${kkddx%/*}
[ -L "$kkddx" ] && rm -fr ${kkddx%/*}
done

