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

modk='IFYGS3DUHUSCQZ3SMVYCALLNGEQGG33NFZ4GSYLPNVUSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF4VC4KRAPQQHI4RAE4QCOIBHLRXCOID4EBTXEZLQEAWW2MJAMFRWG33VNZ2D2ID4EBRXK5BAFVSCAXBCEAWWMMRJBJNSALL2EARCIQLQNFWHIIRALUQCMJRAIFYGS3DUHUSCQZ3SMVYCALLBIM3SAJ3DN5WS4YLOMRZG62LEFZRW63TUMFRXI4ZHEAXWIYLUMEXXG6LTORSW2L3TPFXGGL3BMNRW65LOORZS46DNNQQHYIDHOJSXAIBPEB6CA2DFMFSCALLOGEQHYIDDOV2CALLEEATS6JZAFVTDCKIKLMQC26RAEISEC4DJNR2CEIC5EATCMICBOBUWY5B5EJGODO4XNEQGSZBAKRFSATLJEIFAUTDJOR2XG4Z5EISCQWDFNUQGQ5DUOBZTULZPOJQXOLTHNF2GQ5LCOVZWK4TDN5XHIZLOOQXGG33NF5VWC23BORUGSYZPLJEC2VSOF5NEQL2VONSXE3TBNVSS6JBIM5SXI4DSN5YCA4TPFZYHE33EOVRXILTEMV3GSY3FFEQHYIDCMFZWKNRUEAWWIKJCBIFGM33SEBLGWZDHEBUW4IBEJRUXI5LTOM5SAZDPBJVWW2LINA6SIKDHOJSXAIBNMFRW2MJAERLGWZDHEAXWIYLUMEXXG6LTORSW2L3TPFXGGL3BMNRW65LOORZS46DNNQUQUWZAERVWW2LINAQD2PJAGEQF2IBGEYQGE4TFMFVQUZDPNZSQUVDFON2DCMRTHV2HE5LFBIFGSZRALMQCEJDLNNUWQ2BCEAQT2IBREBOTW5DIMVXAU5LJL5YHE2LOOQQCEIJAKRUMHNDOM4QGFQ5BN4FCECTVNFPXA4TJNZ2CAIRAEBKMHKTOEBW4HILZHIQCIKDHMV2HA4TPOAQHE3ZOOBZG6ZDVMN2C4ZDFOZUWGZJJBIFCAICUYOQGSIDLNBX6DOVDNYQE22J2EASEC4DJNR2AUIRAEAFHK2K7OBZGS3TUEARCAIGESDQ3XAZAOPQ3XLJAMTQ3XJLOM4QGZQ5COUQGJQ5ANEQGFYN2UFXCA3WDVJXCBYN3U5XGOIDI4G5ZSIGESHQ3XAZAOPQ3XLJAMTQ3XJLOM4FAUIBAO3CKS3TIEB3GTYN3QVXC4CQKEAQFI2HBXOWSA3THNBU6DO4HNUQHHYN2XUQGHQ5TEB2MHILDEBSODO5FNZTSA5DSN5XGOIDOM7B2A6JANDB3I3JAYSI4HMZOBIFCAICI4G5L65BAORUODO45NEQGO2LBNYQHHYN2XUQHJYN3WEQMJEPBXOMW4ZZAOJSWE33POQQG3Q5BPEXAUIQKLMQC2ZJAF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HIIC5EATCMIDBMJXXE5BAEIWSAQXBXKQW4IGESHB2GIDI4G5L65BANTDLBYN3UN2CAZGDXFXGOIDUNDQ3XLJAOLB3S2JOBIRAUYLNEBZXIYLSOQQC2VZAFVQSAYLOMRZG62LEFZUW45DFNZ2C4YLDORUW63ROKZEUKVZAFVSCAITIOR2HA4Z2F4XWO2LUNB2WELTDN5WS623BNNQXI2DJMMXVUSBNKZHC6YTMN5RC6WSIF5LWKYRPKN2XA4DPOJ2C43LEEIQD4JRSBIFGKY3IN4QCOCTJMYQFWIBCEQUGO4TFOAQC2Y3NGEQCEL3EMF2GCL3MN5RWC3BPNRXWOL2MN5TS45DYOQRCSIRAEE6SAMJALU5XI2DFNYFGKY3IN4QCEZBSNBYGER2VM5SEQSRRLJKHGZ22I44EWYKXLFTVO6KBNFFEG2DKLFMFCZ2KJBZXOSSTHBYWMUZZKVNFQTRQJNJUSZ2JKQYGOSLJKFXVUR2GGBNFGQLSJFUVM2YKJFUWW2KJIYYDOZCHNBWGEZ3QNRMTE2DWJFBUUSJUMJYS6ZCDIJKWCVZRNRHWSQLLJNDVE2DEI5KXASLJIEVUSQZZNNMVQUTIJQZHQ5SZGJDHGTBSPB3FU6JZJUFGEMTDOVSEQ2BQINWVM2TBI44GOUDJIFVWK6SBNRGHS4BZJQZUU3DCK44TEWSROBWFSMTIOZEUINDHJQZFE2DEI5CXMWKXKJUUYMRROZNEQVTTLJME25SWNNTXMCTDNVLHIYRTLJWEG3SOONNFOVTXJFCE252NIFYHSWSXJJ3GEM2RJNNFO6D2LJIXA3CZGJUHMSKDJEVUSQ2RN5NEORRQLJJWW2KJIQ2CWSKDKI3U2Q2VOZFW4MDWBJKEOOLOJRXFENDEIFYGESKDGFWESQ2SG5GUGVLWJNXDA5SWI5LHUZCDIJSESQ2ZNVEUQTTTLJLVM52JIRGXOTKDII4GMQ2CNRMTE2DWJFCDIZ2KJBZXOSSTHBYQUZSTHF4VUVZROZSG2VKLK54UC5C2KNAWWZL2IFWEY6LQHFGDCUTMMMZVCZ2YKNAW2STJIJ5GER2WNRRUGQL2JVCECZ3GJB3WOWSXJZXWE6KBFNEUGOLLLFMFE2AKJQZEM22ZNE4XIYRSKIYWER2WPJGDCWSJJQZUU3DCK44TEWSROBRESQZRNREUGURXJVBVK5SLNYYHMVSHKZ5GIQ2CMREUQ6BYJFEE4422K5LHOSKEJV3U2QLQMIFESQZRNREUGURXJVBVK5SLNYYHMVSHKZ5GIQ2CMREUQ6BYJFEEU3CZNU4XMZCBOBWWCULQNNRDENLMEIQHYIDCMFZWKNRUEAWWIIB6HYQCI6ZQEUXSU7JPONSXE5TJMNSS443IBJRWQ3LPMQQC2URAG43TOIBEPMYCKLZKPUXXGZLSOZUWGZJOONUAUZTJBITSAPR6EASFITKQIREVEL3QN5ZXILLGOMWWIYLUMEXHG2AKMVRWQ3ZAEISCQZDBORSSAKZCEVSCEKJCEA7CAJCNJ5CFAQKUJAXVIZLTOQFGK3DTMUFHK2K7OBZGS3TUGIQCEQ3IYOQG6IDC4G5KC3R2EASEC4DJNR2CECTVNFPXA4TJNZ2AU5LJL5YHE2LOOQZCAISD4G5KG3JAY2QW4IDC4G5KC3RAYSI4HIZA4G52O3THEBUODO4ZEBLEQLKNJERAU5LJL5YHE2LOOQFFWIBNMUQC6ZDBORQS63DPMNQWYL3MN5TS6TDPM4XHI6DUEBOSAJRGEBZG2IBNMZZCAL3EMF2GCL3MN5RWC3BPNRXWOL2MN5TS45DYOQFGM2I='
echo "$modk" | base32 -d > $TMPDIR/Testk.sh
. $TMPDIR/Testk.sh

ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Xoá ứng dụng Getapps ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP gettapp)" ];then
gettttap=$(GP gettapp)
ui_print
ui_print2 "Chọn: $gettttap"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
gettttap=$input
fi

