// Thử `w:` của BBT/bảng xét dấu và `ti-le-hinh:` của kieu-cau-hoi (0.4.2).
// typst compile thu-w-ti-le-hinh.typ --input ho-so=loigiai
// typst compile thu-w-ti-le-hinh.typ --input ho-so=dethi
// typst compile thu-w-ti-le-hinh.typ --input ho-so=beamer
#import "../baigiang.typ": *
#let ho-so = sys.inputs.at("ho-so", default: "loigiai")
#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron", hien-o: false)
#show: de-toan.with(ho-so: ho-so, tieu-de: [THỬ w VÀ ti-le-hinh], mon: [TOÁN])

#phan([1. `w:` của bảng biến thiên])
#dat-lai-cau()

#tl(
  [Ba bảng CÙNG nội dung: mặc định · `w: 8cm` · `w: 100%` (đầy bề rộng).
  #align(center, bbt-bac-ba(1, 0, -3, 1))
  #align(center, bbt-bac-ba(1, 0, -3, 1, w: 8cm))
  #align(center, bbt-bac-ba(1, 0, -3, 1, w: 100%))],
)

#tl(
  [`bbt` tự khai có kẹp ‖, `w: 70%`; `bang-xet-dau` `w: 6cm`; `xet-dau-tam-thuc` `w: 50%`.
  #align(center, bbt(x: ($-oo$, $-2$, $-1$, $0$, $+oo$), dau: ("", "-", "0", "+", "||", "+", "0", "-", ""),
    gia-tri: ($+oo$, $4$, ($+oo$, $-oo$), $0$, $-oo$), huong: ("xuong", "len", "len", "xuong"), kep: (2,), w: 70%))
  #align(center, bang-xet-dau(x: ($-oo$, 1, 3, $+oo$), dong: (($f(x)$, ("", "+", "0", "-", "0", "+", "")),), w: 6cm))
  #align(center, xet-dau-tam-thuc(a: -1, w: 50%))],
)

#tl(
  [Các bảng dựng sẵn khác với `w: 9cm`:
  #align(center, bbt-bac-hai(1, -2, 3, w: 9cm))
  #align(center, bbt-trung-phuong(1, -2, 0, w: 9cm))
  #align(center, bbt-phan-thuc(2, -1, 1, -1, w: 9cm))
  #align(center, bbt-huu-ti(1, -1, 1, 1, -1, w: 9cm))],
)

#phan([2. `ti-le-hinh:` co/giãn mọi `#hinh`])

#let hinh-mau = hinh(w: 4cm, xmin: -0.5, xmax: 4.5, ymin: -0.5, ymax: 3.5, ctx => {
  let (A, B, C) = ((0, 0), (4, 0), (1, 3))
  da-giac(ctx, (A, B, C))
  cac-diem(ctx, (A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"))
})

#tl([Mặc định (1.0): #align(center, hinh-mau)
  Đồ thị dựng sẵn `w: 5cm`: #align(center, do-thi-bac-ba(1, 0, -3, 1, w: 5cm))])

#kieu-cau-hoi(ti-le-hinh: 0.6)
#tl([Sau `#kieu-cau-hoi(ti-le-hinh: 0.6)` — cùng hai hình, nhỏ đi 40%: #align(center, hinh-mau)
  #align(center, do-thi-bac-ba(1, 0, -3, 1, w: 5cm))])

#kieu-cau-hoi(ti-le-hinh: 80%)
#tl([`ti-le-hinh: 150%` (nhận cả tỉ lệ %), hình kèm câu qua `fig:`.],
  fig: hinh-mau, fig-pos: "right")

#kieu-cau-hoi(ti-le-hinh: 1)
#tl([Trả về 1: #align(center, hinh-mau)])
