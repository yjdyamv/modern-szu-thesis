#import "../utils/style.typ":*
#import "@preview/cuti:0.3.0":*

#show: show-cn-fakebold 

#set text(font: 字体.宋体, size: 11pt)


#align(center, text(font: 字体.宋体, size: 字号.小四, weight: "bold")[深圳大学大学生创新创业学分分配表])

#v(1em)

#grid(
  table(columns: (0.5fr),[获创新创业学分项目名称],),
  table(columns: (0.5fr, 0.5fr),[项目负责人姓名],[项目组可申请奖励学分]),
  table(columns: (30%, 40%, 30%),
  align(center)[组员姓名],align(center)[学分分配数值],align(center)[组员签名	#strong[（须手签确认）]],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  [#("")],[#("")],[#("")],
  ),
  table(columns: (30%, 70%),rows: 10em,
  align(center)[\ \ \  项目指导老师意见], [#align(bottom)[ #h(4em) 签名：	#h(8em)年#h(3em)月#h(4em)日]]
  )
)
