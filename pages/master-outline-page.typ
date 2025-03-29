#import "../utils/style.typ":*
#import "bachelor-outline-page.typ": bachelor-outline-page
#let master-outline-page = bachelor-outline-page.with(
  depth: 3,
  indent: (0em, 1em, 1em),
  doctype: "master",
  title-above-space: 2em,
  title-down-space: 3em
)
