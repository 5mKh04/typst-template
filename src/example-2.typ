#import "../docs-template/lib.typ": *

#show: template

#chapter-block(
  1,
  "Ví dụ minh hoạ các thành phần của template",
  [Chương này trình bày cách dùng từng thành phần trong template: tiêu đề, các loại hộp thông tin, phát biểu toán học kèm chứng minh, mã nguồn, hình bảng và góc giải đáp.],
)

#mini-outline(1, (
  (num: "1.1", title: "Tiêu đề, đoạn văn và định dạng chữ", page: 1),
  (num: "1.2", title: "Các hộp thông tin", page: 1),
  (num: "1.3", title: "Phát biểu toán học và chứng minh", page: 2),
  (num: "1.4", title: "Mã nguồn", page: 3),
  (num: "1.5", title: "Bảng và hình có chú thích", page: 3),
  (num: "1.6", title: "Góc giải đáp", page: 4),
))

#section-title("1.1", "Tiêu đề, đoạn văn và định dạng chữ")

Mỗi mục lớn được mở đầu bằng `section-title(số, tiêu đề)`, ví dụ `#section-title("1.1", "Tiêu đề")`. Số mục là chuỗi do bạn tự nhập, và tiêu đề sẽ được tự động viết hoa.

=== Tiêu đề cấp nhỏ

Các tiêu đề cấp 3 viết bằng `=== Tên tiêu đề`. Tiêu đề cấp 1 và cấp 2 (`=` và `==`) bị ẩn, vì đã có `chapter-block` và `section-title` thay thế.

Đoạn văn được căn đều hai bên. Bạn có thể dùng *chữ đậm*, _chữ nghiêng_, và `mã nội dòng` như `so_luong = 5`. Chú thích cuối trang viết bằng `footnote`.#footnote[Bộ đếm chú thích được đặt lại về 0 ở đầu mỗi trang, nên mỗi trang đánh số lại từ 1.]

#section-title("1.2", "Các hộp thông tin")

Bốn loại hộp dưới đây dùng cho những mục đích khác nhau. Tất cả đều nhận nội dung trong cặp ngoặc vuông ở cuối.

=== Hộp ghi chú

`note-box(title: "...")[nội dung]` dùng cho thông tin cần lưu ý thêm.

#note-box(title: "Ghi chú")[
  Biến là một cái tên gắn với một giá trị lưu trong bộ nhớ. Giá trị có thể thay đổi trong lúc chương trình chạy.
]

=== Hộp mở rộng

`enrichment-box(title: "...", bg: màu)[nội dung]` dành cho kiến thức đọc thêm. Tham số `bg` không bắt buộc và mặc định là màu chủ đạo nhạt.

#enrichment-box(title: "Đọc thêm")[
  Một số ngôn ngữ như C++ có thể chặn việc sửa giá trị của hằng số ngay khi biên dịch, còn Python chỉ dựa vào quy ước đặt tên viết hoa.
]

=== Hộp trích dẫn

`quote-box[nội dung]` dành cho một câu nổi bật hoặc lời trích dẫn, chữ nghiêng và căn giữa.

#quote-box[
  Chương trình phải được viết để con người đọc, và chỉ tình cờ để máy tính thực thi.
]

#section-title("1.3", "Phát biểu toán học và chứng minh")

`statement-box(type: "...", number: "...", title: "...")[nội dung]` dùng cho các phát biểu toán học. Tham số `type` nhận một trong sáu giá trị `"axiom"`, `"def"`, `"thm"`, `"prop"`, `"cor"`, `"lemma"`. Cả `number` lẫn `title` đều không bắt buộc, và nếu bỏ `type` thì hộp không có nhãn.

#statement-box(type: "axiom", number: "1.1")[
  Qua hai điểm phân biệt có một và chỉ một đường thẳng.
]

#statement-box(type: "def", number: "1.2")[
  Một số tự nhiên lớn hơn 1 được gọi là _số nguyên tố_ nếu nó chỉ có đúng hai ước dương là $1$ và chính nó.
]

#statement-box(type: "lemma", number: "1.3")[
  Mọi số tự nhiên lớn hơn 1 đều có ít nhất một ước nguyên tố.
]

#statement-box(type: "thm", number: "1.4", title: "(Euclid)")[
  Có vô hạn số nguyên tố.
]

Hàm `proof[nội dung]` đặt ngay sau phát biểu để trình bày chứng minh.

#proof[
  Giả sử chỉ có hữu hạn số nguyên tố $p_1, p_2, dots, p_n$. Xét số
  $ N = p_1 p_2 dots.c p_n + 1. $
  Theo Bổ đề 1.3, $N$ có một ước nguyên tố $p$. Vì $N$ chia cho mỗi $p_i$ đều dư $1$ nên $p$ khác mọi $p_i$, mâu thuẫn với giả thiết. Vậy có vô hạn số nguyên tố.
]

#statement-box(type: "prop", number: "1.5")[
  Tổng của hai số chẵn là một số chẵn.
]

#statement-box(type: "cor", number: "1.6")[
  Không tồn tại số nguyên tố lớn nhất.
]

#section-title("1.4", "Mã nguồn")

Khối mã viết trong cặp ba dấu huyền kèm tên ngôn ngữ. Tên ngôn ngữ hiện ở thanh tiêu đề phía trên, và các dòng được đánh số.

```python
gia_tien = 36000
so_luong = 5
giam_gia = 0.1

tong_tien = gia_tien * so_luong
thanh_toan = tong_tien * (1 - giam_gia)

print("Tiền phải trả:", thanh_toan, "VNĐ")
```

Khi khối mã không khai báo ngôn ngữ, thanh tiêu đề sẽ không xuất hiện.

```
Tiền phải trả: 162000.0 VNĐ
```

#section-title("1.5", "Bảng và hình có chú thích")

Bảng và hình đặt trong `figure` kèm `caption`. Template tắt đánh số tự động, nên nếu cần số thứ tự bạn tự ghi vào chú thích.

#figure(
  table(
    columns: 3,
    align: (left, center, left),
    [*Kiểu dữ liệu*], [*Ví dụ*], [*Dùng để*],
    [Số nguyên], [`42`], [Đếm, đánh số],
    [Số thực], [`3.14`], [Đo lường, tính toán],
    [Chuỗi], [`"xin chào"`], [Lưu văn bản],
  ),
  caption: [Bảng 1.1. Một số kiểu dữ liệu cơ bản.],
)

#section-title("1.6", "Góc giải đáp")

`qna-section[...]` tạo khung "Góc giải đáp". Bên trong dùng `question[...]` cho câu hỏi và `answer[...]` cho câu trả lời.

#qna-section[
  #question[Câu hỏi 1: Khi nào nên dùng hằng số thay cho biến?]
  #answer[Khi giá trị không nên thay đổi trong lúc chương trình chạy, như thuế suất hay số $pi$.]

  #question[Câu hỏi 2: Vì sao `0.1 + 0.2` có thể không bằng `0.3`?]
  #answer[Vì máy tính lưu số thực dưới dạng nhị phân, nhiều số thập phân không biểu diễn chính xác được.]
]
