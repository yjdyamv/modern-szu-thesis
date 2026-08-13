#import "../utils/style.typ": *
#import "../utils/custom-cuti.typ": *
#import "../utils/text-config.typ": *

#let notation(
  twoside: false,
  doctype: "bachelor",
  title: "符号和缩略语说明",
  outlined: true,
  width: 400pt,
  columns: (60pt, 1fr),
  row-gutter: 16pt,
  ..args,
  body,
) = {
  pagebreak()
  show: show-cn-fakebold
  set text(..if doctype == "bachelor" { bachelor-text-set } else if doctype == "master" or doctype == "doctor" {
    master-text-set
  })
  let (title-above-space, title-down-space) = if doctype == "bachelor" {
    (bachelor-heading-above.at(0), bachelor-heading-below.at(0))
  } else if doctype == "master" or doctype == "doctor" {
    (master-heading-above.at(0), master-heading-below.at(0))
  } else {
    panic("This doctype has not yet been supported.")
  }
  let header = if doctype == "bachelor" {
    ""
  } else if doctype == "master" or doctype == "doctor" {
    context {
      set par(leading: 0pt, spacing: 0pt)
      align(center, emph(title))
      v(3pt)
      line(length: 100%, stroke: 2pt)
      v(3pt)
      line(length: 100%, stroke: 1pt)
    }
  } else {
    panic("This doctype has not yet been supported.")
  }
  set page(paper: "a4", numbering: "I", header: header)
  v(title-above-space)
  align(center)[#text(font: 字体.黑体, weight: "bold", heading(level: 1, numbering: none, outlined: outlined, title)),
  ]
  v(title-down-space)

  align(center, block(width: width, align(start, grid(
    columns: columns,
    row-gutter: row-gutter,
    ..args,
    // 解析 terms 内部结构以渲染到表格里
    ..body.children.filter(it => it.func() == terms.item).map(it => (it.term, it.description)).flatten()
  ))))

  // 手动分页
  if (twoside) {
    pagebreak() + " "
  }
}
