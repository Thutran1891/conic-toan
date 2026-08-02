// =====================================================================
// main.typ — BÀI GIẢNG DEMO: trình diễn toàn bộ hệ thống
//
// MỘT FILE NGUỒN → 3 BẢN PDF:
//   typst compile main.typ                                   (trình chiếu 16:9)
//   typst compile --input ho-so=sach-dethi   main.typ sach-de.pdf
//   typst compile --input ho-so=sach-loigiai main.typ sach-loigiai.pdf
// (hoặc đổi trực tiếp giá trị mặc định #let ho-so ở dưới)
// =====================================================================
// #import "../baigiang.typ": *
#import "@local/conic-toan:0.2.0": * 

// ĐỔI 1 DÒNG NÀY để chọn kiểu xuất:
//   "beamer"        → trình chiếu 16:9 (mặc định)
//   "sach-dethi"    → sách A4: ví dụ hiện lời giải, 4 loại câu ẩn đáp án
//   "sach-loigiai"  → sách A4: hiện tất cả lời giải + đánh dấu đáp án
// (Hoặc không sửa file: typst compile --input ho-so=sach-dethi main.typ de.pdf)
#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#show: bai-giang.with(
  ho-so: ho-so,
  tieu-de: [HỆ THỐNG BÀI GIẢNG TOÁN THPT],
  phu-de: [Demo: đồ thị — bảng biến thiên — hình phẳng — hình không gian],
  gv: "Kim Thu",
  ngay: "Năm học 2026 – 2027",
)

// Mục lục điều hướng: tự liệt kê mọi slide, bấm vào tiêu đề để nhảy tới.
#muc-luc()

// ================= PHẦN 1: ĐỒ THỊ & BẢNG BIẾN THIÊN =================
#muc(ngan: [Phần 1])[Phần 1. Đồ thị & Bảng biến thiên]

#slide(tieu-de: [Hàm số bậc hai])[
  #chia-cot(
    figure(do-thi-bac-hai(1, -2, -1, ten: $y = x^2 - 2x - 1$)),
    [
      #dinh-nghia[
        Đồ thị hàm số $y = a x^2 + b x + c$ $(a != 0)$ là một parabol có đỉnh
        $I((-b) / (2a), (-Delta) / (4a))$.
      ]
      #bbt-bac-hai(a: 1, xd: $1$, yd: $-2$)
    ],
  )
]

#slide(tieu-de: [Hàm số bậc hai])[
  #chia-cot(
    figure(do-thi-bac-hai(1, -2, -1, ten: $y = x^2 - 2x - 1$)),
    [
      #dinh-nghia[
        Đồ thị hàm số $y = a x^2 + b x + c$ $(a != 0)$ là một parabol có đỉnh
        $I((-b) / (2a), (-Delta) / (4a))$.
      ]
      #tam-giac-vuong(ten:"A", "B", "c")
    ],
  )
]


#slide(tieu-de: [Hàm số bậc ba: $y = x^3 - 3x^2 + 2$])[
  #chia-cot(
    figure(do-thi-bac-ba(1, -3, 0, 2, ten: $y = x^3 - 3x^2 + 2$)),
    [
      Bảng biến thiên:
      #bbt(
        x: ($-oo$, $0$, $2$, $+oo$),
        dau: ("", "+", "0", "-", "0", "+", ""),
        gia-tri: ($-oo$, $2$, $-2$, $+oo$),
        huong: ("len", "xuong", "len"),
        ten-fp: $y'$, ten-f: $y$,
        rong-cot: 2.2cm, cao-bt: 2cm,
      )
      #ghi-nho[Hàm số đạt cực đại tại $x = 0$, cực tiểu tại $x = 2$.]
    ],
  )
]

#slide(tieu-de: [Hàm phân thức: $y = (2x - 1) / (x - 1)$])[
  #chia-cot(
    figure(do-thi-phan-thuc(2, -1, 1, -1, ten: $y = (2x-1)/(x-1)$)),
    [
      Tiệm cận đứng $x = 1$, tiệm cận ngang $y = 2$.
      #bbt-phan-thuc(x0: $1$, y0: $2$, dong-bien: false)
    ],
  )
]

