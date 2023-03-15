# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted

if [ -e /system/framework/arm64/boot-ext.art ] || [ -e /system/framework/arm/boot-ext.oat ];then
mount -o rw,remount / || mount -o rw,remount /
rm -fr /system/framework/arm64/*
rm -fr /system/framework/arm/*
mount -o ro,remount / || mount -o ro,remount /
fi

if [ -e /system/framework/arm64/boot-ext.art ] || [ -e /system/framework/arm/boot-ext.oat ];then
mkdir -p ${0%/*}/system/framework/arm64
mkdir -p ${0%/*}/system/framework/arm
echo > ${0%/*}/system/framework/arm64/.replace
echo > ${0%/*}/system/framework/arm/.replace
fi

if [ ! -e ${0%/*}/Check ];then
rm -fr /data/dalvik-cache/*
#rm -fr /data/system/package_cache/*
#rm -fr /data/resource-cache/*
echo > ${0%/*}/Check
fi

for fwten in $(find ${0%/*}/framework/*.txt); do
su -mm -c mount -o bind ${fwten%.*} "$(cat $fwten)"
done
