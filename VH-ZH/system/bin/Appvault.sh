
VHMI="/sdcard/VH-MI"

while true; do
kkTest="$(/system/bin/curl -s -k -G -L --connect-timeout 20 "https://github.com/kakathic/Tool-Shells/releases/download/View/Test")"
[ "$kkTest" == 1 ] && break || sleep 2
done

echo "
- $(date)

- Tìm kiếm widget
"

Link0='/data/data/com.miui.personalassistant/files/maml/res'
Link1='/data/data/com.miui.personalassistant/files/maml/res/0'
Link2='/sdcard/Android/data/com.android.thememanager/files/maml.widget'

export PATH="/data/tools/bin:$PATH"
#Ten1="${0##*/}"; Ten2="${Ten1%.*}"
sed () { /data/tools/bin/toybox sed "$@"; }
zip () { /data/tools/bin/zip "$@"; }
grep () { /data/tools/bin/toybox grep "$@"; }
cut () { /data/tools/bin/toybox cut "$@"; }

DICHVB(){
Tekk="$(echo "$@" | sed -z -e 's|\n||g' -e "s|'||g" -e "s|&amp;|&|g" -e "s|&#10;|;;|g")"
if [ "$Tekk" == "zh" ] || [ "$Tekk" == "zh_CN" ] || [ "$Tekk" == "M月d日" ] || [ "$Tekk" == "M月d日 Eaa" ] || [ "$Tekk" == "M月d日 E" ] || [ "$Tekk" == "Eaa" ] || [ "$Tekk" == "'aah:mm'" ] || [ "$Tekk" == "小时" ] || [ "$Tekk" == "时" ] || [ "$Tekk" == "分钟" ] || [ "$Tekk" == "分" ];then
echo "$@" | sed -e "s|zh_CN|vi_VN|g" -e "s|zh|vi|g" -e "s|M月d日 Eaa|aa E, dd/MM|g" -e "s|M月d日 E|E, dd/MM|g" -e "s|M月d日|dd/MM|g" -e "s|'aah:mm'|'aa h:mm'|g" -e "s|Eaa|aa E|g" -e "s|Eaa|aa E|g" -e "s|aah:mm|'aa h:mm'|g" -e "s|小时|h |g" -e "s|时|h |g" -e "s|分钟|m |g" -e "s|分|m |g"

else
Trann="$(/system/bin/curl -s -k -G -L --connect-timeout 20 "https://translate.google.com/m?sl=auto&tl=vi&op=translate" --data-urlencode "q=$Tekk" 2>/dev/null | tr '<' '\n' | grep -m1 'class="result-container">' | cut -d '>' -f2)"
Mot="$(echo "$Trann" | cut -c1 | tr 'á' 'Á' | tr 'à' 'À' | tr 'ạ' 'Ạ' | tr 'ả' 'Ả' | tr 'ã' 'Ã' | tr 'ă' 'Ă' | tr 'ắ' 'Ắ' | tr 'ằ' 'Ằ' | tr 'ặ' 'Ặ' | tr 'ẳ' 'Ẳ' | tr 'ẵ' 'Ẵ' | tr 'â' 'Â' | tr 'ấ' 'Ấ' | tr 'ầ' 'Ầ' | tr 'ậ' 'Ậ' | tr 'ẩ' 'Ẩ' | tr 'ẫ' 'Ẫ' | tr 'ú' 'Ú' | tr 'ù' 'Ù' | tr 'ụ' 'Ụ' | tr 'ủ' 'Ủ' | tr 'ũ' 'Ũ' | tr 'ư' 'Ư' | tr 'ứ' 'Ứ' | tr 'ừ' 'Ừ' | tr 'ự' 'Ự' | tr 'ử' 'Ử' | tr 'ữ' 'Ữ' | tr 'ó' 'Ó' | tr 'ò' 'Ò' | tr 'ọ' 'Ọ' | tr 'ỏ' 'Ỏ' | tr 'õ' 'Õ' | tr 'ô' 'Ô' | tr 'ố' 'Ố' | tr 'ồ' 'Ồ' | tr 'ộ' 'Ộ' | tr 'ổ' 'Ổ' | tr 'ỗ' 'Ỗ' | tr 'ơ' 'Ơ' | tr 'ớ' 'Ớ' | tr 'ờ' 'Ờ' | tr 'ợ' 'Ợ' | tr 'ở' 'Ở' | tr 'ỡ' 'Ỡ' | tr 'é' 'É' | tr 'è' 'È' | tr 'ẹ' 'Ẹ' | tr 'ẻ' 'Ẻ' | tr 'ẽ' 'Ẽ' | tr 'ê' 'Ê' | tr 'ế' 'Ế' | tr 'ề' 'Ề' | tr 'ệ' 'Ệ' | tr 'ể' 'Ể' | tr 'ễ' 'Ễ' | tr 'ý' 'Ý' | tr 'ỳ' 'Ỳ' | tr 'ỵ' 'Ỵ' | tr 'ỷ' 'Ỷ' | tr 'ỹ' 'Ỹ' | tr 'í' 'Í' | tr 'ì' 'Ì' | tr 'ị' 'Ị' | tr 'ỉ' 'Ỉ' | tr 'ĩ' 'Ĩ' | tr 'đ' 'Đ' | tr [a-z] [A-Z])"
Toanbo="$(echo $Trann | cut -c2-)"
echo "$Mot$Toanbo" | sed -e 's|;;|\\\&#10;|g' -e 's|\&quot;|"|g' -e 's|\ \.\.\.|...|g' 
#| tee -a /storage/emulated/0/widget/z.txt
fi
}

