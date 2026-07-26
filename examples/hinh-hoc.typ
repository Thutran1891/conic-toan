// =====================================================================
// hinh-hoc.typ — TỔNG HỢP HÌNH ẢNH HÌNH HỌC (PHẲNG & KHÔNG GIAN)
// Gộp từ 4 file demo trong thư mục gốc TYPST BEAMER:
//   [A] thu-hinh-kho.typ   — 2 hình "khó" vẽ thuần bằng lib, KHÔNG CeTZ:
//                            (1) vùng phủ sóng 2 mặt cầu trên mặt đất,
//                            (2) miền (H) + bình thuỷ tinh tròn xoay.
//   [B] vi-du-ve-tu-do.typ — Vẽ hình tự do: điểm chia tỉ lệ, giao điểm
//                            (thẳng–thẳng, thẳng–cong, cong–cong,
//                            hình chiếu, giao 2 đường tròn) — dùng cho
//                            chóp/lăng trụ và đường tròn tự dựng.
//   [C] thu-ve-moi.typ     — Phần hình học: hệ toạ độ `oxyz` &
//                            `duong-gap-khuc` + biến hình quay/tịnh tiến.
//   [D] thu-truc-goc.typ   — Phần hình học: `oxyz` với vạch/số/lưới,
//                            góc thường (tô quạt + số đo).
//
// Biên dịch:  typst compile hinh-hoc.typ hinh-hoc.pdf
// =====================================================================
#import "../baigiang.typ": *

#set page(paper: "a4", margin: 1.4cm)
#set text(size: 11pt, lang: "vi")

#align(center)[
  #text(size: 16pt, weight: "bold")[TỔNG HỢP MINH HOẠ — HÌNH HỌC]
  #v(2pt)
  #text(size: 10pt, style: "italic")[
    Phẳng · Không gian · Oxyz — hình vẽ thuần Typst, không phụ thuộc CeTZ
  ]
]
#v(6pt)
#line(length: 100%)

// ----- MỤC LỤC (click để nhảy tới mục; số trang bên phải) -----
#outline(title: [Mục lục], depth: 2, indent: auto)

#pagebreak()


// =====================================================================
// §0. MINH HOẠ MỌI HÀM HÌNH HỌC DỰNG SẴN + CÁCH TUỲ BIẾN
// ---------------------------------------------------------------------
// TỔNG: 33 hàm dựng sẵn = 14 hình phẳng + 4 đường đặc biệt trong tam giác
//   + 13 hình khối + 2 hệ trục toạ độ (chưa kể ~15 hàm TIỆN ÍCH trả về
//   điểm/hàm: trong-tam, trung-diem, chia, hinh-chieu, tam-ngoai-tiep,
//   tam-noi-tiep, giao-duong-thang, giao-hai-duong-tron, tiep-diem,
//   ham-qua-2-diem, giao-ham, khoang-cach, ...).
//
// QUY ƯỚC TUỲ BIẾN (áp dụng CHUNG cho hầu hết hàm vẽ):
//   • mau       màu nét chính            • mau-phu  màu đường phụ (đỏ: đường
//   • day        độ dày nét (pt)            cao, trục, dấu vuông)
//   • dut: true  nét đứt (nét khuất)     • to        màu tô bên trong (2D)
//   • ten:       ĐỔI nhãn đỉnh — nhập tuple ĐÚNG THỨ TỰ, vd ten: ($M$,$N$,$P$);
//                đặt none để ẩn nhãn. Tên riêng: ten-tam, ten-chan, ten-dinh,
//                ten-bk, ten-goc, ten-trung-diem...
//   • w:         bề rộng khung của hàm TỰ tạo khung (3D, oxyz, luợng giác)
//   • them:      VẼ CHỒNG. Chóp/khối: them: (ctx, d) => ... với d là TỪ ĐIỂN
//                đỉnh (d.S, d.A, d.O...). oxyz: them: (ctx, t3) => ... với t3
//                đổi (x,y,z) → điểm 2D. Nhờ đó thêm điểm/đoạn/góc tuỳ ý.
//   • Bật/tắt chi tiết: duong-cao: "tam"|"dinh-a", duong-cheo: true,
//                trung-tuyen: true, truc: true, ban-kinh: true, don-vi,
//                vach, so, luoi. Kích thước khối: r, cao, dai, sau.
//
// HAI KIỂU GỌI:
//   (a) Hình PHẲNG nhận ctx + toạ độ toán (x,y), y hướng LÊN → đặt trong
//       #hinh(w:, xmin:, xmax:, ymin:, ymax:, ctx => { ... }); vẽ NHIỀU hàm
//       trong cùng một #hinh để CHỒNG lên nhau (vd tam giác + đường cao).
//   (b) Hình KHỐI, đường tròn lượng giác, truc-oxyz/oxyz TỰ tạo khung —
//       gọi thẳng, chỉ cần w: và các tuỳ chọn.
// =====================================================================

