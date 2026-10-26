// Thử `doan(vach: ...)` — vạch đánh dấu đoạn bằng nhau ngay trong lệnh vẽ đoạn (0.4.2).
// typst compile thu-doan-vach.typ
#import "../baigiang.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= `doan(vach: ...)` — đánh dấu đoạn bằng nhau

#hinh(w: 13cm, xmin: -0.5, xmax: 13, ymin: 0, ymax: 8, ctx => {
  // Mục 1: số vạch vuông góc — 1, 2, 3
  for (i, v) in (1, 2, 3).enumerate() {
    doan((0, 7 - i), (4, 7 - i), vach: v)
    nhan((4.3, 7 - i), [vach: #v], huong: "right")
  }
  // Mục 2: chuỗi kiểu SGK — "/", "//", "x", "xx"
  for (i, v) in ("/", "//", "x", "xx").enumerate() {
    doan((7, 7 - i), (11, 7 - i), vach: v)
    nhan((11.3, 7 - i), raw("vach: \"" + v + "\""), huong: "right")
  }
  // Mục 3: đoạn xiên + đổi màu/nét — vạch bám đúng hướng đoạn, theo màu đoạn
  doan((0, 1), (4, 3.5), vach: 2, mau: red, day: 1.4pt)
  doan((7, 3), (11, 1), vach: (so: 3, nghieng: 20deg, dai: 9pt))
  // Mục 4: kèm nhãn `ten:` cùng lúc
  doan((0, 0.3), (4, 0.3), vach: 1, ten: $a$)
})

== Tam giác cân và hình bình hành — một lệnh cho mỗi cạnh

#hinh(w: 12cm, xmin: -0.5, xmax: 12, ymin: -0.6, ymax: 4, ctx => {
  let (A, B, C) = ((2, 3.5), (0, 0), (4, 0))
  doan(A, B, vach: 2)
  doan(A, C, vach: 2)
  doan(B, C)
  cac-diem((A, $A$, "above"), (B, $B$, "below-left"), (C, $C$, "below-right"))
  let (M, N, P, Q) = ((6, 0), (10, 0), (11.5, 3), (7.5, 3))
  doan(M, N, vach: "/")
  doan(Q, P, vach: "/")
  doan(N, P, vach: "//")
  doan(M, Q, vach: "//")
  cac-diem((M, $M$, "below"), (N, $N$, "below"), (P, $P$, "above"), (Q, $Q$, "above"))
})

== Hồi quy: `danh-dau` cũ vẫn chạy, giống hệt `doan(vach:)`

#hinh(w: 8cm, xmin: -0.5, xmax: 8, ymin: 0, ymax: 2, ctx => {
  doan((0, 1), (3, 1.6))
  danh-dau((0, 1), (3, 1.6), so: 2, nghieng: 25deg)
  doan((4.5, 1), (7.5, 1.6), vach: "//")
})

== `cac-doan` / `duong` cũng nhận `vach:`

#hinh(w: 13cm, xmin: -0.5, xmax: 15, ymin: -0.8, ymax: 4.2, ctx => {
  // Tam giác ĐỀU: một giá trị -> mọi cạnh của nét khép kín
  let (A, B, C) = ((1.5, 3.6), (0, 1), (3, 1))
  cac-doan(A, B, C, A, vach: 1)
  cac-diem((A, $A$, "above"), (B, $B$, "below-left"), (C, $C$, "below-right"))
  // Tam giác CÂN: mảng -> gán riêng từng cạnh (AB, BC, CA)
  let (D, E, F) = ((6, 3.6), (4.5, 0.5), (7.5, 0.5))
  cac-doan(duong(D, E, F, dong: true, vach: (2, 0, 2)))
  cac-diem((D, $D$, "above"), (E, $E$, "below-left"), (F, $F$, "below-right"))
  // Hình thoi: kiểu chung ở cac-doan, nét riêng đè bằng duong(...)
  let (M, N, P, Q) = ((9, 2), (11, 0), (13, 2), (11, 4))
  cac-doan(
    duong(M, N, P, Q, dong: true, mau: blue),          // lấy vach chung "//"
    duong(M, P, dut: true, vach: 0),                   // đường chéo: không vạch
    vach: "//",
  )
})
