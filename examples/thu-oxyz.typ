// File thử nhóm hàm TÍNH TOÁN trong không gian Oxyz (lib/oxyz-toan.typ, 07/2026):
//   1. vectơ: toạ độ, độ dài, tích vô hướng / có hướng / hỗn tạp, góc
//   2. điểm: khoảng cách, trung điểm, trọng tâm, trực tâm, tâm nội/ngoại tiếp
//   3. mặt phẳng: 5 cách lập phương trình, khoảng cách, hình chiếu, góc
//   4. đường thẳng: tham số, chính tắc, vị trí tương đối, giao điểm
//   5. mặt cầu: phương trình chính tắc / khai triển, qua 4 điểm
//   6. diện tích - thể tích
//   7. tính xong thì VẼ (khung-mp + mat-phang-bh / mat-phang-oxyz)
#import "../baigiang.typ": *

#set page(margin: 1.15cm)
#set text(font: "New Computer Modern", size: 10.5pt)
#show heading: it => block(above: 10pt, below: 6pt, text(fill: blue.darken(25%), it))

#let A = (1, 2, -1)
#let B = (2, -1, 3)
#let C = (-4, 7, 5)
#let D = (0, 0, 4)
#let bang(..n) = table(
  columns: (auto, 1fr), stroke: 0.4pt + luma(70%), inset: 5pt,
  align: (left + horizon, left + horizon), ..n,
)

= 1. Vectơ — toạ độ, độ dài, tích vô hướng / có hướng, góc

Cho #hien-diem(A, ten: "A"), #hien-diem(B, ten: "B"), #hien-diem(C, ten: "C") và #hien-diem(D, ten: "D").

