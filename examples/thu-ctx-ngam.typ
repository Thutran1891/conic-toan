// thu-ctx-ngam.typ — KIỂM TRA: gọi hàm vẽ KHÔNG truyền ctx (ctx ngầm) phải
// chạy được ở CẢ BA hồ sơ, đặc biệt là BEAMER (trước đây panic vì phép đo
// tự-ngắt-màn dựng nội dung trong `measure`, nơi state ctx vô hiệu).
//
// Biên dịch:
//   typst compile thu-ctx-ngam.typ                          (beamer, mặc định)
//   typst compile thu-ctx-ngam.typ --input ho-so=dethi
//   typst compile thu-ctx-ngam.typ --input ho-so=loigiai
// KỲ VỌNG: 0 lỗi, hình vẽ ĐẦY ĐỦ ở cả ba bản (không mất nét nào).

#import "../baigiang.typ": *
#show math.equation.where(block: false): it => math.display(it)

#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ CTX NGẦM],
  mon: [TOÁN — kiểm tra thư viện],
  ma-de: "001",
)

#phan([PHẦN I. HÌNH TRONG LỜI GIẢI (ép tự ngắt màn)], ngan: [Ctx ngầm])

// Mục 1: lời giải DÀI để beamer phải đo và tự ngắt màn; hình dùng CTX NGẦM.
#tl([
  Trong mặt phẳng toạ độ $O x y$, cho hai điểm $A(3; 0)$, $B(0; 3)$ và điểm
  $P(1; 2)$ nằm trên đoạn $A B$. Tính độ dài $A B$ và diện tích tam giác $O A B$.
],
  fig-giai: hinh(w: 5.5cm, xmin: -0.5, xmax: 4.5, ymin: -0.5, ymax: 4.5, ctx => {
    he-truc(ctx)
    doan((-0.3, 3.3), (3.3, -0.3), mau: blue)          // KHÔNG truyền ctx
    cac-diem(((3, 0), $A$, "above"), ((0, 3), $B$, "right"),
             ((1, 2), $P(1;2)$, "above-right"), mau: red)
    doan((1, 0), (1, 2), dut: true)                     // KHÔNG truyền ctx
    da-giac(((0, 0), (3, 0), (0, 3)), mau: gray, to: blue.lighten(90%))
  }),
  loi-giai: [
    Ta có $O A = 3$ và $O B = 3$. \
    Độ dài $A B$ tính theo công thức khoảng cách giữa hai điểm:
    $A B = sqrt((3 - 0)^2 + (0 - 3)^2) = sqrt(9 + 9) = 3 sqrt(2)$
    Tam giác $O A B$ vuông tại $O$ nên diện tích là:
    $S_(O A B) = 1/2 dot O A dot O B = 1/2 dot 3 dot 3 = 9/2$
    Kiểm tra điểm $P(1; 2)$: thay vào phương trình đoạn chắn $x/3 + y/3 = 1$
    ta được $1/3 + 2/3 = 1$ (đúng), vậy $P in A B$. \
    Gọi $H$ là hình chiếu của $P$ lên $O x$, khi đó $P H = 2$ và $O H = 1$. \
    Diện tích tam giác $O A P$ bằng $1/2 dot O A dot P H = 1/2 dot 3 dot 2 = 3$. \
    Suy ra diện tích tam giác $O B P$ bằng $9/2 - 3 = 3/2$. \
    Tỉ số hai diện tích đó bằng $3 : 3/2 = 2$, đúng bằng tỉ số $(A P)/(P B)$. \
    Vậy $P$ chia đoạn $A B$ theo tỉ số $2 : 1$ tính từ $A$.
  ]
)

// Mục 2: hình đặt ở ĐỀ BÀI, cũng dùng ctx ngầm.
#tl([
  Cho đường tròn $(C)$ tâm $I(0; 0)$ bán kính $R = 2$ và điểm $M(2; 2)$.
  Viết phương trình tiếp tuyến của $(C)$ đi qua $M$.
],
  fig: hinh(w: 5cm, xmin: -2.6, xmax: 3.2, ymin: -2.6, ymax: 3.2, ctx => {
    he-truc(ctx)
    duong-tron((0, 0), 2, mau: blue)                    // KHÔNG truyền ctx
    cac-diem(((0, 0), $I$, "below-left"), ((2, 2), $M$, "above-right"), mau: red)
    doan((0, 0), (2, 2), dut: true)
  }),
  loi-giai: [
    Vì $I M = 2 sqrt(2) > R = 2$ nên từ $M$ kẻ được hai tiếp tuyến. \
    Hai tiếp tuyến đó là $x = 2$ và $y = 2$.
  ]
)

#phan([PHẦN II. HÌNH TRONG PHƯƠNG ÁN (ép đo bề rộng cột)], ngan: [Phương án])

// Mục 3: `cot: auto` đo bề rộng phương án bằng `measure` — phương án có HÌNH
// vẽ theo lối ctx ngầm.
#tn([Đồ thị nào dưới đây là của một hàm số bậc nhất đồng biến?],
  (
    [#hinh(w: 2.4cm, xmin: -1, xmax: 3, ymin: -1, ymax: 3, ctx => {
      truc(ctx)
      duong-cong(ctx, range(21).map(i => (i / 5, 1)))
    })],
    True([#hinh(w: 2.4cm, xmin: -1, xmax: 3, ymin: -1, ymax: 3, ctx => {
      truc(ctx)
      doan((-0.5, -0.5), (2.5, 2.5), mau: blue)         // KHÔNG truyền ctx
    })]),
    [#hinh(w: 2.4cm, xmin: -1, xmax: 3, ymin: -1, ymax: 3, ctx => {
      truc(ctx)
      doan((-0.5, 2.5), (2.5, -0.5), mau: blue)         // KHÔNG truyền ctx
    })],
    [#hinh(w: 2.4cm, xmin: -1, xmax: 3, ymin: -1, ymax: 3, ctx => {
      truc(ctx)
      duong-tron((1, 1), 0.8, mau: blue)                // KHÔNG truyền ctx
    })],
  ),
)

#het()
#bang-dap-an()
