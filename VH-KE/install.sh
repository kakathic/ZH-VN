# Kakathic

## Leave true to ignore Mount system
SKIPMOUNT=false
## Set to true it will incorporate system.prop into build.prop
PROPFILE=true
## For true post-fs-data.sh to be used
POSTFSDATA=true
## Set to true for service.sh to be used
LATESTARTSERVICE=true

# Internet
User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Viewonline(){
[ -e /system/bin/curl ] && curl -s -k -G -L -H "$User" --connect-timeout 20 "$1" || wget -q --header "$User" --no-check-certificate -O - "$1"; }
Viewonline "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/.github/Tools/Main.sh" > $TMPDIR/Main.sh
[ "$(grep -c '# Kakathic' $TMPDIR/Main.sh)" == 1 ] && . $TMPDIR/Main.sh || abort "! Lỗi tải dữ liệu.";

## Start the installation
on_install(){

ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Cho phép gỡ bỏ ứng dụng Getapps ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP gettapp)" ];then
gettttap=$(GP gettapp)
ui_print
ui_print2 "Chọn: $gettttap"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
gettttap=$input
fi

ui_print "- Bật tính năng mod MIUI ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP global)" ];then
chinann=$(GP global)
ui_print
ui_print2 "Chọn: $chinann"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
chinann=$input
fi

if [ "$chinann" == 1 ];then
ui_print "- Fix thông báo miui"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP ram)" ];then
Vipno=$(GP ram)
ui_print
ui_print2 "Chọn: $Vipno"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Vipno=$input
fi
else
Vipno=0
fi

ui_print "- Bật tính năng bàn phím nâng cao ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP banphim)" ];then
keyyyy=$(GP banphim)
ui_print
ui_print2 "Chọn: $keyyyy"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
keyyyy=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH

## code
Xu_install busybox
Xu_install jre
Xu_install smali 2.5.2
Xu_install baksmali 2.3.4
Xu_install zipalign
Xu_install zip
Xu_install toybox

sed(){ toybox sed "$@";}
grep(){ toybox grep "$@";}
cut(){ toybox cut "$@";}

TTM "$APK/tmp
/sdcard/VH-MI/color
/data/tools/apk"

if [ ! -e "/sdcard/VH-MI/color/Tối.ini" ];then
if [ "$API" -ge 31 ];then
cp -f $TMPDIR/12-Tối.ini /sdcard/VH-MI/color/Tối.ini
cp -f $TMPDIR/12-Sáng.ini /sdcard/VH-MI/color/Sáng.ini
else
cp -f $TMPDIR/*.ini /sdcard/VH-MI/color
fi
fi

echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh

# Copy file & apk
[ "$keyyyy" == 1 ] && CPapk com.miui.phrase
if [ "$keyyyy" == 2 ] || [ "$chinann" == 1 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
fi
if [ "$chinann" == 1 ];then
CPfile 'framework'
CPfile 'services'
CPapk com.miui.powerkeeper
CPapk com.android.systemui
fi
if [ "$chinann" == 1 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
CPfile ''$miuik'services'
fi

ui_print2 "Giải nén apk"
ui_print
# giải nén file
Giainen
ui_print2 "Chỉnh sửa apk"
ui_print
# Mod install

if [ "$gettttap" == 1 ];then
[ "$(pm path com.xiaomi.market | grep -cm1 '/data/')" == 1 ] || pm install -r "$(pm path com.xiaomi.market | cut -d : -f2)" >&2
FREEZE "$(echo /*/*/*SuperMarket*)"

Vsmali ".method private checkSystemSelfProtection(Z)V" \
".end method" \
'.method private checkSystemSelfProtection(Z)V
    .locals 1
    return-void
.end method' \
''$APK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkSysAppCrack()Z" \
".end method" \
'.method private checkSysAppCrack()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
''$APK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkAppSignature(\[Landroid/content/pm/Signature;Ljava/lang/String;Z)Z" \
".end method" \
'.method private checkAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$APK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private onPostNotification()V" \
".end method" \
'.method private onPostNotification()V
    .locals 11
	return-void
.end method' \
''$APK/$miuik'services/classes*'

Vsmali ".method private static compareSignatures" \
".end method" \
'.method private static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
    .registers 9
    const/4 v0, 0x0
    return v0
.end method' \
''$APK/$miuik'services/classes*/com/miui/server/*'
fi

#mod 2
if [ "$chinann" == 1 ];then
if [ -e "$(echo $APK/framework/classes*/android/app/ApplicationStub.smali)" ];then
cp -rf $TMPDIR/Test.smali $(echo $APK/framework/classes*/android/app/ApplicationStub.smali)
echo $APK/framework/classes*/android/app/ApplicationStub.smali >> $APK/framework/class
elif [ -e "$(echo $APK/framework/classes*/android/app/ApplicationInjector.smali)" ];then
cp -rf $TMPDIR/Test.smali $(echo $APK/framework/classes*/android/app/ApplicationInjector.smali)
sed -i "s|android/app/ApplicationStub|android/app/ApplicationInjector|g" $(echo $APK/framework/classes*/android/app/ApplicationInjector.smali)
echo $APK/framework/classes*/android/app/ApplicationInjector.smali >> $APK/framework/class
else
Xan "! không tìm thấy file Để mod"
fi

