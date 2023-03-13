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

ui_print(){ echo "$1"; sleep 0.005; }
ui_print2(){ echo "  $1"; }
Xan(){ echo "  $1" >&2; }
BatdauT=$(date +%s);

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
Timkiem(){ find $2 -name "*.smali" -exec grep -Rl "${1//\//\\\/}" {} +; }

Thaythe(){
ui_print2 "MOD: $RANDOM -> $RANDOM";
Xan "MOD THAYTHE: $1 -> $2";
for Ttcfg in $(Timkiem "$1" "$3"); do
[ -e "$Ttcfg" ] && sed -i "s|${1//\//\\\/}|${2//\//\\\/}|g" $Ttcfg || Xan "- Lỗi: $1";
[ -e "$Ttcfg" ] && echo "$Ttcfg" 2>/dev/null >> "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
[ -e "$Ttcfg" ] && Xan "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
done
}

Chose(){
for skd in $(Timkiem "$1" "$4"); do
[ -e $skd ] && ndbdhd=$(grep -A3 "$1" $skd | grep -m1 "$2" | awk '{print $2}')
[ -e $skd ] && ui_print2 "MOD: $RANDOM";
[ -e $skd ] && Xan "MOD CHOSE: $1" || Xan "- Lỗi: $(echo "$1" | sed 's|\\||g')";
[ -e $skd ] && sed -i -e "/${1//\//\\\/}/,/${2//\//\\\/}/c const/4 $ndbdhd, $3" "$skd";
[ -e $skd ] && echo "$skd" 2>/dev/null >> "$APK/$(echo "$4" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
[ -e $skd ] && Xan "$APK/$(echo "$4" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
done
}

Autoone(){
ui_print2 "MOD: $RANDOM -> $RANDOM";
Xan "MOD AUTOONE: $1 -> $2";
for vakkddhh in $(find $3 -name "*.smali" -exec grep -l "..., $1" {} +); do
Xan "SHOW: sed -i $(grep "..., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') $(echo "$vakkddhh" | sed 's|\$|\\\$|g')"
echo "sed -i $(grep "..., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') $(echo "$vakkddhh" | sed 's|\$|\\\$|g')" | sh
echo "$vakkddhh" 2>/dev/null >> "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
Xan "$APK/$(echo "$3" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
done
}

Vsmali(){
for Vka in $(Timkiem "$1" "$4"); do
[ -e $Vka ] && ui_print2 "MOD: $RANDOM";
[ -e $Vka ] && Xan "MOD VSMALI: $1" || Xan "- Lỗi: $(echo "$1" | sed 's|\\||g')";
[ -e $Vka ] && sed -i -e "/^${1//\//\\\/}/,/${2//\//\\\/}/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka";
[ -e $Vka ] && echo "$Vka" 2>/dev/null >> "$APK/$(echo "$4" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
[ -e $Vka ] && Xan "$APK/$(echo "$4" | sed "s|$APK/||g" | cut -d '/' -f1)/class";
done
}

CPapk(){
PTC="$(pm path "$1" | cut -d : -f2)"
if [ "$(echo "$PTC" | grep -cm1 '/data/')" == 1 ];then
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
Ehehdb2="$(pm path $Papkp | cut -d : -f2)"
if [ "$(echo "$Ehehdb2" | grep -cm1 '/data/')" == 1 ];then
mkdir -p $MODPATH/app
cp -rf $Capk "$MODPATH/app/$Papkp"
echo "$Ehehdb2" > "$MODPATH/app/$Papkp.txt"
chcon u:object_r:apk_data_file:s0 "$MODPATH/app/$Papkp"
else
mkdir -p $MODPATH/sys_app
cp -rf $Capk "$MODPATH/sys_app/$Papkp"
echo "$Ehehdb2" > "$MODPATH/sys_app/$Papkp.txt"
chcon u:object_r:apk_data_file:s0 "$MODPATH/sys_app/$Papkp"
fi
echo 'rm -fr /data/tools/apk/'$Papkp.apk'' >> $TMPDIR/uninstall.sh
fi

if [ "${Capk##*.}" == 'jar' ];then
Papkp="$(cat ${Capk%.*}.txt)"
echo 'rm -fr /data/tools/apk/'$Papkp.jar'' >> $TMPDIR/uninstall.sh
mkdir -p $MODPATH/framework
Ehehdb2="${Papkp##*/}"
cp -rf $Capk "$MODPATH/framework/${Ehehdb2%.*}"
echo "$Papkp" > "$MODPATH/framework/${Ehehdb2%.*}.txt"
fi
done
}

# Freeze
FREEZE(){
for TARGET in $1; do
mktouch $MODPATH$TARGET/.replace
done
}

Setp () {
[ "$(grep -cm1 "$1=" $TMPDIR/system.prop)" == 1 ] && sed -i "/$1=/d" $TMPDIR/system.prop
echo "$1=$2" >> $TMPDIR/system.prop
}

mkdir -p $TMPDIR/Apk/tmp /data/tools/apk /data/tools/lib/Tools
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

Xan "Check: $tkid, $thoigian1, $Pro, $VsPro, $Tgg1, $Tvs1, $driver/$(echo -n "$imei" | base32 -w0)"

if [ "$Pro" == 1 ] && [ "$VsPro" == 1 ];then

ui_print "  Chào: $tkid, HSD: $Dtime"
ui_print
ui_print "  Level: $DVs"
ui_print

rm -fr /data/tools/lib/run.sh
rm -fr /data/adb/service.d/VK.sh

elif [ "$Pro" == 1 ];then
ui_print "  Chào: $tkid, Level: $DVs, HSD: $Dtime"
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
am start -a android.intent.action.VIEW -d "https://kakathic.github.io/ZH-VN/Support.html" >&2
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

  Bạn sẽ được trải nghiệm 72h

  Hết thời gian sẽ tự động khởi động lại máy.
"
am start -a android.intent.action.VIEW -d "https://kakathic.github.io/ZH-VN/Support.html" >&2

## Check the system devices
[ "$ARCH" == "arm64" ] || abort "$error2
"

texk="'Cảm ơn bạn đã ủng hộ module Việt Nam bạn có thể tiếp tục sử dụng.'"
texk2="'Còn 1 tiếng nữa module Việt hóa sẽ hết thời gian sử dụng, hãy ủng hộ để tiếp tục sử dụng module'"
echo '
while true; do
thoigianjd="$(date +%Y%m%d%H%M)"
thoigianhet="'$(date +%Y%m%d%H%M)'"

[ "$(( $thoigianjd - $thoigianhet ))" -ge "19900" ] && su -lp 2000 -c "cmd notification post $RANDOM '$texk2'"
[ "$(( $thoigianjd - $thoigianhet ))" -ge "19900" ] && am start -a android.intent.action.VIEW -d "https://kakathic.github.io/ZH-VN/Support.html" >&2

if [ "$(( $thoigianjd - $thoigianhet ))" -ge "20000" ];then
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

sleep 3000
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

}

