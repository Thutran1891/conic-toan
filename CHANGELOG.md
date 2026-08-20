# Nhật ký thay đổi

Dự án dùng [SemVer](https://semver.org/lang/vi/).

> Gói cục bộ vẫn mang số **0.2.0** để không phải sửa
> `@local/baigiang:0.2.0` trong các file bài giảng đã có; số hiệu dưới đây là
> số phát hành trên Typst Universe (`@preview/conic-toan`).

## 0.3.5 — chưa phát hành

### Thêm

- **`khoi-cau` — khối cầu cho engine `mat-cong`, nét khuất tự động.** Trước đây
  engine bắn tia chỉ biết nón và trụ; ghi chú cũ nói mặt cầu phải "tính elip
  riêng" nên chưa làm. Thật ra không cần: dưới phép chiếu song song bất kì (kể
  cả chiếu xiên), tia nhìn tiếp xúc mặt cầu đúng trên **đường tròn lớn vuông
  góc hướng nhìn**, nên đường bao dựng bằng `tron-ngang(tâm, r, truc: hướng
  nhìn)` rồi chiếu ra elip một cách tự nhiên. Nhờ đi chung một lượt bắn tia,
  cầu che — và bị che bởi — nón, trụ, đa diện trong cùng lời gọi `mat-cong`.
  Có `xich-dao:` (mặc định bật) và `kinh-tuyen:`; `nghieng:`/`huong:`/`truc:`
  đổi TRỤC CỰC nên chỉ xoay xích đạo và kinh tuyến, KHÔNG đổi đường bao.
  ⚠️ Tên là `khoi-cau` chứ không phải `mat-cau` — `mat-cau(I, R)` đã là kiểu
  dữ liệu mặt cầu của `oxyz-toan`, đặt trùng tên là bị che.
  ⚠️ Cầu **nội tiếp** nón/trụ vẽ trong CÙNG lời gọi sẽ ra gần như toàn nét
  đứt: engine coi khối là đặc và không trong suốt, mà cầu nội tiếp thì nằm hẳn
  trong lòng khối kia. Muốn dáng "trong suốt" kiểu SGK thì vẽ cầu ở một lời
  gọi `mat-cong` riêng rồi chồng lên.
- **`khoi-da-dien` — đa diện đi được vào engine bắn tia, che khuất CHÉO giữa
  hai engine.** Trước đây đa diện (`da-dien`) và mặt cong (`mat-cong`) là hai
  đường vẽ tách biệt: vẽ chung một hình thì mỗi bên tự lo nét khuất của mình,
  cạnh hộp không bị mặt cầu làm đứt và ngược lại. Nay `khoi-da-dien` nhận
  thẳng các khối dựng sẵn của `da-dien` (`..khoi-lap-phuong(a: 3)`) và tham
  gia cùng một lượt bắn tia, nên nón đâm qua hộp hay cầu nằm trong lập phương
  đều ra nét khuất đúng. **`da-dien` cũ không bị sửa một dòng nào** và vẫn
  dùng bình thường; với một khối đứng riêng, hai đường vẽ cho kết quả liền/đứt
  **khớp từng cạnh** (đã đối chiếu lập phương, chóp tứ giác đều, tứ diện đều,
  lăng trụ lục giác đều).
- **Hình kèm lời giải hiện ở MỌI màn của bản trình chiếu.** Lời giải dài hơn
  một slide thì trước đây hình `fig-giai:` chỉ nằm ở màn đầu, các màn "(tiếp)"
  trắng hình — đang chiếu phải nhớ lại hình vừa xem. Nay hình lặp lại ở mọi
  màn của cùng một câu, cả màn tự ngắt lẫn màn do `#sang-man`. Phép đo chia
  màn cũng tính luôn chỗ của hình nên màn "(tiếp)" không còn bị tràn. Tắt cho
  cả tài liệu bằng `#hinh-moi-man(false)`, tắt riêng một câu bằng
  `fig-giai-moi-man: false` (có ở `#vd`/`#tn`/`#ds`/`#tln` và 7 dạng tự luận).
