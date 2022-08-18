# KAKATHIC
# Tính năng đặc biệt
# Tự động tắt 1 số tính năng khi cập nhật phiên bản mới.
# So sánh
if [ "$(cat ${0%/*}/OFF)" != "$(grep -m1 'ro.system.build.version.incremental=' /system/build.prop | cut -d = -f2)" ];then
rm -fr ${0%/*}/system/framework
rm -fr ${0%/*}/system/app
rm -fr ${0%/*}/system/priv-app
rm -fr ${0%/*}/system/*/priv-app/Settings
rm -fr ${0%/*}/system/*/priv-app/MiuiSystemUI
rm -fr ${0%/*}/system/vendor/app
fi
