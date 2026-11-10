#import "../tokens/colors.typ": colors

// Một dòng trong mục lục: số mục, tiêu đề, dot leader, số trang
#let toc-entry(num, title, page) = {
  grid(
    columns: (20pt, 1fr, auto),
    column-gutter: 2pt,
    row-gutter: 4pt,
    align: (left, left, right),
    text(size: 8.5pt, fill: colors.text-primary, num),
    grid(
      columns: (auto, 1fr),
      column-gutter: 2pt,
      align: (left, horizon),
      text(size: 8.5pt, fill: colors.text-primary, title),
      // Dot leader — repeat[.] tự lấp đầy khoảng trống còn lại
      box(width: 1fr, height: 8.5pt)[
        #align(bottom)[#repeat[.]]
      ],
    ),
    text(size: 8.5pt, fill: colors.text-primary, str(page)),
  )
}

// Toàn bộ khối mini outline, gồm số chương lớn bên lề + box mục lục
#let mini-outline(chapter-number, entries) = {
  box(
    stroke: (y: 0.5pt + colors.stroke-light),
    inset: (y: 8pt),
    width: 100%,
  )[
    #set block(spacing: 0pt)
    #for (i, e) in entries.enumerate() [
      #if i > 0 { v(6pt) } // <- chỉ thêm trước các dòng SAU dòng đầu tiên
      #toc-entry(e.num, e.title, e.page)
    ]
  ]
}