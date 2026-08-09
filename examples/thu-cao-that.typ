// =====================================================================
// thu-cao-that.typ — THỬ cơ chế "chiều cao thật của công thức trong dòng"
//
//   typst compile thu-cao-that.typ
//   typst compile thu-cao-that.typ --input ho-so=dethi
//   typst compile thu-cao-that.typ --input ho-so=beamer
//
// TOÀN BỘ file để gian-dong: 1.0 (mốc mặc định). Điều phải thấy:
//   • Mục 1, 3, 5, 7: KHÔNG chỗ nào dính chữ, dù chỉ để gian-dong: 1.0.
//   • Mục 2, 4, 6 là CÙNG nội dung nhưng #cao-that(false) — phải thấy phân số
//     chạm/đè nhau đúng như cô than phiền. Hai mục cạnh nhau để đối chiếu.
//   • Mục 8: chữ THƯỜNG (không công thức) ở hai chế độ phải GIỐNG HỆT NHAU —
//     đây là bằng chứng cơ chế chỉ nới ĐÚNG chỗ có phân số.
//   • Mục 9: #gian-dong(1.6) nay giãn CẢ khoảng cách giữa các phương án và
//     giữa các item cot-item (trước đây không với tới).
// =====================================================================
#import "../baigiang.typ": *

// CỐ Ý khai đúng như file đề thật của cô: phóng to phân số kiểu \displaystyle
// của LaTeX. Đây là cách người dùng hay viết VÀ là ca làm dính chữ nặng nhất,
// nên file thử bắt buộc phải có để không "thử một đằng, dùng một nẻo".
#show math.equation.where(block: false): it => math.display(it)

#let ho-so = sys.inputs.at("ho-so", default: "loigiai")

#kieu-cau-hoi(mau: rgb("#0f4c81"), hinh: "bo-tron")

#show: de-toan.with(
  ho-so: ho-so,
  tieu-de: [THỬ: CHIỀU CAO THẬT CỦA CÔNG THỨC TRONG DÒNG],
  mon: [Toán 11],
  gv: "Kiểm tra lib",
  gian-dong: 1.0,            // MỐC — cố ý KHÔNG bù bằng tay nữa
)

#phan([Mục 1. Phương án trắc nghiệm có phân số — cao-that BẬT (mặc định)])

#tn([Trong mặt phẳng $O x y$, $C$ là điểm biểu diễn của góc $pi/4$ trên đường
tròn lượng giác. Gọi $D$ là điểm đối xứng với $C$ qua gốc toạ độ $O$. Hỏi $D$
có thể là điểm biểu diễn của góc lượng giác nào dưới đây?],
  ($-3pi/4$, $9pi/4$, True($-11pi/4$), $7pi/4$),
  loigiai: [
    Hai điểm đối xứng qua gốc toạ độ biểu diễn cho các góc $alpha + (2k+1)pi$. \
    Với $alpha = pi/4$ thì $D$ biểu diễn góc $pi/4 + pi = 5pi/4$. \
    Với $k = -2$, ta có $5pi/4 - 4pi = -11pi/4$.
  ],
)

#tn([Phương án DÀI để lưới rơi về 2 cột — đây mới là ca hay dính nhất, vì hai
hàng phương án nằm sát nhau trong cùng một lưới.],
  ([Góc lượng giác có số đo $-17pi/4$ và điểm biểu diễn nằm ở góc phần tư thứ hai.],
   True([Góc lượng giác có số đo $13pi/6$ và điểm biểu diễn nằm ở góc phần tư thứ nhất.]),
   [Góc lượng giác có số đo $-11pi/3$ và điểm biểu diễn nằm ở góc phần tư thứ ba.],
   [Góc lượng giác có số đo $19pi/12$ và điểm biểu diễn nằm ở góc phần tư thứ tư.]),
)

#phan([Mục 2. CÙNG hai câu trên nhưng cao-that TẮT — để đối chiếu])

#cao-that(false)

#tn([Trong mặt phẳng $O x y$, $C$ là điểm biểu diễn của góc $pi/4$ trên đường
tròn lượng giác. Gọi $D$ là điểm đối xứng với $C$ qua gốc toạ độ $O$. Hỏi $D$
có thể là điểm biểu diễn của góc lượng giác nào dưới đây?],
  ($-3pi/4$, $9pi/4$, True($-11pi/4$), $7pi/4$),
  loigiai: [
    Hai điểm đối xứng qua gốc toạ độ biểu diễn cho các góc $alpha + (2k+1)pi$. \
    Với $alpha = pi/4$ thì $D$ biểu diễn góc $pi/4 + pi = 5pi/4$. \
    Với $k = -2$, ta có $5pi/4 - 4pi = -11pi/4$.
  ],
)

#tn([Phương án DÀI để lưới rơi về 2 cột — đây mới là ca hay dính nhất, vì hai
hàng phương án nằm sát nhau trong cùng một lưới.],
  ([Góc lượng giác có số đo $-17pi/4$ và điểm biểu diễn nằm ở góc phần tư thứ hai.],
   True([Góc lượng giác có số đo $13pi/6$ và điểm biểu diễn nằm ở góc phần tư thứ nhất.]),
   [Góc lượng giác có số đo $-11pi/3$ và điểm biểu diễn nằm ở góc phần tư thứ ba.],
   [Góc lượng giác có số đo $19pi/12$ và điểm biểu diễn nằm ở góc phần tư thứ tư.]),
)

#cao-that(true)

#phan([Mục 3. cot-item có phân số — cao-that BẬT])

