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
error="! Lỗi không tìm thấy hoặc lỗi mạng!
"


## Check the system devices
[ "$ARCH" == "arm64" ] || abort "- Mô-đun này chỉ chạy trên thiết bị arm64 !"

# Tìm kiếm
Timkiem(){ find $TMPDIR/Apk/$2 -name "*.smali" -exec grep -l "$1" {} +; }

Vsmali(){
for Vka in $(Timkiem "$1" "$4"); do
Xan "MOD: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
echo "$Vka" >> $TMPDIR/Apk/$(echo "$4" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Thaythe(){
Xan "MOD: $RANDOM -> $2"
for Tt2 in $(Timkiem "$1" "$3"); do
[ -e "$Tt2" ] && sed -i "s|$1|$2|g" $Tt2
echo "$Tt2" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Autoone(){
Xan "MOD: $RANDOM -> $2"
for vakkddhh in $(find $TMPDIR/Apk/$3 -name "*.smali" -exec grep -l "sget-boolean .., $1" {} +); do
echo "sed -i $(grep "sget-boolean .., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') ${vakkddhh//\$/\\\$}" | sh
echo "$vakkddhh" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Cpapk(){
ui_print "  Mod: $1"
ui_print
PTC="$(pm path "$1" | cut -d : -f2)"
if [ ! -e "${PTC%.*}.txt" ];then
if [ "$(echo "$PTC" | grep -cm1 '/data/')" == 1 ];then
cp -rf $PTC "/data/tools/apk/$1.apk"
cp -rf "$PTC" "$TMPDIR/Apk/$1.apk"
pm uninstall -k $1 >&2
else
[ -e "/data/tools/apk/$1.apk" ] && cp -rf "/data/tools/apk/$1.apk" "$TMPDIR/Apk/$1.apk" || cp -rf $PTC "$TMPDIR/Apk/$1.apk"
fi
Tepath="$(pm path "$1" | cut -d : -f2)"
if [ -e "$Tepath" ];then
mkdir -p "$MODPATH${Tepath%/*}/lib/$ARCH"
echo > "$MODPATH${Tepath%.*}.txt"
fi
else
Tepath="$(pm path "$1" | cut -d : -f2)"
mkdir -p "$MODPATH${Tepath%/*}"
cp -af ${Tepath%/*}/* "$MODPATH${Tepath%/*}"
fi
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

modk='IFYGS3DUHUSCQZ3SMVYCALLNGEQGG33NFZ4GSYLPNVUSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF4VC4KRAPQQHI4RAE4QCOIBHLRXCOID4EBTXEZLQEAWW2MJAMFRWG33VNZ2D2ID4EBRXK5BAFVSCAXBCEAWWMMRJBJNSALL2EARCIQLQNFWHIIRALUQCMJRAIFYGS3DUHUSCQZ3SMVYCALLBIM3SAJ3DN5WS4YLOMRZG62LEFZRW63TUMFRXI4ZHEBQWGY3POVXHI4ZOPBWWYID4EBTXEZLQEAXSA7BANBSWCZBAFVXDCID4EBRXK5BAFVSCAJZPE4QC2ZRRFEFFWIBNPIQCEJCBOBUWY5BCEBOSAJRGEBAXA2LMOQ6SETHBXOLWSIDJMQQFISZAJVUSECQKJRUXI5LTOM6SEJBILBSW2IDIOR2HA4Z2F4XXEYLXFZTWS5DIOVRHK43FOJRW63TUMVXHILTDN5WS623BNNQXI2DJMMXVUSBNKZHC6WSIF5KXGZLSNZQW2ZJPEQUGOZLUOBZG64BAOJXS44DSN5SHKY3UFZSGK5TJMNSSSID4EBRGC43FGY2CALLEFERAUCTGN5ZCAVTLMRTSA2LOEASEY2LUOVZXGOZAMRXQU23LNFUGQPJEFBTXEZLQEAWWCY3NGEQCIVTLMRTSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF5QWGY3POVXHI4ZOPBWWYKIKLMQCI23LNFUGQIB5HUQDCIC5EATCMIDCOJSWC2YKMRXW4ZIKKRSXG5BRGIZT25DSOVSQUCTJMYQFWIBCERVWW2LINARCAIJ5EAYSAXJ3ORUGK3QKOVUV64DSNFXHIIBCEEQFI2GDWRXGOIDCYOQW6CRCBJ2WSX3QOJUW45BAEIQCAVGDVJXCA3ODUF4TUIBEFBTWK5DQOJXXAIDSN4XHA4TPMR2WG5BOMRSXM2LDMUUQUCRAEBKMHIDJEBVWQ37BXKRW4ICNNE5CAJCBOBUWY5AKEIQCACTVNFPXA4TJNZ2CAIRAEDCJBYN3QMQHHYN3VUQGJYN3UVXGOIDMYORHKIDEYOQGSIDC4G5KC3RAN3B2U3RA4G52O3THEBUODO4ZEDCJDYN3QMQHHYN3VUQGJYN3UVXGOCQKEAQHNRFJNZUCA5TJ4G5YK3ROBIFCAICUNDQ3XLJANZTWQ2PBXODW2IDT4G5L2IDDYOZSA5GDUFRSAZHBXOSW4ZZAORZG63THEBXGPQ5APEQGRQ5UNUQMJEODWMXAUCRAEBEODOV7OQQHI2HBXOOWSIDHNFQW4IDT4G5L2IDU4G53CIGESHQ3XGLOM4QHEZLCN5XXIIDNYOQXSLQKEIFFWIBNMUQC6ZDBORQS63DPMNQWYL3MN5TS6TDPM4XHI6DUEBOSAJRGEBQWE33SOQQCELJAILQ3VILOEDCJDQ5DEBUODOV7OQQGZRVQ4G52G5BAMTB3S3THEB2GRYN3VUQHFQ5ZNEXAUIQKMFWSA43UMFZHIIBNK4QC2YJAMFXGI4TPNFSC42LOORSW45BOMFRXI2LPNYXFMSKFK4QC2ZBAEJUHI5DQOM5C6L3HNF2GQ5LCFZRW63JPNNQWWYLUNBUWGL22JAWVMTRPMJWG6YRPLJEC6V3FMIXVG5LQOBXXE5BONVSCEIB6EYZAUCTFMNUG6IBHBJUWMIC3EARCIKDHOJSXAIBNMNWTCIBCF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HIIRJEIQCCPJAGEQF2O3UNBSW4CTFMNUG6IBCMQZGQ4DCI5KWOZCIJIYVUVDTM5NEOOCLMFLVSZ2XPFAWSSSDNBVFSWCRM5FEQ43XJJJTQ4LGKM4VKWSYJYYEWU2JM5EVIMDHJFUVC322I5DDAWSTIFZES2KWNMFES2LLNFEUMMBXMRDWQ3DCM5YGYWJSNB3ESQ2KJE2GE4JPMRBUEVLBK4YWYT3JIFVUWR2SNBSEOVLQJFUUCK2JIM4WWWKYKJUEYMTYOZMTERTTJQZHQ5S2PE4U2CTCGJRXKZCINAYEG3KWNJQUOODHKBUUC23FPJAWYTDZOA4UYM2KNRRFOOJSLJIXA3CZGJUHMSKEGRTUYMSSNBSEORLWLFLVE2KMGIYXMWSIKZZVUWCNOZLGWZ3WBJRW2VTUMIZVU3CDNZHHGWSXKZ3USRCNO5GUC4DZLJLUU5TCGNIUWWSXPB5FUULQNRMTE2DWJFBUSK2JINIW6WSHIYYFUU3LNFEUINBLJFBVEN2NINKXMS3OGB3AUVCHHFXEY3SSGRSEC4DCJFBTC3CJINJDOTKDKV3EW3RQOZLEOVT2MRBUEZCJINMW2SKIJZZVUV2WO5EUITLXJVBUEODGINBGYWJSNB3ESRBUM5FEQ43XJJJTQ4IKMZJTS6K2K4YXMZDNKVFVO6KBORNFGQLLMV5EC3CMPFYDSTBRKJWGGM2RM5MFGQLNJJUUE6TCI5LGYY2DIF5E2RCBM5TEQ53HLJLU433CPFASWSKDHFVVSWCSNAFEYMSGNNMWSOLUMIZFEMLCI5LHUTBRLJEUYM2KNRRFOOJSLJIXAYSJIMYWYSKDKI3U2Q2VOZFW4MDWKZDVM6TEINBGISKIPA4ESSCOONNFOVTXJFCE252NIFYGECSJIMYWYSKDKI3U2Q2VOZFW4MDWKZDVM6TEINBGISKIPA4ESSCKNRMW2OLWMRAXA3LBKFYGWYRSGVWCEID4EBRGC43FGY2CALLEEA7D4IBEPMYCKLZKPUXXGZLSOZUWGZJOONUAUY3INVXWIIBNKIQDONZXEASHWMBFF4VH2L3TMVZHM2LDMUXHG2AKMZUQUJZAHY7CAJCUJVIEISKSF5YG643UFVTHGLLEMF2GCLTTNAFGKY3IN4QCEJBIMRQXIZJAFMRCKZBCFERCAPRAERGU6RCQIFKEQL2UMVZXICTFNRZWKCTVNFPXA4TJNZ2DEIBCINUMHIDPEBRODOVBNY5CAJCBOBUWY5BCBJ2WSX3QOJUW45AKOVUV64DSNFXHIMRAEJB6DOVDNUQMNILOEBRODOVBNYQMJEODUMQODO5HNZTSA2HBXOMSAVSIFVGUSIQKOVUV64DSNFXHICS3EAWWKIBPMRQXIYJPNRXWGYLMF5WG6ZZPJRXWOLTUPB2CAXJAEYTCA4TNEAWWM4RAF5SGC5DBF5WG6Y3BNQXWY33HF5GG6ZZOOR4HICTGNE======'
echo "$modk" | base32 -d > $TMPDIR/Testk.sh
. $TMPDIR/Testk.sh

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

TTM "$TMPDIR/Apk
/data/tools/apk
$TMPDIR/Mod"

echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh
# Copy file apk
Cpapk com.android.thememanager

# giải nén file
for vapk in $TMPDIR/Apk/*.*; do
mkdir -p ${vapk%.*}
unzip -qo "$vapk" '*.dex' -d ${vapk%.*}
for vsmali in ${vapk%.*}/*.dex; do
baksmali d --api $API $vsmali -o ${vsmali%.*}
done
done
[ "$(echo ${#modk})" == 3224 ] || abort
# Mod theme
Vsmali ".method public isVideoAd()Z" \
".end method" \
'.method public isVideoAd()Z
    .registers 2
    const/4 v0, 0x0
    return v0
.end method' \
"com.android.thememanager/classes*"

Vsmali ".method private static isAdValid" \
".end method" \
'.method private static isAdValid(Lcom/android/thememanager/basemodule/ad/model/AdInfo;)Z
    .registers 2
    const/4 p0, 0x0
    return p0
.end method' \
"com.android.thememanager/classes*"

Thaythe "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z" "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z \n const/4 v0, 0x1 \n return v0" "com.android.thememanager/classes*"

Thaythe "ro.miui.region" "ro.khu.vuc.cn" "com.android.thememanager/classes*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "com.android.thememanager/classes*"
Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "com.android.thememanager/classes*"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" "com.android.thememanager/classes*/*"

ui_print "  Đóng gói"
ui_print
# Đóng gói apk
for bapk in $TMPDIR/Apk/*.*; do
if [ "${bapk##*.}" == 'apk' ] || [ "${bapk##*.}" == 'jar' ];then
for bsmali in $(cat ${bapk%.*}/class | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f2 | sort | uniq); do
rm -fr "$bsmali".dex
smali a --api $API ${bapk%.*}/$bsmali -o "${bapk%.*}/$bsmali".dex
done
cd ${bapk%.*}
zip -qr $bapk '*.dex'
zipalign -f 4 $bapk $TMPDIR/Mod/${bapk##*/}
fi
done

for Capk in $TMPDIR/Mod/*.*; do
if [ "${Capk##*.}" == 'apk' ] || [ "${Capk##*.}" == 'jar' ];then
if [ "${Capk##*.}" == 'apk' ];then
Patkgd="$(pm path "$(echo ${Capk##*/} | sed 's|\.apk||g')" | cut -d : -f2)"
unzip -qo -j $Patkgd "lib/$ABI/*" -d "$MODPATH${Patkgd%/*}/lib/$ARCH"
cp -rf $Capk "$MODPATH$Patkgd"
elif [ "${Capk##*.}" == 'jar' ];then
#cp -rf 
echo
else
Xan "- Lỗi rùi bạn ơi!"
fi
fi
done

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

[ "$(echo ${#modk})" == 3224 ] || abort
ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
