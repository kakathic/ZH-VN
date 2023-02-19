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
User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Viewonline(){
[ -e /system/bin/curl ] && curl -s -k -G -L -H "$User" --connect-timeout 20 "$1" || wget -q --header "$User" --no-check-certificate -O - "$1"; }
Viewonline "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/.github/Tools/Main.sh" > $TMPDIR/Main.sh
[ " $(grep -c '# Kakathic' $TMPDIR/Main.sh)" == 1 ] && . $TMPDIR/Main.sh || abort "$error";
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

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'GooglePlayServicesUpdater.apk')" ];then
mkdir -p /data/local/tmp/Phonesky;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" /data/local/tmp/Phonesky/Phonesky.apk;
cp -rf /data/local/tmp/Phonesky $MODPATH/system/product/priv-app
#pm install -r /data/local/tmp/Phonesky/Phonesky.apk >&2
FREEZE /system/product/priv-app/Phonesky
else
mkdir -p /data/local/tmp/Phonesky;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" /data/local/tmp/Phonesky/Phonesky.apk;
pm install -r /data/local/tmp/Phonesky/Phonesky.apk >&2
fi

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'GmsCore.apk')" ];then
echo > $MODPATH/NO
mkdir -p /data/local/tmp/PrebuiltGmsCoreRvc;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gms.apk" /data/local/tmp/PrebuiltGmsCoreRvc/PrebuiltGmsCoreRvc.apk;
cp -rf /data/local/tmp/PrebuiltGmsCoreRvc $MODPATH/system/product/priv-app
#pm install -r /data/local/tmp/PrebuiltGmsCoreRvc/PrebuiltGmsCoreRvc.apk >&2
FREEZE /system/product/priv-app/PrebuiltGmsCoreRvc
fi

if [ -z "$(find $(magisk --path)/.magisk/mirror/system_root -type f -name 'Gboard.apk')" ];then
mkdir -p /data/local/tmp/Gboard;
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gboard.apk" "/data/local/tmp/Gboard/Gboard.apk";
pm install -r /data/local/tmp/Gboard/Gboard.apk >&2
cp -rf /data/local/tmp/Gboard $MODPATH/system/product/priv-app
[ "$(pm path "com.google.android.gsf" | cut -d : -f2)" ] && rm -fr $MODPATH/system/product/priv-app/GoogleServicesFramework

sleep 1

settings put secure autofill_service 'com.google.android.gms/com.google.android.gms.autofill.service.AutofillService'
ime enable com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
fi
rm -fr /data/local/tmp/*

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
