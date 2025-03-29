#import "@preview/numbly:0.1.0": numbly
#let custom-numbering = numbly(
  "{1:第一章 }",
  "{2:第一节 }",
  "{3:一、}",
  "{4:（一） }",
)

//附录标题numbering

#let appendix-art-numbering = numbly(
  "{1:附录A }",
  "{2:第一节 }",
  "{3:一、}",
  "{4:（一） }",
)

#let appendix-sci-numbering = numbly(
  "{1:附录A }",
  "{1:A}.{2:1}",
  "{1:A}.{2:1}.{3:1}",
  "{1:A}.{2:1}.{3:1}.{4:1}",
)

//本科生标题numbering

#let bachelor-art-numbering = numbly(
  "{1:第一章 }",
  "{2:第一节 }",
  "{3:一、}",
  "{4:（一） }",
)

#let bachelor-sci-numbering = numbly(
  "{1:1 }",
  "{1:1}.{2:1 }",
  "{1}.{2:1}.{3:1 }",
  "{1}.{2:1}.{3:1}.{4:1 }",
)

//研究生标题numbering

#let master-art-numbering = numbly(
  "{1:第一章 }",
  "{2:第一节 }",
  "{3:一、 }",
  "{4:（一） }",
)

#let master-sci-numbering = numbly(
  "{1:第一章 }",
  "{1:1}.{2:1} ",
  "{1}.{2:1}.{3:1} ",
  "{1}.{2:1}.{3:1}.{4:1} ",
)