// Ô minh hoạ: hình ở trên, tên hàm (dạng mã) ở dưới.
#let _mh(cap, body) = block(
  width: 100%, inset: 4pt, radius: 3pt, breakable: false,
  stroke: 0.3pt + luma(78%),
  align(center + horizon, {
    body
    v(3pt)
    set text(size: 7.3pt)
    raw(cap)
  }),
)
#let _luoi(..cells) = grid(columns: (1fr, 1fr, 1fr), gutter: 5pt, ..cells)

= §0.1 Hình phẳng dựng sẵn (14 hàm) + 4 đường đặc biệt trong tam giác

#_luoi(
  _mh("tam-giac(ctx, A,B,C)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.6, ymin: -0.4, ymax: 3.0,
      ctx => tam-giac(ctx, (0,0), (3.2,0.3), (1.0,2.6)))),
  _mh("tam-giac-deu(ctx, A, canh)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 3.0,
      ctx => tam-giac-deu(ctx, (0,0), 3))),
  _mh("tam-giac-vuong(ctx, A, a, b)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 2.6,
      ctx => tam-giac-vuong(ctx, (0,0), 3, 2.2))),
  _mh("tam-giac-can(ctx, A, day, cao)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 2.8,
      ctx => tam-giac-can(ctx, (0,0), 3, 2.4))),
  _mh("tam-giac-vuong-can(ctx, A, canh)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 2.9, ymin: -0.4, ymax: 2.9,
      ctx => tam-giac-vuong-can(ctx, (0,0), 2.5))),
  _mh("tu-giac(ctx, A,B,C,D)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.6, ymin: -0.4, ymax: 3.0,
      ctx => tu-giac(ctx, (0,0), (3.2,0.4), (2.6,2.6), (0.4,2.2)))),
  _mh("hinh-binh-hanh(ctx, A,B,C)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 4.4, ymin: -0.4, ymax: 2.6,
      ctx => hinh-binh-hanh(ctx, (0,0), (2.8,0), (3.8,2.1)))),
  _mh("hinh-chu-nhat(ctx, A, rong, cao)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.6, ymin: -0.4, ymax: 2.6,
      ctx => hinh-chu-nhat(ctx, (0,0), 3.2, 2.0))),
  _mh("hinh-thang(ctx, A, a, b, cao)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.8, ymin: -0.4, ymax: 2.6,
      ctx => hinh-thang(ctx, (0,0), 3.4, 1.8, 2.0, lech: 0.7))),
  _mh("duong-tron-ngoai-tiep(ctx, A,B,C)",
    hinh(w: 3.2cm, xmin: -2.0, xmax: 2.0, ymin: -1.8, ymax: 2.0,
      ctx => { let A=(0,1.6); let B=(-1.5,-0.9); let C=(1.5,-0.9)
        tam-giac(ctx, A, B, C); duong-tron-ngoai-tiep(ctx, A, B, C) })),
  _mh("duong-tron-noi-tiep(ctx, A,B,C, ban-kinh: true)",
    hinh(w: 3.2cm, xmin: -2.0, xmax: 2.0, ymin: -1.8, ymax: 2.0,
      ctx => { let A=(0,1.6); let B=(-1.5,-0.9); let C=(1.5,-0.9)
        tam-giac(ctx, A, B, C); duong-tron-noi-tiep(ctx, A, B, C, ban-kinh: true) })),
  _mh("tiep-tuyen-tu-diem(ctx, O, r, M)",
    hinh(w: 3.2cm, xmin: -1.6, xmax: 3.0, ymin: -1.6, ymax: 1.6,
      ctx => tiep-tuyen-tu-diem(ctx, (0,0), 1.2, (2.6,0.8)))),
  _mh("da-giac-ten(ctx, dinh, ten: ..., to: ...)",
    hinh(w: 3.2cm, xmin: -1.7, xmax: 1.7, ymin: -1.7, ymax: 1.8,
      ctx => da-giac-ten(ctx, ((0,1.5),(-1.4,0.5),(-0.9,-1.3),(0.9,-1.3),(1.4,0.5)),
        ten: ($A$,$B$,$C$,$D$,$E$), to: luma(94%)))),
  _mh("duong-tron-luong-giac(so-do: ...)",
    duong-tron-luong-giac(w: 3.4cm, so-do: 55deg)),
)

