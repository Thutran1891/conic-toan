#import "../baigiang.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(font: ("Charis SIL", "Noto Serif", "Libertinus Serif"), size: 11pt)

#align(center, text(15pt, weight: "bold")[
  Thử engine mặt cong — nét khuất tự động (mat-cong.typ)
])

= 0. TRỤC KHỐI ĐẶT NGHIÊNG — toàn thân nghiêng theo

`nghieng:` là góc giữa trục khối và Oz, `huong:` là hướng ngả. Mặt đáy luôn
VUÔNG GÓC với trục nên khi trục nghiêng thì đáy và đường sinh nghiêng cùng.

#grid(columns: 3, column-gutter: 6pt,
  mat-cong(mat-tru(r: 1.2, cao: 5, mau: blue.darken(10%)),
    cam: chieu-truc-giao(ngang: 20deg, cao: 20deg), w: 4.6cm),
  mat-cong(mat-tru(r: 1.2, cao: 5, nghieng: 55deg, huong: 200deg, mau: blue.darken(10%)),
    cam: chieu-truc-giao(ngang: 20deg, cao: 20deg), w: 4.6cm),
  mat-cong(mat-non(r: 1.6, cao: 4.5, nghieng: -20deg, huong: 190deg, mau: red.darken(10%)),
    cam: chieu-truc-giao(ngang: 20deg, cao: 20deg), w: 4.6cm),
)

Hai khối CÙNG nghiêng và che nhau — nét khuất vẫn tự cắt đúng:

#align(center, mat-cong(
  mat-non(r: 1.5, cao: 4, nghieng: 55deg, huong: 210deg, mau: red.darken(10%)),
  mat-tru(tam: (1.2, 1.6, 0), r: 1.5, cao: 4, nghieng: 55deg, huong: 210deg,
    mau: blue.darken(10%)),
  cam: chieu-truc-giao(ngang: 20deg, cao: 20deg), w: 8cm,
))

= 1. Từng khối một (mốc đối chiếu)

Nón đứng một mình: cung đáy nửa sau phải ĐỨT, hai đường sinh biên LIỀN.
Trụ đứng một mình: đáy dưới nửa sau ĐỨT, nắp trên liền cả vòng.

#grid(columns: 2, column-gutter: 8pt,
  mat-cong(mat-non(r: 2, cao: 3.6), w: 6cm),
  mat-cong(mat-tru(r: 1.8, cao: 3.6), w: 6cm),
)

= 2. Nón chui vào trụ — ca của bài "giao khối nón và khối trụ"

Trục nón là một đường sinh của trụ. Cần thấy: đường sinh phải của nón ĐỨT ở
đoạn nằm trong lòng trụ; đường sinh biên TRÁI của trụ ĐỨT ở đoạn dưới vì nằm
trong lòng nón.

#align(center, mat-cong(
  mat-non(r: 2, cao: 4, mau: red.darken(10%), to: rgb(198, 40, 40, 42)),
  mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%), to: rgb(21, 101, 192, 36)),
  w: 9cm,
))

#pagebreak()

= 3. Trụ nhỏ nội tiếp trong nón

Toàn bộ trụ nằm trong nón nên gần như MỌI nét của trụ phải ĐỨT, trừ phần nắp
trên nhô ra ngoài mặt nón (nếu có).

#align(center, mat-cong(
  mat-non(r: 2.6, cao: 4, mau: red.darken(10%)),
  mat-tru(r: 1.1, cao: 2, mau: blue.darken(10%)),
  w: 8cm,
))

= 4. Hai khối RỜI nhau — không được đứt nhầm

Đặt xa nhau thì mỗi khối phải giống hệt mục 1.

#align(center, mat-cong(
  mat-non(r: 1.6, cao: 3, mau: red.darken(10%)),
  mat-tru(tam: (0, 6, 0), r: 1.6, cao: 3, mau: blue.darken(10%)),
  w: 11cm,
))

= 5. Tắt nét khuất + đường vẽ thêm tự chia liền/đứt

Trái: `hien-khuat: false` — bỏ hẳn nét đứt (kiểu hình bìa sách).
Phải: đường tròn thiết diện đưa qua `duong:` cũng được tự cắt theo hai khối.

#grid(columns: 2, column-gutter: 8pt,
  mat-cong(
    mat-non(r: 2, cao: 4, mau: red.darken(10%)),
    mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%)),
    w: 7cm, hien-khuat: false,
  ),
  mat-cong(
    mat-non(r: 2, cao: 4, mau: red.darken(10%)),
    mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%)),
    w: 7cm,
    duong: (
      (pts: tron-ngang((0, 0, 1.6), 1.2), mau: green.darken(25%), day: 0.9pt),
    ),
  ),
)

= 6. GÓC NGHIÊNG: chiếu xiên (vô lý) so với chiếu trực giao (đồng bộ)

Trái — `chieu-oxyz`: elip đáy NGHIÊNG mà trục khối lại THẲNG ĐỨNG.
Phải — `chieu-truc-giao`: elip đáy trục lớn NẰM NGANG, trục khối thẳng đứng,
hệ trục vẽ bằng CHÍNH camera đó nên cả khung hình chung một góc nghiêng.

#grid(columns: 2, column-gutter: 6pt,
  mat-cong(
    mat-non(r: 2, cao: 4, mau: red.darken(10%)),
    mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%)),
    cam: chieu-oxyz(k: 0.7, goc: 30deg), w: 7cm,
  ),
  mat-cong(
    mat-non(r: 2, cao: 4, mau: red.darken(10%)),
    mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%)),
    cam: chieu-truc-giao(ngang: 15deg, cao: 22deg), w: 7cm,
    truc: (x: 2.6, y: 4.4, z: 4.6),
  ),
)

= 7. Dùng trong hệ trục `oxyz` — k và goc PHẢI trùng nhau

#align(center, oxyz(
  w: 9cm, x: 2.6, y: 4.4, z: 4.6, am: 0.4,
  k: 0.7, goc: 30deg, don-vi: false,
  them: (ctx, t3) => {
    ve-mat-cong(
      ctx,
      mat-non(r: 2, cao: 4, mau: red.darken(10%)),
      mat-tru(tam: (0, 2, 0), r: 2, cao: 4, mau: blue.darken(10%)),
      cam: chieu-oxyz(k: 0.7, goc: 30deg),
    )
    diem(ctx, t3((0, 0, 4)), ten: $S$, huong: "trai", bk: 1.6pt)
    diem(ctx, t3((0, 2, 0)), ten: $I$, huong: "duoi-phai", bk: 1.6pt)
  },
))
