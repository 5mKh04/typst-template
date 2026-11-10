#import "../tokens/colors.typ": colors

#let statement-box(
  title: none,
  type: none,
  number: none,
  body,
) = {
  // Map type
  let type-label = if type == "axiom" { "Tiên đề" } else if type == "def" { "Định nghĩa" } else if type == "thm" {
    "Định lý"
  } else if type == "prop" { "Mệnh đề" } else if type == "cor" { "Hệ quả" } else if type == "lemma" { "Bổ đề" } else {
    none
  }

  // Tách riêng phần nhãn (số)
  let label-text = if type-label != none {
    if number != none { type-label + " " + str(number) } else { type-label }
  } else {
    none
  }

  block(
    width: 100%,
    inset: 1em,
    radius: (left: 0pt, right: 12pt),
    stroke: (
      left: stroke(
        paint: colors.primary,
        thickness: 2pt,
        dash: "dashed",
      ),
    ),
    fill: colors.primary-overlay-90,
  )[
    #if label-text != none or title != none [
      #if label-text != none [
        #text(weight: "bold", fill: colors.primary)[#label-text#if title != none [.] ]
      ]#if title != none [#title] \
      
    ]
    #body
  ]
}