# Kakathic

# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.

while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
reboot
fi
sleep 1
done
