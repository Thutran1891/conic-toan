// File thử 3 nhóm tính năng mới (07/2026):
//   1. goc(..., vach: 1|2|3) — vạch đánh dấu cắt ngang cung góc
//   2. truc-tam / tam-bang-tiep + ve-truc-tam / duong-tron-bang-tiep
//   3. khoi-tron-xoay — miền phẳng -> khối tròn xoay (Ox/Oy, mặt cắt)
#import "../baigiang.typ": *

#set page(margin: 1.4cm)
#set text(font: "New Computer Modern", size: 11pt)

= 1. Vạch đánh dấu trên cung góc

#grid(columns: 3, column-gutter: 8pt,
  hinh(w: 4.4cm, xmin: -0.6, xmax: 4, ymin: -0.6, ymax: 3, ctx => {
    let (A, B, C) = ((0, 0), (3.4, 0), (1.1, 2.5))
    tam-giac(A, B, C)
    goc(A, B, C, vach: 1, mau: red, r: 0.6)
    goc(B, C, A, vach: 1, mau: red, r: 0.6)
    nhan((1.7, 2.7), [1 vạch: hai góc bằng nhau], huong: "tren")
  }),
  hinh(w: 4.4cm, xmin: -0.6, xmax: 4, ymin: -0.6, ymax: 3, ctx => {
    let (A, B, C) = ((0, 0), (3.4, 0), (1.7, 2.5))
    tam-giac(A, B, C)
    goc(A, B, C, vach: 2, mau: blue, r: 0.7, so-do: true)
    goc(C, A, B, vach: 3, mau: green.darken(20%), r: 0.55)
  }),
  hinh(w: 4.4cm, xmin: -0.6, xmax: 4, ymin: -0.6, ymax: 3, ctx => {
    let (A, B, C) = ((0.2, 0.2), (3.6, 0.4), (1.4, 2.6))
    tam-giac(A, B, C)
    // bí danh vach-danh-dau + kết hợp tô quạt, đặt tên
    goc(A, B, C, vach-danh-dau: 2, to: rgb(255, 170, 0, 70),
      ten: $alpha$, r: 0.7, mau: orange.darken(25%))
  }),
)

= 2. Trực tâm & đường tròn bàng tiếp

#grid(columns: 2, column-gutter: 10pt,
  hinh(w: 6.6cm, xmin: -0.8, xmax: 5, ymin: -0.8, ymax: 3.6, ctx => {
    ve-truc-tam((0, 0), (4.4, 0), (1.3, 3))
  }),
  hinh(w: 6.6cm, xmin: -2.6, xmax: 9, ymin: -4.4, ymax: 4.4, ctx => {
    let (A, B, C) = ((0, 0), (4, 0), (1.2, 2.6))
    tam-giac(A, B, C)
    duong-tron-noi-tiep(A, B, C, ban-kinh: true)
    duong-tron-bang-tiep(A, B, C, ban-kinh: true)
  }),
)

Kiểm giá trị: trực tâm tam giác vuông tại gốc (0,0), (3,0), (0,4) phải là chính
đỉnh góc vuông $(0; 0)$ — kết quả: #{
  let H = truc-tam((0, 0), (3, 0), (0, 4))
  [$(#calc.round(H.at(0), digits: 6); #calc.round(H.at(1), digits: 6))$]
}. Tam giác $3-4-5$: bán kính nội tiếp $r = 1$, bàng tiếp trong góc vuông
$r_A = 6$ — kết quả: #{
  let (I, r) = tam-noi-tiep((0, 0), (3, 0), (0, 4))
  let (J, ra) = tam-bang-tiep((0, 0), (3, 0), (0, 4))
  [$r = #calc.round(r, digits: 4)$, $r_A = #calc.round(ra, digits: 4)$]
}.

#pagebreak()

= 3. Khối tròn xoay

== 3.1. Quay quanh $O x$ — miền dưới $y = sqrt(x)$ trên $[0; 4]$

#khoi-tron-xoay(x => calc.sqrt(x), 0, 4, w: 5.4cm, ten-ham: $y = sqrt(x)$, the-tich: true)

== 3.2. Có mặt cắt (thiết diện) tại $x = 2$

#khoi-tron-xoay(
  x => 0.35 * x * x + 0.5, 0, 3,
  w: 5.4cm, mat-cat: 2, ten-ham: $y = f(x)$, the-tich: true,
)

== 3.3. Khối rỗng (vành khăn) và quay quanh $O y$

#grid(columns: 2, column-gutter: 6pt,
  khoi-tron-xoay(
    x => 1.6, 0, 3, g: x => 0.7,
    w: 4.2cm, ten-ham: $y = 1,6$, ten-ham-trong: $y = 0,7$, the-tich: true,
  ),
  khoi-tron-xoay(
    y => 0.6 + 0.5 * y, 0, 3,
    truc: "Oy", w: 3.4cm, the-tich: true,
  ),
)

== 3.4. Chỉ lấy một hình + vẽ thêm

#grid(columns: 2, column-gutter: 10pt,
  khoi-tron-xoay(x => calc.sin(x * 1rad) + 1.2, 0, 3.14, hien: "mien", w: 5.2cm),
  khoi-tron-xoay(
    x => calc.sin(x * 1rad) + 1.2, 0, 3.14, hien: "khoi", w: 5.2cm,
    them: ctx => nhan((1.57, 2.6), [khối tròn xoay], huong: "tren", mau: blue),
  ),
)
