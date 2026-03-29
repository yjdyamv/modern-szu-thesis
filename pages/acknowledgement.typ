// 致谢页
#import "../utils/custom-cuti.typ": *
#let acknowledgement(
  // documentclass 传入参数
  anonymous: false,
  twoside: false,
  // 其他参数
  title: "致谢",
  outlined: true,
  body,
) = {
  show: show-cn-fakebold
  if (not anonymous) {
    pagebreak(weak: true, to: if twoside { "odd" })
    heading(
      level: 1,
      numbering: none,
      outlined: outlined,
      title,
    )
    text()[#body]
  }
}
