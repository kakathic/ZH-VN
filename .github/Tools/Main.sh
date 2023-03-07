# Kakathic

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

TTvip=1
ui_print(){ echo "$1"; sleep 0.005; }
ui_print2(){ echo "  $1"; }
Xan(){ echo "  $1" >&2; }
BatdauT=$(date +%s)

# Volume keys
Vk(){ 
input2="$1"; input=1
Kgg(){ 
Key="$(getevent -qlc 1 | awk '{print $3}')"
if [ "$Key" == "KEY_POWER" ];then
abort
elif [ "$Key" == "KEY_VOLUMEUP" ];then
[ "$input" == "$input2" ] && input=1 || input=$(($input + 1))
ui_print "  $input"
sleep 0.3
Kgg
elif [ "$Key" == "KEY_VOLUMEDOWN" ];then
ui_print
ui_print "  $chon: $input"
ui_print
sleep 0.3
elif [ "$Key" == "ABS_MT_TRACKING_ID" ];then
ui_print
ui_print "  $chon: $input"
ui_print
sleep 0.4
else Kgg; fi; }
Kgg
}

# Count time 
End_time(){
KetthucT=$(date +%s)
TongTG=$(($KetthucT - $BatdauT))
Gio=$(printf '%d' $((TongTG/3600%24)))
Phut=$(printf '%d' $((TongTG/60%60)))
if [ "$Gio" != 0 ];then
echo "$time: $(printf '%d '$h', %d '$m', %d '$s'.' $((TongTG/3600%24)) $((TongTG/60%60)) $((TongTG%60)))"
elif [ "$Phut" != 0 ];then
echo "$time: $(printf '%d '$m', %d '$s'.' $((TongTG/60%60)) $((TongTG%60)))"
else
echo "$time: $(printf '%d '$s'.' $((TongTG%60)))"
fi
}

# Download packages
Xu_install(){
[ "$2" ] && pb="_$2"
if [ ! -e "/data/tools/ck/$1$pb" ];then
ui_print "  $load $1..."
ui_print
Taive "https://github.com/kakathic/Tools/raw/Vip/Library/$1/README.md" "$TMPDIR/$1.sh"
[ "$(grep -icm1 '#\ kakathic' $TMPDIR/$1.sh)" == 1 ] && chmod 777 "$TMPDIR/$1.sh" || abort "$error"
cd /data/tools
. "$TMPDIR/$1.sh"
chmod -R 777 /data/tools/bin
rm -fr $HOME/tmp/*
fi
unset pb
}

# Internet
User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive(){
[ -e /system/bin/curl ] && curl -s -k -L -H "$User" --connect-timeout 20 "$1" -o "$2" || wget -q --header "$User" --no-check-certificate "$1" -O "$2" >&2
}
Xem(){
[ -e /system/bin/curl ] && curl -s -k -G -L -H "$User" --connect-timeout 20 "$1" || wget -q --header "$User" --no-check-certificate -O - "$1"
}

# mount
mrw () {
for i in / /system_root /system /system_ext /vendor /product; do
/system/bin/mount $i 2>/dev/null || /system/bin/mount $i 2>/dev/null
/system/bin/mount -o rw,remount $i 2>/dev/null || /system/bin/mount -o rw,remount $i 2>/dev/null
/system/bin/mount -o rw,remount $(magisk --path)/.magisk/mirror$i 2>/dev/null || /system/bin/mount -o rw,remount $(magisk --path)/.magisk/mirror$i 2>/dev/null
done
}

mro () {
for i in / /system_root /system /system_ext /vendor /product; do
/system/bin/mount -o ro,remount $i 2>/dev/null || /system/bin/mount -o ro,remount $i 2>/dev/null
/system/bin/umount $i 2>/dev/null || /system/bin/umount $i 2>/dev/null
/system/bin/umount $(magisk --path)/.magisk/mirror$i 2>/dev/null || /system/bin/umount $(magisk --path)/.magisk/mirror$i 2>/dev/null
done
}

baksmali () { java -Xms150m -Xmx1028m -jar "/data/tools/lib/Tools/baksmali.jar" "$@"; }
smali () { java -Xms150m -Xmx1028m -jar "/data/tools/lib/Tools/smali.jar" "$@"; }

# Tìm kiếm
Timkiem(){ find $APK/$2 -name "*.smali" -exec grep -l "${1//\//\\\/}" {} +; }

Vsmali(){
for Vka in $(find $4 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e $Vka ] && ui_print2 "MOD: $RANDOM"
[ -e $Vka ] && Xan "MOD: $1" || Xan "- Lỗi: $(echo "$1" | sed 's|\\||g')"
[ -e $Vka ] && sed -i -e "/^${1//\//\\\/}/,/${2//\//\\\/}/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
[ -e $Vka ] && echo "$Vka" 2>/dev/null >> "$APK/$(echo "$4" | sed "s|$APK/||g" | cut -d '/' -f1)/class"
done
}

Thaythe(){
ui_print2 "MOD: $RANDOM -> $RANDOM"
Xan "MOD: $1 -> $2"
for Tt2 in $(find $3 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e "$Tt2" ] && sed -i "s|${1//\//\\\/}|${2//\//\\\/}|g" $Tt2 || Xan "- Lỗi: $1"
[ -e "$Tt2" ] && echo "$Tt2" 2>/dev/null >> "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class"
done
}

Autoone(){
ui_print2 "MOD: $RANDOM -> $RANDOM"
Xan "MOD: $1 -> $2"
for vakkddhh in $(find $3 -name "*.smali" -exec grep -l "..., $1" {} +); do
echo "sed -i $(grep "..., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') $(echo "$vakkddhh" | sed 's|\$|\\\$|g')" | sh
echo "$vakkddhh" 2>/dev/null >> "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class"
done
}

CPapk(){
PTC="$(pm path "$1" | cut -d : -f2)"
if [ "$(echo "$PTC" | grep -cm1 '/data/')" == 1 ];then
su -mm -c umount -l "$PTC"
cp -rf $PTC "/data/tools/apk/$1.apk"
cp -rf "$PTC" "$APK/$1.apk"
else
[ -e "/data/tools/apk/$1.apk" ] || cp -rf "$PTC" "/data/tools/apk/$1.apk"
[ -e "/data/tools/apk/$1.apk" ] && cp -rf "/data/tools/apk/$1.apk" "$APK/$1.apk" || cp -rf "$PTC" "$APK/$1.apk"
fi
echo "$1" | tee "$APK/$1.txt" >&2
}

CPfile(){
Pathfw="$(find /*/framework /*/*/framework -type f -name "$1.jar" -not -path "*/data/*" | head -n1)"
[ -e "/data/tools/apk/$1.jar" ] || cp -rf $Pathfw "/data/tools/apk/$1.jar"
[ -e "/data/tools/apk/$1.jar" ] && cp -rf "/data/tools/apk/$1.jar" "$APK" || cp -rf "$Pathfw" "$APK"
echo "$Pathfw" | tee "$APK/$1.txt" >&2
}

