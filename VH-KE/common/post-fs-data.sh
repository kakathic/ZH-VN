# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted

if [ ! -e ${0%/*}/Check ];then
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
echo > ${0%/*}/Check
fi

for fwten in $(find ${0%/*}/framework/*.txt); do
su -mm -c mount -o bind ${0%/*}/framework/${fwten%.*} "$(cat $fwten)"
done

for tenapk in $(find ${0%/*}/app/*.txt); do
chcon u:object_r:apk_data_file:s0 ${0%/*}/app/${tenapk%.*}
su -mm -c mount -o bind ${0%/*}/app/${tenapk%.*} "$(cat $tenapk)"
done
