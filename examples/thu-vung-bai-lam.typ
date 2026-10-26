// =====================================================================
// thu-vung-bai-lam.typ — thử vùng bài làm một cột / hai cột (0.4.2)
// ---------------------------------------------------------------------
// Cần thấy đúng 4 trang A4:
//   1. Một cột, nét chấm chạy hết bề ngang.
//   2. Một cột, nét liền và tiêu đề tuỳ chỉnh.
//   3. Hai cột nét chấm, có vạch dọc giữa.
//   4. Hai cột nét liền, không có tiêu đề.
// Beamer phải bỏ qua cả hai lệnh và không sinh trang thừa.
// =====================================================================
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ VÙNG BÀI LÀM],
  mon: [MÔN TOÁN],
  thong-tin-hs: false,
)

#tl([Trang 1: Trình bày lời giải vào vùng kẻ ngang toàn bề rộng.])
#vung-bai-lam()

#pagebreak()
#tl([Trang 2: Kiểm tra nét liền và tiêu đề truyền tay.])
#vung-bai-lam(tieu-de: [PHẦN TRẢ LỜI], kieu: "lien", cao-dong: 8mm)

#pagebreak()
#tl([Trang 3: Trình bày lời giải vào vùng giấy hai cột.])
#vung-bai-lam-2-cot()

#pagebreak()
#tl([Trang 4: Kiểm tra hai cột nét liền và chế độ ẩn tiêu đề.])
#vung-bai-lam-2-cot(tieu-de: false, kieu: "lien", cao-dong: 8mm)
