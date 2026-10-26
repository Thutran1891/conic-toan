// Hồi quy 0.4.2 — BBT, đồ thị và hình học tự theo cỡ chữ hồ sơ.
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ CỠ CHỮ BBT, ĐỒ THỊ VÀ HÌNH HỌC],
  thong-tin-hs: false,
)

#tn([
  Hàm số $y = f(x)$ có bảng biến thiên như sau:
  #align(center, bbt-bac-hai(1, -6, 12))
  Giá trị cực tiểu của hàm số bằng
], ([0], [9], [3], [-3]), dap-an: "C")

#tn([
  Cho hàm số $y = f(x)$ có đồ thị như hình bên. Tung độ đỉnh của đồ thị bằng
], ([-2], [-1], [1], [2]), dap-an: "A",
  fig: do-thi-bac-hai(1, 2, -1, w: 7cm, ten: $y = f(x)$, vach: true),
  fig-width: 42%,
)

#tn([
  Trong không gian $O x y z$, hình vẽ bên minh hoạ các điểm $A$, $B$, $S$.
  Nhãn điểm và nhãn trục phải tự tăng theo chữ trình chiếu.
], ([$A$], [$B$], [$O$], [$S$]), dap-an: "D",
  fig: oxyz(
    w: 6.5cm, x: 4, y: 5, z: 8, don-vi: false,
    them: (ctx, t3) => {
      let A = (3, 0, 0)
      let B = (0, 4, 0)
      let S = (0, 0, 7)
      doan-oxyz(ctx, t3, A, B)
      doan-oxyz(ctx, t3, A, S)
      doan-oxyz(ctx, t3, B, S)
      diem-oxyz(ctx, t3, A, ten: $A$, huong: "below-left")
      diem-oxyz(ctx, t3, B, ten: $B$, huong: "below-right")
      diem-oxyz(ctx, t3, S, ten: $S$, huong: "left")
    },
  ),
  fig-width: 40%,
)

#slide(tieu-de: [Cỡ chữ riêng của slide], co-chu: 16pt)[
  Khi thân slide thu xuống 16pt, các nhãn sau cũng thu theo:

  #grid(
    columns: (1fr, 1fr), gutter: 12pt,
    align(center, bbt-bac-hai(-1, 2, 3)),
    align(center, hinh(w: 6cm, xmin: -0.7, xmax: 4.7, ymin: -0.8, ymax: 3.8, ctx => {
      tam-giac(ctx, (0, 0), (4, 0), (1.3, 3), ten: ($A$, $B$, $C$))
      trung-tuyen(ctx, (1.3, 3), (0, 0), (4, 0), ten-chan: $M$)
    })),
  )
]
