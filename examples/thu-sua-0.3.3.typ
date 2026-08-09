// =====================================================================
// thu-sua-0.3.3.typ — KIỂM CHỨNG 5 hạng mục sửa/thêm cho bản 0.3.3
//   1. Nhãn có PHÂN SỐ / CĂN không còn bị nét vẽ cắt ngang (sơ đồ cây)
//   2. duong-tron-ngoai-tiep nhận ĐA GIÁC + nhãn tâm/bán kính né cạnh
//      + khung-vua để hình không tràn ra ngoài khung
//   3. Biểu đồ: tên trục hoành lui hẳn sang PHẢI đầu mũi tên
//   4. phan-giac: vach / so-cung đánh dấu hai góc bằng nhau
//   5. mui-ten-2-dau — mũi tên hai đầu ghi số đo
//
// Biên dịch: typst compile thu-sua-0.3.3.typ      (kỳ vọng 2 trang)
// =====================================================================
#import "../baigiang.typ": *

#set page(paper: "a4", margin: 1.4cm)
#set text(size: 10.5pt)

= 1. Nhãn phân số / căn trong sơ đồ cây

Trước 0.3.3, `measure($1/2$)` chỉ trả chiều cao MỘT DÒNG CHỮ nên phân số tràn
ra ngoài khung và bị cạnh của sơ đồ cắt ngang. Nay đo thêm theo biên nét chữ.

#align(center)[#so-do-cay(
  goc: $1$,
  nhanh: (
    nut($A$, xs: $1/6$, con: (
      nut($B$, xs: $1/2$, kq: $A B: 1/12$),
      nut($overline(B)$, xs: $sqrt(3)/2$, kq: $A overline(B): 1/12$),
    )),
    nut($overline(A)$, xs: $5/6$, con: (
      nut($B$, xs: $1/3$, kq: $overline(A) B: 5/18$),
      nut($overline(B)$, xs: $2/3$, kq: $overline(A) overline(B): 5/9$),
    )),
  ),
  w: 12cm, cao-hang: 1.7cm,
)]

= 2. Đường tròn ngoại tiếp đa giác + khung-vua

#grid(columns: 3, gutter: 6pt,
  // tam giác vuông: tâm ở giữa cạnh huyền -> bán kính tự né cạnh huyền
  {
    let (A, B, C) = ((0, 3), (0, 0), (4, 0))
    let (O, R) = tron-qua-diem((A, B, C))
    hinh(w: 5.2cm, ..khung-vua((A, B, C), (O, R)), ctx => {
      tam-giac(ctx, A, B, C)
      duong-tron-ngoai-tiep(ctx, A, B, C, ban-kinh: true, ten-r: $R$)
    })
  },
  // ngũ giác đều
  {
    let P = range(5).map(i => toa-cuc((0, 0), 1, 90 + i * 72))
    let (O, R) = tron-qua-diem(P)
    hinh(w: 5.2cm, ..khung-vua(P, (O, R)), ctx => {
      duong-tron-ngoai-tiep(ctx, P, canh: true, ban-kinh: true, ten-r: $R$)
    })
  },
  // tứ giác nội tiếp (4 đỉnh -> khớp bình phương bé nhất)
  {
    let P = range(4).map(i => toa-cuc((0, 0), 1, (20, 110, 200, 310).at(i)))
    let (O, R) = tron-qua-diem(P)
    hinh(w: 5.2cm, ..khung-vua(P, (O, R)), ctx => {
      duong-tron-ngoai-tiep(ctx, P, canh: true, mau: purple,
        ten-tam: $I$, ban-kinh: true, ten-r: $R$)
    })
  },
)

= 3. Biểu đồ — tên trục lui sang phải, không đè lên hình

#grid(columns: 2, gutter: 6pt,
  bieu-do-tan-so(
    moc: (150, 155, 160, 165, 170, 175), tan-so: (5, 12, 18, 9, 4),
    ten-x: [Chiều cao (cm)], w: 8.5cm,
  ),
  bieu-do-hop(du-lieu: (3, 5, 6, 8, 9, 12, 14, 15, 20), ten: [Điểm], w: 8.5cm),
)

#pagebreak()

= 4. Phân giác — đánh dấu hai góc bằng nhau

#grid(columns: 3, gutter: 6pt,
  hinh(w: 5.2cm, xmin: -1, xmax: 7, ymin: -1.2, ymax: 5, ctx => {
    let (A, B, C) = ((0, 0), (6, 0), (2, 4))
    tam-giac(ctx, A, B, C)
    phan-giac(ctx, A, B, C, r-cung: 1, vach: 1, ten-chan: $D$)
  }),
  hinh(w: 5.2cm, xmin: -1, xmax: 7, ymin: -1.2, ymax: 5, ctx => {
    let (A, B, C) = ((0, 0), (6, 0), (2, 4))
    tam-giac(ctx, A, B, C)
    phan-giac(ctx, A, B, C, r-cung: 1, vach: 2, mau: red)
  }),
  hinh(w: 5.2cm, xmin: -1, xmax: 7, ymin: -1.2, ymax: 5, ctx => {
    let (A, B, C) = ((0, 0), (6, 0), (2, 4))
    tam-giac(ctx, A, B, C)
    phan-giac(ctx, A, B, C, r-cung: 0.9, so-cung: 2, ten-goc: $alpha$, mau: blue)
  }),
)

= 5. `mui-ten-2-dau` — mũi tên hai đầu ghi số đo

#grid(columns: 2, gutter: 8pt,
  hinh(w: 8cm, xmin: -0.6, xmax: 6.6, ymin: -1.8, ymax: 3.6, ctx => {
    let (A, B, C, D) = ((0, 0), (5, 0), (5, 3), (0, 3))
    da-giac(ctx, (A, B, C, D))
    mui-ten-2-dau(ctx, (0, -0.6), (5, -0.6), ten: [5 cm], vach: true)
    mui-ten-2-dau(ctx, (5.5, 0), (5.5, 3), ten: $3/2 a$, vach: true, mau: blue)
    mui-ten-2-dau(ctx, (0, 1.5), (5, 1.5), ten: $sqrt(29)$, trong: false, mau: red)
  }),
  hinh(w: 8cm, xmin: -1, xmax: 6.2, ymin: -1.5, ymax: 4, ctx => {
    let (A, B, C) = ((0, 0), (5, 0), (1.5, 3))
    tam-giac(ctx, A, B, C)
    mui-ten-2-dau(ctx, (0, -0.7), (5, -0.7), ten: $a$, vach: true)
    mui-ten-2-dau(ctx, A, C, ten: [dài], trong: false, ten-quay: true,
      mau: green.darken(25%))
    mui-ten-2-dau(ctx, (5.4, 0), (5.4, 3), ten: $h$, vach: true, mau: blue, le: 2pt)
  }),
)

Đoạn quá ngắn để chứa chữ thì chữ TỰ nhảy ra ngoài thân:

#align(center)[#hinh(w: 9cm, xmin: -0.5, xmax: 5.5, ymin: -0.6, ymax: 1.6, ctx => {
  mui-ten-2-dau(ctx, (0, 1), (1.2, 1), ten: $2/3$)
  mui-ten-2-dau(ctx, (2, 1), (5, 1), ten: $1/2$, dut: true, mau: purple)
  mui-ten-2-dau(ctx, (0, 0), (5, 0), ten: [chú thích dài nên nhảy ra ngoài thân])
})]