# giải nén file
Giainen(){
for vapk in $APK/*.*; do
if [ "${vapk##*.}" == 'apk' ] || [ "${vapk##*.}" == 'jar' ];then
PTd="$(cat ${vapk%.*}.txt)"
[ -e "$vapk" ] && ui_print "  Giải nén: ${PTd##*/}" || abort "- Lỗi không tìm thấy file! ${PTd##*/}"
ui_print
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali d --api $API $vsmali -o ${vsmali%.*}
done
fi
sleep 2
done
}

Donggoi(){
# Đóng gói apk
for bapk in $APK/*.*; do
if [ "${bapk##*.}" == 'apk' ] || [ "${bapk##*.}" == 'jar' ];then
if [ -e "${bapk%.*}/class" ];then
PTb="$(cat ${bapk%.*}.txt)"
ui_print "  Đóng gói: ${PTb##*/}"
ui_print
for bsmali in $(cat ${bapk%.*}/class 2>/dev/null | sed "s|$APK/||g" | cut -d '/' -f2 | sort | uniq); do
rm -fr "$bsmali".dex
smali a --api $API ${bapk%.*}/$bsmali -o "${bapk%.*}/$bsmali".dex
done
cd ${bapk%.*}
zip -qr -0 $bapk '*.dex'
zipalign -f 4 $bapk $APK/tmp/${bapk##*/} 
cp -rf $APK/tmp/* $APK
else
rm -fr ${bapk%.*}*
fi
fi
sleep 5
done

for Capk in $APK/*.*; do
if [ "${Capk##*.}" == 'apk' ];then
Papkp="$(cat ${Capk%.*}.txt)"
if [ "$(pm path $Papkp | grep -cm1 '/data/')" == 1 ];then
mkdir -p $MODPATH/app
Ehehdb2="$(pm path $Papkp | cut -d : -f2)"
cp -rf $Capk "$MODPATH/app/$Papkp"
chcon u:object_r:apk_data_file:s0 "$MODPATH/app/$Papkp"
su -mm -c mount -o bind "$MODPATH/app/$Papkp" "$Ehehdb2"
killall $Papkp
echo 'rm -fr /data/tools/apk/'$Papkp.apk'' >> $TMPDIR/uninstall.sh
else
Ehehdb="$(pm path $Papkp | cut -d : -f2)"
if [ "$(unzip -l $Capk 2>/dev/null | grep -cm1 "lib/$ABI/")" == 1 ];then
mkdir -p $MODPATH${Ehehdb%/*}/lib/$ARCH
unzip -qo -j $Capk "lib/$ABI/*" -d $MODPATH${Ehehdb%/*}/lib/$ARCH
fi
mkdir -p "$MODPATH${Ehehdb%/*}"
cp -rf $Capk "$MODPATH$Ehehdb"
fi
fi
if [ "${Capk##*.}" == 'jar' ];then
Papkp="$(cat ${Capk%.*}.txt)"
echo 'rm -fr /data/tools/apk/'$Papkp.jar'' >> $TMPDIR/uninstall.sh
mkdir -p "$MODPATH${Papkp%/*}"
cp -rf $Capk "$MODPATH$Papkp"
fi
done
}

# Freeze
FREEZE(){
for TARGET in $1; do
mktouch $MODPATH$TARGET/.replace
done
}

GP () { grep_prop $1 $TMPDIR/module.prop; }

Setp () {
[ "$(grep -cm1 "$1=" $TMPDIR/system.prop)" == 1 ] && sed -i "/$1=/d" $TMPDIR/system.prop
echo "$1=$2" >> $TMPDIR/system.prop
}

API=$(getprop ro.build.version.sdk)
ABI=$(getprop ro.product.cpu.abi)

if [ "$ABI" = "x86" ]; then
export ARCH=x86
export ARMT=i686
elif [ "$ABI" = "arm64-v8a" ]; then
export ARCH=arm64
export ARMT=arm64
elif [ "$ABI" = "x86_64" ]; then
export ARCH=x64
export ARMT=x86-64
else
export ARMT=arm
export ARCH=arm
export ABI=armeabi-v7a
fi

TTM(){
for vah in $1; do
[ -e $vah ] || mkdir -p "$vah"
done
}

TTM "/data/tools/bin
$TMPDIR/Apk/tmp
/data/tools/ck
/data/tools/tmp
/data/tools/apk
/data/tools/lib/Tools"

unset vah
unset mklist

export PATH="/data/tools/bin:$PATH"
export HOME="/data/tools"
export APK="$TMPDIR/Apk"
[ "$API" -ge 31 ] && miuik='miui-'

print_modname(){

ui_print
ui_print "  $name: $(GP name) $(GP version) by $(GP author), $(getprop ro.product.device), $API, $ARCH"
ui_print
ui_print "  Tải dữ liệu..."
ui_print

Test123=true
Apilt="$(
[ "$(file /data/system/sync/accounts.xml | grep -c text)" == 1 ] && cp -rf /data/system/sync/accounts.xml $TMPDIR/1.xml || abx2xml /data/system/sync/accounts.xml $TMPDIR/1.xml;
grep -m1 "com.xiaomi" $TMPDIR/1.xml | tr ' ' '\n' | grep -m1 account | cut -d \" -f2)"
[ "$Apilt" ] || ui_print "  Error: Hãy đăng nhập để hiện id Xiaomi
"

imei="$(getprop persist.radio.meid)"
[ "$imei" ] || imei="$(getprop ro.ril.oem.meid)"
[ "$imei" ] || imei="$(grep -m1 key_meid_slot0 /data/*/0/com.android.phone/shared_prefs/com.android.phone_preferences.xml | cut -d '>' -f2 | cut -d '<' -f1)"
[ "$imei" ] || ui_print "  Error: Hãy ấn *#06# để hiện MEID
"

