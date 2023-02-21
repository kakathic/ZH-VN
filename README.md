# ZH-VN

Mô-Đun thêm Tiếng Việt cho rom MIUI và mod một số tính năng hay.

Hỗ trợ cả root và không root

Hỗ trợ Android 11 trở nên

Hỗ trợ từ miui 12.5 đến MIUI mới nhất

## Hướng dẫn cài đặt

Magisk: Nếu chưa ủng hộ có thể dùng thử module `Thêm tiếng việt` 24 giờ.

Recovery: Sắp ra mắt đang thử nghiệm.

Magisk và Recovery sẽ riêng biệt, nếu bạn muốn dùng cả hai thì phải gửi gấp đôi. Thanks 

[Xem cách ủng hộ](/Support.md)

Nhật ký thay đổi các phiên bản

[Xem lịch sử](/Version.md)

## Mô-Đun Magisk

<details>
<br/>

Tải Xuống: [VH-MI](https://github.com/kakathic/ZH-VN/releases/tag/MS-1.6)

> **VH-GA**: Thêm bổ sung dịch vụ Google, cửa hàng play, bàn phím, v.v<br/>

> **VH-PT**: Crack Miui, hack theme, thời tiết bản global <br/>

> **VH-KE**: Cho phép gỡ cài đặt getapps, bật bàn phím, mod miui con lai giữa nền global và china vô số tiện ích hay, fix thông báo, mod tính năng Google photo không giới hạn sau lưu ảnh, 1 số game hỗ trợ fps max 90 120 v.v pupg, tốc chiến v.v<br/>

> **VH-ZH**: Thêm lịch âm , Thêm tiếng Việt, Xoá app china không dùng được ở Việt Nam <br/>

</details>

## Mô-Đun Recovery

Tạm thời dừng hoạt động 

<details>
<br/>

Tải Xuống: [FL-VH](https://github.com/kakathic/ZH-VN/releases/tag/FL-1.6)

+ Sử dụng: TWRP, FOX v.v để cài module

+ Trước khi flash thì ở điện thoại ấn *#06# hoặc nhớ thêm tài khoản mi để xác nhận.

+ Lưu ý: Rom của bạn phải đã R/W, mới có thể dùng được module 

> **FL-GA**: Gói Gapps thêm đầy đủ dịch vụ Google cơ bản, Có ghi rõ hỗ trợ cho Android khi tải lưu ý, lên cài module này sau khi đã cài module FL-ZH nhớ chọn yes phần xóa app china rác để có nhiều không gian trống tránh lỗi đầy bộ nhớ.

> **FL-PT**: Crack theme, Mod Cài app hệ thống

> **FL-KE**: Gỡ bỏ Getapps, Hiện bàn phím nâng cao cho Gboard, Fix thông báo ở phần china mod, giữ đa nhiệm v.v

> **FL-ZH**: Thêm Tiếng Việt, Font Việt Hóa, Xoá App china rác, Lên cài module này đầu tiên vì nó sẽ xóa app có nhiều không gian trống để thêm những app khác của Google

R/W cho phép xoá, chỉnh sửa file hệ thống, Android 11 trở xuống thì không cần R/W vì rom đã R/W sẵn, còn hầu hết các máy mới android 12 trở nên đều phải R/W hệ thống mới cho phép sửa file hệ thống.

</details>

**Tính năng nâng cao**
---

Thêm tiếng việt từng ứng dụng miui

<details>
<br/>

   + Để thêm tiếng việt từng ứng dụng hãy làm theo bước sau
   + Lưu ý: Chỉ VH ứng dụng của miui
   + Tạo 1 file ở trong thư mục `/sdcard/VH-MI`
   + Tên là `XList.md`
   + Rồi thêm ứng dụng muốn việt hóa vào đó
   + Ví dụ: `com.android.systemui` nó sẽ việt hóa ứng dụng Giao diện hệ thống
   + `com.android.systemui` là tên gói của ứng dụng đó

</details>

Thêm font đã việt hóa

<details>
<br/>

   + Bạn cũng có thể tự thêm font của mình bằng cách vào thư mục sau
   + `/storage/emulated/0/VH-MI/fonts` hoặc `/sdcard/VH-MI/fonts`
   + Hãy đổi tên file font của bạn thành `MiLanProVF.ttf`
   + Module nó sẽ tự nhận diện font
   + Bạn cũng có thể để những file font khác vào thư mục đó.

</details>

Chỉnh màu bàn phím nâng cao

<details>
<br/>

   + Vào thư mục sau
   + `/storage/emulated/0/VH-MI/color` hoặc `/sdcard/VH-MI/color`
   + Hãy sửa lại mã màu sáng và tối cho cùng màu với bàn phím 

</details>

Cứu hộ module, hãy cài module Thêm tiếng việt để sử dụng tính năng này

<details>
<br/>

   + Sau khi khởi động lại nếu nó bị đơ
   + Hẫy ấn 3 lần hoặc nhiều hơn cho đến khi hành động được thực hiện
   + Tăng âm lượng +3 mở ứng dụng magisk
   + Giảm âm lượng +3 Tắt toàn bộ module và reboot lại máy
   + Tính năng này sẽ tự hủy nếu bạn vuốt vào màn hình 4 5 lần tùy ý nó sẽ tự tắt 
   + Lưu ý: Nếu bị đơ ít nên chạm vào màn hình mà hãy thực hiện hành động ấn âm lượng như trên để tính năng không bị tắt
   + Nếu bị tắt bạn có thể khởi động lại máy = cách dí phím nguồn và thực hiện lại các hành động bên trên

</details>

Chúc các bạn cài đặt thành công

**Xem ảnh demo**
---

<details>
<br/>

<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo0.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo1.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo2.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo3.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo4.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo5.jpg" height="auto" width="49%" />

</details>
