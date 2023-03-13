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

ui_print "- Cho phép cài đặt Theme bên thứ ba ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP theme)" ];then
Teme=$(GP theme)
ui_print
ui_print2 "Chọn: $Teme"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Teme=$input
fi

ui_print "- Cho phép cài đặt ứng dụng hệ thống ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP caiapk)" ];then
apkcai=$(GP caiapk)
ui_print
ui_print2 "Chọn: $apkcai"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
apkcai=$input
fi

if [ "$(GP modbm2)" ];then
ui_print "- Mod ứng dụng bảo mật tiện hơn ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"


baomat=$(GP modbm)
ui_print
ui_print2 "Chọn: $baomat"
ui_print
#else

ui_print
ui_print2 "1"
Vk 2
baomat=$input
fi

ui_print "- Hiện aqi app thời tiết ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP mglobal)" ];then
ttiet=$(GP mglobal)
ui_print
ui_print2 "Chọn: $ttiet"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
ttiet=$input
fi


if [ "$(GP TKpin2)" ];then
ui_print "- Mod ứng dụng Tiết kiệm pin ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

tietkiem=$(GP TKpin)
ui_print
ui_print2 "Chọn: $tietkiem"
ui_print
#else
ui_print
ui_print2 "1"
Vk 2
tietkiem=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH
Setp ro.product.vip "$(getprop ro.product.device)_global"

## code
Xu_install jre static
Xu_install smali 2.5.2
Xu_install baksmali 2.3.4
Xu_install zipalign static
Xu_install zip static
Xu_install toybox static

sed(){ toybox sed "$@" || busybox sed "$@";}
grep(){ toybox grep "$@" || busybox grep "$@";}
cut(){ toybox cut "$@" || busybox cut "$@";}
find(){ toybox find "$@" || busybox find "$@";}

mkdir -p $APK/tmp /data/tools/apk
eval "$(echo 'JFRlc3QxMjMgfHwgYWJvcnQ=' | base64 -d)"

# Copy file apk
[ "$Teme" == 1 ] && CPapk com.android.thememanager
[ "$apkcai" == 1 ] && CPapk com.miui.packageinstaller
[ "$baomat" == 1 ] && CPapk com.miui.securitycenter
[ "$Teme" == 1 ] && CPapk com.miui.system
if [ "$ttiet" == 1 ];then

for vakkksk in $(echo "$(GP lit)" | tr ',' '\n'); do
CPapk $vakkksk
done
fi

ui_print2 "Giải nén apk"
ui_print
# giải nén file
Giainen
ui_print2 "Chỉnh sửa apk"
ui_print
# Mod theme

if [ "$ttiet" == 1 ];then
for jusjdnnd in $(GP lit); do
if [ "$jusjdnnd" == "com.miui.weather2" ];then
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$(eval "Timkiem weatherapi.market.xiaomi.com $APK/$jusjdnnd/classes*" | head -n1)"
else
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/$jusjdnnd/classes*"
Thaythe "ro.miui.region" "ro.khu.vuc" "$APK/$jusjdnnd/classes*"
Thaythe "ro.product.mod_device" "ro.product.vip" "$APK/$jusjdnnd/classes*"
fi
done
fi

if [ "$apkcai" == 1 ];then
VB="iget p0, p0, Landroid/content/pm/ApplicationInfo;->uid:I"
Thaythe "$VB" "$VB \n const/4 v1, 0x1 \n return v1" "$(eval "Timkiem \"$VB\" $APK/com.miui.packageinstaller/classes*" | head -n1)"

Vsmali ".method public static final c(Landroid/content/pm/ApplicationInfo;)Z" \
".end method" \
'.method public static final c(Landroid/content/pm/ApplicationInfo;)Z
    .registers 3
    const/4 v1, 0x1
    return v1
.end method' \
"$APK/com.miui.packageinstaller/classes*"

Vsmali ".method public static q(Landroid/content/pm/ApplicationInfo;)Z" \
".end method" \
'.method public static q(Landroid/content/pm/ApplicationInfo;)Z
    .registers 3
    const/4 v1, 0x1
    return v1
.end method' \
"$APK/com.miui.packageinstaller/classes*"
fi

