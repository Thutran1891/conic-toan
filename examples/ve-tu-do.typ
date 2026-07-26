// =====================================================================
// ve-tu-do.typ — VÍ DỤ VẼ HÌNH TỰ DO với bộ lệnh mới (07/2026)
//   • cac-doan(...)  — nhiều nét trong MỘT lệnh (kiểu \draw của TikZ)
//   • duong(...)     — khai kiểu riêng cho từng nét
//   • cac-diem(...) — chấm + đặt tên nhiều điểm trong MỘT lệnh
//   • doan(..., ten:) — nhãn chú thích ngay trên đoạn
//   • KHÔNG cần truyền ctx trong thân #hinh(...) / them: ctx => ...
// Biên dịch:  typst compile ve-tu-do.typ
// =====================================================================
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.6cm)
#set text(size: 10.5pt, lang: "vi")
#set par(justify: true)

#align(center, text(size: 15pt, weight: "bold")[Vẽ hình tự do — ví dụ mẫu])
#v(6pt)

= 1. Tam giác: đường cao, trung tuyến, nhãn cạnh

Ba nét khác kiểu gộp trong một `cac-doan`; kích thước ghi thẳng lên cạnh bằng
`ten:` của `doan`.

#align(center, hinh(w: 8cm, xmin: -0.8, xmax: 7, ymin: -1, ymax: 5, ctx => {
  let (A, B, C) = ((0, 0), (6, 0), (1.6, 4))
  let H = hinh-chieu(C, A, B)     // chân đường cao
  let M = trung-diem(A, B)        // trung điểm AB
  cac-doan(
    duong(A, B, C, dong: true, day: 1.1pt),        // tam giác
    duong(C, H, mau: red, dut: true),              // đường cao
    duong(C, M, mau: blue, dut: true),             // trung tuyến
  )
  goc-vuong(H, C, A, r: 0.3)                     // ký hiệu vuông góc tại H
  doan(A, B, ten: [6 cm], tai: 0.78, huong: "below", cach: 5pt)
  doan(A, C, ten: $b$)
  doan(B, C, ten: $a$)
  cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "above"),
           (H, $H$, "below"), (M, $M$, "below"))
}))

= 2. Hình thang vuông có kích thước

#align(center, hinh(w: 8cm, xmin: -0.8, xmax: 7, ymin: -1.2, ymax: 4.5, ctx => {
  let (A, B, C, D) = ((0, 0), (6, 0), (4, 3.2), (0, 3.2))
  cac-doan(duong(A, B, C, D, dong: true, to: blue.lighten(90%), mau: blue, day: 1.1pt))
  goc-vuong(A, B, D, r: 0.3)                     // đỉnh A: góc giữa AB và AD
  doan(A, B, ten: [8 m], huong: "below", cach: 5pt)
  doan(D, C, ten: [5 m], huong: "above", cach: 5pt)
  doan(A, D, ten: [4 m])                    // đoạn dọc -> nhãn tự ra bên trái
  doan(B, C, ten: [cạnh xiên], ten-quay: true, cach: 5pt, mau-ten: gray.darken(20%))
  cac-diem((A, $A$, "below-left"), (B, $B$, "below-right"),
           (C, $C$, "right"), (D, $D$, "left"))
}))

= 3. Hình chóp S.ABCD — nét khuất đứt, đường cao và nhãn

Toàn bộ khung hình chỉ trong MỘT lệnh `cac-doan`.

#align(center, hinh(w: 8.5cm, xmin: -0.8, xmax: 8, ymin: -0.8, ymax: 7.5, ctx => {
  let (A, B, C, D) = ((2, 2), (0, 0), (5, 0), (7, 2))
  let S = (2, 7)
  let O = giao-duong-thang(A, C, B, D)     // tâm đáy
  cac-doan(
    duong(B, C, D, S, dong: true),                       // các cạnh nhìn thấy
    duong(A, B, dut: true), duong(A, D, dut: true),      // cạnh đáy khuất
    duong(A, S, dut: true),
    duong(S, O, mau: red, dut: true, ten: $h$, huong: "right", cach: 4pt),
    duong(S, C),
    day: 1.1pt,
  )
  cac-diem((A, $A$, "left"), (B, $B$, "below-left"), (C, $C$, "below"),
           (D, $D$, "right"), (S, $S$, "above"), (O, $O$, "below-right"))
}))

= 4. Hình hộp chữ nhật dựng bằng `cac-doan`

#align(center, hinh(w: 8.5cm, xmin: -0.8, xmax: 9, ymin: -0.8, ymax: 6, ctx => {
  let v = (1.6, 1.3)                          // vectơ chiều sâu
  let day-truoc = ((0, 0), (6, 0), (6, 3.4), (0, 3.4))
  let day-sau = day-truoc.map(P => tinh-tien-diem(P, v))
  let (A, B, C, D) = day-truoc
  let (A2, B2, C2, D2) = day-sau
  cac-doan(
    duong(A, B, C, D, dong: true),                       // mặt trước
    duong(B, B2), duong(C, C2), duong(D, D2),            // cạnh bên nhìn thấy
    duong(B2, C2), duong(C2, D2),                        // cạnh sau nhìn thấy
    duong(A, A2, dut: true), duong(A2, B2, dut: true), duong(A2, D2, dut: true),
    day: 1.05pt,
  )
  doan(A, B, ten: [a], huong: "below", cach: 5pt)
  doan(B, C, ten: [b], huong: "right", cach: 5pt)
  doan(C, C2, ten: [c], ten-quay: true, cach: 4pt)
  cac-diem(
    (A, $A$, "below-left"), (B, $B$, "below-right"), (C, $C$, "right"), (D, $D$, "left"),
    (A2, $A'$, "left"), (B2, $B'$, "below-right"), (C2, $C'$, "above-right"), (D2, $D'$, "above"),
  )
}))

