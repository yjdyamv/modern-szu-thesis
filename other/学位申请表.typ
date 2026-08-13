#import "form-style.typ": form-heading, info-table, split-vertical
#import "../utils/style.typ": 字号

#set text(
  font: ("SimSun", "Noto Serif CJK SC", "Source Han Serif SC"),
  size: 字号.小四,
)
#show heading.where(level: 1): form-heading(字号.二号)

= 深圳大学学士学位申请表

#linebreak()

#grid(
  columns: (10cm, 1fr),
  [ #h(1em) 申请人：], [填表日期：#h(2em) 年 #h(1em) 月 #h(1em) 日],
)
#v(-1em)
#stack(
  info-table(inset-y: 2pt)(
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
    [主修 \ 专业],
    table.cell(colspan: 4, []),
  ),
  info-table(inset-y: 2pt)(
    table.cell(colspan: 2, [申请学位类别]),
    table.cell(colspan: 7, [ \ #" " ]),
  ),
  info-table(inset-y: 2pt)(
    table.cell(colspan: 2, [毕业论文 \ 题目]),
    table.cell(colspan: 5, [ \ #" " ]),
    [毕业论文 \ 成绩],
  ),
  table(
    columns: (auto, 1fr),
    rows: (15em, 15em, 11em),
    [\  #split-vertical("学院学位分委员会评定意见")],
    [#v(13em) #h(10em) 签名： #h(6em) （公章） #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\ #split-vertical("校学位评定委员会意见")],
    [#v(13em) #h(10em) 签名： #h(6em) （公章） #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\  \ 备 \  \  注], [],
  ),
)
