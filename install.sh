# kakathic
apktool () { java -jar $GITHUB_WORKSPACE/Tools/apktool-2.6.2-f3f199-SNAPSHOT-small.jar "$@"; }
apksign () { java -jar $GITHUB_WORKSPACE/Tools/apksigner.jar sign --cert "$GITHUB_WORKSPACE/Tools/releasekey.x509.pem" --key "$GITHUB_WORKSPACE/Tools/releasekey.pk8" --out "$2" "$1"; }

Autofix () {
apktool b -f $vad -o "$GITHUB_WORKSPACE/Tmp/Zz.$vad" 2>/dev/null >/dev/null
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/apk/Zz.$vad" 2>/dev/null >/dev/null
}

Timkiem () { find $2 -name "$3" | xargs -0 grep -Rl "$1"; }

# Tự động thay
AutoAll () {
for gwgeh in $(Timkiem "$1" "$3" "*.smali"); do
while true; do
rhhgh="$(grep -c "$1" $gwgeh)"
[ "$rhhgh" == 0 ] && break
rhheg="$(grep -m1 "$1" $gwgeh)"
ggege="$(echo "$rhheg" | sed -e 's|sget-boolean|const|' -e "s|$1|$2|")"
rhbrb="$(echo "$rhheg" | grep -c 'sget-boolean')"
[ "$rhbrb" == 1 ] && sed -i "s|$rhheg|$ggege|" $gwgeh
[ "$rhbrb" != 1 ] && break
done
done
}

unapk () {
apktool d -q -r -f "$1" -o "${1%.*}"
}
repapk () {
apktool b -q -c -f "${1%.*}" -o "$GITHUB_WORKSPACE/Test-${1##*/}"
zipalign -f -p 4 "$GITHUB_WORKSPACE/Test-${1##*/}" "$GITHUB_WORKSPACE/${1##*/}"
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
echo "$spt - $vad" 
else
echo "$spt - $vad

$(cat $GITHUB_WORKSPACE/log)
"

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
fi
done

cd $GITHUB_WORKSPACE/Miui
cp -rf theme_values.xml nightmode
zip -qr $GITHUB_WORKSPACE/framework.zip *
mv -f $GITHUB_WORKSPACE/framework.zip $GITHUB_WORKSPACE/framework-miui-res

# khu vực mod apk

modtt () {
evbhe="$(Timkiem "ro.miui.region" "${1%.*}/smali*" "*.smali")"
echo $evbhe
[ "$evbhe" ] && echo "MOD: Khu vực việt nam"
for rgeg in $evbhe; do
[ "$rgeg" ] && sed -i 's|ro.miui.region|ro.khu.vuc|g' $rgeg
done
AutoAll "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "${1%.*}/smali*"
AutoAll "Le/h/a;->a:Z" "0x1" "${1%.*}/smali*" "0x1" "${1%.*}/smali*"
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


