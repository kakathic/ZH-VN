# ZH-VN

Mô-Đun thêm Tiếng Việt cho rom MIUI và mod một số tính năng hay.

Hỗ trợ cả root và không root

## Hướng dẫn cài đặt

Magisk: Module nếu chưa ủng hộ có thể dùng thử ngày trong ngày hôm đó, qua ngày mới sẽ reset máy.

Recovery: Module này ủng hộ trước mới dùng được.

Magisk và Recovery sẽ riêng biệt, nếu bạn muốn dùng cả hai thì phải gửi gấp đôi. Thanks 

[Xem cách ủng hộ](/Support.md)

Nhật ký thay đổi các phiên bản

[Xem lịch sử](/Version.md)

## Xem chi tiết Magisk

Tải Xuống: [MS-VH](https://github.com/kakathic/ZH-VN/releases/tag/MS-1.5)

> **VH-GA**: Thêm bổ sung dịch vụ Google, cửa hàng play, bàn phím, v.v

> **VH-PT**: Crack Miui, hack theme, cài app hệ thống, thời tiết bản global 

> **VH-KE**: Gỡ getapps, bật bàn phím, china mod giữ đa nhiệm, china global chuyển nền china sang global, china global mod giống như china global nhưng cửa hàng theme là china và widget china.

> **VH-ZH**: Thêm Việt hóa widget có thể vh không đủ 100% 1 số widget, Thêm lịch âm , Thêm tiếng Việt, Fix thông báo, Xoá app china không dùng được ở Việt Nam 

## Xem chi tiết Recovery

Tải Xuống: [FL-VH](https://github.com/kakathic/ZH-VN/releases/tag/FL-1.5)

+ Sử dụng: TWRP, FOX v.v để cài module

+ Trước khi flash thì ở điện thoại ấn *#06# hoặc nhớ thêm tài khoản mi để xác nhận.

+ Lưu ý: Rom của bạn phải đã R/W, mới có thể dùng được module 

> **FL-GA**: Gói Gapps thêm đầy đủ dịch vụ Google cơ bản, Có ghi rõ hỗ trợ cho Android khi tải lưu ý, lên cài module này sau khi đã cài module FL-ZH nhớ chọn yes phần xóa app china rác để có nhiều không gian trống tránh lỗi đầy bộ nhớ.

> **FL-PT**: Crack theme, Mod Cài app hệ thống

> **FL-KE**: Gỡ bỏ Getapps, Hiện bàn phím nâng cao cho Gboard, Fix thông báo ở phần china mod, giữ đa nhiệm v.v

> **FL-ZH**: Thêm Tiếng Việt, Font Việt Hóa, Xoá App china rác, Lên cài module này đầu tiên vì nó sẽ xóa app có nhiều không gian trống để thêm những app khác của Google

R/W cho phép xoá, chỉnh sửa file hệ thống, Android 11 trở xuống thì không cần R/W vì rom đã R/W sẵn, còn hầu hết các máy mới android 12 trở nên đều phải R/W hệ thống mới cho phép sửa file hệ thống.

**Tính năng nâng cao**
---

Thêm tiếng việt từng ứng dụng 
   + Để thêm tiếng việt từng ứng dụng hãy làm theo bước sau
   + Lưu ý: Chỉ VH ứng dụng của miui
   + Tạo 1 file ở trong thư mục `/sdcard/VH-MI`
   + Tên là `XList.md`
   + Rồi thêm ứng dụng muốn việt hóa vào đó
   + Ví dụ: `com.android.systemui` nó sẽ việt hóa ứng dụng Giao diện hệ thống
   + `com.android.systemui` là tên gói của ứng dụng đó

Thêm font đã việt hóa
   + Bạn cũng có thể tự thêm font của mình bằng cách vào thư mục sau
   + `/storage/emulated/0/VH-MI/fonts` hoặc `/sdcard/VH-MI/fonts`
   + Hãy đổi tên file font của bạn thành `MiLanProVF.ttf`
   + Module nó sẽ tự nhận diện font
   + Bạn cũng có thể để những file font khác vào thư mục đó.

Chỉnh màu bàn phím nâng cao

   + Vào thư mục sau
   + `/storage/emulated/0/VH-MI/color` hoặc `/sdcard/VH-MI/color`
   + Hãy sửa lại mã màu sáng và tối cho cùng màu với bàn phím 

Việt hóa Widget

   + Hãy lôi widget ra App vault và sử dụng lệnh `su -c Appvault.sh`
   + Nó sẽ tự động việt hóa khi bạn khởi động lại máy nhưng phải bật mạng nha
   + Gõ lệnh như trên thì nó sẽ việt hóa luôn.
   + Sử dụng lệnh ở ứng dụng Termux hoặc bất kỳ ứng dụng cho phép gõ lệnh shell.

**Xem ảnh demo**
---

<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo0.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo1.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo2.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo3.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo4.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo5.jpg" height="auto" width="49%" />
