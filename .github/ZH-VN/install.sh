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

[ "$API" -ge 31 ] && miuik='miui-'
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
## code

modk='IFYGS3DUHUSCQZ3SMVYCALLNGEQGG33NFZ4GSYLPNVUSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF4VC4KRAPQQHI4RAE4QCOIBHLRXCOID4EBTXEZLQEAWW2MJAMFRWG33VNZ2D2ID4EBRXK5BAFVSCAXBCEAWWMMRJBJNSALL2EARCIQLQNFWHIIRALUQCMJRAIFYGS3DUHUSCQZ3SMVYCALLBIM3SAJ3DN5WS4YLOMRZG62LEFZRW63TUMFRXI4ZHEAXWIYLUMEXXG6LTORSW2L3TPFXGGL3BMNRW65LOORZS46DNNQQHYIDHOJSXAIBPEB6CA2DFMFSCALLOGEQHYIDDOV2CALLEEATS6JZAFVTDCKIKLMQC26RAEISEC4DJNR2CEIC5EATCMICBOBUWY5B5EJGODO4XNEQGSZBAKRFSATLJEIFAUTDJOR2XG4Z5EISCQWDFNUQGQ5DUOBZTULZPOJQXOLTHNF2GQ5LCOVZWK4TDN5XHIZLOOQXGG33NF5VWC23BORUGSYZPLJEC2VSOF5NEQL2VONSXE3TBNVSS6JBIM5SXI4DSN5YCA4TPFZYHE33EOVRXILTEMV3GSY3FFEQHYIDCMFZWKNRUEAWWIKJCBIFGM33SEBLGWZDHEBUW4IBEJRUXI5LTOM5SAZDPBJVWW2LINA6SIKDHOJSXAIBNMFRW2MJAERLGWZDHEAXWIYLUMEXXG6LTORSW2L3TPFXGGL3BMNRW65LOORZS46DNNQUQUWZAERVWW2LINAQD2PJAGEQF2IBGEYQGE4TFMFVQUZDPNZSQUVDFON2DCMRTHV2HE5LFBIFGSZRALMQCEJDLNNUWQ2BCEAQT2IBREBOTW5DIMVXAU5LJL5YHE2LOOQQCEIJAKRUMHNDOM4QGFQ5BN4FCECTVNFPXA4TJNZ2CAIRAEBKMHKTOEBW4HILZHIQCIKDHMV2HA4TPOAQHE3ZOOBZG6ZDVMN2C4ZDFOZUWGZJJBIFCAICUYOQGSIDLNBX6DOVDNYQE22J2EASEC4DJNR2AUIRAEAFHK2K7OBZGS3TUEARCAIGESDQ3XAZAOPQ3XLJAMTQ3XJLOM4QGZQ5COUQGJQ5ANEQGFYN2UFXCA3WDVJXCBYN3U5XGOIDI4G5ZSIGESHQ3XAZAOPQ3XLJAMTQ3XJLOM4FAUIBAO3CKS3TIEB3GTYN3QVXC4CQKEAQFI2HBXOWSA3THNBU6DO4HNUQHHYN2XUQGHQ5TEB2MHILDEBSODO5FNZTSA5DSN5XGOIDOM7B2A6JANDB3I3JAYSI4HMZOBIFCAICI4G5L65BAORUODO45NEQGO2LBNYQHHYN2XUQHJYN3WEQMJEPBXOMW4ZZAOJSWE33POQQG3Q5BPEXAUIQKLMQC2ZJAF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HIIC5EATCMIDBMJXXE5BAEIWSAQXBXKQW4IGESHB2GIDI4G5L65BANTDLBYN3UN2CAZGDXFXGOIDUNDQ3XLJAOLB3S2JOBIRAUYLNEBZXIYLSOQQC2VZAFVQSAYLOMRZG62LEFZUW45DFNZ2C4YLDORUW63ROKZEUKVZAFVSCAITIOR2HA4Z2F4XWO2LUNB2WELTDN5WS623BNNQXI2DJMMXVUSBNKZHC6YTMN5RC6WSIF5LWKYRPKN2XA4DPOJ2C43LEEIQD4JRSBIFGKY3IN4QCOCTJMYQFWIBCEQUGO4TFOAQC2Y3NGEQCEL3EMF2GCL3MN5RWC3BPNRXWOL2MN5TS45DYOQRCSIRAEE6SAMJALU5XI2DFNYFGKY3IN4QCEZBSNBYGER2VM5SEQSRRLJKHGZ22I44EWYKXLFTVO6KBNFFEG2DKLFMFCZ2KJBZXOSSTHBYWMUZZKVNFQTRQJNJUSZ2JKQYGOSLJKFXVUR2GGBNFGQLSJFUVM2YKJFUWW2KJIYYDOZCHNBWGEZ3QNRMTE2DWJFBUUSJUMJYS6ZCDIJKWCVZRNRHWSQLLJNDVE2DEI5KXASLJIEVUSQZZNNMVQUTIJQZHQ5SZGJDHGTBSPB3FU6JZJUFGEMTDOVSEQ2BQINWVM2TBI44GOUDJIFVWK6SBNRGHS4BZJQZUU3DCK44TEWSROBWFSMTIOZEUINDHJQZFE2DEI5CXMWKXKJUUYMRROZNEQVTTLJME25SWNNTXMCTDNVLHIYRTLJWEG3SOONNFOVTXJFCE252NIFYHSWSXJJ3GEM2RJNNFO6D2LJIXA3CZGJUHMSKDJEVUSQ2RN5NEORRQLJJWW2KJIQ2CWSKDKI3U2Q2VOZFW4MDWBJKEOOLOJRXFENDEIFYGESKDGFWESQ2SG5GUGVLWJNXDA5SWI5LHUZCDIJSESQ2ZNVEUQTTTLJLVM52JIRGXOTKDII4GMQ2CNRMTE2DWJFCDIZ2KJBZXOSSTHBYQUZSTHF4VUVZROZSG2VKLK54UC5C2KNAWWZL2IFWEY6LQHFGDCUTMMMZVCZ2YKNAW2STJIJ5GER2WNRRUGQL2JVCECZ3GJB3WOWSXJZXWE6KBFNEUGOLLLFMFE2AKJQZEM22ZNE4XIYRSKIYWER2WPJGDCWSJJQZUU3DCK44TEWSROBRESQZRNREUGURXJVBVK5SLNYYHMVSHKZ5GIQ2CMREUQ6BYJFEE4422K5LHOSKEJV3U2QLQMIFESQZRNREUGURXJVBVK5SLNYYHMVSHKZ5GIQ2CMREUQ6BYJFEEU3CZNU4XMZCBOBWWCULQNNRDENLMEIQHYIDCMFZWKNRUEAWWIIB6HYQCI6ZQEUXSU7JPONSXE5TJMNSS443IBJRWQ3LPMQQC2URAG43TOIBEPMYCKLZKPUXXGZLSOZUWGZJOONUAUZTJBITSAPR6EASFITKQIREVEL3QN5ZXILLGOMWWIYLUMEXHG2AKMVRWQ3ZAEISCQZDBORSSAKZCEVSCEKJCEA7CAJCNJ5CFAQKUJAXVIZLTOQFGK3DTMUFHK2K7OBZGS3TUGIQCEQ3IYOQG6IDC4G5KC3R2EASEC4DJNR2CECTVNFPXA4TJNZ2AU5LJL5YHE2LOOQZCAISD4G5KG3JAY2QW4IDC4G5KC3RAYSI4HIZA4G52O3THEBUODO4ZEBLEQLKNJERAU5LJL5YHE2LOOQFFWIBNMUQC6ZDBORQS63DPMNQWYL3MN5TS6TDPM4XHI6DUEBOSAJRGEBZG2IBNMZZCAL3EMF2GCL3MN5RWC3BPNRXWOL2MN5TS45DYOQFGM2I='
echo "$modk" | base32 -d > $TMPDIR/Testk.sh
. $TMPDIR/Testk.sh

