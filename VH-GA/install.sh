# Kakathic

## Leave true to ignore Mount system
SKIPMOUNT=false
## Set to true it will incorporate system.prop into build.prop
PROPFILE=true
## For true post-fs-data.sh to be used
POSTFSDATA=true
## Set to true for service.sh to be used
LATESTARTSERVICE=true

# Internet
chmod 777 $TMPDIR/Loading.sh && $TMPDIR/Loading.sh; . $TMPDIR/1.sh

## Start the installation
on_install(){

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
## code
#Xu_install jre
TTM "/data/local/tmp
$MODPATH/system/product/priv-app"
echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d > $TMPDIR/khi.sh
. $TMPDIR/khi.sh
# Copy file apk
# Dịch vụ gg
Ptkkf=$(echo /*/*/etc/permissions/*cn.google*.xml)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi
ui_print "  Tải về & Cài đặt"
ui_print

[ "$API" -ge 33 ] && API2=33 || API2=$API
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gapp$API2.zip" $TMPDIR/Gapp.zip
[ -e $TMPDIR/Gapp.zip ] && unzip -qo $TMPDIR/Gapp.zip -d $MODPATH || abort "$error"

Checkapp(){ pm path "$1" | grep -m1 base.apk | cut -d : -f2; }

Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" $TMPDIR/Phonesky.apk;
chcon u:object_r:apk_data_file:s0 $TMPDIR/Phonesky.apk;
pm install -r $TMPDIR/Phonesky.apk >&2

if [ ! "$(Checkapp com.google.android.inputmethod.latin)" ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gboard.apk" $TMPDIR/Gboard.apk;
chmod 777 $TMPDIR/Gboard.apk
chcon u:object_r:apk_data_file:s0 $TMPDIR/Gboard.apk;
pm install -r $TMPDIR/Gboard.apk >&2
mkdir -p $MODPATH/system/product/app/Gboard
cp -rf $TMPDIR/Gboard.apk $MODPATH/system/product/app/Gboard

settings put secure autofill_service 'com.google.android.gms/com.google.android.gms.autofill.service.AutofillService'
ime enable com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
fi

Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/calculator.apk" $TMPDIR/calculator.apk;
chcon u:object_r:apk_data_file:s0 $TMPDIR/calculator.apk;
pm uninstall -k com.miui.calculator >&2
pm install -r $TMPDIR/calculator.apk >&2

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
