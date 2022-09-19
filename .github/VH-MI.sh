# kakathic

TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"
TEST="$TOME/.github/Test"

apktool () { java -jar $TOOLS/apktool-2.6.2.jar "$@"; }
apksign () { java -jar $TOOLS/apksigner.jar sign --cert "$TOOLS/testkey.x509.pem" --key "$TOOLS/testkey.pk8" --out "$2" "$1"; }

Autofix () {
apktool b -f $vad -o "$TOME/Tmp/Zz.$vad" 2>/dev/null >/dev/null
apksign "$TOME/Tmp/Zz.$vad" "$TOME/apk/Zz.$vad" 2>/dev/null >/dev/null
}
Xdauto(){
apktool b -f -s $1 -o $TOME/Tmp/Zz.$1 >$TOME/log 2>>$TOME/log
[ -e "$TOME/Tmp/Zz.$1" ] && apksign "$TOME/Tmp/Zz.$1" "$2" 2>/dev/null >/dev/null
}

ListTM="Tmp
Up
pro
notamlich
apk"

for Vak in $ListTM; do
mkdir -p $Vak
done
spt=0

cd $TOME/Language

for vad in *.apk; do

cp -rf $TEST/* $vad
sed -i "s|Test.com.android|${vad%.*}|g" $vad/AndroidManifest.xml
Xdauto "$vad" "$TOME/apk/Zz.$vad"
spt=$(($spt + 1))

if [ -s "$TOME/apk/Zz.$vad" ];then
echo "$spt $vad" 
else
if [ "$(grep -cm1 'is already defined.' $TOME/log)" == 1 ];then
while true; do
Linktk=$(grep -m1 'is already defined.' $TOME/log | cut -d : -f2)
Vbtk=$(grep -m1 'is already defined.' $TOME/log | awk '{print $6}')
sotk=$(grep -nm1 "$Vbtk" $Linktk | cut -d : -f1)
sed -i ''$sotk'd' $Linktk
sed -i '/'$Vbtk'/d' $TOME/log
[ "$(grep -cm1 'is already defined.' $TOME/log)" == 0 ] && break
done
Autofix
fi

[ -s "$TOME/apk/Zz.$vad" ] && echo "$spt $vad" || echo "Error: $vad

$(cat $TOME/log)
"
fi
done

cd $TOME/Miui
cp -rf theme_values.xml nightmode
zip -qr $TOME/framework.zip *
mv -f $TOME/framework.zip $TOME/framework-miui-res

# Not âm lịch
sed -i -e 's|E, dd.MM - (e.N)|EEEE, dd/MM|g' $TOME/Language/com.android.systemui.apk/res/values-vi/strings.xml $TOME/Miui/vi-VN/theme_values.xml

cd $TOME/Miui/vi-VN
cp -rf theme_values.xml nightmode
zip -qr $TOME/framework2.zip *
mv -f $TOME/framework2.zip $TOME/notamlich/framework-miui-res

cd $TOME/Language
Xdauto "com.android.systemui.apk" "$TOME/notamlich/Zz.com.android.systemui.apk"

# Nén lại
cd $TOME
zip -qr --password 2 $TOME/Up/TT.Zip apk/* notamlich/* framework-miui-res