#slide(tieu-de: [Hàm trùng phương & bảng biến thiên đặc biệt])[
  #chia-cot(
    figure(do-thi-trung-phuong(1, -2, 0, ten: $y = x^4 - 2x^2$)),
    bbt-trung-phuong(a: 1, x0: $1$, yc: $-1$, y0: $0$),
  )
]

#slide(tieu-de: [Hàm số mũ và lôgarit])[
  #chia-cot(
    figure(do-thi-mu(2, w: 6.4cm)),
    figure(do-thi-log(2, w: 6.4cm)),
  )
  #chu-y[Đồ thị $y = 2^x$ và $y = log_2 x$ đối xứng nhau qua đường thẳng $y = x$.]
]

#slide(tieu-de: [Hàm số lượng giác])[
  #figure(do-thi-sin(w: 12.5cm))
  #chia-cot(
    figure(do-thi-tan(w: 5.6cm)),
    [
      #tinh-chat[
        Hàm $y = sin x$ tuần hoàn chu kỳ $2pi$; hàm $y = tan x$ tuần hoàn
        chu kỳ $pi$, gián đoạn tại $x = pi/2 + k pi$.
      ]
    ],
  )
]

#slide(tieu-de: [Vẽ đồ thị chỉ với một dòng lệnh])[
  #chia-cot(
    figure(ve-do-thi(x => x * x * x - 3 * x, mau: purple, ten: $y = x^3 - 3x$, w: 6.8cm)),
    figure(ve-do-thi(x => calc.sin(2 * x) + x / 2, mau: red, ten: $y = sin 2x + x/2$, w: 6.8cm)),
  )
  #chu-y[`ve-do-thi(x => ..., mau: ...)` tự lấy mẫu và chọn cửa sổ nhìn hợp lý —
    chỉ cần nhập công thức và màu.]
]

#slide(tieu-de: [Bảng xét dấu])[
  Xét dấu $f(x) = x^2 - 3x + 2 = (x - 1)(x - 2)$:
  #xet-dau-tam-thuc(a: 1, x1: $1$, x2: $2$)
  Bảng xét dấu nhiều dòng cho $g(x) = ((x-1)(x-2)) / (x - 3)$:
  #bang-xet-dau(
    x: ($-oo$, $1$, $2$, $3$, $+oo$),
    dong: (
      ($x - 1$, ("", "-", "0", "+", "", "+", "", "+", "")),
      ($x - 2$, ("", "-", "", "-", "0", "+", "", "+", "")),
      ($x - 3$, ("", "-", "", "-", "", "-", "0", "+", "")),
      ($g(x)$, ("", "-", "0", "+", "0", "-", "||", "+", "")),
    ),
    rong-cot: 1.9cm,
  )
]

// ================= PHẦN 2: HÌNH HỌC PHẲNG =================
#muc(ngan: [Phần 2])[Phần 2. Hình học phẳng]

#slide(tieu-de: [Tam giác và các đường đặc biệt])[
  #chia-cot(
    figure(hinh(w: 6.8cm, xmin: -0.8, xmax: 6, ymin: -0.9, ymax: 4.6, ctx => {
      let A = (0.6, 0.2)
      let B = (5.4, 0.2)
      let C = (3.6, 4.0)
      tam-giac(ctx, A, B, C)
      duong-cao(ctx, C, A, B, ten-chan: $H$)
      trung-tuyen(ctx, A, B, C, ten-chan: $M$)
      phan-giac(ctx, B, C, A, ten-chan: $D$)
    })),
    [
      Trong tam giác $A B C$:
      - #text(fill: red)[Đường cao] $C H perp A B$;
      - #text(fill: blue)[Trung tuyến] $A M$ với $M$ là trung điểm $B C$;
      - #text(fill: green.darken(20%))[Phân giác] trong góc $B$.
    ],
  )
]

