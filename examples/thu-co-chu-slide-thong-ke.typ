// Hồi quy 0.4.2 — cỡ chữ riêng từng slide và cỡ chữ thống kê theo hồ sơ.
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ CỠ CHỮ SLIDE VÀ THỐNG KÊ],
  thong-tin-hs: false,
)

#slide(tieu-de: [Mặc định theo hồ sơ])[
  Chữ thân và chữ bảng/biểu đồ phải cùng tăng khi trình chiếu.

  #align(center, bang-ghep-nhom(
    moc: (40, 45, 50, 55, 60),
    tan-so: (5, 12, 15, 8),
    ten-nhom: [Năng suất],
    ten-tan-so: [Số địa phương],
  ))

  #align(center, bieu-do-tan-so(
    moc: (2, 4, 6, 8, 10),
    tan-so: (5, 10, 10, 5),
    ten-x: [Điểm số],
    w: 7.5cm,
    h: 4.5cm,
  ))
]

#slide(tieu-de: [Ghi đè cỡ chữ thân], co-chu: 16pt)[
  Dòng này phải nhỏ hơn slide mặc định trong beamer.

  #align(center, bang-ghep-nhom(
    moc: (40, 45, 50, 55, 60),
    tan-so: (5, 12, 15, 8),
    ten-nhom: [Năng suất],
    ten-tan-so: [Số địa phương],
  ))
]

#slide(tieu-de: [Ghi đè bảng và biểu đồ])[
  `co-chu` truyền trực tiếp vẫn thắng mặc định tương đối.

  #align(center, bang-ghep-nhom(
    moc: (40, 45, 50, 55, 60),
    tan-so: (5, 12, 15, 8),
    ten-nhom: [Năng suất],
    ten-tan-so: [Số địa phương],
    co-chu: 12pt,
  ))

  #align(center, bieu-do-tan-so(
    moc: (2, 4, 6, 8, 10),
    tan-so: (5, 10, 10, 5),
    ten-x: [Điểm số],
    w: 7.5cm,
    h: 4.5cm,
    co-chu: 12pt,
  ))
]

#slide(tieu-de: [Các biểu đồ thống kê khác])[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    align(center, da-giac-tan-so(
      moc: (0, 2, 4, 6, 8), tan-so: (3, 7, 5, 2),
      w: 6.5cm, h: 4cm,
    )),
    align(center, bieu-do-cot(
      gia-tri: ([A], [B], [C]), tan-so: (4, 9, 6),
      w: 6.5cm, h: 4cm,
    )),
    align(center, bieu-do-hop(
      tom-tat: (2, 4, 6, 8, 10), w: 6.5cm, h: 3.5cm,
    )),
    align(center, bieu-do-quat(
      ([Đi bộ], 25), ([Xe đạp], 35), ([Khác], 40), w: 5.5cm,
    )),
  )
]

// Đúng đường đi của ảnh lỗi: nội dung thống kê nằm trong câu hỏi, `de-toan`
// tự bọc thành slide ở hồ sơ beamer.
#tn([
  Điểm khảo sát chất lượng của 30 học sinh được thống kê bằng biểu đồ:
  #align(center, bieu-do-tan-so(
    moc: (2, 4, 6, 8, 10), tan-so: (5, 10, 10, 5),
    ten-x: [Điểm số], w: 7.5cm, h: 4.5cm,
  ))
  Hỏi điểm trung bình của các học sinh là bao nhiêu?
], ([5], [6], [7], [8]), dap-an: "B")

#tn([
  Từ bảng số liệu thống kê năng suất lúa ở các địa phương:
  #align(center, bang-ghep-nhom(
    moc: (40, 45, 50, 55, 60), tan-so: (5, 12, 15, 8),
    ten-nhom: [Năng suất], ten-tan-so: [Số địa phương],
  ))
  Tổng tần số của các nhóm đứng trước nhóm chứa trung vị là
], ([5], [17], [32], [40]), dap-an: "B")