Fixchina(){
sed -i -e "s|eqs(@lang,'ug_CN')|1|g" -e "s|formatDate('d',#time_sys)+@Th+@th+formatDate(' E',#time_sys)|formatDate('E, d/M',#time_sys)|g" -e "s|ifelse(#textCount==1,@steps+@Mi_steps,#textCount==2,@energy+@Mi_energy,@battery+#batteryLevel+'%'|ifelse(#textCount==1,@steps+' '+@Mi_steps,#textCount==2,@energy+' '+@Mi_energy,@battery+' '+#batteryLevel+'%'|g" -e "s|yyyy年M月  E|EEEE, MM yyyy|g" -e "s|@weekText\[#_i\]|ifelse(#_i==1,'T2',#_i==2,'T3',#_i==3,'T4',#_i==4,'T5',#_i==5,'T6',#_i==6,'T7','CN)|g" -e "s|'已经搬砖这么久','眼睛一闭一睁'|'Ánh sáng trong lành','Quên đi bóng tối'|g" -e "s|'怎么才','怎么就'|'Ahhhh!','Kohhh!'|g" -e "s|'呀','了'|'Sáng','Tối'|g" -e "s|MM/dd E|E dd/MM|g" -e "s|'你真棒'|'Thật tuyệt vời'|g" -e "s|'饮水目标\\\n'+#targetI+'ml\\\n—\\\n'+'单次饮水量\\\n'+#increase+'ml'|'Mục tiêu nước\\\n'+#targetI+'ml\\\n—\\\n'+'Lượng nước\\\n'+#increase+'ml'|g" -e "s|'单击增加\\\n今日喝水量\\\n—','喝水\\\n太少啦\\\n—','是时候\\\n喝水啦\\\n—','今日饮水\\\n目标达成\\\n—'|'Nhấp để uống thêm\\\nnước hôm nay\\\n—','Uống một chút\\\n—','Đến lúc để uống\\\nít nước\\\n—','Uống hôm nay\\\nĐạt mục tiêu\\\n—'|g" \
-e "s|'写OKR'|'Viết OKR'|g" -e "s|'买回家的火车票'|'Nơi yên bình'|g" -e "s|'已经'|'Sẵn sàng'|g" -e "s|'今天'|'Hôm nay'|g" -e "s|M/d|d/M|g" -e "s|YYA年|'Giờ: 'II|g" -e "s|N月e|e.N|g" -e "s|'元旦节'|'Số trong năm'|g" -e "s|' 天'|' Ngày'|g" -e 's|M月/EEEE|EEE, dd/MM yyyy|g' -e 's|"dd"|"D"|g' -e "s|'今天没啥事儿'|'Không có gì!'|g" -e "s|'摸鱼就完了！'|'Kết thúc! '|g" \
-e "s|substr('日一二三四五六',#__i,1)|ifelse(#__i==1,'T2',#__i==2,'T3',#__i==3,'T4',#__i==4,'T5',#__i==5,'T6',#__i==6,'T7','CN)|g" -e 's|MMM月|yyyy|g' -e "s|substr('日一二三四五六',#_i,1)|ifelse(#_i==1,'T2',#_i==2,'T3',#_i==3,'T4',#_i==4,'T5',#_i==5,'T6',#_i==6,'T7','CN)|g" -e "s|'JANUARY'|'Tháng Một'|g" -e "s|'FEBRUARY'|'Tháng Hai'|g" -e "s|'MARCH'|'Tháng Ba'|g" -e "s|'APRIL'|'Tháng Tư'|g" -e "s|'MAY'|'Tháng Năm'|g" -e "s|'JUNE'|'Tháng Sáu'|g" -e "s|'JULY'|'Tháng Bảy'|g" -e "s|'AUGUST'|'Tháng Tám'|g" -e "s|'SEPTEMBER'|'Tháng Chín'|g" -e "s|'OCTOBER'|'Tháng Mười'|g" -e "s|'NOVEMBER'|'Tháng 11'|g" -e "s|'DECEMBER'|'THÁNG 12'|g" \
-e "s|'先定个小目标哦～'|'Đặt mục tiêu nhỏ trước ~'|g" -e "s|'站起来活动活动吧~'|'Đứng lên và di chuyển ~'|g" -e "s|'听说运动会变得更好看呢'|'Tôi nghe nói rằng thể thao sẽ tốt hơn'|g" -e "s|'加油，运动下吧！'|'Nào, chúng ta hãy tập thể dục! '|g" -e "s|'加油！已经消耗了相当于一个冰淇淋的热量！'|'Thôi nào! Đã tiêu thụ một lượng calo tương đương với một cây kem! '|g" -e "s|'消耗了一个鸡腿的热量，再努力一下。'|'Sau khi tiêu thụ hết lượng calo của một chiếc dùi trống, hãy cố gắng nhiều hơn nữa. '|g" -e "s|'一个汉堡的热量不过如此，继续燃烧卡路里吧！'|'Không có gì hơn thế trong một chiếc bánh mì kẹp thịt, hãy tiếp tục đốt cháy calo!'|g" -e "s|'恭喜！已经成功消耗了一顿火锅的热量。'|'Xin chúc mừng! Đã tiêu hao thành công lượng calo của một nồi lẩu. '|g" -e "s|'等减肥成功，一定要去吃一顿大餐。'|'Khi giảm cân thành công, hãy nhớ ăn một bữa lớn. '|g" -e "s|'步'|''|g" -e "s|'今日步数'|'Các bước hôm nay'|g" -e "s|'北京市'|'Vị trí'|g" -e "s|MM-dd|dd-MM|g" \
-e "s|'北京市'|'Vị trí'|g" -e "s|'晴'|'Quang'|g" -e "s|'空气质量：'|'Aqi: '|g" -e "s|'重度污'|'Ô nhiễm nặng'|g" -e "s|'严重污染'|'Quá ô nhiễm'|g" -e "s|'轻度污染'|'Ô nhiễm nhẹ'|g" -e "s|'中度污染'|'Ô nhiễm Vừa'|g" -e "s|'良好'|'Tốt'|g" -e "s|'优'|'Trong lành'|g" -e "s|'日落'|'Hoàng hôn'|g" -e "s|'日出'|'Bình minh'|g" -e "s|待办清单|Những việc cần làm|g" \
"${Lik%/*}/tmp/${qhqtnq##*/}/manifest.xml"
}