#slide(tieu-de: [Đường tròn ngoại tiếp — nội tiếp])[
  #chia-cot(
    figure(hinh(w: 6.2cm, xmin: -1.6, xmax: 6.4, ymin: -2.2, ymax: 5, ctx => {
      let A = (0.4, 0.0)
      let B = (5.2, 0.0)
      let C = (3.0, 4.2)
      tam-giac(ctx, A, B, C)
      duong-tron-ngoai-tiep(ctx, A, B, C)
      duong-tron-noi-tiep(ctx, A, B, C)
    })),
    figure(hinh(w: 6.6cm, xmin: -2.6, xmax: 6.2, ymin: -3, ymax: 3, ctx => {
      tiep-tuyen-tu-diem(ctx, (0, 0), 2, (5.2, 0))
    })),
  )
]

#slide(tieu-de: [Tam giác đặc biệt])[
  #chia-cot(
    figure(hinh(w: 4cm, xmin: -0.8, xmax: 4.5, ymin: -0.8, ymax: 4, ctx =>
      tam-giac-deu(ctx, (0.3, 0.3), 3.4))),
    figure(hinh(w: 4cm, xmin: -0.8, xmax: 4.5, ymin: -0.8, ymax: 4, ctx =>
      tam-giac-vuong(ctx, (0.4, 0.3), 3.6, 3))),
    figure(hinh(w: 4cm, xmin: -0.8, xmax: 4.5, ymin: -0.8, ymax: 4, ctx =>
      tam-giac-can(ctx, (0.3, 0.3), 3.4, 3.2))),
    figure(hinh(w: 4cm, xmin: -0.8, xmax: 4.5, ymin: -0.8, ymax: 4, ctx =>
      tam-giac-vuong-can(ctx, (0.5, 0.3), 3.1))),
  )
  #chia-cot(
    align(center)[Tam giác đều],
    align(center)[Vuông tại $A$],
    align(center)[Cân tại $C$],
    align(center)[Vuông cân tại $A$],
  )
]

#slide(tieu-de: [Đường tròn lượng giác])[
  #chia-cot(
    figure(duong-tron-luong-giac(so-do: 55deg)),
    [
      #dinh-nghia[
        Trên đường tròn lượng giác, điểm $M$ ứng với góc $alpha$ có toạ độ
        $M(cos alpha, sin alpha)$.
      ]
      #ghi-nho[$sin^2 alpha + cos^2 alpha = 1$]
    ],
  )
]

// ================= PHẦN 3: HÌNH HỌC KHÔNG GIAN =================
#muc(ngan: [Phần 3])[Phần 3. Hình học không gian]

#slide(tieu-de: [Hình chóp])[
  #chia-cot(
    figure(hinh-chop-tam-giac(duong-cao: "tam")),
    figure(hinh-chop-tu-giac(duong-cao: "tam", duong-cheo: true, them: (ctx, d) => {
      // vẽ thêm trung điểm M của SC
      let M = trung-diem(d.S, d.C)
      diem(ctx, M, ten: $M$, huong: "phai", mau: blue)
      doan(ctx, d.B, M, mau: blue, day: 1pt, dut: true)
    })),
  )
  Tham số `them` cho phép vẽ thêm điểm, đoạn, thiết diện lên hình có sẵn.
]

#slide(tieu-de: [Hình chóp đặc biệt])[
  #chia-cot(
    figure(hinh-chop-tam-giac-deu(w: 4.6cm, trung-tuyen: true)),
    figure(hinh-chop-tam-dien-vuong(w: 4.4cm)),
    figure(hinh-chop-day-tam-giac-vuong(w: 4.6cm)),
  )
  #chia-cot(
    align(center)[Chóp tam giác đều],
    align(center)[Tam diện vuông tại $O$],
    align(center)[$Delta A B C$ vuông tại $B$, $S A perp (A B C)$],
  )
]

