-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 03:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `polyuni`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2023-11-15 04:08:30', '2023-11-15 04:08:30'),
(2, 4, '2023-11-15 04:08:30', '2023-11-15 04:08:30'),
(3, 5, '2023-11-15 04:08:30', '2023-11-15 04:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `cart_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`cart_id`, `course_id`, `added_at`) VALUES
(1, 13, '2023-11-17 14:06:19'),
(1, 10, '2023-11-17 14:06:19'),
(1, 11, '2023-11-17 14:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_price` int(11) NOT NULL DEFAULT 0,
  `course_members` int(11) NOT NULL DEFAULT 0,
  `course_thumbnail` varchar(100) NOT NULL,
  `course_desc` text DEFAULT NULL,
  `course_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Khóa học bị ẩn đi; 1: Khóa học được hiển thị',
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_price`, `course_members`, `course_thumbnail`, `course_desc`, `course_status`, `category_id`, `created_at`, `updated_at`) VALUES
(6, 'Thiết kế web với HTML5-CSS3-JavaScript', 1200000, 0, 'Thiet_ke_web_voi_HTML5_CSS3_JavaScript.jpg', 'Với mong muốn được hỗ trợ mọi người từ những bước đầu tiên vào ngành lập trình, mình đã cho ra mắt khoá học Javascript cho người mới bắt đầu này. Vì nội dung nhắm tới những bạn chưa biết gì cũng có thể học được, nên nội dung được chuẩn bị rất kĩ lưỡng về các thuật ngữ, cũng như từng chi tiết lập trình nhỏ, để mọi người có thể tiếp thu một cách dễ dàng, nhanh chóng.\r\n\r\nNgoài việc tập trung vào kiến thức của ngôn ngữ Javascript, mình cũng có đan xen vào phần giải thuật cơ bản, giúp các bạn vừa có được kiến thức về Javascript vừa có kiến thức về lập trình cơ bản, để có thể tự tin hơn ở những chặng đường tiếp theo.\r\n\r\nNếu các bạn chưa học hoặc đang học mà chưa nắm vững được javascript thì mình tin chắc khoá học này sẽ giúp bạn đạt được điều đó.\r\n\r\nHẹn gặp các bạn trong khoá học nhé!', 1, 1, '2023-11-17 11:21:20', NULL),
(7, 'Khóa học Javascript Chuyên Sâu', 990000, 0, 'Khoa_hoc_Javascript_Chuyen_Sau.jpg', 'Tại sao nên học Javascript\r\n\r\nHiện tại tính ứng dụng của Javascript rất lớn từ \r\n\r\nlập trình web front end với các framework hàng đầu: JQuery, React, Angular, VueJS\r\n\r\nbackend với các framework của NodeJS\r\n\r\nlập trình ứng dụng di động với React Native, Ionic, NativeScript, vv\r\n\r\nlập trình game với Unity\r\n\r\nlập trình robot, IoT\r\n\r\nXu hướng gần đây của giới lập trình là full stack developer. Để tránh việc dùng nhiều ngôn ngữ thì lựa chọn Javascript là khả dĩ nhất.', 1, 1, '2023-11-14 11:21:20', NULL),
(8, 'Lập trình Hướng đối tượng với C++ cơ bản đến nâng cao', 700000, 0, 'Lap_trinh_Huong_doi_tuong_voi_C_co_ban_den_nang_ca', 'Bạn sẽ không phí tiền vô ích!\r\n\r\nBạn hoàn toàn yên tâm chất lượng của khóa học, nếu bạn không hài lòng vì bất kỳ lý do nào, bạn có thể yêu cầu hoàn trả 100% học phí bởi vì Udemy có chính sách đảm bảo 30 ngày.\r\n\r\nLập trình Hướng đối tượng với C++ cơ bản đến nâng cao\r\n\r\nVề khóa học:  \r\n\r\nLập trình Hướng đối tượng là một trong những phương pháp lập trình mà mọi lập trình viên đều phải biết và sử dụng thành thạo.  \r\n\r\nKhóa học này sẽ hướng dẫn bạn tất cả các khái niệm từ cơ bản đến về lập trình hướng đối tượng với C++. Mỗi bài học được trình bày với lý thuyết và ví dụ minh họa dễ hiểu.  \r\n\r\nKhóa học thích hợp với những bạn muốn hiểu rõ về phương pháp lập trình hướng đối tượng.  ', 1, 1, '2023-11-15 11:21:20', NULL),
(9, 'ReactJS cho người mới bắt đầu', 990000, 0, 'ReactJS_cho_nguoi_moi_bat_dau.jpg', 'Ngoài việc giúp bạn nắm vững kiến thức cơ bản và nâng cao kỹ năng lập trình, khóa học ReactJS còn mang lại nhiều lợi ích khác. Đầu tiên, nó giúp bạn hiểu rõ hơn về cách xây dựng các ứng dụng web hiện đại và tương tác người dùng một cách linh hoạt. Điều này làm cho bạn trở nên linh hoạt và có khả năng thích ứng nhanh chóng với các yêu cầu thay đổi trong ngành công nghiệp phần mềm. Không chỉ dừng lại ở việc biết sử dụng ReactJS, mà khóa học còn hướng dẫn cách tích hợp nó với các công cụ và thư viện khác, như Redux, để quản lý trạng thái ứng dụng một cách hiệu quả. Điều này tăng cường khả năng làm việc nhóm và tạo ra mã nguồn dễ bảo trì. Cuối cùng, việc sở hữu kỹ năng ReactJS sẽ giúp bạn thăng tiến trong sự nghiệp nhanh chóng, vì nó là một công nghệ ngày càng được ưa chuộng và có ảnh hưởng mạnh mẽ đến ngành công nghiệp phần mềm. Điều này không chỉ mang lại cơ hội việc làm mà còn mở ra cánh cửa cho các dự án thú vị và thách thức trong tương lai.', 1, 1, '2023-11-16 11:21:20', NULL),
(10, 'Khóa học Bootstrap cho người mới bắt đầu', 500000, 0, 'Khoa_hoc_Bootstrap_cho_nguoi_moi_bat_dau.jpg', '1. Giới thiệu tổng quan\r\n\r\nKhóa học Bootstrap Online miễn phí được thiết kế để hướng dẫn người học tạo được giao diện trang web đầy đủ các thành phần, tiết kiệm thời gian và có thể hoạt động tối ưu trên mọi kích thước màn hình. Các bài học được thiết kế hướng project-base. Sau mỗi bài học, học viên sẽ thấy được ngay sản phẩm của mình tương ứng với một phần của trang web. Kết thúc khóa học, học viên có thể tạo được trang web hoàn chỉnh sử dụng Bootstrap Framework.\r\n\r\n2. Học viên sẽ học được những gì?\r\n\r\nP1: Tổng quan về Bootstrap\r\n\r\nP2: Tạo thành phần trang web – Header – Book Overview – Author\r\n\r\nP3: Tạo thành phần trang web – Features – Prices – Download\r\n\r\nP4: Tạo thành phần trong trang web – Reader’s Say – Footer\r\n\r\nP5: Định dạng trang web bằng CSS\r\n\r\nP6: Định dạng trang web bằng JS\r\n\r\n3. Khóa học này dành cho ai?\r\n\r\n- Sinh viên và người đi làm trái ngành quan tâm đến lập trình web\r\n\r\n- Học sinh cấp 3 có đam mê với tin học và muốn tìm hiểu về lập trình căn bản web\r\n\r\n4. Tại sao nên tham gia khóa học?\r\n\r\n1. Giảng viên dày dặn kinh nghiệm: Bạn sẽ được hướng dẫn bởi giảng viên giàu kinh nghiệm và nhiệt tình. Bạn sẽ được đồng hành từng bước trong hành trình học tập.\r\n\r\n2. Thời gian và địa điểm linh hoạt: Khóa học này cho phép bạn học tại bất kỳ đâu có kết nối internet. Bạn có thể tự quản lý thời gian học tập và tích hợp học vào lịch trình hàng ngày của mình.\r\n\r\n3. Dự án thực tế: Bạn sẽ có sản phẩm ngay sau khoá học.\r\n\r\n4. Hỗ trợ và tương tác: Bạn sẽ được hỗ trợ và tương tác với cộng đồng học viên đồng nghiệp và giảng viên thông qua diễn đàn trực tuyến và nhóm học tập.\r\n\r\n5. Điều kiện tiên quyết\r\n\r\nKhông có điều kiện tiên quyết yêu cầu. Chỉ cần đam mê và sự tò mò về lập trình là bạn đã sẵn sàng bắt đầu hành trình này!', 1, 1, '2023-11-17 11:21:20', NULL),
(11, 'Lập trình Web với PHP', 720000, 0, 'Lap_trinh_Web_voi_PHP.jpg', 'Kiến thức trong khóa học giúp học viên nắm vững các khái niệm và kỹ thuật cốt lõi trong lập trình, nâng cao tư duy và kỹ năng lập trình. Kết thúc khóa học này, học viên thành thạo việc phát triển các ứng dụng dựa trên ngôn ngữ PHP, phát triển các ứng dụng dựa trên ngôn ngữ PHP, mô hình lập trình Hướng đối tượng. Học viên cũng được triển khai kiến trúc phần mềm, xây dựng hệ thống web.\r\n\r\n1. Ngôn ngữ PHP\r\n\r\nTrong học phần này, học viên sẽ làm chủ cú pháp của ngôn ngữ PHP. Kết thúc học phần, học viên có thể sử dụng ngôn ngữ PHP để phát triển các ứng dụng phần mềm đơn giản.\r\n\r\nCác mục tiêu của học phần:\r\n\r\nSử dụng được cú pháp ngôn ngữ PHP\r\n\r\nSử dụng được try-catch, xử lý được ngoại lệ\r\n\r\nĐọc và ghi được file text và file nhị phân\r\n\r\nĐọc hiểu được mã nguồn do người khác viết\r\n\r\nĐọc được API của các thư viện\r\n\r\nSử dụng được các hàm thông dụng của các lớp thông dụng (String, Math, DateTime...)\r\n\r\n2. Lập trình hướng Đối tượng nâng cao\r\n\r\nTrong học phần này, học viên sẽ rèn luyện mô hình Lập trình hướng Đối tượng, các đặc điểm quan trọng của Lập trình hướng Đối tượng, có khả năng thiết kế được các giải pháp cơ bản sử dụng theo mô hình hướng Đối tượng.\r\n\r\nCác mục tiêu của học phần:\r\n\r\nTriển khai được cơ chế ghi đè phương thức (method overloading)\r\n\r\nTrình bày được mô hình phát triển Hướng đối tượng\r\n\r\nThiết kế được các giải pháp cơ bản sử dụng theo mô hình Hướng Đối tượng\r\n\r\nKhai báo được lớp, sử dụng được đối tượng, thuộc tính, phương thức, constructor\r\n\r\nSử dụng được access modifer\r\n\r\nSử dụng được thuộc tính static, phương thức static, getter/setter\r\n\r\nTriển khai được cơ chế nạp chồng phương thức (overloading)\r\n\r\nSử dụng được các hàm thông dụng của các lớp thông dụng (String, Math, LocalDate...)\r\n\r\nTriển khai được cơ chế kế thừa\r\n\r\nKhai báo và sử dụng được abstract class và interface\r\n\r\nSử dụng được các ký hiệu UML để mô tả lớp, interface và các mối quan hệ\r\n\r\nSử dụng được các ký hiệu UML để mô tả biểu đồ activity', 1, 1, '2023-11-18 11:21:20', NULL),
(12, 'Lập trình C#', 820000, 0, 'Lap_trinh_C_Sharp.jpg', 'Bạn mới bắt đầu học lập trình? Bạn đang muốn học thêm ngôn ngữ lập trình mới? C# là lựa chọn hoàn hảo để đáp ứng các nhu cầu trên.\r\n\r\nNgôn ngữ C# là một ngôn ngữ mới, cấu trúc rõ ràng, dễ hiểu và dễ học. C# thừa hưởng những ưu việt từ ngôn ngữ Java, C, C++ cũng như khắc phục được những hạn chế của các ngôn ngữ này. C# là ngôn ngữ lập trình hướng đối tượng được phát triển bởi Microsoft, được xây dựng dựa trên C++ và Java.\r\n\r\nKhoá học lần này sẽ mang đến toàn bộ những kiến thức cơ bản về C#. Chào mừng các bạn đã đến với khoá học LẬP TRÌNH C# CƠ BẢN', 1, 1, '2023-11-16 11:21:20', NULL),
(13, 'C++ Cơ bản dành cho người mới học lập trình', 550000, 0, 'Lap_trinh_C_Sharp.jpg', 'C_PlusPlus_Co_ban_danh_cho_nguoi_moi_hoc_lap_trinh.jpg', 1, 1, '2023-11-17 11:21:20', NULL),
(14, 'Lập trình Java cho người mới học', 850000, 0, 'Lap_trinh_Java_cho_nguoi_moi_hoc.jpg', 'Java là ngôn ngữ được nhiều dự án sử dụng và là ngôn ngữ xếp thứ hạng cao về mức độ phổ biến và sử dụng trên toàn thế giới. Đồng thời hiện tại ở Việt Nam, yêu cầu tuyển dụng các Lập trình viên Java  cho dự án khá lớn.\r\n\r\n\r\n\r\nVới kinh nghiệm tích lũy qua nhiều dự án và giảng dạy các lớp về Java, chúng tôi tạo ra khóa học cung cấp các kiến thức từ đơn giản, bắt đầu nhất của Java đến một số kiến thức chuyên sâu. Khóa học được thiết kế theo công thức: Lý thuyết + Demo + Thực hành bài tập + Đồ án tự thực hiện. Theo đó, nội dung của khóa học sẽ phù hợp với tất cả các Bạn đến với Java, yêu thích Java hay lựa chọn Java làm nghề nghiệp kế tiếp.\r\n\r\n\r\n\r\nNgoài các kiến thức lập trình, khóa học còn cung cấp các kỹ năng lập trình, công cụ và các giải thuật phổ biến, dự án thực hành cần thiết để giúp các bạn tự tin lập trình với Java và vững bước trên con đường phía trước.\r\n\r\n\r\n\r\nCác bạn là học sinh, sinh viên, người mới học hay người đã làm quen với lập trình thì chúng tôi tin chắc đây là khóa học phù hợp nhất để lựa chọn.\r\n\r\n\r\n\r\nHẹn gặp các bạn trong khóa học với những trải nghiệm tốt nhất', 1, 1, '2023-11-10 11:21:20', NULL),
(15, 'Lập trình Python', 700000, 0, 'Lap_trinh_Python.jpg', ' Khóa học \"Lập trình Python từ cơ bản đến nâng cao\" là một khóa học toàn diện dành cho những người muốn học lập trình Python hoặc nâng cao kiến thức của mình về ngôn ngữ lập trình này. Khóa học bao gồm một loạt các bài giảng, bài tập và dự án thực tế nhằm giúp học viên hiểu rõ về cú pháp Python, các khái niệm quan trọng, và phát triển kỹ năng lập trình Python đáng kể.', 1, 1, '2023-11-12 11:21:20', NULL),
(16, 'Khóa học Figma từ căn bản đến thực chiến', 1200000, 0, 'Khoa_hoc_Figma_tu_can_ban_den_thuc_chien.jpg', 'KHÓA HỌC NÀY CÓ GÌ\r\n\r\nKhóa học thiết kế giao diện bằng Figma dành cho những bạn có đam mê với ngành nghề UI/UX design. Khóa học tập trung vào những kỹ năng căn bản nhất, đồng thời cung cấp một cái nhìn tổng quát giúp học viên có thể tạo ra sản phẩm cụ thể sau khóa học.\r\n\r\nKHÓA HỌC SẼ DẠY NHỮNG GÌ?\r\n\r\nBạn sẽ được tiếp kiến thức thực chiến từ đội ngũ TELOS, bao gồm các Developer và Designer cùng quản lý công việc và trao đổi trên một file làm việc Figma hơn 3 năm, bao gồm:\r\n\r\nCách một dự án thiết kế giao diện UI/UX được thực thi\r\n\r\nKiến thức căn bản về cách tận dụng Figma\r\n\r\nCác mẹo vặt để làm việc khoa học và tư duy theo lối lập trình\r\n\r\nPhương pháp nghiên cứu để luôn tìm ra câu trả lời cho cái mình chưa biết trong Figma\r\n\r\nVun đắp mối quan hệ Designer - Developer với những sản phẩm ăn ý', 1, 2, NULL, NULL),
(17, 'Adobe Photoshop từ cơ bản đến nâng cao', 1500000, 0, 'Adobe_Photoshop_tu_co_ban_den_nang_cao.jpg', 'Trang bị kỹ năng xử lý hình ảnh cho bản thân, để không bị bỏ lại trong kỷ nguyên \"nội dung trực quan\"\r\n\r\nCuộc sống hiện đại, vây quanh bạn đều là sản phẩm của thiết kế: từ bảng biển quảng cáo, bao bì sản phẩm, hình ảnh truyền thông, mạng xã hội, v.v... Hình ảnh và những nội dung trực quan, bắt mắt, giúp nắm bắt thông tin nhanh, đang được ưa chuộng hơn bao giờ hết. Mọi đơn vị, tổ chức, doanh nghiệp khi muốn quảng bá ra công chúng đều cần chăm chút và thiết kế hình ảnh, khiến độ hot của vị trí phụ trách công việc này sẽ không hạ nhiệt trong nhiều năm tới. Bởi lẽ đó, đừng chần chừ mà hãy tìm hiểu về Photoshop ngay thôi!\r\n\r\nPhotoshop - phần mềm cực kỳ mạnh mẽ với khả năng chỉnh sửa thiên biến vạn hóa, là nội dung không thể thiếu trong bất kỳ một chương trình đào tạo về thiết kế hình ảnh nào. E-ColorME giới thiệu khóa học \"Làm chủ Photoshop từ cơ bản đến nâng cao\" nhằm giúp bạn học viên hiểu và nhanh chóng làm quen với Photoshop, cùng với vô số bài tập thực hành nhỏ, đảm bảo tính ứng dụng: học xong làm được ngay. Là \"bước chân đầu tiên\" trong lộ trình học Photoshop, khóa học giúp bạn tạo ra poster ấn phẩm truyền thông, photo quote, manipulation đơn giản và hình ảnh mock-up.\r\n\r\nGiảng viên Hiếu Nguyễn bắt đầu đứng lớp Photoshop tại ColorME từ năm 2019 và là một trong những giảng viên có chuyên môn tốt, với số lượng học viên đông đảo, ổn định nhất. Hiện tại anh đang là một designer với thế mạnh thiết kế truyền thông (social post) trong lĩnh vực thời trang. Đồng hành cùng học viên trong khóa học này, Hiếu tin chắc rằng bạn học viên sẽ nắm được những kiến thức cốt lõi về Photoshop và có thể \'ngay lập tức\' tạo ra những sản phẩm truyền thông hoàn chỉnh sau khóa học.\r\n', 1, 2, NULL, NULL),
(18, 'Khóa học Xây dựng Website Bán Hàng không cần code', 8800000, 0, 'Khoa_hoc_Xay_dung_Website_Ban_Hang_khong_can_code.jpg', 'Khóa học \"Xây dựng Website Bán Hàng Không Yêu Cầu Kinh Nghiệm Lập Trình\" được thiết kế dành riêng cho những người không có kinh nghiệm lập trình hoặc có kiến thức cơ bản về lập trình và muốn xây dựng một website bán hàng chuyên nghiệp mà không cần phải viết code.\r\n\r\nNội dung khóa  học:\r\n\r\nCài đặt WordPress trên trên máy tính xampp\r\n\r\nGiới Thiệu Theme và widget và menu\r\n\r\nGiới thiệu công cụ import và export dữ liệu\r\n\r\nÁp dụng làm website tin tức bằng wordpress\r\n\r\nHướng dẫn tạo trang sản phẩm cho website\r\n\r\nTùy chỉnh trang chủ website bán hàng\r\n\r\ncài đặt công cụ hỗ trợ seo website chuẩn google\r\n\r\nChèn nút chat zalo vào website\r\n\r\nHướng dẫn chèn facebook messenger vào website\r\n\r\nHướng dẫn đưa bản đồ vào website bán hàng\r\n\r\nHướng dẫn gửi mail form bằng plugin WP SMTP trên Wordpress sử dụng SMTP Gmail\r\n\r\nHướng dẫn tạo lục mục tự động cho website wordpress\r\n\r\nHướng dẫn trỏ tên miền vào google site\r\n\r\nTạo bộ lọc giá sản phẩm trong website wordpress\r\n\r\nTạo mã khuyến mãi cho trang web bán hàng bằng wordpress\r\n\r\nTạo trang liên hệ cho website bằng Contact Form 7\r\n\r\nTạo website bán hàng miễn phí bằng google site', 1, 2, NULL, NULL),
(19, 'Làm hiệu ứng video với After Effects', 990000, 0, 'Lam_hieu_ung_video_voi_After_Effects.jpg', 'Kỹ xảo hình ảnh là một trong những yếu tố quan trọng trong sản xuất video, giúp video trở nên sống động và thu hút hơn. Sử dụng kỹ xảo đang trở thành xu hướng quảng cáo mới, giúp nâng cao giá trị thương hiệu, đem lại nhiều lợi nhuận hơn.\r\n\r\n\r\n\r\nVậy làm sao để có một sản phẩm sử dụng kỹ xảo chuyên nghiệp, bắt mắt ? Tất cả sẽ được giải đáp trong khóa học \"Làm hiệu ứng video với After Effects\". Khóa học sẽ trang bị cho học viên những kiến thức cơ bản về kỹ xảo đa phương tiện và cách tạo các kỹ xảo hình ảnh bằng phần mềm ADOBE AFTER EFFECTS. Bạn sẽ hiểu rõ quy trình làm việc của phần mềm Adobe After Effects, biết cách áp dụng các kỹ xảo điện ảnh chuyên nghiệp bằng phần mềm Adobe After Effects để tạo kỹ xảo theo yêu cầu. Đặc biệt người sẽ hướng dẫn các bạn trong khóa học này là thầy Tú Thanh - đã có nhiều năm kinh nghiệm đào tạo trong lĩnh vực truyền thông media tại nhiều trường đại học cũng như đang là đối tác của các thương hiệu như: Sony, Asus, Topica, Gitiho... Đồng thời cũng là Founder của Tú Thanh Media & Tú Thanh Academy chuyên về sản xuất - đào tạo media.', 1, 2, NULL, NULL),
(20, 'Blender 2023 - Lần đầu làm quen & tiếp xúc với 3D', 850000, 0, 'Blender_2023_Lan_dau_lam_quen_tiep_xuc_voi_3D.jpg', 'Blender là phần mềm mã nguồn mở hoàn toàn miễn phí nhưng lại vô cùng mạnh mẽ, không thua các phần mềm khác trong cùng phần khúc. Trong khóa học này, các bạn sẽ làm quen với các tính năng và công cụ cơ bản của Blender, để từ đó làm nền tảng để có thể bước sâu hơn vào thế giới của 1 học sĩ 3D.\r\n\r\nBạn chưa từng biết gì về 3D hay chưa từng làm đồ họa hay thiết, khóa học này không hề đòi hỏi bất kỳ kỹ năng hay kinh nghiệm có sẵn của bạn.\r\n\r\n\r\n\r\n3D BLENDER ÁP DỤNG VÀO ĐÂU?\r\n\r\nQuay TVC cho sản phẩm (Phim quảng cáo)\r\n\r\nEdit video, làm hiệu ứng VFX trên Tiktok, Youtube…\r\n\r\nIn ấn 3D, dùng mô hình tạo ra trong Blender để in 3D\r\n\r\nSử dụng hình ảnh render từ Blender in ấn để làm POD\r\n\r\nBán mô hình 3D trên TurboSquid, Amazon, Etsy...\r\n\r\nNhận dự án 3D tự do - Freelancer\r\n\r\nCấp độ Beginner – Khởi Động:\r\n\r\nDành cho những bạn chưa từng biết đến 3D hay VFX trên bất kỳ phần mềm nào.\r\n\r\nDành cho các bạn chưa từng làm về đồ họa, thiết kế nhưng mong muốn tìm hiểu để biết mình có phù hợp không.\r\n\r\nDành cho cả các bạn chưa biết vẽ 2D.\r\n\r\n\r\n\r\nCấu hình máy tính phù hợp khóa học:\r\n\r\nTối thiểu là:  64-bit quad core CPU with SSE2 support 8 GB RAM Full HD display Mouse, trackpad or pen+tablet Graphics card with 2 GB RAM, OpenGL 4.3\r\n\r\nĐược Blender gợi ý sử dụng là:  64-bit eight core CPU 32 GB RAM 2560×1440 display Three button mouse or pen+tablet Graphics card with 8 GB RAM', 1, 2, NULL, NULL),
(21, 'THIẾT KẾ 3D SKETCHUP CHO NGƯỜI MỚI', 820000, 0, 'THIET_KE_3D_SKETCHUP_CHO_NGUOI_MOI.jpg', 'Cung cấp cho học viên những kiến thức tổng quan về SketchUP bao gồm phần cài đặt phần mềm, dựng hình và phối cảnh;\r\n\r\nNắm vững được giao diện, các thao tác cơ bản, công cụ vẽ, công cụ quan sát trong dựng hình;\r\n\r\nNắm và thực hiện được các phương pháp tạo khối từ cơ bản đến nâng cao qua một số lệnh trong SketchUP;\r\n\r\nImport được file Autocad vào SketchUP để dựng hình công trình nhanh và hiệu quả hơn;\r\n\r\nDựng hình hoàn chỉnh một công trình nội thất hoặc kiến trúc;\r\n\r\nBiết cách cài đặt các plugin nâng cao để từ đó có thể phối kết hợp các công cụ và cách vẽ để dựng những vật dụng và không gian phục vụ cho ngành nội thất hoặc kiến trúc;\r\n\r\nThiết lập được ánh sáng và chế độ VRAY. Tạo dựng được vật liệu của các trang thiết bị. Từ đó render thành một không gian hoàn chỉnh;\r\n\r\nBiết cách chọn bố cục khi render;\r\n\r\nBiết cách chỉnh hậu kỳ giúp hình ảnh đẹp và thu hút hơn khi render;\r\n\r\nSử dụng được một số thao tác cơ bản của phần mềm Photoshop để hỗ trợ ghép ảnh công trình;\r\n\r\nKết thúc khóa học vẫn có thể tương tác với người dạy nếu như quên bài.', 1, 2, NULL, NULL),
(22, 'Trọn Bộ 5 Kỹ Năng Thiết Kế Adobe', 24000000, 0, 'Tron_Bo_5_Ky_Nang_Thiet_Ke_Adobe.jpg', 'Trọn bộ 5 Kỹ Năng Thiết Kế Adobe\r\n\r\nBạn có muốn học hỏi các kỹ năng và kỹ thuật sao nên những bản thiết kế đẹp mắt và những video hấp dẫn có kỹ xảo đặc biệt?\r\n\r\nBạn có muốn biết quy trình để tạo nên một video hay một tấm ảnh, một tạp chí hay banner đẹp.\r\n\r\nNếu bạn muốn tìm kiếm một công việc hay dự án liên quan đến thiết kế hình ảnh và video thì đây nhất định chính là một khóa học dành riêng cho bạn.\r\n\r\nGiảng viên sẽ tổng hợp những kiến thức thiết kế thịnh hành nhất để giảng dạy cho bạn như là Typography, hệ thống màu, layout, cách để dùng hình ảnh trong thiết kế, ảnh manipulation, nhận diện thương hiệu, logo, cắt dụng video, hiệu ứng chuyển cảnh, hình ảnh, âm thanh, kỹ xảo và nhiều nhiều hơn nữa.\r\n\r\nBạn sẽ được học kiến thức căn bản của Photoshop, Illustrator, Indesign, Premiere Pro và After Effect để áp dụng chúng trong thực tế. Mỗi designer cũng như là video editor cần biết đến các phần mềm liên quan như vậy để bổ trợ nhau và nâng cấp bản thân mình ngay khi mà Công nghệ AI đang từng bước thay thế chúng ta làm mọi việc', 1, 2, NULL, NULL),
(23, 'Dựng video cơ bản với Premiere Pro', 1200000, 0, 'Dung_video_co_ban_voi_Premiere_Pro.jpg', 'Làm thế nào để có thể biên tập được một video và tạo ra một video hấp dẫn. Tất cả sẽ được giải đáp trong khóa học \"Dựng video cơ bản với Premiere Pro CC 2023 \". Khóa học sẽ trang bị cho học viên những kiến thức cơ bản về cách cắt ghép video như thế nào, biên tập video ra sao, làm thế nào để tạo ra các hiệu ứng video hấp dẫn, cách để chỉnh màu video sao cho đẹp cũng như sử dụng các hệ thống luts màu, hiệu ứng bên ngoài giúp video của chúng ta trở nên hấp dẫn hơn. Trong khóa học, tất cả các nội dung hướng dẫn đều có đầy đủ file học liệu đi kèm giúp bạn có thể thuận lợi hơn trong việc học tập.\r\n\r\n\r\n\r\nĐầy đủ học liệu đi kèm mỗi bài học\r\n\r\nHàng trăm luts màu và hiệu ứng chuyển cảnh\r\n\r\nHệ thống website và group hỗ trợ học viên và tài nguyên phục vụ làm đồ họa\r\n\r\nSupport liên tục trong quá trình học\r\n\r\nĐặc biệt người sẽ hướng dẫn các bạn trong khóa học này là thầy Tú Thanh - đã có nhiều năm kinh nghiệm đào tạo trong lĩnh vực truyền thông media tại nhiều trường đại học cũng như đang là đối tác của các thương hiệu như: Sony, Asus, Topica, Gitiho... Đồng thời cũng là Founder của Tú Thanh Media & Tú Thanh Academy chuyên về sản xuất - đào tạo media.', 1, 2, NULL, NULL),
(24, 'Thiết kế ấn phẩm dàn trang, in ấn chuyên nghiệp với Indesign', 1500000, 0, 'Thiet_ke_an_pham_dan_trang_in_an_chuyen_nghiep_voi_Indesign.jpg', 'InDesign - phần mềm không thể thiếu của một nhà thiết kế đa năng!', 1, 2, NULL, NULL),
(25, 'Nhập môn vẽ kỹ thuật số - Digital Painting cơ bản', 850000, 0, 'Nhap_mon_ve_ky_thuat_so_Digital_Painting_co_ban.jpg', 'Bạn muốn tự tay vẽ lên những bức tranh siêu đẹp bằng máy tính, hay trở thành một họa sĩ chuyên về tranh minh họa, concept art; hoặc phát triển những dự án, làm việc trong các công ty game, studio phim? Đây chính là khóa học dành cho bạn! Với 16 buổi học, bạn sẽ được hướng dẫn nền tảng về “digital painting\", từ kỹ năng vẽ tay, kiến thức thẩm mỹ đến sử dụng Wacom tự tin để vẽ tranh trên máy tính.\r\n\r\nDigital Painting là hình thức vẽ trên các nền tảng kỹ thuật số, hay hiểu một cách đơn giản nhất là vẽ trên máy tính. Nghĩa là, thay vì sử dụng các phương thức vẽ truyền thống như với bút chì, sơn dầu, arcylic, màu nước,... thì người vẽ digital painting sử dụng máy vi tính và bảng vẽ điện tử (Graphic Tablet) để thực hiện tác phẩm của mình.\r\n\r\nNHỮNG LỢI ÍCH CỦA\r\n\r\nKHOÁ HỌC DIGITAL PAINTING\r\n\r\nKỹ năng vẽ tay, tạo hình cơ bản\r\n\r\nLý thuyết nền tảng trong xây dựng nhân vật và kết hợp phối cảnh, tư duy màu sắc, bố cục\r\n\r\nThực hành vẽ minh họa theo quy trình chuẩn\r\n\r\nNắm vững các công cụ Digital Painting trong Photoshop và tự tin sử dụng Wacom vẽ trên máy tính', 1, 2, NULL, NULL),
(26, 'Quảng cáo Zalo cho Mọi Người: 100% thực hành', 720000, 0, 'Quang_cao_Zalo_cho_Moi_Nguoi_100_thục_hành.jpg', 'Bạn đang tìm kiếm cách hiệu quả để quảng cáo sản phẩm hoặc dịch vụ của bạn và tiếp cận hàng triệu khách hàng tiềm năng trên nền tảng Zalo ?\r\n\r\nKhoá học \"Quảng cáo Zalo cho Mọi Người: 100% thực hành\" là lựa chọn hoàn hảo cho bạn.\r\n\r\nZalo Ads là một trong những nền tảng quảng cáo trực tuyến phổ biến tại Việt Nam, có sẵn cho hàng triệu người dùng trên ứng dụng Zalo. Khoá học này sẽ giúp bạn tận dụng tiềm năng mạnh mẽ của Zalo để xây dựng chiến dịch quảng cáo thành công và tăng doanh số bán hàng.', 1, 3, '2023-11-18 11:49:56', NULL),
(27, 'Trọn bộ về Quảng cáo trên nền tảng Google - Google Ads', 520000, 0, 'Tron_bo_ve_Quang_cao_tren_nen_tang_Google_Google_Ads.jpg', 'Bạn đã bao giờ muốn tận dụng sức mạnh của Google để quảng cáo sản phẩm hoặc dịch vụ của mình? Khóa học “Trọn bộ về Quảng cáo trên nền tảng Google “là hướng dẫn hoàn chỉnh để bạn bắt đầu chạy các chiến dịch quảng cáo trên nền tảng quảng cáo lớn nhất thế giới - Google Ads.\r\n\r\n\r\n\r\nVới hơn 10 năm kinh nghiệm trong lĩnh vực Digital Marketing và Google Ads, giảng viên Le Minh Duy sẽ hướng dẫn bạn từng bước để tạo và tối ưu hóa các chiến dịch quảng cáo trên Google Ads. Khóa học này sẽ giúp bạn:\r\n\r\n\r\n\r\n1. Hiểu rõ Google Ads:\r\n\r\nTìm hiểu về cách Google Ads hoạt động và tại sao nó quan trọng cho doanh nghiệp của bạn.\r\n\r\n\r\n\r\n2. Xây dựng Chiến Dịch Hiệu Quả:\r\n\r\nHọc cách tạo các chiến dịch quảng cáo chất lượng cao để đạt được mục tiêu kinh doanh của bạn.\r\n\r\n\r\n\r\n3. Nghiên cứu Từ Khóa:\r\n\r\nTìm hiểu cách nghiên cứu và chọn từ khóa phù hợp để tối ưu hóa sự xuất hiện của bạn trên Google.\r\n\r\n\r\n\r\n4. Tối Ưu Hóa Landing Page:\r\n\r\nHọc cách tối ưu hóa trang đích để tăng tỷ lệ chuyển đổi của bạn.\r\n\r\n\r\n\r\n5. Phân tích và Đo lường:\r\n\r\nSử dụng các công cụ phân tích để theo dõi và đo lường hiệu suất chiến dịch của bạn.\r\n\r\n\r\n\r\n6. Quản lý Ngân sách:\r\n\r\nTìm hiểu cách quản lý ngân sách của bạn một cách thông minh và hiệu quả.\r\n\r\nKhóa học này sẽ kết hợp kiến thức cơ bản và những chiến lược tiên tiến để bạn có thể áp dụng ngay vào thực tế. Bất kể bạn là một doanh nhân, nhân viên marketing, hay người muốn khám phá lĩnh vực quảng cáo trực tuyến, khóa học này sẽ giúp bạn tiến xa hơn trong sự nghiệp của mình.', 1, 3, '2023-11-16 11:49:56', NULL),
(28, 'Tự học Email Marketing', 620000, 0, 'Tu_hoc_Email_Marketing.jpg', 'Chào quý anh chị học viên, tôi rất vui khi được giới thiệu đến quý anh chị khóa học \"Tự Học Email Marketing bằng GetResponse Cơ bản trong 7 Ngày.\" Đây là một cơ hội tuyệt vời để quý anh chị có thể nắm vững một trong những công cụ mạnh mẽ nhất trong kinh doanh trực tuyến - Email Marketing, và thật hay là chúng ta có thể làm điều đó chỉ trong 7 ngày!\r\n\r\n\r\n\r\nVề Khóa Học:\r\n\r\n\r\n\r\nKhóa học này là một hành trình học tập toàn diện dành cho cả người mới bắt đầu và những người đã có kinh nghiệm với Email Marketing. Tôi đã chọn GetResponse, một trong những nền tảng hàng đầu trong lĩnh vực này, để giúp bạn xây dựng, quản lý, và tối ưu hóa chiến dịch Email Marketing một cách hiệu quả.\r\n', 1, 3, '2023-11-19 11:49:56', NULL),
(29, 'Thành thạo Facebook marketing thực chiến', 600000, 0, 'Thanh_thao_Facebook_marketing_thuc_chien.jpg', 'Bạn sẽ tiếp thu kiến thức để có thể bắt đầu thực hiện quảng cáo Facebook marketing , kiến thức học sẽ được học mãi mãi\r\n\r\n\r\n\r\nBạn sẽ học được :\r\n\r\n+ Học chiến lược Facebook marketing kiểu hớt váng : lý giải các hiện tượng kiếm bạc tỷ/ tháng nhờ bán hàng trên Facebook bằng chạy quảng cáo Facebook ads.\r\n\r\n\r\n\r\n+ Học chiến lược Facebook marketing sắn bắn và nuôi dưỡng : lý giải các hiện tượng tại sao lúc đầu bán hàng rất hiệu quả trên Facebook, ra đơn nhiều, chạy ads tốt nhưng sau đó lại giảm đơn, giá quảng cáo Facebook ads bị tăng cao và nhiều khi hết đơn và thua lỗ.\r\n\r\n\r\n\r\n+ Học chuyên sâu về tìm nguồn hàng, săn nguồn hàng bán buôn tận gốc.\r\n\r\n\r\n\r\n+ Kỹ thuật tìm sản phẩm ăn hàng trên Facebook, phân tích và nghiên cứu đối thủ.\r\n\r\n\r\n\r\n+ Học chuyên sâu về phân tích đối tượng trên Facebook, phân tích Customer insight cho từng đối tượng – Bí quyết lớn nhất để thành công trên Facebook là điểm này.', 1, 3, '2023-11-16 11:49:56', NULL),
(30, 'Chatbot thu hút 10.000+ khách hàng với chi phí 0 ĐỒNG', 550000, 0, 'Chatbot_thu_hut_10_000_khach_hang_voi_chi_phi_0_DONG.jpg', 'Bạn đang bán hàng online trên facebook, sinh viên muốn khởi nghiệp, hay nhân viên văn phòng muốn kiếm công việc làm thêm online?\r\n\r\nthì bán hàng trên facebook là lựa chọn số 1 hiện nay ở Việt nam.\r\n\r\nNhưng\r\n\r\nBạn không biết bắt đầu từ đâu, không biết quảng cáo, không biết thu hút khách hàng, không biết chăm sóc khách hàng, ...và rất nhiều thứ đau đầu gặp phải khi bán hàng.\r\n\r\nThì\r\n\r\nđây là khoá học được thiết kế  dành riêng cho bạn, hướng dẫn bạn chi tiết từ cơ bản đến nâng cao, cách xây dựng một chương trình bán hàng hoàn chỉnh sử dụng chatbot, chăm sóc khách hàng tự động, theo dõi khách hàng, tiếp thị lại, đặc biệt công thức viral thu hút 10.000+ khách hàng với chi phí 0 đồng.', 1, 3, '2023-11-22 11:49:56', NULL),
(31, 'Lập trình C cơ bản', 500000, 0, 'Lap_trinh_C_co_ban.jpg', 'Xin chào các bạn đến với khóa học Lập trình C cơ bản của chúng tôi!\r\n\r\n        Sau nhiều năm kinh nghiệm trong công tác giảng dạy và các dự án lĩnh vực lập trình C, tiếp xúc với nhiều học viên, thực tập sinh. Chúng tôi biết rằng, bắt đầu lập trình có thể đối mặt với rất nhiều khó khăn như thiếu kiến thức nền tảng, không định hướng được vấn đề và cách thức giải quyết, thiếu tài liệu và hướng dẫn phù hợp,... Nắm bắt được vấn đề nêu trên, khóa học \"Lập trình C căn bản\" được thiết kế một cách chi tiết, khoa học, dễ hiểu, dễ tiếp thu, không yêu cầu kiến thức lập trình trước đó , bất kỳ ai muốn học lập trình đều có thể tham gia.\r\n\r\n        Trong khóa học, bạn sẽ được tìm hiểu các khái niệm từ cơ bản đến nâng cao. Được học cách sử dụng các công cụ và kỹ thuật lập trình để giải quyết các bài toán thực tế thông qua lập trình C. Bên cạnh đó, bạn cũng sẽ được thực hành với các bài tập và dự án thú vị, giúp bạn áp dụng và củng cố kiến thức đã học.', 1, 1, '2023-11-14 13:53:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`category_id`, `category_name`) VALUES
(1, 'Lập trình'),
(2, 'Thiết kế đồ họa'),
(3, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `course_chapters`
--

CREATE TABLE `course_chapters` (
  `chapter_id` int(11) NOT NULL,
  `chapter_name` varchar(255) NOT NULL,
  `chapter_desc` text DEFAULT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_includes`
--

CREATE TABLE `course_includes` (
  `course_id` int(11) NOT NULL,
  `course_include_item` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_includes`
--

INSERT INTO `course_includes` (`course_id`, `course_include_item`) VALUES
(6, 'Kiến thức về HTML5'),
(6, 'Kiến thức về CSS3'),
(6, 'Kiến thức về JavaScript'),
(7, 'Hiểu rõ scope trong Javascript'),
(7, 'Hiểu rõ toán tử trong Javascript'),
(7, 'Hiểu rõ Object và Function trong Javascript'),
(7, 'Xử dụng thành thạo syntax của ES6'),
(8, 'Khóa học hướng dẫn lập trình hướng đối tượng từ cơ bản đến nâng cao'),
(8, 'Áp dụng và hiểu rõ lập trình hướng đối tượng trên C++'),
(9, 'Kiến thức nền tảng của ReactJS'),
(9, 'Quản lý form hiệu quả với React Hook Form'),
(9, 'Quản lý state với Redux Toolkit'),
(9, 'Làm giao diện nhanh và đơn giản với Material UI'),
(10, 'Nắm được tổng quan về Bootstrap'),
(10, 'Tạo trang web tĩnh bằng Bootstrap cơ bản'),
(10, 'Định dạng được trang web bằng CSS'),
(10, 'Định dạng được trang web bằng JS'),
(11, 'Sử dụng được cú pháp ngôn ngữ PHP'),
(11, 'Sử dụng được các hàm thông dụng của các lớp thông dụng (String, Math, DateTime...)'),
(11, 'Sử dụng được try-catch, xử lý được ngoại lệ'),
(11, 'Triển khai được cơ chế ghi đè phương thức (method overloading)'),
(12, 'Làm quen với ngôn ngữ lập trình C# và công cụ lập trình Visual Studio.'),
(12, 'Các khái niệm nền tảng trong C#.'),
(12, 'Một số từ khoá, cú pháp và cấu trúc cơ bản trong C#.'),
(12, 'Nâng cao tư duy bằng cách sử dụng C# để giải một số thuật toán cơ bản.'),
(13, 'Biết cách lập trình cơ bản'),
(13, 'Có khái niệm về lập trình C++'),
(13, 'Biết cách sử dụng thư viện C++ để chuẩn bị cho khóa học hướng đối tượng'),
(14, 'Nắm được kiến thức cơ bản về Java: Luồng điều khiển, lớp, đối tượng, hàm, thuộc tính,...'),
(14, 'Hiểu được lập trình hướng đối tượng (OOP) từ cơ bản đến nâng cao'),
(15, 'Kiến thức cơ bản bao gồm: in ấn, nhập liệu, điều kiện, vòng lặp, list, tupble, dictionary, hàm'),
(15, 'Kiến thức về lập trình OOP: Lớp, đối tượng, hàm tạo, Getter và Setter, thừa kế'),
(16, 'Sử dụng thành thục figma'),
(16, 'Nâng cao năng suất làm việc, nâng cao thu nhập'),
(16, 'Nâng cao năng suất làm việc, nâng cao thu nhập'),
(17, 'Sử dụng thành thạo công cụ Adobe Photoshop'),
(17, 'Kiến thức nền tảng về chỉnh sửa ảnh'),
(17, 'Luyện tập thiết kế Banner, Poster, Standee, ấn phẩm truyền thông'),
(17, 'Cắt ghép hình ảnh cơ bản đến nâng cao'),
(18, 'Cài đặt WordPress trên trên máy tính xampp'),
(18, 'Giới Thiệu Theme và widget và menu'),
(18, 'Cài đặt công cụ hỗ trợ seo website chuẩn google'),
(19, 'Cách sử dụng các công cụ trong After Effects để tạo video'),
(19, 'Cách sử dụng các công cụ trong After Effects để tạo video'),
(20, 'Từ 0 biết gì về 3D & Blender -> dựng hình + chụp ảnh quảng cáo trong 3D'),
(20, 'Nhanh chóng hiểu được cơ bản Blender (1 phần mềm khó nhưng rất mạnh)'),
(20, 'Không phải mất từ 6 tháng - 1 năm để tự tìm hiểu Blender'),
(21, 'Tặng miễn phí hơn 80GB thư viện (Học viên đã mua khóa học sẽ thấy được link tải)'),
(21, 'Sử dụng thành thạo Sketchup hòan thiện các bản vẽ'),
(22, 'Tìm hiểu chỉnh sửa và xử lý ảnh trong Adobe Photoshop'),
(22, 'Cách tạo trải bài biên tập và bố cục tạp chí bằng Adobe InDesign'),
(23, 'Nắm được cách sử dụng phần mềm Premiere để cắt - ghép video'),
(23, 'Nắm được cách sử dụng các hiệu ứng video - hiệu ứng chuyển cảnh video'),
(24, 'Sử dụng thành thạo công cụ Adobe Indesign'),
(24, 'Kiến thức nền tảng về dàn trang, bố cục, in ấn'),
(25, 'Sử dụng thành thạo phần mềm Photoshop & Wacom'),
(25, 'Biết cách sử dụng phần mềm Photoshop để vẽ Digital Painting'),
(26, 'Hiểu về Zalo Ads: Bạn sẽ hiểu cách hoạt động của Zalo Ads, cách tạo và quản lý quảng cáo trên nền tả'),
(26, 'Tạo chiến dịch quảng cáo: Bạn sẽ có khả năng tạo các chiến dịch quảng cáo trên Zalo, bao gồm viết nộ'),
(27, 'Tự tin thực hiện và biết cách tối ưu để đạt kết quả tốt nhất qua các dạng quảng cáo phổ biến trên nề'),
(27, 'Hạn chế Click tặc từ các đối thủ đang kinh doanh trên thị trường.'),
(28, 'Tự tin thực hiện và biết cách tối ưu để đạt kết quả tốt nhất qua các dạng quảng cáo phổ biến trên nề'),
(28, 'Áp dụng được các kiến thức nền tảng vào việc tạo chiến dịch email marketing bằng GetResponse'),
(29, 'marketing facebook'),
(29, 'kinh doanh online'),
(30, 'Làm chủ chatbot trong 1 ngày không cần biết về code'),
(30, 'Chatbot tự động chăm sóc khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `course_lessons`
--

CREATE TABLE `course_lessons` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` varchar(255) NOT NULL,
  `lesson_thumbnail` varchar(50) NOT NULL,
  `lesson_path` varchar(50) NOT NULL,
  `lesson_document` varchar(50) DEFAULT NULL,
  `chapter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `feedback_username` varchar(50) NOT NULL,
  `feedback_email` varchar(50) NOT NULL,
  `feedback_tel` varchar(20) NOT NULL,
  `feedback_content` text NOT NULL,
  `feedback_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Feedback chưa được phản hồi, 1: Feedback đã được phản hồi',
  `feedback_reply` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `feedback_username`, `feedback_email`, `feedback_tel`, `feedback_content`, `feedback_status`, `feedback_reply`, `created_at`, `user_id`) VALUES
(1, 'Huy', 'huy12@gmail.com', '09287346', 'Khi nào có đợt giảm giá?', 1, 'Đợt giảm giá sẽ có vào cuối tháng sau', '2023-11-15 04:05:39', 2),
(2, 'Nam Nguyễn', 'namng@gmail.com', '0982374', 'Trang web của bạn thật tiện lợi', 0, '', '2023-11-15 04:06:34', NULL),
(3, 'Quỳnh', 'quynh22@gmail.com', '092736423', 'Thật tiện lợi khi sử dụng trang web ở điện thoại', 1, 'Cảm ơn bạn, chúng tôi sẽ tiếp tục tối ưu trang web để mang lại trải nghiệm tốt hơn', '2023-11-15 04:07:59', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `payment_id`, `payment_date`) VALUES
(1, 3, 1, '2023-11-14 10:10:32'),
(2, 4, 3, '2023-11-14 10:10:32'),
(3, 5, 2, '2023-11-14 10:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_type`) VALUES
(1, 'COD - Thanh toán khi nhận hàng'),
(2, 'Ví điện tử VN PAY/VN QR'),
(3, 'Ví điện tử MoMo');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `review_content` text DEFAULT NULL,
  `review_rate` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `slider_id` int(11) NOT NULL,
  `slider_img` varchar(50) NOT NULL,
  `slider_status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_img`, `slider_status`) VALUES
(1, 'slider_1.png', 1),
(2, 'slider_2.png', 1),
(3, 'slider_3.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login_name` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_avatar` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Tài khoản user không nằm trong thùng rác; 1: Tài khoản user nằm trong thùng rác',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_login_name`, `user_name`, `user_password`, `user_avatar`, `user_email`, `role_id`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'Nam', '123456', 'avatar_default.png', 'admin1@gmail.com', 1, 0, '2023-11-14 09:45:19', NULL),
(2, 'manager1', 'Huy', '123456', 'avatar_default.png', 'manager1@gmail.com', 2, 0, '2023-11-14 09:45:19', NULL),
(3, 'user1', 'Long', '123', 'avatar_default.png', 'user1@gmail.com', 3, 0, '2023-11-14 09:45:19', NULL),
(4, 'user2', 'Huyền', '123', 'avatar_default.png', 'user2@gmail.com', 3, 0, '2023-11-14 09:45:19', NULL),
(5, 'user3', 'Hoàng', '123', 'avatar_default.png', 'user3@gmail.com', 3, 0, '2023-11-14 10:11:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `brought_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_includes`
--
ALTER TABLE `course_includes`
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `order_detail_ibfk_1` (`order_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_ibfk_1` (`role_id`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_chapters`
--
ALTER TABLE `course_chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD CONSTRAINT `course_chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_includes`
--
ALTER TABLE `course_includes`
  ADD CONSTRAINT `course_includes_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD CONSTRAINT `course_lessons_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `course_chapters` (`chapter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
