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
- `ve-goc(A, O, B)` và `ve-goc-vuong(A, O, B)` — lối viết **đỉnh ở giữa** kiểu
  TikZ (`pic angle = A--O--B`), song song với `goc(O, A, B)` sẵn có.
- Chú thích `///` cho các hàm trong `baigiang.typ` và `ve.typ` để trình soạn
  thảo (Tinymist) hiện gợi ý tham số khi gõ.

### Sửa

- README: ví dụ mục *Giãn dòng* viết `bai-giang.with(..., gian-dong: 1.25)` —
  Typst đọc `...` trơ là toán tử spread nên báo lỗi cú pháp; thay bằng tham số
  cụ thể.
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
