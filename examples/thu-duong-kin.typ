#import "../baigiang.typ": *

#set page(width: 21cm, height: 25cm, margin: 1.2cm)
#set text(font: "Arial", size: 11pt)

= Thử `duong-kin` — đường kín phối hợp

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  [
    *1. Đoạn thẳng + hai cung tròn — một lớp màu trong suốt*

    #hinh(w: 8cm, xmin: -2.6, xmax: 7.6, ymin: -2.5, ymax: 3, ctx => {
      duong-kin(ctx,
        (0, 2), (5, 2),
        noi-cung((5, 0), 2, tu: 90deg, den: -90deg),
        (0, -2),
        noi-cung((0, 0), 2, tu: -90deg, den: -270deg),
        to: rgb(70, 130, 180, 110), mau: luma(35%), day: 1.2pt,
      )
      cung-elip((0, 0), 0.55, 2, tu: -90deg, den: 90deg,
        mau: luma(55%), dut: true)
      cung-elip((0, 0), 0.55, 2, tu: 90deg, den: 270deg, mau: luma(55%))
      cung-elip((5, 0), 0.55, 2, tu: -90deg, den: 90deg,
        mau: luma(55%), dut: true)
      cung-elip((5, 0), 0.55, 2, tu: 90deg, den: 270deg, mau: luma(55%))
    })
  ],
  [
    *2. Đồ thị + cung tròn trong cùng một biên*

    #hinh(w: 8cm, xmin: -2.6, xmax: 2.6, ymin: -2.5, ymax: 4.6, ctx => {
      duong-kin(
        (-2, 0),
        noi-do-thi(x => 4 - x*x, -2, 2, n: 100),
        noi-cung((0, 0), 2, tu: 0deg, den: -180deg),
        to: rgb(235, 130, 40, 105), mau: orange.darken(30%), day: 1.2pt,
      )
      doan((-2.35, 0), (2.35, 0), mau: luma(60%), dut: true)
      nhan((0, 2.1), $y = 4 - x^2$, huong: "above")
    })
  ],
  [
    *3. Đoạn thẳng + cung elip xoay + Bézier*

    #hinh(w: 8cm, xmin: -0.8, xmax: 6.4, ymin: -1.7, ymax: 4.5, ctx => {
      let O = (4, 1.2)
      let P = quay-diem((4, -0.4), O, -18deg)
      duong-kin(
        (0, 0), P,
        noi-cung-elip(O, 1.1, 1.6,
          tu: -90deg, den: 95deg, quay: -18deg),
        noi-bezier((3.2, 4.1), (0.2, 0.9), (0, 0)),
        to: rgb(80, 175, 110, 95), mau: green.darken(30%), day: 1.2pt,
      )
    })
  ],
  [
    *4. Đồ thị đi ngược chiều + tự dò cửa sổ*

    #hinh(w: 6cm, ctx => {
      duong-kin(
        (3, 0),
        noi-do-thi(x => 0.35*x*x + 0.5, 3, 0, n: 90),
        (0, 0),
        to: rgb(135, 90, 210, 90), mau: purple.darken(20%), day: 1.2pt,
      )
    })
  ],
)

== 5. Cá và chim đồng dạng lát kín một hình chữ nhật

