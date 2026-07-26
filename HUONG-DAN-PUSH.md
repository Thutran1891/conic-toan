# Kho `conic-toan` — trạng thái & việc còn lại

## Đã xong

- Kho git ở `D:\TYPST BEAMER\baigiang-repo`, đã push lên GitHub.
- `typst.toml` đặt `name = "conic-toan"`, đủ trường bắt buộc của Typst Universe.
- `LICENSE` (MIT), `.gitignore`, `CHANGELOG.md`, `examples/` (12 file mẫu,
  đã biên dịch lại 12/12 không lỗi).

## Việc 1 — đổi tên kho trên GitHub

Vào https://github.com/Thutran1891/baigiang → **Settings** → mục
*Repository name* → sửa thành `conic-toan` → **Rename**.
(GitHub tự chuyển hướng địa chỉ cũ, không sợ gãy liên kết.)

Sau đó chạy trong PowerShell:

```powershell
cd "D:\TYPST BEAMER\baigiang-repo"
git remote set-url origin https://github.com/Thutran1891/conic-toan.git
git add -A
git commit -m "Doi ten goi thanh conic-toan"
git push
git tag v0.2.0
git push origin v0.2.0
```

> Lưu ý: dự án cá nhân trong `D:\TYPST BEAMER` **vẫn dùng**
> `@local/baigiang:0.2.0` như cũ — em không đụng vào. Chỉ bản public
> mang tên `conic-toan`.

---

# Gửi lên Typst Universe

## Chưa gửi gì cả

Push lên kho riêng và đăng lên Universe là **hai việc tách rời**. Hiện mới
xong việc thứ nhất. Universe chưa biết gói của cô tồn tại, nên chưa có gì
để "chờ duyệt".

Muốn lên Universe phải mở Pull Request vào kho `typst/packages`. Chỉ khi PR
đó được gộp thì gói mới xuất hiện và người khác import được bằng
`#import "@preview/conic-toan:0.2.0": *`.

## Nên chuẩn bị thêm trước khi gửi PR

1. **Ảnh minh hoạ trong README.** Universe hiển thị README ngay trên trang
   gói. Vài ảnh PNG (hình không gian, đồ thị, BBT, một trang đề) sẽ có sức
   thuyết phục hơn nhiều so với chữ.
2. **Đoạn giới thiệu tiếng Anh** ở đầu README. Toàn bộ README hiện là tiếng
   Việt — hợp lệ, nhưng người duyệt và người dùng quốc tế cần vài dòng hiểu
   gói làm gì.
3. **Rút gọn `description`.** Universe khuyên 40–60 ký tự. Hiện là
   `Draw math figures, graphs, variation tables and build exam papers.`
   (66 ký tự) — có thể rút thành `Draw math figures, graphs and variation tables.`
4. **Kiểm tra lại `exclude`.** Đang loại `/examples/`, `/hdsd.pdf`,
   `/PROMPT-GEMINI.md` khỏi bản tải về. README và LICENSE thì không được loại.

## Quy trình gửi PR

```bash
# 1. Fork https://github.com/typst/packages rồi clone nông
git clone --depth 1 https://github.com/Thutran1891/packages.git
cd packages

# 2. Tạo thư mục gói
mkdir -p packages/preview/conic-toan/0.2.0

# 3. Chép nội dung kho conic-toan vào (KHÔNG chép .git, examples, hdsd.pdf,
#    PROMPT-GEMINI.md — những thứ đã khai trong exclude vẫn nên có mặt trên
#    kho nhưng không cần trong thư mục nộp)

# 4. Commit & push
git checkout -b conic-toan-0.2.0
git add -A
git commit -m "conic-toan:0.2.0"
git push -u origin conic-toan-0.2.0

# 5. Mở Pull Request về typst/packages
```

Người duyệt là tình nguyện viên của Typst; thời gian phản hồi thường vài
ngày đến vài tuần, và họ hay góp ý về tên gói, mô tả, README trước khi gộp.

Tài liệu chính thức: https://github.com/typst/packages/blob/main/docs/README.md
