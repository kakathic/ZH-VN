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
## code

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
ui_print "! Ấn nút nguồn để hủy."
ui_print


ui_print "- Chọn kiểu cài Tiếng Việt vào Rom ?"
ui_print
ui_print2 "1. Mặc định"
ui_print2 "2. Nếu như mặc định bị treo"
ui_print2 "3. Không cài"

if [ "$(GP VH)" ];then
VHI=$(GP VH)
ui_print
ui_print2 "Chọn: $VHI"
ui_print
else
ui_print
ui_print2 "1"
Vk 3
VHI=$input
fi


ui_print "- Thêm lịch âm ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP Licham2)" ];then
Licham=$(GP Licham2)
ui_print
ui_print2 "Chọn: $Licham"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Licham=$input
fi

ui_print "- Gỡ cài đặt ứng dụng China rác ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP Appchina)" ];then
goappcn=$(GP Appchina)
ui_print
ui_print2 "Chọn: $goappcn"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
goappcn=$input
fi

ui_print "- Sử dụng phông chữ Việt hóa ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP fontchu)" ];then
fontvh=$(GP fontchu)
ui_print
ui_print2 "Chọn: $fontvh"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
fontvh=$input
fi

[ "$VHI" == 2 ] && Overlay=/system/vendor/overlay || Overlay=/system/product/overlay
mrw
[ "$VHI" == 2 ] && mkdir -p $Overlay
[ -e $Overlay ] || abort "Lỗi không tìm thấy thư mục overlay trong vendor."
mro

VHMI=/sdcard/VH-MI
evol "WyAiJFRlc⁰QxMjMiID⁵³IHRydWUgXSB⁴fCBhYm³ydAo="

# Tạo thư mục
mkdir -p $MODPATH/system/media/theme/default $VHMI/fonts $TMPDIR/apk $TMPDIR/Apk/tmp $MODPATH$Overlay

## Unzip system
ui_print2 "$unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH

mkdir -p /sdcard/Android/data/com.android.thememanager/files/MIUI
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/MIUI
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/Android/data/com.android.thememanager/files/MIUI

Xu_install zip static
Xu_install static jq
Xu_install toybox static
$Test123 || abort

