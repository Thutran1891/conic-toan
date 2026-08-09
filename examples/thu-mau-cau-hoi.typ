// =====================================================================
//  THỬ: ĐỔI MÀU / KIỂU THẺ CÂU HỎI GIỮA CHỪNG + BĂNG "DẠNG N"
//  Biên dịch:  typst compile thu-mau-cau-hoi.typ
//              typst compile thu-mau-cau-hoi.typ --input ho-so=loigiai
// =====================================================================
// #import "../baigiang.typ": *
#import "@preview/conic-toan:0.3.1": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")

// ------------ BẢNG MÀU DÙNG CHUNG (khai 1 lần, gọi lại nhiều nơi) ----------
#let m-xanh = rgb("#1f6fb2")
#let m-luc  = rgb("#2e8b57")
#let m-cam  = rgb("#e67e22")
#let m-tim  = rgb("#7d3c98")

// ---------- BĂNG "DẠNG N" (thư viện KHÔNG có sẵn — tự khai ở đây) -------
// Đây chính là thứ mà GV kia nhờ AI viết: một #block bình thường của Typst.
#let dang(chu, mau: m-xanh) = block(
  width: 100%,
  fill: mau.lighten(88%),          // nền nhạt cùng tông
  stroke: 0.8pt + mau,             // viền
  radius: 4pt,
  inset: (x: 10pt, y: 6pt),
  above: 13pt, below: 9pt,
  align(center, text(weight: "bold", fill: mau.darken(12%), size: 0.98em, chu)),
)

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [ÔN TẬP: TỈ SỐ LƯỢNG GIÁC CỦA GÓC NHỌN],
  tieu-de-ngan: [Tỉ số lượng giác],
  mon: [MÔN TOÁN 9],
  thoi-gian: "45 phút",
  hien-ho-ten: true,
  sbd: "lop",
)

// =====================================================================
// PHẦN I — kiểu KHÔNG TÔ: "Câu 1." chữ đậm màu xanh, không có mảng nền
// =====================================================================
#kieu-cau-hoi(mau: m-xanh, hinh: "khong-to")

#phan([PHẦN I. Câu trắc nghiệm nhiều phương án])

#tn([Cho tam giác vuông có một góc nhọn $alpha$. Tỉ số giữa cạnh đối và cạnh kề của góc $alpha$ được gọi là], (
  [$sin alpha$], True([$tan alpha$]), [$cos alpha$], [$cot alpha$],
), cols: 4)

#tn([Giá trị của $tan 45degree$ bằng], (
  True([$1$]), [$sqrt(3)$], [$1/2$], [$sqrt(2)/2$],
), cols: 4)

// =====================================================================
// PHẦN II — kiểu CÓ TÔ: thẻ bo tròn nền cam, chữ trắng
// =====================================================================
#kieu-cau-hoi(mau: m-cam, hinh: "luc-giac")

#phan([PHẦN II. Câu trắc nghiệm đúng sai])

#ds([Khi xét các hệ thức lượng giác cơ bản, các khẳng định sau đây Đúng hay Sai?], (
  True([Nếu $sin 30degree = 1/2$ thì $cos 60degree$ cũng bằng $1/2$]),
  [Tỉ số $sin$ và $cos$ của một góc nhọn thay đổi tuỳ theo độ dài các cạnh],
  [Hai góc phụ nhau luôn là hai góc nhọn của cùng một tam giác vuông],
  True([$tan 60degree$ và $cot 30degree$ có giá trị bằng nhau]),
))

// =====================================================================
// PHẦN III — mỗi DẠNG một màu: đổi #kieu-cau-hoi NGAY TRƯỚC câu
// =====================================================================
#phan([PHẦN III. Tự luận])

#dang([DẠNG 1: TÍNH TỈ SỐ LƯỢNG GIÁC KHI BIẾT ĐỘ DÀI CẠNH], mau: m-xanh)
#kieu-cau-hoi(mau: m-xanh, hinh: "chu-nhat")
#tl([Cho tam giác $A B C$ vuông tại $A$, biết $A B = 6$ cm và $A C = 8$ cm. Tính $B C$ rồi tính $sin B$, $cos B$, $tan B$, $cot B$.],
  loigiai: [$B C = sqrt(6^2 + 8^2) = 10$ cm, suy ra $sin B = 8/10 = 4/5$.])

#dang([DẠNG 2: ỨNG DỤNG TÍNH CHẤT HAI GÓC PHỤ NHAU], mau: m-luc)
#kieu-cau-hoi(mau: m-luc, hinh: "bo-tron")
#tl([Không dùng máy tính, hãy rút gọn $A = sin 25degree - cos 65degree$.],
  loigiai: [Vì $25degree$ và $65degree$ phụ nhau nên $cos 65degree = sin 25degree$, do đó $A = 0$.])

#dang([DẠNG 3: SỬ DỤNG MÁY TÍNH CẦM TAY], mau: m-cam)
#kieu-cau-hoi(mau: m-cam, hinh: "khong-to")
#tl([Tìm số đo góc nhọn $x$ (làm tròn đến phút), biết $sin x = 0,2368$.],
  loigiai: [$x approx 13degree 42'$.])

#dang([DẠNG 4: BÀI TOÁN THỰC TẾ], mau: m-tim)
#kieu-cau-hoi(mau: m-tim, hinh: "")
#tl([Một đoạn dốc dài $4$ m, đỉnh dốc cao $0,4$ m so với mặt bằng. Tính góc dốc $alpha$ (làm tròn đến phút).],
  loigiai: [$sin alpha = 0,4 / 4 = 0,1$ nên $alpha approx 5degree 44'$.])

#het()
#bang-dap-an()
