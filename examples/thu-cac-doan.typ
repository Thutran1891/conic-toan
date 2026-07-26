// thu-cac-doan.typ — KIỂM TRA lệnh cac-doan + nhãn giữa đoạn của doan (07/2026)
// Biên dịch:  typst compile thu-cac-doan.typ
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.4cm)
#set text(size: 10.5pt, lang: "vi")

= 1. cac-doan — gộp nhiều nét trong MỘT lệnh

Các điểm liền nhau nối thành một đường gấp khúc; mỗi mảng điểm là một nét rời.

#hinh(w: 8cm, xmin: -1, xmax: 8, ymin: -1, ymax: 5, khung: true, ctx => {
  cac-doan((0, 0), (3, 0), (3, 4), (0, 0), mau: blue, day: 1.2pt)   // A-B-C-A
  cac-doan(((4, 0), (7, 0)), ((4, 1.5), (7, 1.5)), mau: green)      // hai nét rời
  cac-doan((4, 3), (7, 3), mui-ten: true, mau: purple)              // có mũi tên
})

= 2. duong(...) — mỗi nét một kiểu riêng, kiểu chung đặt ở cac-doan

#hinh(w: 8cm, xmin: -1, xmax: 8, ymin: -1, ymax: 8, ctx => {
  let (A, B, C) = ((2, 2), (0, 0), (5, 0))
  let D = (7, 2)
  let S = (2, 7)
  cac-doan(
    duong(B, C, D, S, dong: true),                       // mặt ngoài, nét liền
    duong(A, B, dut: true), duong(A, D, dut: true),      // cạnh khuất
    duong(A, S, dut: true, mau: gray),
    duong(B, D, mau: red, dut: true, ten: $d$, tai: 0.35),
    day: 1.1pt,                                          // kiểu CHUNG cho mọi nét
  )
  for (P, t, h) in ((A, $A$, "below-left"), (B, $B$, "below-left"), (C, $C$, "below"),
                    (D, $D$, "right"), (S, $S$, "above")) {
    diem(P, ten: t, huong: h)
  }
})

= 3. Tô màu nét khép kín (`to:` tự khép kín, không cần `dong:`)

#hinh(w: 8cm, xmin: -1, xmax: 7, ymin: -1, ymax: 5, ctx => {
  cac-doan(
    duong((0, 0), (6, 0), (1.5, 4), to: blue.lighten(88%), mau: blue, day: 1.2pt),
    duong((1.5, 4), (1.5, 0), dut: true, mau: red, ten: $h$, huong: "right", cach: 4pt),
  )
})

= 4. Nhãn giữa đoạn của `doan` (tai / huong / cach / ten-quay)

#hinh(w: 8cm, xmin: -1, xmax: 7, ymin: -1, ymax: 6, ctx => {
  let (A, B, C) = ((0, 0), (6, 0), (1.5, 4))
  cac-doan(duong(A, B, C, dong: true, mau: blue, day: 1.1pt))
  doan(A, B, ten: [6 cm], huong: "below", cach: 4pt)   // dưới cạnh đáy
  doan(A, C, ten: $b$)                                 // auto: vuông góc, phía trên
  doan(B, C, ten: [cạnh huyền], ten-quay: true)        // chữ nằm dọc theo đoạn
  doan((5, 1), (5, 5), ten: $h$)                       // đoạn DỌC -> nhãn sang trái
  doan((0, 5.4), (3, 5.4), ten: [tại 0.2], tai: 0.2)   // đổi vị trí nhãn
})

= 5. Nhãn theo TỔNG chiều dài của cả nét gấp khúc

#hinh(w: 8cm, xmin: -1, xmax: 8, ymin: -1, ymax: 5, ctx => {
  cac-doan(
    duong((0, 0), (3, 3), (6, 3), (7, 0), ten: [giữa cả đường], tai: 0.5, mau: blue),
    duong((0, 4.5), (7, 4.5), ten: [tai: 0.85], tai: 0.85, mau: red, mui-ten: true),
  )
})
