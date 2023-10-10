/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(150) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `data_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(150) DEFAULT NULL,
  `arr_sub_id` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `data_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(150) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(150) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Cơm gà', 'https://example.com/com-ga.jpg', 100000, 'Cơm gà là một món ăn phổ biến của Việt Nam, được làm từ cơm và thịt gà xé.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Bún chả', 'https://example.com/bun-cha.jpg', 120000, 'Bún chả là một món ăn khác của Việt Nam, được làm từ bún, thịt lợn nướng và chả viên.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Phở', 'https://example.com/pho.jpg', 150000, 'Phở là một món ăn nổi tiếng của Việt Nam, được làm từ bánh phở, nước dùng xương bò và thịt bò thái lát.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Gỏi cuốn', 'https://example.com/goi-cuon.jpg', 80000, 'Gỏi cuốn là một món ăn nhẹ của Việt Nam, được làm từ các loại rau tươi, thịt và tôm cuốn trong bánh tráng.', 2),
(5, 'Nem rán', 'https://example.com/nem-ran.jpg', 100000, 'Nem rán là một món ăn của Việt Nam, được làm từ thịt, mộc nhĩ và miến cuốn trong bánh tráng rồi rán vàng.', 2),
(6, 'Chè đỗ đen', 'https://example.com/che-do-den.jpg', 50000, 'Chè đỗ đen là một món tráng miệng của Việt Nam, được làm từ đỗ đen, đường và nước cốt dừa.', 3),
(7, 'Trà sữa', 'https://example.com/tra-sua.jpg', 40000, 'Trà sữa là một món đồ uống phổ biến của giới trẻ, được làm từ trà, sữa và trân châu.', 4),
(8, 'Cơm gà', 'https://example.com/com-ga.jpg', 100000, 'Cơm gà là một món ăn phổ biến của Việt Nam, được làm từ cơm và thịt gà xé.', 1),
(9, 'Bún chả', 'https://example.com/bun-cha.jpg', 120000, 'Bún chả là một món ăn khác của Việt Nam, được làm từ bún, thịt lợn nướng và chả viên.', 1),
(10, 'Phở', 'https://example.com/pho.jpg', 150000, 'Phở là một món ăn nổi tiếng của Việt Nam, được làm từ bánh phở, nước dùng xương bò và thịt bò thái lát.', 1),
(11, 'Gỏi cuốn', 'https://example.com/goi-cuon.jpg', 80000, 'Gỏi cuốn là một món ăn nhẹ của Việt Nam, được làm từ các loại rau tươi, thịt và tôm cuốn trong bánh tráng.', 2),
(12, 'Nem rán', 'https://example.com/nem-ran.jpg', 100000, 'Nem rán là một món ăn của Việt Nam, được làm từ thịt, mộc nhĩ và miến cuốn trong bánh tráng rồi rán vàng.', 2),
(13, 'Chè đỗ đen', 'https://example.com/che-do-den.jpg', 50000, 'Chè đỗ đen là một món tráng miệng của Việt Nam, được làm từ đỗ đen, đường và nước cốt dừa.', 3),
(14, 'Trà sữa', 'https://example.com/tra-sua.jpg', 40000, 'Trà sữa là một món đồ uống phổ biến của giới trẻ, được làm từ trà, sữa và trân châu.', 4);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món ăn chính');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món ăn phụ');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món tráng miệng');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Đồ uống');

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `data_like`) VALUES
(1, 1, 2, '2023-09-25 11:33:32');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `data_like`) VALUES
(2, 1, 3, '2023-07-18 17:23:00');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `data_like`) VALUES
(3, 3, 1, '2023-09-24 11:34:30');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `data_like`) VALUES
(4, 3, 2, '2023-07-16 17:29:30'),
(5, 3, 5, '2023-08-19 12:06:30'),
(6, 5, 3, '2023-08-13 16:34:30'),
(7, 5, 5, '2023-09-08 11:27:30'),
(8, 7, 2, '2023-09-02 11:34:00'),
(9, 8, 3, '2023-07-16 17:14:30'),
(10, 8, 1, '2023-08-01 16:33:30'),
(11, 9, 1, '2023-09-15 17:04:30'),
(12, 9, 2, '2023-07-24 11:34:30'),
(14, 3, 4, '2023-10-10 15:22:02');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 1, 'ABCD1234', '1,2,3');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 5, 2, 'ABGD1233', '2,3,6');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 2, 7, 2, 'EFGH5678', '4,5,6');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 3, 3, 2, 'IJKL9012', '7,8,9'),
(5, 3, 4, 1, 'IPKL2012', '6,8,9'),
(6, 3, 5, 1, 'MPKL2210', '4,6,9'),
(7, 4, 1, 1, 'ABVF2468', '2,4,6'),
(8, 5, 4, 1, 'EFJK4567', '2,4,8'),
(9, 7, 5, 2, 'ABXS2345', '1,3,5'),
(10, 8, 3, 2, 'EFDF5621', '1,7,9'),
(11, 9, 6, 3, 'IJQW9080', '2,5,9'),
(23, 3, 2, 2, 'KKKKKK', '2,3,4'),
(24, 3, 2, 2, 'KKKKKK', '2,3,4');

INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `data_rate`) VALUES
(1, 1, 2, 5, '2023-09-25 11:33:32');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `data_rate`) VALUES
(2, 1, 3, 4, '2023-07-18 17:23:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `data_rate`) VALUES
(3, 2, 2, 3, '2023-08-23 11:34:00');
INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `data_rate`) VALUES
(4, 3, 1, 3, '2023-09-24 11:34:30'),
(5, 3, 2, 5, '2023-07-16 17:29:30'),
(6, 3, 5, 2, '2023-08-19 12:06:30'),
(7, 4, 4, 3, '2023-07-04 12:34:36'),
(8, 5, 3, 5, '2023-08-13 16:34:30'),
(9, 5, 5, 4, '2023-09-08 11:27:30'),
(10, 7, 1, 5, '2023-07-02 11:33:32'),
(11, 7, 2, 4, '2023-09-02 11:34:00'),
(12, 7, 4, 3, '2023-07-03 16:19:42'),
(13, 8, 3, 3, '2023-07-16 17:14:30'),
(14, 8, 1, 4, '2023-08-01 16:33:30'),
(15, 9, 1, 4, '2023-09-15 17:04:30'),
(16, 9, 2, 5, '2023-07-24 11:34:30'),
(17, 9, 4, 3, '2023-08-07 12:02:30');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Nhà hàng A', 'https://example.com/nha-hang-a.jpg', 'Nhà hàng A là một nhà hàng nổi tiếng với các món ăn Việt Nam truyền thống.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Nhà hàng B', 'https://example.com/nha-hang-b.jpg', 'Nhà hàng B là một nhà hàng chuyên về các món ăn hải sản tươi ngon.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Nhà hàng C', 'https://example.com/nha-hang-c.jpg', 'Nhà hàng C là một nhà hàng chuyên về các món ăn Âu Á tinh tế.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Nhà hàng D', 'https://example.com/nha-hang-d.jpg', 'Nhà hàng D là một nhà hàng chuyên về các món ăn Pháp, không gian lãng mạn.'),
(5, 'Nhà hàng E', 'https://example.com/nha-hang-e.jpg', 'Nhà hàng D là một nhà hàng nổi tiếng với các món ăn Nhật Bản.'),
(6, 'Nhà hàng A', 'https://example.com/nha-hang-a.jpg', 'Nhà hàng A là một nhà hàng nổi tiếng với các món ăn Việt Nam truyền thống.'),
(7, 'Nhà hàng B', 'https://example.com/nha-hang-b.jpg', 'Nhà hàng B là một nhà hàng chuyên về các món ăn hải sản tươi ngon.'),
(8, 'Nhà hàng C', 'https://example.com/nha-hang-c.jpg', 'Nhà hàng C là một nhà hàng chuyên về các món ăn Âu Á tinh tế.'),
(9, 'Nhà hàng D', 'https://example.com/nha-hang-d.jpg', 'Nhà hàng D là một nhà hàng chuyên về các món ăn Pháp, không gian lãng mạn.'),
(10, 'Nhà hàng E', 'https://example.com/nha-hang-e.jpg', 'Nhà hàng D là một nhà hàng nổi tiếng với các món ăn Nhật Bản.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Cơm gà xé', 100000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Cơm gà sườn', 120000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Bún chả Hà Nội', 120000, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Bún chả Nem Lai Vung', 150000, 2),
(5, 'Phở bò tái', 150000, 3),
(6, 'Phở bò gầu', 170000, 3),
(7, 'Gỏi cuốn tôm thịt', 80000, 4),
(8, 'Gỏi cuốn thịt bò', 100000, 4),
(9, 'Nem rán thịt heo', 100000, 5),
(10, 'Nem rán thịt bò', 120000, 5),
(11, 'Chè đỗ đen đá', 50000, 6),
(12, 'Chè đỗ đen nóng', 40000, 6),
(13, 'Trà sữa trân châu đen', 40000, 7),
(14, 'Trà sữa trân châu trắng', 40000, 7),
(15, 'Cơm gà xé', 100000, 1),
(16, 'Cơm gà sườn', 120000, 1),
(17, 'Bún chả Hà Nội', 120000, 2),
(18, 'Bún chả Nem Lai Vung', 150000, 2),
(19, 'Phở bò tái', 150000, 3),
(20, 'Phở bò gầu', 170000, 3),
(21, 'Gỏi cuốn tôm thịt', 80000, 4),
(22, 'Gỏi cuốn thịt bò', 100000, 4),
(23, 'Nem rán thịt heo', 100000, 5),
(24, 'Nem rán thịt bò', 120000, 5),
(25, 'Chè đỗ đen đá', 50000, 6),
(26, 'Chè đỗ đen nóng', 40000, 6),
(27, 'Trà sữa trân châu đen', 40000, 7),
(28, 'Trà sữa trân châu trắng', 40000, 7);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@gmail.com', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Trần Thị B', 'tranthibu@gmail.com', 'abcdef');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Lê Quang C', 'lequangc@gmail.com', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Hồ Thị D', 'hothid@gmail.com', 'abcdef'),
(5, 'Đỗ Duy E', 'doduye@gmail.com', '123456'),
(6, 'Phan Thị F', 'phanthf@gmail.com', 'abcdef'),
(7, 'Nguyễn Đức G', 'nguyenducg@gmail.com', '123456'),
(8, 'Trịnh Thị H', 'trinhtihh@gmail.com', 'abcdef'),
(9, 'Lương Văn I', 'luongvanii@gmail.com', '123456');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;