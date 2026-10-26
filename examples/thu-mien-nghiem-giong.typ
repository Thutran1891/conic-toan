#import "../baigiang.typ": *
#set page(width: 21cm, height: auto, margin: 1.2cm)

= 1. Hệ 3 bpt — tô miền ⇒ KHÔNG gạch, có gióng (1; 2)
#mien-nghiem(
  bpt(2, 1, 4, dau: "<=", mau: blue, ten: $2x + y = 4$),
  bpt(1, -1, -1, dau: ">=", mau: red, ten: $x - y = -1$),
  bpt(0, 1, 0, dau: ">=", mau: green.darken(20%), ten: $y = 0$),
  w: 8cm, xmin: -2, xmax: 3, ymin: -1, ymax: 5,
  to-mien: rgb(30, 100, 200, 40), giao-truc: auto,
)

= 2. Cùng hệ, KHÔNG tô ⇒ gạch như cũ
#mien-nghiem(
  bpt(2, 1, 4, dau: "<=", mau: blue, ten: $2x + y = 4$),
  bpt(1, -1, -1, dau: ">=", mau: red, ten: $x - y = -1$),
  bpt(0, 1, 0, dau: ">=", mau: green.darken(20%), ten: $y = 0$),
  w: 8cm, xmin: -2, xmax: 3, ymin: -1, ymax: 5, giao-truc: auto,
)

= 3. Tô + ép gạch (gach: true); một bpt tô
#grid(columns: 2, gutter: 1cm,
  mien-nghiem(bpt(2, 1, 4, mau: red, ten: $2x + y = 4$), w: 7cm,
    xmin: -1, xmax: 3, ymin: -1, ymax: 5, to-mien: rgb(30, 100, 200, 40), gach: true, giao-truc: auto),
  mien-nghiem(bpt(2, 1, 4, mau: red, ten: $2x + y = 4$), w: 7cm,
    xmin: -1, xmax: 3, ymin: -1, ymax: 5, to-mien: rgb(30, 100, 200, 40), giao-truc: auto),
)

= 4. Bốn góc phần tư — hướng nhãn tự né
#grid(columns: 2, gutter: 1cm,
  mien-nghiem(bpt(1, 1, 1, mau: red), bpt(1, -1, -3, mau: blue), w: 7cm,
    xmin: -4, xmax: 3, ymin: -3, ymax: 4, to-mien: rgb(30, 100, 200, 40)),   // (-1; 2)
  mien-nghiem(bpt(1, 1, -3, mau: red), bpt(1, -1, 1, mau: blue), w: 7cm,
    xmin: -4, xmax: 3, ymin: -4, ymax: 3, to-mien: rgb(30, 100, 200, 40)),   // (-1; -2)
  mien-nghiem(bpt(1, 1, 1, mau: red), bpt(1, -1, 3, mau: blue), w: 7cm,
    xmin: -3, xmax: 4, ymin: -4, ymax: 3, to-mien: rgb(30, 100, 200, 40)),   // (2; -1)
  mien-nghiem(bpt(1, 0, 3, mau: red), bpt(0, 1, 2, mau: blue),
    bpt(1, 0, 0, dau: ">=", mau: black), bpt(0, 1, 0, dau: ">=", mau: black), w: 7cm,
    xmin: -1, xmax: 4, ymin: -1, ymax: 3, to-mien: rgb(30, 100, 200, 40), giao-truc: auto), // đường đứng/ngang
)

= 5. Quy hoạch tuyến tính — giong-giao: "mien" (chỉ đỉnh miền) vs true
#grid(columns: 2, gutter: 1cm,
  mien-nghiem(bpt(1, 2, 100, mau: red), bpt(2, 1, 80, mau: blue),
    bpt(1, 0, 0, dau: ">="), bpt(0, 1, 0, dau: ">="),
    w: 7cm, xmin: -10, xmax: 110, ymin: -10, ymax: 90, to-mien: rgb(220, 60, 120, 60),
    giao-truc: auto, giong-giao: "mien"),
  mien-nghiem(bpt(1, 2, 100, mau: red), bpt(2, 1, 80, mau: blue),
    bpt(1, 0, 0, dau: ">="), bpt(0, 1, 0, dau: ">="),
    w: 7cm, xmin: -10, xmax: 110, ymin: -10, ymax: 90, to-mien: rgb(220, 60, 120, 60),
    giao-truc: auto),
)

= 6. giong-giao: false — trở lại dáng cũ (không gióng)
#mien-nghiem(bpt(1, 1, 1, mau: red), bpt(1, -1, -3, mau: blue), w: 7cm,
  xmin: -4, xmax: 3, ymin: -3, ymax: 4, giong-giao: false)
