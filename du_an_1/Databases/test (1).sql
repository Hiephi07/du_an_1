-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2023 lúc 04:38 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `course_id`, `created_at`) VALUES
(36, 12, 14, '2023-11-30 19:59:26'),
(37, 22, 13, '2023-12-02 15:05:21'),
(38, 22, 7, '2023-12-02 15:05:31'),
(39, 22, 18, '2023-12-02 15:05:35'),
(40, 22, 7, '2023-12-02 15:05:51'),
(41, 22, 16, '2023-12-02 15:09:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_status` varchar(50) NOT NULL DEFAULT '1' COMMENT '1: Hiển thị danh mục; 2: Ẩn danh mục	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'Backend', '1'),
(2, 'Frontend', '1'),
(3, 'Devops', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `review_id` int(11) NOT NULL,
  `review_content` text DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT 1,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`review_id`, `review_content`, `course_id`, `user_id`, `comment_status`, `review_date`) VALUES
(2, 'Khóa học ổn', 12, 19, 1, '2023-12-08 21:12:55'),
(3, 'Khóa học chất lượng', 12, 20, 1, '2023-12-08 21:12:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_price_sale` int(11) NOT NULL,
  `course_price` int(11) NOT NULL,
  `course_image` varchar(50) NOT NULL,
  `course_desc` text NOT NULL,
  `course_status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_price_sale`, `course_price`, `course_image`, `course_desc`, `course_status`, `category_id`, `created_at`) VALUES
