# kakathic
apktool () { java -jar $GITHUB_WORKSPACE/Tools/apktool-2.6.2-f3f199-SNAPSHOT-small.jar -api 33 "$@"; }
apksign () { java -jar $GITHUB_WORKSPACE/Tools/apksigner.jar sign --cert "$GITHUB_WORKSPACE/Tools/releasekey.x509.pem" --key "$GITHUB_WORKSPACE/Tools/releasekey.pk8" --out "$2" "$1"; }
Autofix () {
apktool b -f $vad -o "$GITHUB_WORKSPACE/Tmp/Zz.$vad" 2>/dev/null >/dev/null
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/apk/Zz.$vad" 2>/dev/null >/dev/null
}

unapk () {
echo "
Unpack: ${1##*/}"
apktool d -q -r -f "$1" -o "${1%.*}"
}
repapk () {
echo "Repack: ${1##*/}"
rm -fr $GITHUB_WORKSPACE/pro/*
mkdir -p $GITHUB_WORKSPACE/pro/lib/arm64
cp -rf ${1%.*}/lib/arm64-v8a/* $GITHUB_WORKSPACE/pro/lib/arm64
# rm -fr ${1%.*}/lib
apktool b -q -c -f "${1%.*}" -o "$GITHUB_WORKSPACE/kest/${1##*/}"
zipalign -f 4 "$GITHUB_WORKSPACE/kest/${1##*/}" "$GITHUB_WORKSPACE/pro/${1##*/}"
cd $GITHUB_WORKSPACE/pro
zip -qr $GITHUB_WORKSPACE/${1##*/} *
}

Taive () { curl -s -L "$1" -o "$2"; }
Xem () { curl -s -L -G "$1"; }

Geplai(){ cat "$GITHUB_WORKSPACE/Hpk/$1".* > "$GITHUB_WORKSPACE/Hpk/$1".apk; }

Timkiem () { grep -Rl "$1" $2; }

Thaythe () {
Tt1="$(Timkiem "$1" "$3")"
[ "$Tt1" ] && echo "MOD: $1 -> $2" | sed "s|\\\/|/|g"
for Tt2 in $Tt1; do
[ "$Tt2" ] && sed -i -e "s|$1|$2|g" $Tt2
done
}

Vsmali () {
for Vka in $(Timkiem "$1" "$4"); do
echo "MOD: $(echo "$1" | sed 's|\\||g')"
sed -i -e "/^$1/,/$2/c $(echo "$3" | sed -z 's|\n|\\n|g')" "$Vka"
done
}

Phienban="$(cat "$GITHUB_WORKSPACE/Update.json" | jq -r .version)"

ListTM="Tmp
pro
apk"

for Vak in $ListTM; do
mkdir -p $Vak
done
spt=0

# Kllll(){

Taive "https://github.com/kakathic/ZH-VN/archive/refs/heads/VN.zip" "$GITHUB_WORKSPACE/Tmp/VN.zip"
unzip -oq "$GITHUB_WORKSPACE/Tmp/VN.zip" -d "$GITHUB_WORKSPACE"

ls $GITHUB_WORKSPACE
cd $GITHUB_WORKSPACE/Vietnam

for vad in *.apk; do
cp -rf $GITHUB_WORKSPACE/Test/* $vad
sed -i "s|Test.com.android|${vad%.*}|g" $vad/AndroidManifest.xml

apktool b -f -s $vad -o $GITHUB_WORKSPACE/Tmp/Zz.$vad >$GITHUB_WORKSPACE/log 2>>$GITHUB_WORKSPACE/log
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/apk/Zz.$vad" 2>/dev/null >/dev/null

spt=$(($spt + 1))
if [ -s "$GITHUB_WORKSPACE/apk/Zz.$vad" ];then
echo "$spt $vad" 
else
if [ "$(grep -cm1 'is already defined.' $GITHUB_WORKSPACE/log)" == 1 ];then
while true; do
Linktk=$(grep -m1 'is already defined.' $GITHUB_WORKSPACE/log | cut -d : -f2)
Vbtk=$(grep -m1 'is already defined.' $GITHUB_WORKSPACE/log | awk '{print $6}')
sotk=$(grep -nm1 "$Vbtk" $Linktk | cut -d : -f1)
sed -i ''$sotk'd' $Linktk
sed -i '/'$Vbtk'/d' $GITHUB_WORKSPACE/log
[ "$(grep -cm1 'is already defined.' $GITHUB_WORKSPACE/log)" == 0 ] && break
done
Autofix
fi
[ -s "$GITHUB_WORKSPACE/apk/Zz.$vad" ] && echo "$spt $vad" || echo "Error: $vad

$(cat $GITHUB_WORKSPACE/log)
"
fi
done

cd $GITHUB_WORKSPACE/Miui
cp -rf theme_values.xml nightmode
zip -qr $GITHUB_WORKSPACE/framework.zip *
mv -f $GITHUB_WORKSPACE/framework.zip $GITHUB_WORKSPACE/framework-miui-res

# }
# Mod apk

modtt () {

Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Le/h/a;->a:Z" "${1%.*}/smali*"
Thaythe "ro.miui.region" "ro.khu.vuc" "${1%.*}/smali*"
Thaythe "ro.product.mod_device" "ro.product.vip" "${1%.*}/smali*"

}

thoitietpath="$GITHUB_WORKSPACE/Hpk/com.miui.weather2.apk"
if [ -e "$thoitietpath" ];then
unapk $thoitietpath
modtt $thoitietpath
repapk $thoitietpath
fi

Modtheme() {
Vsmali ".method public isVideoAd()Z" \
".end method" \
'.method public isVideoAd()Z
    .registers 2
    const/4 v0, 0x0
    return v0
.end method' \
"${1%.*}/smali*"

Vsmali ".method private static isAdValid" \
".end method" \
'.method private static isAdValid(Lcom/android/thememanager/basemodule/ad/model/AdInfo;)Z
    .registers 2
    const/4 p0, 0x0
    return p0
.end method' \
"${1%.*}/smali*"
Thaythe "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z" "iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z \n const/4 v0, 0x1 \n return v0" "${1%.*}/smali*"
Thaythe "ro.miui.region" "ro.khu.vuc.cn" "${1%.*}/smali*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "${1%.*}/smali*"
Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "${1%.*}/smali*"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lg/r/b;->a:Z" "${1%.*}/smali*"
}

Themeossn="$GITHUB_WORKSPACE/Hpk/com.android.thememanager.apk"
if [ -e "$Themeossn" ];then
unapk $Themeossn
Modtheme $Themeossn
repapk $Themeossn
fi

Modapk(){
Vsmali ".method public static o(Landroid\/content\/pm\/ApplicationInfo;)Z" \
".end method" \
'.method public static o(Landroid/content/pm/ApplicationInfo;)Z
    .registers 3
    const/4 v1, 0x1
    return v1
.end method' \
"$(Timkiem "iget p0, p0, Landroid\/content\/pm\/ApplicationInfo;->uid:I" "${1%.*}/smali*")"
}

Apkossn="$GITHUB_WORKSPACE/Hpk/com.miui.packageinstaller.apk"
if [ -e "$Apkossn" ];then
unapk $Apkossn
Modapk $Apkossn
repapk $Apkossn
fi

Modappval(){
Thaythe "MM:dd" "dd:MM" "${1%.*}/smali*/c/i/e/f/e/l.smali"
}

Appvaluossn="$GITHUB_WORKSPACE/Hpk/com.miui.personalassistant.apk"
if [ -e "$Appvaluossn" ];then
unapk $Appvaluossn
Modappval $Appvaluossn
repapk $Appvaluossn
fi

Modhome(){
Thaythe "ro.product.mod_device" "ro.product.modcn" "${1%.*}/smali*"
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiuix/os/Build;->IS_INTERNATIONAL_BUILD:Z" "${1%.*}/smali*"
}

Homebgf="$GITHUB_WORKSPACE/Hpk/com.miui.home.apk"
if [ -e "$Homebgf" ];then
unapk $Homebgf
Modhome $Homebgf
repapk $Homebgf
fi

# Nén lại
cd $GITHUB_WORKSPACE
zip -qr $GITHUB_WORKSPACE/VH_$Phienban.zip framework-miui-res apk/*

for vahhh in $GITHUB_WORKSPACE/*.apk; do
mv -f  $vahhh "${vahhh%.*}".zip
done
