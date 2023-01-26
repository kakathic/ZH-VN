# Kakathic

ui_print "! Su dung phim am luong"
ui_print "! Vol- = Chon so hien tai, Vol+ = Chuyen doi so."
ui_print "! An nut nguon de huy."
ui_print " "

ui_print "- Them Tieng Viet vao rom ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP VH)" ];then
VHI=$(GP VH)
ui_print " "
ui_print "  Chon: $VHI"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
VHI=$input
fi

ui_print "- Them lich am ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP Licham2)" ];then
Licham=$(GP Licham2)
ui_print " "
ui_print "  Chon: $Licham"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
Licham=$input
fi

ui_print "- Su dung Font chu Viet hoa ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP fontchu)" ];then
fontvh=$(GP fontchu)
ui_print " "
ui_print "  Chon: $fontvh"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
fontvh=$input
fi

ui_print "- Go cai dat app china rac ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP Appchina)" ];then
goappcn=$(GP Appchina)
ui_print " "
ui_print "  Chon: $goappcn"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
goappcn=$input
fi

# Unpack 
[ "$Tkkg" == 1 ] && unzip -qo "$ZIP" 'lib/*' -d /tmp || abort
chmod -R 755 $TMPI

# Gỡ cài đặt app
if [ "$goappcn" == 1 ];then
for kkddx in $(cat $TMPI/RM.ini); do
[ -e "$kkddx" ] && rm -fr ${kkddx%/*}
[ -L "$kkddx" ] && rm -fr ${kkddx%/*}
done
fi

# Thêm tiếng Việt 
if [ "$VHI" == 1 ];then
ui_print "  Cai tieng viet"
ui_print " "
#sed -i -e "s/en-US/vi-VN/g" -e "s/zh-CN/vi-VN/g" /data/system/*/*/settings_system.xml
XHex /data/system/*/*/settings_system.xml | sed -e "s/$(echo -n "en-US" | XHex)/$(echo -n "vi-VN" | XHex)/g" | ZHex > $TMPI/settings_system.xml
XHex /data/system/*/*/settings_system.xml.fallback | sed -e "s/$(echo -n "en-US" | XHex)/$(echo -n "vi-VN" | XHex)/g" | ZHex > $TMPI/settings_system.xml.fallback
shebdb="$(echo /data/system/*/*/settings_system.xml)"
cp -f $TMPI/settings_system.* ${shebdb%/*}
if [ "$Licham" != 1 ];then
cp -rf $TMPI/notamlich/*.apk $TMPI/apk
cp -rf $TMPI/notamlich/framework-miui-res $TMPI
fi
[ -e $TMPI/framework-miui-res ] && cp -f $TMPI/framework-miui-res /*/media/theme/default
if [ -e "$VHMI/XList.md" ];then
for vahdbff in $(cat "$VHMI/XList.md"); do
cp -f "$TMPI/apk/Zz.$vahdbff.apk" $Overlay
done
else
cp -f $TMPI/apk/* $Overlay
fi
# VHI
fi

# Lịch âm
if [ "$Licham" == 1 ];then
ui_print "  Cai lich am"
ui_print " "
cp -rf $TMPI/apk/*com.android.systemui*.apk $Overlay
cp -rf $TMPI/framework-miui-res /*/media/theme/default
fi

# font
if [ "$fontvh" == 1 ];then
ui_print "  Cai Font"
ui_print " "
[ -e "$VHMI/fonts/MiLanProVF.ttf" ] && cp -rf $VHMI/fonts/* $TMPI/fonts
for iki in MiLanProVF.ttf MiSansVF.ttf RobotoVF.ttf Roboto-Regular.ttf; do
rm -fr /system/fonts/$iki
done
cp -rf $TMPI/fonts/* /system/fonts
cd /system/fonts
for iki in MiSansVF.ttf RobotoVF.ttf Roboto-Regular.ttf; do
ln -sf MiLanProVF.ttf $iki
done
cd /
fi

# Fix dc
Ksdjn="$(find /*/etc/device_features/*.xml /*/*/etc/device_features/*.xml | head -n1)"
if [ -e "$Ksdjn" ] && [ "$(GB ro.product.system.device)" == "raphael" ];then
sed -i 's|<bool name="support_dc_backlight">true</bool>|<bool name="support_dc_backlight">false</bool>|' "$Ksdjn"
fi

