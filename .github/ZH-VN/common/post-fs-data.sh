# Kakathic
# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh

# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
rm -fr /data/system/package_cache/* /data/resource-cache/*