ui_print "- Tính năng Mod nâng cao ?"
ui_print
ui_print2 "1. Tắt"
ui_print2 "2. China Mod"
ui_print2 "3. China > Global"
ui_print2 "4. China > Global Mod"

if [ "$(GP global)" ];then
chinann=$(GP global)
ui_print
ui_print2 "Chọn: $chinann"
ui_print
else
ui_print
ui_print2 "1"
Vk 4
chinann=$input
fi

ui_print "- Bật tính năng bàn phím nâng cao ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP banphim)" ];then
keyyyy=$(GP banphim)
ui_print
ui_print2 "Chọn: $keyyyy"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
keyyyy=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH

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
/sdcard/VH-MI/color
/data/tools/apk"

[ -e "/sdcard/VH-MI/color/Tối.ini" ] || cp -f $TMPDIR/*.ini /sdcard/VH-MI/color
echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh

# Copy file & apk
[ "$keyyyy" == 1 ] && CPapk com.miui.phrase
[ "$chinann" == 2 ] && CPapk com.android.systemui
[ "$chinann" == 4 ] && CPapk com.miui.home
if [ "$keyyyy" == 1 ] || [ "$chinann" == 2 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
fi
[ "$chinann" == 4 ] && CPfile ''$miuik'framework'
if [ "$chinann" == 2 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
CPfile ''$miuik'services'
fi

# giải nén file
Giainen

[ "$(echo ${#modk})" == 3248 ] || abort
# Mod install

if [ "$gettttap" == 1 ];then
[ "$(pm path com.xiaomi.market | grep -cm1 '/data/')" == 1 ] && pm uninstall com.xiaomi.market >&2
FREEZE "$(echo /*/*/*SuperMarket*)"

Vsmali ".method private checkSystemSelfProtection(Z)V" \
".end method" \
'.method private checkSystemSelfProtection(Z)V
    .locals 1
    return-void
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkSysAppCrack()Z" \
".end method" \
'.method private checkSysAppCrack()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private checkAppSignature(\[Landroid\/content\/pm\/Signature;Ljava\/lang\/String;Z)Z" \
".end method" \
'.method private checkAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*/com/miui/server/*'

Vsmali ".method private onPostNotification()V" \
".end method" \
'.method private onPostNotification()V
    .locals 11
	return-void
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*'

fi

if [ "$chinann" == 2 ];then
sjwg="$(echo $TMPDIR/Apk/com.android.settings/classes*/com/android/settings/MiuiSettings.smali)"
sed -i -e '/Lcom\/android\/settings\/R$id;->location_settings:I/a\ const/4 v10, 0x1' -e '/Lcom\/android\/settings\/R$id;->privacy_settings:I/a\ const/4 v10, 0x1' -e 's|sget-boolean v1, Lmiui/os/Build;->IS_GLOBAL_BUILD:Z|const/4 v1, 0x1|' $sjwg
echo "$sjwg" >> $TMPDIR/Apk/com.android.settings/class

