// =====================================================================
// THỬ: #phuong-phap — KHUNG PHƯƠNG PHÁP GIẢI MỘT DẠNG TOÁN
// Biên dịch:  typst compile thu-phuong-phap.typ
//             typst compile thu-phuong-phap.typ --input ho-so=dethi
//             typst compile thu-phuong-phap.typ --input ho-so=beamer
//
// Cùng họ với #dinh-nghia / #dinh-ly / #tinh-chat / #cong-thuc, nhưng:
//   • nhãn PHƯƠNG PHÁP, màu cam đất #d35400 (khác cả 6 màu đang có);
//   • CÓ đánh số, bộ đếm RIÊNG (_bd-pp) — không đụng Ví dụ / Luyện tập;
//   • tắt số bằng `so: false`, đặt lại số bằng #dat-lai-cau-pp().
// =====================================================================
#import "../baigiang.typ": *
// #import "@local/conic-toan:0.2.0": *

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")
#show: bai-giang.with(tieu-de: [THỬ #`phuong-phap`], ho-so: ho-so)

#phan([1. CẤP SỐ CỘNG])

== 1. Dạng dùng nhiều nhất — có `ten:`, số tự tăng

#phuong-phap(ten: [Tìm số hạng tổng quát])[
  Để tìm công thức số hạng tổng quát $u_n$ khi biết dãy là cấp số cộng:
  - *Bước 1:* Xác định số hạng đầu $u_1$ và công sai $d$ từ hệ thức đã cho.
  - *Bước 2:* Áp dụng công thức số hạng tổng quát của cấp số cộng:
    $ u_n = u_1 + (n - 1) d $
  - *Bước 3:* Rút gọn biểu thức để được công thức cuối cùng theo $n$.
]

#phuong-phap(ten: [Tính tổng $n$ số hạng đầu])[
  - *Bước 1:* Tìm $u_1$ và $d$.
  - *Bước 2:* Dùng một trong hai công thức
    $ S_n = n / 2 (2 u_1 + (n - 1) d) = n / 2 (u_1 + u_n). $
  - *Bước 3:* Thay số, rút gọn.
  Số của khung này phải là *2* — bộ đếm riêng, chưa từng bị Ví dụ đụng tới.
]

== 2. Không có `ten:` — chỉ còn nhãn và số

#phuong-phap[
  Nhận dạng cấp số cộng: chứng minh $u_(n + 1) - u_n$ là một hằng số không
  phụ thuộc $n$. Khung này phải mang số *3*.
]

== 3. Tắt số bằng `so: false`

#phuong-phap(so: false, ten: [Chú ý khi trình bày])[
  Khung này KHÔNG có số, và cũng KHÔNG được làm bộ đếm nhảy — khung ở mục 4
  ngay dưới phải mang số *4*.
]

== 4. Đặt cạnh các khung cùng họ để đối chiếu màu

#phuong-phap(ten: [Đối chiếu])[
  Khung PHƯƠNG PHÁP (cam đất) — số phải là *4*.
]

#dinh-nghia(ten: [Cấp số cộng])[
  Dãy $(u_n)$ là cấp số cộng nếu $u_(n + 1) = u_n + d$ với mọi $n >= 1$.
]

#dinh-ly[
  $u_n = u_1 + (n - 1) d$ với mọi $n >= 1$.
]

#tinh-chat[
  $u_k = (u_(k - 1) + u_(k + 1)) / 2$ với mọi $k >= 2$.
]

#cong-thuc[
  $ S_n = n / 2 (u_1 + u_n) $
]

== 5. Bộ đếm ĐỘC LẬP với Ví dụ / Luyện tập

#vi-du(ten: [Áp dụng phương pháp 1])[
  Cho cấp số cộng $u_1 = 3$, $d = 4$. Tìm $u_n$. (Ví dụ này phải là *Ví dụ 1*.)
]

#luyen-tap[
  Cho $u_1 = -2$, $d = 5$. Tính $S_(10)$. (Phải là *Luyện tập 1*.)
]

#phuong-phap(ten: [Xen giữa Ví dụ và Luyện tập])[
  Khung này phải mang số *5* — Ví dụ và Luyện tập không hề làm nó nhảy số.
]

== 6. `#dat-lai-cau-pp()` — đánh lại từ đầu

#dat-lai-cau-pp()

#phuong-phap(ten: [Sau khi đặt lại])[
  Khung này phải quay về số *1*.
]

#dat-lai-cau-pp(10)

#phuong-phap(ten: [Đánh tiếp từ 11])[
  Khung này phải mang số *11*.
]

== 7. Khung dài — phải tự ngắt sang trang/màn kế tiếp

#dat-lai-cau-pp()

#phuong-phap(ten: [Giải phương trình lượng giác cơ bản])[
  *Bước 1.* Đưa phương trình về một trong bốn dạng cơ bản
  $ sin x = m, quad cos x = m, quad tan x = m, quad cot x = m. $

  *Bước 2.* Xét điều kiện có nghiệm. Với $sin x = m$ và $cos x = m$ thì
  phương trình có nghiệm khi và chỉ khi $-1 <= m <= 1$; với $tan x = m$ và
  $cot x = m$ thì phương trình luôn có nghiệm.

  *Bước 3.* Viết công thức nghiệm:
  $ sin x = sin alpha <==> vec(x = alpha + k 2 pi, x = pi - alpha + k 2 pi) $
  $ cos x = cos alpha <==> x = plus.minus alpha + k 2 pi $
  $ tan x = tan alpha <==> x = alpha + k pi $
  $ cot x = cot alpha <==> x = alpha + k pi $
  với $k in ZZ$.

  *Bước 4.* Nếu đề bài giới hạn $x$ trong một khoảng, thay công thức nghiệm
  vào bất phương trình ràng buộc rồi tìm các giá trị nguyên $k$ thoả mãn.

  *Bước 5.* Kết luận, đối chiếu điều kiện xác định (nếu có mẫu thức hoặc
  hàm $tan$, $cot$).
]

== 8. Đặt trong `#slide` thủ công + hoạt hình `#lo`

// Ở hồ sơ beamer, các khung ở mục 1–7 nằm NGOÀI mọi #slide nên chảy trên
// trang trần và bộ đếm chưa được cộng dồn (đúng như #vi-du/#luyen-tap — cơ
// chế "đóng băng theo slide" chỉ chốt số ở cuối mỗi #slide). Hai slide dưới
// đây mới là phép thử THẬT cho beamer: số phải là 1 rồi 2, và KHÔNG nhảy
// qua từng bước hoạt hình.

#dat-lai-cau-pp()

#slide(tieu-de: [Phương pháp trong slide có hoạt hình], so-buoc: 3)[
  #lo(2)[
    #phuong-phap(ten: [Hiện ở bước 2])[
      Khối khung dùng được ngay bên trong `#slide` vì nó chỉ là nội dung,
      KHÔNG tự tạo slide như `#hd` / `#lt`. Số phải là *1* ở CẢ bước 2 lẫn
      bước 3.
    ]
  ]
  #lo(3)[
    #chu-y[Số của khung không được nhảy qua từng bước hoạt hình.]
  ]
]

#slide(tieu-de: [Slide kế tiếp — số phải chạy tiếp])[
  #phuong-phap(ten: [Slide sau])[
    Khung này phải mang số *2*.
  ]

  #vi-du[Ví dụ xen vào đây cũng không được làm số phương pháp nhảy.]

  #phuong-phap(ten: [Cùng một slide])[
    Khung này phải mang số *3*.
  ]
]
