// =====================================================================
// dai-so.typ — TỔNG HỢP HÌNH ẢNH ĐẠI SỐ / GIẢI TÍCH
// Gộp từ 8 file demo trong thư mục gốc TYPST BEAMER:
//   [A] thu-do-thi.typ       — Đồ thị dựng sẵn (bậc 2, 3, trùng phương,
//                              phân thức, hữu tỉ) + cửa sổ thông minh
//   [B] thu-bbt-he-so.typ    — Bảng biến thiên tự động từ hệ số
//   [C] thu-khao-sat.typ     — 5 hàm khảo sát vẽ đồ thị (lời giải trọn vẹn)
//   [D] thu-bang-tk.typ      — 4 loại bảng tần số thống kê
//   [E] thu-ve-moi.typ       — Nhiều đồ thị, miền nghiệm, sơ đồ cây,
//                              diện tích 2 đồ thị, biểu đồ Venn
//   [F] thu-truc-goc.typ     — he-truc gộp, đồ thị có lưới/vạch chia
//   [G] thu-fig-giai.typ     — Hình đề + hình lời giải (câu hỏi có kèm hình)
//   [H] test-hd-vdtt.typ     — Dạng câu #hd (hoạt động) & #vdtt (vận dụng
//                              thực tế) — chủ đề GTLN—GTNN
//
// Biên dịch:  typst compile dai-so.typ dai-so.pdf
// =====================================================================
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [TỔNG HỢP MINH HOẠ — ĐẠI SỐ & GIẢI TÍCH],
  tieu-de-ngan: [Đại số — Giải tích],
  nen: rgb("#e9efcb"),
  mon: [MÔN TOÁN 12],
  thong-tin-hs: false,
  gv: "Trần Thị Kim Thu",
)

// ----- MỤC LỤC (click để nhảy tới mục; số trang bên phải) -----
#outline(title: [Mục lục], depth: 2, indent: auto)
#pagebreak()


// =====================================================================
#phan([A. ĐỒ THỊ HÀM SỐ DỰNG SẴN (thu-do-thi.typ)], ngan: [A. Đồ thị])
// =====================================================================

== A.1 Bậc hai — mặc định gióng đỉnh + nhãn giao 2 trục
// Nghiệm vô tỉ $1 plus.minus sqrt(2)$ được ghi ĐÚNG dạng căn thức.
// Hình phải: đổi hướng nhãn đỉnh lên trên bằng `dinh: (x: "above", y: "left")`.
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-bac-hai(1, -2, -1, ten: $y = x^2 - 2x - 1$)),
  figure(do-thi-bac-hai(-1, 2, 3, ten: $y = -x^2 + 2x + 3$,
    dinh: (x: "above", y: "left"))),
)

== A.2 Bậc ba — có cực trị / không cực trị (cửa sổ quanh điểm uốn)
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-bac-ba(2 / 3, 0, -2, -1, mau: purple, ten: none)),
  figure(do-thi-bac-ba(1, -3, 3, -1, ten: $y = (x - 1)^3$, diem-uon: auto)),
)

== A.3 Trùng phương — 3 cực trị / 1 cực trị
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-trung-phuong(1, -4, 2, mau: purple)),
  figure(do-thi-trung-phuong(1, 2, 1, ten: $y = x^4 + 2x^2 + 1$)),
)

== A.4 Phân thức bậc 1 / bậc 1 (tiệm cận luôn vẽ)
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-phan-thuc(2, -1, 1, -1, ten: $y = (2x - 1)/(x - 1)$,
    giao-ox: auto, giao-oy: auto)),
  figure(do-thi-phan-thuc(-1, 2, 1, 2, ten: $y = (2 - x)/(x + 2)$)),
)

== A.5 Hữu tỉ bậc 2 / bậc 1 — BỐN TÌNH HUỐNG
// Trên-trái: $a\/d > 0$ có 2 cực trị · Trên-phải: $a\/d > 0$ không cực trị.
// Dưới-trái: $a\/d < 0$ có 2 cực trị · Dưới-phải: $a\/d < 0$ không cực trị.
// Khi không có cực trị, tâm đối xứng $I$ được gióng vào 2 trục (`tam: auto`).
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: 8pt,
  figure(do-thi-huu-ti(1, -1, 1, 1, -1, ten: $y = (x^2 - x + 1)/(x - 1)$,
    goc-ten: "above-left")),
  figure(do-thi-huu-ti(1, -1, -1, 1, -1, ten: $y = (x^2 - x - 1)/(x - 1)$,
    goc-ten: "above-left")),
  figure(do-thi-huu-ti(-1, 1, -1, 1, -1, ten: $y = (-x^2 + x - 1)/(x - 1)$,
    goc-ten: "below-left")),
  figure(do-thi-huu-ti(-1, 1, 1, 1, -1, ten: $y = (-x^2 + x + 1)/(x - 1)$,
    goc-ten: "below-left")),
)

== A.6 Tuỳ biến nhãn (hướng riêng cho từng cực trị / tắt gióng)
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-bac-ba(
    1, 0, -3, 0, ten: $y = x^3 - 3x$, goc-ten: (1, 2),
    cuc-tri: ((x: "below", y: "above-left"), (x: "above", y: "below-left")),
    giao-ox: auto,
  )),
  figure(do-thi-huu-ti(1, -1, 1, 1, -1, cuc-tri: none, ten-tcx: none,
    tam: (x: "below-right", y: "left"))),
)

