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
chmod 777 $TMPDIR/Loading.sh && $TMPDIR/Loading.sh; . $TMPDIR/1.sh

## Start the installation
on_install(){

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
ui_print "! Ấn nút nguồn để hủy."
ui_print

if [ "$API" -le 31 ];then
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

fi

ui_print "- Cho phép ứng dụng chạy nền"
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
#Xu_install busybox static
Xu_install jre static
Xu_install smali 2.3.4
Xu_install baksmali 2.3.4
Xu_install zipalign static
Xu_install zip static
Xu_install toybox static

sed(){ toybox sed "$@"; }
grep(){ toybox grep "$@"; }
cut(){ toybox cut "$@"; }
find(){ toybox find "$@"; }

mkdir -p $APK/tmp /sdcard/VH-MI/color /data/tools/apk

if [ ! -e "/sdcard/VH-MI/color/Tối.ini" ];then
if [ "$API" -ge 31 ];then
cp -f $TMPDIR/12-Tối.ini /sdcard/VH-MI/color/Tối.ini
cp -f $TMPDIR/12-Sáng.ini /sdcard/VH-MI/color/Sáng.ini
else
cp -f $TMPDIR/*.ini /sdcard/VH-MI/color
fi
fi

eval "$(echo 'WyAiJFRlc⁰QxMjMiID⁵³IDEgXSB⁴fCBhYm³ydA==' | base64 -r)"

# Copy file & apk
[ "$Vipno" == 1 ] && CPfile 'framework'
[ "$keyyyy" == 1 ] && CPapk com.miui.phrase
if [ "$keyyyy" == 1 ] || [ "$chinann" == 1 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
fi
if [ "$chinann" == 1 ];then
CPfile 'framework'
CPfile 'services'
[ "$API" -le 31 ] && CPapk com.miui.powerkeeper
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
fi

#mod 2
if [ "$chinann" == 1 ];then

# Vá CTS
Vsmali '.method public onCreate()V' \
'.end method' \
'.method public onCreate()V
    .registers 2
    invoke-static {p0}, Landroid/app/ApplicationStub;->onCreate(Landroid/app/Application;)V
    return-void
.end method' \
"$APK/framework/classes*/android/app/Application.smali"
mkdir -p $APK/framework/classes/android/app
cp -rf $TMPDIR/Test.smali $APK/framework/classes/android/app/ApplicationStub.smali

# Dịch EU
unzip -qo "$TMPDIR/Traneu.zip" -d ''$APK/$miuik'framework/classes'
echo "$APK/$miuik"framework/classes/eu/xiaomi/util >> "$APK/$miuik"framework/class

# Vá chữ ký v1
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
Vsmali ".method private static compareSignatures" \
".end method" \
'.method private static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
    .registers 9
    const/4 v0, 0x0
    return v0
.end method' \
''$APK/$miuik'services/classes*/com/miui/server/*'

# Vá settings
Thaythe '\"MIUI \"' '\"VH \"' $APK/com.android.settings/classes*/com/android/settings/device/MiuiAboutPhoneUtils.smali
opentc(){
wtnw="$(grep -m1 "$1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali | awk '{print $2}')"
Thaythe "$1" "$1 \n const/4 $wtnw 0x1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali; }
opentc 'Lcom/android/settings/R\$id;->security_status:I'
opentc 'Lcom/android/settings/R\$id;->location_settings:I'
opentc 'Lcom/android/settings/R\$id;->privacy_settings:I'
Thaythe "sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z" "const/4 v1, 0x1" $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali
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
Vsmali '.method public static isSupportUninstallSysApp(Landroid/content/Context;)Z' \
'.end method' \
'.method public static isSupportUninstallSysApp(Landroid/content/Context;)Z
    .registers 3
    const/4 p0, 0x1
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/utils/SettingsFeatures.smali"
# Mod màu cam popup
Vsmali '.method public getAvailabilityStatus()I' \
'.end method' \
'.method public getAvailabilityStatus()I
    .registers 1
    const/4 p0, 0x2
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/special/ColorLampEntryController.smali"

Chose "invoke-static {}, Lcom/android/settings/utils/SettingsFeatures;->isNeedShowColorLamp()Z" \
"move-result" "0x1" \
"$APK/com.android.settings/classes*/com/android/settings/popup/PopupSettings.smali"

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

Vsmali '.method public static isSupportSafetyEmergencySettings(Landroid/content/Context;)Z' \
'.end method' \
'.method public static isSupportSafetyEmergencySettings(Landroid/content/Context;)Z
    .registers 1
    const/4 p0, 0x1
    return p0
.end method' \
"$APK/com.android.settings/classes*/com/android/settings/MiuiUtils.smali"

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$APK/$miuik'services/classes*'
# mod systemui
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/controlcenter/policy/GoogleController.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/qs/tiles/DriveModeTile.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/qs/MiuiNotificationHeaderView.smali"

#Thaythe "com.android.packageinstaller" "t.me.kakathic" ''$APK/$miuik'services/classes*/com/android/server/pm/PackageManagerServiceImpl.smali'
#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/framework/classes*/android/app/ApplicationPackageManager.smali"
#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/framework/classes*/android/app/DownloadManager.smali"
#Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/services/classes*/com/android/server/pm/PackageManagerServiceStub.smali"

echo "ro.product.vip=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/am/ProcessManagerService.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/notification/NotificationManagerServiceImpl.smali'

#Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/android/widget/ToastInjectorImpl.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/com/android/internal/app/ChooserActivityStubImpl.smali'

Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/customerpower/CustomerPowerCheck.smali"
Vsmali ".method public static isFeatureOn()Z" \
".end method" \
'.method public static isFeatureOn()Z
    .registers 3
    const/4 v1, 0x0
    return v1
.end method' \
"$APK/com.miui.powerkeeper/classes*/*"
fi

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

if [ "$keyyyy" == 1 ];then
mkdir -p $TMPDIR/banphim/nightmode /sdcard/VH-MI/color $MODPATH/system/media/theme/default
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
Thaythe "$Keyk" "$Vaki" ''$APK/$miuik'framework/classes*/android/inputmethodservice/InputMethodServiceInjector.smali'
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
xoaodex="
/system/framework/arm
/system/framework/arm64
"

for fhbrfh in $xoaodex; do
rm -fr $fhbrfh 2>/dev/null
rm -fr $(magisk --path)/.magisk/mirror/system_root$fhbrfh 2>/dev/null
[ -e $fhbrfh ] && FREEZE $fhbrfh
done
mro
fi

if [ -e /system/framework/arm/boot-framework.art ];then
ui_print2 "Cảnh báo!"
ui_print
ui_print2 "Nếu bạn đang cài Safetynet"
ui_print
ui_print2 "Module đó sẽ bị tắt vì xung đột hệ thống."
ui_print
echo > /data/adb/modules/safetynet-fix/disable
echo "echo > /data/adb/modules/safetynet-fix/disable" >> $TMPDIR/post-fs-data.sh
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
