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
## code

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
ui_print "! Ấn nút nguồn để hủy."
ui_print


ui_print "- Thêm ngôn ngữ Tiếng Việt vào Rom ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP VH)" ];then
VHI=$(GP VH)
ui_print
ui_print2 "Chọn: $VHI"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
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

ui_print "- Sử dụng phông chữ chữ Việt hóa ?"
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

echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh
[ -e /system/product/overlay ] && Overlay=/system/product/overlay || Overlay=/system/vendor/overlay
VHMI=/sdcard/VH-MI

# Tạo thư mục
TTM "$MODPATH/system/media/theme/default
$VHMI/fonts
$TMPDIR/apk
$TMPDIR/Apk/tmp
$MODPATH$Overlay
"
## Unzip system
ui_print2 "$unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH

mkdir -p /sdcard/Android/data/com.android.thememanager/files/MIUI
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/MIUI
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/Android/data/com.android.thememanager/files/MIUI

Xu_install zip
Xu_install jq
Xu_install toybox

$Test123 || abort

if [ "$VHI" == 1 ];then
# Cài đặt ngôn ngữ
settings put system system_locales $(GP Linknn)
ui_print2 "Thêm ngôn ngữ: $(GP LinkTn)"
ui_print
ui_print2 "Đang Việt hóa"
ui_print
Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT.Zip" "$TMPDIR/TT.Zip"
[ -e "$TMPDIR/TT.Zip" ] && unzip -qo "$TMPDIR/TT.Zip" -d $TMPDIR >&2 || abort "- Lỗi tải TT.Zip thất bại !"
if [ "$Licham" != 1 ];then
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
[ -e "$TMPDIR/TT.Zip" ] || Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT.Zip" "$TMPDIR/TT.Zip"
[ -e "$TMPDIR/TT.Zip" ] && unzip -qo "$TMPDIR/TT.Zip" -d $TMPDIR >&2
cp -rf $TMPDIR/apk/*com.android.systemui*.apk $MODPATH$Overlay
cp -rf $TMPDIR/framework-miui-res $MODPATH/system/media/theme/default
fi

# Tạo font
lnf(){
cd $MODPATH/system/fonts
cp -rf MiLanProVF.ttf MiSansVF.ttf
cp -rf MiLanProVF.ttf RobotoVF.ttf
}
if [ "$fontvh" == 1 ];then
ui_print2 "Cài phông chữ"
ui_print
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] && cp -rf $VHMI/fonts $MODPATH/system
lnf
else
ui_print2 "Xoá phông chữ"
ui_print
rm -fr $MODPATH/system/fonts
fi

# Gỡ cài đặt app
if [ "$goappcn" == 1 ];then
ui_print2 "Gỡ ứng dụng rác"
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
"
mrw
Gappcn(){
ui_print2 "Gỡ: $1" >&2
pm uninstall $1 >&2
Pathappvcfgvchb="$(pm path "$1" | cut -d : -f2)"
if [ "$Pathappvcfgvchb" ];then
rm -fr ${Pathappvcfgvchb%/*}
sleep 0.5
[ -e "$(magisk --path)/.magisk/mirror$Pathappvcfgvchb" ] && echo "$Pathappvcfgvchb" >> /data/tools/Listapp
fi
}
for vakkkhddddv in $Listappcn; do
Gappcn "$vakkkhddddv"
done

if [ -e /data/tools/Listapp ];then
for mvcfbb in $(cat /data/tools/Listapp); do
FREEZE $mvcfbb
done
fi
mro
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
sed -i "s|</features>||" $MODPATH$Ksdjn
echo '
<bool name="support_screen_paper_mode">true</bool>
<!-- device support screen enhance engine -->
<bool name="support_screen_enhance_engine">true</bool>
<!-- whether support AI Display-->
<bool name="support_AI_display">true</bool>
<integer-array name="screen_resolution_supported">
<item>1220</item>
<item>1080</item>
</integer-array>
</features>
' >> "$MODPATH$Ksdjn"
fi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

$Test123 || abort
ui_print2 "$(End_time)"
ui_print
## end of code

codean="'{print \$3}'"
echo '
Fixmodun(){
Key="$(timeout 5 getevent -qlc 1 | awk '$codean')"
if [ "$Key" == "KEY_VOLUMEUP" ];then
[ "$input" -ge 3 ] && am start com.topjohnwu.magisk/.ui.MainActivity
input=$(($input + 1))
sleep 0.3
Fixmodun
elif [ "$Key" == "KEY_VOLUMEDOWN" ];then
input2=$(($input2 + 1))
if [ "$input2" -ge 3 ];then
for kfgh in /data/adb/modules/*; do
echo > $kfgh/disable
done
reboot
exit
fi
sleep 0.3
Fixmodun
else
input3=$(($input3 + 1))
[ "$input3" -ge 50 ] && exit
Fixmodun
fi
Fixmodun
}
Fixmodun
' > /data/adb/service.d/rescue.sh
chmod 777 /data/adb/service.d/rescue.sh
settings put secure show_rotation_suggestions 0
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}

