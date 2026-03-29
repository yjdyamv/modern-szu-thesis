#import "../utils/style.typ": *
#import "../utils/custom-cuti.typ": *
#import "../utils/text-config.typ": *
#import "@preview/hydra:0.6.2": hydra

#let notation(
  twoside: false,
  doctype: "bachelor",
  title: "符号和缩略语说明",
  title-above-space: bachelor-heading-above.at(0),
  title-down-space: bachelor-heading-below.at(0),
  outlined: true,
  numbering: "1",
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
  let header = ""
  if doctype == "bachelor" {
    header = ""
  } else if doctype == "master" or doctype == "doctor" {
    header = context {
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

  if doctype == "bachelor" {
    numbering = "I"
  } else if doctype == "master" or doctype == "doctor" {
    numbering = "I"
  } else {
    panic("This doctype has not yet been supported.")
  }
  set page(paper: "a4", numbering: numbering, header: header)
  //linebreak()
  if doctype == "bachelor" {
    title-above-space = bachelor-heading-above.at(0)
    title-down-space = bachelor-heading-below.at(0)
  } else if doctype == "master" or doctype == "doctor" {
    title-above-space = master-heading-above.at(0)
    title-down-space = master-heading-below.at(0)
  } else {
    panic("This doctype has not yet been supported.")
  }

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
