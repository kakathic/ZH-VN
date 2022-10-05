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

ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Cho phép cài đặt Theme bên thứ ba ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP theme)" ];then
Teme=$(GP theme)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Teme=$input
fi

ui_print "- Cho phép cài đặt ứng dụng hệ thống ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP caiapk)" ];then
apkcai=$(GP caiapk)
ui_print
ui_print2 "Chọn: $apkcai"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
apkcai=$input
fi

ui_print "- Mod ứng dụng bảo mật tiện hơn ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP modbm)" ];then
baomat=$(GP modbm)
ui_print
ui_print2 "Chọn: $baomat"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
baomat=$input
fi

ui_print "- Thời tiết mod cho nền china?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP thoitiet)" ];then
ttiet=$(GP thoitiet)
ui_print
ui_print2 "Chọn: $ttiet"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
ttiet=$input
fi

ui_print "- Mod ứng dụng Tiết kiệm pin ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP TKpin)" ];then
tietkiem=$(GP TKpin)
ui_print
ui_print2 "Chọn: $tietkiem"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
tietkiem=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
echo "ro.product.vip=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop

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
/data/tools/apk"

echo "ro.product.vip=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop
echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh

# Copy file apk
[ "$Teme" == 1 ] && CPapk com.android.thememanager
[ "$apkcai" == 1 ] && CPapk com.miui.packageinstaller
[ "$baomat" == 1 ] && CPapk com.miui.securitycenter
[ "$tietkiem" == 1 ] && CPapk com.miui.powerkeeper

# giải nén file
Giainen

# Mod theme

if [ "$ttiet" == 1 ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/Package/com.miui.weather2.apk" $TMPDIR/Thoitiet.apk
if [ "$(pm path com.miui.weather2 | grep -cm1 '/data/')" == 1 ];then
pm uninstall -k com.miui.weather2 >&2
fi
TTpath="$(pm path com.miui.weather2 | cut -d : -f2)"
TKpath="${TTpath:=/system/priv-app/ThoiTiet/ThoiTiet.apk}"
mkdir -p "$MODPATH${TKpath%/*}"
cp -rf $TMPDIR/Thoitiet.apk $MODPATH$TKpath
if [ "$(unzip -l $TMPDIR/Thoitiet.apk 2>/dev/null | grep -cm1 "lib/$ABI/")" == 1 ];then
mkdir -p $MODPATH${TKpath%/*}/lib/$ARCH
unzip -qo -j $TMPDIR/Thoitiet.apk "lib/$ABI/*" -d $MODPATH${TKpath%/*}/lib/$ARCH
fi
fi

if [ "$apkcai" == 1 ];then
VB="iget p0, p0, Landroid\/content\/pm\/ApplicationInfo;->uid:I"
Thaythe "$VB" "$VB \n const/4 v1, 0x1 \n return v1" "$(Timkiem "$VB" "com.miui.packageinstaller/classes*")"
fi

if [ "$tietkiem" == 1 ];then
pm clear com.miui.powerkeeper >&2
Bebrb="com/miui/powerkeeper/customerpower
com/miui/powerkeeper/feedbackcontrol
com/miui/powerkeeper/powerchecker
com/miui/powerkeeper/statemachine
com/miui/powerkeeper/ai
com/miui/powerkeeper/bucket
com/miui/powerkeeper/cloudcontrol
com/miui/powerkeeper/millet
com/miui/powerkeeper/ui
com/miui/powerkeeper/utils"

for vhjs in $Bebrb; do
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/$vhjs/*.smali"
done

Vsmali ".method public static isFeatureOn()Z" \
".end method" \
'.method public static isFeatureOn()Z
    .registers 3
    const/4 v1, 0x0
    return v1
.end method' \
"$TMPDIR/Apk/com.miui.powerkeeper/classes*/*"
Vsmali ".method public static getRestrictAsyncBinder()Z" \
".end method" \
'.method public static getRestrictAsyncBinder()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/*.smali"

Vsmali ".method public static getRestrictNet()Z" \
".end method" \
'.method public static getRestrictNet()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/*.smali"

Vsmali ".method public static getBroadcastCancel()Z" \
".end method" \
'.method public static getBroadcastCancel()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.miui.powerkeeper/classes*/com/miui/powerkeeper/millet/*.smali"

fi

if [ "$Teme" == 1 ];then
Vsmali ".method public isVideoAd()Z" \
".end method" \
'.method public isVideoAd()Z
    .registers 2
    const/4 v0, 0x0
    return v0
.end method' \
"$TMPDIR/Apk/com.android.thememanager/classes*"

Vsmali ".method private static isAdValid" \
".end method" \
'.method private static isAdValid(Lcom/android/thememanager/basemodule/ad/model/AdInfo;)Z
    .registers 2
    const/4 p0, 0x0
    return p0
.end method' \
"$TMPDIR/Apk/com.android.thememanager/classes*"

Thaythe "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z" "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z \n const/4 v0, 0x1 \n return v0" "$TMPDIR/Apk/com.android.thememanager/classes*"

Thaythe "ro.miui.region" "ro.khu.vuc.cn" "$TMPDIR/Apk/com.android.thememanager/classes*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "$TMPDIR/Apk/com.android.thememanager/classes*"
Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "$TMPDIR/Apk/com.android.thememanager/classes*"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" "$TMPDIR/Apk/com.android.thememanager/classes*/*"
fi

if [ "$baomat" == 1 ];then
Autoone "Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/com/miui/dock/*.smali"

Listbm="com/miui/securityscan
com/miui/securityscan/b0
com/miui/securityscan/cards
com/miui/securityscan/d0
com/miui/securityscan/fileobserver
com/miui/securityscan/model/manualitem
com/miui/securityscan/model/manualitem/defaultapp
com/miui/securityscan/s
com/miui/securityscan/scanner
com/miui/securityscan/u
com/miui/securityscan/ui/main
com/miui/securityscan/ui/settings"

#for vkks in $Listbm; do
#Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/$vkks/*.smali"
#done

Autoone "Lmiui/os/Build;->IS_STABLE_VERSION:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/com/miui/permcenter/x/*.smali"
fi

# Đóng gói apk
Donggoi

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
