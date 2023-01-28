# Kakathic

ui_print "! Su dung phim am luong"
ui_print "! Vol- = Chon so hien tai, Vol+ = Chuyen doi so."
ui_print "! An nut nguon de huy."
ui_print " "

ui_print "- Cho phep cai dat Theme ben thu ba ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP theme)" ];then
Teme=$(GP theme)
ui_print " "
ui_print2 "Chọn: $Teme"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
Teme=$input
fi

ui_print "- Cho phep cai dat ung dung he thong ?"
ui_print " "
ui_print "  1. Yes"
ui_print "  2. No"

if [ "$(GP caiapk)" ];then
apkcai=$(GP caiapk)
ui_print " "
ui_print2 "Chọn: $apkcai"
ui_print " "
else
ui_print " "
ui_print "  1"
Vk 2
apkcai=$input
fi

ui_print "  Xu ly du lieu"
ui_print " "

# Unpack 
[ "$Tkkg" == 1 ] && unzip -qo "$ZIP" 'lib/*' -d /tmp || abort
tar -xJf $TMPI/Jre.tar.xz -C /tmp
chmod -R 755 $TMPI $TBIN/java $TBIN/keytool

[ "$Teme" == 1 ] && Fapk com.android.thememanager MIUIThemeManager.apk
[ "$apkcai" == 1 ] && Fapk com.miui.packageinstaller MIUIPackageInstaller.apk

ui_print "  Giai nen apk"
ui_print " "

UnApk

ui_print "  Chinh sua apk"
ui_print " "

if [ "$Teme" == 1 ];then
chmod 0731 /data/system/theme
sed -i 's|chmod 0775 /data/system/theme|chmod 0731 /data/system/theme|' /init.miui.rc

Vsmali ".method public isVideoAd()Z" \
".end method" \
'.method public isVideoAd()Z
    .registers 2
    const/4 v0, 0x0
    return v0
.end method' \
"$TAPK/com.android.thememanager/classes*"

Vsmali ".method private static isAdValid" \
".end method" \
'.method private static isAdValid(Lcom/android/thememanager/basemodule/ad/model/AdInfo;)Z
    .registers 2
    const/4 p0, 0x0
    return p0
.end method' \
"$TAPK/com.android.thememanager/classes*"

Vsmali ".method public isAuthorizedResource()Z" \
".end method" \
'.method public isAuthorizedResource()Z
    .registers 2
     const/4 v0, 0x1
    return v0
.end method' \
"$TAPK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

Vsmali ".method public isCanNotPlay()Z" \
".end method" \
'.method public isCanNotPlay()Z
    .registers 4
    const/4 v0, 0x1
    return v0
.end method' \
"$TAPK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

Vsmali ".method public isProductBought()Z" \
".end method" \
'.method public isProductBought()Z
    .registers 2
    const/4 v0, 0x1
    return v0
.end method' \
"$TAPK/com.android.thememanager/classes*/com/android/thememanager/basemodule/resource/model/*"

VA="iget-boolean v1, v0, Lcom\/android\/thememanager\/detail\/theme\/model\/OnlineResourceDetail;->bought:Z"
Thaythe "$VA" "$VA 
const/4 v0, 0x1
return v0" "$TAPK/com.android.thememanager/classes*"

Thaythe "ro.miui.region" "ro.khu.vuc.cn" "$TAPK/com.android.thememanager/classes*"
Thaythe "ro.product.mod_device" "ro.product.modcn" "$TAPK/com.android.thememanager/classes*"
Thaythe "DRM_ERROR_UNKNOWN" "DRM_SUCCESS" "$TAPK/com.android.thememanager/classes*"
Autoone "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "0x0" "$TAPK/com.android.thememanager/classes*/*"
fi

if [ "$apkcai" == 1 ];then
VB="iget p0, p0, Landroid\/content\/pm\/ApplicationInfo;->uid:I"
Thaythe "$VB" "$VB 
const/4 v1, 0x1 
return v1" "$(Timkiem "$VB" "com.miui.packageinstaller/classes*")"

Vsmali ".method public static final c(Landroid\/content\/pm\/ApplicationInfo;)Z" \
".end method" \
'.method public static final c(Landroid\/content\/pm\/ApplicationInfo;)Z
    .registers 3
    const/4 v1, 0x1
    return v1
.end method' \
"$TAPK/com.miui.packageinstaller/classes*"

Vsmali ".method public static q(Landroid\/content\/pm\/ApplicationInfo;)Z" \
".end method" \
'.method public static q(Landroid\/content\/pm\/ApplicationInfo;)Z
    .registers 3
    const/4 v1, 0x1
    return v1
.end method' \
"$TAPK/com.miui.packageinstaller/classes*"
fi

ui_print " "
ui_print "  Dong goi apk"
ui_print " "

RepApk

