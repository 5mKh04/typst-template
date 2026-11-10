#import "../docs-template/lib.typ": *

#show: template

#chapter-block(
  1,
  "Biến số và hằng số",
  [Chương này giới thiệu biến và hằng số, hai công cụ cơ bản để chương trình lưu trữ và sử dụng dữ liệu.],
)

#mini-outline(1, (
  (num: "1.1", title: "Biến số là gì?", page: 1),
  (num: "1.2", title: "Hằng số là gì?", page: 3),
  (num: "1.3", title: "Khai báo biến và hằng số", page: 4),
  (num: "1.4", title: "Tên biến và hằng số", page: 6),
  (num: "1.5", title: "Đọc thêm: Các kiểu đặt tên biến số và hằng số", page: 8),
))

#section-title("1.1", "Biến số là gì?")

=== Đặt vấn đề

Hãy tưởng tượng bạn được giao làm phần mềm quản lý bán hàng cho một quán trà sữa. Ly trà sữa truyền thống có giá `30 000 VNĐ`, và bạn gõ thẳng con số này vào mọi chỗ cần dùng: tính tiền, in hóa đơn, báo cáo doanh thu. Đến khi quán tăng giá lên `36 000 VNĐ`, bạn phải đi tìm và sửa từng con số `30 000` trong chương trình. Chỉ cần sót một chỗ, hóa đơn sẽ tính sai.

```python
print("Giá 1 ly trà sữa là: 30000 VNĐ")
print("Tổng tiền 3 ly là:", 30000 * 3, "VNĐ")
print("Tiền sau khi giảm 10% là:", (30000 * 3) * 0.9, "VNĐ")```

Biến số (gọi tắt là biến) giải quyết vấn đề này bằng cách đặt cho giá trị một cái tên, ví dụ `gia_tien` hay `so_luong`. Khi giá thay đổi hoặc khách mua thêm ly, bạn chỉ cần gán lại giá trị ở một nơi, và mọi phép tính dùng tên đó sẽ tự cập nhật theo.

```python
# Đại diện dữ liệu bằng các tên biến
gia_tien = 36000
so_luong = 5
giam_gia = 0.1  # Giảm 10%

# Các phép tính bên dưới chỉ làm việc với tên biến
tong_tien = gia_tien * so_luong
thanh_toan = tong_tien * (1 - giam_gia)

print("Tổng tiền:", tong_tien, "VNĐ")
print("Tiền phải trả:", thanh_toan, "VNĐ")

# Khi giá hay số lượng thay đổi, bạn chỉ cần sửa giá trị ở các dòng đầu tiên, toàn bộ các dòng tính toán phía dưới sẽ tự động cập nhật đúng.```
