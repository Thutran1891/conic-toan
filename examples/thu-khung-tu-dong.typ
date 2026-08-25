// =====================================================================
// THỬ: TỰ DÒ CỬA SỔ KHUNG HÌNH — không phải khai xmin/xmax/ymin/ymax
// Biên dịch:  typst compile thu-khung-tu-dong.typ
//             typst compile thu-khung-tu-dong.typ --input ho-so=beamer
// Mọi hình bật `khung: true` để NHÌN RÕ mép khung so với nét vẽ.
// =====================================================================
#import "../baigiang.typ": *
// #import "@local/conic-toan:0.2.0": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")
#show: de-toan.with(
  tieu-de: [THỬ TỰ DÒ KHUNG HÌNH],
   ho-so: ho-so, 
   thong-tin-hs: false)

#let o = (khung: true)

= 1. Hình bài toán thực tế (ca cô nêu)

Bên trái KHAI TAY như trước, bên phải BỎ TRỐNG cửa sổ. Bản tự dò phải ôm sát,
không thừa giấy, và không cắt mất nhãn "Rừng" / "20 km" ở bên phải.

#let ve-song = ctx => {
  da-giac(((0, 1), (2, 1), (2, -5), (0, -5)), to: rgb(100, 149, 237, 40), mau: rgb(0, 0, 0, 0))
  doan((0, 1), (0, -5), day: 1.2pt)
  let A = (0, 0)
  let C = (2, 0)
  let B = (2, -4)
  let D = (2, -2)
  mui-ten(A, C, mau: orange, day: 1pt)
  mui-ten(A, D, mau: purple, day: 1.2pt)
  mui-ten(D, B, mau: red.darken(20%), day: 1.2pt)
  doan(C, B, dut: true)
  cac-diem((A, $A$, "left"), (C, $C$, "right"), (D, $D$, "right"), (B, $B$, "right"))
  nhan((1, 0.2), [Sông], huong: "above", mau: blue)
  nhan((1, 0), [15 km], huong: "below", mau: orange)
  nhan((2.6, -3), [Rừng], huong: "right", mau: green.darken(30%))
  nhan((2, -1), $x$, huong: "right", mau: red)
  nhan((2.5, -2), [20 km], huong: "right")
}

#grid(columns: 2, column-gutter: 14pt,
  [khai tay #hinh(w: 4.5cm, xmin: -0.5, xmax: 4, ymin: -5.5, ymax: 1.5, ..o, ve-song)],
  [tự dò #hinh(w: 4.5cm, ..o, ve-song)],
)

= 2. Điểm phụ và hình chìa ra ngoài đa giác

Đường tròn ngoại tiếp chìa hẳn ra ngoài tam giác, tiếp điểm $T_1$, $T_2$ là
điểm phụ tính từ điểm khác — trước đây phải ước lượng để khai khung.

#grid(columns: 3, column-gutter: 10pt,
  hinh(w: 3.8cm, ..o, ctx => {
    let O = (0, 0)
    let R = 2
    duong-tron(O, R)
    diem(O, ten: $O$, huong: "below")
    let M = (3.4, 1.6)
    diem(M, ten: $M$, huong: "right")
    tiep-tuyen-tu-diem(O, R, M)
  }),
  hinh(w: 3.8cm, ..o, ctx => {
    let A = (0, 0)
    let B = (4, 0)
    let C = (1.2, 3)
    tam-giac(A, B, C, ten: ($A$, $B$, $C$))
    duong-tron-ngoai-tiep(A, B, C, ban-kinh: true)
  }),
  hinh(w: 3.8cm, ..o, ctx => {
    let A = (0, 0)
    let B = (3.4, 0)
    let C = (2.2, 2.4)
    tam-giac(A, B, C)
    let H = hinh-chieu(C, A, B)
    doan(C, H, dut: true)
    ve-goc-vuong(C, H, B)
    cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"), (H, $H$, "below"))
  }),
)

= 3. Nhãn chữ dài — phép đo tính CẢ bề rộng chữ

#grid(columns: 2, column-gutter: 14pt,
  hinh(w: 6cm, ..o, ctx => {
    da-giac(((0, 0), (3, 0), (3, 2), (0, 2)))
    nhan((1.5, 2), [nhãn khá dài đặt ở phía trên], huong: "above")
    nhan((0, 1), [trái], huong: "left")
  }),
  hinh(w: 6cm, ..o, ctx => {
    duong-tron((0, 0), 1.5, to: rgb(200, 220, 255))
    elip((0, 0), 1.5, 0.5, dut: true)
    nhan((0, -1.5), [đường tròn lớn của mặt cầu], huong: "below")
  }),
)

= 4. Khai MỘT PHẦN — cạnh nào khai thì giữ nguyên cạnh đó

Trái: khai `ymin: -1, ymax: 4` (chiều dọc theo ý người soạn, chiều ngang tự dò).
Phải: bỏ trống cả bốn.

