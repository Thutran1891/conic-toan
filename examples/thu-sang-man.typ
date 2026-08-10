// =====================================================================
// thu-sang-man.typ — HỒI QUY 2 BỆNH CỦA BẢN TRÌNH CHIẾU (10/08/2026)
//   A. #sang-man dính cuối dòng chữ  -> TRƯỚC ĐÂY MẤT nguyên đoạn chữ đó
//   B. lời giải cao hơn thân slide   -> TRƯỚC ĐÂY đề bài bị in LẶP LẠI
//                                       xen giữa các trang lời giải
// Xem mục "BEAMER — ĐỀ LẶP LẠI & MẤT ĐOẠN" trong CLAUDE.md.
//
//   typst compile thu-sang-man.typ                      (trình chiếu 16:9)
//   typst compile thu-sang-man.typ --input ho-so=loigiai   (A4 có lời giải)
//
// CÁCH SOI:
//   Ca A/B — mọi dòng đánh số A1..A4, B1..B4 PHẢI có mặt (B2 là dòng từng mất).
//   Ca C   — không trang nào được hiện lại thẻ "Câu 3" sau khi đã sang trang
//            lời giải; phần dư tự nhảy sang slide "Hướng dẫn giải (tiếp)".
//   Ca D   — đề dài choán gần hết slide: slide đầu CHỈ có đề, slide sau mang
//            nhãn "Hướng dẫn giải." (KHÔNG phải "(tiếp)").
// =====================================================================
#import "../baigiang.typ": *
#show math.equation.where(block: false): it => math.display(it)
#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "khong-to", hien-o: false)

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ NGẮT MÀN LỜI GIẢI],
  tieu-de-ngan: [Thử ngắt màn],
  mon: [TOÁN — LỚP 12],
)

#phan([PHẦN IV. Tự luận], ngan: [Phần IV])

// ---------- Ca A: #sang-man có \ đứng ngay trước (cách viết chuẩn) ----------
#tl([Ca A — dấu `#sang-man` đứng sau một dòng đã có `\`.],
  loi-giai: [
    A1 dòng một. \
    A2 dòng hai. \
    #sang-man \
    A3 màn hai. \
    A4 màn hai.
  ])

// ---------- Ca B: #sang-man dính ngay sau dòng chữ (thiếu \) ----------
// Đây là cách cô hay gõ; trước đây cả dòng B2 bị coi là "dấu ngắt" rồi VỨT ĐI.
#tl([Ca B — dấu `#sang-man` dính ngay dưới dòng chữ không có `\`.],
  loi-giai: [
    B1 dòng một. \
    B2 dòng hai — DÒNG NÀY TỪNG BỊ MẤT.
#sang-man \
    B3 màn hai. \
    B4 màn hai.
  ])

// ---------- Ca C: lời giải dài, KHÔNG có dấu ngắt nào ----------
// Thư viện phải tự đo rồi tự cắt; không được để đề bài in lại giữa lời giải.
#tl([Ca C — lời giải rất dài mà người soạn quên chèn `#sang-man`.],
  loi-giai: [
    C1. Tập xác định $D = RR without {0}$. \
    C2. Đạo hàm $y' = (2x^2 - 3)/(x^2)$. \
    C3. Cho $y' = 0 <=> x = plus.minus sqrt(3/2)$. \
    C4. Giới hạn $limits(lim)_(x -> 0^+) y = +oo$, $limits(lim)_(x -> 0^-) y = -oo$. \
    C5. Tiệm cận đứng $x = 0$; tiệm cận xiên $y = 2x$. \
    C6. Bảng biến thiên có hai nhánh, cực đại tại $x = -sqrt(3/2)$. \
    C7. Cực tiểu tại $x = sqrt(3/2)$, giá trị $y = 2 sqrt(6)$. \
    C8. Hàm số đồng biến trên $(-oo; -sqrt(3/2))$ và $(sqrt(3/2); +oo)$. \
    C9. Hàm số nghịch biến trên $(-sqrt(3/2); 0)$ và $(0; sqrt(3/2))$. \
    C10. Đồ thị nhận gốc toạ độ làm tâm đối xứng. \
    C11. Giao với trục hoành tại $x = plus.minus sqrt(3/2) dot 1$. \
    C12. Vẽ hai nhánh đối xứng qua $O$. \
    C13. Kết luận: đồ thị có đúng hai điểm cực trị.
  ])

// ---------- Ca D: đề bài dài choán gần hết slide ----------
#tl([Ca D — đề bài rất dài, chiếm gần hết chiều cao slide.
  Một chất điểm chuyển động theo phương trình
  $ s(t) = t^4/4 - 2t^3 + (11 t^2)/2 - 6t + 20, quad t >= 0, $
  trong đó $s$ tính bằng mét và $t$ tính bằng giây.

  a) Tính vận tốc tức thời $v(t)$ và gia tốc tức thời $a(t)$ của chất điểm.

  b) Tìm các khoảng thời gian chất điểm chuyển động theo chiều dương của trục
  toạ độ và các khoảng thời gian chất điểm chuyển động theo chiều âm.

  c) Xác định thời điểm chất điểm đổi chiều chuyển động lần thứ hai, đồng thời
  tính quãng đường chất điểm đi được trong $4$ giây đầu tiên.

  d) Nêu ý nghĩa vật lí của dấu của $a(t)$ trên từng khoảng vừa tìm được.],
  loi-giai: [
    D1. $v(t) = s'(t) = t^3 - 6t^2 + 11t - 6$. \
    D2. $a(t) = v'(t) = 3t^2 - 12t + 11$. \
    D3. $v(t) = 0 <=> t = 1, t = 2, t = 3$. \
    D4. Chất điểm đổi chiều lần thứ hai tại $t = 2$ giây. \
    D5. Quãng đường trong $4$ giây đầu tính bằng tổng các đoạn đơn điệu.
  ])