= 5. Đường tròn: bán kính, dây cung, hai tiếp tuyến kẻ từ một điểm

#align(center, hinh(w: 8cm, xmin: -3.4, xmax: 5.5, ymin: -3.4, ymax: 3.6, ctx => {
  let O = (0, 0)
  let r = 2.6
  let M = (4.6, 0)                       // điểm ngoài đường tròn
  let (T1, T2) = tiep-diem(O, r, M)      // hai tiếp điểm
  let A = (r * calc.cos(133deg), r * calc.sin(133deg))
  let B = (r * calc.cos(238deg), r * calc.sin(238deg))
  duong-tron(O, r, mau: blue, day: 1.1pt)
  cac-doan(
    duong(M, T1), duong(M, T2),                          // hai tiếp tuyến
    duong(A, B, mau: green.darken(10%), ten: [dây cung], ten-quay: true, cach: 4pt),
    duong(O, T1, dut: true, mau: gray, ten: $R$),
    day: 1.05pt,
  )
  goc-vuong(T1, M, O, r: 0.28)                   // đỉnh T₁: tiếp tuyến ⊥ bán kính
  cac-diem(
    (O, $O$, "below-left"), (M, $M$, "right"), (T1, $T_1$, "above-right"),
    (T2, $T_2$, "below-right"), (A, $A$, "left"), (B, $B$, "below-left"),
  )
}))

= 6. Đồ thị hàm số: giao điểm và tiếp tuyến

`them:` của mọi đồ thị dựng sẵn cũng dùng được bộ lệnh mới.

#align(center, do-thi-bac-ba(1, 0, -3, 1, w: 9cm, cuc-tri: auto, them: ctx => {
  let f = x => x * x * x - 3 * x + 1
  let d = x => x + 1                     // đường thẳng y = x + 1
  ve-ham(d, mau: red)
  nhan((1.75, 2.9), $d: y = x + 1$, mau: red, huong: "left")
  for P in giao-ham(f, d, -3, 3) {
    diem(P, mau: red, bk: 2.2pt)
    doan((P.at(0), 0), P, dut: true, mau: gray)
  }
}))

Tiếp tuyến tại một điểm: `tiep-tuyen(f, x0)` — hệ số góc lấy bằng đạo hàm số
nên dùng được cho mọi hàm; `ten: auto` tự ghi phương trình tiếp tuyến.
```
tiep-tuyen(f, 1.5)                                        // tiếp tuyến tại x = 1,5
tiep-tuyen(f, 1.5, ten: auto, ten-diem: $M$, giong: true) // + phương trình + gióng trục
tiep-tuyen(f, (-1, 2), mau: green, dut: true)             // nhiều tiếp điểm một lệnh
tiep-tuyen(f, 0, dai: 1.4, ten: $Delta$)                  // đoạn ngắn quanh tiếp điểm
let k = dao-ham(f, 1.5)                                   // chỉ lấy hệ số góc

```

#align(center, do-thi-bac-ba(1, 0, -3, -1, w: 9cm, cuc-tri: none, 
them: ctx => {
  let f = x => x * x * x - 3 * x - 1
  tiep-tuyen(f, 1.5, ten: auto, ten-diem: $M$, giong: true)
  tiep-tuyen(f, -1, mau: green.darken(15%), dut: true, ten: [tiếp tuyến tại cực đại],
             tai: 0.12, ten-diem: $N$, huong-diem: "above-right")
}))

= 7. Bài toán thực tế: chiếc thang dựa tường

#align(center, hinh(w: 7.5cm, xmin: -1, xmax: 5.4, ymin: -1, ymax: 5.4, ctx => {
  let (O, A, B) = ((0, 0), (0, 4.4), (3, 0))     // tường, đỉnh thang, chân thang
  cac-doan(
    duong((0, 5.2), O, (5, 0), mau: gray.darken(25%), day: 2.2pt),  // tường + nền
    duong(A, B, mau: blue, day: 1.6pt, ten: [thang 5 m], ten-quay: true, cach: 6pt),
    duong(O, A, dut: true, ten: [h], huong: "left", cach: 11pt, mau-ten: red),
    duong(O, B, dut: true, ten: [3 m], huong: "below", cach: 5pt, mau-ten: red),
  )
  goc-vuong(O, A, B, r: 0.32)                    // đỉnh O: tường ⊥ nền
  goc(B, O, A, ten: $alpha$)
  cac-diem((O, $O$, "below-left"), (A, $A$, "left"), (B, $B$, "below-right"))
}))