- **`fig-giai:` nhận cả một MẢNG hình — mỗi ý một hình.** Hình thứ *i* dành
  cho màn LOGIC thứ *i* (màn do `#sang-man` ngắt), hết mảng thì các màn sau
  giữ hình cuối. Màn do máy TỰ ngắt vì tràn trang giữ nguyên hình của ý nó
  thuộc về, nên một ý dài bị cắt làm mấy màn vẫn hiện đúng hình của ý đó. Ở
  hai bản A4 (không có khái niệm màn), lời giải được cắt theo `#sang-man` rồi
  ghép **từng ý với hình của ý đó** thành một khối hai cột riêng — hình ý b)
  nằm ngang tầm lời giải ý b), không bị dồn lên cạnh ý a); ý nào vượt quá số
  hình trong mảng thì không có hình.
- **`khoi-tu-dien-deu` có thêm tham số `pha:`** — góc quay của tam giác đáy.

### Thay đổi

- **Dáng mặc định của `khoi-tu-dien-deu` đổi từ `pha: 210deg` sang
  `pha: 270deg`.** Ở 210°, camera chiếu xiên nào có `k · cos(goc)` gần
  `1/√3 ≈ 0,577` (ví dụ `chieu-xien(goc: 15deg, k: 0.6)`) sẽ chiếu hai đỉnh
  đáy vào cùng một đường dọc: một mặt co lại thành một nét, hình đọc không ra.
  Dáng mới giữ cả bốn mặt "thoáng" — A trái, C phải, B trước-dưới, D đỉnh,
  cạnh khuất là AC. Muốn dáng cũ thì đặt `pha: 210deg` (hoặc `pha: auto`).
  ⚠️ Với chiếu XIÊN thì tứ diện đều LUÔN có một mặt bị nhìn nghiêng, xoay đáy
  không chữa được — muốn bốn mặt thoáng phải dùng `chieu-truc-giao`.
  ⚠️ Hình tứ diện đều để `h: auto` sẽ cao thêm chút ít vì tỉ lệ khung đổi từ
  1,10 xuống 1,00; các file có tứ diện nên soi lại chỗ ngắt trang.

### Lưu ý khi nâng cấp

- File cũ nào đã tự chèn hình vào nội dung màn `#sang-man` thì nay hiện **hai
  hình** — bỏ hình chèn tay đó đi, hoặc đặt `fig-giai-moi-man: false` cho câu
  đó. Câu không khai `fig-giai:` thì không đổi gì, và hai bản A4 giữ nguyên
  bố cục cũ.
- Đừng tự dựng `#grid` để đặt hình bên trong `loi-giai:`: làm thế thư viện
  không biết là có hình nên (a) không lặp lại được ở các màn sau, và (b) cả
  lời giải trở thành **một** phần tử nên bộ tự-ngắt-màn không cắt được, slide
  tràn thì phần dư trôi sang trang sau còn hình nằm lại trang trước. Hãy đưa
  hình ra `fig-giai:`.

## 0.3.4 — 18/08/2026

### Thêm

- **`fig-pos: "center"` — hình canh GIỮA, nằm giữa đề và các phương án.** Trước
  đây chỉ có bốn chỗ đặt: `"right"`/`"left"` (hình ở cột bên, chữ ôm quanh),
  `"top"` (hình lên trên cả dòng đề — trông kỳ vì tách khỏi câu hỏi) và
  `"bottom"` (hình xuống dưới cả bốn phương án — người đọc phải nhìn ngược lên).
  Với hình khổ rộng (bảng biến thiên, bảng thống kê, đồ thị lớn) thì không chỗ
  nào đúng cả. Nay `"center"` đặt hình trên dòng riêng, canh giữa, ở giữa phần
  đề và phần phương án / ý hỏi — đúng lối trình bày đề thi. Dùng được cho `#tn`,
  `#ds`, `#tln` (`fig-pos:`) lẫn hình kèm lời giải (`fig-giai-pos:`) và
  `#voi-hinh(..., vi-tri: "center")`. Giá trị `fig-pos` viết sai nay báo lỗi
  ngay kèm danh sách giá trị hợp lệ, thay vì âm thầm rơi về `"right"`.