#align(center, hinh(
  w: 16.5cm, h: 8.25cm,
  xmin: 0, xmax: 12, ymin: 0, ymax: 6,
  cat: true,
  ctx => {
    // Cạnh trên và cạnh dưới của mọi viên lát là hai bản dịch của cùng một
    // đường cong. Hai cạnh trái/phải cũng được dựng theo từng cặp như vậy,
    // nên các hình tịnh tiến ghép khít, không phải tô nền để che khe hở.
    let ca = (x, y, mau) => {
      duong-kin(ctx,
        (x, y),
        noi-bezier((x + 0.35, y + 0.18), (x + 0.68, y + 0.22), (x + 1, y)),
        noi-bezier((x + 1.30, y - 0.22), (x + 1.65, y - 0.18), (x + 2, y)),
        // Đầu cá lồi sang ô kế; cạnh trái là đúng phần lõm tương ứng.
        noi-bezier((x + 2.30, y + 0.13), (x + 2.32, y + 0.32), (x + 2, y + 0.5)),
        noi-bezier((x + 2.32, y + 0.68), (x + 2.30, y + 0.87), (x + 2, y + 1)),
        noi-bezier((x + 1.65, y + 0.82), (x + 1.30, y + 0.78), (x + 1, y + 1)),
        noi-bezier((x + 0.68, y + 1.22), (x + 0.35, y + 1.18), (x, y + 1)),
        noi-bezier((x + 0.30, y + 0.87), (x + 0.32, y + 0.68), (x, y + 0.5)),
        noi-bezier((x + 0.32, y + 0.32), (x + 0.30, y + 0.13), (x, y)),
        to: mau, mau: mau.darken(35%), day: 0.55pt,
      )
      // Mắt, mang và vây đều tịnh tiến cùng thân cá.
      diem(ctx, (x + 1.76, y + 0.57), bk: 1.25pt, mau: luma(15%))
      doan(ctx, (x + 1.53, y + 0.28), (x + 1.46, y + 0.73),
        mau: mau.darken(42%), day: 0.55pt)
      doan(ctx, (x + 0.74, y + 0.47), (x + 1.08, y + 0.72),
        mau: mau.darken(42%), day: 0.55pt)
      doan(ctx, (x + 1.08, y + 0.72), (x + 1.19, y + 0.39),
        mau: mau.darken(42%), day: 0.55pt)
    }

    let chim = (x, y, mau) => {
      duong-kin(ctx,
        (x, y),
        noi-bezier((x + 0.35, y + 0.18), (x + 0.68, y + 0.22), (x + 1, y)),
        noi-bezier((x + 1.30, y - 0.22), (x + 1.65, y - 0.18), (x + 2, y)),
        // Mỏ và ngực ở cạnh phải; chuỗi điểm đảo ngược ở cạnh trái tạo đuôi
        // ăn khít với con chim bên cạnh.
        (x + 2.08, y + 0.23),
        (x + 2.32, y + 0.34),
        (x + 2.08, y + 0.44),
        (x + 2.22, y + 0.60),
        (x + 2.02, y + 0.72),
        (x + 2, y + 1),
        noi-bezier((x + 1.65, y + 0.82), (x + 1.30, y + 0.78), (x + 1, y + 1)),
        noi-bezier((x + 0.68, y + 1.22), (x + 0.35, y + 1.18), (x, y + 1)),
        (x + 0.02, y + 0.72),
        (x + 0.22, y + 0.60),
        (x + 0.08, y + 0.44),
        (x + 0.32, y + 0.34),
        (x + 0.08, y + 0.23),
        (x, y),
        to: mau, mau: mau.darken(38%), day: 0.55pt,
      )
      // Mắt và cánh lặp cùng một vị trí tương đối trên mọi con chim.
      diem(ctx, (x + 1.78, y + 0.55), bk: 1.2pt, mau: luma(15%))
      cung-elip(ctx, (x + 1.04, y + 0.48), 0.55, 0.25,
        tu: 12deg, den: 205deg, mau: mau.darken(45%), day: 0.6pt)
      doan(ctx, (x + 0.58, y + 0.28), (x + 0.84, y + 0.52),
        mau: mau.darken(45%), day: 0.55pt)
    }

    let mau-ca = (rgb("#55b6c8"), rgb("#80cddd"))
    let mau-chim = (rgb("#efa85f"), rgb("#f3c777"))

    // Vẽ thừa một vành ngoài rồi cắt theo cửa sổ để bốn mép thành chữ nhật
    // tuyệt đối. Trong phần nhìn thấy: ba hàng cá, ba hàng chim.
    for j in range(-1, 7) {
      for i in range(-1, 7) {
        let le = calc.rem(i + j + 20, 2)
        if j < 3 {
          ca(2 * i, j, mau-ca.at(le))
        } else {
          chim(2 * i, j, mau-chim.at(le))
        }
      }
    }

    da-giac(ctx, ((0, 0), (12, 0), (12, 6), (0, 6)),
      mau: luma(18%), day: 1.1pt)
  },
))

== 6. Khảm cá xanh – chim tím trên lưới xiên

