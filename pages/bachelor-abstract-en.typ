#import "../utils/custom-cuti.typ": *
#import "../utils/style.typ": 字体, 字号
#import "../utils/double-underline.typ": double-underline
#import "../utils/invisible-heading.typ": invisible-heading
#import "../utils/text-config.typ": *

// 本科生英文摘要页
#let bachelor-abstract-en(
  // documentclass 传入的参数
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  keywords: (),
  outline-title: "ABSTRACT",
  outlined: false,
  anonymous-info-keys: ("author-en", "supervisor-en", "supervisor-ii-en"),
  leading: bachelor-leading,
  spacing: bachelor-spacing,
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

  // 3.  内置辅助函数
  let info-value(key, body) = {
    if (not anonymous or (key not in anonymous-info-keys)) {
      body
    }
  }

  // 4.  正式渲染
  [
    #pagebreak(weak: true, to: if twoside { "odd" })

    #set text(font: fonts.楷体, size: 字号.小四)
    #set par(
      leading: leading,
      spacing: spacing,
      justify: true,
      first-line-indent: 0em,
    )
    #show heading: it => {}
    
    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    #align(center)[
      #set text(size: 字号.小二, font: 字体.黑体)
      #double-underline[#fakebold[深圳大学本科生毕业论文（设计、作品）英文摘要]]
    ]

    #fakebold[Thesis:] #info-value("title-en", (("",) + info.title-en).sum())

    #fakebold[Department:] #info-value("department-en", info.department-en)

    #fakebold[Specialisation:] #info-value("major-en", info.major-en)

    #fakebold[Undergraduate:] #info-value("author-en", info.author-en)

    #fakebold[Mentor:] #info-value("supervisor-en", info.supervisor-en) #(
      if info.supervisor-ii-en != "" [#h(1em) #info-value(
          "supervisor-ii-en",
          info.supervisor-ii-en,
        )]
    )

    #fakebold[【Abstract】:]

    #[
      #set par(first-line-indent: (amount: 2em, all: true))
      #set text(size: 字号.五号)

      #body
    ]

    #v(1em)

    #fakebold[【Keywords】:]
    #text(size: 字号.五号, (("",) + keywords.intersperse("; ")).sum())
  ]
}
