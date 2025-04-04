-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for my_store
CREATE DATABASE IF NOT EXISTS `my_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `my_store`;

-- Dumping structure for table my_store.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.account: ~2 rows (approximately)
INSERT INTO `account` (`id`, `username`, `fullname`, `password`, `role`) VALUES
	(2, 'test1', 'haha', '$2y$10$K/6xcVRPIUwAy3GodHiLWOuoy9m///QvnSLd0E93vv4AhPAQd2iHC', 'admin'),
	(3, 'test', 'hihi', '$2y$10$5afa0AkeA/7sQgq9grCRO.E5sG2G2HDzX/ADilZ4AgRV5JqdRbuRS', 'user');

-- Dumping structure for table my_store.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.category: ~3 rows (approximately)
INSERT INTO `category` (`id`, `name`, `description`) VALUES
	(1, 'Ô tô', '4 bánh'),
	(2, 'Xe máy', '2 bánh'),
	(3, 'Mô tô', '2 bánh\r\n');

-- Dumping structure for table my_store.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.orders: ~1 rows (approximately)
INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `created_at`) VALUES
	(3, 'ủu88568', '6745745', '74574567', '2025-03-21 08:31:05');

-- Dumping structure for table my_store.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.order_details: ~6 rows (approximately)
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
	(8, 3, 20, 1, 85.00),
	(9, 3, 18, 2, 65.00),
	(10, 3, 14, 1, 92.00),
	(11, 3, 16, 1, 290.00),
	(12, 3, 22, 1, 600.00),
	(13, 3, 17, 1, 18.50);

-- Dumping structure for table my_store.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.product: ~12 rows (approximately)
INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `category_id`) VALUES
	(14, 'Honda SH 150i 2025', 'Xe tay ga cao cấp với thiết kế sang trọng, động cơ 150cc mạnh mẽ, hệ thống phanh ABS an toàn. Phù hợp cho việc di chuyển trong thành phố và những chuyến đi dài.', 92.00, 'uploads/sh350.jpg', 2),
	(15, 'Yamaha Exciter 155', 'Xe côn tay thể thao, động cơ 155cc mạnh mẽ, phù hợp cho những người yêu thích tốc độ và sự linh hoạt trong thành phố.', 55.00, 'uploads/ègeqwrgqerhqewh.jpg', 2),
	(16, 'Suzuki Address 110', 'Xe tay ga nhỏ gọn, tiết kiệm xăng, phù hợp cho việc di chuyển hàng ngày trong các khu đô thị. Động cơ 110cc, dễ lái và bảo trì.', 290.00, 'uploads/tải xuống.png', 2),
	(17, 'Honda Wave Alpha', ' Xe số phổ thông, tiết kiệm nhiên liệu, dễ vận hành và bảo trì. Phù hợp với sinh viên và người lao động có nhu cầu di chuyển hàng ngày.', 18.50, 'uploads/13123.png', 2),
	(18, 'Piaggio Liberty 125', 'Xe tay ga phong cách Ý, thiết kế thanh lịch, động cơ 125cc mạnh mẽ, phù hợp cho các tín đồ yêu thích sự sang trọng và chất lượng.', 65.00, 'uploads/ghewkgjewrgk.png', 2),
	(19, 'Kawasaki Ninja 400', 'Xe côn tay thể thao, động cơ 400cc cho hiệu suất mạnh mẽ. Phù hợp cho những người yêu thích cảm giác lái mạnh mẽ và tốc độ cao.', 135.00, 'uploads/tải xuống (5).jpg', 3),
	(20, 'Vespa Primavera 150', 'Xe tay ga cao cấp, thiết kế retro phong cách Ý, động cơ 150cc. Mang lại sự sang trọng và tiện nghi trong mỗi chuyến đi.', 85.00, 'uploads/Vespa Primavera 150.png', 2),
	(21, 'Honda CBR 500R', 'Xe mô tô thể thao, động cơ 500cc với thiết kế mạnh mẽ và khả năng vận hành ổn định, phù hợp cho những người yêu thích xe thể thao và tốc độ.', 160.00, 'uploads/Honda CBR 500R.png', 3),
	(22, 'Toyota Vios 2025', 'Sedan hạng B, thiết kế thanh lịch, động cơ 1.5L tiết kiệm nhiên liệu, trang bị đầy đủ các tính năng an toàn. Phù hợp cho gia đình và di chuyển trong đô thị.', 600.00, 'uploads/Toyota Vios 2025.png', 1),
	(23, 'Honda CR-V 2025', 'SUV cỡ trung, động cơ 1.5L tăng áp mạnh mẽ, không gian rộng rãi, phù hợp cho gia đình và những chuyến đi dài.', 1.06, 'uploads/tải xuống (5).jpg', 1),
	(24, 'Mazda CX-5 2025', 'SUV hạng C, thiết kế hiện đại, động cơ 2.5L mạnh mẽ, hệ thống an toàn cao cấp. Phù hợp cho những ai yêu thích sự thể thao và sang trọng.', 850.00, 'uploads/Mazda CX-5 2025.png', 1),
	(25, 'Ford Ranger 2025', 'Xe bán tải, động cơ 2.0L turbo, khả năng vận hành mạnh mẽ, phù hợp cho công việc và các chuyến đi off-road. Bền bỉ và tiết kiệm nhiên liệu.', 1.02, 'uploads/Ford Ranger 2025.png', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
