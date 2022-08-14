# kakathic
apktool () { java -jar $GITHUB_WORKSPACE/Tools/apktool-2.6.2-f3f199-SNAPSHOT-small.jar "$@"; }
apksign () { java -jar $GITHUB_WORKSPACE/Tools/apksigner.jar sign --cert "$GITHUB_WORKSPACE/Tools/releasekey.x509.pem" --key "$GITHUB_WORKSPACE/Tools/releasekey.pk8" --out "$2" "$1"; }
Autofix () {
apktool b -f $vad -o "$GITHUB_WORKSPACE/Tmp/Zz.$vad" 2>/dev/null >/dev/null
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/apk/Zz.$vad" 2>/dev/null >/dev/null
}

unapk () {
apktool d -q -r -f "$1" -o "${1%.*}"
}
repapk () {
apktool b -q -c -f "${1%.*}" -o "$GITHUB_WORKSPACE/Test-${1##*/}"
zipalign -f -p 4 "$GITHUB_WORKSPACE/Test-${1##*/}" "$GITHUB_WORKSPACE/${1##*/}"
}

Timkiem () { grep -Rl "$1" $2; }

Thaythe () {
Tt1="$(Timkiem "$1" "$3")"
[ "$Tt1" ] && echo "MOD: $1 -> $2"
for Tt2 in $Tt1; do
[ "$Tt2" ] && sed -i "s|$1|$2|g" $Tt2
done
}

Phienban="$(cat $GITHUB_WORKSPACE/README.md | grep -m1 'Version:' | awk '{print $2}')"

ListTM="Tmp
apk"

for Vak in $ListTM; do
mkdir -p $Vak
done
spt=0
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

# Mod apk

modtt () {

Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Le/h/a;->a:Z" "${1%.*}/smali*"
Thaythe "ro.miui.region" "ro.khu.vuc" "${1%.*}/smali*"
Thaythe "ro.product.mod_device" "ro.product.vip" "${1%.*}/smali*"

}

thoitietpath="$GITHUB_WORKSPACE/Hpk/Thoitiet.apk"
if [ -e "$thoitietpath" ];then
unapk $thoitietpath
modtt $thoitietpath
repapk $thoitietpath
fi


# Nén lại

cd $GITHUB_WORKSPACE
zip -qr $GITHUB_WORKSPACE/VH_$Phienban.zip Thoitiet.apk framework-miui-res apk/*