Thaythe '\"MIUI \"' '\"VH \"' $APK/com.android.settings/classes*/com/android/settings/device/MiuiAboutPhoneUtils.smali

opentc(){
wtnw="$(grep -m1 "$1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali | awk '{print $2}')"
Thaythe "$1" "$1 \n const/4 $wtnw 0x1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali
}

opentc 'Lcom/android/settings/R\$id;->security_status:I'
opentc 'Lcom/android/settings/R\$id;->location_settings:I'
opentc 'Lcom/android/settings/R\$id;->privacy_settings:I'
Thaythe "sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z" "const/4 v1, 0x1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali

Autoone "Lmiui/os/Build;->IS_GLOBAL_BUILD:Z" "0x1" "$APK/com.android.settings/classes*/com/android/settings/search/tree/LocaleSettingsTree.smali"

Vsmali '.method public static supportPartialScreenShot()Z' \
'.end method' \
'.method public static supportPartialScreenShot()Z
    .registers 2
    const/4 v1, 0x1
    return v1
.end method' \
"$APK/com.android.settings/classes*/*"

Vsmali '.method public static isSupportSecuritySettings(Landroid/content/Context;)Z' \
'.end method' \
'.method public static isSupportSecuritySettings(Landroid/content/Context;)Z
    .registers 1
    const/4 p0, 0x1
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/MiuiUtils.smali"

Vsmali '.method public static supportPaperEyeCare()Z' \
'.end method' \
'.method public static supportPaperEyeCare()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.settings/classes*/*"

Vsmali '.method public static isNotSupported()Z' \
'.end method' \
'.method public static isNotSupported()Z
    .registers 2
    const/4 v1, 0x0
    return v1
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/lab/*"

Vsmali '.method public static isSupportUninstallSysApp(Landroid/content/Context;)Z' \
'.end method' \
'.method public static isSupportUninstallSysApp(Landroid/content/Context;)Z
    .registers 3
    const/4 p0, 0x1
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali"

# mod màu cam popup
Vsmali '.method public getAvailabilityStatus()I' \
'.end method' \
'.method public getAvailabilityStatus()I
    .registers 1
    const/4 p0, 0x2
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/special/ColorLampEntryController.smali"

Thaythe "isNeedShowColorLamp()Z" "isShowFreeformGuideSetting()Z" "$APK/com.android.settings/classes*/com/android/settings/popup/PopupSettings.smali"

dnrnr="$(grep -m1 "Lcom/android/settings/utils/SettingsFeatures;->IS_NEED_REMOVE_KID_SPACE:Z" $APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali | awk '{print $2}')"

[ "$dnrnr" ] && Thaythe 'sput-boolean '$dnrnr' Lcom/android/settings/utils/SettingsFeatures;->IS_NEED_REMOVE_KID_SPACE:Z' 'const/4 '$dnrnr' 0x1 \n sput-boolean '$dnrnr' Lcom/android/settings/utils/SettingsFeatures;->IS_NEED_REMOVE_KID_SPACE:Z' "$APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali"

Thaythe 'const-string v2, \"langType\"' 'const-string v2, \"langType\" \n const-string v1, \"en\"' "$APK/com.android.settings/classes*/com/android/settings/device/DeviceParamsInitHelper.smali"
sed -i -z '1s|const-string v1, "en"|const-string p1, "en"|' $APK/com.android.settings/classes*/com/android/settings/device/DeviceParamsInitHelper.smali

Vsmali '.method public static isShowQuickReplySetting()Z' \
'.end method' \
'.method public static isShowQuickReplySetting()Z
    .registers 3
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali"

Vsmali '.method public static isNeedHideShopEntrance(Landroid/content/Context;J)Z' \
'.end method' \
'.method public static isNeedHideShopEntrance(Landroid/content/Context;J)Z
    .registers 9
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali"

