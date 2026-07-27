// =====================================================================
// de-mau.typ — MỘT FILE NGUỒN, BA KIỂU PDF
//
// Cách 1: đổi giá trị mặc định bên dưới: "dethi" | "loigiai" | "beamer".
// Cách 2 (không cần sửa file — xuất cả 3 bản):
//   typst compile --input ho-so=dethi de-mau.typ de-thi.pdf
//   typst compile --input ho-so=loigiai de-mau.typ dap-an.pdf
//   typst compile --input ho-so=beamer de-mau.typ trinh-chieu.pdf
// =====================================================================
// #import "../baigiang.typ": *
#import "@local/conic-toan:0.2.0": * 

#import "image-12.typ": hinh-be-ca, hinh-cong, hinh-phong-thi, hinh-cau-thang

#let ho-so = sys.inputs.at("ho-so", default: "dethi")

// Kiểu tiền tố "Câu X" / "A." / "a)" — đổi màu + hình thẻ ĐỒNG BỘ toàn bài:
//   hinh: "bo-tron" (mặc định) | "chu-nhat" | "luc-giac" | "khong-to"
#kieu-cau-hoi(mau: rgb("#2b7d08"), hinh: "khong-to")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [ĐỀ KIỂM TRA KHẢO SÁT CHẤT LƯỢNG],
  mon: [MÔN TOÁN 12 — CHƯƠNG TRÌNH 2025],
  thoi-gian: "90 phút",
  truong: [SỞ GIÁO DỤC VÀ ĐÀO TẠO \ TRƯỜNG THPT CAY DUONG],
  ma-de: "1012",
  gv: "Kim Thu",
  
  ngay: [20/07/2026],
  phu-de: [Ôn tập chương I — Khảo sát hàm số],

  // ===== HAI BIẾN CÔ TEST TẠI ĐÂY (đổi giá trị rồi biên dịch lại) =====
  ti-le-chu: 1.2,        // cỡ chữ thân bài: 1.0 = mặc định; thử 1.15 (to hơn),
                         //   0.9 (nhỏ hơn)… Chỉ đổi thân + khung, tiêu đề nguyên.
  mau-cong-thuc: rgb("#81208e"), 
  //mau-cong-thuc: auto,  // màu công thức $...$: auto = đen (mặc định);
                         //   thử rgb("#0f4c81") xanh, rgb("#a93226") đỏ,
                         //   rgb("#1e8449") lục… nhuộm mọi công thức toàn bài.
)

// Bộ hàm câu hỏi (vd, tn, ds, tln, tl, phan) nay do thư viện cung cấp sẵn,
// tự đọc hồ sơ từ trạng thái — KHÔNG cần tao-cau-hoi (đã xoá cùng lib/tron-de).
// tn = trắc nghiệm, ds = đúng sai, tln = trả lời ngắn, tl = tự luận.

#phan([PHẦN I. Câu trắc nghiệm nhiều phương án], ngan: [Phần I])

#vd([Giải hệ phương trình: $ cases(
  x + y = 5,
  x - y = 1,
) $],
loi-giai: [Cộng hai vế của hai phương trình ta được $2x = 6 <=> x = 3$.\
Thay $x = 3$ vào phương trình đầu tiên, ta được $y = 2$
.\
Vậy hệ phương trình có $1$ nghiệm là $(x ; y) = (3; 2)$.]
)

#vd([Giải phương trình $x^2 - 3x + 2 = 0$.],
loi-giai: [Phương trình có nghiệm 
$ cases(
  delim: "[",
  x = 1,
  x = 2,
) $]
)

#vd(
  [Tính đạo hàm của hàm số $y = x^3 - 3x + 1$.],
  loi-giai: [
    Áp dụng công thức $(x^n)' = n x^(n - 1)$ và $(c)' = 0$. \
    Ta có $y' = 3x^2 - 3$.
  ],
  tieu-de: [Ví dụ mở đầu],
)

#vd([Giải phương trình $x^2 - 3 x - 4 = 0.$],
loi-giai: [Do $a - b + c = 0$ nên phương trình có hai nghiệm là $x = -1$ và $x = -c/a = 4$.],
tieu-de: [Vi du 2])

