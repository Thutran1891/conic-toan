#import "../baigiang.typ": *

#set page(width: 21cm, height: 29.7cm, margin: 8mm)
#set text(font: "Arial", size: 12pt)

= Thử hướng nhãn gióng cực trị tự động

#grid(
  columns: (1fr, 1fr),
  gutter: 8mm,
  row-gutter: 5mm,
  [
    *Bậc ba — hai phía hai trục*
    #do-thi-bac-ba(1, 0, -3, 0, w: 8cm)
  ],
  [
    *Trùng phương — cực trị trên Oy dương*
    #do-thi-trung-phuong(1, -2, 2, w: 8cm)
  ],
  [
    *Trùng phương — cực trị trên Oy âm*
    #do-thi-trung-phuong(-1, 2, -2, w: 8cm)
  ],
  [
    *Bậc ba — tịnh tiến hoành độ*
    #do-thi-bac-ba(-1, 3, 0, 1, w: 8cm, )
  ],
  [
    *Hữu tỉ bậc 2/1*
    #do-thi-huu-ti(1, -1, 1, 1, -1, w: 8cm, ten-tcx: none)
  ],
  [
    *Ghi đè thủ công vẫn được giữ*
    #do-thi-bac-ba(
      1, 0, -3, 0, w: 8cm,
      cuc-tri: ((x: "above", y: "left"), (x: "below", y: "right")),
    )
  ],
)