- **`fig-pos:` / `fig-width:` nay có ở CẢ TÁM dạng câu.** `#vd`, `#tl`, `#hd`,
  `#lt`, `#vdtt` (và `#cau-tl`/`#cau-hd`/`#cau-lt`/`#cau-vdtt`) trước đây chỉ
  nhận `fig-giai-pos:` cho hình kèm lời giải, còn hình ở ĐỀ thì luôn bị ép sang
  cột phải, không có tham số nào chỉnh — tài liệu vẫn ghi là "mọi dạng câu".
  Nay năm dạng này nhận đúng bộ `fig:` / `fig-pos:` / `fig-width:` như
  `#tn`/`#ds`/`#tln`. Bốn dạng kiểu tự luận cũng nhận thêm bí danh `fig:` cho
  `hinh:` ở tầng `#cau-tl`/`#cau-hd`/`#cau-lt`/`#cau-vdtt`. Không khai gì thì
  mặc định vẫn là `"right"` ⇒ bài cũ giữ nguyên bố cục.
- **Bộ hàm hình tròn mới.** `giao-duong-thang-duong-tron((A, B), (O, r))` trả
  mảng giao điểm của đường thẳng và đường tròn, sắp theo chiều `A→B` (`()` không
  cắt · `(P,)` tiếp xúc · `(P1, P2)` cắt). `tiep-tuyen-tai-diem(ctx, O, r, M)`
  vẽ tiếp tuyến qua `M` vuông góc bán kính `OM` (`dai` = nửa độ dài đoạn, auto =
  `1.4·r`). `dung-diem(A, B, goc, r)` trả điểm `M` sao cho tia `AM` = tia `AB`
  quay quanh `A` một góc lượng giác `goc` (độ, dương ngược kim đồng hồ) và
  `AM = r`. `nhan-goc(ctx, ..muc)` đặt nhãn nhiều điểm, phía đặt nhãn xác định
  bằng góc lượng giác thay cho tên hướng — mỗi mục là tuple `(P, nd, goc)`,
  nhận thêm bán kính/màu tuỳ chọn.
- **`dut:` cho `duong-tron-ngoai-tiep` và `duong-tron-noi-tiep`** — vẽ đường
  tròn nét đứt (`dut: false` mặc định ⇒ bài cũ không đổi).
- **`an` / `hien-khoang` — hoạt hình BIẾN MẤT cho trình chiếu (beamer).** Đối
  xứng của `lo`: `#an(n)[…]` hiện từ đầu rồi biến mất từ bước `n` (mặc định dồn
  các phần tử lên, `giu-cho: true` để giữ chỗ). `#hien-khoang(tu, den)[…]` chỉ
  hiện trong khoảng bước `[tu, den)`. Ghép `#an(n)[cũ] #lo(n)[mới]` = thay thế
  phần tử tại chỗ cùng một bước. Bản in (`ho-so` không phải beamer) hiện hết như
  `lo`/`chi`.
- **Nhãn của `bpt` nay nằm nghiêng theo chiều đường.** `bpt(...)` thêm
  `nghieng-ten: true` (mặc định) xoay chữ nhãn theo phương đường và đặt nhãn ôm
  sát đường theo pháp tuyến; `huong-ten` khi đó chỉ còn `"above"`/`"below"` chọn
  phía. `cach-ten: 3pt` chỉnh khoảng cách. `nghieng-ten: false` giữ nguyên lối
  cũ (chữ nằm ngang). Mỗi `bpt` cũng nhận riêng `goc-gach:` / `buoc-gach:` thay
  vì dùng chung của `mien-nghiem`.
- **`dat-lai-cau` tách theo thể loại.** `dat-lai-cau()` nay chỉ đặt lại bộ đếm
  nhóm Câu (`tn`/`ds`/`tln`/`tl`); thêm `dat-lai-cau-vd` / `-hd` / `-lt` /
  `-vdtt` (mỗi hàm một bộ đếm) và `dat-lai-cau-tat-ca()` giữ hành vi cũ (đặt lại
  cả năm nhóm). File đề cũ gọi `#dat-lai-cau()` không đổi hành vi.
