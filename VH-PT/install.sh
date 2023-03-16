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
chmod 777 $TMPDIR/Loading.sh && $TMPDIR/Loading.sh; . $TMPDIR/1.sh

## Start the installation
on_install(){

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
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

if [ "$(GP modbm2)" ];then
ui_print "- Mod ứng dụng bảo mật tiện hơn ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

baomat=$(GP modbm)
ui_print
ui_print2 "Chọn: $baomat"
ui_print
#else

ui_print
ui_print2 "1"
Vk 2
baomat=$input
fi

ui_print "- Hiện aqi app thời tiết ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP mglobal)" ];then
ttiet=$(GP mglobal)
ui_print
ui_print2 "Chọn: $ttiet"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
ttiet=$input
fi


if [ "$(GP TKpin2)" ];then
ui_print "- Mod ứng dụng Tiết kiệm pin ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

tietkiem=$(GP TKpin)
ui_print
ui_print2 "Chọn: $tietkiem"
ui_print
#else
ui_print
ui_print2 "1"
Vk 2
tietkiem=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
Setp ro.product.vip "$(getprop ro.product.device)_global"

## code
Xu_install jre static
Xu_install smali 2.3.4
Xu_install baksmali 2.3.4
Xu_install zipalign static
Xu_install zip static
Xu_install toybox static

sed(){ toybox sed "$@"; }
grep(){ toybox grep "$@"; }
cut(){ toybox cut "$@"; }
find(){ toybox find "$@"; }
mkdir -p $APK/tmp /data/tools/apk
evol "WyAiJFRlc⁰QxMjMiID⁵³IHRydWUgXSB⁴fCBhYm³ydAo="
# Copy file apk
[ "$Teme" == 1 ] && CPapk com.android.thememanager
[ "$apkcai" == 1 ] && CPapk com.miui.packageinstaller
[ "$baomat" == 1 ] && CPapk com.miui.securitycenter

if [ "$ttiet" == 1 ];then
for vakkksk in $(echo "$(GP lit)" | tr ',' '\n'); do
CPapk $vakkksk
done
fi

ui_print2 "Giải nén apk"
ui_print
# giải nén file
Giainen
ui_print2 "Chỉnh sửa apk"
ui_print

