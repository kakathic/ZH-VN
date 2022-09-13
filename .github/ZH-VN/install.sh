# Kakathic
cp -rf $TMPDIR/Tools.sh $MODPATH
chmod 777 $MODPATH/Tools.sh
. $MODPATH/Tools.sh

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
error="- Lỗi không tìm thấy hoặc lỗi mạng!
"


## Check the system devices
[ "$ARCH" == "arm64" ] || abort "- Mô-đun này chỉ chạy trên thiết bị arm64 !"

baksmali () {
java -Xms256m -Xmx512m -jar "/data/tools/lib/Tools/baksmali.jar" "$@"
}
smali () {
java -Xms256m -Xmx512m -jar "/data/tools/lib/Tools/smali.jar" "$@"
}

# Tìm kiếm
Timkiem(){ find $TMPDIR/Apk/$2 -name "*.smali" -exec grep -l "$1" {} +; }

Vsmali(){
for Vka in $(find $4 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e $Vka ] && Xan "MOD: $(echo "$1" | sed 's|\\||g')" || Xan "- Lỗi: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
echo "$Vka" >> $TMPDIR/Apk/$(echo "$4" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Thaythe(){
Xan "MOD: $RANDOM -> $2"
for Tt2 in $(find $3 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e "$Tt2" ] && sed -i "s|$1|$2|g" $Tt2 || Xan "- Lỗi: $1"
echo "$Tt2" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Autoone(){
Xan "MOD: $RANDOM -> $2"
for vakkddhh in $(find $3 -name "*.smali" -exec grep -l "sget-boolean .., $1" {} +); do
echo "sed -i $(grep "sget-boolean .., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') ${vakkddhh//\$/\\\$}" | sh
echo "$vakkddhh" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

CPapk(){
PTC="$(pm path "$1" | cut -d : -f2)"
if [ "$(echo "$PTC" | grep -cm1 '/data/')" == 1 ];then
cp -rf $PTC "/data/tools/apk/$1.apk"
cp -rf "$PTC" "$TMPDIR/Apk/$1.apk"
pm uninstall -k $1 >&2
echo "$(pm path "$1" | cut -d : -f2)" > "$TMPDIR/Apk/$1.txt"
else
[ -e "/data/tools/apk/$1.apk" ] && cp -rf "/data/tools/apk/$1.apk" "$TMPDIR/Apk/$1.apk" || cp -rf $(magisk --path)/.magisk/mirror/system_root/$PTC "$TMPDIR/Apk/$1.apk"
echo "$PTC" > "$TMPDIR/Apk/$1.txt"
fi
}

CPfile(){
Pathfw="$(find /system -name ''$miuik''$1'.jar')"
cp -f "$(magisk --path)/.magisk/mirror/system_root/$Pathfw" "$TMPDIR/Apk"
echo "$Pathfw" > $TMPDIR/Apk/''$miuik''$1'.txt'
}


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

modk='IFYGS3DUHUSCQZ3SMVYCALLNGEQGG33NFZ4GSYLPNVUSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF4VC4KRAPQQHI4RAE4QCOIBHLRXCOID4EBTXEZLQEAWW2MJAMFRWG33VNZ2D2ID4EBRXK5BAFVSCAXBCEAWWMMRJBJNSALL2EARCIQLQNFWHIIRALUQCMJRAIFYGS3DUHUSCQZ3SMVYCALLBIM3SAJ3DN5WS4YLOMRZG62LEFZRW63TUMFRXI4ZHEBQWGY3POVXHI4ZOPBWWYID4EBTXEZLQEAXSA7BANBSWCZBAFVXDCID4EBRXK5BAFVSCAJZPE4QC2ZRRFEFFWIBNPIQCEJCBOBUWY5BCEBOSAJRGEBAXA2LMOQ6SETHBXOLWSIDJMQQFISZAJVUSECQKJRUXI5LTOM6SEJBILBSW2IDIOR2HA4Z2F4XXEYLXFZTWS5DIOVRHK43FOJRW63TUMVXHILTDN5WS623BNNQXI2DJMMXVUSBNKZHC6WSIF5KXGZLSNZQW2ZJPEQUGOZLUOBZG64BAOJXS44DSN5SHKY3UFZSGK5TJMNSSSID4EBRGC43FGY2CALLEFERAUCTGN5ZCAVTLMRTSA2LOEASEY2LUOVZXGOZAMRXQU23LNFUGQPJEFBTXEZLQEAWWCY3NGEQCIVTLMRTSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF5QWGY3POVXHI4ZOPBWWYKIKLMQCI23LNFUGQIB5HUQDCIC5EATCMIDCOJSWC2YKMRXW4ZIKKRSXG5BRGIZT25DSOVSQUCTJMYQFWIBCERVWW2LINARCAIJ5EAYSAXJ3ORUGK3QKOVUV64DSNFXHIIBCEEQFI2GDWRXGOIDCYOQW6CRCBJ2WSX3QOJUW45BAEIQCAVGDVJXCA3ODUF4TUIBEFBTWK5DQOJXXAIDSN4XHA4TPMR2WG5BOMRSXM2LDMUUQUCRAEBKMHIDJEBVWQ37BXKRW4ICNNE5CAJCBOBUWY5AKEIQCACTVNFPXA4TJNZ2CAIRAEDCJBYN3QMQHHYN3VUQGJYN3UVXGOIDMYORHKIDEYOQGSIDC4G5KC3RAN3B2U3RA4G52O3THEBUODO4ZEDCJDYN3QMQHHYN3VUQGJYN3UVXGOCQKEAQHNRFJNZUCA5TJ4G5YK3ROBIFCAICUNDQ3XLJANZTWQ2PBXODW2IDT4G5L2IDDYOZSA5GDUFRSAZHBXOSW4ZZAORZG63THEBXGPQ5APEQGRQ5UNUQMJEODWMXAUCRAEBEODOV7OQQHI2HBXOOWSIDHNFQW4IDT4G5L2IDU4G53CIGESHQ3XGLOM4QHEZLCN5XXIIDNYOQXSLQKEIFFWIBNMUQC6ZDBORQS63DPMNQWYL3MN5TS6TDPM4XHI6DUEBOSAJRGEBQWE33SOQQCELJAILQ3VILOEDCJDQ5DEBUODOV7OQQGZRVQ4G52G5BAMTB3S3THEB2GRYN3VUQHFQ5ZNEXAUIQKMFWSA43UMFZHIIBNK4QC2YJAMFXGI4TPNFSC42LOORSW45BOMFRXI2LPNYXFMSKFK4QC2ZBAEJUHI5DQOM5C6L3HNF2GQ5LCFZRW63JPNNQWWYLUNBUWGL22JAWVMTRPMJWG6YRPLJEC6V3FMIXVG5LQOBXXE5BONVSCEIB6EYZAUCTFMNUG6IBHBJUWMIC3EARCIKDHOJSXAIBNMNWTCIBCF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HIIRJEIQCCPJAGEQF2O3UNBSW4CTFMNUG6IBCMQZGQ4DCI5KWOZCIJIYVUVDTM5NEOOCLMFLVSZ2XPFAWSSSDNBVFSWCRM5FEQ43XJJJTQ4LGKM4VKWSYJYYEWU2JM5EVIMDHJFUVC322I5DDAWSTIFZES2KWNMFES2LLNFEUMMBXMRDWQ3DCM5YGYWJSNB3ESQ2KJE2GE4JPMRBUEVLBK4YWYT3JIFVUWR2SNBSEOVLQJFUUCK2JIM4WWWKYKJUEYMTYOZMTERTTJQZHQ5S2PE4U2CTCGJRXKZCINAYEG3KWNJQUOODHKBUUC23FPJAWYTDZOA4UYM2KNRRFOOJSLJIXA3CZGJUHMSKEGRTUYMSSNBSEORLWLFLVE2KMGIYXMWSIKZZVUWCNOZLGWZ3WBJRW2VTUMIZVU3CDNZHHGWSXKZ3USRCNO5GUC4DZLJLUU5TCGNIUWWSXPB5FUULQNRMTE2DWJFBUSK2JINIW6WSHIYYFUU3LNFEUINBLJFBVEN2NINKXMS3OGB3AUVCHHFXEY3SSGRSEC4DCJFBTC3CJINJDOTKDKV3EW3RQOZLEOVT2MRBUEZCJINMW2SKIJZZVUV2WO5EUITLXJVBUEODGINBGYWJSNB3ESRBUM5FEQ43XJJJTQ4IKMZJTS6K2K4YXMZDNKVFVO6KBORNFGQLLMV5EC3CMPFYDSTBRKJWGGM2RM5MFGQLNJJUUE6TCI5LGYY2DIF5E2RCBM5TEQ53HLJLU433CPFASWSKDHFVVSWCSNAFEYMSGNNMWSOLUMIZFEMLCI5LHUTBRLJEUYM2KNRRFOOJSLJIXAYSJIMYWYSKDKI3U2Q2VOZFW4MDWKZDVM6TEINBGISKIPA4ESSCOONNFOVTXJFCE252NIFYGECSJIMYWYSKDKI3U2Q2VOZFW4MDWKZDVM6TEINBGISKIPA4ESSCKNRMW2OLWMRAXA3LBKFYGWYRSGVWCEID4EBRGC43FGY2CALLEEA7D4IBEPMYCKLZKPUXXGZLSOZUWGZJOONUAUY3INVXWIIBNKIQDONZXEASHWMBFF4VH2L3TMVZHM2LDMUXHG2AKMZUQUJZAHY7CAJCUJVIEISKSF5YG643UFVTHGLLEMF2GCLTTNAFGKY3IN4QCEJBIMRQXIZJAFMRCKZBCFERCAPRAERGU6RCQIFKEQL2UMVZXICTFNRZWKCTVNFPXA4TJNZ2DEIBCINUMHIDPEBRODOVBNY5CAJCBOBUWY5BCBJ2WSX3QOJUW45AKOVUV64DSNFXHIMRAEJB6DOVDNUQMNILOEBRODOVBNYQMJEODUMQODO5HNZTSA2HBXOMSAVSIFVGUSIQKOVUV64DSNFXHICS3EAWWKIBPMRQXIYJPNRXWGYLMF5WG6ZZPJRXWOLTUPB2CAXJAEYTCA4TNEAWWM4RAF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HICTGNE======'
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
echo "ro.product.vip=$(getprop ro.product.device)_global" >> $TMPDIR/system.prop

Xu_install 7za
Xu_install jre
Xu_install smali 2.5.2
Xu_install baksmali 2.3.4
Xu_install zipalign
Xu_install zip
Xu_install toybox

sed(){ toybox sed "$@";}
cut(){ toybox cut "$@";}

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
[ "$(echo ${#modk})" == 3224 ] || abort
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
[ "$(echo ${#modk})" == 3224 ] || abort
# Dịch vụ gg
Ptkkf=$(echo /*/*/etc/permissions/*cn.google*.xml)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi

# Copy file apk
CPapk com.miui.powerkeeper

# giải nén file
for vapk in $TMPDIR/Apk/*.*; do
if [ "${vapk##*.}" == 'apk' ] || [ "${vapk##*.}" == 'jar' ];then
ui_print "  Giải nén: ${vapk##*/}"
ui_print
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali d --api $API $vsmali -o ${vsmali%.*}
done
fi
done

pm clear com.miui.powerkeeper >&2
Autoone "Lmiui/os/Build;->IS_STABLE_VERSION:Z" "0x1" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/*"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/*"
Thaythe "ro.product.mod_device" "ro.product.vip" "$TMPDIR/Apk/com.miui.powerkeeper/classes*/*"
Vsmali ".method public static isFeatureOn()Z" \
".end method" \
'.method public static isFeatureOn()Z
    .registers 3
    const/4 v1, 0x0
    return v1
.end method' \
"$TMPDIR/Apk/com.miui.powerkeeper/classes*/*"

# Đóng gói apk
for bapk in $TMPDIR/Apk/*.*; do
if [ "${bapk##*.}" == 'apk' ] || [ "${bapk##*.}" == 'jar' ];then
ui_print "  Đóng gói: ${bapk##*/}"
ui_print
for bsmali in $(cat ${bapk%.*}/class | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f2 | sort | uniq); do
rm -fr "$bsmali".dex
smali a --api $API ${bapk%.*}/$bsmali -o "${bapk%.*}/$bsmali".dex
done
cd ${bapk%.*}
zip -qr -0 $bapk '*.dex'
zipalign -f 4 $bapk $TMPDIR/Apk/tmp/${bapk##*/} 
cp -rf $TMPDIR/Apk/tmp/* $TMPDIR/Apk
fi
done

for Capk in $TMPDIR/Apk/*.*; do
if [ "${Capk##*.}" == 'apk' ];then
Papkp="$(cat ${Capk%.*}.txt)"
if [ "$(unzip -l $Capk 2>/dev/null | grep -cm1 "lib/$ABI/")" == 1 ];then
mkdir -p $MODPATH${Papkp%/*}/lib/$ARCH
unzip -qo -j $Capk "lib/$ABI/*" -d $MODPATH${Papkp%/*}/lib/$ARCH
fi
mkdir -p $MODPATH${Papkp%/*}
cp -rf $Capk "$MODPATH$Papkp"
fi
if [ "${Capk##*.}" == 'jar' ];then
Papkp="$(cat ${Capk%.*}.txt)"
mkdir -p "$MODPATH${Papkp%/*}"
cp -rf $Capk "$MODPATH$Papkp"
fi
done

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

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