#align(center, hinh(
  w: 15.5cm, h: 10.85cm,
  xmin: 0, xmax: 10, ymin: 0, ymax: 7,
  cat: true,
  ctx => {
    // Ánh xạ một ô vuông (u,v) lên lưới hình bình hành. Hai vectơ tịnh tiến
    // của lưới là (1.55, 0) và (0.48, 1.28), tạo nhịp xiên như hình mẫu.
    let P = (i, j, u, v) => (
      1.55 * (i + u) + 0.48 * (j + v),
      1.28 * (j + v),
    )

    let ca-xanh-nen = (i, j, mau) => {
      duong-kin(ctx,
        P(i, j, 0, 0),
        noi-bezier(P(i, j, 0.25, -0.08), P(i, j, 0.62, -0.12), P(i, j, 1, 0)),
        noi-bezier(P(i, j, 1.12, 0.08), P(i, j, 1.22, 0.25),
          P(i, j, 1.15, 0.40)),
        P(i, j, 0.95, 0.50),
        P(i, j, 1.15, 0.60),
        noi-bezier(P(i, j, 1.22, 0.75), P(i, j, 1.12, 0.92), P(i, j, 1, 1)),
        noi-bezier(P(i, j, 0.86, 1.06), P(i, j, 0.74, 1.12),
          P(i, j, 0.62, 1.10)),
        P(i, j, 0.52, 1.30),
        P(i, j, 0.40, 1.08),
        noi-bezier(P(i, j, 0.26, 1.12), P(i, j, 0.12, 1.05), P(i, j, 0, 1)),
        P(i, j, -0.18, 0.78),
        P(i, j, 0.06, 0.56),
        P(i, j, -0.18, 0.30),
        P(i, j, 0, 0),
        to: mau, mau: rgb("#174d68"), day: 0.52pt,
      )
    }

    let chim-tim-nen = (i, j, mau) => {
      duong-kin(ctx,
        P(i, j, 0, 0),
        noi-bezier(P(i, j, 0.12, 0.05), P(i, j, 0.26, 0.12),
          P(i, j, 0.40, 0.08)),
        P(i, j, 0.52, 0.30),
        P(i, j, 0.62, 0.10),
        noi-bezier(P(i, j, 0.74, 0.12), P(i, j, 0.86, 0.06), P(i, j, 1, 0)),
        P(i, j, 0.82, 0.30),
        P(i, j, 1.06, 0.56),
        P(i, j, 0.82, 0.78),
        P(i, j, 1, 1),
        noi-bezier(P(i, j, 0.62, 0.88), P(i, j, 0.25, 0.92), P(i, j, 0, 1)),
        noi-bezier(P(i, j, 0.12, 0.92), P(i, j, 0.22, 0.75),
          P(i, j, 0.15, 0.60)),
        P(i, j, -0.05, 0.50),
        P(i, j, 0.15, 0.40),
        noi-bezier(P(i, j, 0.22, 0.25), P(i, j, 0.12, 0.08), P(i, j, 0, 0)),
        to: mau, mau: rgb("#713c66"), day: 0.52pt,
      )
    }

    let ca-xanh-net = (i, j) => {
      // Mảng vây vàng cong, mắt và mang của cá.
      duong-kin(ctx,
        P(i, j, 0.38, 0.27),
        noi-bezier(P(i, j, 0.53, 0.16), P(i, j, 0.79, 0.14), P(i, j, 0.91, 0.28)),
        P(i, j, 0.91, 0.62),
        noi-bezier(P(i, j, 0.73, 0.78), P(i, j, 0.48, 0.69), P(i, j, 0.38, 0.52)),
        P(i, j, 0.38, 0.27),
        to: rgb("#f3c526"), mau: rgb("#a67817"), day: 0.42pt,
      )
      diem(ctx, P(i, j, 0.97, 0.68), bk: 1.35pt,
        mau: white, ten: none)
      diem(ctx, P(i, j, 0.97, 0.68), bk: 0.62pt,
        mau: luma(12%), ten: none)
      doan(ctx, P(i, j, 0.83, 0.38), P(i, j, 0.79, 0.76),
        mau: rgb("#174d68"), day: 0.48pt)
      for k in range(4) {
        let t = k / 4
        doan(ctx,
          P(i, j, 0.43 + 0.10 * t, 0.30 + 0.10 * t),
          P(i, j, 0.58 + 0.08 * t, 0.20 + 0.02 * t),
          mau: rgb("#a67817"), day: 0.34pt,
        )
      }
    }

    let chim-tim-net = (i, j) => {
      // Cánh xanh lá hình quạt nằm sau thân tím; các nan tỏa từ một gốc.
      duong-kin(ctx,
        P(i, j, 0.28, 0.35),
        P(i, j, 0.58, 0.10),
        P(i, j, 0.93, 0.18),
        P(i, j, 0.91, 0.60),
        P(i, j, 0.62, 0.78),
        P(i, j, 0.28, 0.35),
        to: rgb("#b6df70"), mau: rgb("#48783e"), day: 0.44pt,
      )
      for k in range(6) {
        let t = k / 5
        doan(ctx, P(i, j, 0.30, 0.36),
          P(i, j, 0.58 + 0.34 * t, 0.12 + 0.48 * t),
          mau: rgb("#48783e"), day: 0.36pt)
      }
      // Thân chim tím nằm nổi trên quạt cánh: đầu tròn, mỏ trái và đuôi
      // chúc xuống phải. Lớp riêng này giữ chim không bị tan vào nền tím.
      duong-kin(ctx,
        P(i, j, -0.05, 0.62),
        P(i, j, 0.12, 0.70),
        noi-bezier(P(i, j, 0.10, 0.84), P(i, j, 0.22, 0.92),
          P(i, j, 0.36, 0.86)),
        noi-bezier(P(i, j, 0.52, 0.79), P(i, j, 0.60, 0.62),
          P(i, j, 0.56, 0.52)),
        noi-bezier(P(i, j, 0.60, 0.44), P(i, j, 0.72, 0.37),
          P(i, j, 0.82, 0.30)),
        P(i, j, 0.57, 0.39),
        noi-bezier(P(i, j, 0.40, 0.32), P(i, j, 0.20, 0.40),
          P(i, j, 0.12, 0.56)),
        P(i, j, -0.05, 0.62),
        to: rgb("#d98bc5"), mau: rgb("#713c66"), day: 0.48pt,
      )
      // Mắt viền trắng và một nét cánh nhỏ trên thân tím.
      diem(ctx, P(i, j, 0.20, 0.75), bk: 1.35pt,
        mau: white, ten: none)
      diem(ctx, P(i, j, 0.20, 0.75), bk: 0.62pt,
        mau: luma(12%), ten: none)
      doan(ctx, P(i, j, 0.24, 0.55), P(i, j, 0.42, 0.43),
        mau: rgb("#713c66"), day: 0.48pt)
      doan(ctx, P(i, j, 0.42, 0.43), P(i, j, 0.46, 0.66),
        mau: rgb("#713c66"), day: 0.48pt)
    }

    let xanh = (rgb("#3c80c7"), rgb("#5596d2"))
    let tim = (rgb("#c26aa7"), rgb("#d17bb7"))

    // Lượt 1: dựng lớp lát kín. Lượt 2: thêm hoa văn để chi tiết không bị
    // thân của ô vẽ sau che mất ở những chỗ cánh/vây chạm biên.
    for j in range(-2, 7) {
      for i in range(-4, 9) {
        let le = calc.rem(i + j + 40, 2)
        if le == 0 {
          ca-xanh-nen(i, j, xanh.at(calc.rem(i + 2 * j + 40, 2)))
        } else {
          chim-tim-nen(i, j, tim.at(calc.rem(2 * i + j + 40, 2)))
        }
      }
    }
    for j in range(-2, 7) {
      for i in range(-4, 9) {
        if calc.rem(i + j + 40, 2) == 0 {
          ca-xanh-net(i, j)
        } else {
          chim-tim-net(i, j)
        }
      }
    }

    da-giac(ctx, ((0, 0), (10, 0), (10, 7), (0, 7)),
      mau: luma(15%), day: 1.1pt)
  },
))

