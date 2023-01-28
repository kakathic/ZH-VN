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
Vscode=${VA//./};
echo "
versionCode=$Vscode
version=$VA
" >> $TOME/$1/module.prop
echo '{
"version": "'$VA'",
"versionCode": "'$Vscode'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/'$VA'/'$1'-'$VA'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $TOME/Up/$1.json
cd $TOME/$1
zip -qr "$TOME/Zip/$1-$VA.Zip" *
}

Taoup VH-PT
Taoup VH-KE
Taoup VH-GA
Taoup VH-ZH

