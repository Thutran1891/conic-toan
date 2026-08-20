// thu-hinh-moi-man.typ — KIỂM TRA: ở hồ sơ BEAMER, hình kèm lời giải
// (`fig-giai`) phải hiện lại ở MỌI màn của cùng một câu, chứ không chỉ màn đầu.
//
// Biên dịch:
//   typst compile thu-hinh-moi-man.typ                      (beamer, mặc định)
//   typst compile thu-hinh-moi-man.typ --input ho-so=dethi
//   typst compile thu-hinh-moi-man.typ --input ho-so=loigiai
//
// KỲ VỌNG Ở BẢN BEAMER (soi từng trang):
//   Mục 1 — lời giải dài, lib TỰ NGẮT màn: hình tam giác có ở màn đầu VÀ ở
//           mọi màn "(tiếp)".
//   Mục 2 — ngắt màn bằng tay (#sang-man): màn "(tiếp)" cũng có hình.
//   Mục 3 — `fig-giai-moi-man: false`: chỉ màn ĐẦU có hình (nếp cũ) — đặt ngay
//           cạnh mục 2 để đối chiếu.
//   Mục 4 — sau `#hinh-moi-man(false)`: cả tài liệu trở lại nếp cũ.
//   Mục 5 — `fig-giai:` nhận MẢNG hình: màn của ý a) hiện hình tam giác, màn
//           của ý b) hiện hình đường tròn; mảng ngắn hơn số màn thì các màn dư
//           giữ hình CUỐI.
//   Mục 6 — HỒI QUY: câu KHÔNG có `fig-giai` phải giống hệt bản trước khi sửa
//           (không đội thêm màn, không có ô hình rỗng).
// Ở bản A4 (không có màn), lời giải được cắt theo #sang-man rồi GHÉP TỪNG Ý
// với hình của ý đó — kiểm: hình đường tròn phải nằm ngang tầm lời giải ý b),
// KHÔNG được dồn lên cạnh ý a).
// Ở hai bản A4 (dethi/loigiai) KHÔNG có khái niệm màn ⇒ bố cục phải y như cũ.

#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ HÌNH LẶP LẠI Ở MỌI MÀN],
  mon: [TOÁN — kiểm tra thư viện],
  ma-de: "001",
)

// Hình dùng chung cho các mục — vẽ tam giác OAB trong hệ trục.
#let hinh-oab = hinh(w: 5cm, xmin: -0.6, xmax: 4.6, ymin: -0.6, ymax: 4.6, ctx => {
  he-truc(ctx)
  da-giac(ctx, ((0, 0), (4, 0), (0, 4)), mau: blue, to: blue.lighten(88%))
  cac-diem(ctx, ((0, 0), $O$, "below-left"), ((4, 0), $A$, "below"),
    ((0, 4), $B$, "left"), mau: red)
  doan(ctx, (0, 0), (2, 2), dut: true, ten: $m$, tai: 0.55, huong: "above-left")
})

#let hinh-tron = hinh(w: 4.6cm, xmin: -2.6, xmax: 2.6, ymin: -2.6, ymax: 2.6, ctx => {
  duong-tron(ctx, (0, 0), 2, mau: blue)
  cac-diem(ctx, ((0, 0), $I$, "below-left"), ((2, 0), $M$, "right"), mau: red)
  doan(ctx, (0, 0), (2, 0), ten: $R$, tai: 0.5, huong: "above")
})

#phan([PHẦN I. MÀN TỰ NGẮT], ngan: [Tự ngắt])

