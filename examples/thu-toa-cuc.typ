// Thử toa-cuc(tam, bk, goc) — toạ độ cực kiểu TikZ (07/2026).
#import "../baigiang.typ": *
#set page(width: 16cm, height: 12cm, margin: 8pt)

#grid(columns: (1fr, 1fr),
// 1) Lục giác đều bằng toạ độ cực quanh gốc O
hinh(xmin: -4.6, xmax: 4.6, ymin: -3.4, ymax: 3.4, w: 7cm, ctx => {
  let O = (0, 0)
  let dinh = range(6).map(k => toa-cuc(O, 2.6, 60 * k))
  duong-gap-khuc(  dinh, dong: true)
  cac-diem(  ..dinh.enumerate().map(((k, P)) => (P, [#(k + 1)])))
  diem( O, ten: $O$, huong: "below")
}),
// 2) Tâm khác gốc + góc kiểu angle
hinh(xmin: -1, xmax: 6, ymin: -1, ymax: 4, w: 7cm, ctx => {
  let I = (2, 1)
  let A = toa-cuc(I, 2, 0)
  let B = toa-cuc(I, 2, 90deg) // kiểu angle vẫn chạy
  let C = toa-cuc(I, 2, 135)
  duong-tron(  I, 2)
  cac-doan(  (I, A), (I, B), (I, C))
  cac-diem(  (I, $I$, "below"), (A, $A$, "right"), (B, $B$, "above"), (C, $C$, "above-left"))
})
)



// 3) Kiểm tra giá trị số
#let P = toa-cuc((1, 1), 2, 60)
#let Q = toa-cuc((0, 0), 1, 90)
Kiểm: P = (#calc.round(P.at(0), digits: 4), #calc.round(P.at(1), digits: 4)) — mong (2, 2.7321).
Q = (#calc.round(Q.at(0), digits: 6), #calc.round(Q.at(1), digits: 6)) — mong (0, 1).
