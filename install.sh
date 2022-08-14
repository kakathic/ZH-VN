# kakathic
apktool () { java -jar $GITHUB_WORKSPACE/Tools/apktool-2.6.2-f3f199-SNAPSHOT-small.jar "$@"; }
apksign () { java -jar $GITHUB_WORKSPACE/Tools/apksigner.jar sign --cert "$GITHUB_WORKSPACE/Tools/releasekey.x509.pem" --key "$GITHUB_WORKSPACE/Tools/releasekey.pk8" --out "$2" "$1"; }

Autofix () {
apktool b -f $vad -o "$GITHUB_WORKSPACE/Tmp/Zz.$vad" 2>/dev/null >/dev/null
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/Apks/Zz.$vad" 2>/dev/null >/dev/null
}

ListTM="Tmp
Apks"

for Vak in $ListTM; do
mkdir -p $Vak
done
spt=0
cd $GITHUB_WORKSPACE/VietNam

for vad in *.apk; do

cp -rf $GITHUB_WORKSPACE/Test/* $vad
sed -i "s|Test.com.android|${vad%.*}|g" $vad/AndroidManifest.xml

apktool b -f $vad -o $GITHUB_WORKSPACE/Tmp/Zz.$vad 2>$GITHUB_WORKSPACE/log >$GITHUB_WORKSPACE/log
apksign "$GITHUB_WORKSPACE/Tmp/Zz.$vad" "$GITHUB_WORKSPACE/Apks/Zz.$vad" 2>/dev/null >/dev/null

spt=$(($spt + 1))
if [ -s "$GITHUB_WORKSPACE/Apks/Zz.$vad" ];then
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

cd $GITHUB_WORKSPACE/miui
cp -rf theme_values.xml nightmode
zip -qr $GITHUB_WORKSPACE/framework.zip *
mv -f $GITHUB_WORKSPACE/framework.zip $GITHUB_WORKSPACE/framework-miui-res
cd $GITHUB_WORKSPACE
zip -qr $GITHUB_WORKSPACE/Pack.zip framework-miui-res Apks/*
