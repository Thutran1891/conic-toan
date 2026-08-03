// thu-om-chan-doan.typ — IN RA các con số bên trong chế độ ôm hình.
// Biên dịch:  typst compile thu-om-chan-doan.typ
// Gửi lại trang PDF này để biết chỗ nào chưa chạy đúng.
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.5cm)
#set text(size: 10pt, lang: "vi")

#let hinh-thu = hinh(w: 4.4cm, xmin: -1.25, xmax: 1.25, ymin: -0.25, ymax: 1.2, ctx => {
  cung((0, 0), 1, tu: 0deg, den: 180deg)
  cac-doan((-1, 0), (1, 0))
})

#let lg = [
  1\) Ta có $E F perp A D => angle E F D = 90degree$.

  Lại có $angle A C D = 90degree$ (góc nội tiếp chắn nửa đường tròn) hay
  $angle E C D = 90degree$.

  Vì $angle E F D = angle E C D = 90degree$ nên tứ giác $C E F D$ nội tiếp
  đường tròn đường kính $E D$.

  2\) *Phương pháp toạ độ:*

  Đặt hệ trục toạ độ sao cho đường tròn đường kính $A D$ là đường tròn đơn vị,
  tức là $A(-1; 0)$, $D(1; 0)$, và chọn
  $ B ((1 - m^2)/(1 + m^2); (2m)/(1 + m^2)), quad C ((1 - n^2)/(1 + n^2); (2n)/(1 + n^2)) quad (m > n > 0). $

  Từ phương trình các đường thẳng $A C$ và $B D$, ta tìm được giao điểm
  $ E (-(m n - 1)/(m n + 1); (2n)/(m n + 1)). $

  Vì $F$ là hình chiếu của $E$ lên $A D$ nên $F(-(m n - 1)/(m n + 1); 0)$.

  Dòng cuối cùng để phần dưới đủ dài.
]

= CHẨN ĐOÁN CHẾ ĐỘ ÔM HÌNH

#context [
  - Kiểu `_f-seq` = #repr(_f-seq)
  - Lời giải có phải sequence: #repr(_la-seq(lg))
  - Số khối `_tach-doan` cắt được: *#_tach-doan(lg).len()*
  - Số khối SAU khi qua `_ghep` (đường đi thật của bản A4):
    *#_tach-doan(_ghep(lg)).len()* --- hai số này phải cùng lớn hơn 1
  - Công tắc `_om-bat(auto)`: *#repr(_om-bat(auto))*
  - Trạng thái `_kieu` = #repr(_kieu.get())
]

#context layout(kich => {
  let w = measure(hinh-thu).width
  let cao = measure(hinh-thu).height
  let hep = kich.width - w - 14pt
  let khoi = _tach-doan(_ghep(lg))
  let k = _dem-khoi-om(khoi, hep, cao)
  [
    - Bề rộng khung `kich.width` = #kich.width
    - Bề rộng hình = #w --- Chiều cao hình = #cao
    - Bề rộng cột hẹp `hep` = #hep
    - *Số khối lọt cạnh hình: k = #k* (trên tổng #khoi.len() khối)
  ]
  v(6pt)
  [ Chi tiết từng khối (cao đo ở cột hẹp / rộng tự nhiên / quá rộng?): ]
  for (i, x) in khoi.enumerate() [
    #let c = measure(block(width: hep, x.nd)).height
    #let r = measure(x.nd).width
    - khối #i: cao #c, rộng tự nhiên #r, quá rộng: #repr(_qua-rong(x.nd, hep))
  ]
})

#pagebreak()

= BỐ CỤC THẬT (nội dung ĐÃ qua \_ghep — giống hệt câu #tl)

#voi-hinh(_ghep(lg), hinh-thu)

#pagebreak()

= BỐ CỤC KHI TẮT ÔM (đối chiếu)

#voi-hinh(_ghep(lg), hinh-thu, om: false)
