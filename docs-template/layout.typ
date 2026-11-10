#import "tokens/colors.typ": colors
#import "tokens/fonts.typ": font-family
#import "@preview/codly:2.0.0" as codly

#let template(body) = {
  set page(
    paper: "a4", // Cấu hình kích thước giấy A4 cho toàn bộ trang
    margin: (x: 2cm, y: 1.8cm), // Lề (trái/phải 2cm, trên/dưới 1.8cm)
    header: context {
      counter(footnote).update(0) // Đặt lại bộ đếm chú thích cuối trang về 0 ở mỗi trang mới
    },
  )

  set text(
    font: font-family.font-serif, // Dùng font có chân cho văn bản chính
    size: 11pt, // Cỡ chữ nội dung
    lang: "vi", // Cấu hình ngôn ngữ tiếng Việt để sửa lỗi dấu câu nếu có
    fill: colors.text-primary, // Màu chữ chính lấy từ bộ màu chung
  )

  set par(
    justify: true, // Căn chỉnh văn bản đều hai bên (justify) cho toàn bộ nội dung
    leading: 0.72em, // Dãn dòng
    spacing: 1.44em, // Khoảng cách giữa các đoạn
    linebreaks: "optimized", // Tối ưu cách ngắt dòng để tránh các dòng quá thưa
  )

  // Vì đã có các box thay thế heading nên sẽ ẩn các heading cấp 1, 2 trong toàn bộ nội dung
  show heading.where(level: 1).or(heading.where(level: 2)): none

  // Heading cấp 3: in đậm, cỡ chữ lớn hơn nội dung và dùng màu chủ đạo
  show heading.where(level: 3): set text(
    weight: "bold",
    size: 14pt,
    fill: colors.primary,
  )
  // Khoảng cách giữa heading cấp 3 và đoạn văn bên dưới
  show heading.where(level: 3): set block(below: 1.4em)

  // Định dạng lại dấu trích dẫn (Cỡ chữ nhỏ và đưa lên trên dạng số mũ)
  show cite: set text(size: 0.75em)
  show cite: it => super(it)

  // Chỉnh lại kích thước chữ và bộ đếm số trong caption
  show figure.caption: set text(size: 0.8em) // Caption nhỏ hơn nội dung chính
  show figure: set figure(numbering: none) // Bỏ đánh số tự động ("Hình 1", "Bảng 2"...)

  // Chọn theme màu Catppuccin Latte cho code và dùng font monospace
  set raw(theme: "tokens/catppuccin-latte.tmTheme")
  show raw: set text(font: font-family.font-mono)

  // Cấu hình codly (thư viện hiển thị số dòng và khung cho code block)
  show: codly.theme("github-light", accent: colors.primary) // Dùng theme sáng, màu nhấn theo màu chủ đạo
  show: codly.set_(radius: 3pt) // Bo góc khung code
  show: codly.lang-set_(display-name: false) // Tắt nhãn ngôn ngữ mặc định của codly vì đã tự vẽ ở dưới

  // Code block
  show raw.where(block: true): it => block(
    width: 100%,
    stroke: 0.6pt + colors.stroke-lighter,
    radius: 3pt,
    clip: true, // Cắt phần nội dung tràn ra ngoài góc bo
    {
      set block(spacing: 0pt) // Bỏ khoảng cách giữa thanh tiêu đề và phần code
      // Chỉ hiển thị thanh tiêu đề khi code block có khai báo ngôn ngữ
      if it.lang != none {
        block(
          width: 100%,
          fill: colors.bg-code-header, // Nền riêng cho thanh tiêu đề
          inset: (y: 6pt), // Đệm trên/dưới cho tên ngôn ngữ
          align(center, text(size: 0.85em, fill: colors.text-secondary, it.lang)), // Tên ngôn ngữ căn giữa, chữ nhỏ và nhạt
        )
      }
      codly.new(it) // Phần code bên dưới được codly xử lý (số dòng, tô màu)
    },
  )

  // Code nội dòng (inline)
  show raw.where(block: false): it => box(
    fill: colors.bg-code,
    stroke: 0.3pt + colors.stroke-accent-light,
    radius: 3pt,
    inset: (x: 3pt), // Đệm hai bên để chữ không dính sát viền
    outset: (y: 3pt), // Nới khung theo chiều dọc mà không làm tăng chiều cao dòng
    it,
  )

  body
}