#v(6pt)
Bốn đường đặc biệt — vẽ CHỒNG lên tam giác (gọi nối tiếp trong cùng `#hinh`):
#v(3pt)
#_luoi(
  _mh("duong-cao(ctx, C, A, B)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 2.9,
      ctx => { let A=(0,0); let B=(3.1,0); let C=(1.0,2.6)
        tam-giac(ctx, A, B, C); duong-cao(ctx, C, A, B) })),
  _mh("trung-tuyen(ctx, C, A, B)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 2.9,
      ctx => { let A=(0,0); let B=(3.1,0); let C=(1.0,2.6)
        tam-giac(ctx, A, B, C); trung-tuyen(ctx, C, A, B) })),
  _mh("phan-giac(ctx, A, B, C)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -0.4, ymax: 2.9,
      ctx => { let A=(0,0); let B=(3.1,0); let C=(1.0,2.6)
        tam-giac(ctx, A, B, C); phan-giac(ctx, A, B, C) })),
  _mh("trung-truc(ctx, A, B, dai: ...)",
    hinh(w: 3.2cm, xmin: -0.4, xmax: 3.4, ymin: -1.0, ymax: 2.9,
      ctx => { let A=(0,0); let B=(3.1,0); let C=(1.0,2.6)
        tam-giac(ctx, A, B, C); trung-truc(ctx, A, B, dai: 1.3) })),
)

#pagebreak()
= §0.2 Hình không gian dựng sẵn (13 hàm — mỗi hàm TỰ tạo khung, gọi thẳng)

#_luoi(
  _mh("hinh-chop-tam-giac(duong-cao: \"tam\")",
    hinh-chop-tam-giac(w: 3.3cm, duong-cao: "tam")),
  _mh("hinh-chop-tu-giac-thuong(duong-cao: \"tam\", duong-cheo: true)",
    hinh-chop-tu-giac-thuong(w: 3.4cm)),
  _mh("hinh-chop-day-hinh-thang(duong-cao: \"tam\", duong-cheo: true)",
    hinh-chop-day-hinh-thang(w: 3.4cm)),
  _mh("hinh-chop-tam-giac-deu(trung-tuyen: true)",
    hinh-chop-tam-giac-deu(w: 3.3cm, trung-tuyen: true)),
  _mh("hinh-chop-tu-giac-deu()",
    hinh-chop-tu-giac-deu(w: 3.4cm)),
  _mh("hinh-chop-tam-dien-vuong()",
    hinh-chop-tam-dien-vuong(w: 3.2cm)),
  _mh("hinh-chop-day-tam-giac-vuong()",
    hinh-chop-day-tam-giac-vuong(w: 3.3cm)),
  _mh("hinh-chop-day-chu-nhat(duong-cheo: true)",
    hinh-chop-day-chu-nhat(w: 3.4cm, duong-cheo: true)),
  _mh("hinh-hop(duong-cheo: true)",
    hinh-hop(w: 3.4cm, duong-cheo: true)),
  _mh("hinh-hop-chu-nhat(duong-cheo: true)",
    hinh-hop-chu-nhat(w: 3.4cm, duong-cheo: false)),
  _mh("hinh-lap-phuong()",
    hinh-lap-phuong(w: 3.2cm)),
  _mh("hinh-lang-tru-tam-giac()",
    hinh-lang-tru-tam-giac(w: 3.2cm)),
  _mh("hinh-non()",
    hinh-non(w: 2.9cm)),
  _mh("hinh-tru()",
    hinh-tru(w: 2.9cm)),
  _mh("hinh-cau()",
    hinh-cau(w: 2.9cm)),
)

#v(6pt)
= §0.3 Hệ trục toạ độ (2 hàm)

#grid(columns: (1fr, 1fr), gutter: 6pt,
  _mh("truc-oxyz(don-vi: true) — minh hoạ (không tỉ lệ)",
    truc-oxyz(w: 4.2cm, don-vi: true)),
  _mh("oxyz(vach, so, luoi, them: (ctx,t3)=>...) — toạ độ THẬT",
    oxyz(w: 5.0cm, x: 3, y: 4, z: 3, vach: true, so: true, luoi: ("xy",),
      them: (ctx, t3) => {
        giong-oxyz(ctx, t3, (2, 3, 2))
        diem-oxyz(ctx, t3, (2, 3, 2), ten: $M(2;3;2)$, huong: "above")
      })),
)

#pagebreak()
// =====================================================================
= A. HAI HÌNH KHÓ VẼ THUẦN BẰNG LIB (thu-hinh-kho.typ)
// =====================================================================

== A.1 Vùng phủ sóng của 2 mặt cầu trên mặt đất
// Ý tưởng: mặt cầu = đường tròn NÉT ĐỨT; vùng phủ trên mặt đất = ELIP
// tô trong suốt (phối cảnh); mặt đất = hình bình hành.
// Giao 2 elip đã giải trước: $A(0.617; 0.199)$, $B(0.617; -0.899)$.