if [ "$tietkiem" == 1 ];then
pm clear com.miui.powerkeeper >&2
Bebrb="com/miui/powerkeeper/customerpower
com/miui/powerkeeper/feedbackcontrol
com/miui/powerkeeper/powerchecker
com/miui/powerkeeper/statemachine
com/miui/powerkeeper/ai
com/miui/powerkeeper/bucket
com/miui/powerkeeper/cloudcontrol
com/miui/powerkeeper/millet
com/miui/powerkeeper/ui
com/miui/powerkeeper/utils"

for vhjs in $Bebrb; do
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Lmiui/os/Build;->IS_MIUI:Z" "$APK/com.miui.powerkeeper/classes*/$vhjs/*.smali"
done

Vsmali ".method public static isFeatureOn()Z" \
".end method" \
'.method public static isFeatureOn()Z
    .registers 3
    const/4 v1, 0x0
    return v1
.end method' \
"$APK/com.miui.powerkeeper/classes*/*"

fi

if [ "$Teme" == 1 ];then
Vsmali ".method public isVideoAd()Z" \
".end method" \
'.method public isVideoAd()Z
    .registers 2
    const/4 v0, 0x0
    return v0
.end method' \
"$APK/com.android.thememanager/classes*"

Vsmali ".method private static isAdValid" \
".end method" \
'.method private static isAdValid(Lcom/android/thememanager/basemodule/ad/model/AdInfo;)Z
    .registers 2
    const/4 p0, 0x0
    return p0
.end method' \
"$APK/com.android.thememanager/classes*"

Vsmali ".method public isAuthorizedResource()Z" \
".end method" \
'.method public isAuthorizedResource()Z
    .registers 2
     const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

Vsmali ".method public isCanNotPlay()Z" \
".end method" \
'.method public isCanNotPlay()Z
    .registers 4
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

Vsmali ".method public isProductBought()Z" \
".end method" \
'.method public isProductBought()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

Thaythe "iget-boolean v1, v0, Lcom/android/thememanager/detail/theme/model/OnlineResourceDetail;->bought:Z" "iget-boolean v1, v0, Lcom/android/thememanager/detail/theme/model/OnlineResourceDetail;->bought:Z \n const/4 v0, 0x1 \n return v0" "$APK/com.android.thememanager/classes*"

Thaythe "ro.miui.region" "ro.khu.vuc.cn" "$APK/com.android.thememanager/classes*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "$APK/com.android.thememanager/classes*"
Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "$APK/com.android.thememanager/classes*"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" "$APK/com.android.thememanager/classes*/*"

if [ "$(grep -cm1 'DRM_SUCCESS' $APK/com.miui.system/classes*/miui/drm/DrmManager.smali)" == 1 ];then
Vsmali ".method private static isPermanentRights(Lmiui/drm/DrmManager\$RightObject;)Z" \
".end method" \
'.method private static isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z
    .registers 5
    const/4 v0, 0x1
    return v0
.end method' \
"$APK/com.miui.system/classes*/miui/drm/DrmManager.smali"

Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "$APK/com.miui.system/classes*/miui/drm/DrmManager.smali"
else
rm -fr $APK/com.miui.system*
fi

fi

if [ "$baomat" == 1 ];then
Autoone "Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z" "0x1" "$APK/com.miui.securitycenter/classes*/com/miui/dock/*.smali"

Listbm="com/miui/securityscan
com/miui/securityscan/b0
com/miui/securityscan/cards
com/miui/securityscan/d0
com/miui/securityscan/fileobserver
com/miui/securityscan/model/manualitem
com/miui/securityscan/model/manualitem/defaultapp
com/miui/securityscan/s
com/miui/securityscan/scanner
com/miui/securityscan/u
com/miui/securityscan/ui/main
com/miui/securityscan/ui/settings"

for vkks in $Listbm; do
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x1" "$APK/com.miui.securitycenter/classes*/$vkks/*.smali"
done

Autoone "Lmiui/os/Build;->IS_STABLE_VERSION:Z" "0x1" "$APK/com.miui.securitycenter/classes*/com/miui/permcenter/x/*.smali"
fi

ui_print
ui_print2 "Đóng gói apk"
ui_print
# Đóng gói apk
Donggoi

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
