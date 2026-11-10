#import "../tokens/colors.typ": colors

#let quote-box(body) = {
  let border-color = colors.primary-darker
    v(-0.84em)
  block(
    width: 100%,
    breakable: false, // Tránh việc box bị cắt đôi khi sang trang mới
    inset: (top: 15pt, bottom: 15pt),
    [
      // 1. Khung viền chính bo góc
      #rect(
        width: 100%,
        stroke: 1.5pt + border-color,
        radius: 8pt,
        inset: (x: 24pt, y: 20pt),
        fill: none,
        [
          #set text(style: "italic")
          #align(center)[#body]
        ]
      )
      
      // 2. Dấu nháy kép MỞ ở góc trên bên trái
      #place(
        top + left,
        dx: 12pt,
        dy: -6pt,
        block(
          fill: white, // Đổ nền trắng để che đường viền bên dưới đi
          inset: (x: 4pt),
          text(font: "Georgia", size: 36pt, weight: "bold", fill: border-color, [“])
        )
      )
      
      // 3. Dấu nháy kép ĐÓNG ở góc dưới bên phải
      #place(
        bottom + right,
        dx: -12pt,
        dy: 16pt,
        block(
          fill: white, // Đổ nền trắng để che đường viền bên dưới đi
          inset: (x: 4pt, y: -4pt),
          text(font: "Georgia", size: 36pt, weight: "bold", fill: border-color, [”])
        )
      )
    ]
  )
  v(-1.28em)
}