(6, 'HTML CSS cơ bản', 2800000, 1299000, 'HTML CSS Pro.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 21:45:46'),
(7, 'Ngôn ngữ tiền xử lý Sass', 2500000, 1299000, 'Ngôn ngữ tiền xử lý Sass.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 22:00:28'),
(8, 'Kiến Thức Nhập Môn IT', 2200000, 500000, 'Kiến Thức Nhập Môn IT.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 3, '2023-11-21 22:00:28'),
(9, 'Lập trình C++ cơ bản, nâng cao', 3000000, 700000, 'Lập trình C++ cơ bản, nâng cao.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 2, '2023-11-21 22:00:28'),
(10, 'HTML CSS từ Zero đến Hero', 2400000, 300000, 'HTML CSS từ Zero đến Hero.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 22:00:28'),
(11, 'Responsive Với Grid System', 4200000, 750000, 'Responsive Với Grid System.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 2, '2023-11-21 22:00:28'),
(12, 'Lập Trình JavaScript Cơ Bản', 1100000, 200000, 'Lập Trình JavaScript Cơ Bản.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 2, '2023-11-21 22:00:28'),
(13, 'Lập Trình JavaScript Nâng Cao', 5420000, 880000, 'Lập Trình JavaScript Nâng Cao.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 22:00:28'),
(14, 'Làm việc với Terminal & Ubuntu', 4700000, 600000, 'Làm việc với Terminal & Ubuntu.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 22:00:28'),
(15, 'Xây Dựng Website với ReactJS', 6320000, 1500000, 'Xây Dựng Website với ReactJS.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 2, '2023-11-21 22:00:28'),
(16, 'Node & ExpressJS', 6700000, 2300000, 'Node & ExpressJS.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 22:00:28'),
(17, 'Git & Github', 1700000, 150000, 'Git & Github.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 3, '2023-11-21 22:05:49'),
(18, 'Webpack with ES6 & ReactJs', 1800000, 210000, 'ES6 & ReactJs.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 2, '2023-11-21 22:05:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_chapters`
--

CREATE TABLE `course_chapters` (
  `chapter_id` int(11) NOT NULL,
  `chapter_name` varchar(255) NOT NULL,
  `chapter_desc` text NOT NULL,
  `chapter_order` int(2) NOT NULL,
  `chapter_status` int(11) NOT NULL DEFAULT 1,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course_chapters`
--

INSERT INTO `course_chapters` (`chapter_id`, `chapter_name`, `chapter_desc`, `chapter_order`, `chapter_status`, `course_id`) VALUES
(7, 'Chương 1: Bắt đầu', 'Giới thiệu về khóa học', 1, 1, 10),
(8, 'Chương 2: Làm quen với HTML', 'Giới thiệu các khái niệm về HTML', 2, 1, 10),
(9, 'Chương 3: Làm quen với CSS', 'Giới thiệu các khái niệm về CSS', 3, 1, 10),
(10, 'Chương 1: Giới thiệu', 'Giới thiệu về khóa học', 1, 1, 12),
(11, 'Chương 2: Biến, comment, built-in', 'Làm quen với các khái niệm', 2, 1, 12),
(12, 'Chương 3: Toán tử, kiểu dữ liệu', 'Tìm hiểu về toán tử, kiểu dữ liệu', 3, 1, 12),
(13, 'Chương 1: Giới thiệu', 'Giới thiệu về khóa học', 1, 1, 9),
(14, 'Chương 2: Biến và kiểu dữ liệu', 'Giới thiệu về biến và kiểu dữ liệu', 2, 1, 9),
(15, 'Chương 3: Cấu trúc điều khiển và vòng lặp', 'Các khái niệm quan trọng', 3, 1, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_includes`
--

CREATE TABLE `course_includes` (
  `course_id` int(11) NOT NULL,
  `course_include_item` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course_includes`
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
-- Cấu trúc bảng cho bảng `course_lessons`
--

CREATE TABLE `course_lessons` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` varchar(255) NOT NULL,
  `lesson_order` int(3) NOT NULL,
  `lesson_thumbnail` varchar(50) NOT NULL,
  `lesson_path` varchar(50) NOT NULL,
  `lesson_document` varchar(50) DEFAULT NULL,
  `lesson_status` tinyint(1) NOT NULL DEFAULT 1,
  `chapter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course_lessons`
--

INSERT INTO `course_lessons` (`lesson_id`, `lesson_name`, `lesson_order`, `lesson_thumbnail`, `lesson_path`, `lesson_document`, `lesson_status`, `chapter_id`) VALUES
(4, 'Bài 1: Bạn sẽ làm được gì sau khóa học?', 1, '', 'Bai_1_Ban_se_lam_duoc_gi_sau_khoa_hoc.mp4', NULL, 1, 7),
(5, 'Bài 2: Tìm hiểu về HTML, CSS', 2, '', 'Bai_2_Tim_hieu_ve_HTML_CSS.mp4', NULL, 1, 7),
(6, 'Bài 3: Làm quen với Dev tools', 3, '', 'Bai_3_Lam_quen_voi_Dev_tools.mp4', NULL, 1, 7),
(7, 'Bài 4: Cấu trúc 1 file HTML', 1, '', 'Bai_4_Cau_truc_1_file_HTML.mp4', NULL, 1, 8),
(8, 'Bài 5: Comment trong HTML', 2, '', 'Bai_5_Comments_trong_HTML.mp4', NULL, 1, 8),
(9, 'Bài 6: Các thẻ HTML thông dụng', 3, '', 'Bai_6_Nhung_the_HTML_thong_dung.mp4', NULL, 1, 8),
(10, 'Bài 7: Sử dụng CSS trong HTML', 1, '', 'Bai_7_Su_dung_CSS_trong_HTML.mp4', NULL, 1, 9),
(11, 'Bài 8: ID và Class', 2, '', 'Bai_8_ID_va_Class.mp4', NULL, 1, 9),
(12, 'Bài 9: CSS selectors cơ bản', 3, '', 'Bai_9_CSS_selectors_co_ban.mp4', NULL, 1, 9),
(13, 'Bài 1: Lời khuyên trước khóa học', 1, '', 'Bai_1_Loi_khuyen_truoc_khoa_hoc.mp4', NULL, 1, 10),
(14, 'Bài 2: Cài đặt môi trường', 2, '', 'Bai_2_Cai_dat_moi_truong.mp4', NULL, 1, 10),
(15, 'Bài 3: Sử dụng Javascript với HTML', 1, '', 'Bai_3_Su_dung_Javascript_voi_HTML.mp4', NULL, 1, 11),
(16, 'Bài 4: Khái niệm biến và cách sử dụng', 2, '', 'Bai_4_Khai_bao_bien.mp4', NULL, 1, 11),
(17, 'Bài 5: Cú pháp comments là gì?', 3, '', 'Bai_5_Cu_phap_comments_la_gi.mp4', NULL, 1, 11),
(18, 'Bài 6: Làm quen với toán tử', 1, '', 'Bai_6_Lam_quen_voi_toan_tu.mp4', NULL, 1, 12),
(19, 'Bài 7: Toán tử số học', 2, '', 'Bai_7_Toan_tu_so_hoc.mp4', NULL, 1, 12),
(20, 'Bài 8: Toán tử gán', 3, '', 'Bai_8_Toan_tu_gan.mp4', NULL, 1, 12),
(21, 'Bài 1: Giới thiệu khóa học', 1, '', 'Bai_1_Gioi_Thieu_khoa_hoc_CPlusPlus.mp4', NULL, 1, 13),
(22, 'Bài 2: Cài đặt Dev C++', 2, '', 'Bai_2_Cai_dat_Dev_C.mp4', NULL, 1, 13),
(24, 'Bài 4: Biến và nhập xuất dữ liệu', 1, '', 'Bai_4_Bien_va_nhap_xuat_du_lieu.mp4', NULL, 1, 14),
(25, 'Bài 5: Kiểu dữ liệu thường gặp', 2, '', 'Bai_5_Kieu_du_lieu_thuong_gap.mp4', NULL, 1, 14),
(26, 'Bài 3: Hướng dẫn sử dụng Dev C++', 3, '', 'Bai_3_Huong_dan_su_dung_Dev_C.mp4', NULL, 1, 13),
(27, 'Bài 6: Biến cục bộ và biến toàn cục', 3, '', 'Bai_6_Bien_cuc_bo_va_bien_toan_cuc.mp4', NULL, 1, 14),
(28, 'Bài 7: Cấu trúc if else', 1, '', 'Bai_7_Cau_truc_if_else.mp4', NULL, 1, 15),
(29, 'Bài 8: Cấu trúc switch case', 2, '', 'Bai_8_Cau_truc_switch_case.mp4', NULL, 1, 15),
(30, 'Bài 9: Toán tử 3 ngôi', 3, '', 'Bai_9_Toan_tu_3_ngoi.mp4', NULL, 1, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
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
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `feedback_username`, `feedback_email`, `feedback_tel`, `feedback_content`, `feedback_status`, `feedback_reply`, `created_at`, `user_id`) VALUES
(1, 'Huy', 'huy12@gmail.com', '09287346', 'Khi nào có đợt giảm giá?', 1, 'Đợt giảm giá sẽ có vào cuối tháng sau', '2023-11-15 04:05:39', 2),
(2, 'Nam Nguyễn', 'namng@gmail.com', '0982374', 'Trang web của bạn thật tiện lợi', 0, '', '2023-11-15 04:06:34', NULL),
(3, 'Quỳnh', 'quynh22@gmail.com', '092736423', 'Thật tiện lợi khi sử dụng trang web ở điện thoại', 1, 'Cảm ơn bạn, chúng tôi sẽ tiếp tục tối ưu trang web để mang lại trải nghiệm tốt hơn', '2023-11-15 04:07:59', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_status` tinyint(1) NOT NULL COMMENT '0: hủy, 1: thành công, 2: chờ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `course_id`, `order_date`, `order_status`) VALUES
(10107043, 20, 13, '2023-11-25 21:08:26', 2),
(10277613, 19, 13, '2023-11-24 16:40:30', 2),
(10387756, 12, 12, '2023-12-09 20:29:40', 1),
(18159864, 12, 11, '2023-11-23 05:51:41', 0),
(22456323, 12, 16, '2023-11-23 05:50:40', 1),
(55822647, 12, 18, '2023-11-22 23:48:40', 1),
(60825333, 17, 14, '2023-12-01 04:06:13', 1),
(60980120, 12, 13, '2023-11-22 23:36:25', 1),
(69672745, 12, 7, '2023-11-23 05:56:20', 1),
(75961066, 12, 18, '2023-11-23 06:01:02', 1),
(76871267, 22, 7, '2023-12-02 22:06:02', 1),
(79632507, 12, 7, '2023-11-23 05:56:28', 1),
(83297076, 18, 13, '2023-11-24 15:28:14', 1),
(83764081, 17, 18, '2023-12-01 04:09:55', 1),
(87893620, 24, 12, '2023-12-09 22:34:03', 1),
(96674360, 16, 9, '2023-11-24 15:18:11', 2),
(97982110, 12, 10, '2023-11-28 15:52:43', 1),
(98143750, 12, 13, '2023-11-22 23:44:49', 1),
(98439682, 18, 6, '2023-11-24 15:27:07', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `slider_id` int(11) NOT NULL,
  `slider_img` varchar(50) NOT NULL,
  `slider_status` tinyint(4) NOT NULL DEFAULT 1,
  `slider_order` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_img`, `slider_status`, `slider_order`) VALUES
(1, 'banner1.png', 1, 1),
(2, 'banner2.png', 1, 2),
(3, 'banner3.png', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_avatar` varchar(255) DEFAULT 'avatar_default.png',
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 1,
  `roles` tinyint(4) NOT NULL COMMENT '1: SuperAdmin, 2: Admin; 3: User',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_name`, `user_password`, `user_avatar`, `user_email`, `user_phone`, `user_status`, `roles`, `created_at`, `user_session_id`) VALUES
(1, 'user1', 'user1', '123456', 'avatar_default.png', 'user1@gmail.com', '', 1, 3, '2023-11-22 09:45:19', ''),
(2, 'user2', 'user2', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'user2@gmail.com', '', 1, 3, '2023-11-22 09:45:19', ''),
(3, 'user3', 'user3', '123', 'avatar_default.png', 'user3@gmail.com', '', 1, 3, '2023-11-22 09:45:19', ''),
(4, 'user4', 'user4', '123', 'avatar_default.png', 'user4@gmail.com', '', 1, 3, '2023-11-22 09:45:19', ''),
(5, 'user5', 'user5', '123', 'avatar_default.png', 'user5@gmail.com', '', 1, 3, '2023-11-22 10:11:08', ''),
(11, 'user6', '', '123456', 'avatar_default.png', 'user6@gmail.com', '', 1, 3, '2023-11-22 16:29:26', ''),
(12, 'user7', 'Trần Quang Hiệp', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'Screenshot(118).png', 'user7@gmail.com', '098356789', 1, 3, '2023-11-22 16:34:33', '9k9s1vc7h33mm4cd26tenq2935'),
(13, 'user8', '', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'user8@gmail.com', '', 1, 3, '2023-11-22 17:20:00', ''),
(15, 'hieptqph43210', 'Tran Quang Hiep', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'hieptqph43210@fpt.edu.vn', '', 1, 3, '2023-11-23 21:52:54', ''),
(16, 'hiep', 'hiep1', 'de2281d00751accb1ec5913cad20fc7037992a5f', 'dangky.png', 'hiephidata123@gmail.com', '0981234567', 1, 3, '2023-11-23 23:01:35', ''),
(17, 'user9', 'Quang Hiệp', 'a36dc4e726ba6529b5d4d9e3c156944d15def5fd', 'avatar_default.png', 'hiephidata@gmail.com', '', 1, 3, '2023-11-24 08:12:22', 'lukgf658d7g6f4lpi9e0c3145e'),
(18, 'hiepdz', 'Nguyen Công Hiệp', '5c2e7a6fa0a6a182056a1e85b8397d4f0b4f7269', 'Ảnh chụp màn hình 2023-03-28 120944.png', 'hiepooo94@gmail.com', '0981234567', 1, 3, '2023-11-24 08:25:12', ''),
(19, 'willTu', 'will gay Tu', 'b6a2050b23be98eb7df658d12b829af244bdd97d', 'Ảnh chụp màn hình 2023-03-28 120944.png', 'ducldph43245@fpt.edu.vn', '0981234567', 1, 3, '2023-11-24 09:36:50', ''),
(20, 'user10', 'Quang Hiệp', 'b207a02ba972decfeb671d4733e7850ddce263df', 'nhin-nguoi-chuan.png', 'quyntph31502@fpt.edu.vn', '0981234567', 1, 3, '2023-11-25 14:06:54', ''),
(21, 'admin', 'Name Admin', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'admin@polyuni.fpt.vn', '', 1, 1, '2023-11-29 08:14:37', ''),
(22, 'bac12', 'bac nguyen', '7c222fb2927d828af22f592134e8932480637c0d', 'avatar_default.png', 'bacnguyenfsd@gmail.com', '', 1, 3, '2023-12-02 15:05:04', '1vfr4r8q8smf60i3jhiphooij2'),
(23, 'tester', 'Tester', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'hiep@gmail.com', '', 1, 1, '2023-12-09 14:58:15', ''),
(24, 'polyuni', 'PolyUni', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'polyuni@gmail.com', '', 1, 3, '2023-12-09 15:01:48', 'k2bceu47lnl05gmu9eurtd820s');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_courses`
--

CREATE TABLE `user_courses` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `brought_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_courses`
--

INSERT INTO `user_courses` (`user_id`, `course_id`, `brought_at`) VALUES
(12, 12, '2023-12-09 13:29:59'),
(17, 14, '2023-11-30 21:09:33'),
(17, 18, '2023-11-30 21:10:51'),
(22, 7, '2023-12-02 15:08:46'),
(24, 12, '2023-12-09 15:35:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Chỉ mục cho bảng `course_includes`
--
ALTER TABLE `course_includes`
  ADD KEY `course_id` (`course_id`);

--
-- Chỉ mục cho bảng `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `course_chapters`
--
ALTER TABLE `course_chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD CONSTRAINT `course_chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Các ràng buộc cho bảng `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD CONSTRAINT `course_lessons_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `course_chapters` (`chapter_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
