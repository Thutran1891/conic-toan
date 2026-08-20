#import "../baigiang.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(font: ("Charis SIL", "Noto Serif", "Libertinus Serif"), size: 11pt)

#align(center, text(15pt, weight: "bold")[
  Thử KHỐI CẦU `khoi-cau` trong engine mặt cong (mat-cong.typ)
])

Tên hàm là `khoi-cau`, KHÔNG phải `mat-cau` — `mat-cau(I, R)` đã là kiểu dữ
liệu mặt cầu của `oxyz-toan.typ` (import SAU nên sẽ che mất).

= 1. Cầu đứng một mình — mốc đối chiếu

Đường BIÊN là đường tròn lớn vuông góc HƯỚNG NHÌN nên chiếu ra một elip (với
`chieu-truc-giao` thì đúng là đường tròn). Xích đạo bật sẵn: nửa TRƯỚC liền,
nửa SAU đứt. Đổi `nghieng:` chỉ nghiêng xích đạo, KHÔNG đổi đường biên.

#grid(columns: 3, column-gutter: 6pt,
  mat-cong(khoi-cau(r: 2), w: 4.6cm),
  mat-cong(khoi-cau(r: 2, nghieng: 25deg, huong: 40deg), w: 4.6cm),
  mat-cong(khoi-cau(r: 2, xich-dao: false), w: 4.6cm),
)

Ba hình trên phải có ĐƯỜNG BAO GIỐNG HỆT nhau; chỉ elip xích đạo khác.

= 2. Kinh tuyến — dáng quả địa cầu

`kinh-tuyen: k` vẽ k đường tròn lớn qua hai cực, cách đều. Mỗi đường tự đứt
đúng nửa nằm sau, không phải chia cung bằng tay.

#grid(columns: 3, column-gutter: 6pt,
  mat-cong(khoi-cau(r: 2, kinh-tuyen: 3), w: 4.6cm),
  mat-cong(khoi-cau(r: 2, kinh-tuyen: 6), w: 4.6cm),
  mat-cong(khoi-cau(r: 2, kinh-tuyen: 4, nghieng: 30deg, huong: 60deg,
    mau: blue.darken(10%)), w: 4.6cm),
)

= 3. Vĩ tuyến vẽ thêm bằng `tron-ngang` qua `duong:`

Đường phụ cũng đi qua đúng cơ chế bắn tia nên nửa sau tự đứt.

#align(center, mat-cong(
  khoi-cau(r: 2.2, kinh-tuyen: 4),
  duong: (
    (pts: tron-ngang((0, 0, 1.2), calc.sqrt(2.2 * 2.2 - 1.2 * 1.2)),
      mau: red.darken(10%)),
    (pts: tron-ngang((0, 0, -1.2), calc.sqrt(2.2 * 2.2 - 1.2 * 1.2)),
      mau: red.darken(10%)),
  ),
  w: 6cm,
))

= 4. Cầu che nón / trụ — việc mà engine sinh ra để làm

Cầu đặt CHEN vào giữa: phần khối kia nằm sau cầu phải thành nét đứt, và ngược
lại phần cầu nằm trong khối kia cũng vậy.

#grid(columns: 2, column-gutter: 8pt,
  mat-cong(
    mat-non(r: 2, cao: 4, mau: red.darken(10%)),
    khoi-cau(tam: (0, 0, 1.5), r: 1.5, mau: blue.darken(10%)),
    w: 6cm,
  ),
  mat-cong(
    mat-tru(r: 1.8, cao: 4, mau: blue.darken(10%)),
    khoi-cau(tam: (1.6, 0.6, 3.4), r: 1.5, mau: green.darken(20%)),
    w: 6cm,
  ),
)

= 5. Cầu nội tiếp trụ · cầu nội tiếp nón

Ca kinh điển của SGK. Trụ ngoại tiếp: $r$ trụ $= r$ cầu, chiều cao $= 2r$.
Nón ngoại tiếp $R = 2.6$, $h = 5.2$ cho $rho = (R h)/(R + sqrt(R^2 + h^2))
approx 1.607$.

⚠️ KỲ VỌNG ĐÚNG là cầu hiện ra gần như TOÀN NÉT ĐỨT: engine coi mọi khối là
ĐẶC và KHÔNG trong suốt, cầu nội tiếp thì nằm hẳn trong lòng khối kia nên bị
che — y như ca "trụ nội tiếp nón" đã có. Chỉ hai chỗ TIẾP XÚC là còn nét liền.
Muốn dáng "khối trong suốt" của SGK thì vẽ cầu ở lời gọi `mat-cong` RIÊNG rồi
chồng lên, hoặc đặt `hien-khuat: false` cho khối ngoài.

