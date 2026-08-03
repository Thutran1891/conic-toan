// =====================================================================
// thu-chia-cot.typ — FILE THỬ HAI LỆNH BỐ CỤC MỚI (08/2026)
//   #chia-2-cot        : chia phần câu hỏi thành 2 cột ĐỀU nhau
//   #chia-2-cot-lech   : cột trái câu hỏi — cột phải kẻ dòng cho HS làm bài
//   #thoi-cot()        : dấu NGỪNG chia cột (trở lại nguyên khổ giấy)
// ---------------------------------------------------------------------
// Biên dịch:
//   typst compile thu-chia-cot.typ
//   typst compile thu-chia-cot.typ --input ho-so=loigiai thu-chia-cot-lg.pdf
//
// CẦN KIỂM (đối chiếu bản PDF):
//   1. Mục 1 — bốn câu trắc nghiệm xếp thành HAI CỘT ĐỀU nhau, chữ chảy
//      từ cột trái sang cột phải.
//   2. Mục 2 — câu hỏi nằm gọn trong cột trái rộng 70%; cột phải TRỐNG,
//      có hàng kẻ ngang mờ cách nhau 9mm và một vạch dọc mờ ngăn hai cột.
//      Số hàng kẻ phải PHỦ ĐÚNG chiều cao phần câu hỏi (không thừa hàng
//      kẻ chạy xuống dưới, không thiếu ở giữa).
//   3. Mục 3 — đổi rong-trai: 55%, cao-dong: 7mm, có chữ "Bài làm" nhạt
//      ở đầu cột phải ⇒ cột trái HẸP hơn, hàng kẻ DÀY hơn mục 2.
//   4. Mục 4 — ke: false, vach-ngan: false ⇒ cột phải TRẮNG TRƠN.
//   5. Mục 5 — từ dòng #show: chia-2-cot-lech trở xuống MỌI câu đều tự
//      vào bố cục lệch (đây là cách dùng chính); sau #thoi-cot() thì
//      dòng "HẾT" và BẢNG ĐÁP ÁN trở lại nguyên khổ giấy.
//   6. Bảng đáp án cuối bản loigiai phải ĐỦ mọi câu tn/ds/tln, kể cả các
//      câu nằm trong cột.
//   7. Bản beamer (--input ho-so=beamer) BỎ QUA hai lệnh này — mỗi câu
//      vẫn là một slide như cũ, không vỡ bố cục.
// =====================================================================
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron", hien-o: false)

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ BỐ CỤC CHIA CỘT],
  mon: [MÔN TOÁN 12],
  thoi-gian: "45 phút",
  ma-de: "0101",
  hien-ma-de: true,
)

#dat-lai-cau()

// =====================================================================
#phan[MỤC 1a. #chia-2-cot — hai cột đều nhau (dạng khối)]

#chia-2-cot[
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
]

// =====================================================================
#phan[MỤC 1b. #chia-2-cot — hai cột đều nhau (dạng khối)]

#show: chia-2-cot
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
#thoi-cot()



// =====================================================================
#phan[MỤC 2. #chia-2-cot-lech — mặc định (cột trái 70%, kẻ 9mm)]

#chia-2-cot-lech[
  #tl(
    [Cho hàm số $y = x^3 - 3x^2 + 2$. Khảo sát sự biến thiên và vẽ đồ thị
     của hàm số đã cho.],
    loigiai: [Tập xác định $D = RR$. \
      $y' = 3x^2 - 6x = 3x(x - 2)$; $y' = 0 arrow.l.r.double x = 0$ hoặc $x = 2$. \
      Hàm số đồng biến trên $(-oo; 0)$ và $(2; +oo)$, nghịch biến trên $(0; 2)$.],
  )

  #tl(
    [Tính tích phân $I = integral_0^1 (2x + 1) dif x$.],
    loigiai: [$I = (x^2 + x) |_0^1 = 2$.],
  )

  #tl(
    [Trong không gian $O x y z$, viết phương trình mặt phẳng đi qua ba điểm
     $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$.],
    loigiai: [Phương trình đoạn chắn: $x / 1 + y / 2 + z / 3 = 1$,
      hay $6x + 3y + 2z - 6 = 0$.],
  )
]

// =====================================================================
#phan[MỤC 3. Đổi bề rộng cột trái + kẻ dày hơn + tiêu đề cột phải]

#chia-2-cot-lech(rong-trai: 55%, cao-dong: 7mm, tieu-de-phai: [Bài làm])[
  #tl([Giải phương trình $log_2 (x - 1) = 3$.],
    loigiai: [Điều kiện $x > 1$. Phương trình cho $x - 1 = 8$ nên $x = 9$.])

  #tl([Tìm giá trị lớn nhất của hàm số $y = -x^2 + 4x - 1$ trên $RR$.],
    loigiai: [$y = -(x - 2)^2 + 3 <= 3$, dấu bằng khi $x = 2$.])
]

// =====================================================================
#phan[MỤC 4. Cột phải TRẮNG TRƠN (ke: false, vach-ngan: false)]

#chia-2-cot-lech(ke: false, vach-ngan: false)[
  #tl([Cho cấp số cộng $(u_n)$ có $u_1 = 2$ và công sai $d = 3$.
    Tính $u_(10)$ và tổng $S_(10)$.],
    loigiai: [$u_(10) = 2 + 9 dot 3 = 29$; $S_(10) = 10 (2 + 29) / 2 = 155$.])
]

// =====================================================================
#phan[MỤC 5. Dạng SHOW-RULE — áp dụng từ dòng này trở xuống]

#show: chia-2-cot-lech.with(rong-trai: 65%)

#tln([Tính $limits(lim)_(x -> 2) (x^2 - 4) / (x - 2)$.], [4],
  loigiai: [$(x^2 - 4) / (x - 2) = x + 2 arrow.r 4$ khi $x arrow.r 2$.])

#tln([Cho $f(x) = 2x + 1$. Tính $f(3)$.], [7], loigiai: [$f(3) = 7$.])

#ds(
  [Cho hàm số $y = x^3 - 3x$.],
  (
    True([$y' = 3x^2 - 3$], giai: [Áp dụng $(x^n)' = n x^(n-1)$.]),
    True([Hàm số có hai điểm cực trị], giai: [$y' = 0$ có hai nghiệm $x = plus.minus 1$.]),
    [Hàm số đồng biến trên $RR$],
    [Đồ thị hàm số không cắt trục hoành],
  ),
)

// ----- NGỪNG chia cột: phần dưới trở lại nguyên khổ giấy -----
#thoi-cot()

#het(ghi-chu: [Thí sinh không được sử dụng tài liệu.])

#bang-dap-an()