ui_print "! Sử dụng phím âm lượng"
ui_print "! Vol- = Chọn số hiện tại, Vol+ = Chuyển đổi số."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Thêm ngôn ngữ Tiếng Việt vào Rom ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP VH)" ];then
VHI=$(GP VH)
ui_print
ui_print2 "Chọn: $VHI"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
VHI=$input
fi

if [ "$VHI" == 1 ];then
ui_print "- Thêm lịch âm ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP Licham2)" ];then
Licham=$(GP Licham2)
ui_print
ui_print2 "Chọn: $Licham"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Licham=$input
fi
fi

ui_print "- Sử dụng Font chữ Việt hóa ?"
ui_print
ui_print2 "1. Tắt"
ui_print2 "2. Font IOS"
ui_print2 "3. File"

if [ "$(GP fontchu)" ];then
fontvh=$(GP fontchu)
ui_print
ui_print2 "Chọn: $fontvh"
ui_print
else
ui_print
ui_print2 "1"
Vk 3
fontvh=$input
fi

echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh
[ -e /system/product/overlay ] && Overlay=/system/product/overlay || Overlay=/system/vendor/overlay
VHMI=/sdcard/VH-MI

# Tạo thư mục
TTM "$MODPATH/system/media/theme/default
$VHMI/fonts
$TMPDIR/apk
$TMPDIR/Apk/tmp
$MODPATH$Overlay
"
## Unzip system
ui_print2 "$unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/MIUI
unzip -qo "$ZIPFILE" "theme/*" -d /sdcard/Android/data/com.android.thememanager/files/MIUI

