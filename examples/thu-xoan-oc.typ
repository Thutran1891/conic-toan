// Thử xoan-oc + goc-luong-giac (07/2026).
#import "../baigiang.typ": *
#set page(width: 17cm, height: 22cm, margin: 10pt)
#set text(font: ("Libertinus Serif", "Noto Serif"), size: 11pt)

*1) Góc lượng giác kiểu SGK 11* — $hat(A O M) = 70°$, $(O A, O M) = -430°$

#grid(columns: (1fr, 1fr, 1fr),
hinh(xmin: -1.6, xmax: 2.6, ymin: -2.2, ymax: 1.6, w: 5cm, ctx => {
  let O = (0, 0)
  let A = (2.2, 0)
  let M = toa-cuc(O, 2.2, -70)
  cac-doan(  (O, A), (O, M))
  cac-diem(  (O, $O$, "above-left"), (A, $A$, "above"), (M, $M$, "right"))
  goc-luong-giac(  O, A, M, chieu: "am", vong: 2)
}),
hinh(xmin: -2.6, xmax: 2.6, ymin: -2.6, ymax: 2.2, w: 5cm, ctx => {
  let O = (0, 0)
  let A = (2.2, 0)
  let M = toa-cuc(O, 2.2, 115)
  cac-doan(  (O, A), (O, M))
  cac-diem(  (O, $O$, "below"), (A, $A$, "below"), (M, $M$, "above-left"))
  goc-luong-giac(  O, A, M, chieu: "am", vong: 2)
}),
hinh(xmin: -1.6, xmax: 2.6, ymin: -1.2, ymax: 2.6, w: 5cm, ctx => {
  let O = (0, 0)
  let A = (2.2, 0)
  let M = toa-cuc(O, 2.2, 65)
  cac-doan(  (O, A), (O, M))
  cac-diem(  (O, $O$, "below-left"), (A, $A$, "below"), (M, $M$, "above"))
  goc-luong-giac(  O, A, M, vong: 1, so-do: true, huong: "above-right")
})
)

*2) xoan-oc thuần: đổi bước, chiều, hai đầu mũi tên, nét đứt*

#grid(columns: (1fr, 1fr, 1fr),
hinh(xmin: -3, xmax: 3, ymin: -3, ymax: 3, w: 5cm, ctx => {
  xoan-oc(  (0, 0), tu: 0deg, den: 1080deg, r: 0.1, buoc: 0.85, mau: blue)
  diem(  (0, 0), ten: $O$, huong: "below-left")
}),
hinh(xmin: -3, xmax: 3, ymin: -3, ymax: 3, w: 5cm, ctx => {
  xoan-oc(  (0, 0), tu: 90deg, den: -900deg, r: 2.6, r-cuoi: 0.2,
            mau: red, day: 1.2pt, mui-ten: "ca-hai")
}),
hinh(xmin: -3, xmax: 3, ymin: -3, ymax: 3, w: 5cm, ctx => {
  xoan-oc(  (0, 0), tu: 0deg, den: 720deg, r: 0.4, buoc: 1.1,
            mau: green.darken(30%), dut: true, ten: [xoắn ốc], huong: "right")
})
)

*3) Kiểm tra số đo tính đúng chiều*

#hinh(xmin: -2.4, xmax: 2.4, ymin: -2.4, ymax: 2.4, w: 6cm, ctx => {
  let O = (0, 0)
  let A = (2, 0)
  let M = toa-cuc(O, 2, 150)
  cac-doan(  (O, A), (O, M))
  cac-diem(  (O, $O$, "below"), (A, $A$, "below-right"), (M, $M$, "above-left"))
  goc-luong-giac(  O, A, M, so-do: true, mau: purple)
  goc-luong-giac(  O, A, M, chieu: "am", so-do: true, mau: orange, r: 0.9, buoc: 0.1)
})
