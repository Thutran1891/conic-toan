// Thử PHÓNG TO bảng/biểu đồ ở bản trình chiếu (0.4.2).
// typst compile thu-phong-hinh.typ                      (beamer — mặc định)
// typst compile thu-phong-hinh.typ --input ho-so=loigiai (A4: KHÔNG được đổi)
#import "../baigiang.typ": *
#show math.equation.where(block: false): it => math.display(it)
#let ho-so = sys.inputs.at("ho-so", default: "beamer")
#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron", hien-o: false)
#show: de-toan.with(ho-so: ho-so, tieu-de: [THỬ PHÓNG HÌNH], mon: [TOÁN])

#phan([Trắc nghiệm])
#dat-lai-cau()

// 1. Biểu đồ tần số ghép nhóm đặt giữa đề (đúng ca ảnh 1)
#tn(
  [Cự ly chạy bền của 69 học sinh được cho bởi biểu đồ dưới đây. Mốt của mẫu số liệu bằng bao nhiêu?
  #align(center, bieu-do-tan-so(moc: (9, 11, 13, 15, 17), tan-so: (6, 31, 26, 6),
    ten-x: [Cự ly (trăm mét)], ten-y: [Số học sinh], w: 6cm, h: 4cm))],
  ([13,3], [11,3], True([12,7]), [12]),
)

// 2. Bảng ghép nhóm (ca ảnh 2)
#tn(
  [Dữ liệu chiều cao (cm) của 40 học sinh:
  #align(center)[#bang-ghep-nhom(moc: (150, 152, 154, 156, 158, 160), tan-so: (2, 8, 15, 10, 5), ten-nhom: [Chiều cao], ten-tan-so: [Số học sinh])]
  Giá trị trung vị xấp xỉ bằng],
  ([154,33], True([155,33]), [156,33], [157,33]),
  loigiai: [Cỡ mẫu $n = 40$, vị trí trung vị $n/2 = 20$.],
)

// 3. BBT có kẹp ‖ (ca ảnh 3)
#tn(
  [Cho hàm số $y = f(x)$ có bảng biến thiên như sau. Giá trị cực tiểu bằng
  #align(center, bbt(x: ($-oo$, $-2$, $-1$, $0$, $+oo$), dau: ("", "-", "0", "+", "||", "+", "0", "-", ""),
    gia-tri: ($+oo$, $4$, ($+oo$, $-oo$), $0$, $-oo$), huong: ("xuong", "len", "len", "xuong"), kep: (2,)))],
  ([$-4$], True([$4$]), [$0$], [$-2$]),
)

// 4. Hình đặt ở cột phải (fig:) — phải vừa cột, không tràn
#tn(
  [Biểu đồ quạt bên cạnh cho biết tỉ lệ học sinh theo môn thể thao. Môn nào nhiều nhất?],
  (True([Bóng đá]), [Cầu lông], [Bơi], [Khác]),
  fig: bieu-do-quat(([Bóng đá], 40), ([Cầu lông], 25), ([Bơi], 20), ([Khác], 15)),
)

// 5. Bảng xét dấu + biểu đồ hộp + bảng tần số trong lời giải
#tl(
  [Xét dấu $f(x) = (x - 1)(x + 2)$ và vẽ biểu đồ hộp của mẫu $1, 2, 2, 3, 3, 3, 4, 4, 5$.],
  // ⚠️ Mỗi bảng/biểu đồ một ĐOẠN riêng (dòng trống) để beamer tự ngắt màn
  // được giữa chúng; dính liền trong một đoạn thì cả cụm là MỘT dòng, không cắt nổi.
  loigiai: [
    #align(center, bang-xet-dau(x: ($-oo$, $-2$, $1$, $+oo$), dong: (($f(x)$, ("", "+", "0", "-", "0", "+", "")),)))

    #align(center, bieu-do-hop(du-lieu: (1, 2, 2, 3, 3, 3, 4, 4, 5)))

    #align(center, bang-tan-so(gia-tri: (1, 2, 3, 4, 5), tan-so: (1, 2, 3, 2, 1)))
  ],
)

// 6. Tắt phóng cho phần còn lại (đối chứng)
#phong-hinh(false)
#tn(
  [ĐỐI CHỨNG `phong-hinh(false)` — bảng ghép nhóm giữ cỡ dựng A4:
  #align(center)[#bang-ghep-nhom(moc: (150, 152, 154, 156, 158, 160), tan-so: (2, 8, 15, 10, 5))]],
  ([A], True([B]), [C], [D]),
)
#phong-hinh(auto)