Xu_install 7za
Xu_install jq

$Test123 || abort
if [ "$VHI" == 1 ];then
# Cài đặt ngôn ngữ
settings put system system_locales $(GP Linknn)
ui_print2 "Ngôn ngữ: $(GP LinkTn)"
ui_print
ui_print2 "Code: $(GP Linknn)"
ui_print
ui_print2 "Đang VH"
ui_print
Taive "https://github.com/kakathic/ZH-TT/releases/download/HH/TT.Zip" "$TMPDIR/TT.Zip"
[ -e "$TMPDIR/TT.Zip" ] || abort "- Lỗi tải TT.Zip thất bại !
"
7za x -tzip -y "$TMPDIR/TT.Zip" -p2 -o$TMPDIR >&2
if [ "$Licham" != 1 ];then
cp -rf $TMPDIR/notamlich/*.apk $TMPDIR/apk
cp -rf $TMPDIR/notamlich/framework-miui-res $TMPDIR
fi
[ -e $TMPDIR/framework-miui-res ] && cp -f $TMPDIR/framework-miui-res $MODPATH/system/media/theme/default
if [ -e "$VHMI/XList.md" ];then
for vahdbff in $(cat "$VHMI/XList.md"); do
cp -f "$TMPDIR/apk/Zz.$vahdbff.apk" $MODPATH$Overlay
done
else
cp -f $TMPDIR/apk/* $MODPATH$Overlay
fi
ui_print2 "Tổng: $(find $MODPATH$Overlay/*.apk | grep -c '\.apk') ứng dụng"
ui_print
# VHI
fi
[ "$(echo ${#modk})" == 3248 ] || abort
# Tạo font
lnf(){
cd $MODPATH/system/fonts
cp -rf MiLanProVF.ttf MiSansVF.ttf
cp -rf MiLanProVF.ttf RobotoVF.ttf
cp -rf MiLanProVF.ttf Roboto-Regular.ttf
}
if [ "$fontvh" == 2 ];then
ui_print2 "Cài Font"
ui_print
lnf
elif [ "$fontvh" == 3 ];then
ui_print2 "Cài Font"
ui_print
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] || abort "- Lỗi không tìm thấy tệp font MiLanProVF.ttf !
"
cp -rf $VHMI/fonts $MODPATH/system
lnf
else
ui_print2 "Xoá Font"
ui_print
rm -fr $MODPATH/system/fonts
fi
[ "$(echo ${#modk})" == 3248 ] || abort
# Dịch vụ gg
Ptkkf=$(echo /*/*/etc/permissions/*cn.google*.xml)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi

$Test123 || abort
ui_print2 "$(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
