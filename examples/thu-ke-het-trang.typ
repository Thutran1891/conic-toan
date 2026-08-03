// =====================================================================
// thu-ke-het-trang.typ — FILE THỬ LỆNH #ke-het-trang (08/2026)
// ---------------------------------------------------------------------
//   typst compile thu-ke-het-trang.typ
//
// CẦN KIỂM:
//   0. TỔNG CỘNG ĐÚNG 4 TRANG. Ra 8 trang là số dòng bị tính thừa gấp đôi
//      (lỗi cũ: dựng dòng kẻ bằng v() + line() nên dính khoảng cách đoạn).
//   1. Trang 1 — sau câu tự luận, dòng kẻ CHẤM tự chạy xuống đúng đáy vùng
//      chữ (không tràn sang trang 2, không hụt lưng chừng).
//   2. Trang 2 — kẻ NÉT LIỀN cách 7mm, chừa 3cm trắng ở cuối trang.
//   3. Trang 3 — them-trang: 1 ⇒ kẻ hết trang 3 RỒI sang trang 4 kẻ TRỌN
//      một trang nữa, dòng kẻ chỉ dài NỬA bề ngang, nét đứt.
//   4. Đo thử bằng thước trên bản in: khoảng cách hai dòng kẻ mục 1 đúng 9mm,
//      mục 2 đúng 7mm.
// =====================================================================
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ KẺ DÒNG LẤP ĐẦY TRANG],
  mon: [MÔN TOÁN 12],
  thoi-gian: "45 phút",
)

#dat-lai-cau()

#phan[MỤC 1. Mặc định — nét chấm, cách 9mm]

#tl([Cho hàm số $y = x^3 - 3x^2 + 2$. Khảo sát sự biến thiên và vẽ đồ thị
  của hàm số đã cho.])

#ke-het-trang(mau: black)

#pagebreak()
#phan[MỤC 2. Nét liền, cách 7mm, chừa 3cm cuối trang]

#tl([Tính tích phân $I = integral_0^1 (2x + 1) dif x$.])

#ke-het-trang(cao-dong: 7mm, kieu: none, mau: luma(50%), chua: 3cm)

#pagebreak()
#phan[MỤC 3. Kẻ nửa bề ngang + thêm TRỌN một trang nữa]

#tl([Trong không gian $O x y z$, viết phương trình mặt phẳng đi qua ba điểm
  $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$.])

#ke-het-trang(dai: 50%, kieu: "dashed", them-trang: 1)

#het()
