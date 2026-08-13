// 各类申请表、报告共用的样式辅助函数
#import "../utils/custom-cuti.typ": *
#import "../utils/style.typ": *

// 一级标题：居中加粗；字号可配，字体默认继承当前文本设置。
// 用法：`#show heading.where(level: 1): form-heading(字号.三号)`
#let form-heading(size, font: auto) = it => {
  align(center, text(
    size: size,
    ..if font == auto { (:) } else { (font: font) },
  )[#fakebold(it)])
}

// 信息表通用规格（毕业申请表、学位申请表共用）
#let info-table(inset-y: 12pt) = table.with(
  columns: (auto, auto, 1fr, auto, 0.8fr, auto, 0.6fr, auto, 1fr),
  align: (center + horizon),
  stroke: 1pt,
  inset: (x: 4pt, y: inset-y),
)

// 竖排文字：首行空行，随后每字一行（行尾一个空格，字间空一行）。
// 注意：行首空格在字符串内容中会触发额外的行距，故空格置于行尾。
#let vtext(s) = (
  s.clusters().map(c => c + " ").join(linebreak() + " " + linebreak())
)

// 交错竖排：将 "你好世界" 变为第一行 "世你"、第二行 "界好"
#let split-vertical(x) = {
  let chars = x.clusters()
  let half = int(chars.len() / 2)
  chars
    .slice(half)
    .zip(chars.slice(0, half))
    .map(pair => pair.join())
    .join(linebreak())
}
