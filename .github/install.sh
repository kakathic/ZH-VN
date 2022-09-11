# kakathic

TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"

TTM(){
for vah in $1; do
[ -e $vah ] || mkdir -p "$TOME/$vah"
done
}

TTM "Zip"

apktool(){ java -jar $TOOLS/apktool-2.6.2.jar "$@"; }     
baksmali(){ java -jar $TOOLS/baksmali-2.3.4.jar d "$@"; }     
smali(){ java -jar $TOOLS/smali-2.5.2.jar a "$@"; }     
sudo apt install zipalign >/dev/null








echo '{
"version": "'$Phienban'",
"versionCode": "'$Phienban2'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/Download/VH-MI_'$Phienban'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $GITHUB_WORKSPACE/Up/Up.json

7za a -r -tzip -o $TOME/Zip/Gapps.Zip $TOME/.github/Gapps/*
ls $TOME
