#import "../utils/invisible-heading.typ": invisible-heading
#import "../utils/style.typ": 字体, 字号

// 本科生目录生成
#let bachelor-outline-page(
  // documentclass 传入参数
  twoside: false,
  fonts: (:),
  doctype: "bachelor",
  // 其他参数
  depth: 4,
  title: "目　　录",
  outlined: false,
  title-above-space: 0pt,
  title-down-space: 16pt,
  title-text-args: auto,
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: auto,
  reference-size: 字号.小四,
  // 字体与字号
  font: auto,
  size: (字号.小四, 字号.小四, 字号.小四),
  weight: ("bold", "regular", "regular"),
  // 垂直间距
  bachelor-above: (1em, 1em, 1em),
  bachelor-below: (1em, 1em, 1em),
  master-above: (20pt - 1em, 20pt - 1em, 20pt - 1em),
  master-below: (20pt - 1em, 20pt - 1em, 20pt - 1em),
  indent: (0pt, 1em, 1em),
  // 全都显示点号
  fill: (repeat([.], gap: 0.15em),),
  gap: .3em,
  ..args,
) = {
  import "../utils/custom-cuti.typ": *
  show: show-cn-fakebold // 使用伪粗体显示中文，解决部分字体没有粗体的问题
  // 1.  默认参数
  fonts = 字体 + fonts
  let above = bachelor-above
  let below = bachelor-below
  if (title-text-args == auto) {
    title-text-args = (font: fonts.宋体, size: 字号.三号, weight: "bold")
  }
  if doctype == "bachelor" {
    title-text-args = (font: fonts.宋体, size: 字号.三号, weight: "bold")
    below = bachelor-below
    above = bachelor-above
  } else if doctype == "master" or doctype == "doctor" {
    below = master-below
    above = master-above
    title-text-args = (font: fonts.黑体, size: 字号.三号, weight: "bold")
  } else {
    panic("This doctype has not yet been supported.")
  }
  // 引用页数的字体，这里用于显示 Times New Roman
  if (reference-font == auto) {
    reference-font = fonts.宋体
  }
  // 字体与字号
  if (font == auto) {
    font = (fonts.黑体, fonts.宋体)
  }

  // 2.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })

  // 默认显示的字体
  set text(
    font: reference-font,
    size: reference-size,
    weight: "regular",
    top-edge: "ascender",
    bottom-edge: "descender",
  )

  v(title-above-space)

  {
    set align(center)
    text(..title-text-args, title)
    // 标记一个不可见的标题用于目录生成
    invisible-heading(level: 1, outlined: outlined, title)
  }

  v(title-down-space)

  // 目录样式

  // 目录缩进
  set outline(indent: level => indent.slice(0, calc.min(level + 1, indent.len())).sum())

  // 目录字体字号
  show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    below: below.at(entry.level - 1, default: below.last()),
    link(entry.element.location(), entry.indented(
      none,
      {
        text(
          font: font.at(entry.level - 1, default: font.last()),
          size: size.at(entry.level - 1, default: size.last()),
          weight: weight.at(entry.level - 1, default: weight.last()),
          {
            if entry.prefix() not in (none, []) {
              entry.prefix()
              h(gap)
            }
            entry.body()
          },
        )
        box(width: 1fr, inset: (x: .25em), fill.at(
          entry.level - 1,
          default: fill.last(),
        ))
        entry.page()
      },
      gap: 0pt,
    )),
  )

  // 显示目录
  outline(title: none, depth: depth)
  //研究生专有部分
  if doctype != "bachelor" {
    [附：指导教师对研究生学位论文的学术评语]
    linebreak()
    h(2em)
    [答辩委员会决议书]
  }
}
