#import "@preview/numbly:0.1.0":numbly
#let custom-numbering = numbly("{1:第一章 }","{2:第一节 }","{3:一、}","{4:（一） }")
#let appendix-numbering = numbly("{1:附录A }","{2:第一节 }","{3:一、}","{4:（一） }")
#let bachelor-art-numbering = numbly("{1:第一章 }","{2:第一节 }","{3:一、}","{4:（一） }")
#let bachelor-science-numbering = numbly("{1:1}","{1:1}.{2:1}","{1}.{2:1}.{3:1}","{1}.{2:1}.{3:1}.{4:1}")
#let master-art-numbering = numbly("{1:第一章 }","{2:第一节 }","{3:一、}","{4:（一） }")
#let master-science-numbering = numbly("{1:第一章}","{1:1}.{2:1}","{1}.{2:1}.{3:1}","{1}.{2:1}.{3:1}.{4:1}")