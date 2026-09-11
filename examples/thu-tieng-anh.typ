#import "../baigiang.typ": *

#let ho-so = sys.inputs.at("ho-so", default: "beamer")
#let tieng-anh = sys.inputs.at("tieng-anh", default: "true") == "true"

#show: de-toan.with(
  ho-so: ho-so,
  tieng-anh: tieng-anh,
  tieu-de: [English label test],
  tieu-de-ngan: [English labels],
  gv: [Teacher Name],
  ngay: [8 September 2026],
  thong-tin-hs: false,
)

#phan[Content frames]

#slide(tieu-de: [Library-generated labels])[
  #dinh-nghia[Definition body.]
  #dinh-ly[Theorem body.]
  #tinh-chat[Property body.]
  #cong-thuc[Formula body.]
  #chu-y[Note body.]
  #ghi-nho[Remember body.]
  #nhan-xet[Remark body.]
]

#vd([Example prompt.], loigiai: [Example solution.])
#tn([Choose one.], ([A], True([B]), [C], [D]), loigiai: [Because B is correct.])
#ds([Decide whether each statement is true or false.],
  (True([First statement.]), [Second statement.]), loigiai: [Check each statement.])
#tln([Give a short answer.], [42], loigiai: [The answer is 42.])
#tl([Write a proof.], loigiai: [A short proof.])
#hd([Complete the activity.], loigiai: [Activity solution.])
#lt([Complete the practice task.], loigiai: [Practice solution.])
#vdtt([Apply the result.], loigiai: [Application solution.])
#kham-pha([Explore the pattern.], loigiai: [Exploration solution.])
#trai-nghiem([Try the experiment.], loigiai: [Experience solution.])
#thao-luan([Discuss the result.], loigiai: [Discussion solution.])
#hdkp([Opening exploration.], loigiai: [A useful hint.])

#bang-dap-an(ngat-trang: false)
