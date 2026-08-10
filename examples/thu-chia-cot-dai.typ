// =====================================================================
// thu-chia-cot-dai.typ — THỬ #chia-2-cot với phần câu hỏi DÀI NHIỀU TRANG
//
// `thu-chia-cot.typ` chỉ có các vùng NGẮN (gọn trong một trang). File này lo
// nốt phần khó: vùng chia cột chạy qua vài trang, lúc đó việc cân cột chỉ làm ở
// TRANG CUỐI (các trang trước để Typst tự rót cho chặt). Ba chỗ dễ vỡ:
//
//   1. Thân gõ bằng #for — Typst gói tất cả vào MỘT phần tử, phải trải phẳng
//      mới có mối chèn #colbreak().
//   2. HAI vùng chia cột trong cùng một đề — mốc dò trang của vùng này không
//      được lẫn sang vùng kia (mỗi lần gọi mang một số thứ tự riêng).
//   3. Cân xong mà Typst phải dựng lại quá 5 lượt thì dòng "(Đề thi có N
//      trang)" ở đầu đề kẹt số cũ ⇒ biên dịch file này KHÔNG được có cảnh báo
//      "document did not converge".
//
// Biên dịch: typst compile thu-chia-cot-dai.typ
// Mốc: 6 trang, 0 lỗi, 0 cảnh báo.
// =====================================================================
#import "../baigiang.typ": *

#show: de-toan.with(
  ho-so: "dethi",
  tieu-de: [THỬ CHIA CỘT — PHẦN CÂU HỎI DÀI],
  mon: [MÔN TOÁN 12],
  thoi-gian: "90 phút",
  ma-de: "0101",
)

// Một lô câu hỏi sinh bằng #for, cứ 4 câu lại có một câu dài hơn cho lệch nhau.
#let bo(tu, den) = {
  for i in range(tu, den) [
    #tn(
      [Câu #(i + 1): giải phương trình $x^2 - #(i + 1) x + #(i) = 0$
       #if calc.rem(i, 4) == 0 [ (thêm phần dài: cho hàm số
       $y = x^3 - 3x^2 + #(i + 1)$, xét tính đơn điệu rồi kết luận) ]],
      ([$x = 1$], True([$x = #(i + 1)$]), [$x = 0$], [$x = -1$]),
    )
  ]
}

// ----- Vùng 1: dạng KHỐI, hai cột, dài hơn một trang -----
#phan([PHẦN I. Dạng khối — hai cột])
#chia-2-cot(bo(0, 22))

// ----- Vùng 2: dạng SHOW-RULE, hai cột, dài hơn một trang -----
#phan([PHẦN II. Dạng show-rule — hai cột])
#show: chia-2-cot
#bo(22, 45)
#thoi-cot()

// ----- Vùng 3: BA cột -----
#phan([PHẦN III. Ba cột])
#chia-2-cot(so: 3, khoang: 12pt, bo(45, 66))

#thoi-cot()
#bang-dap-an()
