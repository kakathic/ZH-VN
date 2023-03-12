# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted

if [ ! -e ${0%/*}/Check ];then
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
echo > ${0%/*}/Check
fi

for fwten in $(find ${0%/*}/framework/*.txt); do
su -mm -c mount -o bind ${fwten%.*} "$(cat $fwten)"
done

for tenapk in $(find ${0%/*}/sys_app/*.txt); do
su -mm -c mount -o bind ${tenapk%.*} "$(cat $tenapk)"
done
