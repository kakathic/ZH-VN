# kakathic
TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"

TTM(){
for vah in $1; do
[ -e $vah ] || mkdir -p "$TOME/$vah"
done
}

TTM "Zip
Up"

apktool(){ java -jar $TOOLS/apktool-2.6.2.jar "$@"; }     
baksmali(){ java -jar $TOOLS/baksmali-2.3.4.jar d "$@"; }     
smali(){ java -jar $TOOLS/smali-2.5.2.jar a "$@"; }     
sudo apt install zipalign >/dev/null

Taoup(){
Vs=$(grep 'version=' $TOME/.github/$1/module.prop | cut -d = -f2);
Vscode=$(grep 'versionCode=' $TOME/.github/$1/module.prop | cut -d = -f2);
echo '{
"version": "'$Vs'",
"versionCode": "'$Vscode'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/Download/'$1'_'$Vs'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $TOME/Up/$1.json
7za a -r -tzip '$TOME/Zip/'$1'_'$Vs'.Zip' $TOME/.github/$1/*
}

Taoup Gapps
Taoup Getapps
Taoup Pinstaller
Taoup Theme
Taoup ZH-VN
