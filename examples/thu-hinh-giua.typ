// Thử tuỳ chọn fig-pos: "center" — hình canh GIỮA, nằm giữa đề và các phương án.
#import "../baigiang.typ": *
#let ho-so = sys.inputs.at("ho-so", default: "dethi")
#show: de-toan.with(ho-so: ho-so, tieu-de: [Thử hình canh giữa])

#let do-thi-mau = ve-do-thi(x => x * x - 1, mau: blue, w: 5.5cm, xmin: -3, xmax: 3)

= So sánh 5 vị trí hình

#tn(
  [Cho hàm số $y = f(x)$ có đồ thị như hình vẽ (fig-pos mặc định `"right"`).
   Hỏi hàm số đồng biến trên khoảng nào?],
  ([$(-oo; 0)$], [$(0; +oo)$], [$(-1; 1)$], [$RR$]),
  dap-an: 2, fig: do-thi-mau,
)

#tn(
  [Cùng đồ thị đó nhưng `fig-pos: "left"` — hình sang cột trái, chữ ôm bên phải.],
  ([$(-oo; 0)$], [$(0; +oo)$], [$(-1; 1)$], [$RR$]),
  dap-an: 2, fig: do-thi-mau, fig-pos: "left",
)

#tn(
  [Với `fig-pos: "center"` — hình phải nằm CHÍNH GIỮA, ở DƯỚI dòng đề này và
   TRÊN bốn phương án A, B, C, D.],
  ([$(-oo; 0)$], [$(0; +oo)$], [$(-1; 1)$], [$RR$]),
  dap-an: 2, fig: do-thi-mau, fig-pos: "center",
)

#tn(
  [Với `fig-pos: "top"` — hình lên TRÊN cả dòng đề (kể cả thẻ "Câu 4").],
  ([$(-oo; 0)$], [$(0; +oo)$], [$(-1; 1)$], [$RR$]),
  dap-an: 2, fig: do-thi-mau, fig-pos: "top",
)

#tn(
  [Với `fig-pos: "bottom"` — hình xuống DƯỚI cả bốn phương án.],
  ([$(-oo; 0)$], [$(0; +oo)$], [$(-1; 1)$], [$RR$]),
  dap-an: 2, fig: do-thi-mau, fig-pos: "bottom",
)

= Câu đúng/sai với hình canh giữa

#ds(
  [Cho đồ thị hàm số $y = x^2 - 1$ như hình vẽ.],
  (
    [Đồ thị cắt trục hoành tại hai điểm phân biệt.],
    [Hàm số đạt giá trị nhỏ nhất bằng $-1$.],
    [Hàm số nghịch biến trên $(0; +oo)$.],
    [Đồ thị nhận trục tung làm trục đối xứng.],
  ),
  dap-an: (true, true, false, true),
  fig: do-thi-mau, fig-pos: "center",
)

= Trả lời ngắn với hình canh giữa

#tln(
  [Dựa vào đồ thị, giá trị nhỏ nhất của hàm số bằng bao nhiêu?],
  [$-1$],
  dap-an: [-1], fig: do-thi-mau, fig-pos: "center",
)

= Hình canh giữa kèm LỜI GIẢI

#tn(
  [Đồ thị dưới đây cắt trục hoành tại mấy điểm?],
  ([$0$], [$1$], [$2$], [$3$]),
  dap-an: 3, fig: do-thi-mau, fig-pos: "center",
  loi-giai: [Phương trình $x^2 - 1 = 0$ có hai nghiệm $x = plus.minus 1$.],
  fig-giai: do-thi-mau, fig-giai-pos: "center",
)