- **Ba hình thức hoạt động SGK: `kham-pha` / `trai-nghiem` / `thao-luan`.**
  Nhãn "Khám phá."/"Trải nghiệm."/"Thảo luận." theo lối SGK — hoạt động một lần,
  KHÔNG mang số thứ tự (khác `hd`/`lt`/`vdtt`). Mỗi dạng có màu riêng và bản nội
  dòng `cau-kham-pha` / `cau-trai-nghiem` / `cau-thao-luan` để dùng làm một bước
  bên trong `#slide` (dạng gọi thẳng tự tạo slide nên không lồng được).

### Thay đổi

- **`so-do-cay`: nhãn xác suất của nhánh đi XUỐNG đặt phía DƯỚI cạnh.** Trước
  đây nhãn xác suất trên mọi cạnh đều đặt phía TRÊN đường; với nhánh rẽ xuống
  (nút con thấp hơn nút cha) thì nhãn bị chen vào chỗ rẽ. Nay nhánh đi xuống đặt
  nhãn dưới cạnh (nhánh đi lên/ngang giữ nguyên phía trên), cân đối với các nhánh
  trên cho cây gọn hơn. Chữ vẫn quay theo cạnh, đọc xuôi.

### Sửa

- **Ctx ngầm không còn panic bên trong `measure`.** Các hàm vẽ gọi được KHÔNG
  cần `ctx` (bộ bọc `_voi-ctx` tự lấy khung `#hinh` đang vẽ qua một ngăn xếp
  `state`). Nhưng nội dung dựng trong `measure(...)` không được đưa vào tài liệu
  nên ngăn xếp đó đọc ra rỗng, khiến bộ bọc `panic` và làm HỎNG cả lần biên dịch
  ở bản `beamer` (tự ngắt màn phải đo thử một slide) và ở `cot: auto` của câu
  trắc nghiệm có hình trong phương án. Nay ngăn xếp rỗng trong `measure` được BỎ
  QUA lặng lẽ — phép đo không đổi vì `#hinh` là `box` cố định, nét vẽ đều
  `place` — còn hàm vẽ đặt thật sự NGOÀI mọi `#hinh` để lại một dấu đỏ nhỏ thay
  vì dừng biên dịch. Bản in không đổi.

## 0.3.3 — 09/08/2026

### Thêm

- **`cao-that` — chống dính chữ ở phân số, căn thức.** Typst đóng khung công
  thức TRONG DÒNG theo số đo phông chữ (cap-height → chân chữ, ≈6.83pt ở cỡ
  10pt) chứ không theo nét vẽ, nên `measure($1/2$)` và `measure($0,5$)` ra cùng
  một số trong khi phân số vẽ ra cao gấp đôi và tràn cả trên lẫn dưới. Hệ quả:
  trong một đoạn thì tử số dòng dưới chạm mẫu dòng trên; trong ô của `grid`
  (lưới phương án `#tn`, ý `#ds`, `cot-item`) thì phân số đè sang hàng trên —
  chỗ này `gian-dong` **không** với tới được vì nó chỉ chạm `par.leading`.
  Nay gói đo phần nét tràn thật rồi chèn một cột chống vô hình **rộng 0** ngay
  trước công thức, nên dòng **và** ô tự nới đúng chỗ cần. Công thức thấp
  (`$x$`, `$0,5$`, `$x_(n+1)^2$`) tràn dưới ngưỡng ⇒ không chèn gì, **bố cục
  bài cũ không đổi một pt nào**. Bật sẵn; điều chỉnh bằng `#cao-that(false)`,
  `#cao-that(them: 1pt)`, `#cao-that(hien: true)` (chẩn đoán, in số pt còn
  thiếu sau mỗi công thức), `#kieu-cau-hoi(cao-that: false)` cho cả bài, hoặc
  `#voi-cao-that[...]` cho một khối. Đúng cả khi tài liệu bật
  `#show math.equation.where(block: false): it => math.display(it)`.
