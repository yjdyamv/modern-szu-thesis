#import "../utils/style.typ": *
#import "bachelor-outline-page.typ": bachelor-outline-page
#import "../utils/style.typ": *

#let master-outline-page = bachelor-outline-page.with(
  depth: 3,
  indent: (0em, 1em, 1em),
  doctype: "master",
  title-above-space: 2em,
  title-down-space: 3em,
  font: (字体.宋体, 字体.宋体, 字体.宋体),
)