Vsmali '.method public static isRapidCharge(I)Z' \
'.end method' \
'.method public static isRapidCharge(I)Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/MiuiUtils.smali"

Vsmali '.method public static shouldShowAiButton()Z' \
'.end method' \
'.method public static shouldShowAiButton()Z
    .registers 2
    const/4 v1, 0x0
    return v1
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/MiuiUtils.smali"

Vsmali '.method public static isSupportSafetyEmergencySettings(Landroid/content/Context;)Z' \
'.end method' \
'.method public static isSupportSafetyEmergencySettings(Landroid/content/Context;)Z
    .registers 1
    const/4 p0, 0x1
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/MiuiUtils.smali"

Vsmali ".method private static isPermanentRights(Lmiui/drm/DrmManager\$RightObject;)Z" \
".end method" \
'.method private static isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$APK/$miuik'framework/classes*/miui/drm/DrmManager.smali'

Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" ''$APK/$miuik'framework/classes*/miui/drm/DrmManager.smali'
Thaythe "com.android.packageinstaller" "t.me.kakathic" ''$APK/$miuik'services/classes*/com/android/server/pm/PackageManagerServiceImpl.smali'

#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/framework/classes*/android/app/ApplicationPackageManager.smali"
#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/framework/classes*/android/app/DownloadManager.smali"
#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/services/classes*/com/android/server/pm/PackageManagerServiceStub.smali"

echo "ro.product.vip=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$APK/$miuik'services/classes*'

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/controlcenter/policy/GoogleController.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/qs/tiles/DriveModeTile.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/qs/MiuiNotificationHeaderView.smali"

ekyl3="
com/android/server/AppOpsServiceState
com/android/server/AppOpsServiceStubImpl
com/android/server/alarm/AlarmManagerServiceStubImpl
com/android/server/am/BroadcastQueueImpl
com/android/server/am/ProcessManagerService
com/android/server/display/BrightnessMappingStrategyImpl
com/android/server/location/GnssCollectDataImpl
com/android/server/net/MiuiNetworkPolicyAppBuckets
com/android/server/net/MiuiNetworkPolicyManagerService
com/android/server/net/MiuiNetworkPolicyQosUtils
com/android/server/notification/NotificationManagerServiceImpl
"
for bffdb in $ekyl3; do
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/'$bffdb'.smali'
done

twwt="
android/telephony/MiuiCellSignalStrength
android/widget/ToastInjectorImpl
android/view/ViewRootImplInjector
com/android/internal/app/ChooserActivityStubImpl
com/android/internal/app/ResolverActivityStubImpl
com/miui/mishare/app/NearbyUtils
miui/content/pm/PreloadedAppPolicy
miui/provider/MiProfile
miui/security/SecurityManager
miui/securityspace/XSpaceConstant
miui/telephony/*
miui/view/MiuiSecurityPermissionHandler
"
for dhrb in $twwt; do
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/'$dhrb'.smali'
done



Tats(){
Vsmali ".method public isRunAnyInBackgroundAppOpsAllowed(ILjava/lang/String;)Z" \
".end method" \
'.method public isRunAnyInBackgroundAppOpsAllowed(ILjava/lang/String;)Z
    .registers 5
    const/4 v1, 0x1
    return v1
.end method' \
"$APK/services/classes*/com/android/server/AppStateTrackerImpl.smali"

Vsmali ".method public isForegroundService()Z" \
".end method" \
'.method public isForegroundService()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/services/classes*/com/android/server/notification/NotificationRecord.smali"

Vsmali ".method public isBubbleNotification()Z" \
".end method" \
'.method public isBubbleNotification()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/framework/classes*/android/app/Notification.smali"

Vsmali ".method public isForegroundService()Z" \
".end method" \
'.method public isForegroundService()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/framework/classes*/android/app/Notification.smali"

Vsmali ".method public static isForegroundService(I)Z" \
".end method" \
'.method public static isForegroundService(I)Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/framework/classes*/android/app/ActivityManager.smali"

Vsmali ".method public static isSleepModeViewVisable(Z)Z" \
".end method" \
'.method public static isSleepModeViewVisable(Z)Z
    .registers 3
const/4 v1, 0x1
    return v1
.end method' \
"$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/utils/Utils.smali"
}