driver=$(getprop ro.product.device)

tkid=$Apilt
thoigian1="$(Xem "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Code/$driver/$(echo -n "$Apilt" | base32 -w0)")"
if [ "$(echo "$thoigian1" | grep -cm1 'HSD=')" != 1 ];then
thoigian1="$(Xem "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Code/$driver/$(echo -n "$imei" | base32 -w0)")"
tkid=$imei
fi

if [ "$(echo "$thoigian1" | grep -cm1 'HSD=')" == 1 ];then
Tgg1=$(echo "$thoigian1" | grep -m1 'HSD=' | cut -d = -f2)
Tvs1=$(echo "$thoigian1" | grep -m1 'Ver-Max=' | cut -d = -f2)
[ "${Tgg1//-/}" -ge "$(date +%Y%m%d)" ] && Pro=1
[ "${Tvs1//./}" -ge "$(GP versionCode)" ] && VsPro=1
Dtime=$Tgg1
DVs=$Tvs1
else
Dtime="$(date +%Y-%m)-$(echo $(( $(date +%d) + 1 ))) $(date +%H:%M)"
fi

Xan "Check: $tkid, $thoigian1, $Pro, $VsPro, $Tgg1, $Tvs1, $driver/$(echo -n "$imei" | base32 -w0)
"

