# Nhật ký thay đổi

Dự án dùng [SemVer](https://semver.org/lang/vi/).

> Gói cục bộ vẫn mang số **0.2.0** để không phải sửa
> `@local/baigiang:0.2.0` trong các file bài giảng đã có; số hiệu dưới đây là
> số phát hành trên Typst Universe (`@preview/conic-toan`).

## 0.3.2 — 02/08/2026

### Thêm

- **Hoán vị (trộn đề) ngay trong gói**: `de-toan(hoan-vi: ...)` —
  `true` (trộn cả câu lẫn phương án) · `"cau"` · `"pa"` · `false`. Chỉ xáo các
  câu **cùng thể loại đứng liền nhau** nên câu không nhảy qua `#phan`; ý a) b)
  c) d) của `#ds` giữ nguyên. Mầm trộn băm từ `ma-de` (`mam:` để đặt tay) và
  bộ sinh số là tất định, nên bản đề thi và bản lời giải luôn ra cùng thứ tự.
  Chỉ chạy ở bản in A4, trình chiếu không trộn.
- **Giãn dòng** `gian-dong` — hệ số nhân vào khoảng cách dòng, cho khi phân
  số / căn thức nhiều tầng làm hai dòng dính nhau. Bốn phạm vi: cả tài liệu
  (`bai-giang`/`de-toan(gian-dong: 1.25)`), đổi giữa bài (`#gian-dong(1.4)`),
  riêng một câu (tham số `gian-dong:` của `#vd`/`#tn`/`#ds`/`#tln`/`#tl`/
  `#hd`/`#lt`/`#vdtt`), riêng một khối (`#voi-gian-dong(1.7)[...]`).
  Đặt `1.0` thì bố cục y như trước.
- **`lib/mat-cong.typ` — nón/trụ tự chia nét liền · nét đứt** (`mat-non`,
  `mat-tru`, `dinh-non`, `tron-ngang`, `mat-cong`, `ve-mat-cong`, `ve-truc-3d`).
  Trước nay `hinh-non`/`hinh-tru` viết cứng "nửa trước liền, nửa sau đứt"; nay
  bắn tia về phía người nhìn nên lo được **cả tự khuất lẫn hai khối che nhau**
  (nón chui vào trụ, trụ nội tiếp nón…). Đường sinh biên tính giải tích. Trục
  khối **đặt nghiêng được** (`nghieng:`, `huong:`, `truc:`), dùng phép chiếu
  trực giao nên cả hình cùng một góc nhìn. Chưa hỗ trợ mặt cầu.
- **Công thức khối trong phương án tự ép về TRONG DÒNG**: gõ `$ cases(...) $`
  (có khoảng trắng sát `$`) là Typst hiểu công thức trình bày giữa dòng, làm mỗi
  phương án chiếm cả một khối cao; nay `tn`/`ds` tự ép về trong dòng nên xếp đủ
  4 cột như khi gõ `$cases(...)$`. Phương án là **hình/bảng giữ nguyên** bố cục.
  Tắt riêng một câu bằng `trong-dong: false`, tắt cả bài bằng
  `#kieu-cau-hoi(eq-trong-dong: false)`.
- **Chia cột phần câu hỏi**: `#show: chia-2-cot` (hai cột đều, tự cân bằng vì
  Typst vốn rót đầy cột 1 trước) và `#show: chia-2-cot-lech(rong-trai: 70%)`
  (cột trái đề, cột phải kẻ dòng cho học sinh làm bài). Đặt ở đâu thì áp dụng
  từ đó trở xuống. **Bắt buộc** `#thoi-cot()` trước `#het()`/`#bang-dap-an()`
  vì lệnh ngắt trang không chạy được bên trong cột. Câu trong cột vẫn trộn
  được khi bật hoán vị.
- `ke-het-trang` — kẻ dòng từ chỗ đặt lệnh xuống hết trang (không phải khai số
  dòng); `them-trang: n` kẻ thêm n trang đầy.
