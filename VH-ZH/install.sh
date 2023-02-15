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
Viewonline "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/.github/Tools/Tools.sh" > $MODPATH/Tools.sh
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
ui_print "  $Information: $(getprop ro.product.device), $API, $ARCH"
ui_print
}

## Start the installation
on_install(){
## code

echo 'I0FwaWx0PSQoZ3JlcCAtbTEgY29tLnhpYW9taSAvZGF0YS9zeXN0ZW0vc3luYy8qLiogfCB0ciAnICcgJ1xuJyB8IGdyZXAgLW0xIGFjY291bnQ9IHwgY3V0IC1kIFwiIC1mMikKI1sgLXogIiRBcGlsdCIgXSAmJiBBcGlsdD0kKGdyZXAgLWFDNyAnY29tLmFuZHJvaWQuY29udGFjdHMnIC9kYXRhL3N5c3RlbS9zeW5jL2FjY291bnRzLnhtbCB8IGdyZXAgLyB8IGhlYWQgLW4xIHwgY3V0IC1kICcvJyAtZjEpCgpbICIkQVBJIiAtbGUgMzAgXSAmJiBBcGlsdD0iJChncmVwIC1tMSAiY29tLnhpYW9taSIgL2RhdGEvc3lzdGVtL3N5bmMvYWNjb3VudHMueG1sIHwgdHIgJyAnICdcbicgfCBncmVwIC1tMSBhY2NvdW50IHwgY3V0IC1kIFwiIC1mMikiClsgIiRBUEkiIC1nZSAzMSBdICYmIEFwaWx0PSIkKGdyZXAgLWEgLUEyICJjb20ueGlhb21pIiAvZGF0YS9zeXN0ZW0vc3luYy9hY2NvdW50cy54bWwgfCBoZWFkIC1uMiB8IHRhaWwgLW4xIHwgY3V0IC1kICcvJyAtZjEpIgpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9Ikzhu5dpIFRLIE1pIgoKaW1laT0iJChnZXRwcm9wIHBlcnNpc3QucmFkaW8ubWVpZCkiClsgLXogIiRpbWVpIiBdICYmIGltZWk9IiQoZ2V0cHJvcCByby5yaWwub2VtLm1laWQpIgpbIC16ICIkaW1laSIgXSAmJiBpbWVpPSIkKGdyZXAgLW0xIGtleV9tZWlkX3Nsb3QwIC9kYXRhLyovMC9jb20uYW5kcm9pZC5waG9uZS9zaGFyZWRfcHJlZnMvY29tLmFuZHJvaWQucGhvbmVfcHJlZmVyZW5jZXMueG1sIHwgY3V0IC1kICc+JyAtZjIgfCBjdXQgLWQgJzwnIC1mMSkiClsgLXogIiRpbWVpIiBdICYmIGltZWk9Ikzhu5dpIE1FSUQpIgoKTGl0dXNzPSIkKFhlbSBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2FrYXRoaWMvWkgtVk4vWkgvVXNlcm5hbWUvJChnZXRwcm9wIHJvLnByb2R1Y3QuZGV2aWNlKSB8IGJhc2U2NCAtZCkiCgpmb3IgVmtkZyBpbiAkTGl0dXNzOyBkbwpra2loaD0kKGdyZXAgLWFjbTEgJFZrZGcgL2RhdGEvc3lzdGVtL3N5bmMvYWNjb3VudHMueG1sKQpbICRra2loaCA9PSAxIF0gJiYgYnJlYWsKZG9uZQoKZGtucmpqPSIkKGVjaG8gIiRMaXR1c3MiIHwgZ3JlcCAtY20xICRpbWVpKSIKClRlc3QxMjM9dHJ1ZQoKaWYgWyAiJGtraWhoIiA9PSAxIF0gfHwgWyAiJGRrbnJqaiIgPT0gMSBdO3RoZW4KdWlfcHJpbnQyICJDaMOgbyBi4bqhbjogJEFwaWx0Igp1aV9wcmludAoKWyAtZSAvZGF0YS90b29scy9saWIvTG9nLnR4dCBdICYmIHJtIC1mciAvZGF0YS90b29scy9saWIvTG9nLnR4dAplbHNlCnVpX3ByaW50ICIhIFRow7RuZyBiw6FvCiIKdWlfcHJpbnQgIiAgVMOqbiBtw6F5OiAkKGdldHByb3Agcm8ucHJvZHVjdC5kZXZpY2UpCgogIFTDoGkga2hv4bqjbiBNaTogJEFwaWx0CiAgCiAgSU1FSTogJGltZWkKIiAgCnVpX3ByaW50ICIgIMSQ4buDIHPhu60gZOG7pW5nIGzDonUgZMOgaSBi4bqhbiBuw6puIOG7p25nIGjhu5kgxJHhu4Mgc+G7rSBk4bulbmcKCiAgdsSpbmggdmnhu4VuLgoKICBUaOG7rSBuZ2hp4buHbSBz4bq9IGPDsyB0w6FjIGThu6VuZyB0cm9uZyBuZ8OgeSBow7RtIMSRw7MuCgogIEjhur90IHRo4budaSBnaWFuIHPhur0gdOG7sSDEkeG7mW5nIHJlYm9vdCBtw6F5LgoiClsgLWUgL2RhdGEvdG9vbHMvbGliL0xvZy50eHQgXSAmJiBhYm9ydCAiLSBC4bqhbiDEkcOjIGjhur90IGzGsOG7o3QgZMO5bmcgdGjhu60gcsO5aS4KIgphbSBzdGFydCAtYSBhbmRyb2lkLmludGVudC5hY3Rpb24uVklFVyAtZCAiaHR0cHM6Ly9rYWthdGhpYy5naXRodWIuaW8vWkgtVk4vU3VwcG9ydC5odG1sIiA+JjIKCmVjaG8gJwp3aGlsZSB0cnVlOyBkbwppZiBbICIkKGNhdCAvZGF0YS90b29scy9saWIvVGVzdCkiICE9ICIkKGRhdGUgKyIlZCIpIiBdO3RoZW4KZWNobyAiSOG6v3QgVGltZTogJChkYXRlKSIgPiAvZGF0YS90b29scy9saWIvTG9nLnR4dAplY2hvID4gJHswJS8qfS9yZW1vdmUKc2xlZXAgMTAKcmVib290CmZpCmRvbmUKJyA+IC9kYXRhL3Rvb2xzL2xpYi9ydW4uc2gKZWNobyAnCm5vaHVwIC9kYXRhL3Rvb2xzL2xpYi9ydW4uc2ggJj4kezAlLyp9L3J1bi5sb2cgJgonID4+ICRUTVBESVIvc2VydmljZS5zaAplY2hvICIkKGRhdGUgKyIlZCIpIiA+ICRNT0RQQVRIL1Rlc3QKZmk=' | base64 -d > $TMPDIR/ka.sh && . $TMPDIR/ka.sh
ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
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

ui_print "- Sử dụng Font chữ Việt hóa ?"
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

ui_print "- Sửa chữa thông báo ứng dụng ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP fixtbhr)" ];then
fixtb=$(GP fixtbhr)
ui_print
ui_print2 "Chọn: $fixtb"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
fixtb=$input
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
ui_print2 "Ngôn ngữ: $(GP LinkTn)"
ui_print
ui_print2 "Code: $(GP Linknn)"
ui_print
ui_print2 "Đang VH"
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
ui_print2 "Cài Font"
ui_print
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] && cp -rf $VHMI/fonts $MODPATH/system
lnf
else
ui_print2 "Xoá Font"
ui_print
rm -fr $MODPATH/system/fonts
fi

