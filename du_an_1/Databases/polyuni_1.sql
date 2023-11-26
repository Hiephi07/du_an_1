-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 05:54 AM
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
(1, 4, '2023-11-15 04:09:09'),
(1, 3, '2023-11-15 04:09:09'),
(2, 5, '2023-11-15 04:09:09'),
(3, 2, '2023-11-15 04:09:09'),
(3, 3, '2023-11-15 04:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_price` int(11) NOT NULL DEFAULT 0,
  `course_members` int(11) NOT NULL DEFAULT 0,
  `course_thumbnail` varchar(50) NOT NULL,
  `course_desc` text DEFAULT NULL,
  `course_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Khóa học bị ẩn đi; 1: Khóa học được hiển thị',
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_price`, `course_members`, `course_thumbnail`, `course_desc`, `course_status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'HTML & CSS cơ bản', 990000, 0, 'course_1.jpg', 'Nếu bạn chưa biết gì về HTML CSS, hoặc chỉ đơn giản là người mới tìm hiểu về Frontend bắt đầu học HTML CSS, người muốn cải thiện trình độ HTML CSS được chuyên sâu hơn thì khóa này chắc chắn sẽ phù hợp với bạn. Khóa học sẽ hướng dẫn không chỉ kiến thức kỹ càng mà còn về kinh nghiệm cắt giao diện từ Figma sang HTML CSS chỉn chu và nhanh gọn lẹ.\r\n\r\n', 1, 1, '2023-11-14 09:56:01', NULL),
(2, 'Trọn Bộ 5 Kỹ Năng Thiết Kế Adobe', 1500000, 0, 'course_2.jpg', 'Trọn bộ 5 Kỹ Năng Thiết Kế Adobe\r\n\r\nBạn có muốn học hỏi các kỹ năng và kỹ thuật sao nên những bản thiết kế đẹp mắt và những video hấp dẫn có kỹ xảo đặc biệt?\r\n\r\nBạn có muốn biết quy trình để tạo nên một video hay một tấm ảnh, một tạp chí hay banner đẹp.\r\n\r\nNếu bạn muốn tìm kiếm một công việc hay dự án liên quan đến thiết kế hình ảnh và video thì đây nhất định chính là một khóa học dành riêng cho bạn.\r\n\r\nGiảng viên sẽ tổng hợp những kiến thức thiết kế thịnh hành nhất để giảng dạy cho bạn như là Typography, hệ thống màu, layout, cách để dùng hình ảnh trong thiết kế, ảnh manipulation, nhận diện thương hiệu, logo, cắt dụng video, hiệu ứng chuyển cảnh, hình ảnh, âm thanh, kỹ xảo và nhiều nhiều hơn nữa.\r\n\r\nBạn sẽ được học kiến thức căn bản của Photoshop, Illustrator, Indesign, Premiere Pro và After Effect để áp dụng chúng trong thực tế. Mỗi designer cũng như là video editor cần biết đến các phần mềm liên quan như vậy để bổ trợ nhau và nâng cấp bản thân mình ngay khi mà Công nghệ AI đang từng bước thay thế chúng ta làm mọi việc', 1, 2, '2023-11-14 09:56:01', NULL),
(3, 'Cách đặt từ khoá SEO Youtube hiệu quả từ A-Z', 500000, 0, 'course_3.jpg', '\"Vị trí hiển thị càng cao thì khả năng người xem bấm vào xem càng lớn\" đây được xem là nguyên tắc chung cho những ai làm Digital Marketing nói chung và SEO Youtube nói riêng. Hiểu đơn giản, là phần lớn mọi người điều rất quan tâm đến vị trí hiển thị.\r\nĐối với những kênh Youtube mới thì nội dung tốt là chưa đủ, mà phải tập trung thêm vào từ khoá SEO Youtube chất lượng nữa.', 1, 3, '2023-11-14 09:56:01', NULL),
(4, 'C++ Cơ bản dành cho người mới học lập trình', 790000, 0, 'course_4.jpg', 'Khóa học này mang lại khái niệm cơ bản về lập trình. Sử dụng ngôn ngữ C++ làm ngôn ngữ chính. Không yêu cầu kiến thức về lập trình trước khi học khóa học này.\r\n\r\nCác bạn sẽ được học từ biến, vòng lặp, câu lệnh rẽ nhánh, con trỏ, kiểu dữ liệu tự định nghĩa... Sau khóa học này các bạn sẽ biết cách sử dụng ngôn ngữ lập trình C++ và đồng thời có khả năng tự học các ngôn ngữ khác.', 1, 1, '2023-11-14 12:59:17', NULL),
(5, 'Khóa học ReactJS từ cơ bản đến nâng cao', 1200000, 0, 'course_5.png', 'Ngoài việc giúp bạn nắm vững kiến thức cơ bản và nâng cao kỹ năng lập trình, khóa học ReactJS còn mang lại nhiều lợi ích khác. Đầu tiên, nó giúp bạn hiểu rõ hơn về cách xây dựng các ứng dụng web hiện đại và tương tác người dùng một cách linh hoạt. Điều này làm cho bạn trở nên linh hoạt và có khả năng thích ứng nhanh chóng với các yêu cầu thay đổi trong ngành công nghiệp phần mềm. Không chỉ dừng lại ở việc biết sử dụng ReactJS, mà khóa học còn hướng dẫn cách tích hợp nó với các công cụ và thư viện khác, như Redux, để quản lý trạng thái ứng dụng một cách hiệu quả. Điều này tăng cường khả năng làm việc nhóm và tạo ra mã nguồn dễ bảo trì. Cuối cùng, việc sở hữu kỹ năng ReactJS sẽ giúp bạn thăng tiến trong sự nghiệp nhanh chóng, vì nó là một công nghệ ngày càng được ưa chuộng và có ảnh hưởng mạnh mẽ đến ngành công nghiệp phần mềm. Điều này không chỉ mang lại cơ hội việc làm mà còn mở ra cánh cửa cho các dự án thú vị và thách thức trong tương lai.', 1, 1, '2023-11-14 13:03:03', NULL);

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

--
-- Dumping data for table `course_chapters`
--

INSERT INTO `course_chapters` (`chapter_id`, `chapter_name`, `chapter_desc`, `course_id`) VALUES
(4, 'Chương 1: Thiết lập và tổng quan', NULL, 1),
(5, 'Chương 2: Lý thuyết', NULL, 1),
(6, 'Chương 3: Thực hiện dự án', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_includes`
--

CREATE TABLE `course_includes` (
  `course_id` int(11) NOT NULL,
  `course_include_item` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_includes`
--

INSERT INTO `course_includes` (`course_id`, `course_include_item`) VALUES
(1, 'Nắm vững kiến thức HTML CSS chuẩn chỉnh từ đầu'),
(1, 'Code cực nhanh và hiệu quả với PUG, SASS'),
(1, 'Được chia sẻ thiết kế đẹp, xịn xò để thực hành sau khi hoàn thành khóa học'),
(1, 'Biết thêm cách sử dụng Figma'),
(1, 'Thực hành dự án thực tế'),
(1, 'Có nhóm hỗ trợ khi gặp khó khăn trong quá trình học');

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

--
-- Dumping data for table `course_lessons`
--

INSERT INTO `course_lessons` (`lesson_id`, `lesson_name`, `lesson_thumbnail`, `lesson_path`, `lesson_document`, `chapter_id`) VALUES
(1, 'Bài 1: Giới thiệu khóa học', 'lesson_thumbnail', 'lesson_path', NULL, 4),
(2, 'Bài 2: Cài đặt các công cụ', 'lesson_thumbnail', 'lesson_path', NULL, 4),
(3, 'Bài 3: Các thiết lập quan trọng', 'lesson_thumbnail', 'lesson_path', NULL, 4);

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

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `course_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `review_content`, `review_rate`, `course_id`, `user_id`, `review_date`) VALUES
(1, 'Khóa học tốt', 5, 1, 3, '2023-11-14 10:16:47'),
(2, 'Khóa học ổn', 4, 2, 5, NULL),
(3, 'Khóa học chất lượng', 5, 2, 4, '2023-11-14 10:18:40');

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
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`user_id`, `course_id`, `brought_at`) VALUES
(3, 1, '2023-11-14 10:20:52'),
(3, 2, '2023-11-14 10:20:52'),
(4, 3, '2023-11-14 10:20:52');

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
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
