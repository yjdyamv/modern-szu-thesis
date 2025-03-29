#import "../utils/custom-cuti.typ": *
#import "../utils/style.typ": *

#set text(
  font: ("SimSun", "Noto Serif CJK SC", "Source Han Serif SC"),
  size: 字号.四号,
)

#set par(
  first-line-indent: (amount: 2em, all: true),
  justify: true,
  leading: 2em,
)
#show heading.where(level: 1): it => {
  align(center, text(size: 字号.一号)[#fakebold(it)])
}

// 画下划线，长度为n个空格
#let uline(n) = underline(n * "\u{3000}" + sym.zws, stroke: 1pt + black)

#v(字号.四号 * 4)

= 延期毕业申请

#v(字号.四号 * 2)

#uline(6) 学院 #uline(16) 专业学生（学号：#uline(6) ），因 #uline(20) 原因申请延期毕业#uline(1)年

#v(字号.四号 * 2)

#align(right)[申请人： #h(3cm) #h(2em)]
#align(right)[年 #h(1em) 月 #h(1em) 日 #h(1em) #h(2em)]

#v(字号.小四 * 3)

#align(right)[学院意见（盖章）： #h(1em) #h(2em)]
#align(right)[年 #h(1em) 月 #h(1em) 日 #h(1em) #h(2em)]
