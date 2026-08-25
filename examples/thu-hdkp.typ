// =====================================================================
// THỬ: #hdkp — CÂU HỎI KHÁM PHÁ DẪN NHẬP VÀO BÀI MỚI
// Biên dịch:  typst compile thu-hdkp.typ
//             typst compile thu-hdkp.typ --input ho-so=dethi
//             typst compile thu-hdkp.typ --input ho-so=beamer
// Điểm khác các dạng còn lại: gợi mở, KHÔNG buộc có lời giải; khai
// `loi-giai:` thì khối ghi "Gợi ý" chứ không phải "Hướng dẫn giải".
// =====================================================================
#import "../baigiang.typ": *
// #import "@local/conic-toan:0.2.0": *

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")
#show: bai-giang.with(tieu-de: [THỬ #`hdkp`], ho-so: ho-so)

#phan([1. ĐỊNH NGHĨA HÀM SỐ LƯỢNG GIÁC])

== 1. Dạng thường gặp nhất: chỉ gợi mở, KHÔNG lời giải

#hdkp([Hoàn thành bảng sau:

#align(center, table(
  columns: 5, align: center + horizon, inset: 6pt,
  $x$, $sin x$, $cos x$, $tan x$, $cot x$,
  $pi / 6$, [?], [?], [?], [?],
  $0$, [?], [?], [?], [?],
  $-pi / 2$, [?], [?], [?], [?],
))])

#hdkp([Giả sử vận tốc $v$ (lít/giây) của luồng khí trong một chu kì hô hấp là
  $v = 0{,}85 sin (pi t) / 3$. Hãy tìm thời gian của một chu kì hô hấp đầy đủ
  và số chu kì hô hấp trong một phút của người đó.])

== 2. Có gợi ý — khối ghi "Gợi ý", không phải "Hướng dẫn giải"

#hdkp([Với mỗi số thực $x$, có bao nhiêu điểm $M$ trên đường tròn lượng giác
  sao cho số đo góc lượng giác $(O A, O M)$ bằng $x$?],
  loi-giai: [
    Đúng MỘT điểm $M$. \
    Do đó $sin x$, $cos x$ xác định duy nhất theo $x$. \
    Từ đó định nghĩa được $tan x = (sin x) / (cos x)$ khi $cos x != 0$.
  ])

== 3. Đổi nhãn thẻ bằng `nhan:` · đổi chữ khối gợi ý bằng `nhan-giai:`

#hdkp([Dáng SGK: thẻ ghi "HĐ1".], nhan: [HĐ1],
  loi-giai: [Nội dung gợi ý.])

#hdkp([Thẻ "Mở đầu", khối gợi ý ghi "Nhận xét".], nhan: [Mở đầu],
  nhan-giai: [Nhận xét],
  loi-giai: [Chữ trên đầu khối đổi theo `nhan-giai:`.])

== 4. Kèm hình (hình tự dò cửa sổ, không phải khai khung)

#hdkp([Trên đường tròn lượng giác, hãy xác định điểm $M$ ứng với số đo $x$.],
  fig: hinh(w: 4.2cm, ctx => {
    let O = (0, 0)
    duong-tron(O, 1.4)
    doan((-1.7, 0), (1.7, 0))
    doan((0, -1.7), (0, 1.7))
    let M = toa-cuc(O, 1.4, 52)
    doan(O, M, mau: red, day: 1.1pt)
    cac-diem((O, $O$, "below-left"), ((1.4, 0), $A$, "below-right"), (M, $M$, "above-right"))
    goc(O, (1.4, 0), M, ten: $x$, mau: red)
  }),
  loi-giai: [Mỗi số thực $x$ cho đúng một điểm $M$.])

== 5. ĐỐI CHIẾU với các dạng sẵn có (phải KHÁC màu, khác chữ khối giải)

#hdkp([`hdkp` — hồng sen, không số, khối ghi "Gợi ý".],
  loi-giai: [Gợi ý.])

#kham-pha([`kham-pha` — xanh lục, không số, khối ghi "Hướng dẫn giải".],
  loi-giai: [Hướng dẫn giải.])

#hd([`hd` — cam, CÓ đánh số.], loi-giai: [Hướng dẫn giải.])

#lt([`lt` — vàng nâu, có số.], loi-giai: [Hướng dẫn giải.])

== 6. Lời giải DÀI (beamer phải tự ngắt màn, nhãn "(tiếp)" cũng là "Gợi ý")

#hdkp([Từ bảng giá trị vừa lập, hãy dự đoán tính chất của hàm số $y = sin x$.],
  loi-giai: [
    Ý 1. Tập xác định là $RR$. \
    Ý 2. Giá trị luôn nằm trong đoạn $[-1; 1]$. \
    Ý 3. Đồ thị nhận gốc toạ độ làm tâm đối xứng. \
    Ý 4. Hàm số tuần hoàn. \
    Ý 5. Chu kì bằng $2 pi$. \
    Ý 6. Thêm dòng cho đủ dài. \
    Ý 7. Thêm dòng nữa. \
    Ý 8. Thêm dòng nữa. \
    Ý 9. Thêm dòng nữa cho chắc chắn phải sang màn tiếp theo. \
    Ý 10. Thêm dòng nữa. \
    Ý 11. Thêm dòng nữa. \
    Ý 12. Dòng cuối cùng.
  ])
