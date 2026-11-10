#import "../tokens/colors.typ": colors
#import "../tokens/fonts.typ": font-family

#let qna-section(body) = block(width: 100%)[
  #block(
    width: 100%,
    fill: colors.primary,
    radius: 4pt,
    inset: (
      x: 1em,
      y: 0.6em,
    ),
    spacing: 1em,
    text(
      font: font-family.font-sans,
      fill: white,
      weight: "bold",
      upper[Góc giải đáp],
    ),
  )
  #body
]

#let question(body) = block(
  below: 1em,
  text(
    font: font-family.font-serif,
    fill: colors.primary,
    size: 12pt,
    body,
  ),
)

#let answer(body) = block(
  width: 100%,
  inset: (bottom: 0.8em),
  stroke: (bottom: 0.5pt + colors.primary-overlay-40),
  text(
    style: "italic",
    size: 12pt,
    body
  )
)
