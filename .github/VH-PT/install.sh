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
echo "ro.product.vip=$(getprop ro.product.device)_global" >> $MODPATH/system.prop

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

[ "$(echo ${#modk})" == 3248 ] || abort
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
Thaythe "$VB" "$VB \n const/4 v1, 0x1 \n return v1" "$(Timkiem "$VB" "com.miui.packageinstaller" "classes*")"
fi

if [ "$tietkiem" == 1 ];then
pm clear com.miui.powerkeeper >&2
Listbm="com/miui/powerkeeper/customerpower
com/miui/powerkeeper/feedbackcontrol
com/miui/powerkeeper/powerchecker
com/miui/powerkeeper/statemachine
com/miui/powerkeeper/ai
com/miui/powerkeeper/bucket
com/miui/powerkeeper/cloudcontrol
com/miui/powerkeeper/millet
com/miui/powerkeeper/ui
com/miui/powerkeeper/utils"

for vhjs in $Listbm; do
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/$vhjs/*.smali"
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

for vkks in $Listbm; do
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/$vkks/*.smali"
done

Autoone "Lmiui/os/Build;->IS_STABLE_VERSION:Z" "0x1" "$TMPDIR/Apk/com.miui.securitycenter/classes*/com/miui/permcenter/x/*.smali"
fi

# Đóng gói apk
Donggoi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

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
