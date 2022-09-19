# Kakathic

# Home module magisk
MODPATH="${0%/*}"
. $MODPATH/Tools.sh

# Automatically turn off the module if 100 seconds wait at the logo
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ] && [ "$API" -ge 30 ];then
echo > $MODPATH/disable
reboot
fi
sleep 1
done

# Code
chmod 731 /data/system/theme