# Gỡ cài đặt app
if [ "$goappcn" == 1 ];then
ui_print2 "Gỡ App rác"
ui_print
# Danh sách những app cần gỡ 
Listappcn="com.mipay.wallet
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

if [ "$fixtb" == 1 ];then

ui_print "- Thêm ứng dụng vào danh sách sửa lỗi thông báo"
ui_print
Lkkdf="$(GP ListApp | tr ',' '\n')"
[ "$Lkkdf" ] || Lkkdf="$(pm list packages -3 | cut -d : -f2)"

for Ksksn in $Lkkdf; do
dumpsys deviceidle whitelist +$Ksksn >&2
am set-standby-bucket $Ksksn active
cmd appops start $Ksksn 10008
cmd appops set $Ksksn START_FOREGROUND allow
cmd appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
cmd appops set $Ksksn RUN_IN_BACKGROUND allow
cmd appops set $Ksksn 10008 allow
cmd appops set $Ksksn 10021 allow
ui_print "  $Ksksn"
sleep 0.2
done
ui_print

echo 'while true; do

kncfgvv="$(grep -m1 "ListApp=" ${0%/*}/module.prop | cut -d "=" -f2 | tr "," "\n")";
[ "$kncfgvv" ] || kncfgvv="$(pm list packages -3 | cut -d : -f2)";

for Ksksn in $kncfgvv; do
dumpsys deviceidle whitelist +$Ksksn >/dev/null
appops set $Ksksn 10008 allow
appops set $Ksksn 10021 allow
appops set $Ksksn RUN_IN_BACKGROUND allow
appops set $Ksksn RUN_ANY_IN_BACKGROUND allow
appops set $Ksksn START_FOREGROUND allow
sleep 2
done
sleep 120
done' >> $TMPDIR/service.sh

fi

# Dịch vụ gg
Ptkkf=$(find /*/*/etc/permissions/*cn.google*.xml /*/etc/permissions/*cn.google*.xml | head -n1)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi

# Fix dc
Ksdjn="$(find /*/etc/device_features/*.xml /*/*/etc/device_features/*.xml | head -n1)"
if [ -e "$Ksdjn" ] && [ "$(getprop ro.product.system.device)" == "raphael" ];then
mkdir -p $MODPATH${Ksdjn%/*}
cp -rf $Ksdjn $MODPATH${Ksdjn%/*}
sed -i 's|<bool name="support_dc_backlight">true</bool>|<bool name="support_dc_backlight">false</bool>|' "$MODPATH$Ksdjn"
fi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

$Test123 || abort
ui_print2 "$(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}

