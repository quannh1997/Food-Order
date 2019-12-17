-- --------------------------------------------------------
-- Host:                         192.168.10.10
-- Server version:               5.7.28-0ubuntu0.18.04.4 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for food_order
CREATE DATABASE IF NOT EXISTS `food_order` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `food_order`;

-- Dumping structure for table food_order.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `admin_email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_admins_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.admins: ~1 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `email`, `created_at`, `updated_at`, `admin_email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `name`, `birth`) VALUES
	(1, 'admin@admin.com', '2019-11-23 20:50:52', '2019-11-23 16:38:37', '', '$2y$10$obm5uXF6xNDblUHQNRR2Eesx7FrWb3fY/zYwv2fXBA2/5DDfOsBjG', NULL, '2019-11-23 20:50:58', NULL, NULL, NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table food_order.ar_internal_metadata
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.ar_internal_metadata: ~0 rows (approximately)
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'development', '2019-11-23 12:46:32', '2019-11-23 12:46:32');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;

-- Dumping structure for table food_order.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table food_order.dailies
CREATE TABLE IF NOT EXISTS `dailies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `discount` float DEFAULT '0',
  `start_time_order` datetime DEFAULT NULL,
  `end_time_order` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.dailies: ~0 rows (approximately)
/*!40000 ALTER TABLE `dailies` DISABLE KEYS */;
/*!40000 ALTER TABLE `dailies` ENABLE KEYS */;

-- Dumping structure for table food_order.daily_foods
CREATE TABLE IF NOT EXISTS `daily_foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `review` text,
  `star` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.daily_foods: ~0 rows (approximately)
/*!40000 ALTER TABLE `daily_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_foods` ENABLE KEYS */;

-- Dumping structure for table food_order.foods
CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `default_price` int(11) DEFAULT '0',
  `restaurant_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `average_star` float DEFAULT '5',
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` longtext,
  `net_image` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.foods: ~3 rows (approximately)
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` (`id`, `name`, `kind`, `default_price`, `restaurant_id`, `status`, `average_star`, `description`, `created_at`, `updated_at`, `image`, `net_image`) VALUES
	(1, 'Hambuger', '1', 100, 1, 1, 5, 'Mon an danh cho nguoi an kieng', '2019-11-23 21:42:22', '2019-11-23 21:42:23', '', 'http://www.monngon.tv/uploads/images/2017/04/10/21d46b9923c6c2dcf07d14991307b97f-hamburger-ga-s.jpg'),
	(2, 'Ga nuong', '1', 200, 1, 1, 5, NULL, '2019-12-04 23:50:26', '2019-12-04 23:50:30', '', 'https://png.pngtree.com/png-clipart/20190603/original/pngtree-food-png-image_697147.jpg'),
	(3, 'FastFood', NULL, 300, 2, 1, 5, NULL, '2019-12-12 00:02:32', '2019-12-12 00:02:33', '', 'https://vignette.wikia.nocookie.net/gunny/images/6/6b/F78f78f78f78.jpg/revision/latest?cb=20130701044143&path-prefix=vi');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;

-- Dumping structure for table food_order.food_images
CREATE TABLE IF NOT EXISTS `food_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_link` varchar(255) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.food_images: ~0 rows (approximately)
/*!40000 ALTER TABLE `food_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_images` ENABLE KEYS */;

-- Dumping structure for table food_order.food_orders
CREATE TABLE IF NOT EXISTS `food_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `food_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `price` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table food_order.food_orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `food_orders` DISABLE KEYS */;
INSERT INTO `food_orders` (`id`, `user_id`, `food_id`, `order_id`, `price`, `count`) VALUES
	(11, 1, 1, 6, 100, 10),
	(12, 1, 2, 6, 200, 1);
/*!40000 ALTER TABLE `food_orders` ENABLE KEYS */;

-- Dumping structure for table food_order.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table food_order.orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `order`, `user_id`, `status`, `code`, `start`, `end`, `date`) VALUES
	(6, '0', 1, 1, '1576123117', '12:00', '18:30', '2019-12-12 03:58:37 UTC'),
	(7, '0', 1, 0, '1576124067', '09:30', '09:30', '2019-12-12 04:14:27 UTC');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table food_order.orders_restaurants
CREATE TABLE IF NOT EXISTS `orders_restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `restaurant_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table food_order.orders_restaurants: ~4 rows (approximately)
/*!40000 ALTER TABLE `orders_restaurants` DISABLE KEYS */;
INSERT INTO `orders_restaurants` (`id`, `order_id`, `restaurant_id`) VALUES
	(8, 6, 1),
	(9, 6, 2),
	(10, 7, 2),
	(11, 7, 1);
/*!40000 ALTER TABLE `orders_restaurants` ENABLE KEYS */;

-- Dumping structure for table food_order.order_foods
CREATE TABLE IF NOT EXISTS `order_foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_foods_on_food_id` (`food_id`),
  KEY `index_order_foods_on_order_id` (`order_id`),
  CONSTRAINT `fk_rails_696a88f753` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_rails_921bfb81f5` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table food_order.order_foods: ~2 rows (approximately)
/*!40000 ALTER TABLE `order_foods` DISABLE KEYS */;
INSERT INTO `order_foods` (`id`, `food_id`, `order_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 8, '2019-12-04 18:42:03', '2019-12-04 18:42:03'),
	(2, 1, 8, '2019-12-04 18:42:03', '2019-12-04 18:42:03');
/*!40000 ALTER TABLE `order_foods` ENABLE KEYS */;

-- Dumping structure for table food_order.restaurants
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `average_star` float DEFAULT '0',
  `selected_count` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.restaurants: ~2 rows (approximately)
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` (`id`, `name`, `average_star`, `selected_count`, `address`, `created_at`, `updated_at`, `image`) VALUES
	(1, 'Nha hang thu 1 ', 0, 0, NULL, '2019-11-23 21:48:28', '2019-11-23 21:48:28', 'kfc.jpg'),
	(2, 'Nha hang thu 2', 0, 0, 'Ha Noi', '2019-11-23 15:07:02', '2019-11-23 15:07:02', 'hoahong.jpg');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;

-- Dumping structure for table food_order.schema_migrations
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.schema_migrations: ~17 rows (approximately)
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20190722075702'),
	('20190722075854'),
	('20190722080016'),
	('20190722080130'),
	('20190727061827'),
	('20190802025607'),
	('20190805075725'),
	('20191106030526'),
	('20191106150111'),
	('20191113072601'),
	('20191113072615'),
	('20191115041803'),
	('20191120030329'),
	('20191122035228'),
	('20191126162930'),
	('20191204131944'),
	('20191204143049'),
	('20191204192018');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

-- Dumping structure for table food_order.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`, `name`, `birth`, `image`) VALUES
	(1, 'admin@admin.com', '$2y$10$obm5uXF6xNDblUHQNRR2Eesx7FrWb3fY/zYwv2fXBA2/5DDfOsBjG', NULL, NULL, NULL, '2019-11-23 20:28:28', '2019-11-23 20:28:29', 'Admin', '2019-11-23', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table food_order.user_favorite_foods
CREATE TABLE IF NOT EXISTS `user_favorite_foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table food_order.user_favorite_foods: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_favorite_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite_foods` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
