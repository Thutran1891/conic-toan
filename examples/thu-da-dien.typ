// File thử engine đa diện tổng quát (07/2026):
//   1. da-dien + các khối dựng sẵn (khoi-*), nét khuất tự động
//   2. camera: chieu-xien / chieu-truc-giao (góc Euler) / chieu-oxyz
//   3. khối tự khai đỉnh + mặt (tam diện vuông, chóp đáy thang, hộp lệch)
//   4. mat-phang-oxyz — mặt phẳng cắt 3 trục, trục sau mặt phẳng tự đứt
//   5. mat-phang-bh — mặt phẳng lơ lửng
//   6. thiet-dien — cắt khối lồi bởi mặt phẳng (liền/đứt theo mặt chứa cạnh)
#import "../baigiang.typ": *

#set page(margin: 1.3cm)
#set text(font: "New Computer Modern", size: 11pt)

= 1. Khối dựng sẵn — nét khuất tự động

#grid(columns: 3, column-gutter: 6pt, row-gutter: 10pt,
  da-dien(..khoi-chop-deu(n: 4, R: 1.9, cao: 3.6), w: 4.6cm,
    to: blue.lighten(86%)),
  da-dien(..khoi-chop-deu(n: 6, R: 1.9, cao: 3.6), w: 4.6cm,
    to: green.lighten(86%)),
  da-dien(..khoi-lang-tru-deu(n: 3, R: 1.6, cao: 3.4), w: 4.6cm,
    to: orange.lighten(84%)),
  da-dien(..khoi-lang-tru-deu(n: 6, R: 1.7, cao: 3.2), w: 4.6cm,
    to: purple.lighten(88%)),
  da-dien(..khoi-chop-cut-deu(n: 4, R: 2, r: 1.05, cao: 2.8), w: 4.6cm,
    to: red.lighten(88%)),
  da-dien(..khoi-hop-chu-nhat(dai: 3.4, rong: 2.2, cao: 2.6), w: 4.6cm,
    to: blue.lighten(90%)),
)

#grid(columns: 3, column-gutter: 6pt,
  da-dien(..khoi-lap-phuong(a: 2.6), w: 4.6cm, to: luma(92%)),
  da-dien(..khoi-tu-dien-deu(a: 3.2), w: 4.6cm, to: teal.lighten(86%)),
  da-dien(..khoi-bat-dien-deu(a: 2.6), w: 4.6cm, to: yellow.lighten(70%)),
)

= 2. Đổi camera cùng một khối

Cùng một hình lập phương, ba camera khác nhau (chiếu xiên · trực giao góc Euler
thấp · trực giao nhìn từ cao xuống):

#grid(columns: 3, column-gutter: 6pt,
  da-dien(..khoi-lap-phuong(a: 2.6), w: 4.6cm, to: luma(92%),
    cam: chieu-xien(goc: 30deg, k: 0.62)),
  da-dien(..khoi-lap-phuong(a: 2.6), w: 4.6cm, to: luma(92%),
    cam: chieu-truc-giao(ngang: 60deg, cao: 12deg)),
  da-dien(..khoi-lap-phuong(a: 2.6), w: 4.6cm, to: luma(92%),
    cam: chieu-truc-giao(ngang: 40deg, cao: 45deg)),
)

= 3. Khối tự khai đỉnh + mặt

#grid(columns: 3, column-gutter: 6pt,
  // tam diện vuông OABC
  da-dien(
    dinh: ((0, 0, 0), (3.2, 0, 0), (0, 3, 0), (0, 0, 3)),
    mat: ((0, 1, 2), (0, 1, 3), (0, 2, 3), (1, 2, 3)),
    ten: ($O$, $A$, $B$, $C$), w: 4.6cm, to: blue.lighten(88%),
  ),
  // chóp có đáy hình thang ABCD
  da-dien(
    dinh: ((0, 0, 0), (3.6, 0, 0), (2.7, 2.4, 0), (0.9, 2.4, 0), (1.8, 1.1, 3.4)),
    mat: ((0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4)),
    ten: ($A$, $B$, $C$, $D$, $S$), w: 4.6cm, to: green.lighten(88%),
  ),
  // hộp lệch: ba vectơ cạnh bất kì
  da-dien(
    ..khoi-hop((0, 0, 0), (3, 0, 0), (0.6, 2.2, 0), (0.9, 0.4, 2.8)),
    w: 4.6cm, to: orange.lighten(86%),
  ),
)

Tô riêng từng mặt (mảng `to-mat`, `auto` = theo `to`) và ẩn nét khuất
(ẩn luôn các đỉnh chỉ thuộc mặt sau):

#grid(columns: 2, column-gutter: 8pt,
  da-dien(..khoi-chop-deu(n: 4, R: 1.9, cao: 3.4), w: 6.2cm,
    to: luma(94%), to-mat: (auto, rgb(220, 90, 90, 120), auto, auto, auto)),
  da-dien(..khoi-lang-tru-deu(n: 6, R: 1.7, cao: 3), w: 6.2cm,
    to: blue.lighten(85%), hien-khuat: false),
)