yentj="
com/miui/powerkeeper/customerpower/CustomerPowerCheck
com/miui/powerkeeper/statemachine/*
com/miui/powerkeeper/ui/NightAbnormalReceiver
com/miui/powerkeeper/utils/*
miui/payment/PaymentManager
miui/telephony/TelephonyManager
miuix/springback/view/SpringBackLayout
com/miui/powerkeeper/millet/MilletConfig
"
for ykhke in $yentj; do
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/$ykhke.smali"
done

if [ "$Vipno" == 1 ];then
Vsmali ".method hasForegroundServices()Z" \
".end method" \
'.method hasForegroundServices()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/services/classes*/com/android/server/am/ProcessServiceRecord.smali"
fi

fi

if [ "$keyyyy" == 1 ];then
TTM "$TMPDIR/banphim/nightmode
/sdcard/VH-MI/color
$MODPATH/system/media/theme/default"
# Sáng
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Sáng.ini)'</color>
<dimen name="input_bottom_height">45.599976dp</dimen>
<dimen name="input_bottom_button_height">28.5dp</dimen>
<dimen name="input_bottom_button_margin_top">2.5dp</dimen>
</MIUI_Theme_Values>' > $TMPDIR/banphim/theme_values.xml
# Tối
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Tối.ini)'</color>
<dimen name="input_bottom_height">45.599976dp</dimen>
<dimen name="input_bottom_button_height">28.5dp</dimen>
<dimen name="input_bottom_button_margin_top">2.5dp</dimen>
</MIUI_Theme_Values>' > $TMPDIR/banphim/nightmode/theme_values.xml
# Đóng gói 
cd $TMPDIR/banphim
zip -qr $MODPATH/system/media/theme/default/com.miui.phrase.zip *
mv $MODPATH/system/media/theme/default/com.miui.phrase.zip $MODPATH/system/media/theme/default/com.miui.phrase

Listbp="$(ime list -s | cut -d '/' -f1 | sed -e '/com.iflytek.inputmethod.miui/d' -e '/com.sohu.inputmethod.sogou.xiaomi/d' -e '/com.android.cts.mockime/d' -e '/com.baidu.input_mi/d' -e '/com.miui.securityinputmethod/d')"
Dso1=0

for Vaki in $Listbp; do

Dso1=$(($Dso1 + 1))
[ "$Dso1" == 1 ] && Keyk=com.sohu.inputmethod.sogou.xiaomi
[ "$Dso1" == 2 ] && Keyk=com.baidu.input_mi
[ "$Dso1" == 3 ] && Keyk=com.iflytek.inputmethod.miui

if [ "$Dso1" -le 3 ];then
Thaythe "$Keyk" "$Vaki" "$APK/com.android.settings/classes*/com/android/settings/inputmethod/*"
Thaythe "$Keyk" "$Vaki" "$APK/com.miui.phrase/classes*/com/miui/inputmethod/*"
Thaythe "$Keyk" "$Vaki" ''$APK/$miuik'services/classes*/com/android/server/*'
Thaythe "$Keyk" "$Vaki" ''$APK/$miuik'framework/classes*/android/*inputmethod*/*'
fi

done

Vsmali '.method public static isMiuiImeBottomSupport()Z' \
'.end method' \
'.method public static isMiuiImeBottomSupport()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.settings/classes*/*"

Vsmali '.method private static isCanLoadPlugin(Landroid/content/Context;)Z' \
'.end method' \
'.method private static isCanLoadPlugin(Landroid/content/Context;)Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
''$APK/$miuik'framework/classes*/android/*inputmethod*/*'

fi
ui_print
ui_print2 "Đóng gói apk"
ui_print
# Đóng gói apk
Donggoi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

if [ "$chinann" == 1 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ];then
# Hệ thống mount
mrw
rm -fr /system/framework/arm64 /system/framework/arm /system_root/system/framework/arm64 /system_root/system/framework/arm $(magisk --path)/.magisk/mirror/system/framework/arm $(magisk --path)/.magisk/mirror/system/framework/arm64 $(magisk --path)/.magisk/mirror/system_root/system/framework/arm $(magisk --path)/.magisk/mirror/system_root/system/framework/arm64 2>/dev/null
mro

if [ -e /system/framework/arm ];then
if [ -e $(magisk --path)/.magisk/mirror/system_root/system/framework/arm ];then
FREEZE "/system/framework/arm64
/system/framework/arm"

ui_print2 "Cảnh báo!"
ui_print
ui_print2 "Nếu bạn đang cài Safetynet"
ui_print
ui_print2 "Module đó sẽ bị tắt vì xung đột hệ thống."
ui_print
echo > /data/adb/modules/safetynet-fix/disable
echo "echo > /data/adb/modules/safetynet-fix/disable" >> $TMPDIR/post-fs-data.sh
fi
fi
fi

ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
