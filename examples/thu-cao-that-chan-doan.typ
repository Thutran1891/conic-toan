// =====================================================================
// thu-cao-that-chan-doan.typ — IN RA SỐ ĐO để kiểm chứng cơ chế cao-that
//   typst compile thu-cao-that-chan-doan.typ
//
// FILE NÀY TỰ CHỨA — KHÔNG import baigiang.typ, không phụ thuộc lib. Nhờ vậy
// nó kiểm được CÔNG THỨC, kể cả khi bản lib trên máy chưa nạp lại.
//
// Dòng dưới CỐ Ý bật `math.display` cho công thức trong dòng — kiểu
// \displaystyle của LaTeX, làm phân số to đẹp. Đây là cách người dùng hay
// viết, và cũng là thứ làm dính chữ nặng nhất. Bỏ dòng đó ra để so.
//
// BỐN ĐẠI LƯỢNG (đo bằng phép đo CẢ DÒNG nên đáng tin, không phụ thuộc vào
// việc Typst tính khung công thức thế nào):
//   khung = chiều cao khung của riêng công thức (measure thường),
//   dư    = NÉT VẼ mà công thức thêm vào dòng   (chỗ ink CẦN),
//   hộp   = KHUNG mà Typst nới thêm cho dòng    (chỗ Typst CHO),
//   thiếu = dư − hộp                            (phần TRÀN ra ngoài, gây dính).
//
// ĐIỀU PHẢI THẤY (nếu chẩn đoán đúng):
//   • "abc", "gọpy", "$0,5$", "$x_(n+1)^2$" : thiếu ≈ 0 (xanh) ⇒ chữ thường và
//     công thức thấp KHÔNG bị nới ⇒ bài cũ không đổi bố cục vì cớ này.
//   • "$1/2$", "$11pi/3$", "$sqrt(3/2)$"    : thiếu vài pt (đỏ) ⇒ đúng chỗ dính.
// Nếu cột `thiếu` XANH HẾT ở mọi dòng thì chẩn đoán sai — báo lại, đừng chạy
// tiếp `thu-cao-that.typ`.
// =====================================================================

#show math.equation.where(block: false): it => math.display(it)

#set page(paper: "a4", margin: 1.8cm)
#set text(font: ("Charis SIL", "Noto Serif", "Libertinus Serif"), size: 11pt, lang: "vi")

// ---------- BẢN SAO CỦA CƠ CHẾ (để file tự chứa) ----------
#let mau-chu = [Ág]

#let cao-ink(nd) = measure({
  set text(top-edge: "bounds", bottom-edge: "bounds")
  nd
}).height

#let thieu-cua(nd) = {
  let ca = [#mau-chu#nd]
  let du = cao-ink(ca) - cao-ink(mau-chu)
  let hop = measure(ca).height - measure(mau-chu).height
  calc.max(0pt, du - hop)
}

#let chong(nd) = context {
  let thieu = thieu-cua(nd)
  if (thieu <= 1pt) { nd } else {
    box(width: 0pt, height: measure(nd).height + thieu, baseline: thieu * 0.5)
    nd
  }
}

#let voi-chong(body) = {
  show math.equation.where(block: false): chong
  body
}

// ---------- BẢNG SỐ ----------
#align(center, text(size: 15pt, weight: "bold")[
  CHẨN ĐOÁN: CHỖ TYPST CHO so với CHỖ NÉT VẼ CẦN
])
#v(6pt)

