#import "../tokens/colors.typ": colors

#let enrichment-box(
  title: none,
  bg: colors.primary-overlay-90,
  body,
) = {
  v(0.6em)
  block(
    fill: bg,
    width: 100%,
    inset: 12pt,
    radius: 6pt,
    [
      #set par(leading: 0.6em)
      #if title != none [
        #text(weight: "bold")[#title]
        #v(6pt)
      ]
      #body
    ]
  )
}