#tn([Đồ thị nào dưới đây là đồ thị hàm số $y = x^2$?], (
  [#do-thi-ham(x => x*x*x, w: 3.2cm, xmin: -1.6, xmax: 1.6, ymin: -2, ymax: 2)],
  True([#do-thi-ham(x => x*x, w: 3.2cm, xmin: -1.6, xmax: 1.6, ymin: -0.4, ymax: 2.4)]),
  [#do-thi-ham(x => -x*x, w: 3.2cm, xmin: -1.6, xmax: 1.6, ymin: -2.4, ymax: 0.4)],
  [#do-thi-ham(x => x, w: 3.2cm, xmin: -1.6, xmax: 1.6, ymin: -2, ymax: 2)]
), cols: 4,
  loigiai: [Đồ thị hàm bậc hai $y = x^2$ là parabol bề lõm quay lên. \ Chọn *B*.],
  )


#tn([Cho cấp số cộng $(u_n)$ có $u_1 = 3$ và $u_2 = 7$. Công sai $d$ của cấp số cộng đã cho bằng bao nhiêu?],
  (
    $d = -4 $,
    True($d = 4$),
    $d = 10$,
    $d = 21$
  ),
  loigiai: [
    Công sai của cấp số cộng được tính bởi công thức: $d = u_2 - u_1$. \
    Thay số vào ta được: $d = 7 - 3 = 4$. \
    Chọn *B*.
  ]
)

#tn([Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1 = -2$ và công sai $d = 3$. Tìm số hạng thứ 5 của cấp số cộng đó.],
  (
    $u_5 = 13$,
    $u_5 = -14$,
    $u_5 = 11$,
    True($u_5 = 10$)
  ),
  loigiai: [
    Số hạng tổng quát của cấp số cộng là: $u_n = u_1 + (n-1)d$. \
    Với $n = 5$, ta có: $u_5 = u_1 + 4d = -2 + 4 dot 3 = 10$. \
    Chọn *D*.
  ]
)

#tn([Trong các dãy số $(u_n)$ cho bởi số hạng tổng quát sau đây, dãy số nào là một cấp số cộng?],
  (
    True($u_n = 3n - 1$),
    $u_n = n^2 + 1$,
    $u_n = 2^n$,
    $u_n = 3/n$
  ),
  loigiai: [
    Xét dãy số $u_n = 3n - 1$, ta có: \
    $u_(n+1) - u_n = [3(n+1) - 1] - (3n - 1) = 3n + 2 - 3n + 1 = 3$ (hằng số). \
    Do hiệu hai số hạng liên tiếp luôn là một hằng số nên dãy số $u_n = 3n - 1$ là một cấp số cộng với công sai $d = 3$. \
    Chọn *A*.
  ]
)

#tn([Cho cấp số cộng $(u_n)$ có $u_1 = 5$ và công sai $d = -2$. Tính tổng 10 số hạng đầu tiên $S_(10)$ của cấp số cộng đã cho.],
  (
    $S_(10) = -20$,
    $S_(10) = 10$,
    True($S_(10) = -40$),
    $S_(10) = -80$
  ),
  loigiai: [
    Tổng $n$ số hạng đầu tiên của cấp số cộng được tính theo công thức: $S_n = n/2 [2u_1 + (n-1)d]$. \
    Với $n = 10$, ta có: \
    $S_(10) = 10/2 [2 dot 5 + 9 dot (-2)] = 5 dot (10 - 18) = 5 dot (-8) = -40$. \
    Chọn *C*.
  ]
)

#tn([Tìm giá trị của tham số $x$ để ba số $x - 1$, $x + 3$, $3x - 1$ theo thứ tự đó lập thành một cấp số cộng.],
  (
    $x = 2$,
    True($x = 4$),
    $x = 5$,
    $x = -4$
  ),
  loigiai: [
    Ba số $a, b, c$ theo thứ tự lập thành một cấp số cộng khi và chỉ khi $a + c = 2b$. \
    Áp dụng vào bài toán, ta có: \
    $(x - 1) + (3x - 1) = 2(x + 3)$ \
    $<=> 4x - 2 = 2x + 6$ \
    $<=> 2x = 8$ \
    $<=> x = 4$. \
    Chọn *B*.
  ]
)


#tn(
  [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1; 2]$ và có đồ thị như hình vẽ dưới đây:
  
  Giá trị nhỏ nhất của hàm số trên đoạn $[-1; 2]$ là:],
  ($-2$, $-1$, $1$, $2$),
  dap-an: "A",
  hinh: do-thi-ham(
      x => calc.pow(x, 3) - 3*x,
      w: 6cm,
      xmin: -2.5, xmax: 3, ymin: -3, ymax: 3,
      tu: -1, den: 2,
      mau: rgb("#0f812d"),
      ten: none,
      them: ctx => {
        giong(ctx, (-1, 2), mau-diem: rgb("#0f4c81"))
        giong(ctx, (1, -2), mau-diem: rgb("#a92693"))
        giong(ctx, (2, 2), mau-diem: rgb("#0f4c81"))
      }
    ),
  
  loi-giai: [
    Từ đồ thị của hàm số trên đoạn $[-1; 2]$, ta thấy điểm thấp nhất của đồ thị có tọa độ là $(1; -2)$. \
    Do đó, giá trị nhỏ nhất của hàm số trên đoạn $[-1; 2]$ là $m = -2$, đạt được tại $x = 1$. \
    Vậy $limits(min)_([-1; 2]) f(x) = -2$. \
    Chọn *A*.
  ],
)

#tn(
  [Cho hàm số $y = f(x)$ xác định và liên tục trên đoạn $[-1; 3]$, có bảng biến thiên như sau:
  #align(center)[
    #bbt(
      x: ($-1$, $1$, $3$),
      dau: ("", "+", "0", "-", ""),
      gia-tri: ($1$, $5$, $-2$),
      huong: ("len", "xuong"),
      rong-cot: 2.5cm, cao-bt: 2cm,
    )
  ]
  Giá trị lớn nhất của hàm số $y = f(x)$ trên đoạn $[-1; 3]$ bằng:],
  ($1$, $5$, $-2$, $3$),
  dap-an: "B",
  loi-giai: [
    Quan sát bảng biến thiên trên đoạn $[-1; 3]$, ta thấy hàm số đạt giá trị cao nhất bằng $5$ tại $x = 1$. \
    Vậy $limits(max)_([-1; 3]) f(x) = 5$. \
    Chọn *B*.
  ],
)

