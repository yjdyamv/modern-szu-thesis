#import "style.typ": *
// magic number

// 正文行距、段距
#let bachelor-spacing = 1em
#let bachelor-leading = 0.5em

#let master-spacing = 23pt - 1em
#let master-leading = 23pt - 1em

// 页码：置于页脚居中，Times New Roman 五号，无修饰线
#let page-footer = context {
  set text(
    font: (name: "Times New Roman", covers: "latin-in-cjk"),
    size: 字号.五号,
    top-edge: "ascender",
    bottom-edge: "descender",
  )
  align(center, counter(page).display())
}

// 正文字体字号
#let bachelor-text-set = (
  font: 字体.宋体,
  size: 字号.五号,
  top-edge: "ascender",
  bottom-edge: "descender",
)
#let master-text-set = (
  font: 字体.宋体,
  size: 字号.小四,
  top-edge: "ascender",
  bottom-edge: "descender",
)

// 标题行距、段距
#let bachelor-heading-above = (0.5em, 0.5em, 0.5em, 0.5em)
#let bachelor-heading-below = (0.5em, 0.5em, 0.5em, 0.5em)

#let master-heading-above = (24pt, 24pt, 12pt, 12pt)
#let master-heading-below = (18pt, 6pt, 6pt, 6pt)