== A.7 Co giãn trục `dan-x`, `dan-y` + vị trí tên hàm `goc-ten`
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-bac-ba(0.1, 0, -0.5, 0, ten: $y = x^3/10 - x/2$,
    dan-x: 1.5, dan-y: 2)),
  figure(do-thi-bac-ba(0.1, 0, -0.5, 0, ten: $y = x^3/10 - x/2$,
    dan-y: 2, goc-ten: "below-right")),
)


== A.8. BBT vẽ tự do. Dùng `len`, `xuong`, `len-duoi`, `len-tren`, `xuong-duoi`, `xuong-tren` và `ngang` để ám chỉ vùng không xác định
#bbt(
        x: ($-oo$, $0$, $2$, $+oo$),
        dau: ("", "+", "0", "-", "0", "+", ""),
        gia-tri: ($-oo$, $2$, $-2$, $+oo$),
        huong: ("len", "xuong", "len"),
        ten-fp: $y'$, ten-f: $y$,
        rong-cot: 2.2cm, cao-bt: 2cm,
      )

#bbt(
        x: ($-oo$, $0$, $2$, $5$ , $+oo$),
        dau: ("", "+", "0", "+", "0", "-", "0", "+", ""),
        gia-tri: ($-oo$, $1$, $3$, $-4$, $+oo$),
        huong: ("len-duoi", "len-tren", "xuong-tren", "len-tren"),
        ten-fp: $y'$, ten-f: $y$,
        rong-cot: 2.2cm, cao-bt: 3cm,
      )

#bbt(
        x: ($-oo$, $0$, $2$, $5$ , $+oo$),
        dau: ("", "+", "0", "+", "0", "-", "0", "-", ""),
        gia-tri: ($-oo$, $1$, $3$, $-4$, $+oo$),
        huong: ("len-duoi", "len-tren", "xuong-tren", "xuong-duoi"),
        ten-fp: $y'$, ten-f: $y$,
        rong-cot: 2.2cm, cao-bt: 3cm,
      )

#bbt(
  x: ($-oo$, $-2$, $2$, $+oo$),
  dau: ("", "+", "||", "", "||", "-", ""),
  gia-tri: ($-oo$, $0$, $0$, $-oo$),
  huong: ("len", "ngang", "xuong"),
  gach: (1,),
)      
=== BBT của hàm $y = sqrt(x^2 - 4)$
#bbt(
  x: ($-oo$, $-2$, $2$, $+oo$),
  dau: ("", "-", "||", "", "||", "+", ""),
  gia-tri: ($+oo$, $0$, $0$, $+oo$),
  huong: ("xuong", "ngang", "len"),
  gach: (1,),
)
=== BBT của hàm $y = sqrt(x^2 + 2x + 3)$
#bbt(
  x: ($-oo$, $-1$, $+oo$),
  dau: ("", "-", "0", "+", ""),
  gia-tri: ($+oo$, $sqrt(2)$, $+oo$),
  huong: ("xuong",  "len"),
)
=== BBT của hàm $y = sqrt(4x - x^2 )$
#bbt(
  x: ( $0$, $2$, $4$),
  dau: ("", "+", "0", "-", ""),
  gia-tri: ($0$, $2$, $0$),
  huong: ("len", "xuong"),
)


// =====================================================================
#phan([B. BẢNG BIẾN THIÊN TỰ ĐỘNG TỪ HỆ SỐ (thu-bbt-he-so.typ)],
  ngan: [B. BBT hệ số])
// =====================================================================

== B.1 Bậc hai
$y = x^2 - 3x + 1$ (đỉnh lẻ $3\/2$, $-5\/4$):
#bbt-bac-hai(1, -3, 1)

$y = -2x^2 + 4x$ ($a < 0$):
#bbt-bac-hai(-2, 4, 0)