#tn(
  [Đường tiệm cận đứng của đồ thị hàm số $y = (2x - 1)/(x + 1)$ là:],
  ($x = 2$, $y = 2$, $x = -1$, $y = -1$),
  dap-an: "C",
  cot: 4,
  loi-giai: [
    Mẫu số bằng $0$ tại $x = -1$ và tử số khác $0$ tại đó. \
    Vậy $x = -1$ là tiệm cận đứng. \
    Chọn *C*.
  ],
)

// Trắc nghiệm có đồ thị: hinh: — phương án tự xếp cột theo bề rộng CỘT TRÁI.
#tn(
  [Cho hàm số bậc $4$ có đồ thị của đạo hàm như hình vẽ bên.
  Hàm số đồng biến trên khoảng nào dưới đây?],
  ($(1; 3)$, $(0; 4)$, $(-oo; 2)$, $(2; 4)$),
  dap-an: "D",
  hinh: ve-do-thi(x => -0.5 * x * (x - 2)*(x - 4),
    mau: blue, w: 6.5cm, xmin: -1.5, xmax: 5.5, ten: none,
    them: ctx => _nhan-giao-ox(ctx, (4,  2), auto)),
  loi-giai: [
    Trên khoảng $(2; 4)$ đồ thị đạo hàm nằm trên trục hoành nên đạo hàm nhận giá trị dương. \
    Vậy hàm số đồng biến trên $(2; 4)$. Chọn *D*.
  ],
)

#phan([PHẦN II. Câu trắc nghiệm đúng — sai], ngan: [Phần II])

#ds([Cho đồ thị hàm số $y = f(x)$ như các hình dưới. Xét tính đúng sai:], (
  True([Hình #box(do-thi-ham(x => x*x, w: 2.6cm, xmin: -1.4, xmax: 1.4, ymin: -0.3, ymax: 2)) là parabol.]),
  [Hình #box(do-thi-ham(x => x, w: 2.6cm, xmin: -1.4, xmax: 1.4, ymin: -1.6, ymax: 1.6)) là parabol.],
  True([Hàm $y = x^2$ đạt giá trị nhỏ nhất tại $x = 0$.]),
  [Hàm $y = x^2$ nghịch biến trên $RR$.]
),
  fig-giai: bbt-bac-hai(1, 0, 0),
  loigiai: [Từ BBT (hình bên): hàm giảm rồi tăng, cực tiểu tại $x = 0$. \ a) Đ — b) S — c) Đ — d) S.],
  )


#ds(
  [Cho hàm số $y = (2x - 1)/(x - 1)$. Xét tính đúng — sai của các mệnh đề:],
  (
    [Tập xác định của hàm số là $RR without {1}$.],
    [Hàm số nghịch biến trên từng khoảng xác định.],
    [Đồ thị hàm số có tiệm cận ngang $y = 2$.],
    [Đồ thị hàm số cắt trục hoành tại điểm có hoành độ $x = 2$.],
  ),
  dap-an: (true, true, true, false),
  o-tick: true,   // 2 ô Đ/S dóng thẳng sát lề phải; bỏ dòng này nếu không cần
  loi-giai: [
    $y' = (-1)/(x - 1)^2 < 0$ với mọi $x != 1$ nên b) đúng. \
    $lim_(x -> plus.minus oo) y = 2$ nên c) đúng. \
    $y = 0 <=> x = 1/2$ nên d) sai.
  ],
)

#phan([PHẦN III. Câu trắc nghiệm trả lời ngắn], ngan: [Phần III])

#tln([Tính diện tích hình phẳng giới hạn bởi $y = x^2$ và $y = x$ (đơn vị diện tích, làm tròn 2 chữ số).],
  [$0,17$],
  fig-giai: dien-tich-2-ham(x => x*x, g: x => x, w: 4.5cm),
  fig-giai-pos: "left",
  loigiai: [Miền tô như hình bên. \ $S = integral_0^1 (x - x^2) dif x = 1/2 - 1/3 = 1/6 approx 0,17$.],
  )


#tln(
  [Giá trị lớn nhất của hàm số $y = -x^3 + 3x$ trên đoạn $[0; 2]$ bằng bao nhiêu?],
  dap-an: $2$,
  loi-giai: [
    $y' = -3x^2 + 3 = 0 <=> x = 1 in [0; 2]$. \
    $y(0) = 0$, #h(0.6em) $y(1) = 2$, #h(0.6em) $y(2) = -2$. \
    Vậy giá trị lớn nhất bằng $2$.
  ],
)

