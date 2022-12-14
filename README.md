# ZH-VN [![VH-MI](https://github.com/kakathic/ZH-VN/actions/workflows/Main.yml/badge.svg)](https://github.com/kakathic/ZH-VN/actions/workflows/Main.yml)

Mô-Đun magisk thêm tiếng việt cho rom MIUI và mod một số tính năng hay.

Lưu ý: Điện thoại phải root và dùng magisk để sử dụng module.

**Hướng dẫn cài đặt**
---

+ Tải về: [VH-MI](https://github.com/kakathic/ZH-VN/releases)

+ Module nếu chưa ủng hộ có thể dùng thử ngày trong ngày hôm đó, qua ngày mới sẽ reset máy.

- [Xem cách ủng hộ](/Web/Support.md)

**Xem chi tiết Mô-đun**
---

**VH-GA**

  > Thêm bổ sung dịch vụ Google, cửa hàng play, bàn phím, v.v

**VH-PT**

  > Crack Miui, hack theme, cài app hệ thống v.v

**VH-KE**

  > Gỡ getapps, bật bàn phím china mod v.v

  > Chưa hỗ trợ Android 13

**VH-ZH**

  > Thêm Việt hóa widget

  > Thêm lịch âm 

  > Thêm tiếng Việt, Fix thông báo

- Lưu ý: Fix thông báo

- Sau khi bạn cài module tất cả ứng dụng trước đó sẽ được thêm vào danh sách fix thông báo nếu như những ứng dụng nào cài sau khi bạn đã flash module thì khởi động lại máy nó sẽ tự động thêm ứng dụng vừa cài vào danh sách fix thông báo.

**Tính năng nâng cao**
---

1. Thêm tiếng việt từng ứng dụng 
   + Để thêm tiếng việt từng ứng dụng hãy làm theo bước sau
   + Lưu ý: Chỉ VH ứng dụng của miui
   + Tạo 1 file ở trong thư mục `/sdcard/VH-MI`
   + Tên là `XList.md`
   + Rồi thêm ứng dụng muốn việt hóa vào đó
   + Ví dụ: `com.android.systemui` nó sẽ việt hóa ứng dụng Giao diện hệ thống
   + `com.android.systemui` là tên gói của ứng dụng đó

2. Thêm font đã việt hóa
   + Bạn cũng có thể tự thêm font của mình bằng cách vào thư mục sau
   + `/storage/emulated/0/VH-MI/fonts` hoặc `/sdcard/VH-MI/fonts`
   + Hãy đổi tên file font của bạn thành `MiLanProVF.ttf`
   + Module nó sẽ tự nhận diện font
   + Bạn cũng có thể để những file font khác vào thư mục đó.

3. Chỉnh màu bàn phím nâng cao

   + Vào thư mục sau
   + `/storage/emulated/0/VH-MI/color` hoặc `/sdcard/VH-MI/color`
   + Hãy sửa lại mã màu sáng và tối cho cùng màu với bàn phím 

4. Việt hóa Widget

   + Hãy lôi widget ra App vault và sử dụng lệnh `su -c Appvault.sh`
   + Nó sẽ tự động việt hóa khi bạn khởi động lại máy nhưng phải bật mạng nha
   + Gõ lệnh như trên thì nó sẽ việt hóa luôn.
   + Sử dụng lệnh ở ứng dụng Termux hoặc bất kỳ ứng dụng cho phép gõ lệnh shell.

**Xem ảnh demo**
---

<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo0.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo1.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo2.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo3.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo4.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo5.jpg" height="auto" width="49%" />