#slide(tieu-de: [Chóp đều — chóp cạnh bên vuông góc đáy])[
  #chia-cot(
    figure(hinh-chop-tu-giac-deu(w: 6.4cm)),
    figure(hinh-chop-day-chu-nhat(w: 6.4cm)),
  )
  #chia-cot(
    align(center)[Chóp tứ giác đều: $S O perp (A B C D)$],
    align(center)[Đáy chữ nhật, $S A perp (A B C D)$],
  )
]

#slide(tieu-de: [Hình hộp — lăng trụ])[
  #chia-cot(
    figure(hinh-hop(duong-cheo: true)),
    figure(hinh-lang-tru-tam-giac()),
  )
]

#slide(tieu-de: [Khối tròn xoay])[
  #chia-cot(
    figure(hinh-non(w: 4.4cm)),
    figure(hinh-tru(w: 4.4cm)),
    figure(hinh-cau(w: 4.6cm)),
  )
  #tinh-chat[
    $V_"nón" = 1/3 pi r^2 h$; #h(1.2em) $V_"trụ" = pi r^2 h$; #h(1.2em)
    $V_"cầu" = 4/3 pi R^3$.
  ]
]

#slide(tieu-de: [Hệ trục toạ độ trong không gian])[
  #chia-cot(
    figure(truc-oxyz(don-vi: true)),
    [
      Trong không gian $O x y z$ với ba vectơ đơn vị
      $arrow(i), arrow(j), arrow(k)$:
      $ arrow(u) = (x; y; z) <=> arrow(u) = x arrow(i) + y arrow(j) + z arrow(k) $
    ],
  )
]

// ================= PHẦN 4: VÍ DỤ TỔNG HỢP =================
#muc(ngan: [Phần 4])[Phần 4. Ví dụ tổng hợp]

// Ví dụ khảo sát hiện dần từng bước giải:
// 1: đề — 2: tính y' — 3: bảng biến thiên — 4: đồ thị.
#slide(tieu-de: [Khảo sát hàm số], so-buoc: 4)[
  #vi-du[Khảo sát sự biến thiên và vẽ đồ thị hàm số $y = -x^3 + 3x$.]
  #chia-cot(
    [
      #lo(2)[
        #loi-giai[
          $y' = -3x^2 + 3 = 0 <=> x = plus.minus 1$.
        ]
      ]
      #lo(3)[
        #bbt(
          x: ($-oo$, $-1$, $1$, $+oo$),
          dau: ("", "-", "0", "+", "0", "-", ""),
          gia-tri: ($+oo$, $-2$, $2$, $-oo$),
          huong: ("xuong", "len", "xuong"),
          ten-fp: $y'$, ten-f: $y$,
          rong-cot: 2cm, cao-bt: 1.9cm,
        )
      ]
    ],
    lo(4, figure(do-thi-bac-ba(-1, 0, 3, 0, ten: $y = -x^3 + 3x$, w: 6.6cm))),
  )
]

// hien-dan: 4 bước lần lượt xuất hiện ở bước hoạt hình 2, 3, 4, 5;
// khung luyện tập chốt ở bước 6.
#slide(tieu-de: [Các bước khảo sát hàm số], so-buoc: 6)[
  #buoc(
    hien-dan: true,
    [Tìm tập xác định của hàm số.],
    [Tính $y'$, tìm nghiệm của $y' = 0$ và các điểm không xác định.],
    [Lập bảng biến thiên, kết luận chiều biến thiên và cực trị.],
    [Tìm giới hạn tại vô cực, tiệm cận (nếu có) và vẽ đồ thị.],
  )
  #lo(6)[#luyen-tap[Khảo sát và vẽ đồ thị hàm số $y = (x + 1) / (x - 2)$.]]
]

// ================= PHẦN 5: CÂU HỎI ĐỊNH DẠNG ĐỀ THI 2025 =================
#muc(ngan: [Phần 5])[Phần 5. Câu hỏi kiểm tra]

