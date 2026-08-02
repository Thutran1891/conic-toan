// =====================================================================
// thu-hoan-vi.typ — FILE THỬ TÍNH NĂNG HOÁN VỊ (TRỘN ĐỀ)
// ---------------------------------------------------------------------
// Biên dịch để so sánh:
//   typst compile thu-hoan-vi.typ                              thu-goc.pdf
//   typst compile thu-hoan-vi.typ --input tron=1               thu-0101.pdf
//   typst compile thu-hoan-vi.typ --input tron=1 --input ma=0102  thu-0102.pdf
//   typst compile thu-hoan-vi.typ --input tron=1 --input ho-so=loigiai  thu-lg.pdf

// typst compile thu-hoan-vi.typ --input tron=1 --input ma=0101 de-0101.pdf
// typst compile thu-hoan-vi.typ --input tron=1 --input ma=0101 --input ho-so=loigiai dapan-0101.pdf
// typst compile thu-hoan-vi.typ --input tron=1 --input ma=0102 de-0102.pdf
// typst compile thu-hoan-vi.typ --input tron=1 --input ma=0102 --input ho-so=loigiai dapan-0102.pdf

//
// CẦN KIỂM:
//   1. tron=0  -> thứ tự y hệt thứ tự soạn dưới đây (1,2,3,4,5 / a,b,c / ...).
//   2. tron=1  -> câu trong PHẦN I xáo với nhau, PHẦN II xáo với nhau,
//      PHẦN III xáo với nhau; PHẦN IV (tự luận) GIỮ NGUYÊN thứ tự.
//   3. Không câu nào nhảy sang phần khác.
//   4. Phương án A/B/C/D của câu tn đã đổi chỗ; ô tô xanh (bản loigiai) vẫn
//      đúng phương án; ý a/b/c/d của câu đúng-sai GIỮ NGUYÊN thứ tự.
//   5. ma=0101 và ma=0102 cho HAI thứ tự khác nhau.
//   6. Cùng mã đề: bản dethi và bản loigiai TRỘN GIỐNG HỆT NHAU
//      (đọc bảng đáp án cuối bản loigiai, đối chiếu từng câu với bản dethi).
//   7. Câu 5 phần I đặt khoa-pa: true -> phương án LUÔN theo thứ tự soạn.
// =====================================================================
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")
#let hoan-vi = sys.inputs.at("tron", default: "0") == "1"   // <- CÔNG TẮC
#let ma = sys.inputs.at("ma", default: "0101")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron", hien-o: false)

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ HOÁN VỊ — TRỘN ĐỀ],
  mon: [MÔN TOÁN 12],
  thoi-gian: "45 phút",
  ma-de: ma,
  hien-ma-de: true,
  hoan-vi: hoan-vi,   // mam: auto -> tự băm từ ma-de
)

#dat-lai-cau()

// =====================================================================
#phan[PHẦN I. Trắc nghiệm nhiều phương án lựa chọn (5 câu)]

#tn(
  [Đạo hàm của hàm số $y = x^3$ là],
  ([$y' = x^2$], True([$y' = 3x^2$]), [$y' = 3x$], [$y' = x^3 / 3$]),
  loigiai: [$(x^n)' = n x^(n-1)$ nên $y' = 3x^2$.],
)

#tn(
  [Nghiệm của phương trình $2^x = 8$ là],
  ([$x = 2$], [$x = 4$], True([$x = 3$]), [$x = 8$]),
  loigiai: [$2^x = 2^3 arrow.r.double x = 3$.],
)

#tn(
  [Giá trị của $log_2 32$ bằng],
  (True([$5$]), [$4$], [$6$], [$16$]),
  loigiai: [$32 = 2^5$ nên $log_2 32 = 5$.],
)

#tn(
  [Trong không gian $O x y z$, vectơ pháp tuyến của mặt phẳng
   $2x - y + 3z - 1 = 0$ là],
  ([$(2; 1; 3)$], [$(-2; -1; 3)$], True([$(2; -1; 3)$]), [$(1; -1; 3)$]),
  loigiai: [Hệ số của $x, y, z$ chính là toạ độ vectơ pháp tuyến.],
)

#tn(
  [Câu này KHOÁ phương án (khoa-pa) — thứ tự A/B/C/D phải giữ nguyên:
   $integral x dif x$ bằng],
  ([$1$], True([$x^2 / 2 + C$]), [$2x + C$], [$x^2 + C$]),
  khoa-pa: true,
  loigiai: [$integral x dif x = x^2 / 2 + C$.],
)

// =====================================================================
#phan[PHẦN II. Trắc nghiệm đúng — sai (3 câu)]

#ds(
  [Cho hàm số $y = x^3 - 3x$.],
  (
    True([$y' = 3x^2 - 3$], giai: [Áp dụng $(x^n)' = n x^(n-1)$.]),
    True([Hàm số có hai điểm cực trị], giai: [$y' = 0$ có hai nghiệm $x = plus.minus 1$.]),
    [Hàm số đồng biến trên $RR$],
    [Đồ thị hàm số không cắt trục hoành],
  ),
)

#ds(
  [Cho cấp số cộng $(u_n)$ với $u_1 = 2$, công sai $d = 3$.],
  (
    True([$u_2 = 5$]),
    [$u_3 = 9$],
    True([$u_5 = 14$]),
    [Tổng $5$ số hạng đầu bằng $30$],
  ),
)

#ds(
  [Cho hai số thực $a = 2$ và $b = 3$.],
  (
    True([$a + b = 5$]),
    True([$a b = 6$]),
    [$a^b = 9$],
    [$b - a = 2$],
  ),
)

// =====================================================================
#phan[PHẦN III. Trắc nghiệm trả lời ngắn (4 câu)]

#tln([Tính $2 + 3 times 4$.], [$14$], loigiai: [Nhân trước, cộng sau.])

#tln([Tính $log_3 81$.], [$4$], loigiai: [$81 = 3^4$.])

#tln([Cho $f(x) = x^2$. Tính $f'(3)$.], [$6$], loigiai: [$f'(x) = 2x$.])

#tln([Số đường tiệm cận của đồ thị $y = (2x - 1) / (x + 1)$.], [$2$],
  loigiai: [Một tiệm cận đứng $x = -1$, một tiệm cận ngang $y = 2$.])

// =====================================================================
#phan[PHẦN IV. Tự luận (2 câu — PHẢI GIỮ NGUYÊN THỨ TỰ)]

#tl(
  [TỰ LUẬN SỐ MỘT. Giải phương trình $x^2 - 5x + 6 = 0$.],
  loigiai: [$Delta = 1 > 0$ nên phương trình có hai nghiệm $x = 2$ và $x = 3$.],
)

#tl(
  [TỰ LUẬN SỐ HAI. Tính $integral_0^1 x^2 dif x$.],
  loigiai: [$integral_0^1 x^2 dif x = x^3 / 3 bar.v_0^1 = 1/3$.],
)

#het()

#bang-dap-an()
