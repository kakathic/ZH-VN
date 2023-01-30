# Kakathic

ui_print "  Giai nen Gapps"
ui_print " "

# Unpack 
[ "$Tkkg" == 1 ] && unzip -qo "$ZIP" 'lib/*' -d /tmp || abort
chmod -R 755 $TMPI

ui_print "  Cai dat"
ui_print " "

[ "$API" == 32 ] && API=31
[ -e "$TMPI/FL-$API.zip" ] && unzip -qo "$TMPI/FL-$API.zip" -d $TMPI || abort "- Loi khong tim thay Gapps, API: $API"
chmod 755 $TMPI 2>/dev/null

if [ -e $TMPI/product ];then
cp -rf $TMPI/product/* ${Overlay%/*}
fi

if [ -e $TMPI/system_ext ];then
cp -rf $TMPI/system_ext/* $(find /system_ext /*/system_ext /*/*/system_ext -type f 2>/dev/null | head -n1)
fi

# Dịch vụ gg
Ptkkf="$(find /*/etc/permissions/*cn.google*.xml /*/*/etc/permissions/*cn.google*.xml /*/*/*/etc/permissions/*cn.google*.xml -type f 2>/dev/null | head -n1)"
if [ "$(grep -cm1 cn.google.services $Ptkkf)" == 1 ];then
sed -i -e '/cn.google.services/d' -e '/services_updater/d' "$Ptkkf"
fi

fnfnte="${Buildprop%/*}/priv-app/MiBrowser/MiBrowser.apk
/cust/priv-app/MiBrowser/MiBrowser.apk
/cust/app/SogouInput/SogouInput.apk
${Buildprop%/*}/app/SogouInput/SogouInput.apk
"
for kkddx in $fnfnte; do
[ -e "$kkddx" ] && rm -fr ${kkddx%/*}
[ -L "$kkddx" ] && rm -fr ${kkddx%/*}
done

