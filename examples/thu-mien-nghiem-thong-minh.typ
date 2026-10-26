#import "../baigiang.typ": *

#set page(width: 21cm, height: 29.7cm, margin: 1.5cm)

= Miền rất rộng — tự chọn khung chữ nhật và bước trục

#mien-nghiem(
  bpt(1, 20, 120, dau: "<=", ten: $x + 20y = 120$),  
  xmin: -100, xmax: 300, ymin: -10, ymax: 20,
  vach: true, luoi-o: true, giao-truc: auto
)

= Miền rất cao — hai trục có bước độc lập

#mien-nghiem(
  bpt(20, 1, 120, dau: ">=", ten: $20x + y = 120$, mau-gach: blue),
  xmin: -10, xmax: 20, ymin: -100, ymax: 300,
  vach: true, luoi-o: true,
)

= Ghi đè bước chia

#mien-nghiem(
  bpt(1, 1, 50, dau: "<="),
  xmin: -20, xmax: 120, ymin: -10, ymax: 80,
  vach: true, buoc-x: 20, buoc-y: 10,
)

= Hồi quy cửa sổ quen thuộc

#mien-nghiem(
  bpt(4, 5, -8, dau: "<", mau-gach: purple),  
  xmin: -5, xmax: 5, ymin: -4, ymax: 4,
  vach: true,
)

= `ve-ham` trong khung tọa độ chữ nhật

#hinh(
  w: 5cm, xmin: -4, xmax: 4, ymin: -1, ymax: 20,
  toa-do-chu-nhat: false,
  ctx => {
    truc()
    vach-chia()
    ve-ham(x => x*x + 10)
  },
)

#hinh(
  w: 5cm, xmin: -4, xmax: 4, ymin: -1, ymax: 20,
  toa-do-chu-nhat: true,
  ctx => {
    truc()
    vach-chia()
    ve-ham(x => x*x + 10)
  },
)


= `do-thi-ham` tự động

#do-thi-ham(
  x => x*x + 10,
  w: 5cm, xmin: -4, xmax: 4, ymin: -1, ymax: 20,
  vach: true,
)

#do-thi-ham(
  x => x*x + 100,
  w: 5cm, xmin: -4, xmax: 4, ymin: -10, ymax: 200,
  vach: true,
)


= `ve-do-thi` tự chọn cửa sổ và khung

#ve-do-thi(
  x => x*x + 10,
  w: 6cm, xmin: -5, xmax: 5,
  vach: true, luoi-o: true,
)

= `ve-do-thi` không vẽ trục nằm ngoài cửa sổ

#ve-do-thi(
  x => x*x*x,
  w: 6cm, xmin: -5, xmax: 5,
  vach: true, luoi-o: true, huong-goc: "below-right"
)

#do-thi-bac-ba(1, 3, 0, 2)

= Bốn vị trí nhãn gốc O

#grid(
  columns: (1fr, 1fr), gutter: 8mm,
  ..("above-left", "above-right", "below-left", "below-right").map(hg => [
    #hinh(w: 5cm, h: 3.4cm, xmin: -3, xmax: 3, ymin: -2, ymax: 2, ctx => {
      he-truc(huong-goc: hg, luoi-o: false, vach: false)
      ve-ham(x => x, mau: red)
    })
  ]),
)

= Đồ thị căn tam thức bậc hai

#grid(
  columns: (1fr, 1fr), gutter: 8mm,
  do-thi-can-tam-thuc-bac-hai(1, 0, -4, w: 6cm, huong-goc: "above-right"),
  do-thi-can-tam-thuc-bac-hai(-1, 0, 4, w: 6cm, huong-goc: "below-right"),
  do-thi-can-tam-thuc-bac-hai(1, -2, 1, w: 6cm, huong-goc: "above-left"),
  do-thi-can-tam-thuc-bac-hai(-1, 0, -1, w: 6cm),
)

= Nhãn O trên năm đồ thị dựng sẵn

#grid(
  columns: (1fr, 1fr), gutter: 7mm,
  do-thi-bac-hai(1, -2, -3, w: 5.5cm, huong-goc: "above-right"),
  do-thi-bac-ba(1, 0, -3, 1, w: 5.5cm, huong-goc: "below-right"),
  do-thi-trung-phuong(1, -2, 0, w: 5.5cm, huong-goc: "above-left"),
  do-thi-phan-thuc(2, -1, 1, -1, w: 5.5cm, huong-goc: "above-right"),
  do-thi-huu-ti(1, 4, 20, 1, 2, w: 5.5cm, huong-goc: "below-right"),
)