== B.2 Bậc ba — 3 trường hợp × dấu $a$
$y = x^3 - 3x + 1$ (Δ' > 0, nghiệm đẹp):
#bbt-bac-ba(1, 0, -3, 1)

$y = x^3 - 3x^2 + x + 1$ (Δ' > 0, cực trị vô tỉ $(3 plus.minus sqrt(6))\/3$):
#bbt-bac-ba(1, -3, 1, 1)

$y = -x^3 - 4x^2 + x + 6$ (GIÁ TRỊ cực trị vô tỉ $(-2 plus.minus 38sqrt(19))\/27$):
#bbt-bac-ba(-1, -4, 1, 6)

$y = -x^3 + 3x - 2$ ($a < 0$, 2 cực trị):
#bbt-bac-ba(-1, 0, 3, -2)

$y = x^3 - 3x^2 + 3x$ (Δ' = 0, $y'$ có nghiệm kép $x = 1$):
#bbt-bac-ba(1, -3, 3, 0)

$y = -x^3 + 3x^2 - 3x + 5$ (Δ' = 0, $a < 0$):
#bbt-bac-ba(-1, 3, -3, 5)

$y = x^3 + x$ (Δ' < 0, đồng biến):
#bbt-bac-ba(1, 0, 1, 0)

$y = -x^3 - 2x + 7$ (Δ' < 0, nghịch biến):
#bbt-bac-ba(-1, 0, -2, 7)

== B.3 Trùng phương — 3 cực trị / 1 cực trị × dấu $a$
$y = x^4 - 2x^2$ ($a > 0$, 3 cực trị):
#bbt-trung-phuong(1, -2, 0)

$y = -x^4 + 2x^2 + 3$ ($a < 0$, 3 cực trị):
#bbt-trung-phuong(-1, 2, 3)

$y = x^4 - 3x^2 + 1$ (cực trị vô tỉ $plus.minus sqrt(6)\/2$, $y = -5\/4$):
#bbt-trung-phuong(1, -3, 1)

$y = 3x^4 - 4x^2 + 1$ ($x_0$ vô tỉ $sqrt(6)\/3$, $y_c = -1\/3$):
#bbt-trung-phuong(3, -4, 1)

$y = x^4 + 2x^2 + 1$ ($a b > 0$: 1 cực tiểu):
#bbt-trung-phuong(1, 2, 1)

$y = x^4 - 1$ ($b = 0$: 1 cực tiểu):
#bbt-trung-phuong(1, 0, -1)

$y = -x^4 - x^2 + 2$ ($a < 0$: 1 cực đại):
#bbt-trung-phuong(-1, -1, 2)

== B.4 Phân thức bậc 1 / 1
$y = (2x - 1)/(x - 1)$ ($a d - b c < 0$: nghịch biến, TCĐ $x = 1$, TCN $y = 2$):
#bbt-phan-thuc(2, -1, 1, -1)

$y = (x - 2)/(x + 1)$ ($a d - b c > 0$: đồng biến):
#bbt-phan-thuc(1, -2, 1, 1)

$y = (2x + 1)/(3x - 2)$ (tiệm cận phân số $2\/3$):
#bbt-phan-thuc(2, 1, 3, -2)

== B.5 Hữu tỉ bậc 2 / 1
$y = (x^2 - x + 1)/(x - 1)$ ($p > 0$, 2 cực trị):
#bbt-huu-ti(1, -1, 1, 1, -1)

$y = (-x^2 + x - 1)/(x - 1)$ ($p < 0$, 2 cực trị):
#bbt-huu-ti(-1, 1, -1, 1, -1)

$y = (x^2 - 2x + 2)/(x + 1)$ (cực trị vô tỉ $-1 plus.minus sqrt(5)$):
#bbt-huu-ti(1, -2, 2, 1, 1)

$y = (x^2 + x + 1)/(2x - 1)$ (GIÁ TRỊ cực trị vô tỉ $(2 plus.minus sqrt(7))\/2$):
#bbt-huu-ti(1, 1, 1, 2, -1)

$y = (x^2 - 4)/(x - 1)$ ($p r d < 0$: đồng biến trên từng khoảng):
#bbt-huu-ti(1, 0, -4, 1, -1)

$y = (-x^2 + 4)/(x - 1)$ ($p < 0$, nghịch biến trên từng khoảng):
#bbt-huu-ti(-1, 0, 4, 1, -1)

$y = (x^2 - 1)/(x - 1)$ (suy biến $r = 0$):
#bbt-huu-ti(1, 0, -1, 1, -1)

== B.6. Căn bậc hai của tam thức: y = √(ax² + bx + c)
$y = sqrt(x^2 - 4)$ ($a > 0$, 2 nghiệm $plus.minus 2$, gạch khoảng giữa):
#bbt-can-bac-hai-ham-bac-hai(1, 0, -4)
$y = sqrt(x^2 + 2x + 3)$ ($a > 0$, vô nghiệm, cực tiểu $sqrt(2)$):
#bbt-can-bac-hai-ham-bac-hai(1, 2, 3)
$y = sqrt(x^2 - 2x + 1)$ ($a > 0$, nghiệm kép $x = 1$, min $0$, $y'$ KXĐ ‖):
#bbt-can-bac-hai-ham-bac-hai(1, -2, 1)
$y = sqrt(4x - x^2)$ ($a < 0$, nghiệm $0, 4$, cực đại $2$):
#bbt-can-bac-hai-ham-bac-hai(-1, 4, 0)
$y = sqrt(2x^2 - 3x + 5)$ ($a > 0$, vô nghiệm, cực tiểu $sqrt(62)\/4$):
#bbt-can-bac-hai-ham-bac-hai(2, -3, 5)


== B.7 Form cũ vẫn chạy (hồi quy)
#bbt-bac-hai(a: 1, xd: $1$, yd: $-2$)
#bbt-bac-ba(a: -1, x1: $0$, y1: $-4$, x2: $2$, y2: $0$)
#bbt-trung-phuong(a: 1, x0: $1$, yc: $-1$, y0: $0$)
#bbt-phan-thuc(x0: $1$, y0: $2$, dong-bien: false)


// =====================================================================
#phan([C. KHẢO SÁT VẼ ĐỒ THỊ HÀM SỐ (thu-khao-sat.typ)],
  ngan: [C. Khảo sát])
// =====================================================================

== C.1 Bậc hai — $a > 0$, $Delta > 0$
#khao-sat-ve-do-thi-ham-bac-hai(1, -2, -3)

== C.2 Bậc hai — $a < 0$, $Delta < 0$
#khao-sat-ve-do-thi-ham-bac-hai(-1, 2, -5)

== C.3 Bậc hai — $Delta = 0$
#khao-sat-ve-do-thi-ham-bac-hai(1, -4, 4)

== C.4 Bậc ba — 2 cực trị, $a > 0$
#khao-sat-ve-do-thi-ham-bac-ba(1, 0, -3, 1)

== C.5 Bậc ba — 2 cực trị, $a < 0$
#khao-sat-ve-do-thi-ham-bac-ba(-1, 3, 0, 1)

== C.6 Bậc ba — đơn điệu $Delta' < 0$, $a > 0$
#khao-sat-ve-do-thi-ham-bac-ba(2/3, 2, 8, 3)

== C.7 Bậc ba — $Delta' = 0$ ($y = (x - 1)^3 + 1$)
#khao-sat-ve-do-thi-ham-bac-ba(1, -3, 3, 0)

== C.8 Trùng phương — 3 cực trị, $a > 0$
#khao-sat-ve-do-thi-ham-trung-phuong(1, -2, 0)

== C.9 Trùng phương — 3 cực trị, $a < 0$
#khao-sat-ve-do-thi-ham-trung-phuong(-1, 2, 1)

== C.10 Trùng phương — 1 cực trị, $a > 0$
#khao-sat-ve-do-thi-ham-trung-phuong(1, 2, -1)

== C.11 Trùng phương — 1 cực trị, $a < 0$
#khao-sat-ve-do-thi-ham-trung-phuong(-1, -1, 2)

== C.12 Phân thức 1/1 — nghịch biến
#khao-sat-ve-do-thi-ham-phan-thuc(2, -1, 1, -1)

== C.13 Phân thức 1/1 — đồng biến
#khao-sat-ve-do-thi-ham-phan-thuc(1, -5, 1, -4)

== C.14 Hữu tỉ 2/1 — 2 cực trị
#khao-sat-ve-do-thi-ham-huu-ti(1, 4, 20, 1, 2)

== C.15 Hữu tỉ 2/1 — đơn điệu, $p > 0$
#khao-sat-ve-do-thi-ham-huu-ti(2, 4, -8, 1, 1)

== C.16 Hữu tỉ 2/1 — đơn điệu, $p < 0$
#khao-sat-ve-do-thi-ham-huu-ti(-2, 5, 10, 1, -2)


// =====================================================================
#phan([D. BẢNG TẦN SỐ THỐNG KÊ (thu-bang-tk.typ)], ngan: [D. Bảng TK])
// =====================================================================

== D.1 Bảng tần số ĐƠN — số con trong một số hộ gia đình
#bang-tan-so(
  gia-tri: (0, 1, 2, 3, 4),
  tan-so: (4, 3, 4, 7, 2),
  ten-gia-tri: [Số con],
  ten-tan-so: [Số hộ gia đình],
)

== D.2 Bảng tần số ĐƠN — điểm bài kiểm tra (có tô nền cột nhãn)
#bang-tan-so(
  gia-tri: (5, 6, 7, 8, 9),
  tan-so: (1, 2, 20, 2, 1),
  ten-gia-tri: [Điểm số],
  ten-tan-so: [Số học sinh],
  mau-tieu-de: luma(92%),
)

== D.3 Bảng tần số ĐÔI — chỉ số IQ 100 SV nam / 100 SV nữ
#bang-tan-so-doi(
  gia-tri: (
    khoang(86, 92), khoang(92, 98), khoang(98, 104),
    khoang(104, 110), khoang(110, 116),
  ),
  tan-so-1: (33, 22, 8, 20, 17),
  tan-so-2: (19, 12, 29, 21, 19),
  ten-gia-tri: [Chỉ số IQ],
  ten-1: [Số SV nam],
  ten-2: [Số SV nữ],
)

== D.4 Ghép nhóm ĐƠN — số tiền khách mua văn phòng phẩm
#bang-ghep-nhom(
  moc: (35, 40, 45, 50, 55),
  tan-so: (2, 21, 21, 5),
  ten-nhom: [Số tiền],
  don-vi: [nghìn đồng],
  ten-tan-so: [Số khách hàng],
)

== D.5 Ghép nhóm ĐƠN — đường kính 100 cây Sồi
#bang-ghep-nhom(
  moc: (10, 13, 16, 19, 22, 25, 28),
  tan-so: (6, 11, 20, 35, 20, 8),
  ten-nhom: [Đường kính],
  don-vi: [dm],
  ten-tan-so: [Số cây trồng],
)

