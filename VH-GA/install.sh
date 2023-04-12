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

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
ui_print "! Ấn nút nguồn để hủy."
ui_print

ui_print "- Cài đặt gói gapp dịch vụ Google ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP gapp)" ];then
gapps=$(GP gapp)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
gapps=$input
fi

ui_print "- Cài đặt gói dịch vụ Google play ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP chplay)" ];then
chplays=$(GP chplay)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
chplays=$input
fi

ui_print "- Cài đặt gói dịch vụ bàn phím Google?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP gbphim)" ];then
gbphims=$(GP gbphim)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
gbphims=$input
fi

ui_print "- Cài đặt ứng dụng máy tính Mi ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP mtmi)" ];then
mtmis=$(GP mtmi)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
mtmis=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
## code

# Copy file apk
# Dịch vụ gg
Ptkkf=$(find /*/*/etc/permissions/*cn.google*.xml /*/etc/permissions/*cn.google*.xml /etc/permissions/*cn.google*.xml | head -n1)
if [ -e $Ptkkf ];then
mkdir -p $MODPATH${Ptkkf%/*}
cp -rf $Ptkkf $MODPATH${Ptkkf%/*}
sed -i -e '/cn.google.services/d' -e '/services_updater/d' $MODPATH$Ptkkf
fi
ui_print "  Tải về & Cài đặt"
ui_print
evol "WyAiJFRlc⁰QxMjMiID⁵³IHRydWUgXSB⁴fCBhYm³ydAo="
Checkapp(){ pm path "$1" | grep -m1 base.apk | cut -d : -f2; }

if [ "$gapps" == 1 ];then
[ "$API" -ge 33 ] && API2=33 || API2=$API
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gapp$API2.zip" $TMPDIR/Gapp.zip
[ -e $TMPDIR/Gapp.zip ] && unzip -qo $TMPDIR/Gapp.zip -d $MODPATH || abort "$error"
fi


if [ "$chplay" == 1 ];then
pm enable com.google.android.gms >&2
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Chplay.apk" $TMPDIR/Phonesky.apk;
chcon u:object_r:apk_data_file:s0 $TMPDIR/Phonesky.apk;
pm install -r $TMPDIR/Phonesky.apk >&2
settings put secure autofill_service 'com.google.android.gms/com.google.android.gms.autofill.service.AutofillService'
fi

if [ "$gbphims" == 1 ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/Gboard.apk" $TMPDIR/Gboard.apk;
chmod 777 $TMPDIR/Gboard.apk
chcon u:object_r:apk_data_file:s0 $TMPDIR/Gboard.apk;
pm install -r $TMPDIR/Gboard.apk >&2
mkdir -p $MODPATH/system/product/app/Gboard
cp -rf $TMPDIR/Gboard.apk $MODPATH/system/product/app/Gboard
ime enable com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME >&2
fi

if [ "$mtmis" == 1 ];then
Taive "https://github.com/kakathic/ZH-VN/releases/download/Gapps/calculator.apk" $TMPDIR/calculator.apk;
chcon u:object_r:apk_data_file:s0 $TMPDIR/calculator.apk;
pm uninstall -k com.miui.calculator >&2
pm install -r $TMPDIR/calculator.apk >&2
fi

for Bala in product vendor etc system_ext; do
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
