# Kakathic
# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
API=$(grep -m1 'ro.build.version.sdk=' /system/build.prop | cut -d = -f2)
# Tính năng đặc biệt
# Tự động tắt 1 số tính năng khi cập nhật phiên bản mới.
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