#let I1 = (-1.6, -0.35)
#let I2 = (2.0, -0.35)
#let O1 = (-1.6, 0.45)
#let O2 = (2.0, 0.35)
#let A-hk = (0.617, 0.199)
#let B-hk = (0.617, -0.899)

#hinh(w: 12.5cm, xmin: -6.3, xmax: 6.5, ymin: -3.3, ymax: 3.5, ctx => {
  // mặt đất: hình bình hành tô xám nhạt
  da-giac(ctx, ((-5.9, -2.5), (3.8, -2.5), (6.2, 1.6), (-3.5, 1.6)),
    mau: luma(45%), day: 0.7pt, to: luma(96%))
  nhan(ctx, (-3.7, -2.1), text(fill: luma(35%))[Mặt đất $(O x y)$], huong: "right")

  // vùng phủ sóng: 2 elip tô trong suốt (vẽ TRƯỚC để nét khác đè lên)
  elip(ctx, I1, 2.6, 1.05, mau: red, day: 1.1pt, to: rgb(255, 90, 90, 80))
  elip(ctx, I2, 1.9, 0.8, mau: blue, day: 1.1pt, to: rgb(80, 130, 255, 70))

  // 2 mặt cầu: đường tròn nét đứt
  duong-tron(ctx, O1, 2.75, mau: red, day: 0.9pt, dut: true)
  duong-tron(ctx, O2, 2.15, mau: blue, day: 0.9pt, dut: true)
  nhan(ctx, (-3.95, 2.5), $(S_1)$, huong: "left")
  nhan(ctx, (4.0, 1.95), $(S_2)$, huong: "right")

  // trục nối tâm chiếu xuống đất + đoạn thẳng phụ màu xám
  doan(ctx, I1, (4.6, -0.35), day: 1pt, dut: true)
  doan(ctx, O1, I1, mau: luma(40%), day: 0.7pt, dut: true)
  doan(ctx, O2, I2, mau: luma(40%), day: 0.7pt, dut: true)
  doan(ctx, I1, A-hk, mau: luma(60%), day: 0.7pt)
  doan(ctx, I1, B-hk, mau: luma(60%), day: 0.7pt)
  doan(ctx, I2, A-hk, mau: luma(60%), day: 0.7pt)
  doan(ctx, I2, B-hk, mau: luma(60%), day: 0.7pt)
  doan(ctx, A-hk, B-hk, mau: luma(40%), day: 0.8pt, dut: true)

  // điểm + nhãn
  diem(ctx, O1, ten: $O_1$, huong: "above")
  diem(ctx, O2, ten: $O_2$, huong: "above")
  diem(ctx, I1, ten: $I_1$, huong: "below")
  diem(ctx, I2, ten: $I_2$, huong: "below")
  diem(ctx, A-hk, ten: $A$, huong: "above")
  diem(ctx, B-hk, ten: $B$, huong: "below")
})

#v(1cm)

== A.2 Miền $(H)$ + Bình thuỷ tinh tròn xoay quanh $O x$
// A.2a — miền $(H)$: đường cong BẬC BA dựng qua 4 ràng buộc
//   $f(0) = 1.6$ (M), đỉnh $(1.2; 2.1)$, $f(4) = 0.85$ (P).
// A.2b — bình tròn xoay = miền $(H)$ quay quanh $A B equiv O x$;
//   thiết diện tròn: nửa TRÁI liền, nửa PHẢI (khuất) NÉT ĐỨT.

// ---------------------------------------------------------------
// HÌNH 2a — miền (H): đường cong là BẬC BA dựng sẵn qua 4 ràng buộc
//   f(0)=1.6 (M), đỉnh (1.2; 2.1), f(4)=0.85 (P)  →  hệ số giải trước
// ---------------------------------------------------------------
#let f = x => 0.046946 * calc.pow(x, 3) - 0.459892 * calc.pow(x, 2) + 0.900935 * x + 1.6

