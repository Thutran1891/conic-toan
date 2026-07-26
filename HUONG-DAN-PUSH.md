# Đưa gói `baigiang 0.2.0` lên GitHub

## Cách nhanh nhất: chạy `TAO-REPO-VA-PUSH.bat`

Nháy đúp vào **`TAO-REPO-VA-PUSH.bat`** trong thư mục này. Script sẽ:

1. hỏi tên tài khoản GitHub rồi tự thay vào `typst.toml` + `README.md`;
2. `git init` + commit toàn bộ 34 file;
3. gắn remote, dừng lại nhắc cô tạo kho rỗng trên GitHub;
4. push và gắn nhãn `v0.2.0`.

Khi tạo kho tại https://github.com/new nhớ: tên **`baigiang`**, chọn
**Public**, và **KHÔNG** tích "Add a README / .gitignore / license"
(thư mục này đã có sẵn, tích vào sẽ xung đột khi push).

> Thư mục `github-baigiang` (nếu còn) là bản nháp hỏng — cô xoá đi giúp em.

---

## Hoặc làm tay

## Bước 0 — sửa tên tài khoản GitHub

Trong `typst.toml` và `README.md` có chuỗi `Thutran1891`.
Mở hai file, thay bằng tên tài khoản GitHub thật của cô, rồi:

```bat
cd /d "D:\TYPST BEAMER\baigiang-repo"
git add -A
git commit -m "Cap nhat duong dan kho"
```

## Bước 1 — tạo kho rỗng trên GitHub

Vào https://github.com/new

- **Repository name**: `baigiang`
- **Description**: `Thư viện Typst thuần: vẽ hình, đồ thị, BBT, bài giảng & đề thi Toán THPT`
- Chọn **Public**
- **KHÔNG** tích "Add a README file", "Add .gitignore", "Choose a license"
  (kho ở máy đã có sẵn 3 file này, tích vào sẽ gây xung đột khi push)

Bấm **Create repository**.

## Bước 2 — đẩy mã nguồn lên

Mở Command Prompt (hoặc Git Bash) và chạy:

```bat
cd /d "D:\TYPST BEAMER\baigiang-repo"
git remote add origin https://github.com/Thutran1891/baigiang.git
git push -u origin main
```

Lần đầu push, GitHub sẽ mở cửa sổ đăng nhập trình duyệt. Nếu máy chưa có Git:
`winget install --id Git.Git`.

## Bước 3 — gắn nhãn phiên bản (khuyên làm)

```bat
git tag v0.2.0
git push origin v0.2.0
```

---

# Sau này: gửi lên Typst Universe

## Vướng mắc cần giải quyết trước: TÊN GÓI

Quy tắc đặt tên của Typst Universe cấm dùng tên "hiển nhiên / chính tắc" cho
chức năng của gói, và **quy tắc này áp dụng cho cả tên tiếng nước ngoài**.
`baigiang` = "bài giảng" nên nhiều khả năng bị từ chối, giống như `slides`
bị cấm còn `sliding` thì được.

Một vài hướng đặt tên an toàn hơn (tên riêng + phần mô tả):

| Tên gợi ý | Ghi chú |
|---|---|
| `conic-toan` | gắn với tên ứng dụng ConicTypst cô đang làm |
| `cay-duong` | tên trường, độc đáo, dễ nhớ |
| `giang-tap` | ghép từ, không phải từ chính tắc |
| `phan-trang` | "phấn trắng" — hình ảnh lớp học |

Tên gói bên Universe **không bắt buộc trùng** tên kho GitHub, nên kho
`baigiang` giữ nguyên vẫn được.

## Các mục còn phải chuẩn bị

1. **Mô tả tiếng Anh, 40–60 ký tự.** Đã đặt tạm trong `typst.toml`:
   `Draw math figures, graphs, variation tables and build exam papers.`
   (hơi dài — nên rút ngắn). Không được chứa từ "Typst", "package".
2. **`exclude`** đã khai sẵn (`/examples/`, `/hdsd.pdf`, `/PROMPT-GEMINI.md`)
   để bản tải về gọn nhẹ; README và LICENSE thì KHÔNG được loại trừ.
3. **README** hiện dài 56 KB và toàn tiếng Việt. Universe chấp nhận, nhưng
   nên có một đoạn giới thiệu tiếng Anh ở đầu để người ngoài hiểu gói làm gì.
4. **Giấy phép**: đã có `LICENSE` (MIT) — hợp lệ.
5. **Ảnh minh hoạ**: rất nên có vài ảnh PNG trong README (hình vẽ, đồ thị,
   BBT). Universe hiển thị README ngay trên trang gói.

## Quy trình gửi PR

```bash
# 1. Fork https://github.com/typst/packages rồi clone nông
git clone --depth 1 https://github.com/Thutran1891/packages.git
cd packages

# 2. Tạo thư mục gói (đổi TEN-GOI cho đúng tên đã chọn)
mkdir -p packages/preview/TEN-GOI/0.2.0

# 3. Chép nội dung kho baigiang vào (trừ .git, examples, hdsd.pdf)
#    Nhớ sửa name = "TEN-GOI" trong typst.toml

# 4. Commit & push
git checkout -b TEN-GOI-0.2.0
git add -A
git commit -m "TEN-GOI:0.2.0"
git push -u origin TEN-GOI-0.2.0

# 5. Mở Pull Request về typst/packages
```

Tài liệu chính thức: https://github.com/typst/packages/blob/main/docs/README.md