// ---- Mục 1: lời giải RẤT DÀI ⇒ lib tự cắt thành nhiều màn. Hình phải theo. --
#tl([
  Trong mặt phẳng toạ độ $O x y$ cho tam giác $O A B$ vuông tại $O$ với
  $A(4; 0)$ và $B(0; 4)$. Gọi $d$ là đường thẳng đi qua $O$ và trung điểm $M$
  của cạnh $A B$. Tính độ dài $A B$, diện tích tam giác $O A B$, viết phương
  trình đường thẳng $d$ và tính khoảng cách từ $A$ đến $d$.
],
  fig-giai: hinh-oab,
  loi-giai: [
    Ta có $O A = 4$ và $O B = 4$ nên tam giác $O A B$ vuông cân tại $O$. \
    Độ dài cạnh huyền tính theo công thức khoảng cách giữa hai điểm:
    $A B = sqrt((4 - 0)^2 + (0 - 4)^2) = sqrt(16 + 16) = 4 sqrt(2)$. \
    Diện tích tam giác vuông bằng nửa tích hai cạnh góc vuông:
    $S_(O A B) = 1/2 dot O A dot O B = 1/2 dot 4 dot 4 = 8$. \
    Trung điểm $M$ của $A B$ có toạ độ
    $M((4 + 0)/2 ; (0 + 4)/2) = M(2; 2)$. \
    Đường thẳng $d$ đi qua $O(0; 0)$ và $M(2; 2)$ nên có vectơ chỉ phương
    $arrow(u) = (2; 2)$, rút gọn thành $arrow(u) = (1; 1)$. \
    Phương trình tổng quát của $d$ là $x - y = 0$. \
    Khoảng cách từ $A(4; 0)$ đến $d$ bằng
    $d(A, d) = (|4 - 0|)/(sqrt(1^2 + (-1)^2)) = 4/sqrt(2) = 2 sqrt(2)$. \
    Kiểm tra lại: $O M$ là trung tuyến ứng với cạnh huyền nên
    $O M = 1/2 A B = 2 sqrt(2)$, phù hợp với $M(2; 2)$. \
    Vì tam giác vuông cân nên $O M$ đồng thời là đường cao và đường phân giác
    xuất phát từ đỉnh $O$. \
    Vậy $A B = 4 sqrt(2)$, $S_(O A B) = 8$, $d : x - y = 0$ và
    $d(A, d) = 2 sqrt(2)$.
  ],
)

#phan([PHẦN II. MÀN NGẮT BẰNG TAY & CÔNG TẮC], ngan: [Công tắc])

// ---- Mục 2: ngắt màn bằng #sang-man — màn sau CŨNG phải có hình. ----------
#vd([
  Cho đường tròn $(I; R)$ với $R = 2$ và điểm $M$ nằm trên đường tròn.
  Tính chu vi và diện tích hình tròn.
],
  fig-giai: hinh-tron,
  fig-giai-width: 35%,
  loi-giai: [
    Bán kính đường tròn là $R = 2$. \
    Chu vi hình tròn: $C = 2 pi R = 2 pi dot 2 = 4 pi$. \
    #sang-man \
    Diện tích hình tròn: $S = pi R^2 = pi dot 2^2 = 4 pi$. \
    Vậy chu vi và diện tích có cùng số đo là $4 pi$.
  ],
)

// ---- Mục 3: TẮT riêng một câu ⇒ chỉ màn đầu có hình (đối chiếu mục 2). ----
#vd([
  Cũng đường tròn $(I; R)$ như trên, nhưng câu này đặt
  `fig-giai-moi-man: false` — màn "(tiếp)" phải TRẮNG HÌNH như nếp cũ.
],
  fig-giai: hinh-tron,
  fig-giai-width: 35%,
  fig-giai-moi-man: false,
  loi-giai: [
    Bán kính đường tròn là $R = 2$. \
    Chu vi hình tròn: $C = 2 pi R = 4 pi$. \
    #sang-man \
    Diện tích hình tròn: $S = pi R^2 = 4 pi$. \
    Màn này KHÔNG được có hình.
  ],
)

// ---- Mục 4: tắt cho CẢ TÀI LIỆU từ đây trở xuống. ------------------------
#hinh-moi-man(false)

#tn([
  Sau `#hinh-moi-man(false)`: câu trắc nghiệm này có hình lời giải, nhưng màn
  "(tiếp)" phải TRẮNG HÌNH. Diện tích tam giác $O A B$ ở hình bên bằng bao nhiêu?
],
  ( [$4$], True([$8$]), [$12$], [$16$] ),
  fig-giai: hinh-oab,
  loigiai: [
    Tam giác $O A B$ vuông tại $O$ với $O A = O B = 4$. \
    Diện tích: $S = 1/2 dot 4 dot 4 = 8$. \
    #sang-man \
    Màn "(tiếp)" này KHÔNG được có hình (công tắc chung đã tắt). \
    Vậy chọn đáp án $8$.
  ],
)

// ---- Mục 5: MẢNG hình — mỗi ý một hình, hình thứ i cho màn thứ i. --------
#hinh-moi-man(true)