// Bản trình chiếu: bật hiện đáp án (bản giáo viên). Bản in A4 do hồ sơ
// tự quyết định (sach-dethi ẩn, sach-loigiai hiện) nên KHÔNG ép ở đây.
#if ho-so == "beamer" { bat-dap-an() }

// Nhịp hoạt hình 5 bước — mỗi câu luôn HIỆN ĐỀ TRƯỚC, LỘ ĐÁP ÁN SAU:
// 1: đề câu 1 → 2: đáp án + lời giải câu 1 → 3: đề câu 2
// → 4: đáp án + lời giải câu 2 → 5: khung công thức.
#slide(tieu-de: [Trắc nghiệm nhiều phương án (MC)], so-buoc: 5)[
  #cau-mc(
    [Hàm số $y = x^3 - 3x^2 + 2$ đạt cực tiểu tại điểm nào sau đây?],
    ($x = 0$, $x = 2$, $x = -2$, $x = 1$),
    dap-an: "B",
    cot: 4,
    lo-da: 2,
    loi-giai: [$y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$; $y'$ đổi dấu
      từ $-$ sang $+$ khi qua $x = 2$ nên hàm đạt cực tiểu tại $x = 2$.],
  )
  #lo(3)[
    #cau-mc(
      [Tiệm cận ngang của đồ thị hàm số $y = (2x - 1)/(x - 1)$ là đường thẳng:],
      ($y = 1$, $x = 1$, $y = 2$, $x = 2$),
      dap-an: "C",
      cot: 4,
      lo-da: 4,
      loi-giai: [$lim_(x -> plus.minus oo) y = 2$ nên $y = 2$ là tiệm cận ngang.],
    )
  ]
  #lo(5)[
    #cong-thuc[
      Hàm $y = (a x + b)/(c x + d)$ có tiệm cận đứng $x = -d/c$ và
      tiệm cận ngang $y = a/c$.
    ]
  ]
]

// TF: đề ở bước 1, đáp án Đ/S lộ ở bước 2; câu SA hiện ở bước 3,
// đáp án SA lộ ở bước 4.
#slide(tieu-de: [Đúng — Sai (TF) và trả lời ngắn (SA)], so-buoc: 4)[
  #cau-tf(
    [Cho hàm số $y = (2x - 1)/(x - 1)$. Xét tính đúng — sai của các mệnh đề:],
    (
      [Tập xác định của hàm số là $RR without {1}$.],
      [Hàm số nghịch biến trên từng khoảng xác định.],
      [Đồ thị hàm số có tiệm cận ngang $y = 2$.],
      [Đồ thị hàm số cắt trục hoành tại điểm có hoành độ $x = 2$.],
    ),
    dap-an: (true, true, true, false),
    lo-da: 2,
    loi-giai: [Ý d) sai vì $y = 0 <=> x = 1/2$, đồ thị cắt trục hoành tại $x = 1/2$.],
  )
  #lo(3)[
    #cau-sa(
      [Giá trị lớn nhất của hàm số $y = -x^3 + 3x$ trên đoạn $[0; 2]$ bằng bao nhiêu?],
      dap-an: $2$,
      lo-da: 4,
      loi-giai: [$y' = -3x^2 + 3 = 0 <=> x = 1 in [0; 2]$;
        $y(0) = 0$, $y(1) = 2$, $y(2) = -2$. Vậy $max = 2$.],
    )
  ]
]

#slide(tieu-de: [Tự luận (TL)], so-buoc: 2)[
  #cau-tl(
    [Tìm $m$ để hàm số $y = x^3 - 3m x^2 + 4$ đạt cực đại tại $x = 0$.],
    diem: 2,
    lo-da: 2,
    loi-giai: [
      $y' = 3x^2 - 6m x$, $y'' = 6x - 6m$. Hàm đạt cực đại tại $x = 0$ khi
      $y'(0) = 0$ (luôn đúng) và $y''(0) < 0 <=> -6m < 0 <=> m > 0$.
    ],
  )
]

#trang-cam-on()
