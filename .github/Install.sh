# kakathic
TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"

TTM(){
for vah in $1; do
[ -e "$TOME/$vah" ] || mkdir -p "$TOME/$vah"
done
}

TTM "Zip
Up"

Taoup(){
Vs=$(grep 'version=' $TOME/.github/$1/module.prop | cut -d = -f2);
Vscode=$(grep 'versionCode=' $TOME/.github/$1/module.prop | cut -d = -f2);
echo '{
"version": "'$Vs'",
"versionCode": "'$Vscode'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/Download/'$1'-'$Vs'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $TOME/Up/$1.json
cat $TOME/Web/Version.md > $TOME/Up/$1.md
cd $TOME/.github/$1
zip -qr "$TOME/Zip/$1-$Vs.Zip" *
}

Taoup VH-PT
Taoup VH-KE
Taoup VH-GA
Taoup ZH-VN

