#import "../tokens/colors.typ": colors
#import "../tokens/fonts.typ": font-family


#let chapter-block(number, title, abstract) = {
  v(1.5em)

  grid(
    columns: (auto, 4pt, 1fr),
    column-gutter: 18pt,
    row-gutter: 14pt,
    // Hàng 1: số + (bar bắt đầu) + tiêu đề
    align(horizon, text(
      size: 52pt,
      weight: "light",
      fill: colors.primary,
      font: font-family.font-sans,
      [#number]
    )),
    grid.cell(
      rowspan: 2,
      fill: colors.primary,
    )[], // thanh dọc kéo dài qua cả 2 hàng
    align(horizon, text(
      size: 26pt,
      weight: "bold",
      fill: colors.primary,
      font: font-family.font-sans,
      title
    )),

    // Hàng 2: ô trống (dưới số) + tóm tắt chương
    [],
    par(
      leading: 0.75em,
      justify: true,
      [
        #text(style: "italic", weight: "medium", [Giới thiệu chương: ])
        #abstract
      ]
    ),
  )

  v(1.5em)
}