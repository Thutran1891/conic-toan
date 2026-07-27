# Nhật ký thay đổi

Dự án dùng [SemVer](https://semver.org/lang/vi/).

## Chưa phát hành

> Gói cục bộ vẫn mang số **0.2.0** để không phải sửa
> `@local/baigiang:0.2.0` trong các file bài giảng đã có. Khi gửi lên
> Typst Universe thì đặt thành 0.3.0 (thêm tính năng, tương thích ngược).

### Sửa

- Khảo sát hàm số: mọi `lim` bọc `limits(lim)` để chỉ số đặt **dưới** ký hiệu
  giới hạn thay vì bên cạnh.

### Thêm

- `#ds` — lời giải gắn liền từng ý: `True(nd, giai: ...)` và
  `False(nd, giai: ...)`. Nhãn a) b) c) d) được đánh lại theo thứ tự sau khi
  hoán vị nên trộn đề không còn lệch lời giải. `loi-giai:` chung vẫn dùng
  song song, in trước làm dẫn nhập.
- Cờ khoá hoán vị: `khoa-y:` (`#ds`) và `khoa-pa:` (`#tn`) — ghi vào metadata
  `<bg-da>` để công cụ trộn biết câu nào không được xáo.

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
