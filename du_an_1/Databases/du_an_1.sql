-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2023 lúc 12:36 AM
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
-- Cơ sở dữ liệu: `du_an_1`
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
(36, 12, 14, '2023-11-30 19:59:26');

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
(1, 'Backend', ''),
(2, 'Frontend', ''),
(3, 'Devops', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `review_id` int(11) NOT NULL,
  `review_content` text DEFAULT NULL,
  `review_rate` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`review_id`, `review_content`, `review_rate`, `course_id`, `user_id`, `review_date`) VALUES
(1, 'Khóa học tốt', 5, 1, 3, '2023-11-14 10:16:47'),
(2, 'Khóa học ổn', 4, 2, 5, NULL),
(3, 'Khóa học chất lượng', 5, 2, 4, '2023-11-14 10:18:40');

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
(6, 'HTML CSS Pro', 2800000, 1299000, 'HTML CSS Pro.png', 'Khóa học dành cho mọi đối tượng, từ chưa biết nhiều về Docker đến những người đã làm việc với Docker nhưng cần hệ thống lại kiến thức một cách khoa học và hiểu sâu về cách Docker hoạt động\r\n\r\n\r\n\r\nKhóa học bao gồm toàn diện các khía cạnh về Docker như: container, image, volume, network, compose,... Nó cung cấp cho người học nền tảng kiến thức vững chắc để có thể xử lý các công việc liên quan đến Docker.\r\n\r\n\r\n\r\nNội dung mỗi bài giảng sẽ chia làm hai phần: lý thuyết (40%) và thực hành (60%), đảm bảo bám sát với thực tế và dễ nhớ, dễ hiểu nhất.\r\n\r\n\r\n\r\nCác ví dụ trong khóa học được lựa chọn để người học có thể làm quen được với các công nghệ phổ biến nhất như: NodeJS, Java SpringBoot, Python Django, Nginx, MySQL, Redis,... Và nội dung sẽ được cập nhật liên tục trong suốt quá trình update khóa học dựa theo ý kiến đóng góp của người học\r\n\r\n\r\n\r\nViệc làm chủ các kiến thức trong khóa học giúp người học có thể dễ dàng học tiếp các công nghệ nâng cao khác như Kubernetes. Từ đó giúp lộ trình nghề nghiệp được rộng mở và nhiều cơ hội hơn.', 1, 1, '2023-11-21 21:45:46'),
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
  `lesson_thumbnail` varchar(50) NOT NULL,
  `lesson_path` varchar(50) NOT NULL,
  `lesson_document` varchar(50) DEFAULT NULL,
  `lesson_status` tinyint(1) NOT NULL DEFAULT 1,
  `chapter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(18159864, 12, 11, '2023-11-23 05:51:41', 0),
(22456323, 12, 16, '2023-11-23 05:50:40', 1),
(55822647, 12, 18, '2023-11-22 23:48:40', 1),
(60825333, 17, 14, '2023-12-01 04:06:13', 1),
(60980120, 12, 13, '2023-11-22 23:36:25', 1),
(69672745, 12, 7, '2023-11-23 05:56:20', 1),
(75961066, 12, 18, '2023-11-23 06:01:02', 1),
(79632507, 12, 7, '2023-11-23 05:56:28', 1),
(83297076, 18, 13, '2023-11-24 15:28:14', 1),
(83764081, 17, 18, '2023-12-01 04:09:55', 1),
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
  `slider_status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_img`, `slider_status`) VALUES
(1, 'slider_1.png', 1),
(2, 'slider_2.png', 1),
(3, 'slider_3.png', 1);

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
  `roles` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0: admin, 1; user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_name`, `user_password`, `user_avatar`, `user_email`, `user_phone`, `user_status`, `roles`, `created_at`, `user_session_id`) VALUES
(1, 'user1', 'user1', '123456', 'avatar_default.png', 'user1@gmail.com', '', 1, 1, '2023-11-22 09:45:19', ''),
(2, 'user2', 'user2', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'user2@gmail.com', '', 1, 1, '2023-11-22 09:45:19', ''),
(3, 'user3', 'user3', '123', 'avatar_default.png', 'user3@gmail.com', '', 1, 1, '2023-11-22 09:45:19', ''),
(4, 'user4', 'user4', '123', 'avatar_default.png', 'user4@gmail.com', '', 1, 1, '2023-11-22 09:45:19', ''),
(5, 'user5', 'user5', '123', 'avatar_default.png', 'user5@gmail.com', '', 1, 1, '2023-11-22 10:11:08', ''),
(11, 'user6', '', '123456', 'avatar_default.png', 'user6@gmail.com', '', 1, 1, '2023-11-22 16:29:26', ''),
(12, 'user7', 'Trần Quang Hiệp', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'Screenshot (118).png', 'user7@gmail.com', '098356789', 1, 1, '2023-11-22 16:34:33', 'i7reul42qck238s71re7afngg1'),
(13, 'user8', '', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'user8@gmail.com', '', 1, 1, '2023-11-22 17:20:00', ''),
(15, 'hieptqph43210', 'Tran Quang Hiep', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'hieptqph43210@fpt.edu.vn', '', 1, 1, '2023-11-23 21:52:54', ''),
(16, 'hiep', 'hiep1', 'de2281d00751accb1ec5913cad20fc7037992a5f', 'dangky.png', 'hiephidata123@gmail.com', '0981234567', 1, 1, '2023-11-23 23:01:35', ''),
(17, 'user9', 'Quang Hiệp', 'a36dc4e726ba6529b5d4d9e3c156944d15def5fd', 'avatar_default.png', 'hiephidata@gmail.com', '', 1, 1, '2023-11-24 08:12:22', 'lukgf658d7g6f4lpi9e0c3145e'),
(18, 'hiepdz', 'Nguyen Công Hiệp', '5c2e7a6fa0a6a182056a1e85b8397d4f0b4f7269', 'Ảnh chụp màn hình 2023-03-28 120944.png', 'hiepooo94@gmail.com', '0981234567', 1, 1, '2023-11-24 08:25:12', ''),
(19, 'willTu', 'will gay Tu', 'b6a2050b23be98eb7df658d12b829af244bdd97d', 'Ảnh chụp màn hình 2023-03-28 120944.png', 'ducldph43245@fpt.edu.vn', '0981234567', 1, 1, '2023-11-24 09:36:50', ''),
(20, 'user10', 'Quang Hiệp', 'b207a02ba972decfeb671d4733e7850ddce263df', 'nhin-nguoi-chuan.png', 'quyntph31502@fpt.edu.vn', '0981234567', 1, 1, '2023-11-25 14:06:54', ''),
(21, 'admin', 'Name Admin', '0e3bbd26f46012ccec4776d171f314a00c022d98', 'avatar_default.png', 'admin@polyuni.fpt.vn', '', 1, 2, '2023-11-29 08:14:37', '');

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
(17, 14, '2023-11-30 21:09:33'),
(17, 18, '2023-11-30 21:10:51');

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `course_chapters`
--
ALTER TABLE `course_chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD CONSTRAINT `course_chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `course_includes`
--
ALTER TABLE `course_includes`
  ADD CONSTRAINT `course_includes_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD CONSTRAINT `course_lessons_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `course_chapters` (`chapter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