- **`gian-dong` nay với tới LƯỚI và tới KHOẢNG CÁCH GIỮA HAI CÂU** — trước đây
  hệ số chỉ ăn cho văn bản trong cùng một móc vuông, nên đặt `gian-dong: 3` thì
  các dòng trong câu giãn gấp ba mà "Câu 2" vẫn dán sát ngay dưới ý c). Nay
  khoảng cách giữa các hàng phương án, giữa các ý `#ds`, `cot-item(cach-hang:
  auto)`, khoảng đề → phương án và khoảng giữa hai câu đều nhân cùng hệ số.
  Hệ số `1.0` cho đúng số cũ.
- **`mui-ten-2-dau`** — đường ghi kích thước: hai đầu mũi tên, số đo nằm giữa
  thân, thân tự cắt chừa chỗ và lót nền. `trong: false` đưa chữ ra ngoài,
  `vach:` vạch chặn hai đầu, `le:` lùi hai đầu, `ten-quay:` chữ nằm dọc. Đoạn
  quá ngắn thì tự đưa chữ ra ngoài.
- **`khung-vua(..muc, le:)`** — trả `(xmin:, xmax:, ymin:, ymax:)` ôm vừa các
  đối tượng, rải thẳng vào `#hinh(..khung-vua(...))`. Sinh ra vì đường tròn
  ngoại tiếp chìa ra ngoài đa giác nên rất hay tràn khung.
- **`tron-qua-diem(ds)`** — đường tròn khớp bình phương bé nhất (Kåsa) qua một
  mảng điểm; 3 điểm cho đúng kết quả `tam-ngoai-tiep`.
- **`co-net(nd)`** — đo chiều cao NÉT VẼ thật của một nội dung (khác `measure`,
  vốn chỉ trả khung phông chữ).
- `phan-giac` thêm `vach: 0..3` (gạch ngang cung), `so-cung: 1..3`,
  `dai-vach:`, `ten-goc:`, `lech:`.

### Sửa

- **`chia-2-cot` nay cân cột cả khi phần câu hỏi DÀI nhiều trang** — trước đây
  chỉ cân được thân gọn trong một trang; đề dài hơn thế thì TRANG CUỐI cột trái
  chạy hết trang còn cột phải bỏ trắng, tốn hẳn nửa tờ giấy. Nay các trang phía
  trước vẫn để Typst rót tự nhiên (chặt nhất, nó chẻ được cả một câu dài làm
  đôi), riêng phần nằm trên trang cuối được chia đều cho các cột. Một đề thử 25
  câu có hình rút từ 7 xuống 6 trang. Thân gõ bằng `#for` cũng chia được (trước
  đó Typst gói cả lô vào MỘT phần tử nên không có mối nào để ngắt cột). Đề
  không chia cột, hoặc vùng chia cột gọn trong một trang, thì bố cục **không
  đổi một pt nào**.
- **Nhãn bị nét vẽ cắt ngang** — nhãn (`nhan`), `o-bo-tron` và ô kết quả của
  `so-do-cay` đặt theo khung phông chữ nên phân số trong nhãn bị cắt. Nay lấy
  `max(khung, biên nét vẽ)`. Chữ thường tràn 0 ⇒ hình cũ giữ nguyên bố cục.
- **`duong-tron-ngoai-tiep` nhận cả ĐA GIÁC**: `(A, B, C)` như cũ hoặc một mảng
  đỉnh. Nhãn tâm `huong-tam: auto` tự chọn phía thoáng nhất nên không rơi lên
  cạnh; `ban-kinh: true` tự chọn đỉnh mà bán kính không nằm đè cạnh (tam giác
  vuông chọn đỉnh góc vuông, không vẽ trùng cạnh huyền). Thêm `ten-r:`,
  `canh:`, `to:`.
- **Biểu đồ thống kê: tên trục hoành không còn bị trục vẽ xuyên qua** — trước
  đặt ngay đầu mũi tên (`above-left`); nay để bên phải và tự nới `xmax` đúng
  bằng bề rộng chữ, nên chữ cũng không tràn ra ngoài hình. Áp cho
  `bieu-do-tan-so`, `da-giac-tan-so`, `bieu-do-cot`, `bieu-do-hop`.

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