// Cột "Mã" để dạng CHUỖI rồi in bằng `raw` — viết trong móc vuông thì `_` và
// `*` của markup sẽ mở chữ nghiêng/đậm và báo "unclosed delimiter".
#let mau-thu = (
  ([chữ thường], "abc", [abc]),
  ([chữ có nét thò xuống], "gọpy", [gọpy]),
  ([số thập phân], "$0,5$", $0,5$),
  ([chỉ số trên/dưới], "$x_(n+1)^2$", $x_(n+1)^2$),
  ([phân số đơn], "$1/2$", $1/2$),
  ([phân số có pi], "$11pi/3$", $11pi/3$),
  ([phân số âm], "$-13pi/6$", $-13pi/6$),
  ([căn thức], "$sqrt(3/2)$", $sqrt(3/2)$),
  ([căn hai tầng], "$sqrt(1+sqrt(2))$", $sqrt(1 + sqrt(2))$),
  ([phân số lồng], "$(a/b)/(c/d)$", $(a/b)/(c/d)$),
  // Ca THẬT trong bài của cô: ngoặc TỰ GIÃN bao quanh phân số — cao hơn cả
  // phân số trần, nên đây mới là ca nặng nhất.
  ([ngoặc giãn ôm phân số], "$sin(77pi/15)$", $sin(77pi/15)$),
  ([ngoặc giãn, số âm], "$cot(-83pi/18)$", $cot(-83pi/18)$),
)

#context {
  let ink0 = cao-ink(mau-chu)
  let hop0 = measure(mau-chu).height
  let so(v) = [#calc.round(v.pt(), digits: 2)]
  let dong(m) = {
    let nd = m.at(2)
    let ca = [#mau-chu#nd]
    let du = cao-ink(ca) - ink0
    let hop = measure(ca).height - hop0
    let thieu = calc.max(0pt, du - hop)
    let do-mau = thieu > 1pt
    (
      m.at(0),
      raw(m.at(1)),
      so(measure(nd).height),
      so(du),
      so(hop),
      text(fill: if do-mau { red } else { rgb("#1a7f37") },
        weight: if do-mau { "bold" } else { "regular" }, so(thieu)),
    )
  }
  table(
    columns: 6,
    align: (left, left, right, right, right, right),
    inset: (x: 8pt, y: 5pt),
    stroke: 0.5pt + luma(60%),
    table.header([*Trường hợp*], [*Mã*], [*khung*], [*dư*], [*hộp*], [*thiếu*]),
    ..mau-thu.map(dong).flatten(),
  )
  v(4pt)
  text(size: 9.5pt, style: "italic")[
    Đơn vị: pt, đo ở cỡ chữ 11pt. Mốc chữ thường "Ág": nét vẽ #so(ink0), khung
    #so(hop0) — chênh #so(ink0 - hop0), tức CHỮ THƯỜNG CŨNG TRÀN mà không ai
    kêu, vì `leading` đã chừa sẵn chỗ đó. Vì vậy mốc so sánh phải là chữ
    thường, không phải khung.
  ]
}

#v(12pt)
#line(length: 100%, stroke: 0.6pt + luma(50%))
#v(8pt)

// ---------- CA THẬT 1: Ô CỦA LƯỚI ----------
#align(center, text(size: 13pt, weight: "bold")[
  CA THẬT 1 — Ô CỦA LƯỚI (phương án trắc nghiệm, cot-item)
])
#v(2pt)

Đây mới là chỗ cô than phiền nhất: trong ô của `grid` không có `leading` để
nuốt phần tràn, nên phân số đè thẳng sang hàng trên.

#v(6pt)
#let o-thu = (
  [$-750degree$.], [$17pi/4$.], [$11pi/3$.], [$13pi/6$.],
  [$-11pi/4$.], [$sqrt(3/2)$.], [$19pi/12$.], [$-3pi/8$.],
)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  [
    #text(weight: "bold")[TẮT — lối cũ] \
    #v(3pt)
    #grid(columns: (1fr, 1fr), row-gutter: 8pt, column-gutter: 10pt, ..o-thu)
  ],
  [
    #text(weight: "bold")[BẬT — có cột chống] \
    #v(3pt)
    #voi-chong[
      #grid(columns: (1fr, 1fr), row-gutter: 8pt, column-gutter: 10pt, ..o-thu)
    ]
  ],
)

#v(12pt)

