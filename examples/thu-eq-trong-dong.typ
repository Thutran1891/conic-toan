// Thử: công thức viết dạng KHỐI `$ ... $` (có khoảng trắng sát hai dấu $)
// trong phương án #tn / ý #ds phải hiển thị TRONG DÒNG như `$...$`.
// Biên dịch: typst compile thu-eq-trong-dong.typ
//            typst compile thu-eq-trong-dong.typ --input ho-so=loigiai
#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "dethi")
#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ ÉP CÔNG THỨC KHỐI THÀNH TRONG DÒNG],
  tieu-de-ngan: [Thử eq trong dòng],
)

#phan[Mục 1 — hệ 3 bpt viết `$ ... $` (khối). Phải nằm TRONG DÒNG, 4 cột.]

#tn([Điểm $M(1; 1)$ là nghiệm của hệ bất phương trình nào sau đây?], (
  $ cases(x < 0, y > 0, x + y < 3) $,
  $ cases(x > 0, y < 0, x + y < 3) $,
  True($ cases(x > 0, y > 0, x + y < 3) $),
  $ cases(x > 0, y > 0, x + y > 3) $
), loigiai: [Thay $x = 1, y = 1$: cả ba bất phương trình của C đều đúng.])

#phan[Mục 2 — hệ 2 bpt viết `$...$` (trong dòng). MỐC ĐỐI CHIẾU, phải y như cũ.]

#tn([Điểm $M(1; 2)$ là nghiệm của hệ bất phương trình nào sau đây?], (
  $cases(x + y > 3, 2x - y < 0)$,
  True($cases(x + y >= 3, 2x - y >= 0)$),
  $cases(x - y > 0, x > 1)$,
  $cases(2x + y <= 3, x + y > 4)$
), loigiai: [$1 + 2 = 3 >= 3$ và $2(1) - 2 = 0 >= 0$.])

#phan[Mục 3 — TẮT riêng một câu: `trong-dong: false` ⇒ trở lại dáng khối cũ.]

#tn([Cùng câu ở mục 1 nhưng TẮT ép trong dòng (đối chiếu bố cục cũ).], (
  $ cases(x < 0, y > 0, x + y < 3) $,
  True($ cases(x > 0, y > 0, x + y < 3) $),
  $ cases(x > 0, y < 0, x + y < 3) $,
  $ cases(x > 0, y > 0, x + y > 3) $
), trong-dong: false, loigiai: [Phương án B đúng.])

#phan[Mục 4 — ý #ds cũng ép được; và hình/bảng làm phương án phải GIỮ NGUYÊN.]

#ds([Cho hệ $cases(x > 0, y > 0, x + y < 3)$. Xét tính đúng sai:], (
  True([Cặp $ (x; y) = (1; 1) $ thoả mãn hệ.]),
  [Điểm $O(0; 0)$ thoả mãn hệ.],
  True([Miền nghiệm là một tam giác.]),
  [Hệ vô nghiệm.],
), loigiai: [a) đúng; b) sai vì $x > 0$ ngặt; c) đúng; d) sai.])

#tn([Phương án là HÌNH — bố cục phải giữ nguyên như trước.], (
  True([#hinh(w: 2.5cm, ctx => { da-giac(ctx, ((0, 0), (2, 0), (1, 1.4))) })]),
  [#hinh(w: 2.5cm, ctx => { duong-tron(ctx, (0, 0), 0.8) })],
  [#hinh(w: 2.5cm, ctx => { da-giac(ctx, ((0, 0), (2, 0), (2, 1.2), (0, 1.2))) })],
  [#hinh(w: 2.5cm, ctx => { doan(ctx, (0, 0), (2, 1)) })],
), loigiai: [Hình A là tam giác.])

#phan[Mục 5 — tắt TOÀN BÀI bằng `#kieu-cau-hoi(eq-trong-dong: false)`.]

#kieu-cau-hoi(eq-trong-dong: false)

#tn([Tắt toàn bài: hai câu dưới phải ra dáng KHỐI như bản cũ.], (
  $ cases(x < 0, y > 0) $,
  True($ cases(x > 0, y > 0) $),
  $ cases(x > 0, y < 0) $,
  $ cases(x < 0, y < 0) $
), loigiai: [B đúng.])

#kieu-cau-hoi(eq-trong-dong: true)

#het()
#bang-dap-an()
