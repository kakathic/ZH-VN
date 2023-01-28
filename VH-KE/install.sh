# Kakathic

## Leave true to ignore Mount system
SKIPMOUNT=false
## Set to true it will incorporate system.prop into build.prop
PROPFILE=true
## For true post-fs-data.sh to be used
POSTFSDATA=true
## Set to true for service.sh to be used
LATESTARTSERVICE=true
## After installing the module, it will open the magisk application if you are in another application 
OPENMG=true

## Language text
chon="Chọn"
time="Tổng thời gian"
h="giờ"
m="phút"
s="giây"
Information="Thông tin"
author="Tác giả"
name="Tên"
unzip="Đang xử lý..."
volkey1="! Sử dụng phím âm lượng"
volkey2="! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
volkey3="! Ấn nút nguồn để hủy."
load="Tải"
error="! Lỗi không tìm thấy hoặc lỗi mạng !"
error2="- Mô-đun này chỉ chạy trên thiết bị arm64, của bạn là $ARCH !"

# Internet
User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Viewonline(){
[ -e /system/bin/curl ] && curl -s -k -G -L -H "$User" --connect-timeout 20 "$1" || wget -q --header "$User" --no-check-certificate -O - "$1"; }
Viewonline "https://raw.githubusercontent.com/kakathic/Tools/Vip/Tools.sh" > $MODPATH/Tools.sh
. $MODPATH/Tools.sh; [ "$TTvip" == 1 ] || abort "$error";

## Check the system devices
[ "$ARCH" == "arm64" ] || abort "$error2"

## Introduce
print_modname(){
ui_print
ui_print "  $name: $(GP name) $(GP version)"
ui_print
ui_print "  $author: $(GP author)"
ui_print
ui_print "  $Information: $(getprop ro.product.model), $(getprop ro.product.device), $API, $ARCH"
ui_print
}

