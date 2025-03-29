#import "../utils/custom-cuti.typ": *
#import "../utils/style.typ": *

#set text(
  font: ("SimSun", "Noto Serif CJK SC", "Source Han Serif SC"),
  size: 字号.小四,
)

#show heading.where(level: 1): it => {
  align(center, text(size: 字号.二号)[#fakebold(it)])
}
// 将 你好世界 转换为 世 你
//                    界 好
#let split(x) = {
  let (l, r) = x.clusters().chunks(int(x.clusters().len() / 2))
  r.zip(l).map(x => x.join()).join(linebreak())
}

= 深圳大学学士学位申请表

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
    inset: (x: 4pt, y: 2pt),

    table.cell(colspan: 2, [学~号]),
    [],
    [~姓~名~],
    [],
    [~性~别~],
    [],
    [出生 \ 年月日],
    [],
    table.cell(colspan: 2, [~学~院~]),
    table.cell(colspan: 2, []),
    [主修 \ 专业
    ],
    table.cell(colspan: 4, []),
  ),
  table(
    columns: (auto, auto, 1fr, auto, 0.8fr, auto, 0.6fr, auto, 1fr),
    align: (center + horizon),
    stroke: 1pt,
    inset: (x: 4pt, y: 2pt),
    table.cell(colspan: 2, [申请学位类别]),
    table.cell(colspan: 7, [ \ #" " ]),
  ),
  table(
    columns: (auto, auto, 1fr, auto, 0.8fr, auto, 0.6fr, auto, 1fr),
    align: (center + horizon),
    stroke: 1pt,
    inset: (x: 4pt, y: 2pt),
    table.cell(colspan: 2, [毕业论文 \ 题目]),
    table.cell(colspan: 5, [ \ #" " ]),
    [毕业论文 \ 成绩],
  ),
  table(
    columns: (auto, 1fr),
    rows: (15em, 15em, 11em),
    [\  #split("学院学位分委员会评定意见")],
    [#v(13em) #h(10em) 签名： #h(6em) （公章） #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\ #split("校学位评定委员会意见")],
    [#v(13em) #h(10em) 签名： #h(6em) （公章） #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\  \ 备 \  \  注], [],
  ),
)

