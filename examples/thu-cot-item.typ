// thu-cot-item.typ — KIỂM TRA dò nhãn gõ tay của cot-item (07/2026)
// Biên dịch:  typst compile thu-cot-item.typ
// Mong đợi: KHÔNG chỗ nào hiện nhãn lặp kiểu "a) a)" hay "1) 1.".
#import "../baigiang.typ": *
#set page(paper: "a4", margin: 1.4cm)
#set text(size: 10.5pt, lang: "vi")

= 1. Chưa đánh tay → TỰ đánh a) b) c)

#cot-item(so-cot: 1,
  [Phải quay kim phút mấy phần của một vòng tròn theo chiều ngược chiều kim đồng hồ?],
  [Phải quay kim phút mấy phần của một vòng tròn theo chiều kim đồng hồ?],
  [Có bao nhiêu cách quay kim phút theo một chiều xác định?],
)

= 2. Đã đánh tay a) b) c) → KHÔNG đánh chồng

#cot-item(so-cot: 1,
  [a) Phải quay kim phút mấy phần của một vòng tròn theo chiều ngược chiều kim đồng hồ?],
  [b) Phải quay kim phút mấy phần của một vòng tròn theo chiều kim đồng hồ?],
  [c) Có bao nhiêu cách quay kim phút theo một chiều xác định?],
)

= 3. Đánh tay TIẾP TỤC d) e) f) → vẫn không đánh chồng

#cot-item(so-cot: 1,
  [d) Ý thứ tư của bài trước.],
  [e) Ý thứ năm.],
  [f) Ý thứ sáu.],
)

= 4. Các kiểu nhãn tay khác: 1. · (a) · [b] · A) · ii) · a)không cách

#cot-item(so-cot: 2, [1. Nội dung một.], [2. Nội dung hai.])
#cot-item(so-cot: 2, [(a) Nội dung một.], [(b) Nội dung hai.])
#cot-item(so-cot: 2, [A) Nội dung một.], [B) Nội dung hai.])
#cot-item(so-cot: 2, [i) Nội dung một.], [ii) Nội dung hai.])
#cot-item(so-cot: 2, [a)Nội dung một.], [b)Nội dung hai.])

= 5. TRỘN: item 1 có nhãn tay, item 2 chưa → chỉ item 2 được đánh

#cot-item(so-cot: 1,
  [a) Ý này gõ tay nhãn.],
  [Ý này chưa có nhãn, cot-item phải tự đánh b).],
)

= 6. KHÔNG được nhận nhầm (phải TỰ đánh nhãn)

#cot-item(so-cot: 1,
  [0.5 lít nước được rót vào bình.],
  [$x^2 - 3x + 2 = 0$ có hai nghiệm.],
  [Cho tam giác $A B C$ vuông tại $A$.],
  [12:30 là mấy giờ chiều?],
)

= 7. Công tắc: kieu-nhan: none · do-nhan-tay: false (ép đánh chồng)

#cot-item(so-cot: 2, kieu-nhan: none, [a) Không nhãn nào.], [Cũng không nhãn.])

#cot-item(so-cot: 2, do-nhan-tay: false, [a) Ép đánh chồng.], [b) Ép đánh chồng.])

= 8. Nhãn tay trong ngữ cảnh #hd (như bài Góc lượng giác)

#hd([
  Trên đồng hồ, kim phút đang chỉ đúng số 2.
  #cot-item(
    [a) Phải quay kim phút mấy phần của một vòng tròn theo chiều quay ngược chiều
      kim đồng hồ để nó chỉ đúng số 12?],
    [b) Phải quay kim phút mấy phần của một vòng tròn theo chiều quay của kim đồng
      hồ để nó chỉ đúng số 12?],
    [c) Có bao nhiêu cách quay kim phút theo một chiều xác định để kim phút từ vị
      trí chỉ đúng số 2 về vị trí chỉ đúng số 12?],
    so-cot: 1,
  )
])
