// thu-om-hinh.typ — KIỂM TRA chế độ CHỮ ÔM HÌNH (08/2026)
// Biên dịch:  typst compile thu-om-hinh.typ
// (import THẲNG nguồn dự án để khỏi phải chạy cai-dat-tu-du-an.bat)
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.5cm)
#set text(size: 10.5pt, lang: "vi")
#show: de-toan.with(ho-so: "loigiai", truong: [THPT Thử], mon: [Toán 9])

// Hình nhỏ kiểu bài hình học phẳng (nửa đường tròn đường kính AD).
#let hinh-nua-tron = hinh(w: 4.4cm, xmin: -1.25, xmax: 1.25, ymin: -0.25, ymax: 1.2, ctx => {
  cung((0, 0), 1, tu: 0deg, den: 180deg)
  let A = (-1, 0)
  let D = (1, 0)
  let B = toa-cuc((0, 0), 1, 115)
  let C = toa-cuc((0, 0), 1, 35)
  let E = (-0.28, 0.42)
  let F = (-0.28, 0)
  cac-doan(A, D, duong(A, C), duong(B, D), duong(A, B), duong(C, D), duong(B, C), duong(E, F))
  ve-goc-vuong(E, F, D, r: 0.07)
  cac-diem((A, "A", "below-left"), (D, "D", "below-right"), (B, "B", "above-left"),
    (C, "C", "above-right"), (E, "E", "above-right"), (F, "F", "below"))
})

= 1. Lời giải DÀI + hình nhỏ (chế độ ôm — mặc định BẬT)

#tl([Cho nửa đường tròn đường kính $A D$, hai điểm $B$, $C$ nằm trên nửa đường
tròn. Gọi $E = A C inter B D$ và $F$ là hình chiếu của $E$ lên $A D$.
Chứng minh tứ giác $C E F D$ nội tiếp và $B E dot N D = N E dot B D$.],
  fig-giai: hinh-nua-tron,
  loigiai: [
    1\) Ta có $E F perp A D => angle E F D = 90degree$.

    Lại có $angle A C D = 90degree$ (góc nội tiếp chắn nửa đường tròn) hay
    $angle E C D = 90degree$.

    Vì $angle E F D = angle E C D = 90degree$ nên tứ giác $C E F D$ nội tiếp
    đường tròn đường kính $E D$.

    2\) *Phương pháp toạ độ:*

    Đặt hệ trục toạ độ sao cho đường tròn đường kính $A D$ là đường tròn đơn vị,
    tức là $A(-1; 0)$, $D(1; 0)$, và chọn
    $ B ((1 - m^2)/(1 + m^2); (2m)/(1 + m^2)), quad C ((1 - n^2)/(1 + n^2); (2n)/(1 + n^2)) quad (m > n > 0). $

    Từ phương trình các đường thẳng $A C$ và $B D$, ta tìm được giao điểm
    $ E (-(m n - 1)/(m n + 1); (2n)/(m n + 1)). $

    Vì $F$ là hình chiếu của $E$ lên $A D$ nên $F(-(m n - 1)/(m n + 1); 0)$.

    Gọi $N = B D inter C F$, giải hệ phương trình đường thẳng $B D$ và $C F$ thu được
    $ N (-(m^2 n - 2m + n)/(m^2 n + 2m - n); (2 m n)/(m^2 n + 2m - n)). $

    Tính độ dài các đoạn thẳng
    $ B D = (2m)/sqrt(1 + m^2), quad B E = (2(m - n))/(sqrt(1 + m^2) (m n + 1)), $
    $ N D = (2 m n sqrt(1 + m^2))/(m^2 n + 2m - n), quad N E = (2n(m - n) sqrt(1 + m^2))/((m n + 1)(m^2 n + 2m - n)). $

    Suy ra $B E dot N D = N E dot B D$ (điều phải chứng minh).
  ],
)

= 2. Cùng câu đó, TẮT chế độ ôm (đối chiếu lối cũ)

#kieu-cau-hoi(om-hinh: false)

#tl([Cho nửa đường tròn đường kính $A D$ (đề như trên) — bản TẮT ôm.],
  fig-giai: hinh-nua-tron,
  loigiai: [
    Ta có $E F perp A D => angle E F D = 90degree$.

    Lại có $angle A C D = 90degree$ nên tứ giác $C E F D$ nội tiếp đường tròn
    đường kính $E D$.

    Đặt $A(-1; 0)$, $D(1; 0)$ và
    $ B ((1 - m^2)/(1 + m^2); (2m)/(1 + m^2)), quad C ((1 - n^2)/(1 + n^2); (2n)/(1 + n^2)). $

    Từ đó $ E (-(m n - 1)/(m n + 1); (2n)/(m n + 1)), quad F(-(m n - 1)/(m n + 1); 0). $

    Cột bên phải trống một khoảng lớn — đây chính là chỗ lãng phí cần chữa.
  ],
)

#kieu-cau-hoi(om-hinh: true)

= 3. Hình kèm ĐỀ, phần đề + phương án dài

#tn([Cho nửa đường tròn đường kính $A D$ như hình vẽ, $B$ và $C$ thuộc nửa đường
tròn, $E = A C inter B D$, $F$ là hình chiếu của $E$ trên $A D$. Biết
$angle B A D = 65degree$ và $angle C A D = 35degree$. Khẳng định nào sau đây
đúng về tứ giác $C E F D$ và các góc trong hình?],
  (
    True([Tứ giác $C E F D$ nội tiếp đường tròn đường kính $E D$]),
    [Tứ giác $C E F D$ nội tiếp đường tròn đường kính $E C$],
    [Tứ giác $A B E F$ nội tiếp đường tròn đường kính $A E$],
    [Tứ giác $A B C D$ là hình thang cân],
  ),
  fig: hinh-nua-tron,
  loigiai: [Vì $angle E F D = angle E C D = 90degree$ nên $C E F D$ nội tiếp
  đường tròn đường kính $E D$.],
)

= 4. Nội dung NGẮN hơn hình — phải giữ nguyên lối 2 cột canh giữa

#tl([Tính $angle B A D$ nếu $angle B D A = 25degree$.],
  fig-giai: hinh-nua-tron,
  loigiai: [Tam giác $A B D$ vuông tại $B$ nên $angle B A D = 90degree - 25degree = 65degree$.],
)

= 5. Hình đặt BÊN TRÁI + bề rộng cột chỉ định

#tl([Kiểm tra bố cục ôm khi hình nằm bên trái và cột hình rộng $35%$.],
  fig-giai: hinh-nua-tron, fig-giai-pos: "left", fig-giai-width: 35%,
  loigiai: [
    Đoạn thứ nhất nằm cạnh hình, ôm sát chiều cao hình.

    Đoạn thứ hai vẫn còn chỗ nên tiếp tục nằm cạnh hình.

    $ E (-(m n - 1)/(m n + 1); (2n)/(m n + 1)) $

    Khi đã vượt quá chiều cao hình, phần còn lại của lời giải phải tràn ra
    NGUYÊN BỀ RỘNG trang, không còn bị bó trong cột hẹp nữa. Đây là dòng dài để
    thấy rõ chữ đã chiếm hết bề rộng, không chừa cột trống bên cạnh hình như
    trước. Nếu dòng này vẫn nằm trong cột hẹp thì chế độ ôm chưa hoạt động.

    Dòng cuối cùng để chắc chắn phần dưới đủ dài.
  ],
)