# Mod apk
evol "aWYgWyAiJHR⁵aWV⁵IiA³PSAxIF⁵¹dGhlbgpmb⁰IgdmFra⁶tzayBpbiAkKGVjaG⁴gIiQoR⁸AgbGl⁵KSIgfCB⁵ciAnLCcgJ⁸xuJyk¹IGRvCkNQYXBrICR⁶YWtra⁰NrCmRvbmUKZmkKCnVpX⁰ByaW⁷⁵MiAiR⁶nhuqNpIG¹DqW⁹gYXBrIgp⁸aV³wcmludAojIGdp⁹bqjaSBuw²luIGZpbGUKR⁶lhaW⁷lbgp⁸aV³wcmludDIgIkNo⁹buJbmggc+G¹rWEgYXBrIgp⁸aV³wcmludAojIE⁸vZCB⁵aGVtZQoKaWYgWyAiJHR⁵aWV⁵IiA³PSAxIF⁵¹dGhlbgpmb⁰IganVzamRubmQgaW⁹gJChHUCBsaXQpOyBkbwppZiBbICIkanVzamRubmQiID⁵³ICJjb⁶⁵ubWl⁸aS⁷⁰ZWF⁵aGVyMiIgXTt⁵aGVuCkF⁸dG³vbmUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiMHgxIiAkKFRpbWtpZW⁵gd⁶VhdGhlcmFwaS⁷tYXJrZXQueGlhb⁶⁸pLmNvbSAkQVBLLyRqdXNqZG⁷uZC³jbGFzc⁶VzKikKZWxzZQpBdXRvb⁶⁷lICJMbWl⁸aS³vcy³CdWlsZDstPklTX⁵lOVEVSTkFUSU³OQUxfQlVJTEQ²WiIgIjB⁹MSIgIiRBUEsvJGp⁸c⁶pkbm⁷kL⁶NsYXNzZXMqIgpUaGF⁷dGhlICJyby⁷taXVpLnJlZ⁶lvbiIgInJvLmtodS⁷⁶dWMiICIkQVBLLyRqdXNqZG⁷uZC³jbGFzc⁶VzKiIKVGhheXRoZSAicm⁴ucHJvZHVjdC⁷tb⁶RfZGV⁶aWNlIiAicm⁴ucHJvZHVjdC⁷⁶aXAiICIkQVBLLyRqdXNqZG⁷uZC³jbGFzc⁶VzKiIKZmkKZG³uZQpmaQoKaWYgWyAiJGFwa⁶NhaSIgPT⁵gMSBdO⁰RoZW⁹KVkI³ImlnZXQgcDAsIHAwLCBMYW⁷kcm³pZC³jb⁶⁷⁵ZW⁷⁵L⁰BtL⁵FwcGxpY⁶F⁵aW³uSW⁷mbzstPnVpZDpJIgpkanVkaGJyaD⁵iJChUaW⁸raWVtICIkVkIiICRBUEsvY⁶³tLm⁸pdWkucGFja⁶FnZWluc⁰RhbGxlci³jbGFzc⁶VzKikiCmZvciB⁶YWRnZiBpbiAkZGp⁸ZGhicmg¹IGRvCmhzYmRoZD⁵iJChncmVwIC⁸COSAtbiAiJFZCIiAiJHZhZGdmIiB⁴IGdyZXAgLW⁵xICdjb⁶⁷zdC⁴⁵IC⁹uLCAweDEnIHwgY⁰V⁵IC⁸kICctJyAtZjEpIgpoc⁶JkZ⁶doaGhkPSIkKGdyZXAgLUExNSAiJFZCIiAiJHZhZGdmIiB⁴IGdyZXAgLW⁵xICdyZXR⁸cm⁹nKSIKaHNiZD⁵iJChncmVwIC⁸COSAiJFZCIiAiJHZhZGdmIiB⁴IGdyZXAgLW⁵xICdjb⁶⁷zdC⁴⁵IC⁹uLCAweDEnKSIKc⁶VkIC⁸pICIkaHNiZGhkImNcICIkaHNiZCBcbiAkaHNiZGdnaGhoZCIgIiR⁶YWRnZiIKdWlfcHJpbnQyICJNT⁵Q²ICRSQU⁷ET⁵⁵iCmVjaG⁴gIiR⁶YWRnZiIgPj⁹gIiRBUEsvY⁶³tLm⁸pdWkucGFja⁶FnZWluc⁰RhbGxlci³jbGFzcyIKZG³uZQpmaQoKaWYgWyAiJFRlbWUiID⁵³IDEgXTt⁵aGVuClZzbWFsaSAiLm⁸ldGhvZCBwdWJsaWMgaXNWaWRlb⁵FkKClaIiBcCiIuZW⁷kIG⁸ldGhvZCIgXAonLm⁸ldGhvZCBwdWJsaWMgaXNWaWRlb⁵FkKClaCiAgICAucmVnaXN⁵ZXJzIDIKICAgIGNvbnN⁵LzQgdjAsIDB⁹MAogICAgcmV⁵dXJuIHYwCi⁷lbmQgbWV⁵aG³kJyBcCiIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnRoZW⁸lbWFuYWdlci³jbGFzc⁶VzKiIKClZzbWFsaSAiLm⁸ldGhvZCBwcml⁶YXRlIHN⁵YXRpYyBpc⁵FkVmFsaWQiIFwKIi⁷lbmQgbWV⁵aG³kIiBcCicubWV⁵aG³kIHByaXZhdGUgc⁰RhdGljIGlzQWRWYWxpZChMY⁶³tL⁶FuZHJvaWQvdGhlbWVtYW⁷hZ⁶VyL⁶Jhc⁶Vtb⁶R⁸bGUvYWQvbW³kZWwvQWRJbmZvOylaCiAgICAucmVnaXN⁵ZXJzIDIKICAgIGNvbnN⁵LzQgcDAsIDB⁹MAogICAgcmV⁵dXJuIHAwCi⁷lbmQgbWV⁵aG³kJyBcCiIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnRoZW⁸lbWFuYWdlci³jbGFzc⁶VzKiIKClRoYXl⁵aGUgImlnZXQtYm³vbGVhbiB⁶MSwgdjAsIExjb⁶⁵vYW⁷kcm³pZC³⁵aGVtZW⁸hbmFnZXIvZGV⁵YWlsL⁰RoZW⁸lL⁶⁸vZGVsL⁵³ubGluZVJlc⁶³⁸cmNlRGV⁵YWlsOy⁵+Ym³⁸Z⁶h⁵OloiICJpZ⁶V⁵LWJvb⁶xlYW⁹gdjEsIHYwLCBMY⁶³tL⁶FuZHJvaWQvdGhlbWVtYW⁷hZ⁶VyL⁶RldGFpbC³⁵aGVtZS³tb⁶RlbC³PbmxpbmVSZXNvdXJjZURldGFpbDstPmJvdWdodDpaIFxuIGNvbnN⁵LzQgdjAsIDB⁹MSBcbiByZXR⁸cm⁹gdjAiICIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnRoZW⁸lbWFuYWdlci³jbGFzc⁶VzKiIKClRoYXl⁵aGUgIkRSTV³FUlJPUl³VTktOT⁸dOIiAiRFJNX⁸NVQ⁵NFU⁸MiICIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnRoZW⁸lbWFuYWdlci³jbGFzc⁶VzKiIKZmkK"

ui_print
ui_print2 "Đóng gói apk"
ui_print
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
