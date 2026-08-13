#import "form-style.typ": form-heading
#import "../utils/style.typ": 字体, 字号

#set text(font: 字体.黑体, size: 字号.小四)
#show heading.where(level: 1): form-heading(字号.三号, font: 字体.黑体)
#set par(leading: 0pt, spacing: 6pt)

// 信息表通用规格
#let info-table = table.with(
  columns: (6em, auto, 8em, auto, 0.7fr, auto, 0.2fr, auto, 1fr),
  align: (center + horizon),
  stroke: 1pt,
  inset: (x: 4pt, y: 8pt),
)

= 深圳大学本科毕业论文（设计）开题报告

#stack(
  info-table(
    table.cell(colspan: 2, align(left)[题~~~~~~~目]),
    table.cell(colspan: 7)[],
    table.cell(colspan: 2, align(left)[学生姓名]),
    [],
    [学号],
    table.cell(colspan: 3, []),
    [专业],
    [],
  ),
  info-table(
    table.cell(colspan: 2, align(left)[学~~~~~~~院]),
    [],
    [　指导教师　],
    table.cell(colspan: 5)[],
  ),
  table(
    columns: 1fr,
    rows: (20em, 20em, 14em, 14em, 5em, 20em),
    stroke: 1pt,
    [本选题的意义及国内外发展状况：],
    [研究内容：],
    [研究方法、手段及步骤：],
    [参考文献：],
    [学生签名： #v(2em) #text(align(right)[年#h(2em)月#h(2em)日#h(2em)], font: 字体.宋体)],
    [
      指导教师意见： #v(7em) #text(font: 字体.宋体)[#align(right)[签名：#h(8em)]]
      院系领导意见： #v(6em) #text(font: 字体.宋体)[#align(right)[签名：#h(8em)]]
      #text(font: 字体.宋体)[#align(right)[年#h(2em)月#h(2em)日#h(2em)]]
    ],
  ),
)