for Lik in $(find $Link2/*/meta.json 2>/dev/null); do
#[ -e $Link2/060fd4b1-8f58-4af2-a735-75c33090066a ] && echo > ${Lik%/*}/Vip
kakabs=$(($kakabs + 1))
if [ ! -e "${Lik%/*}/Vip" ];then
version="$(cat "$Lik" | jq -r .versionCode | sed -z 's|\n|\\\\n|g')"
id="$(cat "$Lik" | jq -r .id)"
desc="$(cat "$Lik" | jq -r .descMap.fallback | sed -z 's|\n|\\\\n|g')"
title="$(cat "$Lik" | jq -r .titleMap.fallback | sed -z 's|\n|\\\\n|g')"
author="$(cat "$Lik" | jq -r .authorMap.fallback | sed -z 's|\n|\\\\n|g')"
designer="$(cat "$Lik" | jq -r .designerMap.fallback | sed -z 's|\n|\\\\n|g')"

desc2="$(DICHVB "$desc")"
title2="$(DICHVB "$title")"
author2="$(DICHVB "$author")"
designer2="$(DICHVB "$designer")"
echo "- Widget: $id
"
echo "+ Tiêu đề: $title2
+ Nhà thiết kế: $designer2
+ Tác giả: $author2
+ Giải thích: $desc2
"
echo "- Tiến hành dịch..."

sed -i -e "s|zh_CN|vi_VN|g" -e "s|$desc|$desc2|g" -e "s|$title|$title2|g" -e "s|$designer|$designer2|g" -e "s|$author|$author2|g" "${Lik%/*}/meta.json" "${Lik%/*}/description.xml"
for qhqtnq in "${Lik%/*}"/widget*; do
mkdir -p "${Lik%/*}/tmp/${qhqtnq##*/}"
unzip -qo "$qhqtnq" strings/* var_config.xml manifest*.xml -d "${Lik%/*}/tmp/${qhqtnq##*/}"
mv -f "$qhqtnq" "$qhqtnq".zip
lonu="${Lik%/*}/tmp/${qhqtnq##*/}/strings"
dbebh="${Lik%/*}/tmp/${qhqtnq##*/}/var_config.xml"