== 7. Cá và chim đan xen — hai đường bao khác nhau

#align(center, hinh(
  w: 16.5cm, h: 9.9cm,
  xmin: 0, xmax: 10, ymin: 0, ymax: 6,
  cat: true,
  ctx => {
    // Cá quay sang phải: bụng cong, đầu tròn có miệng, vây lưng và đuôi chẻ.
    let ca-dan = (x, y, mau) => {
      duong-kin(ctx,
        (x, y),
        // Bụng.
        noi-bezier((x + 0.25, y - 0.08), (x + 0.62, y - 0.12), (x + 1, y)),
        // Đầu và miệng.
        noi-bezier((x + 1.12, y + 0.08), (x + 1.22, y + 0.25),
          (x + 1.15, y + 0.40)),
        (x + 0.95, y + 0.50),
        (x + 1.15, y + 0.60),
        noi-bezier((x + 1.22, y + 0.75), (x + 1.12, y + 0.92),
          (x + 1, y + 1)),
        // Lưng và vây lưng.
        noi-bezier((x + 0.86, y + 1.06), (x + 0.74, y + 1.12),
          (x + 0.62, y + 1.10)),
        (x + 0.52, y + 1.30),
        (x + 0.40, y + 1.08),
        noi-bezier((x + 0.26, y + 1.12), (x + 0.12, y + 1.05), (x, y + 1)),
        // Đuôi chẻ.
        (x - 0.18, y + 0.78),
        (x + 0.06, y + 0.56),
        (x - 0.18, y + 0.30),
        (x, y),
        to: mau, mau: mau.darken(42%), day: 0.48pt,
      )
      diem(ctx, (x + 0.96, y + 0.68), bk: 1.05pt, mau: luma(12%))
      doan(ctx, (x + 0.83, y + 0.36), (x + 0.78, y + 0.77),
        mau: mau.darken(48%), day: 0.48pt)
      doan(ctx, (x + 0.34, y + 0.43), (x + 0.58, y + 0.68),
        mau: mau.darken(48%), day: 0.48pt)
      doan(ctx, (x + 0.58, y + 0.68), (x + 0.66, y + 0.36),
        mau: mau.darken(48%), day: 0.48pt)
    }

    // Chim quay sang trái. Bốn cạnh dưới đây là phần bù chính xác của bốn
    // cạnh cá ở các ô kề, nhưng ghép lại thành đầu+mỏ, cánh và đuôi chim.
    let chim-dan = (x, y, mau) => {
      duong-kin(ctx,
        (x, y),
        // Mép dưới bù với lưng và vây lưng của cá phía dưới.
        noi-bezier((x + 0.12, y + 0.05), (x + 0.26, y + 0.12),
          (x + 0.40, y + 0.08)),
        (x + 0.52, y + 0.30),
        (x + 0.62, y + 0.10),
        noi-bezier((x + 0.74, y + 0.12), (x + 0.86, y + 0.06), (x + 1, y)),
        // Đuôi chim bù với đuôi cá bên phải.
        (x + 0.82, y + 0.30),
        (x + 1.06, y + 0.56),
        (x + 0.82, y + 0.78),
        (x + 1, y + 1),
        // Mép trên bù với bụng cá phía trên.
        noi-bezier((x + 0.62, y + 0.88), (x + 0.25, y + 0.92), (x, y + 1)),
        // Đầu tròn và mỏ nhọn bù với đầu+miệng cá bên trái.
        noi-bezier((x + 0.12, y + 0.92), (x + 0.22, y + 0.75),
          (x + 0.15, y + 0.60)),
        (x - 0.05, y + 0.50),
        (x + 0.15, y + 0.40),
        noi-bezier((x + 0.22, y + 0.25), (x + 0.12, y + 0.08), (x, y)),
        to: mau, mau: mau.darken(42%), day: 0.48pt,
      )
      diem(ctx, (x + 0.15, y + 0.68), bk: 1.05pt, mau: luma(12%))
      // Một cánh lớn và ba gân lông làm chim khác hẳn cá ngay cả khi in xám.
      cung-elip(ctx, (x + 0.53, y + 0.52), 0.34, 0.27,
        tu: -28deg, den: 205deg, mau: mau.darken(52%), day: 0.52pt)
      doan(ctx, (x + 0.49, y + 0.49), (x + 0.83, y + 0.68),
        mau: mau.darken(50%), day: 0.43pt)
      doan(ctx, (x + 0.49, y + 0.49), (x + 0.84, y + 0.52),
        mau: mau.darken(50%), day: 0.43pt)
      doan(ctx, (x + 0.49, y + 0.49), (x + 0.78, y + 0.35),
        mau: mau.darken(50%), day: 0.43pt)
    }

    let mau-ca-dan = (rgb("#e58945"), rgb("#f0ad57"))
    let mau-chim-dan = (rgb("#167f91"), rgb("#45a5ae"))

    // Bàn cờ vô hạn cá–chim: mọi cá chỉ kề chim và mọi chim chỉ kề cá.
    // Vành ngoài được vẽ thừa để sau khi cắt không hở bốn cạnh chữ nhật.
    for j in range(-1, 7) {
      for i in range(-1, 11) {
        let le = calc.rem(i + j + 30, 2)
        if le == 0 {
          ca-dan(i, j, mau-ca-dan.at(calc.rem(i + 2 * j + 30, 2)))
        } else {
          chim-dan(i, j, mau-chim-dan.at(calc.rem(2 * i + j + 30, 2)))
        }
      }
    }

    da-giac(ctx, ((0, 0), (10, 0), (10, 6), (0, 6)),
      mau: luma(15%), day: 1.1pt)
  },
))

