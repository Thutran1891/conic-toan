// =====================================================================
// thu-bbt-bu-dau.typ — KIỂM TRA: bbt tự bù 2 ô trống hai đầu dãy `dau`
//
// Biên dịch:  typst compile thu-bbt-bu-dau.typ
// Kỳ vọng: 2 trang, các cặp bảng "thiếu" và "đủ" phải GIỐNG HỆT nhau.
// =====================================================================
#import "../baigiang.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(font: ("Charis SIL", "Noto Serif", "Libertinus Serif"), size: 11pt)
#set par(justify: true)

#align(center, text(14pt, weight: "bold")[
  Kiểm tra: bảng biến thiên tự bù ô trống hai đầu dãy `dau`
])

= 1. Đúng ca AI hay viết sai (thiếu CẢ HAI ô trống)

Dãy `dau` chỉ có 5 phần tử trong khi bảng 4 mốc cần 7. Ngoài ra `x`, `gia-tri`
viết bằng chuỗi `"-oo"` và số trần `0`, `-5/3` — cũng được quy về nội dung toán.

*Bản THIẾU (không phải sửa tay):*
#align(center)[
  #bbt(
    x: ("-oo", -3, -1, "+oo"),
    dau: ("+", 0, "-", 0, "+"),
    gia-tri: ("-oo", 5, -5/3, "+oo"),
    huong: ("len", "xuong", "len"),
  )
]

*Bản ĐỦ (viết đúng chuẩn) — phải giống hệt bảng trên:*
#align(center)[
  #bbt(
    x: ($-oo$, $-3$, $-1$, $+oo$),
    dau: ("", "+", "0", "-", "0", "+", ""),
    gia-tri: ($-oo$, $5$, $-5/3$, $+oo$),
    huong: ("len", "xuong", "len"),
  )
]

#pagebreak()

= 2. Thiếu MỘT ô — tự đoán đúng đầu bị thiếu

*Thiếu ô CUỐI:*
#align(center)[
  #bbt(
    x: ($-oo$, $0$, $2$, $+oo$),
    dau: ("", "-", "0", "+", "0", "-"),
    gia-tri: ($+oo$, $1$, $5$, $-oo$),
    huong: ("xuong", "len", "xuong"),
  )
]

*Thiếu ô ĐẦU:*
#align(center)[
  #bbt(
    x: ($-oo$, $0$, $2$, $+oo$),
    dau: ("-", "0", "+", "0", "-", ""),
    gia-tri: ($+oo$, $1$, $5$, $-oo$),
    huong: ("xuong", "len", "xuong"),
  )
]

= 3. Bảng có kẹp ‖ (tiệm cận đứng) — thiếu hai đầu

#align(center)[
  #bbt(
    x: ($-oo$, $1$, $+oo$),
    dau: ("+", "||", "+"),
    gia-tri: ($1$, ($+oo$, $-oo$), $1$),
    huong: ("len", "len"),
    kep: (1,),
  )
]

= 4. Bảng xét dấu — mỗi dòng cũng tự bù

#align(center)[
  #bang-xet-dau(
    x: ($-oo$, $-2$, $3$, $+oo$),
    dong: (
      ($x + 2$, ("-", "0", "+", "+", "+")),
      ($x - 3$, ("", "-", "-", "-", "0", "+", "")),
      ($f(x)$, ("+", 0, "-", 0, "+")),
    ),
  )
]

= 5. Dãy dấu ĐÚNG sẵn — không đụng tới (hồi quy)

#align(center)[
  #bbt(
    x: ($-oo$, $-1$, $1$, $+oo$),
    dau: ("", "-", "0", "+", "0", "-", ""),
    gia-tri: ($+oo$, $-2$, $2$, $-oo$),
    huong: ("xuong", "len", "xuong"),
  )
]

#v(1em)
Các bảng dựng sẵn theo hệ số vẫn phải chạy y như cũ:
#align(center)[#bbt-bac-ba(1, 0, -3, 1)]
