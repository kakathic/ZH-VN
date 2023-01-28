# kakathic

TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"
TEST="$TOME/.github/Test"

User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive () { curl -s -L -N -H "$User" --connect-timeout 20 "$1" -o "$2"; }
Xem () { curl -s -G -L -N -H "$User" --connect-timeout 20 "$1"; }
mkdir -p "$TOME/Zip"
bash $TOME/.github/VH-MI.sh

Taoup(){
Vscode=${VA//./};
echo "
versionCode=$Vscode
version=$VA
" >> $TOME/$1/module.prop
mkdir -p $TOME/$1/META-INF/com/google/android $TOME/$1/bin $TOME/$1/lib
cp -rf $TOME/.github/Tools/busybox $TOME/$1/bin
cp -rf $TOME/.github/Tools/toybox $TOME/$1/bin
cp -rf $TOME/.github/Tools/update* $TOME/$1/META-INF/com/google/android
cp -rf $TOME/FLuna $TOME/$1/lib

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
zip -qr "$TOME/Zip/$1-$VA.zip" *
}

Taoup FL-PT
Taoup FL-KE
Taoup FL-GA
Taoup FL-ZH

Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-29.zip" $TOME/FL-GA/lib/FL-29.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-30.zip" $TOME/FL-GA/lib/FL-30.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-31.zip" $TOME/FL-GA/lib/FL-31.zip
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/FL-33.zip" $TOME/FL-GA/lib/FL-33.zip

cp -rf "$TOME/Zip/FL-GA-$VA.zip" "$TOME/Zip/FL-GA-Android-10-$VA.zip"
cp -rf "$TOME/Zip/FL-GA-$VA.zip" "$TOME/Zip/FL-GA-Android-11-$VA.zip"
cp -rf "$TOME/Zip/FL-GA-$VA.zip" "$TOME/Zip/FL-GA-Android-12-$VA.zip"
mv -f "$TOME/Zip/FL-GA-$VA.zip" "$TOME/Zip/FL-GA-Android-13-$VA.zip"

cd $TOME/FL-GA
zip -r "$TOME/Zip/FL-GA-Android-10-$VA.zip" -u lib/FL-29.zip
zip -r "$TOME/Zip/FL-GA-Android-11-$VA.zip" -u lib/FL-30.zip
zip -r "$TOME/Zip/FL-GA-Android-12-$VA.zip" -u lib/FL-31.zip
zip -r "$TOME/Zip/FL-GA-Android-13-$VA.zip" -u lib/FL-33.zip