if [ "$Pro" == 1 ] && [ "$VsPro" == 1 ];then

ui_print "  Chào bạn: $tkid"
ui_print
ui_print "  Thời hạn sử dụng tài khoản: $Dtime"
ui_print
ui_print "  Level: $DVs"
ui_print

rm -fr /data/tools/lib/run.sh
rm -fr /data/adb/service.d/VK.sh

elif [ "$Pro" == 1 ];then
ui_print "  Chào bạn: $tkid"
ui_print
ui_print "  Thời gian sử dụng: $Dtime"
ui_print
if [ "$(GP id)" == "VH-KE" ];then
abort "! Level của bạn không đủ để sử dụng module này!

  Ủng hộ có thể tăng level đó nha 

  Tài khoản Mi: $Apilt

  MEID: $imei
"
fi

rm -fr /data/tools/lib/run.sh
rm -fr /data/adb/service.d/VK.sh

elif [ -e /data/tools/lib/log.txt ];then
abort "! Bạn đã từng sử dụng dùng thử nghiệm 
  
  Mời bạn ủng hộ để tiếp tục sử dụng.

  Tài khoản Mi: $Apilt

  MEID: $imei
"
else

if [ "$(GP id)" == "VH-PT" ] || [ "$(GP id)" == "VH-KE" ];then
abort "! Chỉ có thể dùng thử Module

  Thêm Tiếng Việt VH-ZH và gói gapp VH-GA

  Tài khoản Mi: $Apilt

  MEID: $imei
"
fi
ui_print "! Thông báo ủng hộ nhà phát triển 

  Tên máy: $driver

  Tài khoản Mi: $Apilt
  
  MEID: $imei

  Sử dụng lâu dài bạn nên ủng hộ

  Bạn sẽ được trải nghiệm trong 24h

  Hết thời gian sẽ tự động reboot.
"
am start -a android.intent.action.VIEW -d "https://kakathic.github.io/ZH-VN/Support.html" >&2

## Check the system devices
[ "$ARCH" == "arm64" ] || abort "$error2
"

texk="'Cảm ơn bạn đã ủng hộ module Việt Nam bạn có thể tiếp tục sử dụng.'"
texk2="'Còn 1 tiếng nữa module Việt hóa sẽ hết thời gian sử dụng'"
echo '
while true; do
thoigianjd="$(date +%Y%m%d%H%M)"
thoigianhet="'$(date +%Y%m%d%H%M)'"

[ "$(( $thoigianjd - $thoigianhet ))" -ge "9900" ] && su -lp 2000 -c "cmd notification post $RANDOM '$texk2'"
if [ "$(( $thoigianjd - $thoigianhet ))" -ge "10000" ];then
echo > /data/adb/modules*/VH-*/remove
rm -fr /data/tools/lib/run.sh
rm -fr /data/adb/service.d/VK.sh
sleep 10
reboot
else
driver='$driver'
Apilt='$Apilt'
imei='$imei'

thoigian1="$(Xem "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Code/$driver/$(echo -n "$Apilt" | base32 -w0)")"
if [ "$(echo "$thoigian1" | grep -cm1 "HSD=")" != 1 ];then
thoigian1="$(Xem "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Code/$driver/$(echo -n "$imei" | base32 -w0)")"
fi

if [ "$(echo "$thoigian1" | grep -cm1 "HSD=")" == 1 ];then
Tgg1=$(echo "$thoigian1" | grep -m1 "HSD=" | cut -d = -f2)
Tvs1=$(echo "$thoigian1" | grep -m1 "Ver-Max=" | cut -d = -f2)
[ "${Tgg1//-/}" -ge "$(date +%Y%m%d)" ] && Pro=1
[ "${Tvs1//./}" -ge "$(GP versionCode)" ] && VsPro=1
Dtime=$Tgg1
DVs=$Tvs1
tkid=$Apilt
fi

if [ "$Pro" == 1 ] && [ "$VsPro" == 1 ];then
su -lp 2000 -c "cmd notification post $RANDOM '$texk'"
break
fi

sleep 3600
fi
done
' > /data/tools/lib/run.sh
echo '
echo > /data/tools/lib/log.txt
[ -e /data/tools/lib/run.sh ] && . /data/tools/lib/run.sh
[ -e $(echo /data/adb/modules/VH-ZH/system/product/overlay/Zz.android.apk) ] || rm -fr /data/adb/*/*/system/*/overlay/Zz.*.apk
rm -fr /data/tools/lib/run.sh
rm -fr /data/adb/service.d/VK.sh
' > /data/adb/service.d/VK.sh

chmod 777 /data/adb/service.d/VK.sh 
chmod 777 /data/tools/lib/run.sh
fi

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

}