#grid(columns: 2, column-gutter: 8pt,
  mat-cong(
    mat-tru(r: 2, cao: 4, mau: blue.darken(10%)),
    khoi-cau(tam: (0, 0, 2), r: 2, xich-dao: false, mau: red.darken(10%)),
    w: 6cm,
  ),
  mat-cong(
    mat-non(r: 2.6, cao: 5.2, mau: red.darken(10%)),
    khoi-cau(tam: (0, 0, 1.607), r: 1.607, xich-dao: false,
      mau: blue.darken(10%)),
    w: 6cm,
  ),
)

= 6. Hai cầu che nhau · `hien-khuat: false` · tô màu

#grid(columns: 3, column-gutter: 6pt,
  mat-cong(
    khoi-cau(tam: (0, 0, 0), r: 2, mau: red.darken(10%)),
    khoi-cau(tam: (1.4, 1.4, 1.6), r: 1.4, mau: blue.darken(10%)),
    w: 4.6cm,
  ),
  mat-cong(
    khoi-cau(tam: (0, 0, 0), r: 2, mau: red.darken(10%)),
    khoi-cau(tam: (1.4, 1.4, 1.6), r: 1.4, mau: blue.darken(10%)),
    hien-khuat: false, w: 4.6cm,
  ),
  mat-cong(
    khoi-cau(r: 2, kinh-tuyen: 4, to: rgb(80, 140, 220, 40)),
    w: 4.6cm,
  ),
)

Hình giữa KHÔNG được còn nét đứt nào; hình phải phải thấy nền xanh nhạt nằm
DƯỚI mọi nét.

= 7. Cầu trong hệ trục Oxyz (cùng camera với khối)

#align(center, mat-cong(
  khoi-cau(tam: (1.6, 1.6, 1.6), r: 1.6, kinh-tuyen: 3,
    mau: blue.darken(10%)),
  truc: (x: 4, y: 4.6, z: 4.6),
  cam: chieu-truc-giao(ngang: 18deg, cao: 22deg),
  w: 7.5cm,
))

= 8. Cầu trục nghiêng đặt cạnh nón/trụ nghiêng — hồi quy chung

#align(center, mat-cong(
  mat-non(r: 1.5, cao: 4, nghieng: 55deg, huong: 210deg, mau: red.darken(10%)),
  mat-tru(tam: (1.2, 1.6, 0), r: 1.5, cao: 4, nghieng: 55deg, huong: 210deg,
    mau: blue.darken(10%)),
  khoi-cau(tam: (2.6, 2.2, 2.6), r: 1.2, kinh-tuyen: 3, nghieng: 55deg,
    huong: 210deg, mau: green.darken(20%)),
  cam: chieu-truc-giao(ngang: 20deg, cao: 20deg), w: 9cm,
))

= 9. NỘI TIẾP / NGOẠI TIẾP với khối đa diện (`da-dien.typ`)

Hai engine ghép chung được, nhưng phải nắm hai điều sau.

*(1) BẮT BUỘC truyền CÙNG một `cam:` cho cả hai.* Camera mặc định của chúng
KHÁC NHAU — `da-dien` mặc định `chieu-xien()`, còn `mat-cong` mặc định
`chieu-truc-giao(ngang: 15deg, cao: 22deg)`. Quên `cam:` là hai hình vẽ theo
hai phép chiếu khác nhau, lệch hẳn nhau mà KHÔNG hề báo lỗi.

*(2) KHÔNG có che khuất chéo giữa hai engine.* `da-dien` dùng back-face
culling, `mat-cong` bắn tia — chúng không biết nhau, nên cạnh đa diện không bị
mặt cầu làm đứt và ngược lại. Mỗi khối chỉ tự lo nét khuất CỦA CHÍNH NÓ. Với
các bài nội/ngoại tiếp thì đó lại đúng lối SGK (khối vẽ "trong suốt").

Mẹo khung hình: khối nào LỚN hơn thì để khối đó dựng khung, khối kia vẽ kèm
qua `them:` (vẽ sau) hoặc `truoc:` (vẽ trước) — khỏi phải tự tính `xmin/xmax`.

#let cm3 = chieu-truc-giao(ngang: 20deg, cao: 20deg)

== 9.1. Mặt cầu nội tiếp · ngoại tiếp hình lập phương

Cạnh $a = 3$: cầu nội tiếp $r = a/2 = 1.5$, cầu ngoại tiếp
$R = (a sqrt(3))/2 approx 2.598$.