#grid(columns: 2, column-gutter: 14pt,
  hinh(w: 5cm, ymin: -1, ymax: 4, ..o, ctx => {
    da-giac(((0, 0), (3, 0), (3, 2), (0, 2)))
    nhan((1.5, 2), [nhãn ở trên], huong: "above")
  }),
  hinh(w: 5cm, ..o, ctx => {
    da-giac(((0, 0), (3, 0), (3, 2), (0, 2)))
    nhan((1.5, 2), [nhãn ở trên], huong: "above")
  }),
)

= 5. ⚠ Ca PHẢI khai cửa sổ như cũ: nét vẽ phủ KÍN khung

`he-truc`, `truc`, `luoi`, `gach-vung` vẽ tràn từ mép này sang mép kia của
cửa sổ, tức phạm vi của chúng LÀ chính cái đang cần tìm. Tự dò vẫn cho hình
chứa trọn nét vẽ nhưng cửa sổ là tuỳ ý — hình loại này nên khai cửa sổ, hoặc
dùng thẳng `do-thi-*` (các hàm đó tự dựng khung riêng).

#grid(columns: 2, column-gutter: 14pt,
  [tự dò (không nên) #hinh(w: 5.5cm, ..o, ctx => {
    he-truc(ctx)
    ve-ham(x => x * x / 2 - 2, mau: blue)
  })],
  [khai cửa sổ #hinh(w: 5.5cm, xmin: -4, xmax: 4, ymin: -3, ymax: 3, ..o, ctx => {
    he-truc(ctx)
    ve-ham(x => x * x / 2 - 2, mau: blue)
  })],
)

= 6. HỒI QUY — khai đủ bốn cạnh phải GIỐNG HỆT bản cũ

Hai hình dưới đây đều khai đủ cửa sổ nên KHÔNG đi qua cơ chế dò; chúng phải
trùng khít từng nét với bản trước khi thêm tính năng này.

#grid(columns: 2, column-gutter: 14pt,
  hinh(w: 5cm, xmin: -3, xmax: 3, ymin: -2, ymax: 2, ..o, ctx => {
    he-truc(ctx)
    ve-ham(x => calc.sin(x * 1rad), mau: red)
  }),
  hinh(w: 5cm, xmin: -1, xmax: 5, ymin: -1, ymax: 3, ..o, ctx => {
    tam-giac((0, 0), (4, 0), (1, 2))
    nhan((2, 2.4), [khai tay], huong: "above")
  }),
)

= 7. Hình lồng trong nhãn · `cat: true` · hình rỗng

#grid(columns: 3, column-gutter: 10pt,
  hinh(w: 4cm, ..o, ctx => {
    da-giac(((0, 0), (3, 0), (3, 2)))
    nhan((1.5, 2.4), box(stroke: 0.4pt, hinh(w: 1.2cm, ctx2 => duong-tron((0, 0), 1))), huong: "above")
  }),
  hinh(w: 3.4cm, cat: true, ..o, ctx => {
    duong-tron((0, 0), 1)
    nhan((0, 1), [nhãn dài ở trên], huong: "above")
  }),
  hinh(w: 3cm, ..o, ctx => { }),
)

= 8. Đặt trong câu hỏi (chạy cả beamer)

Chạy `--input ho-so=beamer`: lời giải dài phải tự ngắt màn, hình phải hiện đủ
ở mọi màn và KHÔNG tràn ra ngoài slide.

#tl(
  [Cho tam giác $A B C$ nội tiếp đường tròn tâm $O$. Chứng minh $a / sin A = 2R$.],
  fig: hinh(w: 4.6cm, ctx => {
    let A = (0, 0)
    let B = (4, 0)
    let C = (1.2, 2.6)
    tam-giac(A, B, C, ten: ($A$, $B$, $C$))
    duong-tron-ngoai-tiep(A, B, C, ban-kinh: true)
  }),
  fig-giai: hinh(w: 4.6cm, ctx => {
    let A = (0, 0)
    let B = (4, 0)
    let C = (1.2, 2.6)
    tam-giac(A, B, C, ten: ($A$, $B$, $C$))
    duong-tron-ngoai-tiep(A, B, C, ban-kinh: true, mau: red)
  }),
  loi-giai: [
    Bước 1. Gọi $O$ là tâm đường tròn ngoại tiếp tam giác $A B C$, bán kính $R$. \
    Bước 2. Kẻ đường kính $B D$, khi đó $angle B C D = 90 degree$. \
    Bước 3. Hai góc $angle B A C$ và $angle B D C$ cùng chắn cung $B C$. \
    Bước 4. Suy ra $sin A = sin(angle B D C) = (B C) / (B D) = a / (2R)$. \
    Bước 5. Vậy $a / sin A = 2R$. \
    Bước 6. Làm tương tự cho hai đỉnh còn lại. \
    Bước 7. Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo. \
    Bước 8. Thêm dòng nữa. \
    Bước 9. Thêm dòng nữa cho chắc chắn. \
  ],
)