// ============== 4 CÂU TLN CÓ HÌNH — HỌC CÁCH VẼ HÌNH + hinh: ==============
// 4 hình (hinh-be-ca, hinh-cong, hinh-phong-thi, hinh-cau-thang) được vẽ
// trong file image-12.typ (import ở đầu file) — dùng chung được cho mọi đề.

#tln(
  [Một cơ sở sản xuất làm những chiếc bể cá bằng thủy tinh có dạng một phần
  hình cầu (như hình vẽ bên). Biết mặt trong của bể là một phần mặt cầu có bán
  kính $2 "dm"$, khoảng cách từ tâm mặt cầu mặt trong đến mặt phẳng miệng bể
  là $1 "dm"$. Giả sử phần thành thủy tinh của bể có độ dày không đổi là
  $"0,3" "cm"$ và mặt cắt ở miệng bể được mài bằng phẳng. Tính thể tích thủy
  tinh cần sử dụng để làm một chiếc bể cá như vậy _(đơn vị: $"cm"^3$; không
  làm tròn các kết quả trung gian, chỉ làm tròn kết quả cuối cùng đến hàng
  đơn vị)_.],
  dap-an: [1145],
  hinh: hinh-be-ca,
  loi-giai: [
    Chỏm cầu bán kính $R$, cao $h$ có thể tích $V = pi h^2 (R - h/3)$;
    bể = khối cầu bớt đi chỏm phía trên miệng. \
    Lòng bể: $R = 2$, chỏm bỏ đi cao $h = 2 - 1 = 1$ nên
    $V_"trong" = 4/3 pi dot 2^3 - pi dot 1^2 (2 - 1/3) = 9 pi "dm"^3$. \
    Độ dày $"0,3" "cm" = "0,03" "dm"$: mặt ngoài có $R' = "2,03"$,
    chỏm bỏ đi cao $h' = "2,03" - 1 = "1,03"$. \
    $V_"ngoai" = 4/3 pi dot "2,03"^3 - pi dot "1,03"^2 ("2,03" - "1,03"/3)
    = "9,364518" pi "dm"^3$. \
    Vậy $V = V_"ngoai" - V_"trong" = "0,364518" pi "dm"^3
    = "364,518" pi "cm"^3 approx 1145 "cm"^3$.
  ],
)

#tln(
  [Một đoạn cống thoát nước hình trụ đặt nằm ngang có chiều dài $L = 25 "m"$
  và bán kính đáy $R = "1,2" "m"$. Sau một trận mưa lớn, mực nước trong cống
  dâng cao, điểm cao nhất của mặt nước cách điểm thấp nhất của đáy cống một
  khoảng $h = "0,6" "m"$. Tính thể tích nước hiện có trong đoạn cống đó
  _(đơn vị: $"m"^3$, làm tròn kết quả đến hàng phần mười)_.],
  dap-an: [22,1],
  hinh: hinh-cong,
  loi-giai: [
    Mặt cắt ướt là hình viên phân của đường tròn bán kính $R = "1,2"$,
    chiều cao nước $h = "0,6" = R/2$. \
    Khoảng cách từ tâm $O$ đến mặt nước: $d = R - h = "0,6"$, nên nửa góc ở
    tâm $alpha$ có $cos alpha = d/R = 1/2 => alpha = pi/3$. \
    Góc ở tâm chắn dây là $theta = 2 alpha = (2 pi)/3$. \
    Diện tích viên phân: $S = 1/2 R^2 (theta - sin theta)
    = 1/2 dot "1,44" ((2 pi)/3 - sqrt(3)/2)
    = "0,48" pi - "0,36" sqrt(3) "m"^2$. \
    Thể tích nước: $V = S dot L = 25 ("0,48" pi - "0,36" sqrt(3))
    = 12 pi - 9 sqrt(3) approx "22,1" "m"^3$.
  ],
)

#tln(
  [Có 11 thí sinh, mỗi thí sinh ngồi vào một ô trong phòng thi như hình vẽ
  bên. Giám thị có 4 mã đề khác nhau (giả sử số lượng đề mỗi mã là nhiều tùy
  ý). Số cách phát đề cho các thí sinh, mỗi thí sinh 1 đề sao cho 2 thí sinh
  ngồi ở 2 ô kề nhau (2 ô có chung một cạnh) thì khác mã đề là $p$.
  Tính $p/49$.],
  dap-an: [1764],
  hinh: hinh-phong-thi,
  loi-giai: [
    Bài toán là tô mỗi ô một trong 4 mã sao cho hai ô chung cạnh khác mã. \
    Với bảng $2 times n$: cặp ô ở cột đầu có $4 dot 3 = 12$ cách; mỗi cột kế
    tiếp có $12 - 3 - 3 + 1 = 7$ cách (trừ các trường hợp trùng ô cùng hàng
    của cột trước). Vậy bảng $2 times 3$ có $12 dot 7^2 = 588$ cách. \
    Phòng thi ghép từ hai bảng cỡ $2 times 3$: khối 3 hàng trên — 2 cột trái
    và khối 2 hàng dưới — 3 cột phải, chung nhau đúng MỘT ô (hàng 3, cột 2),
    ngoài ô chung không có cặp ô kề nào nối hai khối. \
    Do 4 mã bình đẳng, cố định mã ở ô chung thì mỗi khối còn $588/4 = 147$
    cách phát độc lập. \
    Vậy $p = 4 dot 147 dot 147 = 86436 => p/49 = 1764$.
  ],
)

