#import "../lib.typ": documentclass, indent ,字体, 字号,
// 此模板仅用于研究生毕业论文。由于研究生与本科生论文主体顺序不一致，故分成两个文件。
// 你首先应该安装 https://github.com/nju-lug/modern-nju-thesis/tree/main/fonts/FangZheng 里的所有字体，
// 如果是 Web App 上编辑，你应该手动上传这些字体文件，否则不能正常使用「楷体」和「仿宋」，导致显示错误。

#let (
  // 布局函数
  twoside, doc, preface, mainmatter, appendix, doctype,achievement,
  // 页面函数
  fonts-display-page, cover, decl-page, abstract, abstract-en, bilingual-bibliography,
  outline-page, list-of-figures, list-of-tables, notation, acknowledgement,
) = documentclass(
  doctype: "master",  // "bachelor" | "master" | "doctor" | "postdoc", 文档类型，默认为本科生 bachelor
  degree: "academic",  // "academic" | "professional", 学位类型，默认为学术型 academic
  // anonymous: true,  // 盲审模式
  twoside: false,  // 双面模式，会加入空白页，便于打印
  // 可自定义字体，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),
  info: (
    title: ("基于 Typst 的", "深圳大学学位论文"),
    title-en: "My Title in English",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "Ming Xing",
    department: "某学院",
    department-en: "School of Chemistry and Chemical Engineering",
    major: "某专业",
    major-en: "Chemistry",
    supervisor: ("李四", "教授"),
    supervisor-en: "Professor My Supervisor",
    // supervisor-ii: ("王五", "副教授"),
    // supervisor-ii-en: "Professor My Supervisor",
    submit-date: datetime.today(),
    
    //下为研究生项
    //UDC
    udc: "",
    //分类号
    clc: "",
    //学校代码
    school-code: "",
    //密级
    secret-level: "",
  ),
  // 参考文献源
  bibliography: bibliography.with("ref.bib"),
)

// 文稿设置
#show: doc

// 字体展示测试页
// #fonts-display-page()

// 封面页
#cover()

// 声明页
#decl-page()



// 前言
#show: preface

// 中文摘要
#abstract(
  keywords: ("我", "就是", "测试用", "关键词")
)[
  中文摘要
]

// 英文摘要
#abstract-en(
  keywords: ("Dummy", "Keywords", "Here", "It Is")
)[
  English abstract
]

// 目录
#outline-page()



// 插图目录
//#list-of-figures()

// 表格目录
//#list-of-tables()

// 正文
#show: mainmatter

// 符号表,若无可删去
#notation[
  / DFT:	密度泛函理论 (Density Functional Theory)
  / HPLC:	高效液相色谱 (High Performance Liquid Chromatography)
  / LC-MS:	液相色谱-质谱联用 (Liquid chromatography-Mass Spectrum)
  / SCRF:  	自洽反应场 (Self-Consistent Reaction Field)
  / TIC:	总离子浓度 (Total Ion Content)
  / ZPE:	零点振动能 (Zero Vibration Energy)
  / Ea:	化学反应的活化能 (Activation Energy)
  / $Delta G^!=$:	活化自由能 (Activation Free Energy)
  / $nu_i$:	虚频 (Imaginary Frequency)
]

= 导　论

== 列表

=== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二
    + 有序子子列表项一
    + 有序子子列表项一
=== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:nju-logo。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(stroke:1.5pt),
      [t], [1], [2], [3],
      table.hline(stroke: 1pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(stroke:1.5pt),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <nju-logo>

== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：
$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>
引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 参考文献

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>


= 正　文

== 正文子标题

=== 正文子子标题

==== 正文子子子标题

正文内容


// 手动分页
#if twoside {
  pagebreak() + " "
}

// 中英双语参考文献
// 默认使用 gb-7714-2015-numeric 样式
#bilingual-bibliography(full: true)

// 附录
#show: appendix

= 关于XXX的自查表

== 附录子标题

=== 附录子子标题

附录内容，这里也可以加入图片，例如@fig:appendix-img。

#figure(
  image("images/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <appendix-img>

// 致谢
#acknowledgement[
  感谢 NJU-LUG，感谢 NJUThesis LaTeX ，感谢modern-nju-thsis模板。
]

// 手动分页
#if twoside {
  pagebreak() + " "
}

#show: achievement
//均以参考文献的方式列出
= 攻读硕士学位期间的科研成果

#heading(level: 2,outlined: false)[学术论文]

[1] PEI S, HUANG L L, LI G, et al. Magnetic Raman Continuum in Single-Crystalline H3LiIr2O6 [J].Physical Review B,2020,101(20):201101(R).（SCI收录,IDS号为LJ4UN,IF=3.575,对应学位论文2.2节和第5章） 

[2] XXX,XX.……（已被XX期刊录用）

#heading(level: 2,outlined: false)[专著/译著（无专著或译著时此项不必列出）]

[3] XXX,XX.……

[4] XXX,XX.……（XXX出版社，预计出版时间为……）

#heading(level: 2,outlined: false)[已获得及申请的专利（无专利时此项不必列出）]

[5] XXX,XX.……

[6] XXX,XX.……

#heading(level: 2,outlined: false)[研究报告（无研究报告时此项不必列出）]

[7] XXX,XX.……

#heading(level: 2,outlined: false)[其他研究成果（无其他研究成果时此项不必列出）]

[8] XXX,XX.……

[9] XXX,XX.……