#tl(
  [Cho tam giác $A B C$ nội tiếp đường tròn tâm $O$. Chứng minh $a / sin A = 2R$.],
  fig-giai: hinh(w: 4.5cm, ..o, ctx => {
    let A = (0, 0)
    let B = (4, 0)
    let C = (1.2, 2.6)
    tam-giac(A, B, C, ten: ($A$, $B$, $C$))
    duong-tron-ngoai-tiep(A, B, C, ban-kinh: true)
  }),
  loi-giai: [
    Bước 1. Gọi $O$ là tâm đường tròn ngoại tiếp tam giác $A B C$, bán kính $R$. \
    Bước 2. Kẻ đường kính $B D$, khi đó $angle B C D = 90 degree$. \
    Bước 3. Hai góc $angle B A C$ và $angle B D C$ cùng chắn cung $B C$. \
    Bước 4. Suy ra $sin A = sin(angle B D C) = (B C) / (B D) = a / (2R)$. \
    Bước 5. Vậy $a / sin A = 2R$. \
    Bước 6. Làm tương tự cho hai đỉnh còn lại. \
    Bước 6. Làm tương tự cho hai đỉnh còn lại. 
    Bước 6. Làm tương tự cho hai đỉnh còn lại. 
    Bước 6. Làm tương tự cho hai đỉnh còn lại. 
    Bước 6. Làm tương tự cho hai đỉnh còn lại.  \
    Bước 7. Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo. Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo.Thêm dòng cho lời giải đủ dài để phải sang màn tiếp theo. \
    Bước 8. Thêm dòng nữa. \
    Bước 9. Thêm dòng nữa cho chắc chắn. \
  ],
)

#tn(
  [Hình nào dưới đây là tam giác vuông?],
  (
    [#hinh(w: 2.4cm, ..o, ctx => tam-giac((0, 0), (2, 0), (0.6, 1.4)))],
    True([#hinh(w: 2.4cm, ctx => {
      tam-giac((0, 0), (2, 0), (0, 1.4))
      ve-goc-vuong((0, 1.4), (0, 0), (2, 0))
    })]),
    [#hinh(w: 2.4cm, ctx => duong-tron((0, 0), 1))],
    [#hinh(w: 2.4cm, ctx => da-giac(((0, 0), (2, 0), (2, 1.2), (0, 1.2))))],
  ),
)

#tln([Trong một cuộc tập trận, một chiến sĩ đặc công cần bơi qua dòng sông rộng $15 "km"$ từ $A$ đến $D$, sau đó chạy bộ xuyên rừng đến mục tiêu $B$ cách $C$ $20 "km"$. Biết vận tốc bơi là $8 "km/h"$ và vận tốc chạy bộ là $17 "km/h"$. Để đến $B$ sớm nhất, khoảng cách $x$ từ $C$ đến $D$ bằng bao nhiêu?],
  [$8$],
  fig: hinh(w: 4.5cm, xmin: -0.5, xmax: 4, ymin: -5.5, ymax: 1.5, ctx => {
    da-giac(((0,1), (2,1), (2,-5), (0,-5)), to: rgb(100, 149, 237, 40), mau: rgb(0, 0, 0, 0))
    doan((0,1), (0,-5), day: 1.2pt)
    doan((2,1), (2,-5), day: 1.5pt, mau: green.darken(40%))
    let A = (0, 0); let C = (2, 0); let B = (2, -4); let D = (2, -2)
    mui-ten(A, C, mau: orange, day: 1pt)
    mui-ten(A, D, mau: purple, day: 1.2pt)
    mui-ten(D, B, mau: red.darken(20%), day: 1.2pt)
    doan(C, B, dut: true)
    cac-diem((A, $A$, "left"), (C, $C$, "right"), (D, $D$, "right"), (B, $B$, "right"))
    nhan((1, 0.2), [Sông], huong: "above", mau: blue)
    nhan((1, 0), [15 km], huong: "below", mau: orange)
    nhan((2.6, -3), [Rừng], huong: "right", mau: green.darken(30%))
    nhan((2, -1), $x$, huong: "right", mau: red)
    nhan((2.2, -2), [20 km], huong: "right")
  }),
  
  loi-giai: [
    *Phân tích:* Xây dựng hàm số mô tả tổng thời gian $T(x)$ dựa vào biến $x = C D$ và tìm min trên $[0; 20]$. \
    Gọi $C D = x$ ($0 <= x <= 20$). Hàm thời gian là $T(x) = (sqrt(225 + x^2))/8 + (20 - x)/17$. \
    #sang-man \
    $T'(x) = x / (8 sqrt(225 + x^2)) - 1/17 = 0 <=> 17x = 8 sqrt(225 + x^2)$. \
    $<=> 289x^2 = 64(225 + x^2) <=> 225x^2 = 14400 <=> x^2 = 64 <=> x = 8$. \
    Giá trị $x = 8$ cho thời gian nhỏ nhất. Đáp số: $8$.
  ]
)

#het()
