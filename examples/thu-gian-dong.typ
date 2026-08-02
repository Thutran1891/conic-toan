// =====================================================================
// thu-gian-dong.typ — thử biến GIÃN DÒNG `gian-dong`
//
// Biên dịch 3 hồ sơ:
//   typst compile --input ho-so=dethi   thu-gian-dong.typ thu-gian-dong-dethi.pdf
//   typst compile --input ho-so=loigiai thu-gian-dong.typ thu-gian-dong-loigiai.pdf
//   typst compile --input ho-so=beamer  thu-gian-dong.typ thu-gian-dong-beamer.pdf
//
// Đổi `gian-dong:` ở dòng #show: de-toan.with(...) để so sánh:
//   1.0 (mốc mặc định)  ·  1.3 (giãn 30%)  ·  0.85 (thu lại)
// =====================================================================
#import "@local/conic-toan:0.2.0": *

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ GIÃN DÒNG — gian-dong],
  tieu-de-ngan: [Giãn dòng],
  mon: [MÔN TOÁN 11],
  gian-dong: 1.0,          // <<<<< ĐỔI SỐ NÀY để xem tác dụng toàn tài liệu
  thong-tin-hs: false,
)

// Đoạn văn nhiều phân số/căn thức, dùng lại nhiều lần để so sánh.
#let doan-nang = [
  Ta có $3 pi = 3 pi dot (180/pi) degree = 540 degree$ và
  $-(11 pi)/5 = -(11 pi)/5 dot (180/pi) degree = -396 degree$, đồng thời
  $sqrt((a^2 + b^2)/(c^2 + d^2)) = (sqrt(a^2 + b^2))/(sqrt(c^2 + d^2))$ nên
  $x_(n + 1) = 1/2 (x_n + 2/x_n)$ với mọi $n >= 1$; ngoài ra
  $limits(lim)_(x -> 0) (sin x)/x = 1$ và
  $((1)/(1 + x^2))' = (-2 x)/((1 + x^2)^2)$.
]

#phan[A. Mốc mặc định (theo gian-dong của cả tài liệu)]

#tl(
  [Đổi số đo các góc sau sang độ: $3 pi$ và $-(11 pi)/5$.],
  loigiai: [
    a) Ta có: \
    $3 pi = 3 pi dot (180/pi) degree = 540 degree$. \
    b) Ta có: \
    $-(11 pi)/5 = -(11 pi)/5 dot (180/pi) degree = -396 degree$. \
    Vậy hai góc lần lượt là $540 degree$ và $-396 degree$.
  ],
)

#tl([Đoạn văn xuôi có nhiều phân số lồng.], loigiai: doan-nang)

#phan[B. Ghi đè RIÊNG một câu bằng tham số gian-dong:]

#tl(
  [Cùng đề như câu đầu, nhưng câu này đặt gian-dong: 1.6.],
  gian-dong: 1.6,
  loigiai: [
    a) Ta có: \
    $3 pi = 3 pi dot (180/pi) degree = 540 degree$. \
    b) Ta có: \
    $-(11 pi)/5 = -(11 pi)/5 dot (180/pi) degree = -396 degree$. \
    Vậy hai góc lần lượt là $540 degree$ và $-396 degree$.
  ],
)

#tn(
  [Câu trắc nghiệm đặt gian-dong: 1.5. Tổng
   $A = 1/2 + 1/6 + 1/12 + dots.c + 1/(n (n + 1))$ bằng],
  ( [$n/(n + 2)$], True([$n/(n + 1)$]), [$(n + 1)/n$], [$1/(n + 1)$] ),
  gian-dong: 1.5,
  loigiai: [
    Ta có $1/(k (k + 1)) = 1/k - 1/(k + 1)$. \
    Do đó $A = (1/1 - 1/2) + (1/2 - 1/3) + dots.c + (1/n - 1/(n + 1))$. \
    Rút gọn: $A = 1 - 1/(n + 1) = n/(n + 1)$.
  ],
)

#ds(
  [Câu đúng — sai đặt gian-dong: 1.45. Cho $f(x) = (x^2 - 1)/(x + 2)$.],
  (
    True([Tập xác định của $f$ là $RR without {-2}$.]),
    [$limits(lim)_(x -> -2^+) f(x) = -oo$.],
    True([$f'(x) = (x^2 + 4 x + 1)/((x + 2)^2)$.]),
    [Đồ thị của $f$ có tiệm cận ngang $y = 0$.],
  ),
  gian-dong: 1.45,
  loigiai: [
    Điều kiện $x + 2 != 0$ nên tập xác định là $RR without {-2}$. \
    Khi $x -> -2^+$ thì $x^2 - 1 -> 3 > 0$ và $x + 2 -> 0^+$, do đó
    $limits(lim)_(x -> -2^+) f(x) = +oo$: ý b) sai. \
    Đạo hàm $f'(x) = (2 x (x + 2) - (x^2 - 1))/((x + 2)^2) = (x^2 + 4 x + 1)/((x + 2)^2)$. \
    Bậc tử lớn hơn bậc mẫu nên đồ thị có tiệm cận XIÊN, không có tiệm cận ngang.
  ],
)

#phan[C. Đổi giữa bài bằng #"#"gian-dong(k)]

#gian-dong(1.5)

#slide(tieu-de: [Hệ số 1.5])[
  Từ đây trở đi hệ số giãn dòng là $1.5$ — áp cho các slide và khung lời giải
  phía sau. #doan-nang
]

#tl([Câu này thừa hưởng hệ số $1.5$ vừa đặt.], loigiai: doan-nang)

#gian-dong(0.85)

#slide(tieu-de: [Hệ số 0.85])[
  Còn từ đây là $0.85$ — các dòng sát lại. #doan-nang
]

#tl([Câu này thừa hưởng hệ số $0.85$.], loigiai: doan-nang)

#gian-dong(1.0)

#phan[D. voi-gian-dong(k) cho một khối bất kì]

#slide(tieu-de: [Giãn dòng cho một khối])[
  Đoạn này giãn dòng mặc định. #doan-nang

  #voi-gian-dong(1.7)[
    Còn RIÊNG khối này đặt hệ số $1.7$; phần văn bản trước và sau không đổi.
    #doan-nang
  ]

  Trở lại mặc định ngay sau khối trên. #doan-nang
]

#phan[E. Khung lời giải hiện dần (giai-buoc)]

#vd(
  [Giải phương trình $x^2 - 5 x + 6 = 0$ bằng công thức nghiệm.],
  loigiai: [
    Bước 1: $x = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$. \
    Bước 2: thay $a = 1$, $b = -5$, $c = 6$ được $x = (5 plus.minus 1)/2$. \
    Bước 3: vậy $x = 3$ hoặc $x = 2$.
  ],
)

#vd(
  [Cùng ví dụ trên nhưng khung lời giải đặt gian-dong: 1.5.],
  gian-dong: 1.5,
  loigiai: [
    Bước 1: $x = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$. \
    Bước 2: thay $a = 1$, $b = -5$, $c = 6$ được $x = (5 plus.minus 1)/2$. \
    Bước 3: vậy $x = 3$ hoặc $x = 2$.
  ],
)

#het(ghi-chu: [Kiểm tra: A/B khác nhau rõ rệt · C đổi hai lần · D chỉ đổi trong khối.])