#let hinh-H = hinh(w: 6.6cm, xmin: -0.9, xmax: 5.0, ymin: -0.9, ymax: 3.1, ctx => {
  // miền (H): tô giữa đường cong và AB
  to-vung(ctx, f, 0, 4, mau: luma(90%))
  nhan(ctx, (1.05, 0.95), $(H)$)

  // khung chữ nhật ABCD — phần không thuộc biên (H) nét đứt xám
  // (lưu ý: dut của duong-cong là cho ĐƯỜNG CONG nhiều mẫu;
  //  đoạn thẳng rời phải vẽ từng doan một)
  doan(ctx, (0, 1.6), (0, 2.35), mau: luma(55%), day: 0.7pt, dut: true)
  doan(ctx, (0, 2.35), (4, 2.35), mau: luma(55%), day: 0.7pt, dut: true)
  doan(ctx, (4, 2.35), (4, 0.85), mau: luma(55%), day: 0.7pt, dut: true)
  // đường gióng
  doan(ctx, (1.2, 0), (1.2, f(1.2)), mau: luma(55%), day: 0.7pt, dut: true)
  doan(ctx, (2.5, 0), (2.5, f(2.5)), mau: luma(55%), day: 0.7pt, dut: true)

  // biên của (H): đáy AB, hai mép đứng, đường cong M→N→P
  doan(ctx, (0, 0), (4, 0), day: 1.3pt)
  doan(ctx, (0, 0), (0, 1.6), day: 1.3pt)
  doan(ctx, (4, 0), (4, 0.85), day: 1.3pt)
  ve-ham(ctx, f, tu: 0, den: 4, mau: black, day: 1.3pt)

  // điểm + nhãn
  diem(ctx, (0, 0), ten: $A$, huong: "below-left")
  diem(ctx, (4, 0), ten: $B$, huong: "below-right")
  nhan(ctx, (4, 2.35), $C$, huong: "above-right")
  nhan(ctx, (0, 2.35), $D$, huong: "above-left")
  diem(ctx, (0, 1.6), ten: $M$, huong: "left")
  diem(ctx, (2.5, f(2.5)), ten: $N$, huong: "above-right")
  diem(ctx, (4, 0.85), ten: $P$, huong: "right")
  diem(ctx, (1.2, 0), ten: $I$, huong: "below")
  diem(ctx, (2.5, 0), ten: $E$, huong: "below")
})

// ---------------------------------------------------------------
// HÌNH 2b — bình tròn xoay = miền (H) quay quanh AB ≡ Ox
// ⇒ đường sinh CHÍNH LÀ f của hình 2a, vẽ y = ±f(x) trên [0, 4].
// Thiết diện tròn = elip dẹt: nửa TRÁI (hướng về mắt, cùng phía
// với đáy A đang nhìn thấy) nét LIỀN, nửa PHẢI (khuất) nét ĐỨT.
// ---------------------------------------------------------------
#let hinh-binh = hinh(w: 7.2cm, xmin: -1.1, xmax: 5.6, ymin: -2.4, ymax: 2.7, ctx => {
  // trục Ox nét đứt đỏ xuyên qua bình
  mui-ten(ctx, (-0.9, 0), (5.15, 0), mau: red, day: 0.8pt, dut: true)
  nhan(ctx, (5.1, 0), $x$, huong: "above")

  // thiết diện tròn: nửa trái liền + nửa phải đứt
  for x0 in (1.2, 2.4, 3.3) {
    cung-elip(ctx, (x0, 0), 0.2, f(x0), tu: 90deg, den: 270deg,
      mau: luma(60%), day: 0.8pt)
    cung-elip(ctx, (x0, 0), 0.2, f(x0), tu: -90deg, den: 90deg,
      mau: luma(60%), day: 0.8pt, dut: true)
  }

  // mặt ngoài: đường sinh y = ±f(x)
  ve-ham(ctx, f, tu: 0, den: 4, mau: black, day: 1.3pt)
  ve-ham(ctx, x => -f(x), tu: 0, den: 4, mau: black, day: 1.3pt)

  // đáy trái (tô xanh nhạt) + miệng phải
  elip(ctx, (0, 0), 0.26, f(0), day: 1pt, to: rgb(165, 208, 226, 150))
  elip(ctx, (4, 0), 0.16, f(4), day: 1pt)

  diem(ctx, (0, 0), ten: $A(0)$, huong: "above-right")
  diem(ctx, (4, 0), ten: $B(60)$, huong: "above-left")
})

// chú thích dài đặt NGOÀI khung hình (nhan trong khung sẽ bị bó bề rộng)
#grid(
  columns: (auto, auto), column-gutter: 1.2cm, align: bottom,
  hinh-H,
  stack(
    spacing: 8pt,
    hinh-binh,
    align(center, text(fill: blue)[Mặt ngoài bình thuỷ tinh khi quay quanh trục $O x$]),
  ),
)


#pagebreak()

// =====================================================================
= B. VẼ HÌNH TỰ DO — ĐIỂM CHIA & GIAO ĐIỂM (vi-du-ve-tu-do.typ)
// =====================================================================
// 3 nhóm công cụ TÍNH TOẠ ĐỘ (trả về điểm $(x, y)$, dùng với mọi hàm vẽ):
//   1. Trên đoạn thẳng   : `trung-diem(A, B)` | `chia(A, B, t)`
//   2. Thẳng — thẳng     : `giao-duong-thang(A, B, C, D)`
//   3. Thẳng/cong — cong : `giao-ham(f, g, tu, den)` — mảng giao điểm
// Có sẵn thêm: `hinh-chieu`, `giao-hai-duong-tron`, `tiep-diem`,
//              `tam-ngoai-tiep`, `tam-noi-tiep`.