#tln(
  [Một con châu chấu cần hoàn thành việc nhảy lên một cầu thang có 16 bậc.
  Biết rằng mỗi bước, con châu chấu chỉ có thể nhảy 1 bậc hoặc nhảy 2 bậc.
  Giả sử người ta liệt kê tất cả các cách khác nhau để con châu chấu hoàn
  thành 16 bậc thang này. Chọn ngẫu nhiên một cách nhảy từ danh sách vừa
  lập. Tính xác suất để cách được chọn không có bất kỳ hai lần nhảy 2 bậc
  nào diễn ra liên tiếp nhau _(kết quả làm tròn đến hàng phần trăm)_.],
  dap-an: [0,25],
  hinh: hinh-cau-thang,
  loi-giai: [
    Gọi $a_n$ là số cách nhảy hết $n$ bậc: bước cuối là 1 hoặc 2 bậc nên
    $a_n = a_(n-1) + a_(n-2)$ với $a_1 = 1, a_2 = 2$ (dãy Fibonacci). \
    Suy ra $a_16 = 1597$ — danh sách có 1597 cách. \
    Gọi $b_n$ là số cách KHÔNG có hai bước 2 liên tiếp. Nếu bước cuối là 1
    bậc: có $b_(n-1)$ cách; nếu bước cuối là 2 bậc thì bước liền trước buộc
    là 1 bậc: có $b_(n-3)$ cách. \
    Vậy $b_n = b_(n-1) + b_(n-3)$ với $b_1 = 1, b_2 = 2, b_3 = 3$: dãy
    $1, 2, 3, 4, 6, 9, 13, 19, 28, 41, 60, 88, 129, 189, 277, 406$. \
    Xác suất cần tính: $P = b_16/a_16 = 406/1597 approx "0,25"$.
  ],
)

#phan([PHẦN IV. Tự luận], ngan: [Phần IV])

#lt([Vẽ đồ thị hàm số $y = x^2 - 2x$.],
  fig-giai: do-thi-ham(x => x*x - 2*x, w: 4.5cm, xmin: -1, xmax: 3, ymin: -1.5, ymax: 3),
  loigiai: [Đỉnh $I(1; -1)$, cắt $O x$ tại $x = 0, x = 2$ (hình bên).],
  tieu-de: [Vẽ đồ thị trong lời giải]
  )


#tl(
  [Tìm $m$ để hàm số $y = x^3 - 3m x^2 + 4$ đạt cực đại tại $x = 0$.],
  diem: 2,
  cho-trong: 5cm,
  loi-giai: [
    $y' = 3x^2 - 6m x$, #h(0.6em) $y'' = 6x - 6m$. \
    Tại $x = 0$: $y'(0) = 0$ luôn đúng với mọi $m$. \
    Hàm đạt cực đại tại $x = 0$ khi $y''(0) < 0 <=> -6m < 0 <=> m > 0$. \
    Vậy $m > 0$.
  ],
)

#tl(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x)$ xác định trên $RR$. \
  a) Đồ thị $y = f'(x)$ như hình vẽ dưới. Tìm các khoảng đơn điệu và số điểm cực trị của hàm số $f(x)$.
  #align(center)[#ve-do-thi(x => 0.5 * (x + 1) * (x - 1) * (x - 2), mau: blue, ten: $y=f'(x)$,
    them: ctx => _nhan-giao-ox(ctx, (-1, 1, 2), auto))]
  b) Đồ thị $y = f'(x)$ như hình vẽ dưới. Xác định các khoảng đồng biến, nghịch biến và số điểm cực trị của hàm số $f(x)$.
  #align(center)[#ve-do-thi(x => 0.5 * (x - 2) * (x - 2) * (x + 1), mau: blue, ten: $y=f'(x)$,
    them: ctx => _nhan-giao-ox(ctx, (-1, 2), auto))]
  ],
  loi-giai: [
    #cot-item(
      so-cot: 1,
      [Dựa vào đồ thị, $f'(x) = 0 <=> x in {-1; 1; 2}$. \
      Đồ thị $f'(x)$ nằm phía trên trục hoành ($f'(x) > 0$) trên các khoảng $(-1; 1)$ và $(2; +oo)$ nên hàm số đồng biến. \
      Đồ thị $f'(x)$ nằm phía dưới trục hoành ($f'(x) < 0$) trên các khoảng $(-oo; -1)$ và $(1; 2)$ nên hàm số nghịch biến. \
      Vì đồ thị cắt xuyên qua trục hoành tại 3 điểm phân biệt nên $f'(x)$ đổi dấu 3 lần. Vậy hàm số có 3 điểm cực trị.],
      [Dựa vào đồ thị, $f'(x) = 0 <=> x = 2$ (đồ thị tiếp xúc) hoặc $x = -1$ (cắt xuyên). \
      $f'(x)$ không đổi dấu khi đi qua $x = 2$ và chỉ đổi dấu khi đi qua $x = -1$. \
      Vậy hàm số đồng biến trên khoảng $(-1; +oo)$, nghịch biến trên khoảng $(-oo; -1)$ và có đúng 1 điểm cực trị là $x = -1$.],
    )
  ],
)

