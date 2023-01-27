# Kakathic

ui_print "! Su dung phim am luong"
ui_print "! Vol- = Chon so hien tai, Vol+ = Chuyen doi so."
ui_print "! An nut nguon de huy."
ui_print " "

ui_print "- Xoa ung dung Getapps ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP gettapp)" ];then
gettttap=$(GP gettapp)
ui_print " "
ui_print "  Chon: $gettttap"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
gettttap=$input
fi

ui_print "- Tinh nang China Mod ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP global)" ];then
chinann=$(GP global)
ui_print " "
ui_print "  Chon: $chinann"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
chinann=$input
fi

ui_print "- Bat tinh nang bàn phim nang cao ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP banphim)" ];then
keyyyy=$(GP banphim)
ui_print " "
ui_print "  Chon: $keyyyy"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
keyyyy=$input
fi

ui_print "  Xu ly du lieu"
ui_print " "

# Unpack 
[ "$Tkkg" == 1 ] && unzip -qo "$ZIP" 'lib/*' -d /tmp || abort
tar -xJf $TMPI/Jre.tar.xz -C /tmp
chmod -R 755 $TMPI $TBIN/java

# Copy file & apk
[ "$keyyyy" == 1 ] && Fapk com.miui.phrase MIUIFrequentPhrase.apk
[ "$chinann" == 1 ] && Fapk com.android.systemui MiuiSystemUI.apk
[ "$chinann" == 1 ] && Fapk com.miui.powerkeeper PowerKeeper.apk