#pagebreak()

== 8. Vẽ tam giac Penrose

#align(center, hinh(
  w: 8cm, ctx =>{
    let O = (0, 0)
    let R = 3; let bk = 1;  let r = bk/calc.cos(30deg)
    let A = toa-cuc(O, R, 90)
    let B = toa-cuc(O, R, 210)
    let C = toa-cuc(O, R, -30)
    let D = dung-diem(A, B, -120, r)
    let K = dung-diem(B, A, 180, r)
    let G = dung-diem(K, B, -60, R * calc.sqrt(3) + 3*r)
    let F = dung-diem(G, K, 60, r)
    let F1 = dung-diem(F, G, 120, R)
    let D1 = dung-diem(D, A, -60, R)
    let E = giao-duong-thang(D, D1, F, F1)

    let ve-hinh = (c, nen) => {
      duong-kin(c,
        K, A, D, E, F, G, K,
        to: nen,
        mau: nen.darken(22%),
        day: 0.55pt,
      )
    }

    // Cùng một chữ L, chỉ thay ctx quay và màu nền.
    ve-hinh(ctx, rgb("#5b8fca"))
    ve-hinh(ctx-quay(ctx, 120deg, tam: O), rgb("#86a9d6"))
    ve-hinh(ctx-quay(ctx, -120deg, tam: O), rgb("#3f7fbd"))
  }
))


#align(center, hinh(
  w: 8cm, ctx =>{
    let O = (0, 0)
    let R = 3; let bk = 1;  let r = bk/calc.cos(30deg)
    let A = toa-cuc(O, R, 90)
    let B = toa-cuc(O, R, 210)
    let C = toa-cuc(O, R, -30)
    let D = dung-diem(A, B, -120, r)
    let K = dung-diem(B, A, 180, r)
    let G = dung-diem(K, B, -60, R * calc.sqrt(3) + 3*r)
    let F = dung-diem(G, K, 60, r)
    let F1 = dung-diem(F, G, 120, R)
    let D1 = dung-diem(D, A, -60, R)
    let E = giao-duong-thang(D, D1, F, F1)

    let ve-hinh = (c, nen) => {
      duong-kin(c,
        K, A, D, E, F, G, K,
        to: nen,
        mau: nen.darken(22%),
        day: 0.55pt,
      )
    }

    // Cùng một chữ L, chỉ thay ctx quay và màu nền.
    ve-hinh(ctx, rgb("#b45bca"))
    ve-hinh(ctx-quay(ctx, 120deg, tam: O), rgb("#d1d686"))
    ve-hinh(ctx-quay(ctx, -120deg, tam: O), rgb("#3f7fbd"))
  }
))

== 9. Mặt Möbius

#align(center, hinh(
  w: 14cm, h: 9.4cm,
  xmin: -3.65, xmax: 3.65, ymin: -2.15, ymax: 2.75,
  ctx => {
    let R = 2.25
    let rong = 0.78
    let nu = 40
    let nv = 8
    let az = -24deg
    let nghieng = 57deg

    // Tham số chuẩn của dải Möbius:
    // ((R + v cos(u/2)) cos u, (R + v cos(u/2)) sin u, v sin(u/2)).
    let diem-mobius = (u, v) => {
      let x = (R + v * calc.cos(u / 2)) * calc.cos(u)
      let y = (R + v * calc.cos(u / 2)) * calc.sin(u)
      let z = v * calc.sin(u / 2)
      let xr = x * calc.cos(az) - y * calc.sin(az)
      let yr = x * calc.sin(az) + y * calc.cos(az)
      let X = xr
      let Y = z * calc.cos(nghieng) - yr * calc.sin(nghieng)
      let D = z * calc.sin(nghieng) + yr * calc.cos(nghieng)
      (p: (X, Y), d: D)
    }

    let o = ()
    for i in range(nu) {
      let u0 = 360deg * i / nu
      let u1 = 360deg * (i + 1) / nu
      for j in range(nv) {
        let v0 = -rong + 2 * rong * j / nv
        let v1 = -rong + 2 * rong * (j + 1) / nv
        let A = diem-mobius(u0, v0)
        let B = diem-mobius(u1, v0)
        let C = diem-mobius(u1, v1)
        let D = diem-mobius(u0, v1)
        o.push((
          d: (A.d + B.d + C.d + D.d) / 4,
          pts: (A.p, B.p, C.p, D.p),
          hang: j,
          cot: i,
        ))
      }
    }

    // Painter's algorithm: vẽ ô xa trước, ô gần sau. Các đường lưới là nét
    // viền của chính từng tứ giác nên cũng xoắn liên tục cùng dải.
    let bang-mau = (
      rgb("#63c9dc"), rgb("#55bed5"), rgb("#47b3ce"), rgb("#39a8c6"),
      rgb("#319dbc"), rgb("#2b91b0"), rgb("#2785a4"), rgb("#237998"),
    )
    for q in o.sorted(key: q => q.d) {
      let le = calc.rem(q.cot + q.hang, 2)
      let nen = bang-mau.at(q.hang)
      if le == 1 { nen = nen.lighten(3%) }
      duong-kin(ctx, ..q.pts,
        to: nen, mau: rgb("#176b82"), day: 0.28pt,
      )
    }

    // Hai đường biên giúp người xem theo được nửa vòng xoắn của mặt một phía.
    for v in (-rong, rong) {
      let pts = ()
      for i in range(nu + 1) {
        pts.push(diem-mobius(360deg * i / nu, v).p)
      }
      cac-doan(ctx, ..pts, mau: rgb("#0b5a70"), day: 0.8pt)
    }
  },
))

