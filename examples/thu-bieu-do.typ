// thu-bieu-do.typ — KIỂM TRA biểu đồ thống kê (07/2026)
// Biên dịch:  typst compile thu-bieu-do.typ
#import "../baigiang.typ": *

#set page(margin: 1.6cm)
#set text(size: 11pt, lang: "vi")

= Thử biểu đồ thống kê

== 1. Histogram — cùng nguồn số liệu với bảng ghép nhóm

#let moc-cc = (150, 155, 160, 165, 170, 175)
#let ts-cc = (5, 12, 18, 9, 4)

#bang-ghep-nhom(moc: moc-cc, tan-so: ts-cc, ten-nhom: [Chiều cao], don-vi: [cm])

#bieu-do-tan-so(
  moc: moc-cc, tan-so: ts-cc,
  ten-x: [Chiều cao (cm)],
)

== 2. Histogram + đường gấp khúc tần số chồng lên

#bieu-do-tan-so(
  moc: moc-cc, tan-so: ts-cc,
  gap-khuc: true, luoi-ngang: true, so-dinh: false,
)

== 3. Đường gấp khúc tần số đứng riêng (kéo dài về 0)

#da-giac-tan-so(moc: moc-cc, tan-so: ts-cc, ten-x: [Chiều cao (cm)])

== 4. Biểu đồ cột rời — giá trị số và giá trị chữ

#bieu-do-cot(
  gia-tri: (0, 1, 2, 3, 4),
  tan-so: (4, 9, 13, 6, 2),
  ten-x: [Số con], w: 7.5cm,
)
#h(6mm)
#bieu-do-cot(
  gia-tri: ([Đỏ], [Xanh], [Vàng], [Tím]),
  tan-so: (10, 7, 5, 3),
  w: 6.5cm,
)

== 5. Biểu đồ hộp — từ dữ liệu thô và từ 5 số tóm tắt

#let diem-thi = (3, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 8, 9, 10)
Tứ phân vị (kiểm bằng #raw("tu-phan-vi")):
#let q = tu-phan-vi(diem-thi)
$Q_1 = #so-toan(q.q1), quad Q_2 = #so-toan(q.q2), quad Q_3 = #so-toan(q.q3)$

#bieu-do-hop(du-lieu: diem-thi, ten: [Điểm])

#bieu-do-hop(tom-tat: (150, 158, 163, 168, 175), ten: [cm], w: 11cm)


== 6. Biểu đồ quạt tròn

#bieu-do-quat(
  ([Đi bộ], 25),
  ([Xe đạp], 30),
  ([Xe máy], 35),
  ([Ô tô], 6),
  ([Khác], 4),
)

== 7. Vẽ chồng qua `them:` (ctx ngầm vẫn chạy)

#bieu-do-tan-so(
  moc: moc-cc, tan-so: ts-cc, w: 8cm,
  them: ctx => {
    nhan((162.5, 19.5), text(fill: red)[nhóm nhiều nhất], huong: "above")
    mui-ten((164.5, 19.2), (163.2, 18.4), mau: red)
  },
)

== 8. Số đặc trưng mẫu số liệu

#let d8 = (1, 2, 2, 3, 3, 3, 4, 4, 5)
Không ghép nhóm #raw("(1,2,2,3,3,3,4,4,5)"):
$overline(x) = #so-toan(so-trung-binh(d8))$,
$M_o = #so-toan(mot(d8).first())$,
$M_e = #so-toan(trung-vi(d8))$,
$s^2 = #so-toan(phuong-sai(d8))$,
$s approx #so-dep(do-lech-chuan(d8))$,
$R = #so-toan(khoang-bien-thien(d8))$,
$Delta_Q = #so-toan(khoang-tu-phan-vi(d8))$.

Bảng tần số (gia-tri + tan-so):
$overline(x) = #so-toan(so-trung-binh((0, 1, 2, 3), tan-so: (4, 3, 4, 7)))$,
$M_o = #so-toan(mot((0, 1, 2, 3), tan-so: (4, 3, 4, 7)).first())$.
 #v(1cm)

Ghép nhóm (mẫu chiều cao mục 1):
#let qg = tu-phan-vi-ghep-nhom(moc-cc, ts-cc)
$Q_1 approx #so-dep(qg.q1), quad Q_2 approx #so-dep(qg.q2), quad Q_3 approx #so-dep(qg.q3)$


$overline(x) approx #so-dep(so-trung-binh-ghep-nhom(moc-cc, ts-cc))$,
$M_o = #so-dep(mot-ghep-nhom(moc-cc, ts-cc))$,
$M_e approx #so-dep(trung-vi-ghep-nhom(moc-cc, ts-cc))$,
$s^2 approx #so-dep(phuong-sai-ghep-nhom(moc-cc, ts-cc))$,
$s approx #so-dep(do-lech-chuan-ghep-nhom(moc-cc, ts-cc))$,
$R = #so-dep(khoang-bien-thien-ghep-nhom(moc-cc, ts-cc))$,
$Delta_Q approx #so-dep(khoang-tu-phan-vi-ghep-nhom(moc-cc, ts-cc))$.