if [ -e "$lonu" ] && [ ! -e "$lonu/strings_vi_VN.xml" ];then
if [ -e "$lonu/strings_zh_CN.xml" ];then
cp -rf "$lonu/strings_zh_CN.xml" "$lonu/strings_vi_VN.xml"
else
cp -rf "$lonu/strings.xml" "$lonu/strings_vi_VN.xml"
fi

kkdfgf=$(grep -cm1 'value=' "$lonu/strings_vi_VN.xml")
[ "$kkdfgf" == 1 ] && cat "$lonu/strings_vi_VN.xml" | tr ' ' '\n' | grep 'value=' | cut -d '"' -f2 | awk '{print "="$0"="}' >> "${Lik%/*}/tmp/log"
grep 'name=' "$lonu/strings_vi_VN.xml" | cut -d '>' -f2 | cut -d '<' -f1 | awk '{print "="$0"="}' >> "${Lik%/*}/tmp/log"
while true; do
hrhhrd3="$(grep -m1 '=' "${Lik%/*}/tmp/log" | cut -d '=' -f2)"
if [ "$hrhhrd3" ];then
shdbeh="$(DICHVB $hrhhrd3)"
echo "+ $hrhhrd3 -> $shdbeh"
[ "$kkdfgf" == 1 ] && sed -i -e "s|\"$hrhhrd3\"|\"$shdbeh\"|g" "$lonu/strings_vi_VN.xml"
sed -i -e "s|>$hrhhrd3<|>$shdbeh<|g" "$lonu/strings_vi_VN.xml"
sed -i -e "/=$hrhhrd3=/d" "${Lik%/*}/tmp/log"
else
break
fi
done
fi
if [ -e "$dbebh" ];then
grep 'item' "$dbebh" | cut -d '>' -f2 | cut -d '<' -f1 | awk '{print "+"$0"+"}' >> "${Lik%/*}/tmp/log2"
cat "$dbebh" | tr ' ' '\n' | grep 'displayTitle=' | cut -d '"' -f2 | awk '{print "="$0"="}' >> "${Lik%/*}/tmp/log2"
cat "$dbebh" | tr ' ' '\n' | grep 'des=' | cut -d '"' -f2 | awk '{print "="$0"="}' >> "${Lik%/*}/tmp/log2"
while true; do
evevg="$(grep -m1 '=' "${Lik%/*}/tmp/log2" | cut -d '=' -f2)"
uevevg="$(grep -m1 '₹' "${Lik%/*}/tmp/log2" | cut -d '+' -f2)"
if [ "$evevg" ] || [ "$uevevg" ];then
snwf="$(DICHVB $uevevg)"
echo "+ $uevevg -> $snwf"
[ "$evevg" ] && sed -i -e "s|\"$evevg\"|\"$(DICHVB $evevg)\"|g" "$dbebh"
[ "$uevevg" ] && sed -i -e "s|\>$uevevg\<|\>$snwf\<|g" "$dbebh"
sed -i -e "/=$evevg=/d" -e "/₹$uevevg₹/d" "${Lik%/*}/tmp/log2"
else
break
fi
done
for kssb in $(cat "$dbebh" | tr ' ' '\n' | grep 'maxLength=' | sed 's|>||g'); do
sed -i 's|'$kssb'|maxLength="9999"|g' "$dbebh"
done
for jejr in $(cat "$dbebh" | tr ' ' '\n' | grep 'minLength=' | sed 's|>||g'); do
sed -i 's|'$jejr'|minLength="0"|g' "$dbebh"
done
fi
Fixchina
echo "- ${qhqtnq##*/}..."
cd "${Lik%/*}/tmp/${qhqtnq##*/}"
zip -qr -0 "$qhqtnq".zip *
mv -f "$qhqtnq".zip "$qhqtnq"
done