== 10. Mạch điện xoay chiều

#align(center, hinh(
  w: 15cm, h: 10.5cm,
  xmin: 0, xmax: 13.5, ymin: 0, ymax: 9.5,
  ctx => {
    let do = rgb("#b72b2b")
    let xanh = rgb("#286ca8")
    let dong = rgb("#bf7b12")
    let net = luma(22%)

    // Mỗi cuộn là MỘT đường lò xo liên tục. Thành phần cos tạo bề rộng vòng,
    // thành phần sin tạo độ sâu elip, còn độ hạ đều tạo bước quấn.
    let lo-xo = (x, y, pha) => {
      let pts = ()
      let n = 180
      let so-vong = 4.5
      for i in range(n + 1) {
        let t = pha + 360deg * so-vong * i / n
        pts.push((
          x + 0.80 * calc.cos(t),
          y - 1.30 * i / n + 0.18 * calc.sin(t),
        ))
      }
      duong-cong(ctx, pts, mau: net, day: 1.05pt)
    }
    // Cuộn trên đi từ phải sang trái; cuộn dưới đi từ trái sang phải.
    lo-xo(2.45, 7.85, 0deg)
    lo-xo(2.45, 2.55, 180deg)

    // Dây khép kín bên trái nối đúng hai đầu lò xo.
    cac-doan(ctx,
      (1.65, 6.55), (0.72, 6.55), (0.45, 6.28),
      (0.45, 2.82), (0.72, 2.55), (1.65, 2.55),
      mau: net, day: 1.25pt,
    )

    // Lõi sắt và nam châm quay N–S.
    duong-kin(ctx,
      (2.10, 3.28), (3.62, 3.28), (3.62, 6.32), (2.10, 6.32),
      to: rgb("#d9dcdf"), mau: rgb("#a9adb1"), day: 0.65pt,
    )
    nhan(ctx, (2.86, 5.86), [N], mau: luma(43%))
    nhan(ctx, (2.86, 3.76), [S], mau: luma(55%), huong: "below")

    let M = (2.86, 4.80)
    let q = pts => pts.map(P => quay-diem(P, M, 12deg))
    let nua-trai = q(((1.15, 4.18), (2.86, 4.18), (2.86, 5.42), (1.15, 5.42)))
    let nua-phai = q(((2.86, 4.18), (4.57, 4.18), (4.57, 5.42), (2.86, 5.42)))
    duong-kin(ctx, ..nua-trai,
      to: rgb("#bfc3c7"), mau: net, day: 0.75pt)
    duong-kin(ctx, ..nua-phai,
      to: rgb("#eceeef"), mau: net, day: 0.75pt)
    nhan(ctx, quay-diem((1.62, 4.80), M, 12deg), [S],
      mau: luma(25%), quay: -12deg)
    nhan(ctx, quay-diem((4.08, 4.80), M, 12deg), [N],
      mau: luma(25%), quay: -12deg)
    diem(ctx, M, bk: 2.2pt, mau: luma(25%))

    // Hai mũi tên cong biểu diễn nam châm đang quay.
    cung-elip(ctx, M, 2.10, 1.55, tu: 145deg, den: 210deg,
      mau: rgb("#19a991"), day: 1.5pt, mui-ten-cuoi: 6pt)
    cung-elip(ctx, M, 2.10, 1.55, tu: -35deg, den: 30deg,
      mau: rgb("#19a991"), day: 1.5pt, mui-ten-cuoi: 6pt)


    // Ánh sáng đặt sau bóng đèn.
    elip(ctx, (10.45, 5.35), 1.70, 2.05,
      mau: rgb(255, 220, 72, 0), to: rgb(255, 220, 72, 28))
    elip(ctx, (10.45, 5.35), 1.35, 1.72,
      mau: rgb(255, 216, 50, 0), to: rgb(255, 216, 50, 38))

    // Bầu thủy tinh và dây tóc.
    duong-kin(ctx,
      (9.88, 3.62),
      noi-bezier((9.80, 4.12), (9.12, 4.58), (9.20, 5.62)),
      noi-bezier((9.30, 6.93), (10.10, 7.45), (10.45, 7.45)),
      noi-bezier((10.80, 7.45), (11.60, 6.93), (11.70, 5.62)),
      noi-bezier((11.78, 4.58), (11.10, 4.12), (11.02, 3.62)),
      to: rgb(220, 229, 234, 150), mau: luma(42%), day: 0.9pt,
    )
    for x in (9.92, 10.18, 10.45, 10.72, 10.98) {
      doan(ctx, (10.12 + 0.22 * (x - 10.45), 3.76), (x, 5.70),
        mau: rgb("#c9a536"), day: 0.55pt)
    }
    duong-kin(ctx,
      (9.82, 5.72), (10.08, 5.45), (10.30, 5.68),
      (10.52, 5.45), (10.78, 5.72), (11.08, 5.72),
      mau: rgb("#e7bd28"), day: 1.35pt,
    )

    // Đui đèn bằng ba vành đồng.
    duong-kin(ctx,
      (9.82, 3.60), (11.08, 3.60), (10.96, 2.82), (9.94, 2.82),
      to: rgb("#e8a91d"), mau: dong, day: 0.75pt,
    )
    for y in (3.48, 3.25, 3.02) {
      cung-elip(ctx, (10.45, y), 0.62, 0.17,
        tu: 180deg, den: 360deg, mau: rgb("#9d6410"), day: 0.75pt)
    }

    // Hai nhánh mạch: đỏ ở nửa chu kỳ trên, xanh ở nửa chu kỳ dưới.
    cac-doan(ctx,
      (3.25, 7.85), (7.70, 7.85), (8.05, 7.50),
      (8.05, 3.62), (9.82, 3.62),
      mau: do, day: 2.25pt,
    )
    cac-doan(ctx,
      (9.94, 2.82), (9.94, 1.55), (9.62, 1.23),
      (3.25, 1.23), (3.25, 1.25),
      mau: xanh, day: 2.25pt,
    )

    // Cặp mũi tên đổi chiều cho thấy dòng điện xoay chiều.
    mui-ten(ctx, (7.35, 5.35), (7.35, 6.10), mau: do, day: 1.5pt, kich: 6pt)
    mui-ten(ctx, (7.75, 6.10), (7.75, 5.35), mau: xanh, day: 1.5pt, kich: 6pt)
    mui-ten(ctx, (7.35, 1.82), (8.10, 1.82), mau: do, day: 1.5pt, kich: 6pt)
    mui-ten(ctx, (8.10, 1.45), (7.35, 1.45), mau: xanh, day: 1.5pt, kich: 6pt)

    nhan(ctx, (11.95, 5.10), [Tải], huong: "right", mau: luma(35%))
  },
))