#tl([Biểu diễn các góc lượng giác sau trên đường tròn lượng giác:
  #cot-item(
    [$-750degree$.], [$17pi/4$.], [$11pi/3$.], [$13pi/6$.],
  )],
  loi-giai: [
    Ta viết mỗi góc dưới dạng $alpha + k 2pi$ với $alpha in [0; 2pi)$:
    #cot-item(
      [$-750degree = -30degree - 2 dot 360degree$.],
      [$17pi/4 = pi/4 + 2 dot 2pi$.],
      [$11pi/3 = -pi/3 + 2 dot 2pi$.],
      [$13pi/6 = pi/6 + 2pi$.],
    )
  ],
)

#phan([Mục 4. CÙNG mục 3 nhưng cao-that TẮT])

#cao-that(false)

#tl([Biểu diễn các góc lượng giác sau trên đường tròn lượng giác:
  #cot-item(
    [$-750degree$.], [$17pi/4$.], [$11pi/3$.], [$13pi/6$.],
  )],
)

#cao-that(true)

#phan([Mục 5. Ý đúng-sai và các dòng nối trong cùng một đoạn — cao-that BẬT])

#ds([Cho góc lượng giác $alpha$ thoả mãn $sin alpha = 3/5$ và $pi/2 < alpha < pi$.],
  (True([$cos alpha = -4/5$.]),
   [$tan alpha = 3/4$.],
   True([$cot alpha = -4/3$.]),
   [$sin 2alpha = 24/25$.]),
  loigiai: [
    Vì $pi/2 < alpha < pi$ nên $cos alpha < 0$, do đó $cos alpha = -sqrt(1 - 9/25) = -4/5$. \
    Suy ra $tan alpha = (3/5)/(-4/5) = -3/4$ và $cot alpha = -4/3$. \
    Cuối cùng $sin 2alpha = 2 dot 3/5 dot (-4/5) = -24/25$.
  ],
)

#phan([Mục 6. CÙNG mục 5 nhưng cao-that TẮT])

#cao-that(false)

#ds([Cho góc lượng giác $alpha$ thoả mãn $sin alpha = 3/5$ và $pi/2 < alpha < pi$.],
  (True([$cos alpha = -4/5$.]),
   [$tan alpha = 3/4$.],
   True([$cot alpha = -4/3$.]),
   [$sin 2alpha = 24/25$.]),
  loigiai: [
    Vì $pi/2 < alpha < pi$ nên $cos alpha < 0$, do đó $cos alpha = -sqrt(1 - 9/25) = -4/5$. \
    Suy ra $tan alpha = (3/5)/(-4/5) = -3/4$ và $cot alpha = -4/3$. \
    Cuối cùng $sin 2alpha = 2 dot 3/5 dot (-4/5) = -24/25$.
  ],
)

#cao-that(true)

#phan([Mục 7. Căn thức chồng tầng và chỉ số trên/dưới])

#tln([Tính giá trị của biểu thức $P = (1 + sqrt(3/2))/(2 - sqrt(5/3)) + x_(n+1)^(2k)$
khi $x_(n+1) = 1$ và $k = 1$.], [$4,7$],
  loigiai: [
    Nhiều tầng căn trong CÙNG một đoạn: $sqrt(3/2)$, rồi $sqrt(1 + sqrt(2))$, \
    rồi $root(3, (a^2 + b^2)/(a - b))$ — ba dòng này không được chạm nhau.
  ],
)

#phan([Mục 8. Chữ THƯỜNG — hai chế độ phải giống hệt nhau])

#tl([Đoạn văn không có công thức nào. Nếu cơ chế làm đúng thì đoạn này chiếm
đúng bấy nhiêu chỗ ở CẢ hai chế độ, không giãn thêm một pt nào. \
Dòng thứ hai để đối chiếu khoảng cách dòng. \
Dòng thứ ba để đối chiếu khoảng cách dòng.])

#cao-that(false)

#tl([Đoạn văn không có công thức nào. Nếu cơ chế làm đúng thì đoạn này chiếm
đúng bấy nhiêu chỗ ở CẢ hai chế độ, không giãn thêm một pt nào. \
Dòng thứ hai để đối chiếu khoảng cách dòng. \
Dòng thứ ba để đối chiếu khoảng cách dòng.])

#cao-that(true)

#phan([Mục 9. gian-dong nay với tới lưới phương án và cot-item])

#gian-dong(1.6)

#tn([Với `#gian-dong(1.6)`, khoảng cách GIỮA HAI HÀNG phương án phải nới ra
thấy rõ so với mục 1 (trước đây hệ số này không với tới lưới).],
  ($-3pi/4$, $9pi/4$, True($-11pi/4$), $7pi/4$),
)

#tl([Các item của cot-item cũng phải nới theo:
  #cot-item([$-750degree$.], [$17pi/4$.], [$11pi/3$.], [$13pi/6$.])])

#gian-dong(1.0)

#phan([Mục 10. ĐÚNG CA FILE ĐỀ THẬT — ngoặc giãn ôm phân số])

// Ba ý nối bằng `\` trong MỘT câu tự luận, mỗi ý là một công thức có ngoặc TỰ
// GIÃN ôm phân số — ngoặc cao hơn cả phân số trần nên đây là ca nặng nhất.
// Phải hết dính mà VẪN để gian-dong: 1.0.
#tl([Biểu diễn các giá trị lượng giác sau qua giá trị lượng giác của góc có số
đo từ $0$ đến $pi/4$: \
a) $sin(77pi/15)$; \
b) $cos(115pi/12)$; \
c) $cot(-83pi/18)$;])

#tl([Câu thứ hai để xem khoảng cách GIỮA HAI CÂU có cân đối với khoảng cách
giữa các ý bên trong câu không: \
a) $sin(61pi/14)$; \
b) $cos(97pi/10)$; \
c) $tan(-53pi/16)$;])

#het()

#bang-dap-an()
