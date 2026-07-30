// thu-bia.typ — DEMO 5 kiểu trang bìa (kieu-bia 1..5)
// Biên dịch: typst compile thu-bia.typ  (mỗi trang = 1 kiểu bìa)
#import "../baigiang.typ": *

#set page(paper: "presentation-16-9", margin: 0pt)
#set text(
  font: ("Charis SIL", "Noto Serif", "Libertinus Serif", "Times New Roman"),
  lang: "vi", size: 19pt, fill: rgb("#1c2833"),
)

// Thông tin mẫu dùng chung cho mọi kiểu.
#let _dv = "SỞ GD&ĐT AN GIANG— TRƯỜNG THPT CÂY DƯƠNG"
#let _td = [CHƯƠNG III. NGUYÊN HÀM – TÍCH PHÂN]
#let _pd = [Giải tích 12 — Bộ Cánh Diều]

// Vẽ 1 trang bìa theo kiểu, dùng tông màu MẶC ĐỊNH của kiểu đó.
#let demo(kb) = {
  let tm = _bia-mau(_bia-so(kb))
  _ve-bia(_bia-so(kb), tm.chinh, tm.nhan,
    _dv, none, _td, _pd,
    "Giải tích", "Lớp 12A1", "Kim Thu", "20/07/2026")
}

#demo(1)
#pagebreak()
#demo(2)
#pagebreak()
#demo(3)
#pagebreak()
#demo(4)
#pagebreak()
#demo(5)

// Trang 6: minh hoạ GHI ĐÈ màu — kiểu 2 nhưng đổi sang tông xanh lá.
#pagebreak()
#_ve-bia(2, rgb("#1e8449"), rgb("#f1c40f"),
  _dv, none, _td, _pd, "Giải tích", "Lớp 12A1", "Kim Thu", "20/07/2026")
