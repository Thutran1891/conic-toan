// =====================================================================
// thu-bbt-dep.typ — KIỂM TRA: mũi tên thẳng hàng với chữ số + vạch ‖ kẻ kín ô
//
//   typst compile thu-bbt-dep.typ
//
// Cần nhìn kỹ trên PDF:
//   1. Đầu mút mũi tên có ngắm ĐÚNG TIM chữ số ở hai mốc kề không
//      (đặc biệt các số nằm ở ĐÁY ô — chỗ trước đây lệch nhiều nhất).
//   2. Vạch ‖ có kẻ KÍN từ mép trên tới mép dưới ô không (cả dòng y' lẫn
//      dòng y), không còn hở hai đầu.
//   3. Hai mũi tên cùng chiều nối tiếp qua một mốc có nằm trên MỘT ĐƯỜNG không.
// =====================================================================
#import "../baigiang.typ": *

#set page(paper: "a4", margin: 1.6cm)
#set text(size: 11pt)

= Kiểm tra bảng biến thiên

== 1. Hàm phân thức — vạch ‖ tại tiệm cận đứng

#bbt(
  x: ($-oo$, $-1$, $+oo$),
  dau: ("", $-$, "||", $-$, ""),
  gia-tri: ($2$, ($-oo$, $+oo$), $2$),
  huong: ("xuong", "xuong"),
  kep: (1,),
  ten-f: $y$, ten-fp: $y'$,
)

== 2. Hai điểm cực trị + tiệm cận đứng (ca ảnh chụp)

#bbt(
  x: ($-oo$, $-1 - sqrt(5)$, $-1$, $-1 + sqrt(5)$, $+oo$),
  dau: ("", $+$, $0$, $-$, "||", $-$, $0$, $+$, ""),
  gia-tri: ($-oo$, $-4 - 2 sqrt(5)$, ($-oo$, $+oo$), $-4 + 2 sqrt(5)$, $+oo$),
  huong: ("len", "xuong", "xuong", "len"),
  kep: (2,),
  ten-f: $y$, ten-fp: $y'$,
)

== 3. Bốn mốc, có ‖ ở giữa

#bbt(
  x: ($-oo$, $0$, $1$, $2$, $+oo$),
  dau: ("", $-$, $0$, $+$, "||", $+$, $0$, $-$, ""),
  gia-tri: ($+oo$, $1$, ($+oo$, $-oo$), $-3$, $-oo$),
  huong: ("xuong", "len", "len", "xuong"),
  kep: (2,),
  ten-f: $y$, ten-fp: $y'$,
)

#pagebreak()

== 4. Hai mũi tên CÙNG CHIỀU nối tiếp (số ở đỉnh ô bên trái)

Mốc $x = 0$: mũi tên trước kết thúc ở số $1$, mũi tên sau xuất phát từ ĐÁY ô
(quy ước sách) — đây là ca cố ý KHÔNG cho hai mũi tên thẳng hàng.

#bbt(
  x: ($-oo$, $0$, $2$, $5$, $+oo$),
  dau: ("", $+$, $0$, $+$, $0$, $-$, $0$, $+$, ""),
  gia-tri: ($-oo$, $1$, $3$, $-4$, $+oo$),
  huong: ("len", "len", "xuong", "len"),
  ten-f: $y$, ten-fp: $y'$,
)

== 5. Nửa ô — hai mũi tên cùng chiều PHẢI thẳng hàng qua giá trị giữa ô

#bbt(
  x: ($-oo$, $1$, $+oo$),
  dau: ("", $+$, $0$, $+$, ""),
  gia-tri: ($-oo$, $2$, $+oo$),
  huong: ("len-duoi", "len-tren"),
  ten-f: $y$, ten-fp: $y'$,
)

== 6. Vùng gạch (hàm không xác định) + ‖ hai bên

#bbt(
  x: ($-oo$, $-2$, $2$, $+oo$),
  dau: ("", $+$, "||", "", "||", $-$, ""),
  gia-tri: ($-oo$, $0$, $0$, $-oo$),
  huong: ("len", "ngang", "xuong"),
  gach: (1,),
  ten-f: $f(x)$, ten-fp: $f'(x)$,
)

== 7. Bảng xét dấu — vạch ‖ kẻ kín ô

#bang-xet-dau(
  x: ($-oo$, $-2$, $1$, $3$, $+oo$),
  dong: (
    ($x + 2$, ("", $-$, $0$, $+$, "", $+$, "", $+$, "")),
    ($x - 1$, ("", $-$, "", $-$, $0$, $+$, "", $+$, "")),
    ($f(x)$, ("", $+$, $0$, $-$, "||", $+$, $0$, $-$, "")),
  ),
)

== 8. Hồi quy — các bảng dựng sẵn (form hệ số)

#bbt-bac-ba(1, 0, -3, 1)

#bbt-phan-thuc(1, 2, 1, -1)

#bbt-huu-ti(1, -2, 2, 1, 1)