== B.1 Điểm chia tỉ lệ + giao 2 đường thẳng
// Tam giác $A B C$; $M in B C$ với $B M = 1/3 B C$; $N$ trung điểm $A C$;
// $I = A M inter B N$.
#hinh(w: 8cm, xmin: -0.6, xmax: 6.2, ymin: -0.6, ymax: 3.9, ctx => {
  let A = (0.3, 0.2)
  let B = (5.6, 0.2)
  let C = (4.0, 3.4)

  let M = chia(B, C, 1 / 3)        // BM = (1/3)·BC (đi TỪ B ĐẾN C)
  let N = trung-diem(A, C)
  let I = giao-duong-thang(A, M, B, N)

  tam-giac(ctx, A, B, C)
  doan(ctx, A, M, mau: blue)
  doan(ctx, B, N, mau: green.darken(25%))
  diem(ctx, M, ten: $M$, huong: "phai", mau: blue)
  diem(ctx, N, ten: $N$, huong: "tren-trai", mau: green.darken(25%))
  diem(ctx, I, ten: $I$, huong: "tren-phai", bk: 2.2pt, mau: red)
})



== B.4 Chóp tứ giác $S.A B C D$ vẽ tự do
// Quy ước SGK: đỉnh khuất phía sau ($D$) → mọi nét dính $D$ vẽ ĐỨT.
// Đáy bình hành phối cảnh: chọn $A, B, C$ rồi lấy $D = A + C - B$.
// $O = A C inter B D$; $M$ trung điểm $S C$; $G = A M inter S O$
// (trọng tâm $triangle S A C$); $I = D G inter S B$.
#hinh(w: 8cm, xmin: -0.6, xmax: 6.0, ymin: -0.5, ymax: 5.2, ctx => {
  let A = (0, 0)
  let B = (4, 0)
  let C = (6, 2)
  let D = (A.at(0) + C.at(0) - B.at(0), A.at(1) + C.at(1) - B.at(1))
  let S = (3, 4.6)

  let O = giao-duong-thang(A, C, B, D)
  let M = trung-diem(S, C)
  let G = giao-duong-thang(A, M, S, O)
  let I = giao-duong-thang(D, G, S, B)

  // nét liền (mặt trước)
  doan(ctx, A, B)
  doan(ctx, B, C)
  doan(ctx, S, A)
  doan(ctx, S, B)
  doan(ctx, S, C)
  // nét khuất (dính đỉnh D) + 2 đường chéo đáy
  doan(ctx, A, D, dut: true)
  doan(ctx, D, C, dut: true)
  doan(ctx, S, D, dut: true)
  doan(ctx, A, C, day: 0.9pt, dut: true)
  doan(ctx, B, D, day: 0.9pt, dut: true)
  doan(ctx, D, I, dut: true)
  // 2 trung tuyến của tam giác SAC
  doan(ctx, S, O, mau: red, day: 0.9pt, dut: true)
  doan(ctx, A, M, mau: blue, day: 0.9pt, dut: true)

  diem(ctx, S, ten: $S$, huong: "tren")
  diem(ctx, A, ten: $A$, huong: "trai")
  diem(ctx, B, ten: $B$, huong: "duoi")
  diem(ctx, C, ten: $C$, huong: "phai")
  diem(ctx, D, ten: $D$, huong: "tren-trai")
  diem(ctx, O, ten: $O$, huong: "duoi-phai", bk: 1.6pt)
  diem(ctx, M, ten: $M$, huong: "phai", bk: 1.6pt, mau: blue)
  diem(ctx, G, ten: $G$, huong: "tren-trai", bk: 2.2pt, mau: red)
  diem(ctx, I, ten: $I$, huong: "right")
})