== D.6 Ghép nhóm ĐƠN — cân nặng 73 quả bưởi (mốc là số thập phân)
#bang-ghep-nhom(
  nhom: (
    khoang($0,7$, $1,0$), khoang($1,0$, $1,3$), khoang($1,3$, $1,6$),
    khoang($1,6$, $1,9$), khoang($1,9$, $2,2$),
  ),
  tan-so: (14, 18, 29, 8, 4),
  ten-nhom: [Cân nặng],
  don-vi: [kg],
  ten-tan-so: [Số quả bưởi],
)

== D.7 Ghép nhóm ĐÔI — so sánh điểm hai lớp 12A / 12B
#bang-ghep-nhom-doi(
  moc: (0, 2, 4, 6, 8, 10),
  tan-so-1: (1, 4, 12, 15, 8),
  tan-so-2: (0, 6, 14, 11, 9),
  ten-nhom: [Điểm số],
  ten-1: [Lớp 12A],
  ten-2: [Lớp 12B],
  mau-tieu-de: luma(92%),
)


// =====================================================================
#phan([E. NHIỀU ĐỒ THỊ · MIỀN NGHIỆM · SƠ ĐỒ CÂY · DIỆN TÍCH · VENN
       (thu-ve-moi.typ)], ngan: [E. Vẽ mới])
// =====================================================================

