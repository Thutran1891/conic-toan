// Hồi quy 0.4.2 — nhãn toạ độ điểm uốn tự chọn phía theo góc phần tư.
#import "../baigiang.typ": *

#show: bai-giang.with(
  tieu-de: [THỬ HƯỚNG NHÃN ĐIỂM UỐN],
  co-chu: 19pt,
)

// f(x) = (x - h)^3 + k có điểm uốn I(h; k).
#let do-thi-uon(h, k, diem-uon: auto) = do-thi-bac-ba(
  1, -3 * h, 3 * h * h, k - h * h * h,
  w: 10cm, diem-uon: diem-uon, ten: $y = f(x)$,
)

#slide(tieu-de: [Điểm uốn góc phần tư III])[
  $I(-2; -2)$: nhãn hoành độ ở trên, nhãn tung độ ở bên phải.
  #align(center, do-thi-uon(-2, -2))
]

#slide(tieu-de: [Điểm uốn góc phần tư II])[
  $I(-2; 2)$: nhãn hoành độ ở dưới, nhãn tung độ ở bên phải.
  #align(center, do-thi-uon(-2, 2))
]

#slide(tieu-de: [Điểm uốn góc phần tư IV])[
  $I(2; -2)$: nhãn hoành độ ở trên, nhãn tung độ ở bên trái.
  #align(center, do-thi-uon(2, -2))
]

#slide(tieu-de: [Điểm uốn góc phần tư I])[
  $I(2; 2)$: nhãn hoành độ ở dưới, nhãn tung độ ở bên trái.
  #align(center, do-thi-uon(2, 2))
]

#slide(tieu-de: [Hướng truyền tay vẫn thắng])[
  Ép nhãn về phía cũ để kiểm tra ghi đè.
  #align(center, do-thi-uon(-2, -2, diem-uon: (x: "below", y: "left")))
]
