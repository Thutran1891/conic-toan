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

#tl([Một thư viện có 4 quyển sách Toán, 3 quyển sách Vật lý và 2 quyển sách Hóa học (các quyển sách đều khác nhau).\
a) Một học sinh muốn mượn đúng 1 quyển sách để đọc. Có bao nhiêu cách chọn?\
b) Một học sinh muốn mượn 1 quyển Toán, 1 quyển Vật lý và 1 quyển Hóa học. Có bao nhiêu cách chọn?\
c) Một học sinh muốn mượn 2 quyển sách thuộc 2 môn khác nhau. Có bao nhiêu cách chọn?], 
loi-giai: [
  a) Mượn 1 quyển sách tức là chọn Toán (4 cách) HOẶC Lý (3 cách) HOẶC Hoá (2 cách). Theo quy tắc cộng: $4 + 3 + 2 = 9$ cách.\
  
  b) Mượn 3 quyển khác môn tức là phải thực hiện 3 công đoạn chọn. Theo quy tắc nhân: $4 times 3 times 2 = 24$ cách.\
  
  c) Phối hợp 2 quy tắc, ta chia 3 trường hợp:
  - TH1: Toán và Lý. Có $4 times 3 = 12$ cách.
  - TH2: Toán và Hóa. Có $4 times 2 = 8$ cách.
  - TH3: Lý và Hóa. Có $3 times 2 = 6$ cách.
  Tổng cộng có: $12 + 8 + 6 = 26$ cách.
],
cho-trong: 5cm
)
  


#tl([Cho hàm số $y = x^3 - 3x^2 + 2$. Khảo sát sự biến thiên và vẽ đồ thị của hàm số đã cho.])

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
