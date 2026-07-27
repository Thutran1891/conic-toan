// thu-ds-giai.typ — KIỂM TRA lời giải gắn từng ý của #ds (07/2026)
// Biên dịch:  typst compile thu-ds-giai.typ
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.5cm)
#set text(size: 10.5pt, lang: "vi")
#show: de-toan.with(ho-so: "loigiai", truong: [THPT Thử], mon: [Toán 12])

= Thử lời giải gắn từng ý

// 1) Form CŨ — khối lời giải chung, không đụng gì
#ds([Cho hàm số $y = x^3 - 3x$.],
  (
    True([$y' = 3x^2 - 3$]),
    [Hàm số không có cực trị],
    True([Đồ thị nhận điểm uốn làm tâm đối xứng]),
    [Hàm số đồng biến trên $RR$],
  ),
  loigiai: [a) Đúng. b) Sai vì $y' = 0$ có hai nghiệm. c) Đúng. d) Sai.],
)

// 2) Form MỚI — lời giải gắn từng ý (True / False)
#ds([Cho hàm số $y = x^3 - 3x$.],
  (
    True([$y' = 3x^2 - 3$], giai: [Đạo hàm của $x^n$ là $n x^(n-1)$.]),
    False([Hàm số không có cực trị], giai: [$y' = 0 <=> x = plus.minus 1$: hai nghiệm phân biệt nên có hai cực trị.]),
    True([Đồ thị nhận điểm uốn $I(0; 0)$ làm tâm đối xứng]),
    [Hàm số đồng biến trên $RR$],
  ),
)

// 3) Trộn: có loigiai: chung làm dẫn nhập + giải theo ý
#ds([Cho hàm số $y = (2x - 1)/(x + 1)$.],
  (
    True([Tập xác định $D = RR without {-1}$], giai: [Mẫu $x + 1 = 0 <=> x = -1$.]),
    [Đồ thị có tiệm cận ngang $y = 1$],
  ),
  loigiai: [Xét hàm phân thức bậc nhất trên bậc nhất.],
  khoa-y: true,
)

// 4) Hoán vị: nhãn lời giải phải đi theo ý, không lệch
#let y1 = True([$y' = 3x^2 - 3$], giai: [Đạo hàm của $x^n$ là $n x^(n-1)$.])
#let y2 = False([Hàm số không có cực trị], giai: [$y' = 0$ có hai nghiệm phân biệt.])
#let y3 = True([Điểm uốn $I(0; 0)$], giai: [$y'' = 6x = 0 <=> x = 0$.])
#let y4 = [Hàm số đồng biến trên $RR$]

#ds([Thứ tự gốc.], (y1, y2, y3, y4))
#ds([Hoán vị (y3, y4, y1, y2).], (y3, y4, y1, y2))
#ds([Hoán vị (y4, y2, y3, y1).], (y4, y2, y3, y1))
