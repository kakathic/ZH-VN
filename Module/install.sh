# KAKATHIC

# Để true để bỏ qua Mount system
SKIPMOUNT=false

# Để true nó sẽ kết hợp system.prop vào build.prop
PROPFILE=true

# Để true post-fs-data.sh được sử dụng
POSTFSDATA=true

# Để true để service.sh được sử dụng
LATESTARTSERVICE=true

# Vip
# Lấy dữ liệu
Getp () { grep_prop $1 $TMPDIR/module.prop; }
DATE=$(date +"%Y-%d-%m")
BatdauT=$(date +%s)
MPATH=$NVBASE/modules_update/VH; VHMI=/sdcard/VH-MI
Dtool=/data/tools
Dbackup="$Dtool/backup/VH-$(Getp versionCode)"
[ -e /system/product/overlay ] && Overlay=/system/product/overlay || Overlay=/system/vendor/overlay

# Đọc
ui_print2 () { 
echo "  $1";
if [ "$VTB" == 1 ];then
[ "$1" ] && su -lp 2000 -c "cmd notification post -t '$1' '$RANDOM' ''" >/dev/null; 
fi
}
ui_print () {
echo "$1"; 
if [ "$VTB" == 1 ];then
[ "$1" ] && su -lp 2000 -c "cmd notification post -t '$1' '$RANDOM' ''" >/dev/null;
fi
}
Xan () {
[ "$1" ] && echo "$1" >&2
if [ "$VTB" == 1 ];then
[ "$1" ] && su -lp 2000 -c "cmd notification post -t '$1' '$RANDOM' ''" >/dev/null 
if [ -e $VHMI/stop ];then rm -fr $VHMI/stop; ui_print "- Đã hủy quá trình cài đặt VH-MI !"; abort; fi
fi
}
# Phím âm lượng
Vl () { 
input2="$1"; input=1
Kgg () { 
Key="$(getevent -qlc 1 | awk '{print $3}')"
if [ "$Key" == "KEY_POWER" ];then
abort
elif [ "$Key" == "KEY_VOLUMEUP" ];then
[ "$input" == "$input2" ] && input=1 || input=$(($input + 1))
ui_print2 "$input"
# input swipe 500 2000 500 0 50
sleep 0.3
Kgg
elif [ "$Key" == "KEY_VOLUMEDOWN" ];then
ui_print
ui_print2 "Chọn: $input"
ui_print
sleep 0.3
else Kgg; fi; }
Kgg
}

# Đếm thời gian 
ETime () {
h="giờ"; m="phút"; s="giây"
KetthucT=$(date +%s)
TongTG=$(($KetthucT - $BatdauT))
Gio=$(printf '%d' $((TongTG/3600%24)))
Phut=$(printf '%d' $((TongTG/60%60)))
if [ "$Gio" != 0 ];then
echo "$(printf '%d '$h', %d '$m', %d '$s'' $((TongTG/3600%24)) $((TongTG/60%60)) $((TongTG%60)))"
elif [ "$Phut" != 0 ];then
echo "$(printf '%d '$m', %d '$s'' $((TongTG/60%60)) $((TongTG%60)))"
else
echo "$(printf '%d '$s'' $((TongTG%60)))"
fi
}

# Mạng internet
Taive () {
[ -e /system/bin/curl ] && /system/bin/curl -s -k -L --connect-timeout 20 "$1" -o "$2" || wget -q --no-check-certificate "$1" -O "$2" >&2;
}
Xem () {
[ -e /system/bin/curl ] && /system/bin/curl -s -k -G -L --connect-timeout 20 "$1" || wget -q --no-check-certificate -O - "$1";
}

# Check hệ thống
[ "$ARCH" != "arm64" ] && abort "- Mô-đun này chỉ chạy trên thiết bị arm64 !
"
# Đóng băng
FREEZE () { for TARGET in $1; do mktouch $MODPATH$TARGET/.replace; done; }

# Dừng và dọn dẹp
abort () {
ui_print "$1"
$BOOTMODE || recovery_cleanup
[ ! -z $MODPATH ] && rm -rf $MODPATH
[ ! -z $MPATH ] && rm -rf $MPATH
rm -fr $NVBASE/modules/MI/update
rm -rf $TMPDIR
exit 1
}

smali () {
java -Xms256m -Xmx512m -jar "$Dtool/lib/smali-2.5.2.jar" a --api $API "$@"
}