- **Chữ ôm hình** (`om-hinh`) — lời giải dài kèm hình nhỏ thì chữ ôm gọn quanh
  hình thay vì để trống nửa cột. Cắt theo ĐOẠN (không cắt giữa dòng) nên công
  thức lồng nhau không vỡ. **Bật mặc định**; tắt bằng
  `#kieu-cau-hoi(om-hinh: false)` hoặc `voi-hinh(..., om: false)`. Nội dung
  ngắn hơn hình thì giữ nguyên bố cục hai cột cũ.
- `ve-goc(A, O, B)` và `ve-goc-vuong(A, O, B)` — lối viết **đỉnh ở giữa** kiểu
  TikZ (`pic angle = A--O--B`), song song với `goc(O, A, B)` sẵn có.
- Chú thích `///` cho các hàm trong `baigiang.typ` và `ve.typ` để trình soạn
  thảo (Tinymist) hiện gợi ý tham số khi gõ.

### Sửa

- **Bảng biến thiên / bảng xét dấu tự bù ô trống**: dãy `dau` phải dài
  `2 × số mốc − 1` với hai đầu là ô trống `""`; thiếu 1–2 ô nay tự đoán đúng
  đầu nào thiếu thay vì `array index out of bounds`. Thiếu quá 2 ô hoặc thừa
  thì báo lỗi tiếng Việt nói rõ có bao nhiêu / cần bao nhiêu. Kèm theo: `dau`
  nhận số trần (`0` thay `"0"`), `x` và `gia-tri` nhận chuỗi `"-oo"`/`"+oo"`
  và số trần (`-5/3` ra phân số đẹp).
- **Bảng biến thiên đẹp hơn**: mũi tên nay ngắm đúng **tim chữ số** (trước lệch
  4–6pt vì khung chữ có phần trống ascender/descender), và vạch `‖` (điểm không
  xác định) kẻ **kín ô** thay vì hở hai đầu.
- README: ví dụ mục *Giãn dòng* viết `bai-giang.with(..., gian-dong: 1.25)` —
  Typst đọc `...` trơ là toán tử spread nên báo lỗi cú pháp; thay bằng tham số
  cụ thể. Khối lệnh biên dịch nhiều mã đề đánh dấu là ```` ```sh ```` để
  `typst-package-check` không đọc nó như mã Typst (`# cùng thứ tự` bị hiểu là
  mở vùng code).
- `examples/main.typ`: bỏ slide thử nghiệm gọi `tam-giac-vuong` ngoài `#hinh`
  khiến file không biên dịch được.

## 0.3.1 — 30/07/2026

### Sửa

- **Bản 0.3.0 trên registry bị thiếu hàm** (script đồng bộ chết giữa chừng nên
  thư mục nộp không được cập nhật). 0.3.1 bổ sung lại 134 hàm, trong đó có
  trọn hai mô-đun `lib/da-dien.typ` (khối đa diện, thiết diện) và
  `lib/oxyz-toan.typ` (vectơ, mặt phẳng, đường thẳng, mặt cầu, khoảng cách,
  góc trong Oxyz). **Dùng 0.3.1 trở lên, đừng dùng 0.3.0.**

### Thêm

- `goc-luong-giac`, `duong-luon`, `diem-luon`, `nhan-cong`, `xoan-oc`,
  `dieu-khien`.

## 0.3.0 — 27/07/2026

Bản đầu tiên lên [Typst Universe](https://typst.app/universe/package/conic-toan).

### Thay đổi

- Đổi tên gói `baigiang` → **`conic-toan`**; README có phần giới thiệu tiếng
  Anh và ảnh minh hoạ.
- Đổi tên hàm chia cột `cot()` → `chia-cot()` để không trùng `cot` (cotang).

### Thêm

- `#ds` — lời giải gắn liền từng ý: `True(nd, giai: ...)` và
  `False(nd, giai: ...)`. Nhãn a) b) c) d) được đánh lại theo thứ tự sau khi
  hoán vị nên trộn đề không còn lệch lời giải. `loi-giai:` chung vẫn dùng
  song song, in trước làm dẫn nhập.
