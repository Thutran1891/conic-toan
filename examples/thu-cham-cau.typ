// thu-cham-cau.typ — KIỂM TRA tự thêm dấu chấm cuối phương án/ý hỏi (07/2026)
// Biên dịch:  typst compile thu-cham-cau.typ
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.4cm)
#set text(size: 10.5pt, lang: "vi")
#bat-dap-an()

= 1. Thiếu dấu chấm → TỰ THÊM (chữ, công thức, ngoặc)

#cau-mc([Cho hàm số $y = a x^3 + b x^2 + c x + d$. Hàm số đồng biến trên khoảng],
  ([$(-oo; 0)$], True([$(-oo; -2)$]), [$(-2; 0)$], [$(-2; +oo)$]))

#cau-mc([Cấp số cộng $(u_n)$ có $u_1 = 3$, $u_2 = 7$. Công sai $d$ bằng bao nhiêu?],
  ([$d = -4$], True([$d = 4$]), [$d = 10$], [$d = 21$]))

#cau-tf([Cho hình hộp chữ nhật $A B C D. A' B' C' D'$. Xét tính đúng sai:], (
  True([Mặt phẳng $(A D D' A')$ vuông góc với mặt phẳng $(A B C D)$]),
  [Khoảng cách từ $A$ đến mặt phẳng $(B C C' B')$ là độ dài đoạn thẳng $A C$],
  [Thể tích khối hộp chữ nhật bằng $6a^3$],
  True([Khoảng cách từ $A$ đến mặt phẳng $(A' B D)$ bằng $(7a)/6$]),
), o-tick: true)

= 2. ĐÃ CÓ dấu kết → giữ nguyên (. ! ? … : ; và dấu nháy/ngoặc bọc ngoài)

#cau-mc([Mệnh đề kéo theo "$P => Q$" được phát biểu bằng lời là:],
  ([$P$ và $Q$.], [$P$ hoặc $Q$!], True([Nếu $P$ thì $Q$.]), [Bạn chọn $Q$?]))

#cau-tf([Kiểm tra các dấu kết đặc biệt:], (
  [Kết thúc bằng câu trích dẫn "đúng rồi!"],
  True([Kết thúc bằng dấu ba chấm…]),
  [Kết thúc bằng dấu chấm phẩy;],
  [Kết thúc trong ngoặc (đã có chấm.)],
))

= 3. Kết bằng KHỐI (danh sách, xuống dòng, công thức giữa dòng) → KHÔNG thêm

#cau-tf([Các ý kết bằng khối:], (
  [Ý có xuống dòng \ dòng thứ hai],
  [Ý có danh sách:
   - phần tử 1
   - phần tử 2
  ],
  True([Kết bằng công thức trình bày giữa dòng $ integral_0^1 x dif x = 1/2 $]),
  [Ý bình thường],
))

= 4. Công tắc TẮT toàn bài — giữ nguyên đúng như gõ

#kieu-cau-hoi(cham-cuoi: false)
#cau-mc([Đã tắt tự chấm:], ([Phương án A], True([Phương án B]), [Phương án C], [Phương án D]))
#kieu-cau-hoi(cham-cuoi: true)

= 5. Tắt/bật riêng một câu bằng `cham:`

#cau-mc([Tắt riêng câu này (cham: false):],
  ([Không chấm A], True([Không chấm B]), [Không chấm C], [Không chấm D]), cham: false)

#cau-tf([Bật riêng câu này (cham: true):], (
  [Có chấm a], True([Có chấm b]), [Có chấm c], [Có chấm d],
), cham: true)
