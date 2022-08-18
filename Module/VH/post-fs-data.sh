# KAKATHIC
API=$(grep -m1 'ro.build.version.sdk=' /system/build.prop | cut -d = -f2)

# Tính năng đặc biệt
# Tự động tắt 1 số tính năng khi cập nhật phiên bản mới.
[ "$API" -ge 31 ] && rm -fr /data/dalvik-cache/*/*framework*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