#tl(
  [Cho hàm số $f(x)$ có đạo hàm $f'(x)$ xác định trên $RR$.
  #cot-item(
    [Đồ thị $y = f'(x)$ như hình vẽ dưới. Tìm các khoảng đơn điệu và số điểm cực trị của hàm số $f(x)$.
    #align(center)[#ve-do-thi(x => -0.8 * (x + 2) * (x + 1) * (x - 1), mau: blue, ten: $y=f'(x)$,
      them: ctx => _nhan-giao-ox(ctx, (-2, -1, 1), auto))]],
    [Đồ thị $y = f'(x)$ như hình vẽ dưới. Xác định các khoảng đồng biến, nghịch biến và số điểm cực trị của hàm số $f(x)$.
    #align(center)[#ve-do-thi(x => -0.8 * (x - 1) * (x - 1) * (x + 1), mau: blue, ten: $y=f'(x)$,
      them: ctx => _nhan-giao-ox(ctx, (-1, 1), auto))]]
  )
  ],
  loi-giai: [
    a) Dựa vào đồ thị, $f'(x) = 0 <=> x in {-2; -1; 1}$. \
    Đồ thị $f'(x)$ nằm phía trên trục hoành ($f'(x) > 0$) trên khoảng $(-oo; -2)$ và $(-1; 1)$ nên hàm số đồng biến. \
    Đồ thị $f'(x)$ nằm phía dưới trục hoành ($f'(x) < 0$) trên khoảng $(-2; -1)$ và $(1; +oo)$ nên hàm số nghịch biến. \
    Đồ thị cắt xuyên trục hoành tại 3 điểm phân biệt nên hàm số có 3 điểm cực trị. \
    b) Dựa vào đồ thị, $f'(x) = 0 <=> x = 1$ (tiếp xúc) hoặc $x = -1$ (cắt xuyên). \
    $f'(x)$ không đổi dấu khi qua $x = 1$ và chỉ đổi dấu khi qua $x = -1$. \
    Vậy hàm số đồng biến trên khoảng $(-oo; -1)$, nghịch biến trên khoảng $(-1; +oo)$ và có đúng 1 điểm cực trị là $x = -1$.
  ],
)


#tl(
  [Cho hàm số $y=a x^3+b x^2+c x+d$ có bảng biến thiên như hình vẽ dưới đây.
  #align(center)[#bbt(
    x: ($-oo$, $2$, $4$, $+oo$),
    dau: ("", "+", "0", "-", "0", "+", ""),
    gia-tri: ($-oo$, $25$, $21$, $+oo$),
    huong: ("len", "xuong", "len")
  )]
  a) Các khoảng đồng biến: ...... \
  b) Các khoảng nghịch biến: ...... \
  c) Hàm số đạt cực tiểu tại điểm ...... và giá trị cực tiểu bằng ...... \
  d) Hàm số đạt cực đại tại điểm ...... và giá trị cực đại bằng ......
  ],
  loi-giai: [Tự viết.],
)

// hinh: — hình HẸP tự vào cột phải (canh giữa dọc), đề + ý hỏi ở cột trái;
// nếu hình RỘNG (BBT, bảng...) sẽ tự tách dòng riêng canh giữa.
#tl(
  [Cho hàm số $y=a x^4+b x^2+c$ có đồ thị như hình vẽ bên. \
  a) Các khoảng đồng biến: ...... \
  b) Các khoảng nghịch biến: ...... \
  c) Hàm số đạt cực tiểu tại điểm ...... và giá trị cực tiểu bằng ...... \
  d) Hàm số đạt cực đại tại điểm ...... và giá trị cực đại bằng ......
  ],
  hinh: do-thi-trung-phuong(1, -4, 2, mau: purple, ten: none),
  loi-giai: [Tự viết.],
)

#tl(
  [
  #cot-item(
    [Tìm khoảng đơn điệu và cực trị của hàm số $y=x ln(x)$.],
    [Tìm khoảng đơn điệu và cực trị của hàm số $y=(x-4) ln(x-4)$.],
    [Tìm khoảng đơn điệu và cực trị của hàm số $y=(7-x) ln(7-x)$.]
  )
  ],
  loi-giai: [
    a) Hàm số nghịch biến trên khoảng $(0; 1/"e")$ và đồng biến trên khoảng $(1/"e"; +oo)$. \
    b) Hàm số nghịch biến trên khoảng $(4; 4+1/"e")$ và đồng biến trên khoảng $(4+1/"e"; +oo)$. \
    c) Hàm số nghịch biến trên khoảng $(-oo; 7-1/"e")$ và đồng biến trên khoảng $(7-1/"e"; 7)$.
  ],
)