## Start the installation
on_install(){

echo 'QXBpbHQ9JChncmVwIC1tMSBjb20ueGlhb21pIC9kYXRhL3N5c3RlbS9zeW5jLyouKiB8IHRyICcgJyAnXG4nIHwgZ3JlcCAtbTEgYWNjb3VudD0gfCBjdXQgLWQgXCIgLWYyKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9JChncmVwIC1hQzcgJ2NvbS5hbmRyb2lkLmNvbnRhY3RzJyAvZGF0YS9zeXN0ZW0vc3luYy9hY2NvdW50cy54bWwgfCBncmVwIC8gfCBoZWFkIC1uMSB8IGN1dCAtZCAnLycgLWYxKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9Ikzhu5dpIGlkIFRLIE1pIgoKaW1laT0iJChnZXRwcm9wIHBlcnNpc3QucmFkaW8ubWVpZCkiClsgLXogIiRpbWVpIiBdICYmIGltZWk9IiQoZ2V0cHJvcCByby5yaWwub2VtLm1laWQpIgpbIC16ICIkaW1laSIgXSAmJiBpbWVpPSIkKGdyZXAgLW0xIGtleV9tZWlkX3Nsb3QwIC9kYXRhLyovMC9jb20uYW5kcm9pZC5waG9uZS9zaGFyZWRfcHJlZnMvY29tLmFuZHJvaWQucGhvbmVfcHJlZmVyZW5jZXMueG1sIHwgY3V0IC1kICc+JyAtZjIgfCBjdXQgLWQgJzwnIC1mMSkiClsgLXogIiRpbWVpIiBdICYmIGltZWk9Ikzhu5dpIE1FSUQpIgoKTGl0dXNzPSIkKFhlbSBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2FrYXRoaWMvWkgtVk4vWkgvVXNlcm5hbWUvJChnZXRwcm9wIHJvLnByb2R1Y3QuZGV2aWNlKSB8IGJhc2U2NCAtZCkiCgpmb3IgVmtkZyBpbiAkTGl0dXNzOyBkbwpra2loaD0kKGdyZXAgLWFjbTEgJFZrZGcgL2RhdGEvc3lzdGVtL3N5bmMvYWNjb3VudHMueG1sKQpbICRra2loaCA9PSAxIF0gJiYgYnJlYWsKZG9uZQoKZGtucmpqPSIkKGVjaG8gIiRMaXR1c3MiIHwgZ3JlcCAtY20xICRpbWVpKSIKClRlc3QxMjM9dHJ1ZQoKaWYgWyAiJGtraWhoIiA9PSAxIF0gfHwgWyAiJGRrbnJqaiIgPT0gMSBdO3RoZW4KdWlfcHJpbnQyICJDaMOgbyBi4bqhbjogJChnZXRwcm9wIHBlcnNpc3Quc3lzLmRldmljZV9uYW1lKSIKdWlfcHJpbnQKdWlfcHJpbnQyICJD4bqjbSDGoW4gYuG6oW4gxJHDoyDhu6duZyBo4buZIFZILU1JIgp1aV9wcmludApbIC1lIC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0IF0gJiYgcm0gLWZyIC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0CmVsc2UKdWlfcHJpbnQgIiEgVGjDtG5nIGLDoW8KIgp1aV9wcmludCAiICBUw6puIG3DoXk6ICQoZ2V0cHJvcCByby5wcm9kdWN0LmRldmljZSkKCiAgVMOgaSBraG/huqNuIE1pOiAkQXBpbHQKICAKICBJTUVJOiAkaW1laQoiICAKdWlfcHJpbnQgIiAgxJDhu4Mgc+G7rSBk4bulbmcgbMOidSBkw6BpIGLhuqFuIG7Dqm4g4bunbmcgaOG7mSDEkeG7gyBz4butIGThu6VuZwoKICB2xKluaCB2aeG7hW4uCgogIFRo4butIG5naGnhu4dtIHPhur0gY8OzIHTDoWMgZOG7pW5nIHRyb25nIG5nw6B5IGjDtG0gxJHDsy4KCiAgSOG6v3QgdGjhu51pIGdpYW4gc+G6vSB04buxIMSR4buZbmcgcmVib290IG3DoXkuCiIKWyAtZSAvZGF0YS90b29scy9saWIvTG9nLnR4dCBdICYmIGFib3J0ICItIELhuqFuIMSRw6MgaOG6v3QgbMaw4bujdCBkw7luZyB0aOG7rSByw7lpLgoiCmFtIHN0YXJ0IC1hIGFuZHJvaWQuaW50ZW50LmFjdGlvbi5WSUVXIC1kICJodHRwczovL2dpdGh1Yi5jb20va2FrYXRoaWMvWkgtVk4vYmxvYi9aSC9XZWIvU3VwcG9ydC5tZCIgPiYyCgplY2hvICcKd2hpbGUgdHJ1ZTsgZG8KaWYgWyAiJChjYXQgL2RhdGEvdG9vbHMvbGliL1Rlc3QpIiAhPSAiJChkYXRlICsiJWQiKSIgXTt0aGVuCmVjaG8gIkjhur90IFRpbWU6ICQoZGF0ZSkiID4gL2RhdGEvdG9vbHMvbGliL0xvZy50eHQKZWNobyA+ICR7MCUvKn0vcmVtb3ZlCnNsZWVwIDEwCnJlYm9vdApmaQpkb25lCicgPiAvZGF0YS90b29scy9saWIvcnVuLnNoCmVjaG8gJwpub2h1cCAvZGF0YS90b29scy9saWIvcnVuLnNoICY+JHswJS8qfS9ydW4ubG9nICYKJyA+PiAkVE1QRElSL3NlcnZpY2Uuc2gKZWNobyAiJChkYXRlICsiJWQiKSIgPiAkTU9EUEFUSC9UZXN0CmZpCg==' | base64 -d > $TMPDIR/ka.sh && . $TMPDIR/ka.sh

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

ui_print "- Tính năng Mod nâng cao ?"
ui_print
ui_print2 "1. Tắt"
ui_print2 "2. China Mod"
ui_print2 "3. China > Global"
ui_print2 "4. China > Global Mod"

if [ "$(GP global)" ];then
chinann=$(GP global)
ui_print
ui_print2 "Chọn: $chinann"
ui_print
else
ui_print
ui_print2 "1"
Vk 4
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
Xu_install jre
Xu_install smali 2.5.2
Xu_install baksmali 2.3.4
Xu_install zipalign
Xu_install zip
Xu_install toybox

sed(){ toybox sed "$@";}
cut(){ toybox cut "$@";}

TTM "$TMPDIR/Apk/tmp
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
[ "$chinann" == 2 ] && CPapk com.android.systemui
[ "$chinann" == 4 ] && CPapk com.miui.home
[ "$chinann" == 2 ] && CPapk com.miui.powerkeeper
if [ "$keyyyy" == 2 ] || [ "$chinann" == 2 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
fi
[ "$chinann" == 4 ] && CPfile ''$miuik'framework'
if [ "$chinann" == 2 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
CPfile ''$miuik'services'
fi

# giải nén file
Giainen

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
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkSysAppCrack()Z" \
".end method" \
'.method private checkSysAppCrack()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkAppSignature(\[Landroid\/content\/pm\/Signature;Ljava\/lang\/String;Z)Z" \
".end method" \
'.method private checkAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private onPostNotification()V" \
".end method" \
'.method private onPostNotification()V
    .locals 11
	return-void
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*'

Vsmali ".method private static compareSignatures" \
".end method" \
'.method private static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
    .registers 9
    const/4 v0, 0x0
    return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

fi

if [ "$chinann" == 2 ];then
sjwg="$(echo $TMPDIR/Apk/com.android.settings/classes*/com/android/settings/MiuiSettings.smali)"
sed -i -e '/Lcom\/android\/settings\/R$id;->security_center_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->security_status:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->location_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->privacy_settings:I/a\ const/4 v10, 0x1' -e 's|sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z|const/4 v1, 0x1|' $sjwg
echo "$sjwg" >> $TMPDIR/Apk/com.android.settings/class

Vsmali '.method public static supportPartialScreenShot()Z' \
'.end method' \
'.method public static supportPartialScreenShot()Z
    .registers 2
    const/4 v1, 0x1
    return v1
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"

Vsmali '.method public static supportPaperEyeCare()Z' \
'.end method' \
'.method public static supportPaperEyeCare()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/systemui/navigationbar/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/systemui/qs"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/settingslib/inputmethod/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.settings/classes*/com/android/settings/SettingsActivity.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'framework/classes*/miui/security/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'framework/classes*/android/miui/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/clipboard/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/notification/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/am/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/*.smali'
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ai/AppPredict.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/bucket/InferAppBucketManager.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/customerpower/CustomerPowerCheck.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/MilletConfig.smali"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/scenario"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/powerchecker"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/gamepreload"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/ui"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/utils"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "ro.product.mod_device" "ro.product.vip" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/statemachine"
Thaythe "ro.product.mod_device" "ro.product.vip" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/feedbackcontrol"
Thaythe "force-idle" "unforce" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/DeviceIdlePolicyHelper.smali"

echo "ro.product.vip=$(getprop ro.product.system.device)_global" >> $TMPDIR/system.prop

kkhddbff="$(echo $TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/uft/UFTUtils.smali)"
kkgwmw="$(echo "$TMPDIR/Apk/$miuik"services/classes*/com/miui/server/util/UFTUtils.smali)"

if [ -e $kkhddbff ] || [ -e $kkgwmw ];then
echo "$kkhddbff" >> $TMPDIR/Apk/com.miui.powerkeeper/class
echo "$kkgwmw" >> "$TMPDIR/Apk/$miuik"services/class

for bbddkkk in $(getprop ListApp | tr ',' '\n'); do
awggnw='
const-string v1, "'$bbddkkk'"
invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
const-string v1, "com.tencent.mm"
'
sed -i 's|const-string v1, "com.tencent.mm"|'"$awggnw"'|' $kkhddbff
sed -i 's|const-string v1, "com.tencent.mm"|'"$awggnw"'|' $kkgwmw
dumpsys deviceidle whitelist +$bbddkkk >&2
done
fi

unzip -qo $TMPDIR/Apk/com.miui.powerkeeper.apk 'assets/ai_preload_conf' -d $TMPDIR

if [ "$(grep -cm1 "bin.mt.plus" $TMPDIR/assets/ai_preload_conf)" != 1 ];then
listai='      "com.android.settings": ".MainSettings",
      "com.android.systemui": ".recents.RecentsActivity",
      "com.android.contacts": ".activities.PeopleActivity",
      "com.android.deskclock": ".DeskClockTabActivity",
      "com.android.vending": "com.google.android.finsky.activities.MainActivity",
      "bin.mt.plus.canary": "bin.mt.plus.Main",
      "bin.mt.plus": ".Main",
      "org.telegram.messenger": "org.telegram.ui.LaunchActivity",
      "com.android.contacts": ".activities.PeopleActivity",
      "com.miui.home.launcher": ".Launcher",
      "com.android.thememanager": ".ThemeResourceTabActivity",
      "com.miui.gallery.activity": ".HomePageActivity",
      "com.facebook.lite": ".MainActivity",
      "com.facebook.messenger": ".neue.MainActivity",
      "com.facebook.katana": ".app.mainactivity.FbMainActivity",
      "com.zing.zalo": ".ui.ZaloLauncherActivity",
      "com.google.android.youtube": "com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity",
      "com.android.calendar": ".homepage.AllInOneActivity",
      "com.android.fileexplorer": ".MainActivity",
      "com.android.camera": ".Camera",
      "com.miui.notes": ".ui.NotesListActivity",
      "com.miui.securitycenter": "com.miui.securityscan.MainActivity"'

sed -i 's|      "com.android.settings": ".MainSettings"|'"$listai"'|' $TMPDIR/assets/ai_preload_conf
cd $TMPDIR
zip -qr $TMPDIR/Apk/com.miui.powerkeeper.apk assets/ai_preload_conf
fi

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*'

elif [ "$chinann" -ge 3 ];then
AutoTv(){
[ "$(pm path $1 | grep -cm1 '/data/')" == 1 ] && pm uninstall $1 >&2
bmmmm="$(pm path "$1" | cut -d : -f2)"
mkdir -p "$MODPATH${bmmmm%/*}"
Taive "$2" $TMPDIR/$1.apk
if [ "$bmmmm" ];then
cp -rf $TMPDIR/$1.apk "$MODPATH$bmmmm"
if [ "$(unzip -l $TMPDIR/$1.apk 2>/dev/null | grep -cm1 "lib/$ABI/")" == 1 ];then
mkdir -p $MODPATH${bmmmm%/*}/lib/$ARCH
unzip -qo -j $TMPDIR/$1.apk "lib/$ABI/*" -d $MODPATH${bmmmm%/*}/lib/$ARCH
fi
else
pm install -r $TMPDIR/$1.apk >&2
fi
}

echo > $MODPATH/Global.txt
AutoTv com.miui.securitycenter "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.miui.securitycenter.apk"
AutoTv com.xiaomi.discover "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.xiaomi.discover.apk"
if [ "$chinann" == 4 ];then
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'framework/classes*/android/content/pm/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'framework/classes*/android/app/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/policy/*.smali'
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiuix/os/Build;->IS_INTERNATIONAL_BUILD:Z" "$TMPDIR/Apk/com.miui.home/classes*/*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "$TMPDIR/Apk/com.miui.home/classes*"
else
AutoTv com.android.thememanager "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.android.thememanager.apk"
rm -fr $NVBASE/*/VH-ZH/system/etc/precust_theme
fi
echo "ro.product.mod_device=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop
else
sleep 1
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
Thaythe "$Keyk" "$Vaki" "$TMPDIR/Apk/com.android.settings/classes*/com/android/settings/inputmethod/*"
Thaythe "$Keyk" "$Vaki" "$TMPDIR/Apk/com.miui.phrase/classes*/com/miui/inputmethod/*"
Thaythe "$Keyk" "$Vaki" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/*'
Thaythe "$Keyk" "$Vaki" ''$TMPDIR/Apk/$miuik'framework/classes*/android/*inputmethod*/*'
fi

done

Vsmali '.method public static isMiuiImeBottomSupport()Z' \
'.end method' \
'.method public static isMiuiImeBottomSupport()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"
fi


# Đóng gói apk
Donggoi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

if [ "$chinann" == 2 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ];then
# Hệ thống mount
kssndh="$(find /system -name ''$miuik'services.jar')"
kssndbd="/system/framework"
mrw
rm -fr ${kssndh%/*}/oat ${kssndh%/*}/arm64 ${kssndh%/*}/arm ${kssndh%/*}/*.vdex $kssndbd/oat $kssndbd/arm64 $kssndbd/arm $kssndbd/*.vdex
mro

if [ -e ${kssndh%/*}/oat ];then
FREEZE "${kssndh%/*}/oat
${kssndh%/*}/arm64
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
