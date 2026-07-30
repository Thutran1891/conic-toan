// Thử duong-luon (Bézier kiểu controls TikZ) + nhan-cong (nhãn bám đường cong) — 07/2026.
#import "../baigiang.typ": *
#set page(width: 18cm, height: 24cm, margin: 12pt)
#set text(font: ("Charis SIL", "Libertinus Serif", "Noto Serif"), size: 11pt)

*1) Đường trơn tự động (Catmull-Rom) qua các điểm neo — chỉ liệt kê điểm*

#grid(columns: (1fr, 1fr, 1fr),
hinh(xmin: -0.5, xmax: 4.5, ymin: -2, ymax: 3, w: 5.4cm, ctx => {
  let ps = ((0, 0), (1, 2), (3, -1), (4, 1))
  duong-luon(..ps, mau: blue, day: 1.2pt, mui-ten: true)
  cac-diem(..ps.map(P => (P, none)), mau: red, bk: 1.6pt)
}),
hinh(xmin: -0.5, xmax: 4.5, ymin: -2, ymax: 3, w: 5.4cm, ctx => {
  // so sánh: cùng điểm neo nhưng nối gấp khúc
  let ps = ((0, 0), (1, 2), (3, -1), (4, 1))
  duong-gap-khuc(ps, mau: luma(60%), dut: true)
  duong-luon(..ps, mau: green.darken(20%), day: 1.3pt)
}),
hinh(xmin: -2.4, xmax: 2.4, ymin: -2.4, ymax: 2.4, w: 5.4cm, ctx => {
  // đường KHÉP KÍN uốn lượn (giọt/blob)
  let ps = ((-1.6, 0), (0, 1.7), (1.6, 0), (0, -1.7))
  duong-luon(..ps, dong: true, mau: purple, day: 1.2pt, to: purple.lighten(85%))
})
)

*2) Điểm điều khiển tường minh — `dieu-khien(c1, c2)` giống `.. controls ..` của TikZ*

#grid(columns: (1fr, 1fr),
hinh(xmin: -0.5, xmax: 4.5, ymin: -1, ymax: 3, w: 8cm, khung: true, ctx => {
  let A = (0, 0)
  let B = (4, 0)
  let c1 = (1, 3)
  let c2 = (3, 3)
  duong-luon(A, dieu-khien(c1, c2), B, mau: blue, day: 1.4pt)
  // minh hoạ khung điều khiển
  cac-doan((A, c1), (B, c2), mau: red, dut: true, day: 0.6pt)
  cac-diem(
    (A, $A$, "below"), (B, $B$, "below"),
    (c1, $c_1$, "above"), (c2, $c_2$, "above"), mau: red, bk: 1.8pt,
  )
}),
hinh(xmin: -0.5, xmax: 6.5, ymin: -2.5, ymax: 2.5, w: 8cm, ctx => {
  // nhiều đoạn Bézier nối tiếp (sóng)
  duong-luon(
    (0, 0), dieu-khien((1, 2), (2, 2)),
    (3, 0), dieu-khien((4, -2), (5, -2)),
    (6, 0),
    mau: teal, day: 1.4pt, mui-ten: true,
  )
})
)

*3) `nhan-cong`: chữ bám theo đường cong*

#grid(columns: (1fr, 1fr),
hinh(xmin: -3, xmax: 3, ymin: -2.6, ymax: 2.6, w: 8cm, ctx => {
  let O = (0, 0)
  duong-tron(O, 2.2, mau: luma(70%))
  let c = diem-cung(O, 2.2, 2.2, 160deg, 20deg)  // nửa trên, trái -> phải
  nhan-cong(c, "ĐƯỜNG TRÒN LƯỢNG GIÁC", co: 13pt, mau: blue, can: "giua", tu: 0.5)
}),
hinh(xmin: -0.5, xmax: 6.5, ymin: -2.5, ymax: 2.5, w: 8cm, ctx => {
  // chữ bám sóng Bézier
  let s = diem-luon(
    (0, 0), dieu-khien((1, 2), (2, 2)),
    (3, 0), dieu-khien((4, -2), (5, -2)),
    (6, 0), n: 24,
  )
  duong-luon(
    (0, 0), dieu-khien((1, 2), (2, 2)),
    (3, 0), dieu-khien((4, -2), (5, -2)),
    (6, 0),
    mau: luma(75%), n: 24,
  )
  nhan-cong(s, "song song song song", co: 12pt, mau: red, can: "giua", tu: 0.5)
  nhan-cong(s, "Phương trình bậc hai ", co: 12pt, mau: green, can: "giua", phia: "duoi", tu: 0.5)
})
)

*4) Tuỳ chọn `phia` (trên/dưới đường) và `dao` (đảo chiều khi đường vẽ ngược)*

#grid(columns: (1fr, 1fr),
hinh(xmin: -3, xmax: 3, ymin: -3, ymax: 3, w: 8cm, ctx => {
  let O = (0, 0)
  duong-tron(O, 2.3, mau: luma(70%))
  // chữ NẰM TRÊN cung (nửa trên) và chữ NẰM DƯỚI cung (nửa dưới); cả hai đọc xuôi
  nhan-cong(diem-cung(O, 2.3, 2.3, 170deg, 10deg), "phia tren", co: 13pt, mau: blue, can: "giua", tu: 0.5)
  nhan-cong(diem-cung(O, 2.3, 2.3, 190deg, 350deg), "phia duoi", co: 13pt, mau: green.darken(20%), phia: "duoi", can: "giua", tu: 0.5)
}),
hinh(xmin: -0.5, xmax: 6.5, ymin: -1, ymax: 3, w: 8cm, ctx => {
  // đường được định nghĩa từ PHẢI sang TRÁI -> dùng dao: true cho chữ đọc xuôi
  let s = diem-luon((6, 0), (4, 2), (2, 2), (0, 0), n: 20)
  duong-luon((6, 0), (4, 2), (2, 2), (0, 0), mau: luma(75%), n: 20)
  nhan-cong(s, "doc xuoi nho dao", co: 12pt, mau: purple, can: "giua", tu: 0.5, dao: true)
})
)