#grid(columns: 2, column-gutter: 8pt,
  // cầu NHỎ hơn ⇒ để da-dien dựng khung, cầu vẽ kèm qua `them:`
  da-dien(
    ..khoi-hop((-1.5, -1.5, -1.5), (3, 0, 0), (0, 3, 0), (0, 0, 3)),
    cam: cm3, w: 6cm, to: blue.lighten(90%),
    them: (ctx, p) => ve-mat-cong(ctx,
      khoi-cau(r: 1.5, mau: red.darken(10%)), cam: cm3),
  ),
  // cầu LỚN hơn ⇒ để mat-cong dựng khung, đa diện vẽ kèm qua `truoc:`
  mat-cong(
    khoi-cau(r: 2.598, xich-dao: false, mau: red.darken(10%)),
    cam: cm3, w: 6cm,
    truoc: (ctx, p) => ve-da-dien(ctx,
      ..khoi-hop((-1.5, -1.5, -1.5), (3, 0, 0), (0, 3, 0), (0, 0, 3)),
      cam: cm3, to: blue.lighten(90%)),
  ),
)

== 9.2. Mặt cầu ngoại tiếp chóp tứ giác đều · nội tiếp tứ diện đều

Chóp đáy bán kính $R_d = 2$, cao $h = 3.6$: tâm cầu trên trục ở
$z = (h^2 - R_d^2)/(2h) approx 1.244$, bán kính $R = h - z approx 2.356$.
Tứ diện đều cạnh $a = 3$: cao $= a sqrt(2/3) approx 2.449$, trọng tâm ở
$z = "cao"/4$, cầu nội tiếp $r = "cao"/4 approx 0.612$.

#grid(columns: 2, column-gutter: 8pt,
  mat-cong(
    khoi-cau(tam: (0, 0, 1.244), r: 2.356, xich-dao: false,
      mau: red.darken(10%)),
    cam: cm3, w: 6cm,
    truoc: (ctx, p) => ve-da-dien(ctx, ..khoi-chop-deu(n: 4, R: 2, cao: 3.6),
      cam: cm3, to: blue.lighten(90%)),
  ),
  da-dien(
    ..khoi-tu-dien-deu(a: 3),
    cam: cm3, w: 6cm, to: blue.lighten(90%),
    them: (ctx, p) => ve-mat-cong(ctx,
      khoi-cau(tam: (0, 0, 0.612), r: 0.612, mau: red.darken(10%)), cam: cm3),
  ),
)

== 9.3. Hình nón nội tiếp · ngoại tiếp hình chóp tứ giác đều

Nón NỘI tiếp có đáy là đường tròn nội tiếp đáy chóp
($r = R_d cos 45 degree approx 1.414$); nón NGOẠI tiếp có đáy là đường tròn
ngoại tiếp đáy chóp ($r = R_d = 2$). Cùng chung đỉnh và chiều cao $h = 3.6$.

#grid(columns: 2, column-gutter: 8pt,
  da-dien(
    ..khoi-chop-deu(n: 4, R: 2, cao: 3.6),
    cam: cm3, w: 6cm, to: blue.lighten(90%),
    them: (ctx, p) => ve-mat-cong(ctx,
      mat-non(r: 1.414, cao: 3.6, mau: red.darken(10%)), cam: cm3),
  ),
  mat-cong(
    mat-non(r: 2, cao: 3.6, mau: red.darken(10%)),
    cam: cm3, w: 6cm,
    truoc: (ctx, p) => ve-da-dien(ctx, ..khoi-chop-deu(n: 4, R: 2, cao: 3.6),
      cam: cm3, to: blue.lighten(90%)),
  ),
)

== 9.4. Hình trụ nội tiếp · ngoại tiếp lăng trụ lục giác đều

Lăng trụ $R = 1.8$, cao $3.4$: trụ nội tiếp $r = R cos 30 degree approx 1.559$
(chạm 6 mặt bên), trụ ngoại tiếp $r = R = 1.8$ (chứa 12 đỉnh).

#grid(columns: 2, column-gutter: 8pt,
  da-dien(
    ..khoi-lang-tru-deu(n: 6, R: 1.8, cao: 3.4),
    cam: cm3, w: 6cm, to: blue.lighten(90%),
    them: (ctx, p) => ve-mat-cong(ctx,
      mat-tru(r: 1.559, cao: 3.4, mau: red.darken(10%)), cam: cm3),
  ),
  mat-cong(
    mat-tru(r: 1.8, cao: 3.4, mau: red.darken(10%)),
    cam: cm3, w: 6cm,
    truoc: (ctx, p) => ve-da-dien(ctx,
      ..khoi-lang-tru-deu(n: 6, R: 1.8, cao: 3.4),
      cam: cm3, to: blue.lighten(90%)),
  ),
)

CẦN NHÌN KỸ ở mục 9.4: trụ nội tiếp phải TIẾP XÚC đúng 6 mặt bên (đường tròn
đáy trụ chạm trung điểm 6 cạnh đáy lăng trụ), trụ ngoại tiếp phải ĐI QUA đúng
12 đỉnh. Lệch là dấu hiệu hai hình KHÔNG chung phép chiếu — kiểm lại `cam:`.

