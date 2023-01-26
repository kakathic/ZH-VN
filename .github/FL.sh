# kakathic
VS=1.4

TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"
TEST="$TOME/.github/Test"

User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive () { curl -s -L -N -H "$User" --connect-timeout 20 "$1" -o "$2"; }
Xem () { curl -s -G -L -N -H "$User" --connect-timeout 20 "$1"; }

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

TTM(){
for vah in $1; do
[ -e "$TOME/$vah" ] || mkdir -p "$TOME/$vah"
done
}

TTM "Zip
Up
Tmp
pro
notamlich
apk"

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
sed -i -e 's|E, dd.MM - (e.N)|EEEE, dd/MM|g' $TOME/Language/com.android.systemui.apk/res/values-vi/strings.xml $TOME/Miui/theme_values.xml

cd $TOME/Miui
cp -rf theme_values.xml nightmode
zip -qr $TOME/framework2.zip *
mv -f $TOME/framework2.zip $TOME/notamlich/framework-miui-res

cd $TOME/Language
Xdauto "com.android.systemui.apk" "$TOME/notamlich/Zz.com.android.systemui.apk"

Taoup(){
Vs=$VS;
Vscode=${VS//./};
echo "
versionCode=$Vscode
version=$Vs
" >> $TOME/$1/module.prop
mkdir -p $TOME/$1/META-INF/com/google/android $TOME/$1/bin $TOME/$1/lib
cp -rf $TOME/.github/Tools/busybox $TOME/$1/bin
cp -rf $TOME/.github/Tools/toybox $TOME/$1/bin
cp -rf $TOME/.github/Tools/update* $TOME/$1/META-INF/com/google/android
cp -rf $TOME/Username $TOME/$1/lib

if [ "$1" == "FL-PT" ] || [ "$1" == "FL-KE" ];then
cp -rf $TOME/.github/Tools/zip* $TOME/$1/bin
cp -rf $TOME/.github/Tools/Jre.tar.xz $TOME/$1/lib
cp -rf $TOME/.github/Tools/*smali* $TOME/$1/lib
fi

if [ "$1" == "FL-ZH" ];then
cp -rf $TOME/apk $TOME/$1/lib
cp -rf $TOME/framework-miui-res $TOME/$1/lib
cp -rf $TOME/notamlich $TOME/$1/lib
fi

cd $TOME/$1
zip -qr "$TOME/Zip/$1-$Vs.zip" *
}

Taoup FL-PT
Taoup FL-KE
Taoup FL-GA
Taoup FL-ZH

Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-29.zip" $TOME/FL-GA/lib/FL-29.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-30.zip" $TOME/FL-GA/lib/FL-30.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-31.zip" $TOME/FL-GA/lib/FL-31.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-33.zip" $TOME/FL-GA/lib/FL-33.zip

cp -rf "$TOME/Zip/FL-GA-$Vs.zip" "$TOME/Zip/FL-GA-Android-10-$Vs.zip"
cp -rf "$TOME/Zip/FL-GA-$Vs.zip" "$TOME/Zip/FL-GA-Android-11-$Vs.zip"
cp -rf "$TOME/Zip/FL-GA-$Vs.zip" "$TOME/Zip/FL-GA-Android-12-$Vs.zip"
mv -f "$TOME/Zip/FL-GA-$Vs.zip" "$TOME/Zip/FL-GA-Android-13-$Vs.zip"

cd $TOME/FL-GA
zip -r "$TOME/Zip/FL-GA-Android-10-$Vs.zip" -u lib/FL-29.zip
zip -r "$TOME/Zip/FL-GA-Android-11-$Vs.zip" -u lib/FL-30.zip
zip -r "$TOME/Zip/FL-GA-Android-12-$Vs.zip" -u lib/FL-31.zip
zip -r "$TOME/Zip/FL-GA-Android-13-$Vs.zip" -u lib/FL-33.zip
