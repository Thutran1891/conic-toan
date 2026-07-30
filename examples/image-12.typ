// =====================================================================
// image-12.typ — KHO HÌNH VẼ DÙNG CHUNG (Toán 12)
//
// Cách dùng ở file đề/bài giảng (cùng thư mục):
//   #import "image-12.typ": hinh-be-ca, hinh-cong, hinh-phong-thi, hinh-cau-thang
// rồi truyền vào câu hỏi:  hinh: hinh-be-ca
//
// Ghi chú chung: #hinh(...) tạo khung vẽ toạ độ toán (trục y hướng LÊN);
// ctx => { ... } là hàm vẽ, mọi hàm (doan, cung, elip, nhan, ...) đều nhận
// ctx làm đối số đầu tiên.
// =====================================================================
#import "lib/ve.typ": *

// ---- Hình 1: bể cá — phần khối cầu, miệng mài phẳng ----
// (mặt trong bán kính 2 dm, tâm cách mặt phẳng miệng 1 dm)
#let hinh-be-ca = hinh(
  w: 5.4cm, xmin: -2.5, xmax: 2.5, ymin: -2.25, ymax: 1.55,
  ctx => {
    let r-mieng = calc.sqrt(3)                       // bán kính miệng = sqrt(2² − 1²)
    elip(ctx, (0, 1), r-mieng, 0.3)                  // miệng bể (elip vì nhìn nghiêng)
    cung(ctx, (0, 0), 2, tu: 150deg, den: 390deg)    // thân cầu: cung đi qua đáy
    diem(ctx, (0, 0), bk: 1.6pt)                     // tâm mặt cầu
    doan(ctx, (0, 1), (0.55, 1), dut: true)          // hai vạch gióng ngang
    doan(ctx, (0, 0), (0.55, 0), dut: true)
    doan(ctx, (0.55, 0), (0.55, 1))                  // đoạn 1 dm, mũi tên 2 đầu
    dau-mui-ten(ctx, (0.55, 0), (0.55, 1), kich: 5pt)
    dau-mui-ten(ctx, (0.55, 1), (0.55, 0), kich: 5pt)
    nhan(ctx, (0.62, 0.5), [1 dm], huong: "right")
    doan(ctx, (0, 0), (-1.88, -0.68), dut: true)     // bán kính tới điểm góc 200°
    nhan(ctx, (-0.94, -0.34), [2 dm], huong: "above")
  },
)

// ---- Hình 2: cống trụ nằm ngang chứa nước (phối cảnh xiên 3D) ----
// Mẹo 3D: TỊNH TIẾN đáy phải lên một đoạn `e` — mọi điểm đáy phải đều cộng
// thêm (D, e). Mặt nước cắt hai đáy theo hai dây cung CÙNG độ cao so với tâm,
// nên 4 đầu mút dây cung tạo thành HÌNH BÌNH HÀNH (2 cạnh bên song song trục).
#let hinh-cong = hinh(
  w: 6cm, xmin: -0.65, xmax: 6.65, ymin: -1.5, ymax: 1.95,
  ctx => {
    let (R, a, D, e) = (1.2, 0.42, 6.0, 0.55)  // bán kính, bán trục elip, dài, độ nâng
    let y = -0.6                               // mực nước so với tâm đáy: y = −R + h
    let x = a * calc.sqrt(1 - (y / R) * (y / R))   // nửa dây cung nước trên elip đáy
    let O2 = (D, e)                            // tâm đáy phải (đã nâng lên e)
    let m-tru = rgb("#0e7490")
    let m-nuoc = rgb("#38bdf8")
    // khối nước trong lòng cống: cung đáy trái + đáy dưới + cung đáy phải
    da-giac(
      ctx,
      diem-cung((0, 0), a, R, -30deg, -90deg)     // mép nước trái vòng xuống đáy
        + ((D, e - R),)                            // điểm thấp nhất của đáy phải
        + diem-cung(O2, a, R, 270deg, 330deg),     // vòng lên mép nước phải
      mau: m-nuoc, day: 0.4pt, to: m-nuoc.lighten(55%),
    )
    // MẶT NƯỚC: hình bình hành nối 4 đầu dây cung của hai đáy
    da-giac(ctx, ((-x, y), (D - x, y + e), (D + x, y + e), (x, y)),
      mau: blue.darken(20%), day: 0.4pt, to: m-nuoc.lighten(78%))
    doan(ctx, (x, y), (D + x, y + e), mau: blue.darken(20%), day: 1.1pt)  // mép trước
    doan(ctx, (-x, y), (D - x, y + e), mau: blue.darken(20%), dut: true)  // mép sau (khuất)
    doan(ctx, (-x, y), (x, y), mau: blue.darken(20%), dut: true)          // dây đáy trái (khuất)
    // mặt cắt nước ở đáy phải: hình viên phân tô đậm hơn
    da-giac(ctx, diem-cung(O2, a, R, 210deg, 330deg),
      mau: m-nuoc.darken(10%), day: 0.6pt, to: m-nuoc.lighten(25%))
    // khung trụ: 2 đường sinh + đáy phải trọn + đáy trái (nửa thấy, nửa khuất)
    doan(ctx, (0, R), (D, R + e), mau: m-tru, day: 1.1pt)
    doan(ctx, (0, -R), (D, -R + e), mau: m-tru, day: 1.1pt)
    elip(ctx, O2, a, R, mau: m-tru, day: 1.1pt)
    cung-elip(ctx, (0, 0), a, R, tu: 90deg, den: 270deg, mau: m-tru, day: 1.1pt)
    cung-elip(ctx, (0, 0), a, R, tu: -90deg, den: 90deg, mau: m-tru, dut: true)
  },
)

// ---- Hình 3: sơ đồ phòng thi 11 ô ----
#let hinh-phong-thi = hinh(
  w: 3.9cm, xmin: -0.15, xmax: 4.15, ymin: -0.15, ymax: 4.15,
  ctx => {
    // góc trái-dưới (cột, hàng) của 11 ô vuông đơn vị
    let cac-o = (
      (0, 3), (1, 3),
      (0, 2), (1, 2),
      (0, 1), (1, 1), (2, 1), (3, 1),
      (1, 0), (2, 0), (3, 0),
    )
    for (x, y) in cac-o {
      da-giac(ctx, ((x, y), (x + 1, y), (x + 1, y + 1), (x, y + 1)), day: 1.1pt)
    }
  },
)

// ---- Hình 4: cầu thang 16 bậc của con châu chấu ----
#let hinh-cau-thang = hinh(
  w: 4.6cm, xmin: -0.8, xmax: 17.6, ymin: -1.6, ymax: 17.9,
  ctx => {
    // dải cầu thang: mép trên là 16 bậc, mép dưới song song thấp hơn 2 đơn vị
    let pts = ((0, 0),)
    for i in range(16) { pts += ((i, i + 1), (i + 1, i + 1)) }
    for i in range(16, 0, step: -1) { pts += ((i, i - 2), (i - 1, i - 2)) }
    da-giac(ctx, pts, mau: rgb("#b7950b"), day: 0.8pt, to: rgb("#f7dc6f"))
    diem(ctx, (7.5, 8.5), bk: 2.6pt, mau: rgb("#1e8449"))   // "châu chấu"
    nhan(ctx, (16, 16), text(weight: "bold", fill: rgb("#e67e22"))[16],
      huong: "above-right")
  },
)