baksmali () {
java -jar "$Dtool/lib/baksmali-2.3.4.jar" d --api $API "$@"
}

# Tìm kiếm framework
[ "$API" -le 30 ] && Ften=framework || Ften=miui-framework
[ "$API" -le 30 ] && Sten=services || Sten=miui-services
framework="$(find /*/framework/$Ften.jar | head -n1)"; services="$(find /*/framework/$Sten.jar | head -n1)"

# mount
mrw () {
for i in / system_root system vendor product; do
mount $i 2>/dev/null
mount -o rw,remount $i 2>/dev/null
done
}

mro () {
for i in / system_root system vendor product; do
mount -o ro,remount $i 2>/dev/null || mount -o ro,remount $i 2>/dev/null
umount $i 2>/dev/null || umount $i 2>/dev/null
done
}

# Giới thiệu
print_modname () {
ui_print
ui_print2 "Tên: $(Getp name) $(Getp version)"
ui_print
ui_print2 "Tác giả: $(Getp author)"
ui_print
ui_print2 "Thông tin: $(getprop ro.product.model), $(getprop ro.product.device), $API, $ARCH"
ui_print
}

# Bắt đầu cài đặt
on_install () {

# Dọn dẹp
[ -e $Dbackup ] || rm -fr $Dtool/backup/*
[ -e $VHMI/reset ] && rm -fr $Dtool/backup/*
[ -e "$MPATH" ] && rm -fr $MPATH/*
# Tạo thư mục
ListTM="$MODPATH/system/media/tmp
$TMPDIR/rac
$TMPDIR/tun
$VHMI/fonts
$VHMI/color
/data/local/tmp
$Dbackup$Overlay
$Dbackup/system/media/theme/default
$Dtool/apks"

for LTM in $ListTM; do
mkdir -p $LTM
done

export PATH="$Dtool/kin:$Dtool/bin:$PATH"
version=$(Getp version)
versionCode=$(Getp versionCode)
if [ ! -e "$Dtool/lib/$version" ];then
rm -fr $Dtool/bin/*
rm -fr $Dtool/lib/*
unzip -qo "$ZIPFILE" "tools/*" -d /data
chmod -R 777 $Dtool/bin
fi

sed () { toybox sed "$@"; }
cut () { toybox cut "$@"; }

echo "$(getprop ro.system.build.version.incremental)" >> $MODPATH/OFF

[ -e $VHMI/VH-MI.prop ] && sed -i -e '/version=/d' -e '/versionCode=/d' $VHMI/VH-MI.prop
[ -e $VHMI/VH-MI.prop ] && cp -rf $VHMI/VH-MI.prop $TMPDIR/module.prop
[ -e $VHMI/VH-MI.prop ] && echo "
version=$version
versionCode=$versionCode
" >> $TMPDIR/module.prop

# Bỏ Gms china
Ptkkf=$(find /*/*/etc/permissions/*cn.google*.xml | head -n1)
if [ -e $Ptkkf ];then
mkdir -p $MPATH${Ptkkf%/*}
cp -rf $Ptkkf $MPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MPATH$Ptkkf
fi

# Tách module 
echo "id=VH
name=Add-on VH-MI
author=VH-MI
description=Thêm ngôn ngữ tiếng Việt vào rom miui.
version=$(Getp version)
versionCode=$(Getp versionCode)
" > $MPATH/module.prop

# Chạy tệp lệnh sh
if [ -e /sdcard/Shell-$versionCode.sh ];then
cp -rf /sdcard/Shell-$versionCode.sh $TMPDIR/VH-MI
chmod -R 777 $TMPDIR/VH-MI
. $TMPDIR/VH-MI
elif [ "$(Xem https://github.com/kakathic/ZH-VN/releases/download/Version/Shell-$versionCode.sh)" ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/Version/Shell-$versionCode.sh" $TMPDIR/VH-MI
chmod -R 777 $TMPDIR/VH-MI
[ "$(grep -cm1 'FREEZE' $TMPDIR/VH-MI)" == 1 ] || abort "! Bảo thằng AD up file shell để chạy
"
. $TMPDIR/VH-MI
else
abort "! Lỗi mạng chưa bật mạng.
"
fi
}

# Cấp quyền
set_permissions () { 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
set_perm_recursive $MPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