= 10. HỢP NHẤT hai engine — `khoi-da-dien` có che khuất CHÉO

Mục 9 chỉ VẼ CHUNG hai engine, không có che khuất chéo. `khoi-da-dien(...)`
đưa khối đa diện vào CHÍNH engine bắn tia của `mat-cong`, nên đa diện · nón ·
trụ · cầu che nhau ĐÚNG trong một lời gọi duy nhất.

`da-dien` / `ve-da-dien` cũ KHÔNG đụng tới — đây là đường đi THỨ HAI, dùng khi
cần che khuất chéo. Khác biệt duy nhất còn lại: `to:` ở đây tô BÓNG KHỐI một
màu (bao lồi), không tô từng mặt như `ve-da-dien`.

== 10.1. Mặt cầu ĐÂM XUYÊN hình lập phương

Cạnh 3, cầu $r = 1.9$ cùng tâm nên cầu thò ra khỏi cả 6 mặt ($1.5 < 1.9 <
1.5 sqrt(3) approx 2.598$). Trái là đường đi mục 9 (vẽ chung, KHÔNG che chéo),
phải là `khoi-da-dien` (che chéo thật) — hai hình phải KHÁC nhau rõ rệt.

#grid(columns: 3, column-gutter: 5pt,
  mat-cong(
    khoi-da-dien(..khoi-chop-cut-deu(R: 2, cao: 3, n: 4)),
    mat-non(),
    cam: cm3, w: 6cm,
  ),
  mat-cong(
    khoi-da-dien(..khoi-hop((-1.5, -1.5, -1.5), (3, 0, 0), (0, 3, 0), (0, 0, 3))),
    khoi-cau(r: 1.9, xich-dao: true, mau: red.darken(10%)),
    cam: cm3, w: 6cm,
  ),
  mat-cong(
    khoi-da-dien(..khoi-hop((-1.5, -2, 0), (3, 0, 0), (0, 4, 0), (0, 0, 3.0))),
    mat-tru(r: 2.5, cao: 3.0, mau: red.darken(10%)),
    cam: cm3, w: 6cm,
  ),
)

Ở hình PHẢI phải thấy: cạnh hộp nằm SAU cầu thành nét đứt, VÀ đường bao cầu ở
đoạn chui vào trong lòng hộp cũng thành nét đứt. Hình TRÁI không có cả hai.

== 10.2. Hình nón cắm vào hộp chữ nhật

#align(center, mat-cong(
  khoi-da-dien(..khoi-hop-chu-nhat(dai: 4, rong: 2.6, cao: 3)),
  mat-non(tam: (2, 1.3, 1.2), r: 1.1, cao: 3.4, mau: red.darken(10%)),
  cam: cm3, w: 8cm,
))

Đáy nón nằm TRONG hộp nên phải khuất hết; phần thân nón nhô lên trên nắp hộp
vẽ liền; cạnh nắp hộp đi qua sau thân nón phải đứt.

== 10.3. Hình trụ NẰM NGANG xuyên lăng trụ lục giác đều

#align(center, mat-cong(
  khoi-da-dien(..khoi-lang-tru-deu(n: 6, R: 1.8, cao: 3.4)),
  mat-tru(tam: (-3.2, 0, 1.7), r: 0.75, cao: 6.4, nghieng: 90deg,
    mau: red.darken(10%)),
  cam: cm3, w: 8cm,
))

== 10.4. HỒI QUY — khối đa diện đứng RIÊNG phải giống hệt đường đi cũ

Trái `da-dien` (back-face culling), phải `khoi-da-dien` trong `mat-cong`
(bắn tia). Cùng `cam:`, KHÔNG tô màu ⇒ hai hình phải TRÙNG KHÍT từng nét,
từng chỗ liền/đứt, từng vị trí nhãn đỉnh.

#grid(columns: 2, column-gutter: 8pt,
  da-dien(..khoi-chop-deu(n: 4, R: 2, cao: 3.6), cam: cm3, w: 6cm),
  mat-cong(khoi-da-dien(..khoi-chop-deu(n: 4, R: 2, cao: 3.6)),
    cam: cm3, w: 6cm),
)

#grid(columns: 2, column-gutter: 8pt,
  da-dien(..khoi-lang-tru-deu(n: 6, R: 1.8, cao: 3.4), cam: cm3, w: 6cm),
  mat-cong(khoi-da-dien(..khoi-lang-tru-deu(n: 6, R: 1.8, cao: 3.4)),
    cam: cm3, w: 6cm),
)

Đã kiểm bằng bản port Python trước khi biên dịch: với lập phương, chóp tứ giác
đều, tứ diện đều và lăng trụ lục giác đều, phân loại liền/đứt của lối bắn tia
KHỚP 100% với back-face culling (0 cạnh lệch trên cả 4 khối).
