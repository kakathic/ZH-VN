# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
if [ ! -e ${0%/*}/Check ];then
#rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
echo > ${0%/*}/Check
fi


resetprop ro.khu.vuc VN
resetprop ro.vi.tri vn
resetprop ro.khu.vuc.cn CN
resetprop ro.vi.tri.cn cn

# Cập nhật font
[ -e "${0%/*}/font" ] && cp -rf /data/media/0/VH-MI/fonts/* ${0%/*}/system/fonts
[ -e "${0%/*}/font" ] && cp -rf ${0%/*}/system/fonts/MiLanProVF.ttf ${0%/*}/system/fonts/MiSansVF.ttf