#tl(
  [Cho hàm số $y = cos(2x) -2x$. Xét trên khoảng $(- (7 pi)/2; 4 pi)$.
  #cot-item(
    [Hàm số đã cho có bao nhiêu điểm cực đại?],
    [Hàm số đã cho có bao nhiêu điểm cực tiểu?],
    [Hàm số đã cho có bao nhiêu điểm cực trị?]
  )
  ],
  loi-giai: [
    Ta có đạo hàm $y' = -2 sin(2x) - 2$. \
    $y' = 0 <=> sin(2x) = -1 <=> 2x = - pi/2 + k 2 pi <=> x = - pi/4 + k pi$. \
    Tại các điểm này $y'$ không đổi dấu (do $sin(2x) >= -1 => y' <= 0$ với mọi $x$). \
    Do đó đây là các điểm uốn, không phải điểm cực trị. Hàm số không có điểm cực trị nào. \
    Vậy số điểm cực đại bằng 0, số điểm cực tiểu bằng 0, tổng số cực trị bằng 0.
  ],
)

#tl([
  Khảo sát sự biến thiên và vẽ đồ thị của các hàm số sau:
  #cot-item(
    [$y = (2x^3)/3 + 2x^2 + 8x + 3$],
    [$y = x^3/2 - (3x^2)/2 + (11x)/2 + 1$],
    [$y = - (5x^3)/9 - 4x$],
    [$y = x^3/9 + 5x - 3$],
    so-cot: 2,
    kieu-nhan: "a)"
  )
],
loi-giai: [
  *a) Khảo sát và vẽ đồ thị hàm số $y = (2x^3)/3 + 2x^2 + 8x + 3$* \
  - Tập xác định: $D = RR$. \
  - Giới hạn tại vô cực: \
    $limits(lim)_(x -> -oo) y = -oo$ \
    $limits(lim)_(x -> +oo) y = +oo$ \
  - Chiều biến thiên: \
    Ta có $y' = 2x^2 + 4x + 8 = 2(x + 1)^2 + 6 > 0, forall x in RR$. \
    Do đó, hàm số luôn đồng biến trên $RR$ và không có cực trị. \
  - Bảng biến thiên:
  #bbt-bac-ba(2/3, 2, 8, 3)
  - Đồ thị: \
    Điểm uốn $I(-1; -11/3)$. Đồ thị cắt trục tung tại $(0; 3)$. \
    #do-thi-bac-ba(2/3, 2, 8, 3)

  *b) Khảo sát và vẽ đồ thị hàm số $y = x^3/2 - (3x^2)/2 + (11x)/2 + 1$* \
  - Tập xác định: $D = RR$. \
  - Giới hạn tại vô cực: \
    $limits(lim)_(x -> -oo) y = -oo$ \
    $limits(lim)_(x -> +oo) y = +oo$ \
  - Chiều biến thiên: \
    Ta có $y' = (3x^2)/2 - 3x + 11/2 = 3/2(x - 1)^2 + 4 > 0, forall x in RR$. \
    Do đó, hàm số luôn đồng biến trên $RR$ và không có cực trị. \
  - Bảng biến thiên:
  #bbt-bac-ba(1/2, -3/2, 11/2, 1)
  - Đồ thị: \
    Điểm uốn $I(1; 11/2)$. Đồ thị cắt trục tung tại $(0; 1)$. \
    #do-thi-bac-ba(1/2, -3/2, 11/2, 1)

  *c) Khảo sát và vẽ đồ thị hàm số $y = - (5x^3)/9 - 4x$* \
  - Tập xác định: $D = RR$. \
  - Giới hạn tại vô cực: \
    $limits(lim)_(x -> -oo) y = +oo$ \
    $limits(lim)_(x -> +oo) y = -oo$ \
  - Chiều biến thiên: \
    Ta có $y' = - (5x^2)/3 - 4 < 0, forall x in RR$. \
    Do đó, hàm số luôn nghịch biến trên $RR$ và không có cực trị. \
  - Bảng biến thiên:
  #bbt-bac-ba(-5/9, 0, -4, 0)
  - Đồ thị: \
    Điểm uốn $I(0; 0)$. Đồ thị đi qua gốc tọa độ $O(0; 0)$. \
    #do-thi-bac-ba(-5/9, 0, -4, 0)

  *d) Khảo sát và vẽ đồ thị hàm số $y = x^3/9 + 5x - 3$* \
  - Tập xác định: $D = RR$. \
  - Giới hạn tại vô cực: \
    $limits(lim)_(x -> -oo) y = -oo$ \
    $limits(lim)_(x -> +oo) y = +oo$ \
  - Chiều biến thiên: \
    Ta có $y' = x^2/3 + 5 > 0, forall x in RR$. \
    Do đó, hàm số luôn đồng biến trên $RR$ và không có cực trị. \
  - Bảng biến thiên:
  #bbt-bac-ba(1/9, 0, 5, -3)
  - Đồ thị: \
    Điểm uốn $I(0; -3)$. Đồ thị cắt trục tung tại $(0; -3)$. \
    #do-thi-bac-ba(1/9, 0, 5, -3)
]
)