#tl([
  Câu hai ý, mỗi ý một hình: `fig-giai:` nhận MỘT MẢNG. Màn của ý a) phải hiện
  hình TAM GIÁC, màn của ý b) phải hiện hình ĐƯỜNG TRÒN.
],
  fig-giai: (hinh-oab, hinh-tron),
  fig-giai-width: 32%,
  loi-giai: [
    *a)* Tam giác $O A B$ vuông cân tại $O$ với $O A = O B = 4$. \
    Diện tích: $S = 1/2 dot 4 dot 4 = 8$. \
    Cạnh huyền: $A B = 4 sqrt(2)$. \
    #sang-man \
    *b)* Đường tròn $(I; R)$ có $R = 2$. \
    Chu vi: $C = 2 pi R = 4 pi$. \
    Diện tích: $S = pi R^2 = 4 pi$.
  ],
)

// Mảng NGẮN hơn số màn ⇒ các màn dư giữ hình CUỐI (ở đây: 3 màn, 2 hình).
#tl([
  Mảng 2 hình nhưng lời giải có 3 màn — màn thứ ba phải giữ hình CUỐI
  (đường tròn), không được trắng hình.
],
  fig-giai: (hinh-oab, hinh-tron),
  fig-giai-width: 32%,
  loi-giai: [
    Màn 1 — phải thấy hình tam giác. \
    #sang-man \
    Màn 2 — phải thấy hình đường tròn. \
    #sang-man \
    Màn 3 — vẫn phải thấy hình đường tròn (hình cuối của mảng).
  ],
)

// ĐỀ DÀI ép màn 0 RỖNG — ca đã làm lộ lỗi gắn hình theo màn VẬT LÝ.
// Ý a) phải giữ hình TAM GIÁC dù nó nằm ở màn vật lý số 1, 2…
#tl([
  Đề bài rất dài, cố ý chiếm gần trọn slide để lời giải bị đẩy hết sang màn
  "(tiếp)". Trong mặt phẳng toạ độ $O x y$ cho tam giác $O A B$ vuông cân tại
  $O$ với $A(4; 0)$, $B(0; 4)$, và cho đường tròn $(I; R)$ tâm $I(0; 0)$ bán
  kính $R = 2$. Gọi $M$ là trung điểm cạnh $A B$, gọi $N$ là giao điểm của tia
  $O M$ với đường tròn $(I; R)$. \
  a) Tính độ dài $A B$, diện tích tam giác $O A B$ và toạ độ điểm $M$. \
  b) Tính chu vi, diện tích hình tròn $(I; R)$ và toạ độ điểm $N$. \
  Trình bày đầy đủ các bước tính toán và nêu rõ công thức đã dùng ở mỗi bước.
],
  fig-giai: (hinh-oab, hinh-tron),
  fig-giai-width: 32%,
  loi-giai: [
    *a)* Tam giác $O A B$ vuông cân tại $O$, $O A = O B = 4$. \
    Cạnh huyền: $A B = sqrt(4^2 + 4^2) = 4 sqrt(2)$. \
    Diện tích: $S = 1/2 dot 4 dot 4 = 8$. \
    Trung điểm: $M(2; 2)$. \
    Mọi màn của ý a) phải thấy hình TAM GIÁC. \
    #sang-man \
    *b)* Đường tròn $(I; R)$ có $R = 2$. \
    Chu vi: $C = 2 pi R = 4 pi$. \
    Diện tích: $S = pi R^2 = 4 pi$. \
    Mọi màn của ý b) phải thấy hình ĐƯỜNG TRÒN.
  ],
)

// ---- Mục 6: HỒI QUY — câu KHÔNG có fig-giai. -----------------------------

#tl([
  HỒI QUY: câu này KHÔNG khai `fig-giai`. Trình chiếu phải giống hệt bản
  trước khi sửa — không đội thêm màn, không có ô hình rỗng. Giải phương trình
  $x^2 - 5x + 6 = 0$.
],
  loi-giai: [
    Ta có $Delta = (-5)^2 - 4 dot 1 dot 6 = 25 - 24 = 1 > 0$. \
    Phương trình có hai nghiệm phân biệt: \
    $x_1 = (5 + 1)/2 = 3$ và $x_2 = (5 - 1)/2 = 2$. \
    Vậy tập nghiệm là $S = {2; 3}$.
  ],
)

#het()
