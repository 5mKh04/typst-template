#import "../tokens/colors.typ": colors
#import "../tokens/fonts.typ": font-family

#let section-title(number, title) = {
  let bar-height = 24pt // chiều cao thanh nền xám
  let chip-size = 36pt // chip số LỚN HƠN bar-height -> tự tràn ra 2 đầu

  v(0.8em)
  box(width: 100%, height: bar-height)[
    // Thanh nền xám
    #box(
      width: 100%,
      height: 100%,
      fill: colors.primary-overlay-90,
      radius: 4pt,
    )

    // Ô số — place() đè lên nền, canh giữa theo chiều dọc container
    // vì chip-size > bar-height nên nó tự tràn đều lên trên & xuống dưới
    #place(
      left + horizon,
      dx: 10pt,
      box(
        width: auto,
        height: chip-size,
        inset: (x: 8pt),
        fill: colors.primary,
        radius: 6pt,
      )[
        #align(center + horizon)[
          #text(
            font: font-family.font-sans,
            fill: white,
            weight: "bold",
            size: 14pt,
            [#number],
          )
        ]
      ],
    )

    // Tiêu đề — dời sang phải để chừa chỗ cho chip
    #place(
      left + horizon,
      dx: 6pt + chip-size + 6pt,
      text(
        font: font-family.font-sans,
        fill: colors.text-primary,
        weight: "light",
        size: 12pt,
        tracking: 0.4pt,
        upper(title),
      ),
    )
  ]
  v(0.8em)
}