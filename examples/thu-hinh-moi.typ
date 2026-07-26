// thu-hinh-moi.typ — KIỂM TRA hình/đồ thị mới (07/2026)
// Biên dịch:  typst compile thu-hinh-moi.typ
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.4cm)
#set text(size: 10.5pt, lang: "vi")

= 1. Trục số (đoạn / khoảng / nửa khoảng, nhiều tập, ±∞)
// Đoạn [−1; 4]
#truc-so((-1, 4, "[]"))
// Khoảng (−2; 3)
#truc-so((-2, 3, "()"))
// Nửa khoảng [−2; 3) và (1; 5]
#truc-so((-2, 3, "[)"))
#truc-so((1, 5, "(]"))
// Nửa khoảng vô cực: (−∞; 2] và [1; +∞)
#truc-so(("-oo", 2, "(]"))
#truc-so((1, "+oo", "[)"))
// Hợp nhiều tập: (−2; 1) ∪ [3; +∞), thêm mốc phụ x = 0
#truc-so((-2, 1, "()"), (3, "+oo", "[)"), moc-phu: (0,))
// Kiểu chấm đặc/rỗng thay ngoặc
#truc-so(("-oo", 0, "(]"), (2, 5, "[]"), dau: "cham")

= 2. Conic: hyperbol, parabol, elip
#grid(columns: (1fr, 1fr),
  figure(hyperbol(4, 3), caption: [Hyperbol $x^2/16 - y^2/9 = 1$]),
  figure(parabol(2), caption: [Parabol $y^2 = 4x$]),
)
#grid(columns: (1fr, 1fr),
  figure(duong-elip(4, 2.5), caption: [Elip $a > b$ (tiêu điểm trên Ox)]),
  figure(duong-elip(2, 3.2), caption: [Elip $b > a$ (tiêu điểm trên Oy)]),
)

= 3. Mũ / lôgarit / côtang (cơ số số đẹp, nhãn tránh đè)
#grid(columns: (1fr, 1fr),
  figure(do-thi-mu(1/3, w: 6.5cm), caption: [$y = (1/3)^x$]),
  figure(do-thi-log(1/3, w: 6.5cm), caption: [$y = log_(1/3) x$]),
)
#figure(do-thi-cot(w: 9cm), caption: [$y = cot x$])

= 4. Chóp & lăng trụ lục giác đều
#grid(columns: (1fr, 1fr),
  figure(hinh-chop-luc-giac-deu(w: 6.5cm), caption: [Chóp lục giác đều]),
  figure(hinh-lang-tru-luc-giac-deu(w: 6.5cm), caption: [Lăng trụ lục giác đều]),
)

= 5. Chóp cụt đều (tam / tứ / lục giác)
#grid(columns: (1fr, 1fr, 1fr),
  figure(hinh-chop-cut-tam-giac-deu(w: 5cm), caption: [Tam giác]),
  figure(hinh-chop-cut-tu-giac-deu(w: 5cm, truc: true), caption: [Tứ giác]),
  figure(hinh-chop-cut-luc-giac-deu(w: 5cm), caption: [Lục giác]),
)
