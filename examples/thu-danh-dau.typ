// Thử hàm danh-dau: vạch thẳng · vạch chéo (nghiêng) · dấu ✕
#import "../baigiang.typ": *

#set page(width: auto, height: auto, margin: 1cm)

= Thử `danh-dau` — đánh dấu đoạn bằng nhau

#hinh(w: 14cm, xmin: -0.5, xmax: 13.5, ymin: -0.5, ymax: 8, ctx => {
  // Mục 1: vạch VUÔNG GÓC (như cũ) — so = 1, 2, 3
  for (i, so) in ((0, 1), (1, 2), (2, 3)) {
    let y = 7 - i * 0
    doan((0, 7 - i), (4, 7 - i))
    danh-dau((0, 7 - i), (4, 7 - i), so: so)
    nhan((4.3, 7 - i), [so: #so], huong: "right")
  }

  // Mục 2: vạch CHÉO (nghiêng) — kiểu "/" "//" "///"
  for (i, so) in ((0, 1), (1, 2), (2, 3)) {
    doan((6, 7 - i), (10, 7 - i))
    danh-dau((6, 7 - i), (10, 7 - i), so: so, nghieng: 25deg)
    nhan((10.3, 7 - i), [nghiêng, so: #so], huong: "right")
  }

  // Mục 3: dấu ✕ (chéo nhau) — so = 1, 2
  doan((0, 3), (4, 3))
  danh-dau((0, 3), (4, 3), cheo: true)
  nhan((4.3, 3), [cheo: true], huong: "right")

  doan((0, 2), (4, 2))
  danh-dau((0, 2), (4, 2), so: 2, cheo: true)
  nhan((4.3, 2), [cheo, so: 2], huong: "right")

  // Mục 4: trên đoạn XIÊN — vạch phải bám đúng hướng đoạn
  doan((6, 1), (10, 4))
  danh-dau((6, 1), (10, 4), so: 2, nghieng: 25deg, mau: red)
  nhan((10.3, 4), [xiên + chéo], huong: "right")
})

Đối chiếu: cột trái mục 1 là vạch vuông góc (hành vi cũ, không đổi); cột phải là
vạch chéo `nghieng: 25deg`; hàng dưới là dấu ✕ `cheo: true`.
