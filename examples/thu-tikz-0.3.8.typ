#import "../baigiang.typ": *

#set page(width: 21cm, height: 29.7cm, margin: 9mm)
#set text(font: "Arial", size: 10pt)

= Thử bốn nhóm API vẽ mới 0.3.8

#grid(
  columns: (1fr, 1fr),
  gutter: 8mm,
  row-gutter: 6mm,
  [
    *1. Path mở, nhiều đường con, đầu tên tiếp tuyến*
    #hinh(w: 8.4cm, ctx => {
      duong-path(
        (0, 0), noi-bezier((1, 2.6), (2.2, 2.6), (3, 0)),
        noi-cung((4, 0), 1, tu: 180deg, den: 0deg),
        bat-dau((0, -1.2)), (2, -1.2), (3, -0.4),
        mau: blue, day: 1.4pt, mui-ten-dau: 6pt, mui-ten-cuoi: 7pt,
      )
    })
  ],
  [
    *2. Đồ thị tham số và đồ thị cực*
    #hinh(w: 8.4cm, xmin: -3.2, xmax: 3.2, ymin: -2.7, ymax: 2.7, ctx => {
      truc()
      ve-tham-so(t => (2.5 * calc.cos(t), 1.45 * calc.sin(t)), 0deg, 360deg,
        mau: teal, n: 160)
      ve-cuc(t => 1.25 + 0.75 * calc.cos(3 * t), mau: purple, n: 220)
    })
  ],
  [
    *3. Affine: co giãn, nghiêng, đối xứng*
    #hinh(w: 8.4cm, xmin: -4, xmax: 5, ymin: -3.2, ymax: 3.2, ctx => {
      let A = (0, 0); let B = (2, 0); let C = (0.5, 1.6)
      tam-giac(ctx, A, B, C, ten: none, mau: luma(55%))
      tam-giac(ctx-nghieng(ctx, theo-x: 0.7), A, B, C, ten: none, mau: blue)
      tam-giac(ctx-ti-le(ctx, -1, ky: 1, tam: A), A, B, C, ten: none, mau: red)
      tam-giac(ctx-doi-xung(ctx, truc: ((3, -1), (3, 2))), A, B, C,
        ten: none, mau: green.darken(75%))
      duong-tron(ctx-nghieng(ctx, theo-x: 0.7), (1, 0.6), 0.35, mau: orange)
    })
  ],
  [
    *4a. Giao hai đường cong tham số*
    #hinh(w: 8.4cm, xmin: -2.6, xmax: 2.6, ymin: -2.2, ymax: 2.2, ctx => {
      let P = t => (2 * calc.cos(t), 1.5 * calc.sin(t))
      let Q = t => (t, 0.5 * t)
      ve-tham-so(P, 0deg, 360deg, mau: blue)
      ve-tham-so(Q, -3, 3, mau: red)
      for X in giao-duong-cong(P, 0deg, 360deg, Q, -3, 3, n: 220) {
        diem(X, mau: orange, bk: 2.8pt)
      }
    })
  ],
  [
    *4b. Node–anchor–connector tự chạm biên*
    #hinh(w: 8.4cm, xmin: -0.8, xmax: 6.8, ymin: -2.2, ymax: 2.2, ctx => {
      let A = nut-hinh((0.6, 0.8), [Bắt đầu], to: blue.lighten(82%))
      let B = nut-hinh((3.5, 0), $x^2 + y^2 = 1$, kieu: "elip",
        to: orange.lighten(80%))
      let C = nut-hinh((6, -1), [Kết thúc], kieu: "chu-nhat",
        to: green.lighten(82%))
      noi-nut(A, B, mui-ten-cuoi: 7pt, mau: blue)
      noi-nut(B, C, neo-dau: "east", neo-cuoi: "west",
        mui-ten-cuoi: 7pt, mau: green.darken(20%))
      ve-nut(A); ve-nut(B); ve-nut(C)
    })
  ],
  [
    *Path đóng nhiều đường con*
    #hinh(w: 8.4cm, xmin: -0.5, xmax: 6.5, ymin: -0.8, ymax: 3.2, ctx => {
      duong-path(
        (0, 0), (2.5, 0), (2.5, 2.5), (0, 2.5),
        bat-dau((3.4, 0.3)), (5.8, 0.3), (5.8, 2.2), (3.4, 2.2),
        dong: true, to: rgb(80, 130, 210, 70), mau: blue,
      )
    })
  ],
)
