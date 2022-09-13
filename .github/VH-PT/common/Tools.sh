# Kakathic
ui_print(){ echo "$1"; sleep 0.005; }
ui_print2(){ echo "  $1"; }
Xan(){ echo "  $1" >&2; }
BatdauT=$(date +%s)

# Volume keys
Vk(){ 
input2="$1"; input=1
Kgg(){ 
Key="$(getevent -qlc 1 | awk '{print $3}')"
if [ "$Key" == "KEY_POWER" ];then
abort
elif [ "$Key" == "KEY_VOLUMEUP" ];then
[ "$input" == "$input2" ] && input=1 || input=$(($input + 1))
ui_print "  $input"
sleep 0.3
Kgg
elif [ "$Key" == "KEY_VOLUMEDOWN" ];then
ui_print
ui_print "  $chon: $input"
ui_print
sleep 0.3
else Kgg; fi; }
Kgg
}

# Count time 
End_time(){
KetthucT=$(date +%s)
TongTG=$(($KetthucT - $BatdauT))
Gio=$(printf '%d' $((TongTG/3600%24)))
Phut=$(printf '%d' $((TongTG/60%60)))
if [ "$Gio" != 0 ];then
echo "$time: $(printf '%d '$h', %d '$m', %d '$s'.' $((TongTG/3600%24)) $((TongTG/60%60)) $((TongTG%60)))"
elif [ "$Phut" != 0 ];then
echo "$time: $(printf '%d '$m', %d '$s'.' $((TongTG/60%60)) $((TongTG%60)))"
else
echo "$time: $(printf '%d '$s'.' $((TongTG%60)))"
fi
}

# Download packages
Xu_install(){
[ "$2" ] && pb="_$2"
if [ ! -e "/data/tools/ck/$1$pb" ];then
ui_print "  $load $1..."
ui_print
Taive "https://github.com/kakathic/Tools/raw/Vip/Library/$1/README.md" "$TMPDIR/$1.sh"
[ "$(grep -icm1 '#\ kakathic' $TMPDIR/$1.sh)" == 1 ] && chmod 777 "$TMPDIR/$1.sh" || abort "$error"
cd /data/tools
. "$TMPDIR/$1.sh"
chmod -R 777 /data/tools/bin
rm -fr $HOME/tmp/*
fi
unset pb
}

# Internet
User="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
Taive(){
[ -e /system/bin/curl ] && curl -s -k -L -H "$User" --connect-timeout 20 "$1" -o "$2" || wget -q --header "$User" --no-check-certificate "$1" -O "$2" >&2
}
Xem(){
[ -e /system/bin/curl ] && curl -s -k -G -L -H "$User" --connect-timeout 20 "$1" || wget -q --header "$User" --no-check-certificate -O - "$1"
}
# Freeze
FREEZE(){
for TARGET in $1; do
[ -e "$1" ] && mktouch $MODPATH$TARGET/.replace
done
}

GP () { grep_prop $1 $TMPDIR/module.prop; }

API=$(getprop ro.build.version.sdk)
ABI=$(getprop ro.product.cpu.abi)

if [ "$ABI" = "x86" ]; then
export ARCH=x86
export ARMT=i686
elif [ "$ABI" = "arm64-v8a" ]; then
export ARCH=arm64
export ARMT=arm64
elif [ "$ABI" = "x86_64" ]; then
export ARCH=x64
export ARMT=x86-64
else
export ARMT=arm
export ARCH=arm
export ABI=armeabi-v7a
fi

TTM(){
for vah in $1; do
[ -e $vah ] || mkdir -p "$vah"
done
}

TTM "/data/tools/bin
/data/tools/ck
/data/tools/tmp
/data/tools/lib/Tools"

unset vah
unset mklist

export PATH="/data/tools/bin:$PATH"
export HOME="/data/tools"
