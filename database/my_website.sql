-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 31, 2025 lúc 08:49 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my_website`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$u5C9LXOyY.F7E2Uo3pQf6uN9FwO1YY1S9wFTiFoWdU5Icg9RL7xXK', '2025-10-28 12:55:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Tai nghe', 'tai-nghe', '2025-10-28 12:55:30'),
(2, 'Dây sạc', 'day-sac', '2025-10-28 12:55:30'),
(3, 'Điện thoại', 'dien-thoai', '2025-10-28 12:55:30'),
(4, 'Phần mềm', 'phan-mem', '2025-10-28 12:55:30'),
(5, 'Laptop', 'laptop', '2025-10-28 12:55:30'),
(6, 'Đồng hồ', 'dong-ho', '2025-10-28 12:55:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `product_id`, `quantity`, `price`) VALUES
(5, 5, 8, 1, 2640000.00),
(6, 5, 8, 1, 2640000.00),
(7, 6, 8, 1, 2640000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_desc` mediumtext DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `is_hidden` tinyint(1) DEFAULT 0,
  `is_hot` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `short_desc`, `long_desc`, `price`, `quantity`, `category_id`, `is_hidden`, `is_hot`, `created_at`) VALUES
(8, 'Đồng hồ định vị trẻ em Kidcare S88 4G', '<h3>Khi c&aacute;c b&eacute; ng&agrave;y một lớn v&agrave; tới tuổi đi học th&igrave; phụ huynh kh&ocirc;ng thể n&agrave;o đồng h&agrave;nh c&ugrave;ng b&eacute; 24/24 như trước, do đ&oacute; cần phải c&oacute; thiết bị để li&ecirc;n lạc khi cần thiết. Nếu trang bị điện thoại th&igrave; phụ huynh lại lo lắng c&aacute;c b&eacute; kh&ocirc;ng tập trung học tập, dễ bị đ&aacute;nh cắp hoặc bỏ qu&ecirc;n.&nbsp;<a href=\"https://www.thegioididong.com/dong-ho-thong-minh/kidcare-s88-den\" rel=\"\" target=\"_blank\" title=\"Đồng hồ định vị trẻ em Kidcare S88 4G tại thegioididong.com\">Đồng hồ định vị trẻ em Kidcare S88 4G</a>&nbsp;sẽ l&agrave; một lựa chọn ph&ugrave; hợp với khả năng nghe gọi, định vị, thiết kế nhỏ gọn,...</h3>\r\n\r\n<h3>Thiết kế nổi bật, gọn nhẹ khi đeo</h3>\r\n\r\n<p>Do sản phẩm hướng đến người d&ugrave;ng l&agrave; trẻ em n&ecirc;n&nbsp;<a href=\"https://www.thegioididong.com/dong-ho-thong-minh-kidcare\" rel=\"\" target=\"_blank\" title=\"Xem thêm Đồng hồ thông minh Kidcare tại thegioididong.com\">đồng hồ th&ocirc;ng minh KidCare</a>&nbsp;được thiết kế kh&aacute; bắt mắt với m&agrave;u xanh v&agrave; đen phối hợp h&agrave;i h&ograve;a. Đồng thời độ bền cũng kh&aacute; tốt với&nbsp;<strong>khung viền nhựa</strong>, hạn chế hư hỏng do những va chạm nhẹ thường ng&agrave;y v&agrave; tối ưu khối lượng.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-1-2.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Thiết kế\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-1-2.jpg\" title=\"Đồng hồ Kidcare S88 4G - Thiết kế\" /></a></p>\r\n\r\n<p>Phần d&acirc;y được l&agrave;m từ&nbsp;<strong>silicone</strong>&nbsp;kh&ocirc;ng những bền m&agrave; c&ograve;n đem đến cảm gi&aacute;c thoải m&aacute;i khi đeo nhờ bề mặt nhẵn mịn, chống thấm nước tốt, bề mặt &iacute;t b&aacute;m bẩn v&agrave; dễ d&agrave;ng vệ sinh. Dọc theo d&acirc;y đồng hồ l&agrave; c&aacute;c lỗ được kho&eacute;t tỉ mỉ để người d&ugrave;ng điều chỉnh độ rộng cho ph&ugrave; hợp v&agrave; tạo sự th&ocirc;ng tho&aacute;ng khi đeo.</p>\r\n\r\n<p>Tuy l&agrave; đồng hồ trẻ em nhưng m&igrave;nh vẫn c&oacute; thể đeo vừa, theo cảm nhận của m&igrave;nh l&agrave; Kidcare S88 4G kh&ocirc;ng qu&aacute; nặng nếu đeo li&ecirc;n tục cả ng&agrave;y cũng sẽ kh&ocirc;ng g&acirc;y mỏi. Khi điều chỉnh độ rộng vừa vặn th&igrave; sẽ kh&ocirc;ng kh&oacute; chịu khi sử dụng, kh&ocirc;ng để lại c&aacute;c dấu hằn đỏ tr&ecirc;n da, n&ecirc;n c&aacute;c phụ huynh c&oacute; thể y&ecirc;n t&acirc;m trang bị cho b&eacute;.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-2-2.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G -  Dây đeo thoải mái\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-2-2.jpg\" title=\"Đồng hồ Kidcare S88 4G -  Dây đeo thoải mái\" /></a></p>\r\n\r\n<p>Hai cạnh b&ecirc;n của mặt đồng hồ được t&iacute;ch hợp&nbsp;<strong>n&uacute;t bấm vật l&yacute;</strong>, khe cắm sim v&agrave; d&atilde;y loa ki&ecirc;m lối tho&aacute;t nước một c&aacute;ch kh&eacute;o l&eacute;o tạo n&ecirc;n vẻ ngo&agrave;i thẩm mỹ, đảm bảo c&aacute;c b&eacute; c&oacute; thể sử dụng được đầy đủ chức năng dễ d&agrave;ng.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-3-2.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Nút vật lý\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-3-2.jpg\" title=\"Đồng hồ Kidcare S88 4G - Nút vật lý\" /></a></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/dong-ho-thong-minh-tre-em\" rel=\"\" target=\"_blank\" title=\"Xem thêm Đồng hồ thông minh trẻ em chính hãng, giá rẻ, bán tại Thế Giới Di Động\">Đồng hồ th&ocirc;ng minh trẻ em</a>&nbsp;được trang bị m&agrave;n h&igrave;nh&nbsp;<strong>1.3 inch</strong>&nbsp;tuy kh&ocirc;ng qu&aacute; lớn nhưng ph&ugrave; hợp với c&aacute;c b&eacute;, nội dung vẫn được hiển thị đầy đủ. Sử dụng&nbsp;<strong>tấm nền TFT</strong>&nbsp;c&oacute; độ ph&acirc;n giải&nbsp;<strong>240 x 240 pixels</strong>&nbsp;thể hiện c&aacute;c nội dung một c&aacute;ch chi tiết, r&otilde; r&agrave;ng ở nhiều m&ocirc;i trường s&aacute;ng.&nbsp;</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-4-1.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Màn TFT\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-4-1.jpg\" title=\"Đồng hồ Kidcare S88 4G - Màn TFT\" /></a></p>\r\n\r\n<p>M&agrave;n h&igrave;nh được bao bọc bởi một lớp&nbsp;<strong>k&iacute;nh cường lực</strong>&nbsp;hạn chế trầy xước trong qu&aacute; tr&igrave;nh c&aacute;c b&eacute; sử dụng.&nbsp;<strong>M&agrave;n h&igrave;nh cảm ứng</strong>&nbsp;mượt m&agrave;, tốc độ phản hồi những thao t&aacute;c vuốt chạm kh&aacute; nhanh, tiện lợi cho b&eacute; trong qu&aacute; tr&igrave;nh sử dụng. Đồng thời, m&agrave;n h&igrave;nh c&oacute; thể điều chỉnh được độ s&aacute;ng gi&uacute;p bảo vệ thị lực của b&eacute;.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-5-1.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Kính cường lực\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-5-1.jpg\" title=\"Đồng hồ Kidcare S88 4G - Kính cường lực\" /></a></p>\r\n\r\n<h3>2 camera hỗ trợ chụp ảnh, gọi video chất lượng</h3>\r\n\r\n<p>Chiếc đồng hồ định vị trẻ em Kidcare được trang bị&nbsp;<strong>2 camera</strong>, 1 c&aacute;i được lắp ở cạnh tr&ecirc;n của m&agrave;n h&igrave;nh c&ograve;n 1 c&aacute;i nằm ở cạnh tr&ecirc;n của mặt đồng hồ.&nbsp;<strong>Camera 2 MP</strong>&nbsp;gi&uacute;p ghi lại h&igrave;nh ảnh r&otilde; r&agrave;ng, khi được kết nối với internet c&oacute; thể thực hiện được cuộc gọi video, th&ocirc;ng qua đ&acirc;y phụ huynh c&oacute; thể quan s&aacute;t được m&ocirc;i trường xung quanh b&eacute;.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-6-1.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - 2 camera\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-6-1.jpg\" title=\"Đồng hồ Kidcare S88 4G - 2 camera\" /></a></p>\r\n\r\n<p>Ngo&agrave;i cuộc gọi video th&igrave; đồng hồ c&ograve;n c&oacute; thể thực hiện cuộc gọi quay số hoặc nhắn tin nhờ được trang bị&nbsp;<strong>Nano SIM</strong>. Với KidCare S88 th&igrave; phụ huynh c&oacute; thể bảo vệ b&eacute; khỏi c&aacute;c cuộc gọi từ những số điện thoại lạ bằng c&aacute;ch thiết lập c&aacute;c số li&ecirc;n hệ trong danh bạ. Theo m&igrave;nh đ&acirc;y l&agrave; một chức năng rất tốt để ngăn chặn những kẻ c&oacute; &yacute; đồ xấu tiếp x&uacute;c với con em trong gia đ&igrave;nh.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, trong trường hợp khẩn cấp, b&eacute; cũng c&oacute; thể&nbsp;<strong>thực hiện cuộc gọi SOS</strong>&nbsp;bằng c&aacute;ch nhấn giữ n&uacute;t nguồn, đồng thời sẽ gửi tọa độ cho cha mẹ để nhận được sự hỗ trợ kịp thời.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-7-1.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Quay số trực tiếp\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-7-1.jpg\" title=\"Đồng hồ Kidcare S88 4G - Quay số trực tiếp\" /></a></p>\r\n\r\n<h3>Hệ thống định vị hiện đại, cung cấp vị tr&iacute; ch&iacute;nh x&aacute;c</h3>\r\n\r\n<p>Kidcare S88 được&nbsp;h&atilde;ng trang bị hệ thống định vị gồm&nbsp;<strong>GPS</strong>,&nbsp;<strong>Beidou&nbsp;</strong>kết hợp nhiều thuật to&aacute;n định vị như&nbsp;<strong>AGPS</strong>,&nbsp;<strong>LBS</strong>,&nbsp;<strong>Nhận dạng vị tr&iacute; qua ảnh chụp, Định vị bằng thuật to&aacute;n AI</strong>,... hỗ trợ kết nối với&nbsp;<strong>Wifi&nbsp;</strong>v&agrave;&nbsp;<strong>4G</strong>&nbsp;mang lại khả năng x&aacute;c định vị tr&iacute;, theo d&otilde;i tuyến đường một c&aacute;ch nhanh ch&oacute;ng v&agrave; ch&iacute;nh x&aacute;c, &iacute;t sai số nhất.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-9.png\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Đa chế độ định vị\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-9.png\" title=\"Đồng hồ Kidcare S88 4G - Đa chế độ định vị\" /></a></p>\r\n\r\n<p>M&igrave;nh đ&atilde; để chiếc đồng hồ n&agrave;y ở nh&agrave; v&agrave; di chuyển đến cơ quan c&aacute;ch kh&aacute; xa, khi đến nơi m&igrave;nh đ&atilde; kiểm tra vị tr&iacute; đồng hồ tr&ecirc;n ứng dụng Mibro, kết quả định vị rất ch&iacute;nh x&aacute;c, chứng minh khả năng định vị đ&aacute;ng tin cậy. C&aacute;c bật phụ huynh c&oacute; thể an t&acirc;m khi đ&atilde; c&oacute; Kidcare S88 đồng h&agrave;nh c&ugrave;ng b&eacute; trong cả ng&agrave;y.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-10.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Ứng dụng Mibro\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-10.jpg\" title=\"Đồng hồ Kidcare S88 4G - Ứng dụng Mibro\" /></a></p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, phụ huynh c&ograve;n c&oacute; thể thiết lập&nbsp;<strong>v&ugrave;ng an to&agrave;n</strong>&nbsp;cho b&eacute; như: Trường học, nh&agrave; ở, khu vui chơi,... khi c&aacute;c em đến những nơi n&agrave;y th&igrave; đồng hồ sẽ gửi th&ocirc;ng b&aacute;o để phụ huynh nắm bắt t&igrave;nh h&igrave;nh nhanh ch&oacute;ng. Trường hợp b&eacute; đến những khu vực lạ chưa được thiết lập th&igrave; đồng hồ cũng sẽ gửi cảnh b&aacute;o để cha mẹ li&ecirc;n hệ với b&eacute; hoặc người chăm s&oacute;c.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-11.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Thiết lập vùng an toàn\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-11.jpg\" title=\"Đồng hồ Kidcare S88 4G - Thiết lập vùng an toàn\" /></a></p>\r\n\r\n<h3>Đồng h&agrave;nh c&ugrave;ng b&eacute; ở bất kỳ đ&acirc;u, kh&ocirc;ng lo bị gi&aacute;n đoạn</h3>\r\n\r\n<p>Kidcare S88 4G được trang bị vi&ecirc;n pin l&ecirc;n đến&nbsp;<strong>1000 mAh</strong>&nbsp;cho thời gian sử dụng l&ecirc;n đến&nbsp;<strong>4 ng&agrave;y</strong>&nbsp;theo như nh&agrave; sản xuất c&ocirc;ng bố, b&eacute; thoải m&aacute;i sử dụng m&agrave; kh&ocirc;ng bị ngắt qu&atilde;ng do hết pin giữa chừng, phụ huynh cũng kh&ocirc;ng cần phải sạc đồng hồ mỗi ng&agrave;y.&nbsp;</p>\r\n\r\n<p><strong>Lưu &yacute;:</strong>&nbsp;Thời lượng pin thực tế của đồng hồ sẽ kh&aacute;c nhau t&ugrave;y v&agrave;o cường độ sử dụng của từng người d&ugrave;ng.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-12.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Viên pin lớn\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-12.jpg\" title=\"Đồng hồ Kidcare S88 4G - Viên pin lớn\" /></a></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/dong-ho-thong-minh\" rel=\"\" target=\"_blank\" title=\"Đồng hồ thông minh chính hãng, giá rẻ, bán tại Thế Giới Di Động\">Đồng hồ th&ocirc;ng minh</a>&nbsp;của nh&agrave; Kidcare đạt chuẩn&nbsp;<strong>kh&aacute;ng nước IPX8</strong>&nbsp;cho ph&eacute;p b&eacute; đeo đồng hồ cả khi đi mưa, đi tắm,... tr&aacute;nh trường hợp bỏ qu&ecirc;n. Nhưng c&aacute;c b&eacute; cần lưu &yacute;, kh&ocirc;ng để đồng hồ tiếp x&uacute;c với nước n&oacute;ng, h&oacute;a chất, kh&ocirc;ng đem v&agrave;o ph&ograve;ng x&ocirc;ng hơi hoặc nơi c&oacute; độ ẩm qu&aacute; cao.</p>\r\n\r\n<p><strong>Lưu &yacute;:</strong>&nbsp;Hiệu suất bảo vệ chống thấm nước tr&ecirc;n đồng hồ kh&ocirc;ng phải l&agrave; trạng th&aacute;i vĩnh viễn, c&oacute; thể bị giảm dần theo thời gian.</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-13.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Kháng nước IPX8\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-13.jpg\" title=\"Đồng hồ Kidcare S88 4G - Kháng nước IPX8\" /></a></p>\r\n\r\n<h3>V&ocirc; v&agrave;n tiện &iacute;ch hỗ trợ b&eacute;</h3>\r\n\r\n<p>Phải kể đến đầu ti&ecirc;n l&agrave; t&iacute;nh năng&nbsp;<strong>thời kh&oacute;a biểu</strong>, th&ocirc;ng qua đ&oacute; bố mẹ c&oacute; thể nắm bắt được lịch học của con, c&aacute;c b&eacute; cũng c&oacute; thể tự kiểm tra c&aacute;c m&ocirc;n học của ng&agrave;y h&ocirc;m sau tạo n&ecirc;n t&iacute;nh độc lập cho b&eacute;.</p>\r\n\r\n<p>C&aacute;c b&eacute; c&ograve;n c&oacute; thể đổi mặt đồng hồ với kho giao diện phong ph&uacute;, thao t&aacute;c cũng rất đơn giản m&igrave;nh chỉ cần hướng dẫn một lần l&agrave; b&eacute; nh&agrave; đ&atilde; c&oacute; thể thực hiện được. B&ecirc;n cạnh đ&oacute; c&ograve;n những t&iacute;nh năng kh&aacute;c hỗ trợ b&eacute; trong cuộc sống hằng ng&agrave;y như: Đếm bước ch&acirc;n, nu&ocirc;i th&uacute; cưng, b&aacute;o thức, chế độ thể thao, kết bạn,...</p>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-14.png\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"Đồng hồ Kidcare S88 4G - Nhiều tiện ích khác\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-14.png\" title=\"Đồng hồ Kidcare S88 4G - Nhiều tiện ích khác\" /></a></p>\r\n\r\n<p>Với nhiều t&iacute;nh năng hữu &iacute;ch như nghe gọi trực tiếp, gọi video HD, khả năng định vị ch&iacute;nh x&aacute;c, thời lượng pin d&agrave;i, mức độ kh&aacute;ng nước tốt,... đồng hồ định vị trẻ em Kidcare S88 4G l&agrave; một thiết bị kh&ocirc;ng thể thiếu gi&uacute;p phụ huynh bảo vệ an to&agrave;n hơn cho con em m&igrave;nh.</p>', '<ul>\r\n	<li>\r\n	<p><img alt=\"chính sách bảo hành\" src=\"https://cdnv2.tgdd.vn/pim/cdn/images/202410/icon%20sp%20kem%20theo142836.png\" />Bộ sản phẩm gồm: Hộp, Đồng hồ, S&aacute;ch hướng dẫn, D&acirc;y c&aacute;p</p>\r\n	</li>\r\n	<li>\r\n	<p><img alt=\"chính sách bảo hành\" src=\"https://cdnv2.tgdd.vn/pim/cdn/images/202410/Exchange232102.png\" />Bảo h&agrave;nh c&oacute; cam kết&nbsp;<strong>12 th&aacute;ng</strong>&nbsp;<a href=\"javascript:void(0)\" onclick=\"showPopupPolicy()\" title=\"Chính sách đổi trả\">Xem chi tiết</a></p>\r\n	</li>\r\n	<li>\r\n	<p><img alt=\"chính sách bảo hành\" src=\"https://cdnv2.tgdd.vn/pim/cdn/images/202410/icon%20bao%20hanh170837.png\" />Bảo h&agrave;nh&nbsp;<strong>ch&iacute;nh h&atilde;ng đồng hồ th&ocirc;ng minh 1 năm</strong>&nbsp;tại c&aacute;c trung t&acirc;m bảo h&agrave;nh h&atilde;ng&nbsp;<a href=\"https://www.thegioididong.com/bao-hanh\" target=\"_blank\" title=\"Chính sách bảo hành\">Xem địa chỉ bảo h&agrave;nh</a></p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"Đồng hồ Kidcare S88 4G - Nhiều tiện ích khác\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/kidcare-s88-den-14.png\" /></p>\r\n\r\n<p><img alt=\"Đồng hồ định vị trẻ em Kidcare S88 4G\" src=\"https://cdn.tgdd.vn/Products/Images/7077/292695/Kit/kidcare-s88-hinh-note.jpg\" /></p>\r\n\r\n<h3><a href=\"javascript:;\">M&agrave;n h&igrave;nh</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>C&ocirc;ng nghệ m&agrave;n h&igrave;nh:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cac-loai-man-hinh-thong-dung-tren-smartwatch-1169187#hmenuid3\" target=\"_blank\">TFT</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>K&iacute;ch thước m&agrave;n h&igrave;nh:&nbsp;</strong>1.3 inch</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Độ ph&acirc;n giải:</strong>240 x 240 pixels</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>K&iacute;ch thước mặt:&nbsp;</strong>43.4 mm</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Thiết kế</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Chất liệu mặt:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cac-loai-mat-kinh-tren-dong-ho-thong-minh-1204238#hmenuid5\" target=\"_blank\">K&iacute;nh cường lực</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chất liệu khung viền:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-tat-tan-tat-chat-lieu-khung-vien-cua-dong-1181950#hmenuid2\" target=\"_blank\">Nhựa</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chất liệu d&acirc;y:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cac-chat-lieu-dong-ho-deo-tay-1171917#subhmenuid9\" target=\"_blank\">Silicone</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Độ rộng d&acirc;y:&nbsp;</strong>2 cm</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chu vi cổ tay ph&ugrave; hợp:&nbsp;</strong>16 - 25 cm</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Khả năng thay d&acirc;y:</strong>C&oacute;</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>K&iacute;ch thước, khối lượng:&nbsp;</strong>D&agrave;i 43.4 mm - Ngang 43.4 mm - D&agrave;y 9.9 mm - Nặng 58.6 g</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Tiện &iacute;ch</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>M&ocirc;n thể thao:&nbsp;</strong>Chạy bộ</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Sim:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/nano-sim-tren-smartwatch-la-gi-co-nhung-uu-diem-gi-1264076\" target=\"_blank\">Nano SIM</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Hỗ trợ nghe gọi:&nbsp;</strong>Nghe gọi độc lập</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tiện &iacute;ch đặc biệt:&nbsp;</strong>Cuộc gọi video4G/LTE</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chống nước / Kh&aacute;ng nước:&nbsp;</strong>Kh&aacute;ng nước IPX8 (Rửa tay, đi mưa)</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Theo d&otilde;i sức khoẻ:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-mot-so-tinh-nang-theo-doi-suc-khoe-tren-dong-ho-1380855#hmenuid3\" target=\"_blank\">T&iacute;nh qu&atilde;ng đường chạy</a>Chế độ luyện tập<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-mot-so-tinh-nang-theo-doi-suc-khoe-tren-dong-ho-1380855#hmenuid1\" target=\"_blank\">Đếm số bước ch&acirc;n</a></p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Pin</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Thời gian sử dụng pin:&nbsp;</strong>Khoảng 4 ng&agrave;y</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Thời gian sạc:&nbsp;</strong>Khoảng 3.5 giờ, chỉ d&ugrave;ng củ sạc 5V-1A</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Dung lượng pin:&nbsp;</strong>1000 mAh</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Cổng sạc:&nbsp;</strong>D&acirc;y sạc nam ch&acirc;m</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Th&ocirc;ng tin kh&aacute;c</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Sản xuất tại:</strong>Trung Quốc</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Thời gian ra mắt:</strong>10/2022</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Ng&ocirc;n ngữ:</strong>Tiếng ViệtTiếng Anh</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>H&atilde;ng:</strong>Kidcare.&nbsp;Xem th&ocirc;ng tin h&atilde;ng</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><a href=\"https://cdn.tgdd.vn/Products/PDF/3/292695/HDSD/huong-dan-su-dung-kidcare-s88.pdf\" target=\"_blank\">&nbsp;Hướng Dẫn Sử Dụng Tiếng Việt&nbsp;</a>[PDF, 1.6MB]</p>', 2640000.00, 100, 6, 0, 1, '2025-10-29 11:19:56'),
(9, 'Điện thoại iPhone 17 Pro Max 256GB', '<p><strong>Đặc điểm nổi bật của iPhone 17 Pro Max</strong><br />\r\n&bull;&nbsp;Thiết kế nh&ocirc;m nguy&ecirc;n khối rất chắc chắn, nổi bật với m&agrave;n h&igrave;nh lớn nhất từ trước đến nay.<br />\r\n&bull;&nbsp;M&agrave;n h&igrave;nh ProMotion 120 Hz s&aacute;ng v&agrave; lớn nhất, cho h&igrave;nh ảnh si&ecirc;u mượt v&agrave; xem phim đ&atilde; mắt.<br />\r\n&bull;&nbsp;Chụp ảnh chuy&ecirc;n nghiệp với bộ ba camera 48 MP.<br />\r\n&bull; Sử dụng chip Apple A19 Pro, gi&uacute;p m&aacute;y chạy cực nhanh v&agrave; xử l&yacute; mọi thứ dễ d&agrave;ng.<br />\r\n&bull; Pin cực khủng, l&agrave; chiếc iPhone c&oacute; pin tr&acirc;u nhất, cho ph&eacute;p xem video đến 37 giờ.</p>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/dtdd/iphone-17-pro-max\" rel=\"\" target=\"_blank\" title=\"Tham khảo iPhone 17 Pro Max tại thegioididong.com\">iPhone 17 Pro Max</a>&nbsp;l&agrave; phi&ecirc;n bản cao cấp nhất trong d&ograve;ng sản phẩm iPhone 17 series, được định vị l&agrave; thiết bị tập trung v&agrave;o c&ocirc;ng nghệ m&agrave;n h&igrave;nh, hiệu năng xử l&yacute; v&agrave; khả năng nhiếp ảnh. Phi&ecirc;n bản n&agrave;y giới thiệu một loạt n&acirc;ng cấp về phần cứng v&agrave; c&aacute;c t&iacute;nh năng đi k&egrave;m, hướng đến việc cung cấp một c&ocirc;ng cụ c&oacute; cấu h&igrave;nh mạnh mẽ cho c&aacute;c nhu cầu sử dụng từ cơ bản đến chuy&ecirc;n s&acirc;u.</h3>\r\n\r\n<h3>Ngoại h&igrave;nh mới, bền bỉ hơn</h3>\r\n\r\n<p>iPhone 17 Pro Max được thiết kế để vừa đẹp mắt, vừa bền bỉ. Khung m&aacute;y l&agrave;m từ nh&ocirc;m nguy&ecirc;n khối, tăng cường độ cứng c&aacute;p cho thiết bị. Mặt trước của m&aacute;y được phủ một lớp Ceramic Shield 2 ti&ecirc;n tiến, c&ograve;n mặt sau được bảo vệ bằng k&iacute;nh&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/mat-kinh-ceramic-shield-tren-iphone-12-la-gi-co-xin-so-nhu-1298900\" rel=\"\" target=\"_blank\" title=\"Mặt kính Ceramic Shield trên iPhone là gì? Có trên dòng iPhone nào?\">Ceramic Shield</a>, gi&uacute;p thiết bị chống trầy xước hiệu quả. M&aacute;y c&oacute; ba t&ugrave;y chọn m&agrave;u sắc l&agrave; Silver (Bạc), Deep Blue (Xanh đậm), v&agrave; Cosmic Orange (Cam vũ trụ).</p>\r\n\r\n<p><a href=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042527-106.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"iPhone 17 Pro Max 256GB - Thiết kế (Nguồn: Apple.com) \" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042527-106.jpg\" title=\"iPhone 17 Pro Max 256GB - Thiết kế (Nguồn: Apple.com) \" /></a></p>\r\n\r\n<p>Ở mặt sau, cụm ba camera c&oacute; thiết kế được l&agrave;m mới, tr&ocirc;ng rộng v&agrave; lồi hơn so với thế hệ trước. Về c&aacute;c n&uacute;t bấm vật l&yacute;, m&aacute;y vẫn giữ lại n&uacute;t t&aacute;c vụ (Action Button) v&agrave; bổ sung th&ecirc;m n&uacute;t điều khiển Camera (Camera Control) chuy&ecirc;n dụng.</p>\r\n\r\n<p>Mặc d&ugrave; vẫn giữ lại&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cach-su-dung-dynamic-island-tren-iphone-15-mot-1552156\" rel=\"\" target=\"_blank\" title=\"Dynamic Island là gì? Có trên iPhone nào? Cách sử dụng trên iPhone\">Dynamic Island</a>&nbsp;quen thuộc ở mặt trước để đảm bảo trải nghiệm liền mạch, iPhone 17 Pro Max lại tạo n&ecirc;n một sự đột ph&aacute; mạnh mẽ ở mặt sau. Cụm camera sau đ&atilde; được thiết kế lại, kh&ocirc;ng chỉ lồi l&ecirc;n r&otilde; rệt m&agrave; c&ograve;n tr&ocirc;ng rộng hơn đ&aacute;ng kể, tạo n&ecirc;n một sự kh&aacute;c biệt ấn tượng, ngay cả khi vẫn giữ nguy&ecirc;n cấu h&igrave;nh ba ống k&iacute;nh.</p>\r\n\r\n<p><a href=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042528-012.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"iPhone 17 Pro Max 256GB - Dynamic Island (Nguồn: Apple.com) \" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042528-012.jpg\" title=\"iPhone 17 Pro Max 256GB - Dynamic Island (Nguồn: Apple.com) \" /></a></p>\r\n\r\n<h3>Sắc n&eacute;t mượt m&agrave; từng khung h&igrave;nh</h3>\r\n\r\n<p>M&agrave;n h&igrave;nh của&nbsp;<a href=\"https://www.thegioididong.com/dtdd-apple-iphone\" rel=\"\" target=\"_blank\" title=\"Tham khảo iPhone chính hãng tại Thegioididong.com\">iPhone</a>&nbsp;c&oacute; k&iacute;ch thước 6.9 inch, sử dụng tấm nền&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-super-retina-xdr-tren-iphone-11-pro-va-11-1198630\" rel=\"\" target=\"_blank\" title=\"Tìm hiểu công nghệ màn hình Super Retina XDR trên iPhone\">Super Retina XDR</a>&nbsp;cho khả năng hiển thị m&agrave;u sắc v&agrave; độ tương phản cao. Với độ s&aacute;ng tối đa c&oacute; thể đạt 3000 nits, m&agrave;n h&igrave;nh cho ph&eacute;p người d&ugrave;ng xem nội dung r&otilde; hơn khi ở ngo&agrave;i trời. C&ocirc;ng nghệ ProMotion tiếp tục được trang bị, với khả năng điều chỉnh tần số qu&eacute;t th&iacute;ch ứng l&ecirc;n đến 120 Hz.</p>\r\n\r\n<p><a href=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042529-206.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"iPhone 17 Pro Max 256GB - Màn hình (Nguồn: Apple.com) \" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042529-206.jpg\" title=\"iPhone 17 Pro Max 256GB - Màn hình (Nguồn: Apple.com) \" /></a></p>\r\n\r\n<h3>Vượt mọi thử th&aacute;ch với chip A19 Pro</h3>\r\n\r\n<p>Để vận h&agrave;nh m&agrave;n h&igrave;nh v&agrave; c&aacute;c t&aacute;c vụ kh&aacute;c,&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" rel=\"\" target=\"_blank\" title=\"Tham khảo điện thoại chính hãng tại Thegioididong.com\">điện thoại</a>&nbsp;được trang bị&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/chip-apple-a19-apple-a19-pro-tren-iphone-1582761\" rel=\"\" target=\"_blank\" title=\"Tìm hiểu chip Apple A19, Apple A19 Pro trên iPhone 17, iPhone Air\">chip A19 Pro</a>. Con chip n&agrave;y được x&acirc;y dựng tr&ecirc;n tiến tr&igrave;nh mới, bao gồm CPU v&agrave; GPU 6 l&otilde;i, được thiết kế để cải thiện hiệu suất xử l&yacute; đồ họa v&agrave; c&aacute;c t&aacute;c vụ học m&aacute;y (AI) trực tiếp tr&ecirc;n thiết bị. Hệ thống tản nhiệt bằng buồng hơi cũng được t&iacute;ch hợp để duy tr&igrave; hiệu suất ổn định khi m&aacute;y xử l&yacute; c&aacute;c t&aacute;c vụ nặng.</p>\r\n\r\n<p><a href=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042530-174.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"iPhone 17 Pro Max 256GB - A19 Pro (Nguồn: Apple.com) \" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042530-174.jpg\" title=\"iPhone 17 Pro Max 256GB - A19 Pro (Nguồn: Apple.com) \" /></a></p>\r\n\r\n<h3>Trợ thủ đắc lực khi quay chụp</h3>\r\n\r\n<p>Hệ thống camera sau của iPhone 17 Pro Max l&agrave; một trong những khu vực c&oacute; nhiều n&acirc;ng cấp. Cả ba ống k&iacute;nh, bao gồm camera ch&iacute;nh, camera si&ecirc;u rộng (Ultra Wide) v&agrave; camera tele, đều được trang bị cảm biến c&oacute; độ ph&acirc;n giải 48MP. Việc n&acirc;ng cấp đồng bộ n&agrave;y cho ph&eacute;p thu nhận nhiều &aacute;nh s&aacute;ng v&agrave; chi tiết hơn tr&ecirc;n to&agrave;n dải ti&ecirc;u cự. Đặc biệt, camera tele được cải tiến với khả năng zoom quang học l&ecirc;n đến 8x, mở rộng c&aacute;c t&ugrave;y chọn bố cục khi chụp từ xa.</p>\r\n\r\n<p><a href=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042530-987.jpg\" onclick=\"return false;\" rel=\"nofollow\"><img alt=\"iPhone 17 Pro Max 256GB - Camera sau (Nguồn: Apple.com) \" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/iphone-17-pro-max-110925-042530-987.jpg\" title=\"iPhone 17 Pro Max 256GB - Camera sau (Nguồn: Apple.com) \" /></a></p>\r\n\r\n<p>Camera trước&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/trung-tam-man-hinh-center-stage-la-gi-cach-dung-1582655\" rel=\"\" target=\"_blank\" title=\"Hướng dẫn dùng Trung tâm màn hình trên iPhone, iPad và Macbook\">Center Stage</a>&nbsp;18 MP của iPhone 17 Pro Max mang đến nhiều t&iacute;nh năng s&aacute;ng tạo. Bạn c&oacute; thể mở rộng trường ảnh hoặc xoay khung h&igrave;nh dễ d&agrave;ng. Khi chụp ảnh nh&oacute;m, camera sẽ tự động điều chỉnh để lấy được to&agrave;n bộ mọi người. Đặc biệt, t&iacute;nh năng quay video đồng thời bằng cả camera trước v&agrave; sau mở ra những g&oacute;c nh&igrave;n độc đ&aacute;o, gi&uacute;p bạn ghi lại thế giới một c&aacute;ch s&aacute;ng tạo hơn.</p>', '<p><img alt=\"iPhone 17 Pro Max 256GB\" src=\"https://cdnv2.tgdd.vn/mwg-static/tgdd/Products/Images/42/342679/Kit/iphone-17-pro-max-note-638947387842468805.jpg\" /></p>\r\n\r\n<h3><a href=\"javascript:;\">Cấu h&igrave;nh &amp; Bộ nhớ</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/he-dieu-hanh-la-gi-804907#hmenuid1\" target=\"_blank\">Hệ điều h&agrave;nh:</a>&nbsp;iOS 26</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chip xử l&yacute; (CPU):&nbsp;</strong>Apple A19 Pro 6 nh&acirc;n</p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/toc-do-cpu-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-tu-1299483\" target=\"_blank\">Tốc độ CPU:</a>&nbsp;H&atilde;ng kh&ocirc;ng c&ocirc;ng bố</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Chip đồ họa (GPU):&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-xu-ly-apple-a14-bionic-hieu-nang-manh-den-1302095\" target=\"_blank\">Apple GPU 6 nh&acirc;n</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259\" target=\"_blank\">RAM:</a>&nbsp;12 GB</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Dung lượng lưu trữ:&nbsp;</strong>256 GB</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Dung lượng c&ograve;n lại (khả dụng) khoảng:&nbsp;</strong>241 GB</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Danh bạ:&nbsp;</strong>Kh&ocirc;ng giới hạn</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Camera &amp; M&agrave;n h&igrave;nh</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/do-phan-giai-camera-tren-smartphone-la-gi-1339722\" target=\"_blank\">Độ ph&acirc;n giải camera sau:</a></p>\r\n\r\n	<p>Ch&iacute;nh 48 MP &amp; Phụ 48 MP, 48 MP</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Quay phim camera sau:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#hd\" target=\"_blank\">HD 720p@30fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd\" target=\"_blank\">FullHD 1080p@60fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd\" target=\"_blank\">FullHD 1080p@30fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p>FullHD 1080p@25fps</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd\" target=\"_blank\">FullHD 1080p@120fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k\" target=\"_blank\">4K 2160p@60fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k\" target=\"_blank\">4</a><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k\" target=\"_blank\">K 2160p@30fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p>4K 2160p@25fps</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k\" target=\"_blank\">4K 2160p@24fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k\" target=\"_blank\">4K 2160p@120fps</a></p>\r\n		</li>\r\n		<li>\r\n		<p>4K 2160p@100fps</p>\r\n		</li>\r\n		<li>\r\n		<p>2.8K 60fps</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Đ&egrave;n Flash camera sau:</strong></p>\r\n\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cac-loai-den-flash-tren-camera-dien-thoai-1143808\" target=\"_blank\">C&oacute;</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>T&iacute;nh năng camera sau:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>&nbsp;&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-anh-raw-tren-smartphone-906402\" target=\"_blank\">Ảnh Raw</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Điều khiển camera (Camera Control)</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/dieu-chinh-khau-do-camera-tren-dien-thoai-tien-dun-1069913\" target=\"_blank\">Điều chỉnh khẩu độ</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/zoom-quang-hoc-va-zoom-ky-thuat-so-la-gi-co-gi-khac-nhau-1296828#zoom-quang-hoc\" target=\"_blank\">Zoom quang học</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/zoom-quang-hoc-va-zoom-ky-thuat-so-la-gi-co-gi-khac-nhau-1296828#zoom-ky-thuat-so\" target=\"_blank\">Zoom kỹ thuật số</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/chup-anh-xoa-phong-la-gi-no-co-tac-dung-nhu-the-na-1138006\" target=\"_blank\">X&oacute;a ph&ocirc;ng</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408\" target=\"_blank\">Tự động lấy n&eacute;t (AF)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/che-do-quay-phim-time-lapse-la-gi-1172228#hmenuid1\" target=\"_blank\">Tr&ocirc;i nhanh thời gian (Time Lapse)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/chup-anh-panorama-toan-canh-tren-camera-cua-smar-906425\" target=\"_blank\">To&agrave;n cảnh (Panorama)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Smart HDR 5</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/tin-tuc/cac-che-do-chup-anh-tren-smartphone-tiep-theo--739084#sieudophangiai\" target=\"_blank\">Si&ecirc;u độ ph&acirc;n giải</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-macro-la-gi-907851\" target=\"_blank\">Si&ecirc;u cận (Macro)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Quay video định dạng Log</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/tin-tuc/tat-tan-tat-ve-che-do-quay-video-hien-thi-kep-1472983#Quayvideohienthikep\" target=\"_blank\">Quay video hiển thị k&eacute;p</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Quay video ProRes</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/che-do-quay-video-slow-motion-la-gi-luu-y-khi-quay-video-1013728\" target=\"_blank\">Quay chậm (Slow Motion</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-quay-video-slow-motion-la-gi-luu-y-khi-quay-video-1013728\" target=\"_blank\">)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Live Photos</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/chuc-nang-geotagging-gan-the-dia-ly-tren-smartphon-906427\" target=\"_blank\">Gắn thẻ địa lý (Geotagging)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/camera-goc-rong-goc-sieu-rong-tren-smartphone-l-1172240\" target=\"_blank\">G&oacute;c si&ecirc;u rộng (Ultrawide)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/dolby-vision-la-gi-cac-ung-dung-noi-bat-va-nhung-loai-1226284\" target=\"_blank\">Dolby Vision HDR</a><a href=\"https://www.thegioididong.com/hoi-dap/deep-fusion-tren-dong-iphone-11-pro-la-gi-tinh-nan-1197418#hmenuid1\" target=\"_blank\">Deep Fusion</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-quay-phim-cinematic-mode-co-gi-noi-bat-1383619\" target=\"_blank\">Cinematic</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Chụp ảnh li&ecirc;n tục</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-chong-rung-ky-thuat-so-eis-tren-may-an-906417\" target=\"_blank\">Chống rung điện tử kỹ thuật số (EIS)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416\" target=\"_blank\">Chống rung quang học (OIS)</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873\" target=\"_blank\">Ban đ&ecirc;m (Night Mode)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/tin-tuc/cach-su-dung-che-do-action-mode-tren-iphone-14-1471753\" target=\"_blank\">Chế độ h&agrave;nh động (Action Mode)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Photonic Engine</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/do-phan-giai-camera-tren-smartphone-la-gi-1339722\" target=\"_blank\">Độ ph&acirc;n giải camera trước:</a>&nbsp;18 MP</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>T&iacute;nh năng camera trước:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Video hiển thị k&eacute;p</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408\" target=\"_blank\">Tự động lấy n&eacute;t (AF)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/tin-tuc/day-la-nhung-gi-ban-can-biet-ve-troi-nhanh-thoi-gian-1472026#Troinhanhthoigian\" target=\"_blank\">Tr&ocirc;i nhanh thời gian (Time Lapse)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/chuc-nang-retina-flash-tren-cac-dong-dien-thoai-ip-1173061\" target=\"_blank\">Retina Flash</a><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#hd\" target=\"_blank\">Quay video </a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#hd\" target=\"_blank\">HD</a><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#fullhd\" target=\"_blank\">Quay video Full HD</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#4k\" target=\"_blank\">Quay video 4K</a><a href=\"https://www.thegioididong.com/hoi-dap/che-do-quay-video-slow-motion-la-gi-luu-y-khi-quay-video-1013728\" target=\"_blank\">Quay chậm (Slow Motion)</a></p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/ar-stickers-la-gi-vi-sao-hang-nao-cung-ap-dung-ar-1096228\" target=\"_blank\">Nh&atilde;n d&aacute;n (AR Stickers)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>Live PhotosDeep Fusion</p>\r\n		</li>\r\n		<li>\r\n		<p>Chụp ảnh Raw</p>\r\n		</li>\r\n		<li>\r\n		<p><a href=\"https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873#hmenuid1\" target=\"_blank\">Chụp đ&ecirc;m</a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-chong-rung-ky-thuat-so-eis-tren-may-an-906417\" target=\"_blank\">Chống rung điện tử kỹ thuật số (EIS)</a></p>\r\n		</li>\r\n		<li>\r\n		<p>CinematicTrueDepthPhotonic Engine</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>C&ocirc;ng nghệ m&agrave;n h&igrave;nh:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-oled-la-gi-905762\" target=\"_blank\">OLED</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/do-phan-giai-man-hinh-la-gi-co-anh-huong-gi-toi-chat-luong-1335939#hmenuid1\" target=\"_blank\">Độ ph&acirc;n giải m&agrave;n h&igrave;nh:</a>&nbsp;Super Retina XDR (1320 x 2868 Pixels)</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>M&agrave;n h&igrave;nh rộng:&nbsp;</strong>6.9&quot; - Tần số qu&eacute;t&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tan-so-quet-man-hinh-may-tinh-la-gi-1292309#subhmenuid2\" target=\"_blank\">120 Hz</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/do-sang-nit-tren-man-hinh-laptop-la-gi-bao-nhieu-la-phu-hop-1337509#hmenuid1\" target=\"_blank\">Độ s&aacute;ng tối đa:</a>&nbsp;3000 nits</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Mặt k&iacute;nh cảm ứng:&nbsp;</strong>K&iacute;nh cường lực Ceramic Shield 2</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><a href=\"javascript:;\">Pin &amp; Sạc</a></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Dung lượng pin:&nbsp;</strong>37 giờ</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Loại pin:&nbsp;</strong><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-pin-li-ion-la-gi-985040\" target=\"_blank\">Li-Ion</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Hỗ trợ sạc tối đa:</strong>40 W</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>C&ocirc;ng nghệ pin:</strong><a href=\"https://www.thegioididong.com/hoi-dap/che-do-tiet-kiem-pin-va-sieu-tiet-kiem-pin-la-gi-926730\" target=\"_blank\">Tiết kiệm pin</a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-sac-nhanh-tren-smartphone-755549\" target=\"_blank\">Sạc pin nhanh</a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-sac-nguoc-doc-dao-nho-cap-otg-1399154\" target=\"_blank\">Sạc ngược qua c&aacute;p</a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-magsafe-magsafe-2-la-gi-co-tren-thiet-bi-nao-cua-1241888\" target=\"_blank\">Sạc kh&ocirc;ng d&acirc;y MagSafe</a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-sac-khong-day-la-gi-761328\" target=\"_blank\">Sạc kh&ocirc;ng d&acirc;y</a></p>\r\n	</li>\r\n</ul>', 37990000.00, 27, 3, 0, 1, '2025-10-29 13:20:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_gifts`
--

CREATE TABLE `product_gifts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `gift_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_gifts`
--

INSERT INTO `product_gifts` (`id`, `product_id`, `gift_description`, `created_at`) VALUES
(4, 8, 'Mua từ 2 sản phẩm giảm thêm 5%', '2025-10-29 11:19:57'),
(5, 9, 'Phiếu mua hàng AirPods, Apple Watch, Macbook trị giá 500,000đ', '2025-10-29 13:20:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `is_main`, `uploaded_at`) VALUES
(19, 8, '1761736796_kidcare-s88-glr-20-750x500.jpg', 0, '2025-10-29 11:19:56'),
(20, 8, '1761736796_kidcare-s88-glr-12-750x500.jpg', 0, '2025-10-29 11:19:56'),
(21, 8, '1761736796_kidcare-s88-glr-8-750x500.jpg', 0, '2025-10-29 11:19:56'),
(22, 8, '1761736796_kidcare-s88-glr-6-750x500.jpg', 0, '2025-10-29 11:19:56'),
(23, 8, '1761736796_kidcare-s88-glr-1-750x500.jpg', 0, '2025-10-29 11:19:56'),
(24, 8, '1761736796_kidcare-s88-den-thumb-600x600.jpg', 1, '2025-10-29 11:19:56'),
(25, 9, '1761744017_iphone-17-pro-max-cam-thumb-600x600.jpg', 1, '2025-10-29 13:20:17'),
(26, 9, '1761744017_iphone-17-pro-max-bbh-638947387866886959.jpg', 0, '2025-10-29 13:20:17'),
(27, 9, '1761744017_iphone-17-pro-max-tem-99-638947384407284478-750x500.jpg', 0, '2025-10-29 13:20:17'),
(28, 9, '1761744017_iphone-17-pro-max-cam-13-638947383223664403-750x500.jpg', 0, '2025-10-29 13:20:17'),
(29, 9, '1761744018_iphone-17-pro-max-cam-10-638947383249145014-750x500.jpg', 0, '2025-10-29 13:20:18'),
(30, 9, '1761744018_iphone-17-pro-max-cam-6-638947383176512375-750x500.jpg', 0, '2025-10-29 13:20:18'),
(31, 9, '1761744018_iphone-17-pro-max-cam-4-638947383197941667-750x500.jpg', 0, '2025-10-29 13:20:18'),
(32, 9, '1761744018_iphone-17-pro-max-cam-1-638947383255964450-750x500.jpg', 0, '2025-10-29 13:20:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `total_amount`, `status`, `created_at`) VALUES
(5, 1, 0.00, 'pending', '2025-10-29 11:41:45'),
(6, 2, 0.00, 'pending', '2025-10-31 05:54:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `phone`, `address`, `password`, `avatar`, `created_at`) VALUES
(1, 'minh1', 'Trần Công Minh', 'mincongtran1804@gmail.com', '0358168664', 'Mậu thân nối dài', '$2y$10$24Xe9vWj74SUYBSIP/fI7OG6qDwi9BKNE3AJWhorcq.qBatKWsZeK', '1761737979_anime-girl-fantasy-white-hair-dragon-wings-horn-hd-wallpaper-uhdpaper.com-496@5@e.jpg', '2025-10-28 13:08:55'),
(2, 'minh12', 'Minh Công Trần', 'mincongtran18@gmail.com', '0358168664', 'Ninh Kiều', '$2y$10$8ZukSkJT5nPKbbMm0jJDg.weQRyiw6SPqJCcf6.gdTbAaUG5XNxG.', '1761888439_pora.jpg', '2025-10-31 05:27:19');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_gifts`
--
ALTER TABLE `product_gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product` (`product_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_product` (`product_id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_gifts`
--
ALTER TABLE `product_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_gifts`
--
ALTER TABLE `product_gifts`
  ADD CONSTRAINT `product_gifts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `fk_product_reviews_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_product_reviews_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
