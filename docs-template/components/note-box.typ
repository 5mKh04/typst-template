#import "../tokens/colors.typ": colors

#let note-box(title: none, body) = block(
  width: 100%,
  stroke: (
    rest: 0.8pt + colors.primary-overlay-40,
  ),
  radius: 8pt,
  inset: 0pt,
)[
  #if title != none {
    block(
      width: 100%,
      fill: colors.primary-overlay-40,
      stroke: (
        rest: 0.8pt + colors.primary-overlay-40,
      ),
      radius: (top: 8pt),
      inset: (x: 0.8em, y: 0.5em),
    )[
      #text(fill: white, weight: "bold", size: 10pt)[#title]
    ]
  }
  #v(-1.6em)
  #block(
    width: 100%,
    inset: (x: 1em, y: 1em),
  )[
    #body
  ]
]