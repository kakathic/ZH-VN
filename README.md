# ZH-VN [![VH-MI](https://github.com/kakathic/ZH-VN/actions/workflows/Main.yml/badge.svg)](https://github.com/kakathic/ZH-VN/actions/workflows/Main.yml)

Mô-Đun magisk thêm tiếng việt cho rom china gốc và mod một số tính năng hay.

**Hướng dẫn cài đặt**
---

- Tải về [VH-MI](https://github.com/kakathic/ZH-VN/releases)

  > **VH-GA:** Cài Gapps, thêm dịch vụ Google 

  > **VH-PT:** Crack Miui, hack theme, cài app hệ thống v.v, chưa hỗ trợ Android 13

  > **VH-KE:** Các tính năng nâng cao, bật bàn phím china mod v.v, chưa hỗ trợ Android 13

  > **VH-ZH:** Thêm tiếng Việt, Fix thông báo

- Để fix thông báo chiệt để hãy cài Modun `ZH-VN` và `VH-PT` và `VH-KE`

  + Ở VH-ZH không cần chọn gì cũng fix thông báo

  + Ở VH-PT nhớ chọn phần Mod tiết kiệm pin và bảo mật cẩn thận bị treo

  + Ở VH-KE chọn china mod

**Hỗ trợ mô-đun**
---

- Để mô-đun hỗ trợ lâu dài mỗi thiết bị khi sử dụng phải ủng hộ 10k để sử dụng vĩnh viễn.

- [Xem chi tiết](/Web/Support.md)

**Tính năng của VH-MI**
---

1. Thêm tiếng việt
   + Để thêm tiếng việt từng ứng dụng hãy làm theo bước sau
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

**Xem ảnh demo**
---

<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo0.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo1.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo2.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo3.jpg" height="auto" width="49%" />
<img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo4.jpg" height="auto" width="49%" /> <img src="https://github.com/kakathic/ZH-VN/releases/download/Test-Vip/Demo5.jpg" height="auto" width="49%" />