if [ "$VHI" == 1 ] || [ "$VHI" == 2 ];then
# Cài đặt ngôn ngữ
cmd settings put system system_locales $(GP Linknn)
ui_print2 "Thêm ngôn ngữ: $(GP LinkTn)"
ui_print
ui_print2 "Đang Việt hóa"
ui_print
Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT_$(GP version).Zip" "$TMPDIR/TT.Zip"
[ -e "$TMPDIR/TT.Zip" ] && unzip -qo "$TMPDIR/TT.Zip" -d $TMPDIR >&2 || abort "- Lỗi tải TT.Zip thất bại !"
if [ "$Licham" != 1 ];then
echo > $MODPATH/luna
cp -rf $TMPDIR/notamlich/*.apk $TMPDIR/apk
cp -rf $TMPDIR/notamlich/framework-miui-res $TMPDIR
fi
[ -e $TMPDIR/framework-miui-res ] && cp -f $TMPDIR/framework-miui-res $MODPATH/system/media/theme/default
if [ -e "$VHMI/XList.md" ];then
for vahdbff in $(cat "$VHMI/XList.md"); do
cp -f "$TMPDIR/apk/Zz.$vahdbff.apk" $MODPATH$Overlay
done
else
cp -f $TMPDIR/apk/* $MODPATH$Overlay
fi
ui_print2 "Tổng: $(find $MODPATH$Overlay/*.apk | grep -c '\.apk') ứng dụng"
ui_print
# VHI
fi

if [ "$Licham" == 1 ];then
[ -e "$TMPDIR/TT.Zip" ] || Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT_$(GP version).Zip" "$TMPDIR/TT.Zip"
[ -e "$TMPDIR/TT.Zip" ] && unzip -qo "$TMPDIR/TT.Zip" -d $TMPDIR >&2
cp -rf $TMPDIR/apk/*com.android.systemui*.apk $MODPATH$Overlay
cp -rf $TMPDIR/framework-miui-res $MODPATH/system/media/theme/default
fi

# Tạo font
lnf(){
mkdir -p $MODPATH/system/fonts
cd $MODPATH/system/fonts
cp -rf /system/fonts/Roboto-Regular.ttf MiLanProVF.ttf
cp -rf MiLanProVF.ttf MiSansVF.ttf
}
if [ "$fontvh" == 1 ];then
ui_print2 "Cài phông chữ"
ui_print
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] && cp -rf $VHMI/fonts $MODPATH/system
lnf
echo > $MODPATH/font
else
ui_print2 "Xoá phông chữ"
ui_print
rm -fr $MODPATH/system/fonts
fi

# Gỡ cài đặt app
if [ "$goappcn" == 1 ];then
ui_print2 "Gỡ app rác"
ui_print
# Danh sách những app cần gỡ 

[ -e $VHMI/App_rac.txt ] && Listappcn="cat $VH-MI/App_rac.txt" || Listappcn="com.mipay.wallet
com.miui.analytics
com.xiaomi.ab
com.miui.voiceassist
com.miui.voicetrigger
com.unionpay.tsmservice.mi
com.xiaomi.payment
com.xiaomi.aireco
com.mobiletools.systemhelper
com.xiaomi.shop
com.miui.smarttravel
com.xiaomi.jr
com.xiaomi.youpin
com.xiaomi.vipaccount
com.miui.virtualsim
com.miui.contentextension
com.miui.yellowpage
com.xiaomi.aiasst.service
com.miui.carlink
com.xiaomi.mi_connect_service
com.android.quicksearchbox
com.xiaomi.aiasst.vision
com.miui.accessibility
com.miui.tsmclient
com.miui.nextpay
com.sohu.inputmethod.sogou.xiaomi
com.iflytek.inputmethod.miui
com.baidu.input_mi
com.android.browser
com.miui.videoplayer
com.miui.player
com.xiaomi.drivemode
com.xiaomi.gamecenter.sdk.service
com.miui.hybrid.accessory
com.xiaomi.macro
"

mrw
for vakkkhddddv in $Listappcn; do
ui_print2 "Gỡ: $vakkkhddddv" >&2
pm uninstall $vakkkhddddv >&2
Gwsgn="$(pm path "$vakkkhddddv" | cut -d : -f2)"
rm -fr $Gwsgn
[ "$Gwsgn" ] && echo "$Gwsgn" >> /data/tools/Listapp
done
mro

cat /data/tools/Listapp | sort | uniq > /data/tools/Listapp2
if [ -e /data/tools/Listapp2 ];then
for mvcfbb in $(cat /data/tools/Listapp2); do
FREEZE $mvcfbb
done
fi
mv /data/tools/Listapp2 /data/tools/Listapp
fi

# Dịch vụ gg
Ptkkf=$(find /*/*/etc/permissions/*cn.google*.xml /*/etc/permissions/*cn.google*.xml | head -n1)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi

Ksdjn="$(find /*/etc/device_features/*.xml /*/*/etc/device_features/*.xml | head -n1)"
if [ -e "$Ksdjn" ];then
mkdir -p $MODPATH${Ksdjn%/*}
cp -rf $Ksdjn $MODPATH${Ksdjn%/*}
gcfgvvg='
<bool name="support_screen_paper_mode">true</bool>
<bool name="support_screen_enhance_engine">true</bool>
<bool name="support_AI_display">true</bool>
<integer name="support_widevine_l1">2</integer>'
for kkabs in $gcfgvvg; do
Trsggc="$(echo "$kkabs" | grep -m1 name= | cut -d '"' -f2)"
sed -i "/\"$Trsggc\"/d" $MODPATH$Ksdjn
done
sed -i "s|</features>||" $MODPATH$Ksdjn
echo "$gcfgvvg
</features>" >> "$MODPATH$Ksdjn"
fi

# Fix dark mod
Egveb="$(find /etc/ForceDarkAppSettings.json /*/etc/ForceDarkAppSettings.json /*/*/etc/ForceDarkAppSettings.json /*/*/etc/forcedarkconfig/ForceDarkAppSettings.json /*/etc/forcedarkconfig/ForceDarkAppSettings.json | head -n1)"
mkdir -p $MODPATH${Egveb%/*}
echo "[
$(echo "$(pm list packages -3 | cut -d : -f2)" | awk '{print "{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"" $1 "\",\"showInSettings\":true},"}')
{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"com.android.vending\",\"showInSettings\":true},
{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"com.google.android.gms\",\"showInSettings\":true},
{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"com.google.android.webview\",\"showInSettings\":true}
]" > $MODPATH$Egveb

for Bala in product vendor system_ext etc; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

[ "$VHI" == 2 ] && rm -fr $MODPATH/system/product

$Test123 || abort
ui_print2 "$(End_time)"
ui_print
## end of code

for Ksksn in $(pm list packages -3 | cut -d : -f2); do
dumpsys deviceidle whitelist +$Ksksn >&2
done
dumpsys deviceidle whitelist +com.android.mms >&2
dumpsys deviceidle whitelist +com.android.providers.telephony >&2

cmd settings put secure show_rotation_suggestions 0
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}

