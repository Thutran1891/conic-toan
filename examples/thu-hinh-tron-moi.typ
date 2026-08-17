#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")
#show math.equation.where(block: false): it => math.display(it)

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [HƯỚNG DẪN SỬ DỤNG — BỘ THƯ VIỆN BÀI GIẢNG TOÁN],
  tieu-de-ngan: [Hướng dẫn sử dụng],
  mon: [Typst thuần · không phụ thuộc package ngoài],
  thong-tin-hs: false,
  gv: "Trần Thị Kim Thu",
)


#tl([Cho tam giác $A B C$ có $a = 4, b = 6, hat(C) = 120 degree$. 
#cot-item(
  [Dựng tam giác $A B C$ và đường tròn ngoại tiếp, nội tiếp tam giác.],
  [Tính độ dài cạnh $c$, bán kính đường trong ngoại tiếp và nội tiếp.]
)],
fig-giai: hinh(w: 6.5cm, xmin: -2.5, xmax: 8, ymin: -2, ymax: 9, ctx =>{
  let C = (0, 0)
  let A = (6, 0)
  let B = dung-diem(C, A, 120, 4)
  tam-giac(A, B, C)
  ve-goc(A, C, B, so-do: true, mau: blue)
  nhan(chia(C, A, 0.5), $6$, huong: "below", mau: blue)
  nhan(chia(C, B, 0.5), $4$, huong: "right", mau: blue)
  duong-tron-ngoai-tiep(A, B, C)
  duong-tron-noi-tiep(A, B, C)
}),
loi-giai: [a) Hình dựng như hình bên.\
b) Ta có $c^2 = 4^2 + 6^2 - 2 dot 4 dot 6 dot cos 120 degree = 76$. Vậy $c = 2 sqrt(19)$.\
$R = c /(2 dot sin C) = (2 sqrt(19))/(2 sin 120 degree) = (2 sqrt(57))/3$.\
$r = S/p = (2 S)/(a + b + c) = ( 4 dot 6 dot sin 120 degree)/(4 + 6 + 2sqrt(19)) = (6 sqrt(3))/( 5 + sqrt(19)) = sqrt(3)(5 - sqrt(19))$.
]

)

#tl([Dựng hình theo mô tả: \
Cho tam giác $A B C$ có $a = 5, b = 7, c = 8$. \
Dựng đường tròn tâm $O$ ngoại tiếp tam giác $ A B C$.\
Dựng tiếp tuyến của đường tròn $(O)$ tại $C$.\
Gọi $M$ là điểm đối xứng với $C$ qua $A$. Qua $M$ dựng 2 tiếp tuyến đến đường  tròn $O$.
],
fig: hinh(w: 8cm, xmin: -2, xmax: 7, ymin: -5, ymax: 7, ctx =>{
  let A = (0, 0)
  let B = toa-cuc(A, 8, 0)
  let (C, Cp) = giao-hai-duong-tron(A, 7, B, 5)
  let O = tam-ngoai-tiep(A, B, C)
  let R = khoang-cach(O, A)
  let M = dung-diem(A, C, 180, khoang-cach(A, C))
  tam-giac(A, B, C)
  duong-tron-ngoai-tiep(A, B, C)
  tiep-tuyen-tai-diem(O, R, C, mau: purple)
  cac-doan((M, C), (O, C))
  cac-diem((M, $M$, "below"))
  tiep-tuyen-tu-diem(O, R, M, ten-diem: $ $, ten-tam: $ $)
  ve-goc-vuong(O, C, dung-diem(C, O, 90, 2))
}),
fig-pos: "center"
)

// File thử cho 5 hạng mục thêm vào 0.3.4 (16/08/2026):
//  1. giao-duong-thang-duong-tron  (giao đường thẳng & đường tròn)
//  2. tiep-tuyen-tai-diem          (tiếp tuyến tại 1 điểm trên đường tròn)
//  3. dung-diem                    (dựng điểm biết góc + độ dài)
//  4. nhan-goc                     (đặt nhãn theo góc lượng giác)
//  5. dut: cho đường tròn ngoại/nội tiếp
// Biên dịch: typst compile thu-hinh-tron-moi.typ

#set page(width: 20cm, height: auto, margin: 1.2cm)
#set text(font: ("Charis SIL", "Times New Roman"), size: 11pt)

= Thử các hàm hình tròn mới

== 1. Giao đường thẳng với đường tròn + tiếp tuyến tại điểm

#hinh(w: 7cm, xmin: -3.4, xmax: 3.4, ymin: -3, ymax: 3, ctx => {
  let O = (0, 0)
  let r = 2
  duong-tron(ctx, O, r, mau: blue, day: 1.1pt)
  diem(ctx, O, ten: $O$, huong: "below-left")
  // đường thẳng cắt
  let A = (-3, -1)
  let B = (3, 1.4)
  doan(ctx, A, B, mau: black, day: 0.9pt)
  let gd = giao-duong-thang-duong-tron((A, B), (O, r))
  for (i, P) in gd.enumerate() {
    diem(ctx, P, mau: red, ten: [$M_#(i + 1)$], huong: "above-left")
  }
  // tiếp tuyến tại điểm trên đường tròn (góc 60°)
  let T = toa-cuc(O, r, 60)
  diem(ctx, T, mau: green.darken(20%), ten: $T$, huong: "above-right")
  doan(ctx, O, T, mau: luma(50%), day: 0.7pt, dut: true)
  tiep-tuyen-tai-diem(ctx, O, r, T, mau: green.darken(20%), day: 1.1pt)
})

== 2. dung-diem: dựng M biết góc BAM = 55° và AM = 2.5

#hinh(w: 7cm, xmin: -1, xmax: 5.2, ymin: -3, ymax: 4, ctx => {
  let A = (0, 0)
  let B = (4, -1)
  let M = dung-diem(A, B, 75, 2.5)   // tia AM = AB quay 55°, AM = 2.5
  let N = dung-diem(A, B, -50, 3)
  doan(ctx, A, B, mau: black)
  doan(ctx, A, M, mau: red)
  doan(A, N, mau: blue)
  goc(ctx, A, M, B, so-do: true, mau: red, vach: 1)
  goc-luong-giac(A, B, N, chieu: "am", so-do: true,cach: 0.3cm, huong: "below-right" )
  cac-diem(ctx, (A, $A$, "below-left"), (B, $B$, "below-right"), (M, $M$, "above"), (N, $N$, "right"))
})
== 3. nhan-goc: đặt nhãn theo góc lượng giác

#hinh(w: 7cm, xmin: -3, xmax: 3, ymin: -3, ymax: 3, ctx => {
  duong-tron(ctx, (0, 0), 2, mau: blue)
  let A = (2, 0)
  let B = (-1, 1.732)
  let C = (-1, -1.732)
  cac-doan(A, B, C, dong: true)
  // nhãn đặt hướng ra ngoài mỗi đỉnh theo góc lượng giác
  nhan-goc(
    (A, $A$, 0),
    (B, $B$, 120, 8pt),
    (C, $C$, 240, 8pt, red),
  )
})

== 4. Đường tròn ngoại tiếp / nội tiếp — nét đứt (dut)

#hinh(w: 7cm, xmin: -3, xmax: 4, ymin: -3, ymax: 4, ctx => {
  let A = (-3, -1.5)
  let B = (3, -1)
  let C = (0.5, 3)
  tam-giac(ctx, A, B, C, ten: ($A$, $B$, $C$), mau: black)
  duong-tron-ngoai-tiep(ctx, A, B, C, mau: blue, dut: true)
  duong-tron-noi-tiep(ctx, A, B, C, dut: true)
})