#pagebreak()

= 4. Mặt phẳng cắt ba trục trong Oxyz

#grid(columns: 2, column-gutter: 8pt,
  oxyz(w: 6.6cm, x: 5, y: 6, z: 5, vach: true, don-vi: false,
    them: (ctx, t3) => {
      mat-phang-oxyz(ctx, t3, 4, 5, 3.5, ten-dinh: true, ten: $(P)$,
        ten-tai: 1, huong: "above-right")
    }),
  oxyz(w: 6.6cm, x: 5, y: 6, z: 5, don-vi: false,
    them: (ctx, t3) => {
      // ba trục kéo dài hai phía: khai phạm vi để xử lí nét đứt đúng
      mat-phang-oxyz(ctx, t3, 3, 4, 4.5, ten-dinh: true,
        to: green.lighten(70%).transparentize(45%), mau: green.darken(25%),
        truc: ((0, 5), (0, 6), (0, 5)))
    }),
)

Mặt phẳng lơ lửng (hình bình hành) + mặt phẳng đứng song song mặt $(y O z)$:

#grid(columns: 2, column-gutter: 8pt,
  oxyz(w: 6.6cm, x: 5, y: 6, z: 5, don-vi: false,
    them: (ctx, t3) => {
      mat-phang-bh(ctx, t3, (2.2, 2.8, 2.6), (2.4, 0, 0), (0, 2.6, 0),
        ten: $(alpha)$, truc: ((0, 5), (0, 6), (0, 5)))
      diem-oxyz(ctx, t3, (2.2, 2.8, 2.6), ten: $I$, huong: "below-right", mau: red)
    }),
  oxyz(w: 6.6cm, x: 5, y: 6, z: 5, don-vi: false,
    them: (ctx, t3) => {
      mat-phang-bh(ctx, t3, (2.5, 3, 2.4), (0, 2.6, 0), (0, 0, 2),
        ten: $(Q)$, mau: purple.darken(15%),
        to: purple.lighten(72%).transparentize(40%),
        truc: ((0, 5), (0, 6), (0, 5)))
    }),
)

= 5. Thiết diện

Mặt phẳng trung trực đường chéo hình lập phương (thiết diện là lục giác đều)
và mặt phẳng qua $A$, trung điểm $B C$, đỉnh $C'$:

#let lp = khoi-lap-phuong(a: 2.8)
#let d = lp.dinh
#let mp-luc = mp-qua-phap((1.4, 1.4, 1.4), (1, 1, 1))
#grid(columns: 2, column-gutter: 8pt,
  da-dien-thiet-dien(..lp, w: 6.4cm, to: luma(95%), mp: mp-luc),
  da-dien-thiet-dien(
    ..lp, w: 6.4cm, to: luma(95%),
    mp: mp-qua-3-diem(d.at(0), trung-diem-3d(d.at(1), d.at(2)), d.at(6)),
  ),
)

Thiết diện của chóp (mặt phẳng đi qua ĐỈNH $A$ và trung điểm $S B$, $S D$)
và của lăng trụ lục giác:

#let ch = khoi-chop-deu(n: 4, R: 1.9, cao: 3.6)
#let lt = khoi-lang-tru-deu(n: 6, R: 1.7, cao: 3.2)
#grid(columns: 2, column-gutter: 8pt,
  da-dien-thiet-dien(
    ..ch, w: 6.4cm, to: blue.lighten(92%),
    mp: mp-qua-3-diem(
      ch.dinh.at(0),
      trung-diem-3d(ch.dinh.at(1), ch.dinh.at(4)),
      trung-diem-3d(ch.dinh.at(3), ch.dinh.at(4)),
    ),
    td: (mau: red.darken(10%)),
  ),
  da-dien-thiet-dien(
    ..lt, w: 6.4cm, to: green.lighten(92%),
    mp: mp-qua-phap((0, 0, 1.6), (0.35, 0.15, 1)),
    td: (mau: red.darken(10%)),
  ),
)

Kiểm giá trị. Thiết diện trung trực đường chéo của lập phương cạnh $a = 2.8$ là
LỤC GIÁC ĐỀU cạnh $(a sqrt(2)) / 2 = 1.9799$; mặt phẳng qua ba trung điểm của
ba cạnh cùng đỉnh cắt ra TAM GIÁC ĐỀU cũng cạnh $1.9799$.

#let bao(nhan, mp) = context {
  let td = thiet-dien(lp.dinh, lp.mat, mp)
  let canh = range(td.len()).map(i => v3-dai(v3-tru(
    td.at(calc.rem(i + 1, td.len())), td.at(i),
  )))
  [#nhan — số đỉnh: *#td.len()* · các cạnh:
    #canh.map(x => str(calc.round(x, digits: 4))).join(", ")]
}

