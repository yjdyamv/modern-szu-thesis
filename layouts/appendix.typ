#import "@preview/i-figured:0.2.4"
#import "../utils/custom-numbering.typ": appendix-art-numbering, appendix-sci-numbering
#import "../utils/text-config.typ": *

// 后记，重置 heading 计数器
#let appendix(
  doctype: "bachelor",
  spacing: auto,
  leading: auto,
  majortype: "sci",
  numbering: appendix-sci-numbering,
  // figure 计数
  show-figure: i-figured.show-figure.with(numbering: "A-1"),
  // equation 计数
  show-equation: i-figured.show-equation.with(numbering: "(A-1)"),
  // 重置计数
  reset-counter: true,
  it,
) = {
  if majortype == "art" {
    numbering = appendix-art-numbering
  }

  set heading(numbering: numbering)
  //仅显示一级标题在目录中
  set heading(outlined: false)
  show heading.where(level: 1): set heading(outlined: true)
  if reset-counter {
    counter(heading).update(0)
  }
  if doctype == "bachelor" {
    spacing = bachelor-spacing
    leading = bachelor-leading
  } else {
    spacing = master-spacing
    leading = master-leading
  }
  set par(spacing: spacing, leading: leading, first-line-indent: (
    amount: 2em,
    all: true,
  ))
  // 设置 figure 的编号
  show figure: show-figure
  // 设置 equation 的编号
  show math.equation.where(block: true): show-equation
  it
}
