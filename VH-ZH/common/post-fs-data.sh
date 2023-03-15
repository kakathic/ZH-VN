# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
#[ "$(getprop ro.product.cpu.abi)" -ge 31 ] && rm -fr /data/dalvik-cache/*
#rm -fr /data/system/package_cache/*
#rm -fr /data/resource-cache/*

resetprop ro.khu.vuc VN
resetprop ro.vi.tri vn
resetprop ro.khu.vuc.cn CN
resetprop ro.vi.tri.cn cn

# Cập nhật font
cp -rf /data/media/0/VH-MI/fonts/* ${0%/*}/system/fonts

