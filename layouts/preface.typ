// 前言，重置页面计数器
#import "../utils/text-config.typ": page-footer

#let preface(
  // documentclass 传入的参数
  twoside: false,
  doctype: "bachelor",
  info: (:),
  ..args,
  it,
) = {
  // 分页
  if (twoside) {
    pagebreak() + " "
  }
  counter(page).update(0)
  set page(numbering: "I", footer: page-footer)
  it
}
