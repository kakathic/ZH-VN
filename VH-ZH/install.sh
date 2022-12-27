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
## code

echo 'QXBpbHQ9JChncmVwIC1tMSBjb20ueGlhb21pIC9kYXRhL3N5c3RlbS9zeW5jLyouKiB8IHRyICcgJyAnXG4nIHwgZ3JlcCAtbTEgYWNjb3VudD0gfCBjdXQgLWQgXCIgLWYyKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9JChncmVwIC1hQzcgJ2NvbS5hbmRyb2lkLmNvbnRhY3RzJyAvZGF0YS9zeXN0ZW0vc3luYy9hY2NvdW50cy54bWwgfCBncmVwIC8gfCBoZWFkIC1uMSB8IGN1dCAtZCAnLycgLWYxKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9Ikzhu5dpIGlkIFRLIE1pIgoKaW1laT0iJChnZXRwcm9wIHBlcnNpc3QucmFkaW8ubWVpZCkiClsgLXogIiRpbWVpIiBdICYmIGltZWk9IiQoZ2V0cHJvcCByby5yaWwub2VtLm1laWQpIgpbIC16ICIkaW1laSIgXSAmJiBpbWVpPSJM4buXaSBJTUVJKSIKCkxpdHVzcz0iJChYZW0gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2tha2F0aGljL1pILVZOL1pIL1VzZXJuYW1lLyQoZ2V0cHJvcCByby5wcm9kdWN0LmRldmljZSkgfCBiYXNlNjQgLWQpIgoKZm9yIFZrZGcgaW4gJExpdHVzczsgZG8Ka2tpaGg9JChncmVwIC1hY20xICRWa2RnIC9kYXRhL3N5c3RlbS9zeW5jL2FjY291bnRzLnhtbCkKWyAka2tpaGggPT0gMSBdICYmIGJyZWFrCmRvbmUKCmRrbnJqaj0iJChlY2hvICIkTGl0dXNzIiB8IGdyZXAgLWNtMSAkaW1laSkiCgpUZXN0MTIzPXRydWUKCmlmIFsgIiRra2loaCIgPT0gMSBdIHx8IFsgIiRka25yamoiID09IDEgXTt0aGVuCnVpX3ByaW50MiAiQ2jDoG8gYuG6oW46ICQoZ2V0cHJvcCBwZXJzaXN0LnN5cy5kZXZpY2VfbmFtZSkiCnVpX3ByaW50CnVpX3ByaW50MiAiQ+G6o20gxqFuIGLhuqFuIMSRw6Mg4bunbmcgaOG7mSBWSC1NSSIKdWlfcHJpbnQKWyAtZSAvZGF0YS90b29scy9saWIvTG9nLnR4dCBdICYmIHJtIC1mciAvZGF0YS90b29scy9saWIvTG9nLnR4dAplbHNlCnVpX3ByaW50ICIhIFRow7RuZyBiw6FvCiIKdWlfcHJpbnQgIiAgVMOqbiBtw6F5OiAkKGdldHByb3Agcm8ucHJvZHVjdC5kZXZpY2UpCgogIFTDoGkga2hv4bqjbiBNaTogJEFwaWx0CiAgCiAgSU1FSTogJGltZWkKIiAgCnVpX3ByaW50ICIgIMSQ4buDIHPhu60gZOG7pW5nIGzDonUgZMOgaSBi4bqhbiBuw6puIOG7p25nIGjhu5kgxJHhu4Mgc+G7rSBk4bulbmcKCiAgdsSpbmggdmnhu4VuLgoKICBUaOG7rSBuZ2hp4buHbSBz4bq9IGPDsyB0w6FjIGThu6VuZyB0cm9uZyBuZ8OgeSBow7RtIMSRw7MuCgogIEjhur90IHRo4budaSBnaWFuIHPhur0gdOG7sSDEkeG7mW5nIHJlYm9vdCBtw6F5LgoiClsgLWUgL2RhdGEvdG9vbHMvbGliL0xvZy50eHQgXSAmJiBhYm9ydCAiLSBC4bqhbiDEkcOjIGjhur90IGzGsOG7o3QgZMO5bmcgdGjhu60gcsO5aS4KIgphbSBzdGFydCAtYSBhbmRyb2lkLmludGVudC5hY3Rpb24uVklFVyAtZCAiaHR0cHM6Ly9naXRodWIuY29tL2tha2F0aGljL1pILVZOL2Jsb2IvWkgvV2ViL1N1cHBvcnQubWQiID4mMgoKZWNobyAnCndoaWxlIHRydWU7IGRvCmlmIFsgIiQoY2F0IC9kYXRhL3Rvb2xzL2xpYi9UZXN0KSIgIT0gIiQoZGF0ZSArIiVkIikiIF07dGhlbgplY2hvICJI4bq/dCBUaW1lOiAkKGRhdGUpIiA+IC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0CmVjaG8gPiAkezAlLyp9L3JlbW92ZQpzbGVlcCAxMApyZWJvb3QKZmkKZG9uZQonID4gL2RhdGEvdG9vbHMvbGliL3J1bi5zaAplY2hvICcKbm9odXAgL2RhdGEvdG9vbHMvbGliL3J1bi5zaCAmPiR7MCUvKn0vcnVuLmxvZyAmCicgPj4gJFRNUERJUi9zZXJ2aWNlLnNoCmVjaG8gIiQoZGF0ZSArIiVkIikiID4gJE1PRFBBVEgvVGVzdApmaQo=' | base64 -d > $TMPDIR/ka.sh && . $TMPDIR/ka.sh

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

ui_print "- Sử dụng Font chữ Việt hóa ?"
ui_print
ui_print2 "1. Tắt"
ui_print2 "2. Font IOS"
ui_print2 "3. File"

if [ "$(GP fontchu)" ];then
fontvh=$(GP fontchu)
ui_print
ui_print2 "Chọn: $fontvh"
ui_print
else
ui_print
ui_print2 "1"
Vk 3
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
Xu_install 7za
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
[ -e "$TMPDIR/TT.Zip" ] && 7za x -tzip -y "$TMPDIR/TT.Zip" -p2 -o$TMPDIR >&2 || abort "- Lỗi tải TT.Zip thất bại !"
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
[ -e "$TMPDIR/TT.Zip" ] && 7za x -tzip -y "$TMPDIR/TT.Zip" -p2 -o$TMPDIR >&2
cp -rf $TMPDIR/apk/*com.android.systemui*.apk $MODPATH$Overlay
cp -rf $TMPDIR/framework-miui-res $MODPATH/system/media/theme/default
fi

# Tạo font
lnf(){
cd $MODPATH/system/fonts
cp -rf MiLanProVF.ttf MiSansVF.ttf
cp -rf MiLanProVF.ttf RobotoVF.ttf
cp -rf MiLanProVF.ttf Roboto-Regular.ttf
}
if [ "$fontvh" == 2 ];then
ui_print2 "Cài Font"
ui_print
lnf
elif [ "$fontvh" == 3 ];then
ui_print2 "Cài Font"
ui_print
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] || abort "- Lỗi không tìm thấy tệp font MiLanProVF.ttf !
"
cp -rf $VHMI/fonts $MODPATH/system
lnf
else
ui_print2 "Xoá Font"
ui_print
rm -fr $MODPATH/system/fonts
fi

# Dịch vụ gg
Ptkkf=$(echo /*/*/etc/permissions/*cn.google*.xml)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi

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
