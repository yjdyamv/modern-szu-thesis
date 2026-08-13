#import "form-style.typ": form-heading, info-table, vtext
#import "../utils/style.typ": 字号

#set text(
  font: ("SimSun", "Noto Serif CJK SC", "Source Han Serif SC"),
  size: 字号.小四,
)
#show heading.where(level: 1): form-heading(字号.二号)

= 深圳大学学生毕业申请表

#linebreak()

#grid(
  columns: (10cm, 1fr),
  [ #h(1em) 申请人：], [填表日期：#h(2em) 年 #h(1em) 月 #h(1em) 日],
)
#v(-1em)
#stack(
  info-table(inset-y: 12pt)(
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
    [ \ #vtext("学院意见")],
    [\ \ \ \ \ \ \ \ #h(10em) 签名： #h(6em) (公章) #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [#vtext("教务部建议")],
    [\ \ \ \ \ \ \ \ #h(10em) 签名： #h(6em) (公章) #h(4em) 年 #h(1em) 月 #h(1em) 日],

    [\  \ 备 \  \  \  注], [],
  ),
)
