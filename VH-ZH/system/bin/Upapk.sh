User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive(){ curl -# -k -L -H "$User" --connect-timeout 20 "$1" -o "$2"; }
Xem(){ curl -s -k -G -L -H "$User" --connect-timeout 20 "$1"; }

while true; do
if [ "$(Xem https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/test)" == 1 ];then
break
else
sleep 1
Dnumb=$(($Dnumb + 1))
# Thoát sau 60 lần do xác minh thất bại 
[ "$Dnumb" == 60 ] && exit
fi
done

# Tải dữ liệu 
Taive "https://github.com/kakathic/ZH-VN/releases/download/HH/TT.Zip" "/data/tools/TT.zip"

mkdir -p /data/tools/VH
[ -e "/data/tools/TT.zip" ] && unzip -oq "/data/tools/TT.zip" -d /data/tools/VH || echo "$(date): Tải lỗi File VH"
PVH=/data/adb/modules/VH-ZH
[ -e $PVH/system/product/overlay ] && pathfilevh=$PVH/system/product/overlay || pathfilevh=$PVH/system/vendor/overlay
cp -rf /data/tools/VH/apk/* $pathfilevh
cp -rf /data/tools/VH/framework-miui-res $PVH/system/media/theme/default

# Check lịch âm
if [ -e $PVH/luna ];then
cp -rf /data/tools/VH/notamlich/*.apk $pathfilevh
cp -rf /data/tools/VH/notamlich/framework-miui-res $PVH/system/media/theme/default
fi