// ---------- CA THẬT 2: DÒNG NỐI TRONG MỘT ĐOẠN ----------
#align(center, text(size: 13pt, weight: "bold")[
  CA THẬT 2 — DÒNG NỐI TRONG MỘT ĐOẠN
])
#v(6pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 12pt,
  align: left + top,
  [
    *Chữ thường* \
    Dòng thứ nhất ở đây. \
    Dòng thứ hai ở đây. \
    Dòng thứ ba ở đây. \
    Dòng thứ tư ở đây.
  ],
  [
    *Có phân số — TẮT* \
    Giá trị $11pi/3$ ở đây. \
    Giá trị $17pi/4$ ở đây. \
    Giá trị $13pi/6$ ở đây. \
    Giá trị $sqrt(3/2)$ ở đây.
  ],
  [
    *Có phân số — BẬT* \
    #voi-chong[
      Giá trị $11pi/3$ ở đây. \
      Giá trị $17pi/4$ ở đây. \
      Giá trị $13pi/6$ ở đây. \
      Giá trị $sqrt(3/2)$ ở đây.
    ]
  ],
)

#v(12pt)

// ---------- CA THẬT 3: ĐÚNG CA TRONG BÀI CỦA CÔ ----------
#align(center, text(size: 13pt, weight: "bold")[
  CA THẬT 3 — Ý a) b) c) NỐI BẰNG `\` TRONG MỘT CÂU TỰ LUẬN
])
#v(6pt)

#let ba-y = [
  a) $sin(77pi/15)$; \
  b) $cos(115pi/12)$; \
  c) $cot(-83pi/18)$;
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  [
    #text(weight: "bold")[TẮT — lối cũ, gian-dong: 1] \
    #v(3pt)
    #ba-y
  ],
  [
    #text(weight: "bold")[BẬT — cột chống, gian-dong: 1] \
    #v(3pt)
    #voi-chong[#ba-y]
  ],
)

#v(12pt)

// ---------- CA THẬT 4: SỐ ĐO NHÌN TỪ BÊN TRONG SHOW-RULE ----------
// PHÉP THỬ QUYẾT ĐỊNH. Bảng trên đo trong `context` THƯỜNG. Dưới đây đo ngay
// BÊN TRONG show-rule — đúng chỗ cơ chế thật chạy. Nếu hai số KHÁC NHAU thì
// nghĩa là khi đo từ trong show-rule, Typst chưa áp `math.display`, nên cột
// chống bị đặt HỤT. Đó chính là lý do file đề thật vẫn hơi dính.
#align(center, text(size: 13pt, weight: "bold")[
  CA THẬT 4 — SỐ TRONG SHOW-RULE CÓ KHỚP SỐ TRONG BẢNG KHÔNG?
])
#v(6pt)

#let chong-hien(nd) = context {
  let t = thieu-cua(nd)
  nd
  text(size: 7pt, fill: red, weight: "bold")[ (#calc.round(t.pt(), digits: 2))]
}

#[
  #show math.equation.where(block: false): chong-hien
  Số đỏ sau mỗi công thức là `thiếu` mà show-rule đo được:
  $sin(77pi/15)$, $cos(115pi/12)$, $1/2$, $11pi/3$, $sqrt(3/2)$, $0,5$.
]

#v(4pt)
#text(size: 9.5pt, style: "italic")[
  So với bảng đầu trang: `$1/2$` phải ra 4.66 · `$11pi/3$` 4.33 ·
  `$sqrt(3/2)$` 4.66 · `$0,5$` 0. KHỚP ⇒ cơ chế đo đúng, chỉ cần nới thêm bằng
  `#raw("#cao-that(them: 1.5pt)")`. LỆCH (số đỏ nhỏ hơn hẳn) ⇒ đúng như nghi
  ngờ: trong show-rule chưa thấy `math.display`, phải sửa lib theo hướng khác.
]

#v(10pt)
#text(size: 9.5pt)[
  Cột "BẬT" phải hết đè nhau mà KHÔNG giãn quá tay. Nếu vẫn thấy thưa bất
  thường thì báo lại kèm bảng số ở trên — chỉnh hệ số chia (đang 0.5) hoặc
  ngưỡng (đang 1pt) là xong, khỏi phải mò.
]