== E.1 Nhiều đồ thị trên cùng một hệ trục — `do-thi-nhieu-ham`
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(do-thi-nhieu-ham(
    ham(x => x * x - 2, mau: blue, ten: $y = x^2 - 2$),
    ham(x => x, mau: red, ten: $y = x$, huong-ten: "below"),
    xmin: -3.4, xmax: 3.4, ymin: -2.8, ymax: 4.2,
    giao-diem: auto, w: 7cm,
  )),
  figure(do-thi-nhieu-ham(
    ham(x => calc.sin(x), mau: blue, ten: $y = sin x$),
    ham(x => calc.cos(x), mau: purple, ten: $y = cos x$,
      dut: true, tai: -3.4, huong-ten: "below"),
    xmin: -4.7, xmax: 4.7, ymin: -1.6, ymax: 1.9,
    w: 8cm, giao-diem: auto,
  )),
)

== E.2 Miền nghiệm BPT / hệ BPT bậc nhất hai ẩn — `mien-nghiem`
// Trái: $4x + 5y < -8$ — gạch phần loại bỏ, biên NÉT ĐỨT vì bpt ngặt.
// Phải: hệ $3x - 2y <= -9$ và $3x - 5y >= -18$ — tô giao 2 nửa mp.
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(mien-nghiem(
    bpt(4, 5, -8, dau: "<", mau: red, mau-gach: green.darken(10%)),
    xmin: -4.5, xmax: 4.5, ymin: -4.5, ymax: 2.5,
    giao-truc: auto, w: 6.6cm,
  )),
  figure(mien-nghiem(
    bpt(3, -2, -9, mau: red, ten: $3x - 2y = -9$,
      ten-tai: 0.72, huong-ten: "left"),
    bpt(-3, 5, 18, mau: green.darken(25%)),
    xmin: -7.5, xmax: 2.5, ymin: -1.5, ymax: 5,
    to-mien: rgb("#2b28c823"), w: 7.2cm,
  )),
)

== E.3 Sơ đồ cây xác suất — `so-do-cay`
#figure(so-do-cay(
  goc: $1$,
  nhanh: (
    nut($A$, xs: $1/6$, con: (
      nut($B$, xs: $1/2$, kq: $A B: 1/12$),
      nut($overline(B)$, xs: $1/2$, kq: $A overline(B): 1/12$),
    )),
    nut($overline(A)$, xs: $5/6$, con: (
      nut($B$, xs: $1/3$, kq: $overline(A) B: 5/18$),
      nut($overline(B)$, xs: $2/3$, kq: $overline(A) overline(B): 5/9$),
    )),
  ),
  w: 11.5cm, cao-hang: 1.7cm,
))

== E.4 Diện tích 2 đồ thị — tự tìm giao điểm — `dien-tich-2-ham`
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(dien-tich-2-ham(
    x => x * x * x + 5 * x * x + 6 * x,
    tu: -4, den: 1, w: 7.2cm,
    ten-f: $y = f(x)$, huong-ten-f: "right"
  )),
  figure(dien-tich-2-ham(
    x => x * x, g: x => x + 2,
    tu: -3, den: 3, w: 7.2cm,
    ten-f: $y = x^2$, huong-ten-f: "left",
    ten-g: $y = x + 2$, huong-ten-g: "right",
    mau-to: rgb(200, 60, 60, 60),
  )),
)

== E.5 Diện tích 2 đồ thị trên đoạn $[a; b]$
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  figure(dien-tich-2-ham(
    x => calc.sin(x),
    a: 0.5, b: calc.pi, w: 7.2cm,
    ten-f: $y = sin x$, huong-ten-f: "left",
    mau-to: rgb(60, 160, 90, 70),
  )),
  figure(dien-tich-2-ham(
    x => x * x - 1, g: x => -x - 1,
    a: -2, b: 1.5, w: 7.2cm,
    ten-f: $y = x^2 - 1$, huong-ten-f: "left",
    ten-g: none,
    them: ctx => {
      nhan(ctx, (1, -2), $y = -x - 1$,
        mau: red, huong: "below",
        quay: goc-truc(ctx, (0, -1), (1, -2)))
    },
  )),
)

== E.6 Giao đường thẳng với đường cong
// Parabol $y = 1/2 x^2 - 3/2$ cắt đường thẳng $d$ qua $A(-3; 2), B(3; -1)$;
// thêm đường đứng $x = 2$ cắt parabol tại $Q$.
#hinh(w: 9cm, xmin: -4, xmax: 4, ymin: -2.6, ymax: 3.4, ctx => {
  truc(ctx)
  let f = x => 0.5 * x * x - 1.5
  let A = (-3.0, 2.0)
  let B = (3.0, -1.0)

  ve-ham(ctx, f, tu: -3.1, den: 3.1, mau: blue)
  doan(ctx, A, B, mau: red)

  // đường thẳng AB → hàm bậc nhất → tìm giao với f
  let d = ham-qua-2-diem(A, B)
  for (i, P) in giao-ham(f, d, -3.1, 3.1).enumerate() {
    diem(ctx, P, ten: $P_#(i + 1)$,
      huong: if i == 0 { "tren-phai" } else { "trai" },
      bk: 2.2pt, mau: red)
  }

  // đường ĐỨNG x = 2: giao là (2, f(2)), tính trực tiếp
  let Q = (2.0, f(2.0))
  doan(ctx, (2, ctx.ymin), (2, ctx.ymax), mau: purple, dut: true)
  diem(ctx, Q, ten: $Q$, huong: "phai", bk: 2.2pt, mau: purple)
})

