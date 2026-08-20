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
  mat-cong(khoi-cau(r: 2, nghieng: 35deg, huong: 80deg), w: 4.6cm),
  mat-cong(khoi-cau(r: 2, xich-dao: false, to: rgb("#d57891")), w: 4.6cm),
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
    khoi-cau(tam: (1.6, 0.5, 3), r: 1.5, mau: green.darken(20%)),
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