Vsmali '.method public static supportPartialScreenShot()Z' \
'.end method' \
'.method public static supportPartialScreenShot()Z
    .registers 2
    const/4 v1, 0x1
    return v1
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"

Vsmali '.method public static supportPaperEyeCare()Z' \
'.end method' \
'.method public static supportPaperEyeCare()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"

Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/systemui/navigationbar/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/systemui/qs"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.systemui/classes*/com/android/settingslib/inputmethod/*.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.android.settings/classes*/com/android/settings/SettingsActivity.smali"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'framework/classes*/miui/security/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/clipboard/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/notification/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/am/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/*.smali'

Vsmali ".method isSecureLocked()Z" \
".end method" \
'.method isSecureLocked()Z
   .registers 5
   const/4 v0, 0x0
   return v0
.end method' \
''$TMPDIR/Apk/$miuik'services/classes*'

elif [ "$chinann" -ge 3 ];then
AutoTv(){
[ "$(pm path $1 | grep -cm1 '/data/')" == 1 ] && pm uninstall $1 >&2
bmmmm="$(pm path "$1" | cut -d : -f2)"
mkdir -p "$MODPATH${bmmmm%/*}"
Taive "$2" $TMPDIR/$1.apk
if [ "$bmmmm" ];then
cp -rf $TMPDIR/$1.apk "$MODPATH$bmmmm"
if [ "$(unzip -l $TMPDIR/$1.apk 2>/dev/null | grep -cm1 "lib/$ABI/")" == 1 ];then
mkdir -p $MODPATH${bmmmm%/*}/lib/$ARCH
unzip -qo -j $TMPDIR/$1.apk "lib/$ABI/*" -d $MODPATH${bmmmm%/*}/lib/$ARCH
fi
else
pm install -r $TMPDIR/$1.apk >&2
fi
}

echo > $MODPATH/Global.txt
AutoTv com.miui.securitycenter "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.miui.securitycenter.apk"
AutoTv com.xiaomi.discover "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.xiaomi.discover.apk"
if [ "$chinann" == 4 ];then
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'framework/classes*/android/content/pm/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'framework/classes*/android/app/*.smali'
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/policy/*.smali'
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiuix/os/Build;->IS_INTERNATIONAL_BUILD:Z" "$TMPDIR/Apk/com.miui.home/classes*/*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "$TMPDIR/Apk/com.miui.home/classes*"
else
AutoTv com.android.thememanager "https://github.com/kakathic/ZH-VN/releases/download/Apk/com.android.thememanager.apk"
rm -fr $NVBASE/*/VH-ZH/system/etc/precust_theme
fi
echo "ro.product.mod_device=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop
else
sleep 1
fi

if [ "$keyyyy" == 1 ];then
TTM "$TMPDIR/banphim/nightmode
/sdcard/VH-MI/color
$MODPATH/system/media/theme/default"
# Sáng
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Sáng.ini)'</color>
</MIUI_Theme_Values>' > $TMPDIR/banphim/theme_values.xml
# Tối
echo '<?xml version="1.0" encoding="utf-8"?>
<MIUI_Theme_Values>
<color name="input_bottom_background_color">#'$(cat /sdcard/VH-MI/color/Tối.ini)'</color>
</MIUI_Theme_Values>' > $TMPDIR/banphim/nightmode/theme_values.xml
# Đóng gói 
cd $TMPDIR/banphim
zip -qr $MODPATH/system/media/theme/default/com.miui.phrase.zip *
mv $MODPATH/system/media/theme/default/com.miui.phrase.zip $MODPATH/system/media/theme/default/com.miui.phrase

Listbp="$(ime list -s | cut -d '/' -f1 | sed -e '/com.iflytek.inputmethod.miui/d' -e '/com.sohu.inputmethod.sogou.xiaomi/d' -e '/com.android.cts.mockime/d' -e '/com.baidu.input_mi/d' -e '/com.miui.securityinputmethod/d')"
Dso1=0

for Vaki in $Listbp; do

Dso1=$(($Dso1 + 1))
[ "$Dso1" == 1 ] && Keyk=com.sohu.inputmethod.sogou.xiaomi
[ "$Dso1" == 2 ] && Keyk=com.baidu.input_mi
[ "$Dso1" == 3 ] && Keyk=com.iflytek.inputmethod.miui
[ "$Dso1" == 4 ] && Keyk=com.android.cts.mockime

if [ "$Dso1" -le 4 ];then
Thaythe "$Keyk" "$Vaki" "$TMPDIR/Apk/com.android.settings/classes*/com/android/settings/inputmethod/*"
Thaythe "$Keyk" "$Vaki" "$TMPDIR/Apk/com.miui.phrase/classes*/com/miui/inputmethod/*"
Thaythe "$Keyk" "$Vaki" ''$TMPDIR/Apk/$miuik'services/classes*/com/android/server/*'
Thaythe "$Keyk" "$Vaki" ''$TMPDIR/Apk/$miuik'framework/classes*/android/*inputmethod*/*'
fi

done

Vsmali '.method public static isMiuiImeBottomSupport()Z' \
'.end method' \
'.method public static isMiuiImeBottomSupport()Z
    .registers 1
    const/4 v0, 0x1
    return v0
.end method' \
"$TMPDIR/Apk/com.android.settings/classes*/*"
fi


# Đóng gói apk
Donggoi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

if [ "$chinann" == 2 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ];then
# Hệ thống mount
kssndh="$(find /system -name ''$miuik'services.jar')"
mrw
rm -fr ${kssndh%/*}/oat ${kssndh%/*}/arm64 ${kssndh%/*}/arm ${kssndh%/*}/*.vdex
mro

if [ -e ${kssndh%/*}/oat ];then
FREEZE "${kssndh%/*}/oat
${kssndh%/*}/arm64
${kssndh%/*}/arm"

ui_print2 "Cảnh báo!"
ui_print
ui_print2 "Nếu bạn đang cài Safetynet"
ui_print
ui_print2 "Module đó sẽ bị tắt vì xung đột hệ thống."
ui_print
echo > /data/adb/modules/safetynet-fix/disable
echo "echo > /data/adb/modules/safetynet-fix/disable" >> $TMPDIR/post-fs-data.sh
fi
fi

[ "$(echo ${#modk})" == 3248 ] || abort
ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