== E.7 Giao hai đường cong (dùng chung `giao-ham`)
// $y = 0.15 x^3 - x$ cắt $y = 1/4 x$ tại 3 điểm.
#hinh(w: 9cm, xmin: -3.8, xmax: 3.8, ymin: -2.2, ymax: 2.2, ctx => {
  truc(ctx)
  let f = x => 0.15 * calc.pow(x, 3) - x
  let g = x => 0.25 * x

  ve-ham(ctx, f, tu: -3.4, den: 3.4, mau: blue)
  ve-ham(ctx, g, tu: -3.6, den: 3.6, mau: green.darken(25%))

  let cac-giao = giao-ham(f, g, -3.5, 3.5)
  let huong-nhan = ("duoi-phai", "tren-trai", "phai")
  for (i, P) in cac-giao.enumerate() {
    diem(ctx, P, ten: $M_#(i + 1)$, huong: huong-nhan.at(i),
      bk: 2.2pt, mau: red)
    // gióng nét đứt xuống Ox cho 2 giao điểm ngoài cùng
    if i != 1 {
      doan(ctx, P, (P.at(0), 0), mau: red, day: 0.7pt, dut: true)
      // nhãn hoành độ đặt dưới trục, đẩy ra hai bên cho khỏi chạm đường gióng
      nhan(ctx, (P.at(0), 0), so-toan(P.at(0)),
        huong: if i == 0 { "duoi-trai" } else { "duoi-phai" }, cach: 7pt, mau: red)
    }
  }
})

// $y =  x^3 - 3x^2$ + 3 cắt $y = -x^2 + x + 1$ tại 3 điểm.
#hinh(w: 9cm, xmin: -2, xmax: 3, ymin: -2, ymax: 4, ctx => {
  truc(ctx)
  let f = x => x*x*x - 3 * x *x + 3
  let g = x => - x * x + x + 1

  ve-ham(ctx, f, tu: -2, den: 3.6, mau: blue)
  ve-ham(ctx, g, tu: -2, den: 3.6, mau: green.darken(25%))

  let cac-giao = giao-ham(f, g, -2, 3.6)
  let huong-nhan = ("duoi-phai", "tren-phai", "phai")
  for (i, P) in cac-giao.enumerate() {
    diem(ctx, P, ten: $M_#(i + 1)$, huong: huong-nhan.at(i),
      bk: 2.2pt, mau: red)
    // gióng nét đứt xuống Ox cho 3 giao điểm 
      doan(ctx, P, (P.at(0), 0), mau: red, day: 0.7pt, dut: true)
      // nhãn hoành độ 
      nhan(ctx, (P.at(0), 0), so-toan(P.at(0)),
        huong: if i == 1 { "duoi" } else { "tren" }, cach: 7pt, mau: red)
  }
})


== E.6 Biểu đồ Venn — $(A inter B) \\ C$ dùng miền đặt tên
#hinh(w: 7.5cm, xmin: -2, xmax: 2, ymin: -2, ymax: 2, ctx => {
  let A = mien-tron((-0.5, 0.3), 0.9)
  let B = mien-tron((0.5, 0.3), 0.8)
  let C = mien-tron((0, -0.5), 0.7)
  ve-mien(ctx, A, mau: blue)
  ve-mien(ctx, B, mau: purple)
  ve-mien(ctx, C)
  gach-vung(ctx, giao(A, B, bu(C)), mau: red, day: 0.4pt, buoc: 4.5pt)
  nhan(ctx, (-1.3, 0.35), $A$, huong: "left")
  nhan(ctx, (1.3, 0.35), $B$, huong: "right")
  nhan(ctx, (0, -1.15), $C$, huong: "below")
})

== E.7 Venn — 2 elip xoay giao nhau
#hinh(w: 6.5cm, xmin: -2.2, xmax: 2.2, ymin: -2, ymax: 2, ctx => {
  let A = mien-elip((-0.4, 0.25), 1.3, 0.85, quay: 30deg)
  let B = mien-elip((1, 0.25), 1.3, 1, quay: -15deg)
  ve-mien(ctx, A, mau: blue)
  ve-mien(ctx, B, mau: purple)
  gach-vung(ctx, giao(A, B), mau: black, day: 0.4pt, buoc: 4.5pt)
})

== E.8 Venn — elip xoay $inter$ phần bù đường tròn
#hinh(w: 7.5cm, xmin: -2.2, xmax: 2.2, ymin: -2, ymax: 2, ctx => {
  let A = mien-elip((-0.4, 0.25), 1.3, 0.85, quay: 30deg)
  let B = mien-tron((0.5, 0.3), 0.9)
  ve-mien(ctx, A)
  ve-mien(ctx, B, mau: purple)
  gach-vung(ctx, giao(A, bu(B)), mau: black, day: 0.4pt, buoc: 4.5pt)
})

== E.9 Venn 3 elip — form hàm tự do (hồi quy form cũ)
#hinh(w: 7.5cm, xmin: -2.2, xmax: 2.2, ymin: -1.6, ymax: 1.6, ctx => {
  let A = mien-elip((-0.55, 0.25), 1.25, 0.8)
  let B = mien-elip((0.55, 0.25), 1.25, 0.8)
  let C = mien-elip((0, -0.45), 1.25, 0.8)
  ve-mien(ctx, A)
  ve-mien(ctx, B)
  ve-mien(ctx, C)
  gach-vung(ctx, P => (
    trong(P, A) and trong(P, B) and not trong(P, C)
  ), mau: black, day: 0.4pt, buoc: 4.5pt)
  nhan(ctx, (-1.55, 0.7), $A$)
  nhan(ctx, (1.55, 0.7), $B$)
  nhan(ctx, (0, -1.28), $C$, huong: "below")
})


