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
[ " $(grep -c '# Kakathic' $TMPDIR/Main.sh)" == 1 ] && . $TMPDIR/Main.sh || abort "$error";

## Start the installation
on_install(){

ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Xoá ứng dụng Getapps ?"
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

ui_print "- Bật tính năng China mod ?"
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
[ "$chinann" == 1 ] && CPapk com.android.systemui
[ "$chinann" == 4 ] && CPapk com.miui.home
#[ "$chinann" == 1 ] && CPapk com.miui.powerkeeper
if [ "$keyyyy" == 2 ] || [ "$chinann" == 1 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
CPfile 'framework'
CPfile 'services'
fi
[ "$chinann" == 4 ] && CPfile ''$miuik'framework'
if [ "$chinann" == 1 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
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
[ "$(pm path com.xiaomi.market | grep -cm1 '/data/')" == 1 ] && pm uninstall com.xiaomi.market >&2
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

Vsmali ".method private checkAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)Z" \
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

if [ "$chinann" == 1 ];then
sjwg="$(echo $APK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali)"
sed -i -e '/Lcom\/android\/settings\/R$id;->security_center_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->security_status:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->location_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->privacy_settings:I/a\ const/4 v10, 0x1' -e 's|sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z|const/4 v1, 0x1|' $sjwg
echo "$sjwg" >> $APK/com.android.settings/class

Vsmali '.method public static supportPartialScreenShot()Z' \
'.end method' \
'.method public static supportPartialScreenShot()Z
    .registers 2
    const/4 v1, 0x1
    return v1
.end method' \
"$APK/com.android.settings/classes*/*"

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

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/pm/PackageManagerServiceImpl.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/pm/SettingsImpl.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/miui/securityspace/XSpaceConstant.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/navigationbar/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/systemui/qs"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.systemui/classes*/com/android/settingslib/inputmethod/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.android.settings/classes*/com/android/settings/SettingsActivity.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/miui/security/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'framework/classes*/android/miui/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/clipboard/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/notification/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/am/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$APK/$miuik'services/classes*/com/android/server/*.smali'

if [ "$ksjd" ];then
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ai/AppPredict.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/bucket/InferAppBucketManager.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/customerpower/CustomerPowerCheck.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/MilletConfig.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/scenario"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/powerchecker"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/gamepreload"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ui"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/utils"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "force-idle" "unforce" "$APK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/DeviceIdlePolicyHelper.smali"
fi

Vsmali ".method private static isPermanentRights(Lmiui/drm/DrmManager\$RightObject;)Z" \
".end method" \
'.method private static isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$APK/$miuik'framework/classes*/miui/drm/DrmManager.smali'

Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" ''$APK/$miuik'framework/classes*/miui/drm/DrmManager.smali'

echo "ro.product.vip=$(getprop ro.product.system.device)_global" >> $TMPDIR/system.prop

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$APK/$miuik'services/classes*'

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
[ "$Dso1" == 4 ] && Keyk=com.android.cts.mockime

if [ "$Dso1" -le 4 ];then
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
rm -fr /*/framework/arm64 /*/framework/arm /*/*/framework/arm64 /*/*/framework/arm 2>/dev/null
mro

if [ -e ${kssndh%/*}/arm ];then
FREEZE "${kssndh%/*}/arm64
${kssndh%/*}/arm"

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

ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
