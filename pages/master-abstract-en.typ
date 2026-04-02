#import "@preview/pinit:0.2.2": pin, pinit-place
#import "../utils/style.typ": 字体, 字号
#import "../utils/double-underline.typ": double-underline
#import "../utils/custom-tablex.typ": colspanx, gridx
#import "../utils/invisible-heading.typ": invisible-heading
#import "../utils/text-config.typ": *

// 研究生英文摘要页
#let master-abstract-en(
  // documentclass 传入的参数
  doctype: "master",
  degree: "academic",
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  keywords: (),
  outline-title: "ABSTRACT",
  outlined: true,
  title-above-space: master-heading-above.at(0),
  title-down-space: master-heading-below.at(0),
  abstract-title-weight: "regular",
  stroke-width: 0.5pt,
  info-value-align: center,
  info-inset: (x: 0pt, bottom: 0pt),
  info-key-width: 74pt,
  grid-inset: 0pt,
  column-gutter: 2pt,
  row-gutter: 10pt,
  anonymous-info-keys: ("author-en", "supervisor-en", "supervisor-ii-en"),
  leading: master-leading,
  spacing: master-spacing,
  body,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  info = (
    (
      title-en: "SZU Thesis Template for Typst",
      author-en: "Zhang San",
      department-en: "XX Department",
      major-en: "XX Major",
      supervisor-en: "Professor Li Si",
    )
      + info
  )

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title-en) == str {
    info.title-en = info.title-en.split("\n")
  }

  // 3.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })

  [
    #set page(header: context {
      set par(leading: 0pt, spacing: 0pt)
      align(center, info.title-en.sum())
      v(4pt)
      line(length: 100%, stroke: 2pt)
      v(3pt)
      line(length: 100%)
    })


    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    //#linebreak()
    #v(title-above-space)

    #align(center, text(
      font: fonts.黑体,
      size: 字号.三号,
      weight: "bold",
      "ABSTRACT",
    ))

    //#v(-5pt)

    #set text(..master-text-set)
    #set par(leading: leading, spacing: spacing, justify: true)
    #show par: set block(spacing: spacing)
    #v(title-down-space)

    #[
      #set par(first-line-indent: (amount: 2em, all: true))

      #body

    ]

    #linebreak()

    #text(font: 字体.楷体)[*Key words*：]
    #(("",) + keywords.intersperse("；")).sum()
  ]
}