#pagebreak()

== 11a. Mô hình nguyên tử

#align(center, hinh(
  w: 15cm, h: 10.2cm,
  xmin: -6.7, xmax: 6.7, ymin: -4.5, ymax: 4.5,
  ctx => {
    let O = (0, 0)
    let a = 4.05
    let b = 1.58
    let net-quy-dao = luma(12%)

    let do-sang = rgb("#fff0e9")
    let do-giua = rgb("#ff3d31")
    let do-toi = rgb("#8f0909")
    let xanh-sang = rgb("#eef2ff")
    let xanh-giua = rgb("#3859ed")
    let xanh-toi = rgb("#101775")
    let den-sang = rgb("#f7f7f7")
    let den-giua = rgb("#686868")
    let den-toi = rgb("#050505")

    // Cầu có bóng đổ, gradient lệch về góc trên-trái và một điểm lóe nhỏ.
    let cau = (P, r, sang, giua, toi) => {
      duong-tron(ctx, (P.at(0) + 0.09, P.at(1) - 0.10), r * 1.02,
        mau: rgb(0, 0, 0, 0), day: 0pt, to: rgb(0, 0, 0, 52))
      duong-tron(ctx, P, r,
        mau: toi.darken(12%), day: 0.65pt,
        to: gradient.radial(
          sang, giua, toi,
          center: (31%, 27%), radius: 78%,
        ),
      )
      duong-tron(ctx, (P.at(0) - 0.20 * r, P.at(1) + 0.24 * r), 0.13 * r,
        mau: rgb(255, 255, 255, 0), day: 0pt, to: rgb(255, 255, 255, 175))
    }

    let tren-elip = (t, g) => quay-diem(
      (a * calc.cos(t), b * calc.sin(t)), O, g,
    )

    // Quỹ đạo nằm sau hạt nhân. Ba elip cùng tâm tạo dáng biểu tượng nguyên tử.
    for g in (30deg, 150deg, -90deg) {
      elip( O, a, b, quay: g, mau: net-quy-dao, day: 2.8pt)
      cau(tren-elip(45deg, g), .43, den-sang, den-giua, den-toi )
    }

    // Hạt nhân: vẽ lớp sau trước để các quả cầu chồng lên nhau tự nhiên. ((0.53, -0.30), "do"),
    let hat = ((toa-cuc(O, 0.6, 90), "xanh"),
       (toa-cuc(O, 0.6, 210), "xanh"),
       (toa-cuc(O, 0.6, -30), "xanh"),
        (toa-cuc(O, 0.6, 30), "do"),
       (toa-cuc(O, 0.6, 150), "do"),
      (toa-cuc(O, 0.6, 270), "do"),  
      (O, "xanh")
    )
    for h in hat {
      if h.at(1) == "do" {
        cau(h.at(0), 0.60, do-sang, do-giua, do-toi)
      } else {
        cau(h.at(0), 0.60, xanh-sang, xanh-giua, xanh-toi)
      }
    }

    // Vong tron hat nhan
    duong-tron(O, 1.3, mau: yellow.darken(30%))


    // Đường dóng và chú thích màu theo đúng hạt được chỉ tới.
    let cam = rgb("#b86a17")
    let xanh-chu = rgb("#176ea1")
    let do-chu = rgb("#a91e22")
    doan(ctx, (-5.55, 0.05), (-1.3, 0.05), mau: cam, day: 0.75pt)
    nhan(ctx, (-5.62, 0.05), text(size: 12pt, weight: "bold")[HẠT NHÂN],
      huong: "left", cach: 2pt, mau: cam)

    mui-ten(ctx, (5.10, 1.25), (0.40, 1),
      mau: xanh-chu, day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, 1.25), text(size: 12pt, weight: "bold")[PROTON],
      huong: "right", cach: 2pt, mau: xanh-chu)

    mui-ten(ctx, (5.10, -0.05), (0.68, 0.25),
      mau: do-chu, day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, -0.05), text(size: 12pt, weight: "bold")[NEUTRON],
      huong: "right", cach: 2pt, mau: do-chu)

    mui-ten(ctx, (5.10, -2.65), tren-elip(45deg, -90deg),
      mau: luma(15%), day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, -2.65), text(size: 12pt, weight: "bold")[ELECTRON],
      huong: "right", cach: 2pt, mau: luma(15%))
  },
))