// =====================================================================
#phan([F. HỆ TRỤC + LƯỚI + VẠCH CHIA (thu-truc-goc.typ)],
  ngan: [F. Hệ trục])
// =====================================================================

== F.1 `he-truc` gộp (lưới + trục + vạch + số)
#hinh(w: 7cm, xmin: -4, xmax: 4, ymin: -3, ymax: 3, ctx => {
  he-truc(ctx)
  ve-ham(ctx, x => x * x - 2, mau: blue)
})

== F.2 Đồ thị dựng sẵn với `luoi-o` / `vach`
#do-thi-bac-hai(1, -2, -1, luoi-o: true, vach: true,
  giao-ox: none, giao-oy: none)
#do-thi-phan-thuc(2, 1, 1, -1, luoi-o: true, vach: true)
#do-thi-sin(luoi-o: true)


// =====================================================================
#phan([G. HÌNH ĐỀ + HÌNH LỜI GIẢI (thu-fig-giai.typ)],
  ngan: [G. Hình đề—giải])
// =====================================================================

// G.1 Ví dụ — hình đề $y = x^2$ + hình lời giải chấm đỉnh $O$
#vd([Cho đồ thị $y = x^2$ (hình bên). Tìm toạ độ đỉnh.],
  fig: do-thi-ham(x => x * x, w: 4cm,
    xmin: -2, xmax: 2, ymin: -0.5, ymax: 4),
  fig-giai: do-thi-ham(x => x * x, w: 4cm,
    xmin: -2, xmax: 2, ymin: -0.5, ymax: 4, mau: red,
    them: ctx => { giong(ctx, (0, 0), mau-diem: red) }),
  loigiai: [Parabol $y = x^2$ có $a > 0$. \
    Đỉnh là gốc toạ độ $O(0; 0)$ (hình bên).],
  tieu-de: [Ví dụ: hình đề + hình lời giải],
)

// G.2 Trắc nghiệm — 4 phương án là 4 đồ thị khác nhau
#tn([Đồ thị nào dưới đây là đồ thị hàm số $y = x^2$?], (
  [#do-thi-ham(x => x * x * x, w: 3.2cm,
    xmin: -1.6, xmax: 1.6, ymin: -2, ymax: 2)],
  True([#do-thi-ham(x => x * x, w: 3.2cm,
    xmin: -1.6, xmax: 1.6, ymin: -0.4, ymax: 2.4)]),
  [#do-thi-ham(x => -x * x, w: 3.2cm,
    xmin: -1.6, xmax: 1.6, ymin: -2.4, ymax: 0.4)],
  [#do-thi-ham(x => x, w: 3.2cm,
    xmin: -1.6, xmax: 1.6, ymin: -2, ymax: 2)],
), cols: 4,
  loigiai: [Đồ thị hàm bậc hai $y = x^2$ là parabol bề lõm quay lên. \
    Chọn *B*.])

// G.3 Đúng-sai — hình chèn trong TỪNG ý + BBT trong lời giải
#ds([Cho đồ thị hàm số $y = f(x)$ như các hình dưới. Xét tính đúng sai:], (
  True([Hình #box(do-thi-ham(x => x * x, w: 2.6cm,
    xmin: -1.4, xmax: 1.4, ymin: -0.3, ymax: 2)) là parabol.]),
  [Hình #box(do-thi-ham(x => x, w: 2.6cm,
    xmin: -1.4, xmax: 1.4, ymin: -1.6, ymax: 1.6)) là parabol.],
  True([Hàm $y = x^2$ đạt giá trị nhỏ nhất tại $x = 0$.]),
  [Hàm $y = x^2$ nghịch biến trên $RR$.],
),
  fig-giai: bbt-bac-hai(1, 0, 0),
  loigiai: [Từ BBT (hình bên): hàm giảm rồi tăng, cực tiểu tại $x = 0$. \
    a) Đ — b) S — c) Đ — d) S.])

// G.4 Trả lời ngắn — hình lời giải là diện tích 2 đồ thị (bên TRÁI)
#tln([Tính diện tích hình phẳng giới hạn bởi $y = x^2$ và $y = x$ (đơn vị
  diện tích, làm tròn 2 chữ số).],
  [$0,17$],
  fig-giai: dien-tich-2-ham(x => x * x, g: x => x, w: 4.5cm),
  fig-giai-pos: "left",
  loigiai: [Miền tô như hình bên. \
    $S = integral_0^1 (x - x^2) dif x = 1/2 - 1/3 = 1/6 approx 0,17$.])

// G.5 Luyện tập — hình lời giải vẽ parabol $y = x^2 - 2x$
#lt([Vẽ đồ thị hàm số $y = x^2 - 2x$.],
  fig-giai: do-thi-ham(x => x * x - 2 * x, w: 4.5cm,
    xmin: -1, xmax: 3, ymin: -1.5, ymax: 3),
  loigiai: [Đỉnh $I(1; -1)$, cắt $O x$ tại $x = 0, x = 2$ (hình bên).])


// =====================================================================
#phan([H. DẠNG CÂU HĐ / VDTT — GTLN—GTNN (test-hd-vdtt.typ)],
  ngan: [H. HĐ — VDTT])
// =====================================================================