== B.5 Lăng trụ tam giác $A B C . A' B' C'$ vẽ tự do
// Đáy trên = đáy dưới tịnh tiến lên `cao` (lăng trụ đứng). Đỉnh khuất $C$ →
// $A C, B C, C C'$ nét đứt. $I = A' B inter A B'$; $N in C C'$ với
// $C N = 1/2 C C'$.
#hinh(w: 7cm, xmin: -0.6, xmax: 4.4, ymin: -0.5, ymax: 5.1, ctx => {
  let cao = 3.0
  let A = (0.0, 0.0)
  let B = (3.3, 0.0)
  let C = (2.35, 1.35)
  let A1 = (A.at(0), A.at(1) + cao)
  let B1 = (B.at(0), B.at(1) + cao)
  let C1 = (C.at(0), C.at(1) + cao)

  let I = giao-duong-thang(A1, B, A, B1)
  let N = chia(C, C1, 1 / 2)

  da-giac(ctx, (A1, B1, C1))
  doan(ctx, A, A1)
  doan(ctx, B, B1)
  doan(ctx, C, C1, dut: true)
  doan(ctx, A, B)
  doan(ctx, A, C, dut: true)
  doan(ctx, B, C, dut: true)
  doan(ctx, A1, B, mau: blue, day: 0.9pt)
  doan(ctx, A, B1, mau: blue, day: 0.9pt)

  diem(ctx, A, ten: $A$, huong: "duoi-trai")
  diem(ctx, B, ten: $B$, huong: "duoi-phai")
  diem(ctx, C, ten: $C$, huong: "phai")
  diem(ctx, A1, ten: $A'$, huong: "tren-trai")
  diem(ctx, B1, ten: $B'$, huong: "tren-phai")
  diem(ctx, C1, ten: $C'$, huong: "tren-phai")
  diem(ctx, I, ten: $I$, huong: "duoi-phai", bk: 2.2pt, mau: red)
  diem(ctx, N, ten: $N$, huong: "phai", bk: 2.2pt, mau: purple)
})

== B.6 Phối hợp: hình chiếu + 2 đường tròn
// $H$ là hình chiếu của $C$ trên $A B$; đường tròn tâm $O$ (trung điểm $A B$)
// bán kính $O A$ cắt đường tròn tâm $C$ bán kính $2$ tại $E, F$.
#hinh(w: 8cm, xmin: -0.8, xmax: 6.6, ymin: -2.2, ymax: 4.2, ctx => {
  let A = (0.0, 0.0)
  let B = (6.0, 0.6)
  let C = (3.4, 3.6)

  let H = hinh-chieu(C, A, B)
  let O = trung-diem(A, B)
  let r = khoang-cach(O, A)
  let (E, F) = giao-hai-duong-tron(O, r, C, 2.0)

  tam-giac(ctx, A, B, C)
  doan(ctx, C, H, mau: red, dut: true)
  goc-vuong(ctx, H, C, B, mau: red)
  duong-tron(ctx, O, r, mau: blue)
  duong-tron(ctx, C, 2.0, mau: orange)
  diem(ctx, H, ten: $H$, huong: "below", mau: red)
  diem(ctx, O, ten: $O$, huong: "duoi", bk: 1.6pt)
  diem(ctx, E, ten: $E$, huong: "trai", bk: 2.2pt, mau: purple)
  diem(ctx, F, ten: $F$, huong: "phai", bk: 2.2pt, mau: purple)
})


#pagebreak()

// =====================================================================
= C. OXYZ, ĐƯỜNG GẤP KHÚC & BIẾN HÌNH (thu-ve-moi.typ — phần hình học)
// =====================================================================

== C.1 Hệ trục toạ độ 3 trục vuông góc `oxyz`
#grid(
  columns: (1fr, 1fr), column-gutter: 10pt,
  // Điểm B(2; 4; 3) với hộp gióng nét đứt + lưới mặt (Oxy)
  figure(oxyz(x: 2, y: 4, z: 3, w: 7cm,
    luoi: "xy", vach: true, so: true,
    them: (ctx, t3) => {
      giong-oxyz(ctx, t3, (2, 4, 3), mau: blue)
      vecto-oxyz(ctx, t3, (0, 0, 0), (2, 4, 3),
        mau: red.darken(15%), day: 1.3pt)
      diem-oxyz(ctx, t3, (2, 4, 3), ten: $B$,
        huong: "right", mau: red.darken(15%))
    })),
  // Điểm E(5; -4; 3), lưới cả 3 mặt phẳng toạ độ
  figure(oxyz(x: 5, y: -4, z: 3, w: 6.4cm, luoi: true,
    them: (ctx, t3) => {
      giong-oxyz(ctx, t3, (5, -4, 3), mau: blue)
      vecto-oxyz(ctx, t3, (0, 0, 0), (5, -4, 3),
        mau: red.darken(15%), day: 1.3pt)
      diem-oxyz(ctx, t3, (5, -4, 3), ten: $E$,
        huong: "below-right", mau: red.darken(15%))
    })),
)