== 11b. Mô hình nguyên tử

#align(center, hinh(
  w: 15cm, h: 10.2cm,
  xmin: -6.7, xmax: 6.7, ymin: -4.5, ymax: 4.5,
  ctx => {
    let O = (0, 0)
    let a = 4.05
    let b = 1.58
    let net-quy-dao = luma(12%)

    // Quỹ đạo nằm sau hạt nhân. Ba elip cùng tâm tạo dáng biểu tượng nguyên tử.
    for g in (0deg, 60deg, -60deg) {
      elip(ctx, O, a, b, quay: g, mau: net-quy-dao, day: 1.8pt)
    }

    // Cầu có bóng đổ, gradient lệch về góc trên-trái và một điểm lóe nhỏ.
    let cau = (P, r, sang, giua, toi) => {
      duong-tron(ctx, (P.at(0) + 0.09, P.at(1) - 0.10), r * 1.02,
        mau: rgb(0, 0, 0, 0), day: 0pt, to: rgb(0, 0, 0, 52))
      duong-tron(ctx, P, r,
        mau: toi.darken(12%), day: 0.65pt,
        to: gradient.radial(
          sang, giua, toi,
          center: (31%, 27%), radius: 78%,
        ),
      )
      duong-tron(ctx, (P.at(0) - 0.20 * r, P.at(1) + 0.24 * r), 0.13 * r,
        mau: rgb(255, 255, 255, 0), day: 0pt, to: rgb(255, 255, 255, 175))
    }

    let do-sang = rgb("#fff0e9")
    let do-giua = rgb("#ff3d31")
    let do-toi = rgb("#8f0909")
    let xanh-sang = rgb("#eef2ff")
    let xanh-giua = rgb("#3859ed")
    let xanh-toi = rgb("#101775")
    let den-sang = rgb("#f7f7f7")
    let den-giua = rgb("#686868")
    let den-toi = rgb("#050505")

    // Hạt nhân: vẽ lớp sau trước để các quả cầu chồng lên nhau tự nhiên. ((0.53, -0.30), "do"),
    let hat = (((0.62, -0.45), "xanh"),
       ((0.10, 0.68), "xanh"), ((0.60, 0.30), "do"),
      ((-0.70, -0.18), "xanh"), ((-0.48, 0.42), "do"),
      ((-0.28, -0.62), "do"),  (O, "xanh")
    )
    for h in hat {
      if h.at(1) == "do" {
        cau(h.at(0), 0.60, do-sang, do-giua, do-toi)
      } else {
        cau(h.at(0), 0.60, xanh-sang, xanh-giua, xanh-toi)
      }
    }

    // Electron đặt đúng trên ba quỹ đạo.
    let tren-elip = (t, g) => quay-diem(
      (a * calc.cos(t), b * calc.sin(t)), O, g,
    )
    let E1 = tren-elip(145deg, 0deg)
    let E2 = tren-elip(25deg, 60deg)
    let E3 = tren-elip(-20deg, -60deg)
    for E in (E1, E2, E3) {
      cau(E, 0.43, den-sang, den-giua, den-toi)
    }

    // Đường dóng và chú thích màu theo đúng hạt được chỉ tới.
    let cam = rgb("#b86a17")
    let xanh-chu = rgb("#176ea1")
    let do-chu = rgb("#a91e22")
    doan(ctx, (-5.55, 0.05), (-1.18, 0.05), mau: cam, day: 0.75pt)
    nhan(ctx, (-5.62, 0.05), text(size: 12pt, weight: "bold")[HẠT NHÂN],
      huong: "left", cach: 2pt, mau: cam)

    mui-ten(ctx, (5.10, 1.25), (0.40, 0.76),
      mau: xanh-chu, day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, 1.25), text(size: 12pt, weight: "bold")[PROTON],
      huong: "right", cach: 2pt, mau: xanh-chu)

    mui-ten(ctx, (5.10, -0.05), (0.68, -0.25),
      mau: do-chu, day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, -0.05), text(size: 12pt, weight: "bold")[NEUTRON],
      huong: "right", cach: 2pt, mau: do-chu)

    mui-ten(ctx, (5.10, -2.65), (E3.at(0) + 0.12, E3.at(1) + 0.12),
      mau: luma(15%), day: 0.75pt, kich: 5pt)
    nhan(ctx, (5.18, -2.65), text(size: 12pt, weight: "bold")[ELECTRON],
      huong: "right", cach: 2pt, mau: luma(15%))
  },
))

// ---------------------------------------------------------

