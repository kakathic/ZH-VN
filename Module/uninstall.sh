[ -e ${0%/*}/Global.txt ] && rm -fr /data/miui/* $(find /data/app -name *com.xiaomi.discover*)
rm -fr /data/dalvik-cache/*/*framework* /data/system/package_cache/* /data/resource-cache/* /data/tools/backup