== C.2 Đường gấp khúc `duong-gap-khuc` — nét đứt THẬT từng đoạn
// `dut: true` với polyline ít đoạn: cắt đứt xen kẽ ĐÚNG từng đoạn.
// `dong: true` để khép kín thành đa giác.
#hinh(w: 8cm, xmin: -1, xmax: 6, ymin: -1, ymax: 4, ctx => {
  let (A, B, C, D) = ((0, 0), (1.5, 3), (3.5, 1), (5.5, 3.5))
  duong-gap-khuc(ctx, (A, B, C, D), mau: blue, day: 1pt)
  duong-gap-khuc(ctx, ((0, 2), (2, 0.5), (4, 3), (5.5, 0.5)),
    dut: true, mau: red)
  duong-gap-khuc(ctx, ((4.5, 0), (5.5, 1.5), (3.8, 2)),
    dong: true, mau: green.darken(25%))
  for (P, t) in ((A, $A$), (B, $B$), (C, $C$), (D, $D$)) {
    diem(ctx, P, ten: t, huong: "above")
  }
})

== C.3 Biến hình quay & tịnh tiến — `ctx-quay`, `ctx-tinh-tien`
// Vẽ 1 cụm hình (tam giác + đường tròn + nhãn) rồi lặp lại dưới:
//   (1) quay quanh gốc, (2) tịnh tiến, (3) quay rồi tịnh tiến.
// Ngoài ra: cung tròn/elip có tham số `quay:` (xoay quanh tâm).
#hinh(w: 12cm, xmin: -1, xmax: 8, ymin: -1, ymax: 4, ctx => {
  let ve-hinh = c => {
    tam-giac(c, (0, 0), (2, 0), (0.6, 1.6))
    duong-tron(c, (1, 0.55), 0.4, mau: blue)
    nhan(c, (1, 2), $M$, mau: blue)
  }
  ve-hinh(ctx)
  ve-hinh(ctx-quay(ctx, 35deg, tam: (0, 0)))
  ve-hinh(ctx-tinh-tien(ctx, (8, 1)))
  ve-hinh(ctx-tinh-tien(ctx-quay(ctx, 35deg, tam: (0, 0)), (4.5, 0.5)))
  cung(ctx, (6, 0.5), 0.8, tu: 0deg, den: 120deg, mau: red, quay: 30deg)
  cung-elip(ctx, (6, 0.5), 1.2, 0.5, tu: 0deg, den: 180deg,
    mau: green.darken(20%), quay: -20deg)
})


// =====================================================================
= D. OXYZ CÓ VẠCH/SỐ/LƯỚI & GÓC THƯỜNG (thu-truc-goc.typ — phần hình học)
// =====================================================================

== D.1 Oxyz: vạch chia + số trên trục + lưới mặt $(O x y)$
// $M(-2; -3; 3)$ + hộp gióng nét đứt + vectơ $arrow(O M)$ màu đỏ.
#oxyz(x: -2, y: -3, z: 3, vach: true, so: true, luoi: "xy",
  them: (ctx, t3) => {
    diem-oxyz(ctx, t3, (-2, -3, 3), ten: $M$,
      huong: "above-right", mau: red)
    giong-oxyz(ctx, t3, (-2, -3, 3))
    vecto-oxyz(ctx, t3, (0, 0, 0), (-2, -3, 3), mau: red)
  })

== D.2 Oxyz: vạch chia (không lưới) — $M(2; -4; 3)$
#oxyz(x: 2, y: -4, z: 3, vach: true,
  them: (ctx, t3) => {
    let M = (2, -4, 3)
    diem-oxyz(ctx, t3, M, ten: $M$, huong: "above-left", mau: red)
    giong-oxyz(ctx, t3, M)
    vecto-oxyz(ctx, t3, (0, 0, 0), M, mau: red)
  })

== D.3 Oxyz: lưới cả 3 mặt phẳng toạ độ
#oxyz(x: 2, y: 3, z: 2, luoi: true, vach: true, don-vi: false)

== D.4 Góc thường: tô quạt + tự ghi số đo (`so-do: true`)
// $goc(A, B, C)$ tô cam + tự ghi số đo; $goc(B, C, A)$ đặt tên $beta$
// với 2 cung; $goc(C, A, B)$ chỉ ghi số đo màu đỏ.
#hinh(w: 6cm, xmin: -0.5, xmax: 4, ymin: -0.5, ymax: 3, ctx => {
  let (A, B, C) = ((0, 0), (3.5, 0), (1.2, 2.4))
  da-giac(ctx, (A, B, C))
  diem(ctx, A, ten: $A$, huong: "duoi-trai")
  diem(ctx, B, ten: $B$, huong: "duoi-phai")
  diem(ctx, C, ten: $C$, huong: "tren")
  goc(ctx, A, B, C, to: rgb(255, 170, 0, 80), so-do: true)
  goc(ctx, B, C, A, r: 0.55, ten: $beta$, so-cung: 2,
    to: rgb(30, 100, 200, 50))
  goc(ctx, C, A, B, so-do: true, mau: red)
})