// H.1 Hoạt động: 2 ý hỏi (dùng cot-item để chia trong thân câu)
#hd([Cho hàm số $y = f(x) = x^2 - 2x$ với $x in [0; 3]$, có đồ thị như hình vẽ.
  #cot-item(
    [Giá trị lớn nhất $M$ của hàm số trên đoạn $[0; 3]$ là bao nhiêu?
     Tìm $x_0$ sao cho $f(x_0) = M$.],
    [Giá trị nhỏ nhất $m$ của hàm số trên đoạn $[0; 3]$ là bao nhiêu?
     Tìm $x_0$ sao cho $f(x_0) = m$.],
    so-cot: 1,
  )],
  loi-giai: [
    a) Từ đồ thị: $M = 3$ tại $x_0 = 3$. \
    b) Từ đồ thị: $m = -1$ tại $x_0 = 1$.
  ],
  tieu-de: [HĐ1: Nhận biết GTLN — GTNN],
)

// H.2 Hoạt động thứ hai (kiểm tra bộ đếm HĐ2)
#hd([Xét hàm số $y = f(x) = x^3 - 2x^2 + 1$ trên đoạn $[-1; 2]$.
  Tìm giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn đó.],
  loi-giai: [
    $f'(x) = 3x^2 - 4x = 0 <=> x = 0$ hoặc $x = 4/3$. \
    $f(-1) = -2$; $f(0) = 1$; $f(4/3) = -5/27$; $f(2) = 1$. \
    Vậy $max_([-1; 2]) f(x) = 1$; $min_([-1; 2]) f(x) = -2$.
  ],
  tieu-de: [HĐ2: Các bước tìm GTLN — GTNN trên một đoạn],
)

// H.3 Luyện tập — hàm $y = sqrt(2x - x^2)$
#lt([Tìm giá trị lớn nhất và giá trị nhỏ nhất (nếu có) của hàm số
  $y = sqrt(2x - x^2)$.],
  loi-giai: [
    Tập xác định của hàm số là $[0; 2]$. \
    Với $x in (0; 2)$: $y' = (1 - x)/sqrt(2x - x^2)$; $y' = 0 <=> x = 1$. \
    $y(0) = 0$; $y(1) = 1$; $y(2) = 0$. \
    Vậy $max_([0; 2]) y = y(1) = 1$; $min_([0; 2]) y = y(0) = y(2) = 0$.
  ],
  tieu-de: [Luyện tập 1],
)

// H.4 Luyện tập thứ hai
#lt([Tìm giá trị lớn nhất và giá trị nhỏ nhất của hàm số
  $y = 2x^3 - 3x^2 + 5x + 2$ trên đoạn $[0; 2]$.],
  loi-giai: [
    $y' = 6x^2 - 6x + 5 > 0$ với mọi $x$ (vì $Delta' = 9 - 30 < 0$). \
    Hàm số đồng biến trên $[0; 2]$. \
    Vậy $max_([0; 2]) y = y(2) = 16$; $min_([0; 2]) y = y(0) = 2$.
  ],
  tieu-de: [Luyện tập 2],
)

// H.5 Tự luận xen giữa (kiểm tra không lẫn bộ đếm HĐ)
#tl([Tìm giá trị lớn nhất và giá trị nhỏ nhất của hàm số
  $y = x^4 - 4x^2 + 3$ trên đoạn $[0; 4]$.],
  diem: 1, cho-trong: 2cm,
  loi-giai: [
    $y' = 4x^3 - 8x = 4x(x^2 - 2)$; trên $(0; 4)$: $y' = 0 <=> x = sqrt(2)$. \
    $y(0) = 3$; $y(4) = 195$; $y(sqrt(2)) = -1$. \
    Vậy $max_([0; 4]) y = 195$; $min_([0; 4]) y = -1$.
  ],
  tieu-de: [Tự luận: GTLN — GTNN trên đoạn],
)

// H.6 Vận dụng thực tế — mô hình lây lan virus
#vdtt([Giả sử sự lây lan của một loại virus ở một địa phương được mô hình hoá
  bằng hàm số $N(t) = -t^3 + 12t^2$, $0 <= t <= 12$, trong đó $N$ là số người
  bị nhiễm bệnh (tính bằng trăm người) và $t$ là thời gian (tuần).
  Hãy ước tính số người tối đa bị nhiễm bệnh ở địa phương đó.],
  loi-giai: [
    $N'(t) = -3t^2 + 24t$; $N'(t) = 0 <=> t = 0$ hoặc $t = 8$. \
    $N(0) = 0$; $N(8) = 256$; $N(12) = 0$. \
    Vậy số người nhiễm tối đa khoảng $256$ trăm người, tức $25 600$ người.
  ],
  tieu-de: [Vận dụng: Mô hình lây lan virus],
)

// H.7 Vận dụng — bài toán chiếc hộp cực đại thể tích
#vdtt([Từ một tấm bìa carton hình vuông cạnh $60$ cm, cắt bốn hình vuông bằng
  nhau ở bốn góc rồi gập thành chiếc hộp chữ nhật không nắp. Tính độ dài cạnh
  hình vuông bị cắt sao cho thể tích chiếc hộp là lớn nhất.],
  diem: 1, cho-trong: 3cm,
  loi-giai: [
    Gọi $x$ (cm) là cạnh hình vuông cắt đi, $0 < x < 30$. \
    $V(x) = (60 - 2x)^2 dot x = 4x^3 - 240x^2 + 3600x$. \
    $V'(x) = 12x^2 - 480x + 3600 = 0 <=> x = 10$ (nhận) hoặc $x = 30$ (loại). \
    Vậy cạnh hình vuông phải cắt là $10$ cm ($V_max = 16 000 "cm"^3$).
  ],
  tieu-de: [Vận dụng: Bài toán chiếc hộp],
)


#if ho-so == "beamer" { trang-cam-on() }
