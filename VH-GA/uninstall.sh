# kakathic
[ -e ${0%/*}/NO ] && rm -fr $(find /data/app -name *com.android.vending*) $(find /data/app -name *com.google.android.gms*)
rm -fr /data/system/package_cache/* /data/resource-cache/*

