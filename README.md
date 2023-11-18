# Du_an_1

#Member: Tran Quang Hiep (Leader)
         Nguyen Hung Bac

#Name Project: Online Learning Website (PolyLearn)

#Technology used: PHP, MySQL, Bootstrap, HTML5, CSS3, Javascript

#Tools: GIT - GITHUB, TRELLO , FIGMA, GG MEET, ZALO , EXCEL, DRAW.IO

#Technique used: + Autocompalte
                 + Single session per user

#Security:  + Hash_Password(sh1)
            + Decentralization
            + Phân quyền

`Giai đoạn 1 (1/11 - 5/11): Chọn đề tài, Khảo sát, xây dựng cấu trúc dự án (User Flow, Flow Admin, Design DB, Struct Folder Project)

 Giai đoạn 2 (6/11 - 12/11): Xây dựng giao diện User & Admin (có responsive)
 Giai đoạn 3 (13/11 - 19/11): Xây dựng chức năng người dùng (70%)
 Giai đoạn 4 (20/11 - 26/11): Xây dựng chức năng người dùng (30%) và Admin (100%)
 Giai đoạn 5 (27/11 - 3/12): Nâng cấp chức năng, hoàn thành chức năng còn thiếu (nếu có), Testing, Deploy Product
 Giai đoạn 5.5 (4/11 - 6/12): Hoàn thành báo cáo.
`

#Funcition: 
- User: 
+ watch category course: all user
+ watch detail course: all user(name,price, disc, danh sách bài học, comment)(F8 + Udemy)
+ add course cart: all user (Nếu chưa Login sẽ lưu vào locolStorage, có hiện số lượng khóa học được thêm)
+ buy: bắt buộc phải đăng nhập
+ pay: sau khi đăng nhập mới sử dụng được
+ edit info: Họ, tên, username, email, mô tả, avatar
+ my course: sau khi đăng nhập mới hiển thị
+ Notification: // có thể bỏ //
+ Sign in: validate username >= 6; pw >= 8, ký tự đặc biệt, viết hoa , chữ số(oninput)
+ Login: kỹ thuật SINGLE SESSION PER USER (https://www.youtube.com/watch?v=NXtdRO5N6B0)
+ Forget Password: gửi mật khẩu mới về email được đăng ký (user submit quên pw CSDL tự Random 1 pw mới sau đó gửi về Mail)
+ Lưu trữ tk cho lần đăng nhập sau: cookie
+ comment: bắt buộc phải đăng nhập, thêm, sửa, xóa
+ My learning: sau khi đăng nhập mới hiển thị
+ Watch video: sử dụng kỹ thuật load video 1 phần, xem quá 80% mới đc next video
+ lesson list: hiển thị danh sách video trong khóa học đó.
<!-- + *note in video: ghi chú kiến thức. -->
+ Ưu đãi: giá gốc(thẻ del), giá ưu đãi
+ Lịch sử mua
+ Pagination: (Sử dụng Ajax)
+ Search: Autocompalte (Sử dụng Ajax)
<!-- + Delete account: ẩn tk, trong DB có 2 cột userDel (user tự del acc) sẽ bị ẩn
                    AdminHide: admin sẽ ẩn tk đấy -->
Page Liên hệ(F8): cho người dùng gửi phản ánh (Email,tiêu đề,họ tên,sdt, nội dung)
<!-- Search: thanh tìm kiếm chỉ để ở trang Home -->

- Admin:
+ Lịch sử login của Admin, User
+ Info User
+ CRUD và ẩn danh mục khóa học
+ CRUD và ẩn khóa học
+ CRUD và ẩn bài học trong khóa học
+ Thống kê theo biểu đồ miền: total user, User new / tháng; sl User mua khóa học , sl user mua khóa học mới theo tháng; doanh thu, doanh thu/tháng
+ Comment: delete, hide
+ Quản lý: Header, Slider, Footer, Khóa học nổi bật(tự chọn), Tất cả khóa học sắp xếp theo ngày tạo mới nhất/cũ nhất/nhiều lượt mua nhất.
+ DB thêm bảng liên hệ (id, email, tieude, noidung, datraloi(yes/no) )

<!-- Thêm trong trang phương thức thanh toán(VNPay, Mono, ZaloPay, Bank(checked)) -> new Page Xác 
nhận thanh toán(5p không nhấn Xác nhận ) -> Done/Cancelled -->
<!--  -->

<!-- Nâng cao -->
<!-- Quản lý tiến độ học -->
<!-- Quizz -->
<!-- Cấp chứng chỉ -->
<!--  -->
- Cấu trúc thư mục dự án: 
<!-- + Core: select_one, select_all, check_login -->

- Quy tắc đặt tên class, thư mục file: 

- Quy tắc Commit : 
+ thêm file: "add ten_file"
+ sửa tên file: "rename ten_file_ban_dau"
+ xóa file: "delete ten_file"
+ thêm, sửa, xóa chức năng trong file: "add/fix/delete chuc_nang"
+ Ví dụ sửa chức năng Login password phải có tối thiểu 8 kí tự: "fix Login_password_min_8_character"

*<video poster="pathImg" src="movie.mp4" type="video/mp4">*

https://trello.com/invite/b/jFhLgeq6/ATTIbf86315f17b22f8d8bc7b306138232d69623D632/team-7-dự-an-1-wd18322-fa23
https://docs.google.com/spreadsheets/d/1smYUwA34r5nIYrizRLXtsZ42htsLkHi8wvwT6L71IWI/edit?usp=sharing
https://drive.google.com/file/d/1yrhcbrv78VVu5KpYXo_CxQoovJ0XwF-V/view?usp=sharing
https://www.figma.com/file/tkNYYrJwdBd3oOoxgSIPo0/Untitled?type=design&node-id=0%3A1&mode=design&t=ETKx7oBV74YVBtPM-1
https://github.com/hieptqph43210/du_an_1
https://meet.google.com/prg-djva-dji
