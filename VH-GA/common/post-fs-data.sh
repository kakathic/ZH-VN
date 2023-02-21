# Kakathic

# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
[ "$(getprop ro.product.cpu.abi)" -ge 31 ] && rm -fr /data/dalvik-cache/*/*framework*
rm -fr /data/system/package_cache/* /data/resource-cache/*
