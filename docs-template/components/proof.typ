#import "../tokens/colors.typ": colors

#let proof(body) = block(width: 100%, breakable: true)[
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align: horizon,
    // Căn giữa tất cả các thành phần theo chiều dọc
    // Phần nhãn "Proof." được bo góc và đổ màu nền
    box(
      fill: colors.primary-overlay-40, // Màu nền tím/xanh nhạt giống hình mẫu
      inset: (x: 8pt, y: 4pt), // Khoảng cách đệm bên trong nhãn
      radius: 4pt, // Bo tròn các góc
      outset: (y: 0pt),
      [#text(weight: "medium", size: 0.9em, fill: white)[Chứng minh]],
    ),
    // Đường thẳng nằm ngang kéo dài hết phần còn lại (1fr)
    line(length: 100%, stroke: 0.5pt + colors.stroke-accent-light),
  )

  // Phần nội dung chứng minh nằm ngay dưới nhãn
  #v(4pt)
  #body
]