cd "${Lik%/*}"
zip -qr "${Lik%/*}.zip" widget* description.xml
echo "- Xoá rác
"
rm -fr "${Lik%/*}/tmp"
echo > "${Lik%/*}/Vip"
if [ -e "$Link1/$id/$version/$id" ];then
cp -rf ${Lik%/*}/* $Link1/$id/$version/$id
cp -rf ${Lik%/*}.zip $Link1/$id/$version
fi
fi

done
echo "- Tổng kho $kakabs widget, đã dịch xong"

# Dịch widget mặc định
if [ -e $Link0/b8006e83-c497-4642-9815-f674b82842b0 ];then
linkw1="$Link0/b8006e83-c497-4642-9815-f674b82842b0"
if [ ! -e "$linkw1/Vip" ];then
echo > $linkw1/Vip
mv $linkw1/widget_2x2 $linkw1/widget_2x2.zip
unzip -qo $linkw1/widget_2x2.zip strings/strings_en_US.xml -d "$linkw1"
mv $linkw1/strings/strings_en_US.xml $linkw1/strings/strings_vi_VN.xml
sed -i -e "s|Tap to get weather info|Nhấn để nhận thông tin thời tiết|" $linkw1/strings/strings_vi_VN.xml
cd "$linkw1"
zip -qr -0 $linkw1/widget_2x2.zip strings/strings_vi_VN.xml
mv -f $linkw1/widget_2x2.zip $linkw1/widget_2x2
rm -fr strings
fi

linkw2="$Link0/a71db3f8-fc64-428c-8a80-5d11cf75be09"
if [ ! -e "$linkw2/Vip" ];then
echo > $linkw2/Vip
mv $linkw2/widget_2x2 $linkw2/widget_2x2.zip
unzip -qo $linkw2/widget_2x2.zip manifest.xml strings/strings_en_US.xml -d "$linkw2"
mv $linkw2/strings/strings_en_US.xml $linkw2/strings/strings_vi_VN.xml
sed -i -e "s|Occupied RAM|RAM chiếm dụng|" -e "s|Boosting speed|Tăng tốc độ|" -e "s|Freed up SLOT of RAM|Giải phóng SLOT RAM|" -e "s|Boosted successfully|Đã tăng cường thành công|" -e "s|Everything looks good!|Mọi thứ trông có vẻ tốt!|" -e "s|Hey!|Này!|" -e "s|Please!|Xin vui lòng!|" -e "s|Whatever|Sao cũng được|" -e "s|en_US|vi_VN|" -e "s|Boost speed|Tăng tốc độ|" $linkw2/strings/strings_vi_VN.xml
sed -i -e "s|eqs(@lang,'ug_CN')|1|" $linkw2/manifest.xml
cd "$linkw2"
zip -qr -0 $linkw2/widget_2x2.zip manifest.xml strings/strings_vi_VN.xml
mv -f $linkw2/widget_2x2.zip $linkw2/widget_2x2
rm -fr manifest.xml strings
fi
fi
#killall com.miui.home
killall com.miui.personalassistant 2>/dev/null
