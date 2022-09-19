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
Vs=$VS;
Vscode=${VS//./};
echo "
versionCode=$Vscode
version=$Vs
" >> $TOME/$1/module.prop
echo '{
"version": "'$Vs'",
"versionCode": "'$Vscode'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/'$Vs'/'$1'-'$Vs'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $TOME/Up/$1.json
cd $TOME/$1
zip -qr "$TOME/Zip/$1-$Vs.Zip" *
}

Taoup VH-PT
Taoup VH-KE
Taoup VH-GA
Taoup VH-ZH

