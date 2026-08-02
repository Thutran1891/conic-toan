// Thử ve-goc / ve-goc-vuong — lối viết TikZ: ĐỈNH góc đặt ở GIỮA.
// Hai hình mỗi mục phải giống HỆT nhau: trái viết lối cũ (đỉnh đầu),
// phải viết lối TikZ (đỉnh giữa).
#import "../baigiang.typ": *

#set page(width: 21cm, height: auto, margin: 1.5cm)
#set text(size: 11pt)

= Thử `ve-goc` và `ve-goc-vuong`

== 1. Góc vuông: `goc-vuong(O, A, B)` và `ve-goc-vuong(A, O, B)`

#grid(columns: (1fr, 1fr), column-gutter: 10pt,
  [
    #align(center)[Lối cũ — đỉnh ĐẦU]
    #hinh(w: 6cm, xmin: -0.6, xmax: 4.4, ymin: -0.6, ymax: 3.4, ctx => {
      let A = (0, 0)
      let B = (4, 0)
      let C = (0, 3)
      da-giac((A, B, C))
      cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"))
      goc-vuong(A, B, C, r: 0.4)
    })
  ],
  [
    #align(center)[Lối TikZ — đỉnh GIỮA]
    #hinh(w: 6cm, xmin: -0.6, xmax: 4.4, ymin: -0.6, ymax: 3.4, ctx => {
      let A = (0, 0)
      let B = (4, 0)
      let C = (0, 3)
      da-giac((A, B, C))
      cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"))
      ve-goc-vuong(B, A, C, r: 0.4)
    })
  ],
)

== 2. Góc thường: `goc(O, A, B)` và `ve-goc(A, O, B)`

#grid(columns: (1fr, 1fr), column-gutter: 10pt,
  [
    #align(center)[Lối cũ — đỉnh ĐẦU]
    #hinh(w: 6cm, xmin: -0.6, xmax: 4.4, ymin: -0.6, ymax: 3.4, ctx => {
      let A = (0, 0)
      let B = (4, 0)
      let C = (0, 3)
      da-giac((A, B, C))
      cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"))
      goc(B, A, C, r: 0.7, so-do: true, mau: blue)
      // cach-nhan: 1.2 -> nhãn nằm sát ngay ngoài mép cung (mặc định 1.9 là xa)
      goc(C, A, B, r: 0.7, ten: $alpha$, mau: red, to: rgb(255, 170, 0, 70), cach-nhan: 1.2)
    })
  ],
  [
    #align(center)[Lối TikZ — đỉnh GIỮA]
    #hinh(w: 6cm, xmin: -0.6, xmax: 4.4, ymin: -0.6, ymax: 3.4, ctx => {
      let A = (0, 0)
      let B = (4, 0)
      let C = (0, 3)
      da-giac((A, B, C))
      cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"))
      ve-goc(A, B, C, r: 0.7, so-do: true, mau: blue)
      ve-goc(A, C, B, r: 0.7, ten: $alpha$, mau: red, to: rgb(255, 170, 0, 70), cach-nhan: 1.2)
    })
  ],
)

== 3. Truyền đủ tuỳ chọn: `so-cung`, `vach`, `cach-nhan`, `day`

#align(center)[
  #hinh(w: 8cm, xmin: -2.6, xmax: 2.6, ymin: -0.6, ymax: 2.6, ctx => {
    let O = (0, 0)
    let A = (2.4, 0)
    let B = (-2.4, 0)
    let M = (1.4, 2.0)
    let N = (-1.4, 2.0)
    cac-doan((B, A), (O, M), (O, N))
    cac-diem(
      (O, $O$, "below"), (A, $A$, "right"), (B, $B$, "left"),
      (M, $M$, "above-right"), (N, $N$, "above-left"),
    )
    // hai góc bằng nhau: đánh 2 vạch cắt ngang cung
    ve-goc(A, O, M, r: 0.8, vach: 2, mau: green.darken(20%))
    ve-goc(N, O, B, r: 0.8, vach: 2, mau: green.darken(20%))
    // góc giữa: 2 cung đồng tâm + nhãn đặt xa hơn
    ve-goc(M, O, N, r: 0.55, so-cung: 2, ten: $beta$, cach-nhan: 2.2, day: 1pt)
  })
]

== 4. Dùng lẫn hai lối trong CÙNG một hình

#align(center)[
  #hinh(w: 7cm, xmin: -2.6, xmax: 2.6, ymin: -2.6, ymax: 2.6, ctx => {
    let O = (0, 0)
    let R = 2
    let A = toa-cuc(O, R, 180deg)
    let B = toa-cuc(O, R, 0deg)
    let C = toa-cuc(O, R, 55deg)
    let H = (C.at(0), 0)
    duong-tron(O, R)
    cac-doan((A, B), (A, C), (C, B), (C, H))
    cac-diem(
      (A, $A$, "left"), (B, $B$, "right"),
      (C, $C$, "above-right"), (H, $H$, "below"), (O, $O$, "below-left"),
    )
    goc-vuong(C, A, B, r: 0.3)          // lối cũ: đỉnh C (góc nội tiếp chắn nửa đường tròn)
    ve-goc-vuong(C, H, B, r: 0.3)       // lối TikZ: đỉnh H (CH vuông góc AB)
    ve-goc(C, A, B, r: 0.6, so-do: true, mau: blue)
  })
]