- Cờ khoá hoán vị: `khoa-y:` (`#ds`) và `khoa-pa:` (`#tn`) — ghi vào metadata
  `<bg-da>` để công cụ trộn biết câu nào không được xáo.

### Sửa

- Khảo sát hàm số: mọi `lim` bọc `limits(lim)` để chỉ số đặt **dưới** ký hiệu
  giới hạn thay vì bên cạnh.

## 0.2.0 — 07/2026

### Thêm mới

- **Vẽ hình phẳng**: `cac-doan` / `duong` (nhiều nét trong một lệnh),
  `cac-diem`, `toa-cuc` (toạ độ cực kiểu TikZ), nhãn giữa đoạn
  (`doan(ten:, tai:, huong:, ten-quay:)`), `duong-gap-khuc`.
- **ctx ngầm**: gọi hàm vẽ không cần truyền `ctx` (`_ctx-ht` + `_voi-ctx`);
  lối gọi cũ `doan(ctx, ...)` vẫn chạy.
- **Miền & phép biến hình**: `gach-vung` (gạch miền bất kì), `mien-tron`,
  `mien-elip`, `giao` / `hop` / `bu`, `ctx-quay`, `ctx-tinh-tien`.
- **Đồ thị**: `tiep-tuyen` + `dao-ham`, `he-truc` (lưới + vạch + số),
  `truc-so`, `hyperbol`, `parabol`, `duong-elip`, `do-thi-cot`,
  `do-thi-nhieu-ham`, `mien-nghiem`, `dien-tich-2-ham`.
- **Bảng biến thiên từ hệ số**: `bbt-bac-hai`, `bbt-bac-ba`,
  `bbt-trung-phuong`, `bbt-phan-thuc`, `bbt-huu-ti`; giá trị cực trị hiện
  căn thức chính xác (`so-can-thuc`, `cuc-tri-bac-ba`, `cuc-tri-huu-ti`).
- **Khảo sát tự động** (`lib/khao-sat.typ`): 5 hàm
  `khao-sat-ve-do-thi-ham-*` sinh trọn lời giải + BBT + đồ thị từ hệ số.
- **Thống kê CT 2018** (`lib/bieu-do-thong-ke.typ`): 5 biểu đồ
  (tần số, đa giác tần số, cột, hộp, quạt) + 14 hàm số đặc trưng mẫu
  số liệu (trung bình, mốt, trung vị, tứ phân vị, phương sai, độ lệch
  chuẩn, khoảng biến thiên, khoảng tứ phân vị — cả bản ghép nhóm).
- **Khối tròn xoay** (`lib/tron-xoay.typ`): `khoi-tron-xoay` (Ox/Oy,
  vành khăn, mặt cắt, công thức thể tích).
- **Hình không gian**: chóp lục giác đều, lăng trụ lục giác đều,
  chóp cụt đều, `hinh-hop-chu-nhat`, `oxyz` có vạch/số/lưới.
- **Đề thi**: form mới `True(...)` gắn đáp án liền phương án, `#het`,
  `#bang-dap-an` (tự sinh bảng đáp án từ metadata), tuỳ chọn header
  (`hien-ho-ten`, `sbd`, `hien-ma-de`), tự chấm câu cuối phương án.

### Thay đổi

- `#phan` phát `heading(level: 1)` thật ⇒ vào được `#outline` và
  bookmark PDF.
- Nhãn đồ thị lấy giá trị chính xác từ hệ số thay vì làm tròn toạ độ.

### Gỡ bỏ

- `lib/tron-de.typ` (chức năng trộn đề chuyển sang ứng dụng web riêng).

## 0.1.0

- Bản đầu tiên: engine vẽ hình, đồ thị, bảng biến thiên, sơ đồ cây,
  8 dạng câu hỏi, một nguồn sinh ba bản PDF (đề thi / lời giải / trình chiếu).
