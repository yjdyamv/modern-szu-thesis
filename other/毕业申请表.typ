#import "../utils/custom-cuti.typ": *
#import "../utils/style.typ": *
#set text(
  font: ("SimSun", "Noto Serif CJK SC", "Source Han Serif SC"),
  size: 字号.小四,
)

#show heading.where(level: 1): it => {
  align(center, text(size: 字号.二号)[#fakebold(it)])
}

= 深圳大学学生毕业申请表

#linebreak()

#grid(
  columns: (10cm, 1fr),
  [ #h(1em) 申请人：], [填表日期：#h(2em) 年 #h(1em) 月 #h(1em) 日],
)
#v(-1em)
#stack(
  table(
    columns: (auto, auto, 1fr, auto, 0.8fr, auto, 0.6fr, auto, 1fr),
    align: (center + horizon),
    stroke: 1pt,
    inset: (x: 4pt, y: 12pt),

    table.cell(colspan: 2, [~学~号~]),
    [],
    [~姓~名~],
    [],
    [~性~别~],
    [],
    [出生年月日],
    [],
    table.cell(colspan: 2, [~学~院~]),
    [],
    [~专~业~],
    table.cell(colspan: 3, []),
    [入学年月],
    [],
  ),
  table(
    columns: (2em, 1fr),
    rows: (14em, 14em, 14em),
    [ \ 学 \ \ 院 \ \ 意 \ \ 见],
    [\ \ \ \ \ \ \ \ #h(10em) 签名： #h(6em) (公章) #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [教 \ \ 务 \ \ 部 \ \ 建 \ \ 议],
    [\ \ \ \ \ \ \ \ #h(10em) 签名： #h(6em) (公章) #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\  \ 备 \  \  \  注], [],
  ),
)