#tl([
  Khảo sát sự biến thiên và vẽ đồ thị của các hàm số sau:
  #cot-item(
    [a) $y = (4x^3)/3 - 4x^2 + 8x + 1$],
    [b) $y = (2x^3)/3 - 4x^2 + 17x - 4$],
    [c) $y = - (4x^3)/3 + 8x^2 - 12x + 2$],
    [d) $y = (2x^3)/3 - 2x - 3$],
    so-cot: 2
  )
],
loi-giai: [
  *a) Khảo sát và vẽ đồ thị hàm số $y = (4x^3)/3 - 4x^2 + 8x + 1$*
  
  - Tập xác định: $D = RR$.
  - Sự biến thiên:
    + Đạo hàm: $y' = 4x^2 - 8x + 8 = 4(x^2 - 2x + 2) = 4[(x - 1)^2 + 1] > 0, forall x in RR$.
    + Giới hạn: $lim_(x -> -oo) y = -oo$; $lim_(x -> +oo) y = +oo$.
    + Chiều biến thiên: Hàm số đồng biến trên khoảng $(-oo; +oo)$. Hàm số không có cực trị.
    + Bảng biến thiên:
    #bbt-bac-ba(4/3, -4, 8, 1)    
  - Đồ thị:
    + Đạo hàm cấp hai: $y'' = 8x - 8$; $y'' = 0 <=> x = 1 => y = 19/3$. Điểm uốn $I(1; 19/3)$.
    + Đồ thị cắt trục tung tại $(0; 1)$.
    #do-thi-bac-ba(4/3, -4, 8, 1)

  *b) Khảo sát và vẽ đồ thị hàm số $y = (2x^3)/3 - 4x^2 + 17x - 4$*
  
  - Tập xác định: $D = RR$.
  - Sự biến thiên:
    + Đạo hàm: $y' = 2x^2 - 8x + 17 = 2(x - 2)^2 + 9 > 0, forall x in RR$.
    + Giới hạn: $lim_(x -> -oo) y = -oo$; $lim_(x -> +oo) y = +oo$.
    + Chiều biến thiên: Hàm số đồng biến trên khoảng $(-oo; +oo)$. Hàm số không có cực trị.
    + Bảng biến thiên:
    #bbt-bac-ba(2/3, -4, 17, -4)
  - Đồ thị:
    + Điểm uốn $I(2; 58/3)$.
    + Đồ thị cắt trục tung tại $(0; -4)$.
    #do-thi-bac-ba(2/3, -4, 17, -4)

  *c) Khảo sát và vẽ đồ thị hàm số $y = - (4x^3)/3 + 8x^2 - 12x + 2$*
  
  - Tập xác định: $D = RR$.
  - Sự biến thiên:
    + Đạo hàm: $y' = -4x^2 + 16x - 12$.
    $y' = 0 <=> -4(x^2 - 4x + 3) = 0 <=> x = 1$ hoặc $x = 3$.
    + Giới hạn: $lim_(x -> -oo) y = +oo$; $lim_(x -> +oo) y = -oo$.
    + Chiều biến thiên:
      $y' > 0$ trên khoảng $(1; 3)$ nên hàm số đồng biến trên $(1; 3)$.
      $y' < 0$ trên các khoảng $(-oo; 1)$ và $(3; +oo)$ nên hàm số nghịch biến trên các khoảng đó.
    + Cực trị: Hàm số đạt cực tiểu tại $x = 1, y_("ct") = -10/3$; cực đại tại $x = 3, y_("cđ") = 2$.
    + Bảng biến thiên:
    #bbt-bac-ba(-4/3, 8, -12, 2)
  - Đồ thị:
    + Điểm uốn $I(2; -2/3)$.
    + Đồ thị cắt trục tung tại $(0; 2)$.
    #do-thi-bac-ba(-4/3, 8, -12, 2)

  *d) Khảo sát và vẽ đồ thị hàm số $y = (2x^3)/3 - 2x - 3$*
  
  - Tập xác định: $D = RR$.
  - Sự biến thiên:
    + Đạo hàm: $y' = 2x^2 - 2$.
    $y' = 0 <=> x^2 = 1 <=> x = 1$ hoặc $x = -1$.
    + Giới hạn: $lim_(x -> -oo) y = -oo$; $lim_(x -> +oo) y = +oo$.
    + Chiều biến thiên:
      $y' > 0$ trên các khoảng $(-oo; -1)$ và $(1; +oo)$ nên hàm số đồng biến trên các khoảng đó.
      $y' < 0$ trên khoảng $(-1; 1)$ nên hàm số nghịch biến trên $(-1; 1)$.
    + Cực trị: Hàm số đạt cực đại tại $x = -1, y_("cđ") = -5/3$; cực tiểu tại $x = 1, y_("ct") = -13/3$.
    + Bảng biến thiên:
    #bbt-bac-ba(2/3, 0, -2, -3)
    
  - Đồ thị:
    + Điểm uốn $I(0; -3)$.
    + Đồ thị cắt trục tung tại $(0; -3)$.
    #do-thi-bac-ba(2/3, 0, -2, -3)
])

#if ho-so == "beamer" { trang-cam-on() }