#bao([Lục giác], mp-luc)

#bao([Tam giác], mp-qua-3-diem(
  trung-diem-3d(d.at(0), d.at(1)),
  trung-diem-3d(d.at(1), d.at(2)),
  trung-diem-3d(d.at(1), d.at(5)),
))

#pagebreak()

= 6. Điểm phụ (`diem:`) và đoạn phụ (`duong:`)

Điểm nằm TRÊN CẠNH tự đặt nhãn vuông góc với cạnh đó; đoạn phụ tự vẽ đứt ở
phần chui vào trong khối.

#let cd = khoi-chop-deu(n: 4, R: 1.9, cao: 3.6)
#let (A, B, C, D, S) = cd.dinh
#let O = tam-3d((A, B, C, D))
#let M = trung-diem-3d(S, B)
#let N = diem-canh(cd.dinh, 2, 4, t: 0.6)   // trên SC, chia tỉ lệ 0.6
#let H = hinh-chieu-3d(A, S, C)             // chân đường vuông góc hạ từ A xuống SC

#grid(columns: 2, column-gutter: 8pt,
  // đường cao SO: thấy ở ngoài, ĐỨT khi vào trong khối; kèm góc vuông tại O
  da-dien(
    ..cd, w: 6.4cm, to: blue.lighten(92%),
    diem: ((O, $O$), (M, $M$), (N, $N$)),
    duong: (
      (S, O, (mau: red, vuong: A, ten: $h$, tai: 0.22, huong: "right", cach: 4pt)),
      (A, M, (mau: green.darken(25%))),
      (M, N, (mau: green.darken(25%))),
    ),
  ),
  // AH ⊥ SC: H nằm TRÊN cạnh SC (nét liền), còn AH xuyên trong khối -> đứt
  da-dien(
    ..cd, w: 6.4cm, to: luma(95%),
    diem: ((O, $O$), (H, $H$, auto, red)),
    duong: (
      (S, O, (mau: luma(45%))),
      (A, H, (mau: red, vuong: S)),
      (A, C, (mau: blue, ten: $2 R$, tai: 0.28)),
    ),
  ),
)

Trung điểm các cạnh hình lập phương (mọi điểm nằm trên cạnh) và đường chéo
$A C'$ (phần nằm trong khối tự đứt, hai đầu ở đỉnh nên liền):

#let lpp = khoi-lap-phuong(a: 2.8)
#let dd8 = lpp.dinh
#grid(columns: 2, column-gutter: 8pt,
  da-dien(
    ..lpp, w: 6.4cm, to: luma(95%), mau-diem: red,
    diem: (
      (diem-canh(dd8, 0, 1), $M$), (diem-canh(dd8, 1, 2), $N$),
      (diem-canh(dd8, 2, 6), $P$), (diem-canh(dd8, 4, 7), $Q$),
      (diem-canh(dd8, 0, 4), $R$),
    ),
  ),
  da-dien(
    ..lpp, w: 6.4cm, to: luma(96%),
    diem: ((trung-diem-3d(dd8.at(0), dd8.at(6)), $I$, auto, red),),
    duong: (
      (dd8.at(0), dd8.at(6), (mau: red, ten: $a sqrt(3)$, tai: 0.42, huong: "above-left")),
      (dd8.at(0), dd8.at(2), (mau: blue)),
      (dd8.at(2), dd8.at(6), (mau: blue, vuong: dd8.at(0))),
    ),
  ),
)

Ẩn nét khuất thì điểm bị khối che cũng ẩn theo (`hien-khuat: false`, hình trái):

#grid(columns: 2, column-gutter: 8pt,
  da-dien(
    ..cd, w: 6.4cm, to: blue.lighten(92%), hien-khuat: false,
    diem: ((O, $O$), (M, $M$), (H, $H$, auto, red)),
    duong: ((S, O, (mau: red, vuong: A)), (A, H, (mau: red))),
  ),
  da-dien(
    ..cd, w: 6.4cm, to: blue.lighten(92%),
    diem: ((O, $O$), (M, $M$), (H, $H$, auto, red)),
    duong: ((S, O, (mau: red, vuong: A)), (A, H, (mau: red))),
  ),
)

#context {
  let e = _nhin(chieu-xien().p)
  let tt = phan-tich-khoi(cd.dinh, cd.mat).mat
  [Kiểm che bởi khối — $O$ (tâm đáy): *#_bi-khoi-che(O, e, tt)* ·
   $M$ (trung điểm $S B$, cạnh thấy): *#_bi-khoi-che(M, e, tt)* ·
   $H$ (trên cạnh $S C$): *#_bi-khoi-che(H, e, tt)* ·
   $S$ (đỉnh): *#_bi-khoi-che(S, e, tt)*]
}
