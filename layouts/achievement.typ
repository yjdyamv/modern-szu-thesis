#import "@preview/i-figured:0.2.4"
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/style.typ":*

// 后记，重置 heading 计数器
#let achievement(
  numbering: custom-numbering.with(first-level: "", depth: 1,),
  // 重置计数
  reset-counter: true,
  first-line-indent:(amount:0em,all: true),
  it,
) = {
  set heading(numbering: numbering,)
  set par(first-line-indent: first-line-indent,spacing: 1em, leading: 1em, )
  set text(lang: "zh" , font: 字体.宋体, size: 字号.五号, top-edge: 0.7em, bottom-edge: -0.3em)
  if reset-counter {
    counter(heading).update(0)
  }
  it
}