if [ "$keyyyy" == 1 ] || [ "$chinann" == 1 ];then
Fapk com.android.settings Settings.apk
Fjar ''$miuik'framework'
fi
if [ "$chinann" == 1 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
Fjar ''$miuik'services'
kssndh="$(find /system -name ''$miuik'services.jar')"
kssndbd="/system/framework"
rm -fr ${kssndh%/*}/oat ${kssndh%/*}/arm64 ${kssndh%/*}/arm ${kssndh%/*}/*.vdex $kssndbd/oat $kssndbd/arm64 $kssndbd/arm $kssndbd/*.vdex
fi

ui_print "  Giai nen apk"
ui_print " "

UnApk

ui_print "  Chinh sua apk"
ui_print " "


if [ "$gettttap" == 1 ];then
rm -fr "$(echo /*/*app/*SuperMarket*)"
rm -fr $(find /data/app/* -name "*com.xiaomi.market-*")
Vsmali ".method private checkSystemSelfProtection(Z)V" \
".end method" \
'.method private checkSystemSelfProtection(Z)V
    .locals 1
    return-void
.end method' \
''$TAPK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkSysAppCrack()Z" \
".end method" \
'.method private checkSysAppCrack()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
''$TAPK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkAppSignature(\[Landroid\/content\/pm\/Signature;Ljava\/lang\/String;Z)Z" \
".end method" \
'.method private checkAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$TAPK/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private onPostNotification()V" \
".end method" \
'.method private onPostNotification()V
    .locals 11
	return-void
.end method' \
''$TAPK/$miuik'services/classes*'

fi

if [ "$chinann" == 1 ];then
sjwg="$(echo $TAPK/com.android.settings/classes*/com/android/settings/MiuiSettings.smali)"
sed -i -e '/Lcom\/android\/settings\/R$id;->security_center_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->security_status:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->location_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->privacy_settings:I/a\ const/4 v10, 0x1' -e 's|sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z|const/4 v1, 0x1|' $sjwg
echo "$sjwg" >> $TAPK/com.android.settings/class

Vsmali '.method public static supportPartialScreenShot()Z' \
'.end method' \
'.method public static supportPartialScreenShot()Z
    .registers 2
    const/4 v1, 0x1
    return v1
.end method' \
"$TAPK/com.android.settings/classes*/*"

Vsmali '.method public static supportPaperEyeCare()Z' \
'.end method' \
'.method public static supportPaperEyeCare()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$TAPK/com.android.settings/classes*/*"

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TAPK/com.android.systemui/classes*/com/android/systemui/navigationbar/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TAPK/com.android.systemui/classes*/com/android/systemui/qs"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TAPK/com.android.systemui/classes*/com/android/settingslib/inputmethod/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TAPK/com.android.settings/classes*/com/android/settings/SettingsActivity.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'framework/classes*/miui/security/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'framework/classes*/android/miui/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'services/classes*/com/android/server/clipboard/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'services/classes*/com/android/server/notification/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'services/classes*/com/android/server/am/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TAPK/$miuik'services/classes*/com/android/server/*.smali'
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ai/AppPredict.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/bucket/InferAppBucketManager.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/customerpower/CustomerPowerCheck.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/MilletConfig.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/scenario"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/powerchecker"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/gamepreload"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ui"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/utils"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "ro.product.mod_device" "ro.product.vip" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "ro.product.mod_device" "ro.product.vip" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "force-idle" "unforce" "$TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/DeviceIdlePolicyHelper.smali"

echo "ro.product.vip=$(GB ro.product.system.device)_global" >> /tmp/system.prop

kkhddbff="$(echo $TAPK/com.miui.powerkeeper/classes*/com/miui/powerkeeper/uft/UFTUtils.smali)"
kkgwmw="$(echo "$TAPK/$miuik"services/classes*/com/miui/server/util/UFTUtils.smali)"

if [ -e $kkhddbff ] || [ -e $kkgwmw ];then
echo "$kkhddbff" >> $TAPK/com.miui.powerkeeper/class
echo "$kkgwmw" >> "$TAPK/$miuik"services/class

for bbddkkk in $(GP ListApp | tr ',' '\n'); do
awggnw='
const-string v1, "'$bbddkkk'"
invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

const-string v1, "com.tencent.mm"
'
sed -i 's|const-string v1, "com.tencent.mm"|'"$awggnw"'|' $kkhddbff
sed -i 's|const-string v1, "com.tencent.mm"|'"$awggnw"'|' $kkgwmw

cdhcfgv='<wl n="'$bbddkkk'" />
</config>'

sed -i 's|</config>|'"$cdhcfgv"'|' /data/system/deviceidle.xml
done
fi

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$TAPK/$miuik'services/classes*'
fi

if [ "$keyyyy" == 1 ];then
mkdir -p $TMPI/banphim/nightmode /sdcard/VH-MI/color
if [ ! -e "/sdcard/VH-MI/color/Tối.ini" ];then
if [ "$API" -ge 31 ];then
cp -f $TMPI/12-Tối.ini /sdcard/VH-MI/color/Tối.ini
cp -f $TMPI/12-Sáng.ini /sdcard/VH-MI/color/Sáng.ini
else
cp -f $TMPI/*.ini /sdcard/VH-MI/color
fi
fi
# Sáng
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Sáng.ini)'</color>
</MIUI_Theme_Values>' > $TMPI/banphim/theme_values.xml
# Tối
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Tối.ini)'</color>
</MIUI_Theme_Values>' > $TMPI/banphim/nightmode/theme_values.xml
# Đóng gói 
cd $TMPI/banphim
zip -qr $TMPI/com.miui.phrase.zip *
cp -rf $TMPI/com.miui.phrase.zip "$(echo /*/media/theme/default)"/com.miui.phrase

Thaythe "com.sohu.inputmethod.sogou.xiaomi" "com.google.android.inputmethod.latin" "$TAPK/com.android.settings/classes*/com/android/settings/inputmethod/*"
Thaythe "com.sohu.inputmethod.sogou.xiaomi" "com.google.android.inputmethod.latin" "$TAPK/com.miui.phrase/classes*/com/miui/inputmethod/*"
Thaythe "com.sohu.inputmethod.sogou.xiaomi" "com.google.android.inputmethod.latin" ''$TAPK/$miuik'services/classes*/com/android/server/*'
Thaythe "com.sohu.inputmethod.sogou.xiaomi" "com.google.android.inputmethod.latin" ''$TAPK/$miuik'framework/classes*/android/*input*/*'

Vsmali '.method public static isMiuiImeBottomSupport()Z' \
'.end method' \
'.method public static isMiuiImeBottomSupport()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TAPK/com.android.settings/classes*/*"
fi

ui_print " "
ui_print "  Dong goi apk"
ui_print " "

RepApk