#bang(
  [Toạ độ vectơ], [#hien-vecto(vecto-3d(A, B), ten: "AB") #h(1cm) #hien-vecto(vecto-3d(A, C), ten: "AC")],
  [Độ dài (chính xác / gần đúng)],
  [$|arrow(A B)| =$ #hien-do-dai(vecto-3d(A, B)) $approx$ #hien-gan-dung(do-dai-vecto(vecto-3d(A, B)))],
  [Tích vô hướng], [$arrow(A B) dot arrow(A C) =$ #tich-vo-huong(vecto-3d(A, B), vecto-3d(A, C))],
  [Tích có hướng], [$[arrow(A B), arrow(A C)] =$ #hien-vecto(tich-co-huong(vecto-3d(A, B), vecto-3d(A, C)))],
  [Tích hỗn tạp], [$[arrow(A B), arrow(A C)] dot arrow(A D) =$ #tich-hon-tap(vecto-3d(A, B), vecto-3d(A, C), vecto-3d(A, D))],
  [Cosin góc — góc],
  [$cos(arrow(A B), arrow(A C)) =$ #hien-cos-goc(vecto-3d(A, B), vecto-3d(A, C)) $approx$ #hien-gan-dung(cos-goc-vecto(vecto-3d(A, B), vecto-3d(A, C))) #h(0.8cm) $(arrow(A B), arrow(A C)) approx$ #hien-goc(goc-vecto(vecto-3d(A, B), vecto-3d(A, C)))],
  [Cùng phương · vuông góc · đồng phẳng],
  [#cung-phuong((1, 2, 3), (-2, -4, -6)) · #vuong-goc((1, 0, 0), (0, 3, 5)) · #dong-phang((1, 0, 0), (0, 1, 0), (2, 3, 0))],
)

= 2. Điểm — khoảng cách và các điểm đặc biệt của tam giác

#bang(
  [Khoảng cách hai điểm], [$A B =$ #hien-khoang-cach(A, B) $approx$ #hien-gan-dung(khoang-cach-3d(A, B))],
  [Trung điểm · trọng tâm], [#hien-diem(trung-diem-3d(A, B), ten: "M") #h(1cm) #hien-diem(trong-tam-3d(A, B, C), ten: "G")],
  [Trực tâm], [#hien-diem(truc-tam-3d(A, B, C), ten: "H")],
  [Tâm đường tròn ngoại tiếp], [#hien-diem(tam-ngoai-tiep-3d(A, B, C), ten: "O") #h(0.6cm) $R approx$ #hien-gan-dung(ban-kinh-ngoai-tiep-3d(A, B, C))],
  [Tâm đường tròn nội tiếp], [#hien-diem(tam-noi-tiep-3d(A, B, C), ten: "I") #h(0.6cm) $r approx$ #hien-gan-dung(ban-kinh-noi-tiep-3d(A, B, C))],
  [Tâm bàng tiếp trong góc $A$], [#hien-diem(tam-bang-tiep-3d(A, B, C), ten: "J")],
)

Kiểm: $G$, $H$, $O$ thẳng hàng (đường thẳng Euler) và $arrow(O H) = 3 arrow(O G)$ —
#cung-phuong(vecto-3d(tam-ngoai-tiep-3d(A, B, C), truc-tam-3d(A, B, C)), vecto-3d(tam-ngoai-tiep-3d(A, B, C), trong-tam-3d(A, B, C))).

= 3. Mặt phẳng

#bang(
  [Qua $A$, pháp tuyến $arrow(n) = (2; -3; 1)$], [#pt-mat-phang(mat-phang-qua-phap(A, (2, -3, 1)))],
  [Qua ba điểm $A$, $B$, $C$], [#pt-mat-phang(mat-phang-qua-3-diem(A, B, C))],
  [Đoạn chắn $(2; 0; 0)$, $(0; 3; 0)$, $(0; 0; 4)$], [#pt-mat-phang(mat-phang-doan-chan(2, 3, 4))],
  [Trung trực đoạn $A B$], [#pt-mat-phang(mat-phang-trung-truc(A, B))],
  [Qua $D$, song song với $(A B C)$], [#pt-mat-phang(mat-phang-song-song(mat-phang-qua-3-diem(A, B, C), D))],
)

#let P = mat-phang-qua-3-diem(A, B, C)

#bang(
  [$d(D, (A B C))$], [#hien-khoang-cach-diem-mp(D, P) $approx$ #hien-gan-dung(khoang-cach-diem-mp(D, P))],
  [Hình chiếu · điểm đối xứng của $D$], [#hien-diem(hinh-chieu-len-mp(D, P)) #h(0.8cm) #hien-diem(doi-xung-qua-mp(D, P))],
  [Góc giữa $(A B C)$ và $(O x y)$], [#hien-goc(goc-2-mp(P, mat-phang-qua-phap((0, 0, 0), (0, 0, 1))))],
  [Vị trí tương đối với mặt song song], [#vi-tri-2-mp(P, mat-phang-song-song(P, D))],
)


= 4. Đường thẳng

#let d1 = duong-thang-qua-2-diem(A, B)
#let d2 = duong-thang-qua-vtcp((1, 2, 3), (2, 0, -1))

#bang(
  [$d_1$ qua $A$, $B$ — tham số / chính tắc], [#pt-tham-so(d1) #h(1.2cm) #pt-chinh-tac(d1)],
  [$d_2$ có chỉ phương $(2; 0; -1)$], [#pt-tham-so(d2) #h(1.2cm) #pt-chinh-tac(d2)],
  [Vị trí $d_1$ và $d_2$], [#vi-tri-2-duong(d1, d2) — $d(d_1, d_2) =$ #hien-khoang-cach-2-duong(d1, d2) $approx$ #hien-gan-dung(khoang-cach-2-duong(d1, d2))],
  [$d(D, d_1)$], [#hien-khoang-cach-diem-duong(D, d1) $approx$ #hien-gan-dung(khoang-cach-diem-duong(D, d1))],
  [Hình chiếu · đối xứng của $D$ qua $d_1$], [#hien-diem(hinh-chieu-len-duong(D, d1)) #h(0.8cm) #hien-diem(doi-xung-qua-duong(D, d1))],
  [Giao của $d_2$ với $(A B C)$], [#hien-diem(giao-duong-mp(d2, P))],
  [Góc $(d_1, d_2)$ · góc $(d_2, (A B C))$], [#hien-goc(goc-2-duong(d1, d2)) #h(0.8cm) #hien-goc(goc-duong-mp(d2, P))],
  [Giao tuyến $(O x y)$ và $(O y z)$],
  [#pt-tham-so(giao-2-mp(mat-phang-qua-phap((0, 0, 0), (0, 0, 1)), mat-phang-qua-phap((0, 0, 0), (1, 0, 0))))],
)

= 5. Mặt cầu

#let S = mat-cau((1, -2, 3), 5)
#let S4 = mat-cau-qua-4-diem((2, 0, 0), (0, 4, 0), (0, 0, 4), (0, 0, 0))

#bang(
  [Tâm $(1; -2; 3)$, $R = 5$], [#pt-mat-cau(S) #h(1cm) #pt-mat-cau-khai-trien(S)],
  [Đường kính $A B$], [#pt-mat-cau(mat-cau-duong-kinh(A, B))],
  [Qua 4 điểm $(2;0;0)$, $(0;4;0)$, $(0;0;4)$, $O$], [#pt-mat-cau(S4) #h(0.8cm) tâm #hien-diem(S4.I) $R =$ #hien-so(S4.R)],
  [Tiếp xúc $(A B C)$, tâm $D$], [#pt-mat-cau(mat-cau-tam-tiep-xuc-mp(D, P))],
  [Vị trí $(A B C)$ với $(S)$],
  [#vi-tri-mp-mat-cau(P, S) — đường tròn giao tuyến tâm #hien-diem(duong-tron-giao(P, S).I) bán kính #hien-gan-dung(duong-tron-giao(P, S).R)],
)

= 6. Diện tích — thể tích

#bang(
  [$S_(A B C)$], [#hien-dien-tich-tam-giac(A, B, C) $approx$ #hien-gan-dung(dien-tich-tam-giac-3d(A, B, C))],
  [Diện tích hình bình hành dựng trên $arrow(A B)$, $arrow(A C)$], [#hien-dien-tich-hbh(A, B, C) $approx$ #hien-gan-dung(dien-tich-hbh-3d(A, B, C))],
  [$V_(A B C D)$ · thể tích hình hộp], [#hien-the-tich-tu-dien(A, B, C, D) #h(0.8cm) #hien-so(the-tich-hinh-hop(A, B, C, D))],
  [Bốn điểm $A$, $B$, $C$, $D$ đồng phẳng?], [#bon-diem-dong-phang(A, B, C, D)],
)

= 7. Tính xong thì vẽ

#grid(columns: (1fr, 1fr), column-gutter: 4pt,
  // (1) mặt phẳng đoạn chắn + hình chiếu của một điểm
  oxyz(w: 7.6cm, x: 4.4, y: 5.4, z: 4.4, don-vi: false, them: (ctx, t3) => {
    let U = (3, 0, 0)
    let V = (0, 4, 0)
    let W = (0, 0, 3)
    let Q = mat-phang-doan-chan(3, 4, 3)
    let E = (2.4, 3.2, 3.4)
    let H = hinh-chieu-len-mp(E, Q)
    mat-phang-oxyz(ctx, t3, 3, 4, 3, ten: $(Q)$, ten-abc: ($U$, $V$, $W$), ten-dinh: true)
    doan-oxyz(ctx, t3, E, H, mau: red, dut: true)
    diem-oxyz(ctx, t3, E, ten: $E$, mau: red)
    diem-oxyz(ctx, t3, H, ten: $H$, mau: red, huong: "below-right")
  }),
  // (2) mặt phẳng bất kì qua khung-mp + mat-phang-bh
  oxyz(w: 7.6cm, x: 4.4, y: 5, z: 4.4, don-vi: false, them: (ctx, t3) => {
    let M = (1, 1.2, 1.4)
    let Q = mat-phang-qua-phap(M, (1, 1, 1))
    let (T, u, v) = khung-mp(Q, tam: M, r: 2.5)
    mat-phang-bh(ctx, t3, T, u, v, ten: $(alpha)$)
    doan-oxyz(ctx, t3, (0, 0, 0), M, mau: red, dut: true)
    diem-oxyz(ctx, t3, M, ten: $M$, mau: red)
    vecto-oxyz(ctx, t3, M, v3-cong(M, (1, 1, 1)), ten: $arrow(n)$, mau: blue)
  }),
)

Mặt phẳng $(Q)$: #pt-mat-phang(mat-phang-doan-chan(3, 4, 3)) — mặt phẳng $(alpha)$: #pt-mat-phang(mat-phang-qua-phap((1, 1.2, 1.4), (1, 1, 1))).
