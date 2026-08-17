// thu-an-mat.typ — KIỂM TRA hoạt hình BIẾN MẤT #an / #hien-khoang (08/2026)
// Biên dịch (trình chiếu):  typst compile thu-an-mat.typ
// Bản in đối chiếu:          typst compile --input ho-so=sach-loigiai thu-an-mat.typ in.pdf
// (import THẲNG nguồn dự án để khỏi phải chạy cai-dat-tu-du-an.bat)
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")

#show: bai-giang.with(
  ho-so: ho-so,
  tieu-de: [KIỂM TRA HOẠT HÌNH BIẾN MẤT],
  phu-de: [`#an` / `#hien-khoang`],
  gv: "Kim Thu",
  ngay: "2026",
)

#muc-luc()

// --------------------------------------------------------------------
#muc(ngan: [1])[1. `#an` cơ bản]

// Mục 1: #an dồn lên (mặc định). Bấm sang bước 2 -> dòng giữa biến mất,
// dòng "luôn ở lại" DỒN LÊN lấp chỗ.
#slide(tieu-de: [`#an` — dồn lên (mặc định)], so-buoc: 2)[
  Dòng 1: luôn hiển thị từ đầu.\
  #an(2)[Dòng 2: BIẾN MẤT ở bước 2 (không giữ chỗ → dòng dưới dồn lên).]\
  Dòng 3: luôn ở lại (sẽ dồn lên khi dòng 2 biến mất).
]

// Mục 2: #an giữ chỗ. Dòng dưới ĐỨNG YÊN, chỉ để lại khoảng trống.
#slide(tieu-de: [`#an` — giữ chỗ (giu-cho: true)], so-buoc: 2)[
  Dòng 1: luôn hiển thị.\
  #an(2, giu-cho: true)[Dòng 2: biến mất ở bước 2 nhưng CHỪA khoảng trống.]\
  Dòng 3: đứng yên tại chỗ (bố cục không xê dịch).
]

// --------------------------------------------------------------------
#muc(ngan: [2])[2. Thay thế tại chỗ (`#an` + `#lo`)]

// Mục 3: hiệu ứng "thoát rồi vào" của PowerPoint — giá trị tạm biến mất,
// giá trị đúng hiện lên CÙNG bước 2, tại cùng vị trí.
#slide(tieu-de: [Thay thế: `#an(2)` + `#lo(2)`], so-buoc: 2)[
  Nghiệm của phương trình $x^2 - 3x + 2 = 0$ là:
  #an(2)[$x = 1$ #text(fill: red)[(đáp án tạm — sẽ biến mất)]]
  #lo(2)[$x in {1; 2}$ #text(fill: green.darken(20%))[(đáp án đúng — hiện ở bước 2)]]
]

// --------------------------------------------------------------------
#muc(ngan: [3])[3. `#hien-khoang`]

// Mục 4: hiện trong khoảng [2, 4) — bước 2, 3 thấy; bước 4 biến mất.
#slide(tieu-de: [`#hien-khoang(2, 4)`], so-buoc: 4)[
  Bước 1: chỉ có dòng này.
  #hien-khoang(2, 4)[Gợi ý: xuất hiện ở bước 2, còn ở bước 3, BIẾN MẤT từ bước 4.]
  #lo(4)[Bước 4: gợi ý đã biến mất, chỉ còn kết luận này.]
]

// Mục 5: kết hợp nhiều lệnh trong một slide.
#slide(tieu-de: [Kết hợp `#lo` / `#chi` / `#an`], so-buoc: 4)[
  Nội dung nền (luôn hiện).
  #lo(2)[#chu-y[Chú ý hiện từ bước 2, ở lại tới hết.]]
  #chi(3)[Chỉ nhấp nháy ở bước 3.]
  #an(3)[Biến mất khi tới bước 3.]
  #lo(4)[Kết luận hiện ở bước 4.]
]
