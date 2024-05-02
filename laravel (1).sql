-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2024 at 06:34 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(50, 1, 32, 31, '2024-01-22 12:47:31', '2024-01-22 13:19:08'),
(51, 1, 33, 13, '2024-01-22 12:47:32', '2024-01-23 12:18:28'),
(52, 1, 34, 2, '2024-01-22 12:47:33', '2024-01-22 13:16:11'),
(53, 1, 35, 2, '2024-01-22 12:47:35', '2024-01-22 13:16:14'),
(54, 1, 42, 3, '2024-01-22 12:57:50', '2024-01-23 12:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`, `parent_id`, `deleted_at`) VALUES
(12, '2023-10-29 11:01:13', '2023-10-29 12:00:35', 'Koneko', '0', '2023-10-29 12:00:35'),
(13, '2023-10-29 11:40:19', '2023-10-29 12:11:33', 'huy156456', '12', '2023-10-29 12:11:33'),
(14, '2023-10-29 12:11:39', '2023-12-07 10:14:53', 'Earpod', '0', NULL),
(15, '2023-10-29 12:11:47', '2023-10-31 13:26:29', 'huy22', '14', '2023-10-31 13:26:29'),
(16, '2023-10-31 13:26:15', '2023-11-24 12:53:50', 'DM2', '14', '2023-11-24 12:53:50'),
(17, '2023-10-31 13:26:23', '2023-11-20 12:44:21', 'DM1', '16', '2023-11-20 12:44:21'),
(18, '2023-11-24 12:46:21', '2023-11-24 12:53:48', 'asasas', '16', '2023-11-24 12:53:48'),
(19, '2023-11-24 13:20:13', '2023-11-29 03:57:06', 'huy', '14', '2023-11-29 03:57:06'),
(20, '2023-12-06 05:46:18', '2023-12-07 10:18:31', 'DM 3.1', '14', '2023-12-07 10:18:31'),
(21, '2023-12-06 05:46:28', '2023-12-06 05:46:51', 'DM3.1.1', '20', '2023-12-06 05:46:51'),
(22, '2023-12-07 10:18:43', '2023-12-07 10:18:43', 'True Wireless', '0', NULL),
(23, '2023-12-07 10:21:07', '2023-12-07 10:21:07', 'Loa', '0', NULL),
(24, '2023-12-07 10:21:19', '2023-12-07 10:21:19', 'Tai nghe có dây', '0', NULL),
(25, '2023-12-07 10:21:32', '2023-12-27 17:34:18', 'Headphones', '0', '2023-12-27 17:34:18'),
(26, '2023-12-14 22:53:34', '2023-12-14 22:53:42', 'DM888', '0', '2023-12-14 22:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `export`
--

CREATE TABLE `export` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `export_date` datetime DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `export_products`
--

CREATE TABLE `export_products` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `export_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_path` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_sales`
--

INSERT INTO `flash_sales` (`id`, `title`, `active`, `start_at`, `end_at`, `created_at`, `updated_at`, `banner`, `banner_path`) VALUES
(45, 'Test', 1, '2024-09-01 18:13:00', '2025-04-09 18:13:00', '2024-02-12 11:13:43', '2024-04-18 12:45:27', 'En_nGkuVgAI1JrE.jpg', '/storage/flashsale_banner/1/aNIcA1SomDKn8DKcqgYz.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `import`
--

CREATE TABLE `import` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `import_date` datetime NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import`
--

INSERT INTO `import` (`id`, `created_at`, `updated_at`, `supplier_id`, `import_date`, `warehouse_id`) VALUES
(1, NULL, NULL, 1, '2024-04-17 18:32:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `import_products`
--

CREATE TABLE `import_products` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `import_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_products`
--

INSERT INTO `import_products` (`id`, `created_at`, `updated_at`, `quantity`, `price`, `product_id`, `import_id`) VALUES
(1, NULL, NULL, 2, '1.00', 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_23_192010_create_categories_table', 1),
(6, '2023_10_25_215919_add_column', 2),
(7, '2023_10_25_220433_drop_column', 3),
(8, '2023_10_25_220609_drop_column', 4),
(9, '2023_10_26_190123_drop_table', 5),
(10, '2023_10_29_185341_delete_model', 6),
(11, '2023_10_31_183001_create_menus_table', 7),
(12, '2023_10_31_194011_add_slig', 8),
(13, '2023_10_31_201636_soft_delete_menus', 9),
(14, '2023_11_01_202804_create_products_table', 10),
(15, '2023_11_01_203039_create_product_images_table', 10),
(16, '2023_11_01_203204_create_tags_table', 10),
(17, '2023_11_01_203244_create_product_tags_table', 10),
(18, '2023_11_03_105418_add_column_feature_image_name', 11),
(19, '2023_11_03_181457_add_feature_name', 12),
(20, '2023_11_03_190256_add_column_image_name_to_table_product_image', 13),
(21, '2023_11_06_194901_add_soft_delete_to_product', 14),
(22, '2023_11_06_194915_add_soft_delete_to_product', 14),
(23, '2023_11_09_191600_create_sliders_table', 15),
(24, '2023_11_09_202951_soft_delte_slider', 16),
(25, '2023_11_10_191923_create_settings_table', 17),
(26, '2023_11_11_201106_add_comlumn_type_settings_table', 18),
(27, '2023_11_11_201744_add_comlumn_type_settings_table', 19),
(28, '2014_10_12_100000_create_password_resets_table', 20),
(29, '2023_11_12_204506_create_roles_table', 21),
(30, '2023_11_12_204526_create_permissions_table', 21),
(31, '2023_11_12_204646_create_table_user_role', 21),
(32, '2023_11_12_204726_create_table_permission_rol', 21),
(33, '2023_11_13_163802_add_soft_dele_settings', 22),
(34, '2023_11_13_183955_soft_del_user', 23),
(35, '2023_11_13_192922_add_column_parent_id_permission', 24),
(36, '2023_11_14_170713_add_column_key_code_permission_table', 25),
(37, '2023_11_24_191847_add_active', 26),
(38, '2023_11_24_201852_hello', 27),
(39, '2023_11_26_191508_add_view_count', 28),
(40, '2023_11_29_111234_create_carts_table', 29),
(41, '2023_11_29_160650_add_slug_to_products_table', 30),
(42, '2023_11_30_102319_add_constraint_product_tags', 31),
(43, '2023_11_30_102437_add_constraint_product_tags', 32),
(44, '2023_11_30_103922_add_constraint_product_tags', 33),
(45, '2023_11_30_103942_add_constraint_product_tags', 33),
(46, '2023_11_30_104017_add_constraint_product_tags', 33),
(47, '2023_11_30_104225_add_constraint_product_tags', 34),
(48, '2023_11_30_104653_add_constraint_image', 35),
(49, '2023_11_30_105243_add_constraint_image', 35),
(50, '2023_11_30_105355_add_constraint_role_user', 36),
(51, '2023_11_30_105757_add_constraint_image', 37),
(52, '2023_12_01_190427_add_constraint', 38),
(53, '2023_12_06_130406_create_orders_table', 39),
(54, '2023_12_06_131347_create_order_items_table', 40),
(55, '2023_12_06_182055_add_address_column', 41),
(56, '2023_12_06_183734_add_more_column', 42),
(57, '2023_12_06_185505_add_phone', 43),
(58, '2023_12_06_192418_add_name', 44),
(59, '2023_12_06_192510_add_address', 45),
(60, '2024_01_20_124019_add_comment_of_user', 46),
(61, '2024_01_25_073827_create_flash_sales_table', 47),
(62, '2024_01_25_073839_create_flash_sales_table', 48),
(63, '2024_01_26_185420_add_product_sale_table', 49),
(64, '2024_01_26_185759_add_discount_price', 50),
(65, '2024_01_26_190033_add_quantity', 50),
(66, '2024_03_18_184031_create_warehouse_table', 51),
(67, '2024_03_18_184726_create_supplier_table', 52),
(68, '2024_03_18_184923_create_import_table', 53),
(69, '2024_03_18_185355_create_stores_table', 54),
(70, '2024_03_18_190302_create_store_products_table', 54),
(71, '2024_03_18_190345_create_warehouse_products_table', 55),
(72, '2024_04_06_190216_add_name_and_note_for_warehouse', 56),
(73, '2024_04_15_190342_create_receiver_table', 57),
(74, '2024_04_15_190653_add_receiver_id', 58),
(75, '2024_04_15_190904_create', 59),
(76, '2024_04_15_190956_ref', 60),
(77, '2024_04_16_190453_drop_the_constraint_foreign_key', 61),
(78, '2024_04_16_190712_drop_the_foreign_key_import', 62),
(79, '2024_04_16_191110_just_import', 63),
(80, '2024_04_16_192005_create_export_products_table', 64),
(81, '2024_04_16_192330_add_export_id', 65),
(82, '2024_04_16_192449_add_import_id', 66),
(83, '2024_04_17_183542_add_warehouse_id_foreign', 67),
(84, '2024_04_17_185226_add_warehouse_id_foregin', 68),
(85, '2024_04_18_190300_add_warehouse_id', 69),
(86, '2024_04_18_200541_create_transactions', 70);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_price` double(16,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `payment_method`, `created_at`, `updated_at`, `shipping_address`, `phone_number`, `first_name`, `last_name`, `address`) VALUES
(3, 1, 2188086864126.00, 1, 'cash', '2023-12-06 12:28:42', '2023-12-06 12:28:42', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Cao Bằng/Huyện Hà Quảng/Xã Sóc Hà/viet nam'),
(4, 10, 6672988063397.00, 1, 'cash', '2023-12-06 13:00:07', '2023-12-06 13:00:07', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Bắc Giang/Huyện Yên Thế/Xã An Thượng/viet nam'),
(5, 11, 118772464.00, 1, 'cash', '2023-12-14 07:06:31', '2023-12-14 07:06:31', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Cao Bằng/Huyện Hà Quảng/Xã Sóc Hà/viet nam'),
(6, 12, 120000.00, 1, 'cash', '2023-12-14 23:09:12', '2023-12-14 23:09:12', NULL, '0386239871', 'bj', 'huy', 'Tỉnh Hà Giang/Thành phố Hà Giang/Phường Ngọc Hà/viet nam'),
(7, 1, 1080000.00, 2, 'cash', '2024-01-20 05:42:24', '2024-01-20 05:42:24', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Bắc Ninh/Thành phố Bắc Ninh/Phường Nam Sơn/viet nam'),
(8, 1, 1540000.00, 2, 'cash', '2024-01-21 10:01:28', '2024-01-21 10:01:28', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Cao Bằng/Huyện Trùng Khánh/Xã Phong Châu/viet nam'),
(9, 1, 4530000.00, 2, 'cash', '2024-01-21 21:26:28', '2024-01-21 21:26:28', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Vĩnh Phúc/Thành phố Phúc Yên/Phường Nam Viêm/viet nam'),
(11, 1, 120000.00, 2, 'cash', '2024-01-22 10:09:14', '2024-01-22 10:09:14', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Phú Thọ/Huyện Tân Sơn/Xã Long Cốc/viet nam'),
(12, 1, 16490000.00, 1, 'cash', '2024-01-22 11:35:21', '2024-01-22 11:35:21', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Vĩnh Phúc/Thành phố Phúc Yên/Phường Hùng Vương/viet nam'),
(13, 1, 0.00, 1, 'cash', '2024-01-22 12:27:32', '2024-01-22 12:27:32', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Vĩnh Phúc/Thành phố Vĩnh Yên/Phường Tích Sơn/viet nam'),
(14, 1, 0.00, 1, 'cash', '2024-01-22 12:30:52', '2024-01-22 12:30:52', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Bắc Ninh/Huyện Yên Phong/Xã Văn Môn/viet nam'),
(15, 1, 0.00, 1, 'cash', '2024-01-22 12:31:52', '2024-01-22 12:31:52', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Bắc Ninh/Thị xã Quế Võ/Xã Đào Viên/viet nam'),
(16, 1, 1540000.00, 1, 'cash', '2024-01-22 12:40:46', '2024-01-22 12:40:46', NULL, '0386239871', 'trần', 'huy', 'Tỉnh Hải Dương/Thành phố Chí Linh/Phường Đồng Lạc/viet nam');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` double(16,2) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `comment_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `comment`, `created_at`, `updated_at`, `rate`, `comment_time`) VALUES
(13, 5, 18, 4, 2290000.00, 'fgg', '2023-12-14 07:06:31', '2023-12-14 07:06:31', 0, NULL),
(14, 6, 17, 1, 120000.00, NULL, '2023-12-14 23:09:12', '2023-12-14 23:09:12', 0, NULL),
(15, 7, 17, 9, 120000.00, 'Very good', '2024-01-20 05:42:24', '2024-01-22 04:00:54', 1, NULL),
(16, 8, 45, 1, 1540000.00, 'Good', '2024-01-21 10:01:28', '2024-01-21 21:49:52', 1, '2024-01-10'),
(17, 9, 45, 1, 1540000.00, 'gooopoaosjk', '2024-01-21 21:26:28', '2024-01-22 04:10:42', 5, NULL),
(18, 9, 44, 1, 2990000.00, NULL, '2024-01-21 21:26:28', '2024-01-21 21:26:28', 0, NULL),
(19, 11, 17, 1, 120000.00, 'Hello', '2024-01-22 10:09:14', '2024-01-22 10:10:15', 2, '2024-01-22'),
(20, 12, 44, 5, 2990000.00, NULL, '2024-01-22 11:35:21', '2024-01-22 11:35:21', NULL, NULL),
(21, 12, 45, 1, 1540000.00, NULL, '2024-01-22 11:35:21', '2024-01-22 11:35:21', NULL, NULL),
(22, 16, 45, 1, 1540000.00, NULL, '2024-01-22 12:40:46', '2024-01-22 12:40:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `key_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `parent_id`, `key_code`) VALUES
(66, 'category', 'category', '2023-11-16 12:22:59', '2023-11-16 12:22:59', 0, NULL),
(67, 'list', 'list', '2023-11-16 12:22:59', '2023-11-16 12:22:59', 66, 'list_category'),
(68, 'add', 'add', '2023-11-16 12:22:59', '2023-11-16 12:22:59', 66, 'add_category'),
(69, 'edit', 'edit', '2023-11-16 12:22:59', '2023-11-16 12:22:59', 66, 'edit_category'),
(70, 'delete', 'delete', '2023-11-16 12:22:59', '2023-11-16 12:22:59', 66, 'delete_category'),
(71, 'menu', 'menu', '2023-11-16 12:23:04', '2023-11-16 12:23:04', 0, NULL),
(72, 'list', 'list', '2023-11-16 12:23:04', '2023-11-16 12:23:04', 71, 'list_menu'),
(73, 'add', 'add', '2023-11-16 12:23:04', '2023-11-16 12:23:04', 71, 'add_menu'),
(74, 'edit', 'edit', '2023-11-16 12:23:04', '2023-11-16 12:23:04', 71, 'edit_menu'),
(75, 'delete', 'delete', '2023-11-16 12:23:04', '2023-11-16 12:23:04', 71, 'delete_menu'),
(76, 'slider', 'slider', '2023-11-16 12:23:08', '2023-11-16 12:23:08', 0, NULL),
(77, 'list', 'list', '2023-11-16 12:23:08', '2023-11-16 12:23:08', 76, 'list_slider'),
(78, 'add', 'add', '2023-11-16 12:23:08', '2023-11-16 12:23:08', 76, 'add_slider'),
(79, 'edit', 'edit', '2023-11-16 12:23:08', '2023-11-16 12:23:08', 76, 'edit_slider'),
(80, 'delete', 'delete', '2023-11-16 12:23:08', '2023-11-16 12:23:08', 76, 'delete_slider'),
(81, 'product', 'product', '2023-11-16 12:23:12', '2023-11-16 12:23:12', 0, NULL),
(82, 'list', 'list', '2023-11-16 12:23:12', '2023-11-16 12:23:12', 81, 'list_product'),
(83, 'add', 'add', '2023-11-16 12:23:12', '2023-11-16 12:23:12', 81, 'add_product'),
(84, 'edit', 'edit', '2023-11-16 12:23:12', '2023-11-16 12:23:12', 81, 'edit_product'),
(85, 'delete', 'delete', '2023-11-16 12:23:12', '2023-11-16 12:23:12', 81, 'delete_product'),
(86, 'setting', 'setting', '2023-11-16 12:23:15', '2023-11-16 12:23:15', 0, NULL),
(87, 'list', 'list', '2023-11-16 12:23:15', '2023-11-16 12:23:15', 86, 'list_setting'),
(88, 'add', 'add', '2023-11-16 12:23:15', '2023-11-16 12:23:15', 86, 'add_setting'),
(89, 'edit', 'edit', '2023-11-16 12:23:15', '2023-11-16 12:23:15', 86, 'edit_setting'),
(90, 'delete', 'delete', '2023-11-16 12:23:15', '2023-11-16 12:23:15', 86, 'delete_setting'),
(91, 'role', 'role', '2023-11-16 12:23:19', '2023-11-16 12:23:19', 0, NULL),
(92, 'list', 'list', '2023-11-16 12:23:19', '2023-11-16 12:23:19', 91, 'list_role'),
(93, 'add', 'add', '2023-11-16 12:23:19', '2023-11-16 12:23:19', 91, 'add_role'),
(94, 'edit', 'edit', '2023-11-16 12:23:19', '2023-11-16 12:23:19', 91, 'edit_role'),
(95, 'delete', 'delete', '2023-11-16 12:23:19', '2023-11-16 12:23:19', 91, 'delete_role'),
(96, 'user', 'user', '2023-11-16 12:40:13', '2023-11-16 12:40:13', 0, NULL),
(97, 'list', 'list', '2023-11-16 12:40:13', '2023-11-16 12:40:13', 96, 'list_user'),
(98, 'add', 'add', '2023-11-16 12:40:13', '2023-11-16 12:40:13', 96, 'add_user'),
(99, 'edit', 'edit', '2023-11-16 12:40:13', '2023-11-16 12:40:13', 96, 'edit_user'),
(100, 'delete', 'delete', '2023-11-16 12:40:13', '2023-11-16 12:40:13', 96, 'delete_user'),
(101, 'category', 'category', '2024-01-25 01:08:33', '2024-01-25 01:08:33', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(25, 1, 92, NULL, NULL),
(39, 1, 72, NULL, NULL),
(40, 1, 73, NULL, NULL),
(41, 1, 74, NULL, NULL),
(42, 1, 75, NULL, NULL),
(43, 1, 77, NULL, NULL),
(44, 1, 78, NULL, NULL),
(45, 1, 79, NULL, NULL),
(46, 1, 80, NULL, NULL),
(47, 1, 82, NULL, NULL),
(48, 1, 83, NULL, NULL),
(49, 1, 84, NULL, NULL),
(50, 1, 85, NULL, NULL),
(51, 1, 87, NULL, NULL),
(52, 1, 88, NULL, NULL),
(53, 1, 89, NULL, NULL),
(54, 1, 90, NULL, NULL),
(55, 1, 93, NULL, NULL),
(56, 1, 94, NULL, NULL),
(57, 1, 95, NULL, NULL),
(58, 1, 97, NULL, NULL),
(59, 1, 98, NULL, NULL),
(60, 1, 99, NULL, NULL),
(61, 1, 100, NULL, NULL),
(65, 1, 70, NULL, NULL),
(66, 1, 67, NULL, NULL),
(69, 2, 67, NULL, NULL),
(70, 2, 72, NULL, NULL),
(71, 2, 77, NULL, NULL),
(72, 2, 82, NULL, NULL),
(73, 2, 87, NULL, NULL),
(74, 2, 92, NULL, NULL),
(75, 2, 97, NULL, NULL),
(76, 1, 68, NULL, NULL),
(77, 1, 69, NULL, NULL),
(78, 2, 68, NULL, NULL),
(79, 2, 69, NULL, NULL),
(80, 2, 70, NULL, NULL),
(81, 2, 73, NULL, NULL),
(82, 2, 74, NULL, NULL),
(83, 2, 75, NULL, NULL),
(84, 2, 78, NULL, NULL),
(85, 2, 79, NULL, NULL),
(86, 2, 80, NULL, NULL),
(87, 2, 83, NULL, NULL),
(88, 2, 84, NULL, NULL),
(89, 2, 85, NULL, NULL),
(90, 2, 88, NULL, NULL),
(91, 2, 89, NULL, NULL),
(92, 2, 90, NULL, NULL),
(93, 2, 93, NULL, NULL),
(94, 2, 94, NULL, NULL),
(95, 2, 95, NULL, NULL),
(96, 2, 98, NULL, NULL),
(97, 2, 99, NULL, NULL),
(98, 2, 100, NULL, NULL),
(99, 3, 67, NULL, NULL),
(100, 3, 68, NULL, NULL),
(101, 3, 69, NULL, NULL),
(102, 3, 70, NULL, NULL),
(103, 3, 72, NULL, NULL),
(104, 3, 73, NULL, NULL),
(105, 3, 74, NULL, NULL),
(106, 3, 75, NULL, NULL),
(107, 3, 77, NULL, NULL),
(108, 3, 78, NULL, NULL),
(109, 3, 79, NULL, NULL),
(110, 3, 80, NULL, NULL),
(111, 3, 82, NULL, NULL),
(112, 3, 83, NULL, NULL),
(113, 3, 84, NULL, NULL),
(114, 3, 85, NULL, NULL),
(115, 3, 87, NULL, NULL),
(116, 3, 88, NULL, NULL),
(117, 3, 89, NULL, NULL),
(118, 3, 90, NULL, NULL),
(119, 3, 92, NULL, NULL),
(120, 3, 93, NULL, NULL),
(121, 3, 94, NULL, NULL),
(122, 3, 95, NULL, NULL),
(123, 3, 97, NULL, NULL),
(124, 3, 98, NULL, NULL),
(125, 3, 99, NULL, NULL),
(126, 3, 100, NULL, NULL),
(127, 4, 67, NULL, NULL),
(128, 4, 68, NULL, NULL),
(129, 4, 69, NULL, NULL),
(130, 4, 70, NULL, NULL),
(131, 4, 72, NULL, NULL),
(132, 4, 73, NULL, NULL),
(133, 4, 74, NULL, NULL),
(134, 4, 75, NULL, NULL),
(135, 4, 77, NULL, NULL),
(136, 4, 78, NULL, NULL),
(137, 4, 79, NULL, NULL),
(138, 4, 80, NULL, NULL),
(139, 4, 82, NULL, NULL),
(140, 4, 83, NULL, NULL),
(141, 4, 84, NULL, NULL),
(142, 4, 85, NULL, NULL),
(143, 4, 87, NULL, NULL),
(144, 4, 88, NULL, NULL),
(145, 4, 89, NULL, NULL),
(146, 4, 90, NULL, NULL),
(147, 4, 92, NULL, NULL),
(148, 4, 93, NULL, NULL),
(149, 4, 94, NULL, NULL),
(150, 4, 95, NULL, NULL),
(151, 4, 97, NULL, NULL),
(152, 4, 98, NULL, NULL),
(153, 4, 99, NULL, NULL),
(154, 4, 100, NULL, NULL),
(155, 5, 67, NULL, NULL),
(156, 5, 68, NULL, NULL),
(157, 5, 69, NULL, NULL),
(158, 5, 70, NULL, NULL),
(159, 5, 72, NULL, NULL),
(160, 5, 73, NULL, NULL),
(161, 5, 74, NULL, NULL),
(162, 5, 75, NULL, NULL),
(163, 5, 77, NULL, NULL),
(164, 5, 78, NULL, NULL),
(165, 5, 79, NULL, NULL),
(166, 5, 80, NULL, NULL),
(167, 5, 82, NULL, NULL),
(168, 5, 83, NULL, NULL),
(169, 5, 84, NULL, NULL),
(170, 5, 85, NULL, NULL),
(171, 5, 87, NULL, NULL),
(172, 5, 88, NULL, NULL),
(173, 5, 89, NULL, NULL),
(174, 5, 90, NULL, NULL),
(175, 5, 92, NULL, NULL),
(176, 5, 93, NULL, NULL),
(177, 5, 94, NULL, NULL),
(178, 5, 95, NULL, NULL),
(179, 5, 97, NULL, NULL),
(180, 5, 98, NULL, NULL),
(181, 5, 99, NULL, NULL),
(182, 5, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'device_name', '27d6b647dcb19a824f8e7477e1306a34f14d7327dfdc4e23e1d0702ca3ea74b9', '[\"*\"]', NULL, NULL, '2024-02-20 00:17:28', '2024-02-20 00:17:28'),
(2, 'App\\Models\\User', 1, 'device_name', '1ddf15f5ae39e77931970b0a2a1cb68eb1c90bf69e818cd690ac181f97913ff0', '[\"*\"]', NULL, NULL, '2024-02-20 00:17:32', '2024-02-20 00:17:32'),
(3, 'App\\Models\\User', 1, 'device_name', '77d251c2b9021aca64b6b48c3b5f92db711c96ab8636f246c59c034d0abbbe7a', '[\"*\"]', NULL, NULL, '2024-02-20 00:17:33', '2024-02-20 00:17:33'),
(4, 'App\\Models\\User', 1, 'device_name', 'acd8ab16fb01de2ee8bafd68e6d115bf3cc8a7ad8a0ff269523e9b7ac984d475', '[\"*\"]', NULL, NULL, '2024-02-20 00:17:35', '2024-02-20 00:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(16,0) NOT NULL,
  `feature_image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature_image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1',
  `hidden` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `feature_image_path`, `content`, `user_id`, `category_id`, `created_at`, `updated_at`, `feature_image_name`, `deleted_at`, `view_count`, `quantity`, `hidden`) VALUES
(17, 'Tai nghe Bluetooth Apple AirPods Pro 2023 Magsafe', NULL, '120000', '/storage/product/1/zDX3vzZZpue6OmDJqLvs.png', '<p>Tai nghe AirPods Pro Magsafe 2021 - Trải nghi&ecirc;̣m &acirc;m thanh đ&acirc;̀y m&ecirc; hoặc<br />Thi&ecirc;́t k&ecirc;́ cải ti&ecirc;́n tăng đ&ocirc;̣ &ecirc;m nhẹ khi đeo<br />AirPods Pro 2021 được Apple tái thi&ecirc;́t k&ecirc;́ nhằm mang đ&ecirc;́n trải nghi&ecirc;̣m nghe nhạc &ecirc;m ái, kh&ocirc;ng g&acirc;y đau tai cho bạn. M&ocirc;̃i b&ecirc;n củ tai AirPods Pro 2021 có thi&ecirc;́t k&ecirc;́ nhét trong, với ba kích thước đ&ecirc;̣m tai silicone khác nhau cho bạn tự chọn kích thước vừa nh&acirc;́t. Ph&acirc;̀n đ&ecirc;̣m tai cũng được Apple thi&ecirc;́t k&ecirc;́ đ&ecirc;̉ ngăn tạp &acirc;m lọt vào trong, cho bạn m&ocirc;̣t trải nghi&ecirc;̣m nghe nhạc trọn vẹn.</p>\r\n<p>AirPods Pro Magsafe còn đạt chu&acirc;̉n ch&ocirc;́ng nước và ch&ocirc;́ng th&acirc;́m m&ocirc;̀ h&ocirc;i cho các hoạt đ&ocirc;̣ng t&acirc;̣p luy&ecirc;̣n cường đ&ocirc;̣ nặng. Tai nghe còn tích hợp c&ocirc;̉ng microphone mở r&ocirc;̣ng giúp tăng cường ch&acirc;́t lượng nghe gọi trong m&ocirc;i trường có gió mạnh.<br />&Acirc;m thanh đẳng c&acirc;́p, cách &acirc;m ưu vi&ecirc;̣t<br />AirPods Pro 2021 mang đ&ecirc;́n ch&acirc;́t lượng &acirc;m thanh đặc sắc và đẳng c&acirc;́p. B&ecirc;n trong tai nghe cũng trang bị các ph&acirc;̀n cứng giúp tăng cường đ&ocirc;̣ mạnh &acirc;m bass, c&acirc;n bằng các dải &acirc;m th&acirc;́p và trung, cũng như lọc ti&ecirc;́ng &ocirc;̀n khi thu &acirc;m giọng nói cho ch&acirc;́t lượng cu&ocirc;̣c gọi t&ocirc;́t hơn.<br />Sạc pin ti&ecirc;̣n lợi qua cổng USB-C, dùng kh&ocirc;ng ngừng nghỉ<br />Tai nghe AirPods Pro 2021 Magsafe được lưu giữ trong h&ocirc;̣p đựng màu trắng sang trọng - và cũng là h&ocirc;̣p sạc kh&ocirc;ng d&acirc;y MagSafe. H&ocirc;̣p sạc được Apple ch&ecirc;́ tạo giúp tương thích với kh&ocirc;ng chỉ sạc MagSafe, mà còn với nhi&ecirc;̀u loại đ&ecirc;́ sạc kh&ocirc;ng d&acirc;y khác. Và m&ocirc;̃i khi AirPods Pro 2021 đạt trạng thái pin th&acirc;́p, tai nghe sẽ tự đ&ocirc;̣ng gửi th&ocirc;ng báo đ&ecirc;́n iPhone cho vi&ecirc;̣c sạc pin kịp thời.</p>', 1, 14, '2023-12-07 10:14:33', '2023-12-07 10:14:33', '1655224993.png', NULL, 0, 1, 0),
(18, 'Tai nghe không dây JBL Live Pro+', NULL, '2290000', '/storage/product/1/Rd2WB8vrj2Cy294wvXev.webp', '<p>Tai nghe JBL Live Pro+ &ndash; &Acirc;m thanh chất lượng<br />JBL l&agrave; một thương hiệu &acirc;m thanh nổi tiếng v&agrave; được nhiều người biết đến tr&ecirc;n thế giới. mới đ&acirc;y h&atilde;ng vừa cho ra mắt sản phẩm tai nghe kh&ocirc;ng d&acirc;y mang t&ecirc;n JBL Live Pro Plus. Mẫu tai nghe với &acirc;m thanh chất lượng c&ugrave;ng dung lượng pin lớn.<br />Thiết kế nhỏ gọn, hỗ trợ chống nước IPX4<br />Live Pro Plus sở hữu một thiết kế v&ocirc; c&ugrave;ng nhỏ gọn với trọng lượng chỉ 10g. Đặc biệt với bộ 5 n&uacute;t silicone k&egrave;m theo gi&uacute;p tai nghe dễ d&agrave;ng sử dụng cho nhiều k&iacute;ch thước tai kh&aacute;c nhau.<br />JBL Live Pro Plus với dung lượng pin lớn với 28 giờ sử dụng<br />Tai nghe kh&ocirc;ng d&acirc;y JBL Live Pro Plus được trang bị dung lượng pin lớn cho 7 giờ sử dụng mỗi lần sạc c&ugrave;ng 21 giờ trọng hộp, tổng lại người d&ugrave;ng c&oacute; tới 28 giờ. Đặc biệt c&ograve;n hỗ trợ t&iacute;nh năng sạc kh&ocirc;ng d&acirc;y Qi.</p>', 1, 14, '2023-12-07 10:18:14', '2023-12-07 10:18:14', 'jbl_live_pro_11.webp', NULL, 0, 1, 0),
(19, 'Tai nghe có dây Nokia WB-101', NULL, '200000', '/storage/product/1/XhKeVRZeGKi8bwTeuyvP.webp', '<p>Thiết kế nhỏ gọn, chất lượng &acirc;m thanh tuyệt vời<br />Tai nghe Nokia WB-101 được thiết kế với phong c&aacute;ch đơn giản tối thiểu, kết hợp với c&aacute;c gam m&agrave;u phổ biến dễ sử dụng. Với m&uacute;t nh&eacute;t tai l&agrave;m bằng chất liệu Silicon mềm dẻo tạo n&ecirc;n cảm gi&aacute;c thoải m&aacute;i khi đeo chứ kh&ocirc;ng bị đau nhức tai khi nghe qu&aacute; l&acirc;u.&nbsp;<br />Tai nghe được thiết kế nhỏ gọn c&oacute; thể dễ d&agrave;ng bỏ trong t&uacute;i hay balo mang theo bất cứ đ&acirc;u. Lớp vỏ b&ecirc;n ngo&agrave;i được l&agrave;m bằng nguy&ecirc;n liệu hợp kim nh&ocirc;m, được bao phủ 1 lớp nhựa b&ecirc;n ngo&agrave;i để bảo vệ, chống bị xước trầy.<br />Ph&iacute;m tăng giảm &acirc;m lượng v&agrave; nghe cuộc gọi được để ở ch&iacute;nh giữa d&acirc;y tai nghe.<br />Điều khiển tai nghe th&iacute;ch hợp để mang lại &acirc;m nhạc &ecirc;m &aacute;i, dễ chịu<br />Tai nghe c&oacute; d&acirc;y Nokia WB-101 ph&aacute;t ra chất lượng &acirc;m thanh t&ocirc;ng trầm v&agrave; t&ocirc;ng trung vừa phải. Tai nghe n&agrave;y sử dụng một m&agrave;ng k&eacute;p graphene để gi&uacute;p giữ lại c&aacute;c chất &acirc;m chi tiết nhỏ. Graphene được nhiều nh&agrave; sản xuất tin d&ugrave;ng v&igrave; vật liệu mỏng v&agrave; th&acirc;n thiện với m&ocirc;i trường, gi&uacute;p cho tạo ra &acirc;m thanh phong ph&uacute; v&agrave; r&otilde; r&agrave;ng hơn.</p>', 1, 24, '2023-12-07 10:20:53', '2023-12-07 10:21:50', 'group_194_2.webp', NULL, 0, 10, 0),
(20, 'Loa Bluetooth Soundpeats Halo', NULL, '500000', '/storage/product/1/96gidRF1gX5p2AxFePID.webp', '<p style=\"font-weight: 400;\">Những chiếc loa &acirc;m thanh giờ đ&acirc;y đ&atilde; trở th&agrave;nh một phần kh&ocirc;ng thể thiếu trong mọi bữa tiệc, l&agrave; một thiết bị &acirc;m thanh y&ecirc;u th&iacute;ch của c&aacute;c bạn trẻ khi đi du lịch hoặc đi chơi xa. Nếu bạn đang t&igrave;m kiếm một thiết bị loa Bluetooth với thiết kế nhỏ gọn, thời trang c&ugrave;ng &acirc;m thanh chất lượng v&agrave; pin tr&acirc;u th&igrave; đừng vội bỏ qua loa Bluetooth SoundPEATS Halo hội tụ đầy đủ c&aacute;c yếu tố tr&ecirc;n c&ugrave;ng với gi&aacute; th&agrave;nh cực kỳ hợp l&yacute;!</p>\r\n<h2><strong>K&iacute;ch thước nhỏ gọn dễ d&agrave;ng mang đi trong mọi h&agrave;nh tr&igrave;nh</strong></h2>\r\n<p style=\"font-weight: 400;\">Sản phẩm loa Bluetooth SoundPEATS Halo đi c&ugrave;ng với m&agrave;u đen v&agrave; k&iacute;ch thước lần lượt l&agrave; 98 x 98 x 47.3mm v&agrave; trọng lượng 256,2g để bạn c&oacute; thể dễ d&agrave;ng mang đi mu&ocirc;n nơi. Thương hiệu đ&atilde; chiều l&ograve;ng tất cả c&aacute;c fan h&acirc;m mộ với thế hệ loa mới n&agrave;y với sự ho&agrave;n hảo ở hệ suất &acirc;m thanh vượt trội v&agrave; thiết kế vỏ bện tinh tế c&ugrave;ng vật liệu chắc chắn.</p>\r\n<p style=\"font-weight: 400;\">Thiết bị loa c&oacute; khả năng kh&aacute;ng nước chuẩn IPX5 để bạn c&oacute; thể v&ocirc; tư sử dụng trong mọi điều kiện thời tiết như mưa nhẹ ngo&agrave;i trời. Loa Bluetooth c&oacute; đi k&egrave;m với một dải gắn k&egrave;m theo cho ph&eacute;p bạn tiện lợi mang loa ngo&agrave;i trời cho c&aacute;c hoạt động nghệ thuật của m&igrave;nh.</p>\r\n<p style=\"font-weight: 400;\">&nbsp;</p>\r\n<p style=\"font-weight: 400;\">Loa Bluetooth c&oacute; chứa &aacute;nh s&aacute;ng RGB 3 m&agrave;u c&oacute; thể được điều khiển bằng n&uacute;t bấm ở ph&iacute;a dưới để khiến cho kh&ocirc;ng gian bữa tiệc nh&agrave; bạn trở n&ecirc;n sống động hơn bao giờ hết. Sự ho&agrave;n mỹ trong thiết kế cho ph&eacute;p loa kh&ocirc;ng d&acirc;y hoạt động trơn tru phục vụ cho mọi nhu&nbsp;cầu giải tr&iacute; v&agrave; c&ocirc;ng việc của bạn m&agrave; kh&ocirc;ng g&acirc;y ảnh hưởng đến m&ocirc;i trường xung quanh.</p>\r\n<h2><strong>Trải nghiệm sống động với Driver 40mm cực chất</strong></h2>\r\n<p style=\"font-weight: 400;\">&Acirc;m thanh c&oacute; tr&ecirc;n sản phẩm loa Bluetooth SoundPEATS Halo được tinh chỉnh bởi thuật to&aacute;n hiệu ứng &acirc;m thanh hiện đại v&agrave; chuẩn x&aacute;c qua đa tần số với &acirc;m bass mạnh mẽ. Hơn nữa, thiết bị loa c&ograve;n được trang bị Driver 40mm c&ugrave;ng tần số 20Hz-20kHz c&oacute; thể t&aacute;i tạo &acirc;m thanh chi tiết phục vụ tốt cho cả việc giải tr&iacute; cũng như đ&agrave;m thoại cực kỳ sống động.</p>\r\n<p style=\"font-weight: 400;\"><img src=\"https://cdn.hoanghamobile.com/i/content/Uploads/2022/10/17/11_638016212445070351.jpg\" alt=\"\" width=\"800\" height=\"495\" /></p>\r\n<p style=\"font-weight: 400;\">Loa Bluetooth SoundPEATS Halo c&oacute; chứa micr&ocirc; b&ecirc;n trong để bạn c&oacute; thể thỏa th&iacute;ch tr&ograve; chuyện trong c&aacute;c cuộc hội nghị của m&igrave;nh.</p>\r\n<h2><strong>Kết nối Bluetooth 5.0 nhanh hơn bao giờ hết</strong></h2>\r\n<p style=\"font-weight: 400;\">Loa Bluetooth SoundPEATS Halo c&oacute; khả năng tương th&iacute;ch rộng v&agrave; kết nối khả dụng với hầu hết c&aacute;c thiết bị hỗ trợ Bluetooth như điện thoại th&ocirc;ng minh, m&aacute;y t&iacute;nh bảng hay m&aacute;y t&iacute;nh x&aacute;ch tay. Ngo&agrave;i ra, c&ocirc;ng nghệ Bluetooth 5.0 c&oacute; tr&ecirc;n sản phẩm sẽ đảm bảo truyền tải nhanh v&agrave; ổn định trong phạm vi 10m.</p>\r\n<p style=\"font-weight: 400;\"><img src=\"https://cdn.hoanghamobile.com/i/content/Uploads/2022/10/17/11_638016212445070351.jpg\" alt=\"\" width=\"800\" height=\"495\" /></p>\r\n<p style=\"font-weight: 400;\">Bạn c&oacute; thể thử trải nghiệm chế độ &acirc;m thanh nổi tr&ecirc;n thiết bị sẽ hỗ trợ kết nối hai loa c&ugrave;ng l&uacute;c để đem lại &acirc;m lượng đ&atilde; nhất. Sản phẩm loa đi k&egrave;m với dung lượng pin 1800mAh c&oacute; thời gian sạc 3 tiếng đồng hồ hỗ trợ sạc USB Type C đầu v&agrave;o 5V / 1A. Loa Bluetooth SoundPEATS Halo c&oacute; tổng thời gian ph&aacute;t nhạc (60% &acirc;m lượng) khi bật đ&egrave;n l&agrave; 14h trong khi kh&ocirc;ng tắt đ&egrave;n c&oacute; thể trụ được 28 giờ.</p>\r\n<p style=\"font-weight: 400;\">Dưới đ&acirc;y l&agrave; một số thao t&aacute;c điều khiển loa m&agrave; bạn n&ecirc;n lưu &yacute;:</p>\r\n<ul>\r\n<li style=\"font-weight: 400;\">Bật nguồn: Nhấn giữ n&uacute;t nguồn 1.5s</li>\r\n<li style=\"font-weight: 400;\">Tắt nguồn: Nhấn giữ n&uacute;t nguồn 3s</li>\r\n<li style=\"font-weight: 400;\">Nghe/ Dừng nhạc: Nhấn n&uacute;t nguồn 1 lần</li>\r\n<li style=\"font-weight: 400;\">Tăng &acirc;m lượng: Nhấn n&uacute;t (+)</li>\r\n<li style=\"font-weight: 400;\">Giảm &acirc;m lượng: Nhấn n&uacute;t (-)</li>\r\n<li style=\"font-weight: 400;\">Qua b&agrave;i: Nhấn giữ n&uacute;t (+) trong 1.5s</li>\r\n<li style=\"font-weight: 400;\">Quay lại b&agrave;i trước: Nhấn giữ n&uacute;t (-) trong 1.5s</li>\r\n</ul>\r\n<p style=\"font-weight: 400;\">Đ&acirc;y l&agrave; thời điểm th&iacute;ch hợp để bạn c&oacute; thể sắm ngay thiết bị loa Bluetooth SoundPEATS Halo tại Ho&agrave;ng H&agrave; Mobile - một địa chỉ b&aacute;n h&agrave;ng uy t&iacute;n, tin cậy v&agrave; đem lại gi&aacute; tốt nhất cho người ti&ecirc;u d&ugrave;ng!&nbsp;</p>', 1, 23, '2023-12-07 10:26:35', '2023-12-07 10:30:05', 'soundpeats.webp', NULL, 0, 1, 0),
(22, 'Tai nghe có dây Gaming ASUS ROG Cetra II Core', NULL, '890000', '/storage/product/1/vhh3zx2FEXRtlkE8Yy4Q.webp', '<p>Chất lượng &acirc;m thanh r&otilde; r&agrave;ng chi tiết, &acirc;m bass mạnh mẽ ph&ugrave; hợp với c&aacute;c gamer<br />Thiết kế c&ocirc;ng th&aacute;i học với đệm tai si&ecirc;u mềm tạo cảm gi&aacute;c vừa vặn v&agrave; thoải m&aacute;i<br />Trọng lượng si&ecirc;u nhẹ, housing được l&agrave;m từ chất liệu kim loại chống trầy bền bỉ<br />Jack 3.5 mm thiết kế 90 độ, gi&uacute;p thuận tiện khi sử dụng với c&aacute;c thiết bị cầm tay</p>', 1, 24, '2023-12-14 11:19:43', '2023-12-14 11:19:43', 'group_193_3_.webp', NULL, 0, 1, 0),
(23, 'Tai nghe KZ EDX Pro', NULL, '300000', '/storage/product/1/OGWiAHmyPF3PE0oceGcz.webp', '<p>Kiểu d&aacute;ng housing trong suốt, trẻ trung c&ugrave;ng trọng lượng si&ecirc;u nhẹ<br />Thiết kế c&ocirc;ng th&aacute;i học tạo cảm gi&aacute;c thoải m&aacute;i ngay cả khi đeo l&acirc;u<br />Driver 10 mm cho chất &acirc;m to r&otilde;, ph&ugrave; hợp với nhiều thể loại nhạc<br />D&acirc;y đeo được n&acirc;ng cấp gi&uacute;p kh&ocirc;ng bị rối v&agrave; sử dụng l&acirc;u d&agrave;i hơn</p>', 1, 24, '2023-12-14 11:21:04', '2023-12-14 11:21:04', 'frame_1_4_2.webp', NULL, 0, 1, 0),
(24, 'Tai nghe KZ ZSN Pro', NULL, '500000', '/storage/product/1/ymqXYjCQLvnkoisldFkC.webp', '<p>D&acirc;y l&otilde;i c&aacute;p bạc gi&uacute;p d&acirc;y bền bỉ v&agrave; housing l&agrave;m bằng kim loại xen kẽ nhựa cao cấp<br />Kiểu d&aacute;ng đeo v&ograve;ng qua v&agrave;nh tai gi&uacute;p hạn chế t&igrave;nh trạng rơi rớt khi vận động mạnh<br />Trải nghiệm &acirc;m thanh ch&acirc;n thực với mỗi housing l&agrave; 1 driver dynamic v&agrave; 1 driver BA<br />Trang bị cổng 3.5 mm tương th&iacute;ch với đa dạng c&aacute;c thiết bị như điện thoại, m&aacute;y t&iacute;nh</p>', 1, 24, '2023-12-14 11:21:47', '2023-12-14 11:21:47', 'group_192_4.webp', NULL, 0, 1, 0),
(25, 'Tai nghe KZ ZSN Pro X', NULL, '590000', '/storage/product/1/ctwhtiKKmTPYqgIYIbOZ.webp', '<p>Chất liệu kim loại kết hợp với nhựa cho m&agrave;u sắc tươi s&aacute;ng mang đến vẻ đẹp độc đ&aacute;o<br />Thiết kế c&ocirc;ng th&aacute;i học &ocirc;m kh&iacute;t với v&agrave;nh tai tạo cảm gi&aacute;c thoải m&aacute;i, chống ồn hiệu quả<br />Khả năng cải thiện hiệu suất của &acirc;m cao v&agrave; &acirc;m thấp ph&ugrave; hợp với nhiều thể loại nhạc<br />M&agrave;n loa 10 mm c&ugrave;ng c&ocirc;ng nghệ &acirc;m thanh cao cấp cho hiệu suất &acirc;m thanh vượt trội</p>', 1, 24, '2023-12-14 11:24:40', '2023-12-14 11:24:40', 'group_192_1__2.webp', NULL, 0, 1, 0),
(26, 'Tai nghe Sony MDR E9LP', NULL, '140000', '/storage/product/1/baREjO0QdOXv99lsmlyF.webp', '<p>Tai nghe C&oacute; d&acirc;y Sony MDR-E9LP với phong c&aacute;ch thiết kế đơn giản, m&agrave;u sắc trẻ trung, ph&ugrave; hợp nhiều người d&ugrave;ng<br />Thiết kế n&uacute;t tai nghe dạng tr&ograve;n k&egrave;m lớp đệm mỏng mịn gi&uacute;p đeo tai &ecirc;m &aacute;i, dễ chịu.</p>', 1, 24, '2023-12-14 11:25:30', '2023-12-14 11:25:30', 'group_27_1__1_2.webp', NULL, 0, 1, 0),
(27, 'EarPods jack cắm 3.5 mm', NULL, '790000', '/storage/product/1/a74icvFV5bdU7FVOW83w.webp', '<p>Do Apple thiết kế</p>\r\n<p>T&ocirc;ng trầm s&acirc;u, phong ph&uacute;</p>\r\n<p>Chống mồ h&ocirc;i v&agrave; chống nước</p>\r\n<p>Điều khiển ph&aacute;t nhạc v&agrave; video</p>\r\n<p>Trả lời v&agrave; kết th&uacute;c cuộc gọi</p>', 1, 14, '2023-12-14 11:27:12', '2023-12-14 11:27:12', 'tai-nghe-earpods-apple-mnhf2-tn-1-200x200.webp', NULL, 0, 1, 0),
(28, 'EarPods jack cắm Lightning', NULL, '550000', '/storage/product/1/BJwoA44exTPAsByztybc.webp', '<p>Do Apple thiết kế</p>\r\n<p>T&ocirc;ng trầm s&acirc;u, phong ph&uacute;</p>\r\n<p>Chống mồ h&ocirc;i v&agrave; chống nước</p>\r\n<p>Điều khiển ph&aacute;t nhạc v&agrave; video</p>\r\n<p>Trả lời v&agrave; kết th&uacute;c cuộc gọi</p>', 1, 14, '2023-12-14 11:28:46', '2023-12-14 11:28:46', 'tai-nghe-earpods-cong-lightning-apple-mmtn2-tn-1-650x650.webp', NULL, 0, 1, 0),
(29, 'Tai nghe Bluetooth chụp tai Edifier W820NB', NULL, '990000', '/storage/product/1/i5Yk1yUREU6zgEJBENcu.webp', '<p>Thiết kế nhỏ gọn nhưng v&ocirc; c&ugrave;ng tinh tế mang lại cảm gi&aacute;c thoải m&aacute;i khi đeo<br />Driver 40mm c&ugrave;ng &acirc;m thanh hi-res Audio hiện đại gi&uacute;p trải nghiệm ch&acirc;n thực<br />Thời lượng pin ấn tượng, nghe nhạc li&ecirc;n tục tối đa 49h chỉ với 1.5h sạc đầy<br />Độ trễ 80 ms gi&uacute;p đồng bộ h&oacute;a &acirc;m thanh trong game một c&aacute;ch nhanh ch&oacute;ng</p>', 1, 25, '2023-12-14 11:52:02', '2023-12-14 11:52:02', 'edifier_w820nb.webp', NULL, 0, 1, 0),
(30, 'Tai nghe Bluetooth chụp tai JBL Tune 520BT', NULL, '1390000', '/storage/product/1/akombbdE5HsLtYKEZUk1.webp', '<p>Thiết kế nhỏ gọn nhưng v&ocirc; c&ugrave;ng tinh tế mang lại cảm gi&aacute;c thoải m&aacute;i khi đeo<br />Driver 40mm c&ugrave;ng &acirc;m thanh hi-res Audio hiện đại gi&uacute;p trải nghiệm ch&acirc;n thực<br />Thời lượng pin ấn tượng, nghe nhạc li&ecirc;n tục tối đa 49h chỉ với 1.5h sạc đầy<br />Độ trễ 80 ms gi&uacute;p đồng bộ h&oacute;a &acirc;m thanh trong game một c&aacute;ch nhanh ch&oacute;ng</p>', 1, 25, '2023-12-14 11:52:50', '2023-12-14 11:52:50', 'tai-nghe-chup-tai-jbl-tune-520bt_2_.webp', NULL, 0, 1, 0),
(31, 'Tai nghe Bluetooth chụp tai Marshall Major 4', NULL, '3390000', '/storage/product/1/zzNWUg1wO2YW7QCHRIu8.webp', '<p>Driver 40 mm cho chất &acirc;m vượt trội, &acirc;m trầm v&agrave; &acirc;m bổng được t&aacute;i hiện r&otilde; n&eacute;t<br />Thời lượng pin si&ecirc;u lớn c&oacute; thể hoạt động đến 80 giờ, t&iacute;ch hợp sạc kh&ocirc;ng d&acirc;y<br />Thiết kế c&ocirc;ng th&aacute;i học mới gi&uacute;p vừa vặn v&agrave; mềm mại với khu&ocirc;n tai người đeo<br />N&uacute;t điều khiển đa hướng cho ph&eacute;p thực hiện nhanh ch&oacute;ng được nhiều t&aacute;c vụ</p>', 1, 25, '2023-12-14 11:53:34', '2023-12-14 11:53:34', 'group_149_1_1 (1).webp', NULL, 0, 1, 0),
(32, 'Tai nghe Bluetooth chụp tai Sennheiser MOMENTUM 4', NULL, '6990000', '/storage/product/1/tzfcRBEqaTQFUfVx5H23.webp', '<p>Driver 42mm với chất &acirc;m r&otilde; n&eacute;t mang đến trải nghiệm nghe cực đ&atilde;<br />Tạo &acirc;m thanh ho&agrave;n hảo cho ri&ecirc;ng bạn với EQ + Sound Personalization<br />C&ocirc;ng nghệ khử ồn gi&uacute;p nghe r&otilde; từng chi tiết cả trong m&ocirc;i trường ồn &agrave;o<br />Chế độ xuy&ecirc;n &acirc;m nghe &acirc;m thanh b&ecirc;n ngo&agrave;i m&agrave; kh&ocirc;ng cần th&aacute;o tai nghe<br />Thiết kế đẹp mắt v&agrave; mềm mại tạo phong c&aacute;ch ri&ecirc;ng v&agrave; thoải m&aacute;i khi sử dụng</p>', 1, 25, '2023-12-14 11:54:39', '2023-12-14 11:54:39', 'group_286_2_1.webp', NULL, 0, 1, 0),
(33, 'Tai nghe Bluetooth chụp tai Sony WH-1000XM4', NULL, '5490000', '/storage/product/1/AaLyrBp7myOipDr0hj40.webp', '<p>Bộ xử l&yacute; chống ồn QN1 gi&uacute;p loại bỏ tạp &acirc;m từ m&ocirc;i trường xung quanh<br />M&agrave;ng loa 40 mm mạnh mẽ mang đến chất lượng &acirc;m thanh đỉnh cao<br />Dễ d&agrave;ng thực hiện cuộc gọi rảnh tay với micro t&iacute;ch hợp tr&ecirc;n tai nghe<br />Tăng giảm &acirc;m lượng hoặc nhận cuộc gọi chỉ với một thao t&aacute;c chạm</p>', 1, 25, '2023-12-14 11:55:36', '2023-12-14 11:55:36', 'group_17333.webp', NULL, 0, 1, 0),
(34, 'Tai nghe Bluetooth chụp tai Sony WH-1000XM5', NULL, '6990000', '/storage/product/1/WQgwDmM2ThbzQA2Tx1Y6.webp', '<p>C&ocirc;ng nghệ Auto NC Optimizer tự động khử tiếng ồn dựa theo m&ocirc;i trường<br />Trải nghiệm nghe ch&acirc;n thật, sống động nhờ t&iacute;nh năng 360 Reality Audio<br />Thiết kế sang trọng, trọng lượng nhẹ với phần da mềm mại, &ocirc;m kh&iacute;t đầu<br />Năng lượng cho cả ng&agrave;y d&agrave;i với thời lượng sử dụng pin l&ecirc;n đến 40 giờ</p>', 1, 25, '2023-12-14 11:56:20', '2023-12-14 11:56:20', 'group_172_2.webp', NULL, 0, 1, 0),
(35, 'Loa Bluetooth Edifier QD35', NULL, '2650000', '/storage/product/1/k11suzvIMsmvETrO8Q4K.webp', '<p>Kiểu d&aacute;ng đẹp mắt, độc đ&aacute;o khi được trang bị m&agrave;n h&igrave;nh LED hiển thị thời gian tiện lợi<br />Bộ khuếch đại kỹ thuật số mạnh mẽ kết hợp c&ugrave;ng chipset DSP cho chất &acirc;m mạnh mẽ<br />C&aacute; nh&acirc;n ho&aacute; chế độ nghe nhờ t&iacute;nh năng tự điều chỉnh EQ th&ocirc;ng qua Edifier Connect<br />C&ocirc;ng suất sạc l&ecirc;n đến 35 W nhờ v&agrave;o c&ocirc;ng nghệ sạc hiệu suất cao đến từ TurboGaN</p>', 1, 25, '2023-12-14 11:57:03', '2023-12-14 11:57:03', 'frame_13_1_.webp', NULL, 0, 1, 0),
(36, 'Loa Bluetooth JBL Authentics 200', NULL, '8290000', '/storage/product/1/CIwnUIMyqsD9k00BnPdr.webp', '<p>Trong bộ ba loa di động JBL mới vừa được mở b&aacute;n tại Cellphone,JBL Authentics 500 l&agrave; phi&ecirc;n bản cao cấp nhất n&ecirc;n được trang bị đầy đủ c&aacute;c t&iacute;nh năng nhất. Kh&ocirc;ng chỉ c&oacute; kết nối Wi-Fi, Bluetooth v&agrave; c&ocirc;ng nghệ &acirc;m thanh v&ograve;m Dolby Atmos, mẫu loa n&agrave;y c&ograve;n mang tới trải nghiệm ch&igrave;m đắm trong &acirc;m nhạc đ&uacute;ng nghĩa v&agrave; kh&oacute; qu&ecirc;n.</p>', 1, 23, '2023-12-14 11:57:49', '2023-12-14 11:57:49', 'loa-jbl-authentics-200_1_.webp', NULL, 0, 1, 0),
(37, 'Loa Bluetooth JBL Authentics 500', NULL, '16900000', '/storage/product/1/QKfcIX55chH024bZN29m.webp', '<p>Thiết kế tinh tế với vỏ bọc giống da đậm chất cổ điển gi&uacute;p điểm t&ocirc; th&ecirc;m căn ph&ograve;ng của bạn<br />Trang bị &acirc;m thanh Dolby Atmos cho chất &acirc;m sống động như đang trải nghiệm nghe trực tiếp<br />T&iacute;ch hợp WiFi gi&uacute;p truyền ph&aacute;t nhạc trực tuyến, radio v&agrave; podcast với chất lượng ấn tượng<br />C&ocirc;ng suất đến 270W với 3 loa tweeter 1 inch v&agrave; 3 loa trầm tầm trung cho chất &acirc;m vượt trội</p>', 1, 23, '2023-12-14 11:58:37', '2023-12-14 11:58:37', 'loa-jbl-authentics-500_1_.webp', NULL, 0, 1, 0),
(38, 'Loa Bluetooth JBL Charge 5', NULL, '3790000', '/storage/product/1/TNAw58q0B6qRBr6pjAlX.webp', '<p>C&ocirc;ng suất l&ecirc;n đến 40 W mang lại &acirc;m thanh mạnh mẽ, sống động<br />Hỗ trợ t&iacute;nh năng PartyBoost cho ph&eacute;p kết nối nhiều loa c&ugrave;ng l&uacute;c<br />Trải nghiệm ở mọi l&uacute;c, mọi nơi nhờ v&agrave;o chuẩn kh&aacute;ng nước IP67<br />Tuỳ chỉnh EQ nhanh ch&oacute;ng v&agrave; tiện lợi với ứng dụng JBL Portable</p>', 1, 23, '2023-12-14 11:59:12', '2023-12-14 11:59:12', 'group_211.webp', NULL, 0, 1, 0),
(39, 'Loa Bluetooth JBL Flip 6', NULL, '2840000', '/storage/product/1/POCndJbajVpPRpRutAim.webp', '<p>Bass cực mạnh, quẩy cực sung với cụm loa k&eacute;p cho &acirc;m bass s&acirc;u trầm<br />Sử dụng thoải m&aacute;i ở điều kiện m&ocirc;i trường ẩm ướt với kh&aacute;ng nước IP67<br />Tận hưởng &acirc;m thanh với t&iacute;nh năng PartyBoost c&oacute; kết nối 2 loa c&ugrave;ng l&uacute;c<br />Vi&ecirc;n pin lớn c&oacute; thể hoạt động l&ecirc;n đến 12 giờ v&agrave; chỉ mất 2.5 giờ sạc đầy</p>', 1, 23, '2023-12-14 12:00:31', '2023-12-14 12:00:31', 'group_211_1__1.webp', NULL, 0, 1, 0),
(40, 'Loa JBL Partybox On The Go', NULL, '5990000', '/storage/product/1/zpMLcSqqzu25YgNxAm4u.webp', '<p>C&ocirc;ng suất đến 100 W c&ugrave;ng c&ocirc;ng nghệ Bass Boost mang tới &acirc;m bass mạnh mẽ<br />Thoả sức h&aacute;t karaoke c&ugrave;ng nhau với 2 micro kh&ocirc;ng d&acirc;y được tặng k&egrave;m với loa<br />An to&agrave;n khi sử dụng trong những buổi tiệc d&atilde; ngoại với chuẩn chống nước IPX4<br />Trải nghiệm &acirc;m thanh kh&ocirc;ng d&acirc;y - Wireless Stereo với chức năng gh&eacute;p cặp loa</p>', 1, 23, '2023-12-14 12:01:11', '2023-12-14 12:01:11', 'group_204_2_2.webp', NULL, 0, 1, 0),
(41, 'Tai nghe Bluetooth True Wireless Huawei FreeBuds SE 2', NULL, '590000', '/storage/product/1/1sLVsCL8PHbbxr81EoXa.webp', '<p>Thời lượng sử dụng l&ecirc;n đến 40 giờ li&ecirc;n tục th&iacute;ch hợp xem phim, nghe nhạc, chơi game,...<br />Thiết kế tai nghe dạng earbuds chuẩn c&ocirc;ng th&aacute;i học, tạo cảm gi&aacute;c nhẹ nh&agrave;ng, thoải m&aacute;i<br />Kh&aacute;ng nước v&agrave; bụi IP54 đảm bảo cho tai nghe hoạt động tốt nhất trong nhiều t&igrave;nh huống<br />C&ocirc;ng nghệ Bluetooth 5.3 mới gi&uacute;p h&igrave;nh ảnh v&agrave; &acirc;m thanh lu&ocirc;n được đồng bộ, liền mạch</p>', 1, 22, '2023-12-14 12:02:00', '2023-12-14 12:02:00', 'tai-nghe-khong-day-huawei-freebuds-se-2.webp', NULL, 0, 1, 0),
(42, 'Tai nghe Bluetooth True Wireless JBL Wave Beam', NULL, '1490000', '/storage/product/1/fMXwEZ85vzhjuN1LzOcZ.webp', '<p>Tai nghe JBL Wave Beam được trang bị tr&igrave;nh điều kiển 8mm mang lại &acirc;m thanh vượt trội với &acirc;m bass s&acirc;u kết hợp với thiết kế đ&oacute;ng k&iacute;n gi&uacute;p tăng cường hiệu suất &acirc;m thanh. Tai nghe được trang bị thiết kế kh&aacute; vừa vặn c&ugrave;ng với đ&oacute; l&agrave; bộ sưu tập m&agrave;u sắc đa dạng như xanh, đen, trắng v&agrave; v&agrave;ng. JBL Wave Beam với c&ocirc;ng nghệ Smart Ambient cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng dễ d&agrave;ng nghe được &acirc;m thanh xung quanh, c&ugrave;ng với đ&oacute; l&agrave; t&iacute;nh năng TalkThru hỗ trợ tạm dừng &acirc;m nhạc nhanh ch&oacute;ng để tham gia c&aacute;c cuộc tr&ograve; chuyện với bạn b&egrave;.</p>', 1, 22, '2023-12-14 12:02:52', '2023-12-14 12:03:51', 'tai-nghe-khong-day-jbl-wave-beam_4_.webp', NULL, 0, 1, 0),
(43, 'Tai nghe Bluetooth True Wireless Marshall Minor 3', NULL, '2690000', '/storage/product/1/XggJexLdr7kZ4LEwTlhw.webp', '<p>Thời lượng pin tốt, c&oacute; thể hoạt động đến 5 giờ li&ecirc;n tục v&agrave; 25 giờ khi k&egrave;m hộp sạc<br />M&agrave;ng loa 12mm được tuỳ chỉnh mang đến chất lượng &acirc;m thanh r&otilde; r&agrave;ng, sắc n&eacute;t<br />Trang bị kh&aacute;ng nước chuẩn IPX4 gi&uacute;p bảo vệ tai nghe khỏi mồi h&ocirc;i v&agrave; nước bắn<br />T&iacute;ch hợp cảm biến tiệm cận c&oacute; khả năng tự động dừng tắt nhạc khi th&aacute;o tai ngh</p>', 1, 22, '2023-12-14 12:03:28', '2023-12-14 12:03:28', 'group_150_1_3.webp', NULL, 0, 1, 0),
(44, 'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds2 Pro', NULL, '2990000', '/storage/product/1/CWv7VROoDAcUKkT8CV8Y.jpg', '<p>Thiết kế chuẩn c&ocirc;ng th&aacute;i học phong c&aacute;ch, &ocirc;m kh&iacute;t v&agrave;o tai, hạn chế rơi khi di chuyển<br />Đắm ch&igrave;m trong kh&ocirc;ng gian &acirc;m nhạc ri&ecirc;ng với t&iacute;nh năng chống ồn ANC v&agrave; 360 Audio<br />Kh&ocirc;ng ngại mưa rơi hay tập luyện cường độ cao khi sở hữu chuẩn kh&aacute;ng nước IPX7<br />Đạt chuẩn Bluetooth 5.3 mới nhất cho kết nối ổn định, nhận diện thiết bị nhanh ch&oacute;ng</p>', 1, 22, '2023-12-14 12:04:52', '2024-02-11 12:14:39', 'WIN_20240204_22_21_35_Pro.jpg', NULL, 0, 1, 0),
(45, 'Tai nghe Bluetooth True Wireless Sony WF C500', NULL, '1540000', '/storage/product/1/2HbgPHDvjiRegCUNQvNo.webp', '<p>Ho&agrave; m&igrave;nh v&agrave;o kh&ocirc;ng gian &acirc;m nhạc ch&acirc;n thực với c&ocirc;ng nghệ 360 Reality Audio<br />Thiết kế nhỏ gọn, đa dạng m&agrave;u sắc, thuận tiện cho việc mang theo b&ecirc;n m&igrave;nh<br />Vi&ecirc;n pin khủng cho thời lượng sử dụng 10 giờ v&agrave; l&ecirc;n đến 20h khi k&egrave;m hộp sạc<br />Tận hưởng kh&ocirc;ng gian ri&ecirc;ng tư nhờ v&agrave;o c&ocirc;ng nghệ chống ồn chủ động ANC</p>', 1, 22, '2023-12-14 12:05:42', '2024-02-03 11:29:37', 'group_187_2_.webp', '2024-02-03 11:29:37', 0, 1, 0),
(46, 'SP9223888888888', NULL, '1093932397490', '/storage/product/1/CjwdXr2Nt0Bz1wbanUom.webp', '<p>iinjjj</p>', 1, 14, '2023-12-14 22:54:47', '2023-12-14 22:54:57', 'tai-nghe-khong-day-soundpeats-capsule-3-pro-transparent_11_.webp', '2023-12-14 22:54:57', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL DEFAULT '13'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image_path`, `created_at`, `updated_at`, `image_name`, `product_id`) VALUES
(8, '/storage/product/1/YUm72JAzMoi2gcoxu2GY.jpg', '2023-12-07 10:14:33', '2023-12-07 10:14:33', 'ap.jpg', 17),
(9, '/storage/product/1/r9k7kKq8tGAbyiGHSimO.jpg', '2023-12-07 10:14:33', '2023-12-07 10:14:33', 'ap2.jpg', 17),
(10, '/storage/product/1/ouYLJNDyaYgF7p3tOJE9.jpg', '2023-12-07 10:14:33', '2023-12-07 10:14:33', 'ap3.jpg', 17),
(11, '/storage/product/1/sKrsSLK4FUAwPvCeYEn7.webp', '2023-12-07 10:18:14', '2023-12-07 10:18:14', 'jbl_live_pro_1.webp', 18),
(12, '/storage/product/1/EWIzHRIXTIjbXtwrYAHS.webp', '2023-12-07 10:18:14', '2023-12-07 10:18:14', 'jbl_live_pro_4.webp', 18),
(13, '/storage/product/1/MtQ2412pkWQypmTmfHfs.webp', '2023-12-07 10:20:53', '2023-12-07 10:20:53', 'nokia_wb-101_1.webp', 19),
(14, '/storage/product/1/Vmx9t6iyuAJr6SCOiJT6.webp', '2023-12-07 10:20:53', '2023-12-07 10:20:53', 'nokia_wb-101_4.webp', 19),
(15, '/storage/product/1/0A2dl14uV2FThOlZqjVA.webp', '2023-12-07 10:20:53', '2023-12-07 10:20:53', 'nokia_wb-101_5.webp', 19),
(16, '/storage/product/1/4K1giHqgx5N9QCYWVmLi.webp', '2023-12-07 10:20:53', '2023-12-07 10:20:53', 'group_194_2.webp', 19),
(17, '/storage/product/1/ASAEPztvEPpaV4g1N4cb.webp', '2023-12-07 10:26:35', '2023-12-07 10:26:35', 'halo-09.webp', 20),
(18, '/storage/product/1/b81t6Ooea1g4rNLFEABC.webp', '2023-12-07 10:26:35', '2023-12-07 10:26:35', 'halo-07.webp', 20),
(19, '/storage/product/1/OmFWyzZAg5yrN3PibbrR.webp', '2023-12-07 10:26:35', '2023-12-07 10:26:35', 'halo-08.webp', 20),
(23, '/storage/product/1/bpM00ME2tSK83CHl3WH1.webp', '2023-12-14 11:19:43', '2023-12-14 11:19:43', 'tai-nghe-rog-cetra-ii-core_17_.webp', 22),
(24, '/storage/product/1/sT4YfFqHwgxa8MZIPw0B.webp', '2023-12-14 11:19:43', '2023-12-14 11:19:43', 'tai-nghe-rog-cetra-ii-core_14_.webp', 22),
(25, '/storage/product/1/bG5uAjaB3TWvawNsonSG.webp', '2023-12-14 11:21:04', '2023-12-14 11:21:04', 'kz_edx_pro_1.webp', 23),
(26, '/storage/product/1/t9Cw6vQ98wW3sU2SxhrT.webp', '2023-12-14 11:21:04', '2023-12-14 11:21:04', 'kz_edx_pro_3.webp', 23),
(27, '/storage/product/1/0p5VSgly5d8lDzBl22Z6.webp', '2023-12-14 11:21:04', '2023-12-14 11:21:04', 'kz_edx_pro_5.webp', 23),
(28, '/storage/product/1/x8RFFs5OiMGUZFcH84WP.webp', '2023-12-14 11:21:47', '2023-12-14 11:21:47', 'kz_zsn_pro_1.webp', 24),
(29, '/storage/product/1/SGZiry4Ukz7JxxjT9xlt.webp', '2023-12-14 11:21:47', '2023-12-14 11:21:47', '_0000__.webp', 24),
(30, '/storage/product/1/HPDppPsME7Y5NbrMHamW.webp', '2023-12-14 11:24:40', '2023-12-14 11:24:40', 'kz_zsn_pro_x_3.webp', 25),
(31, '/storage/product/1/J0A9VNZNl6RF7THJz2RJ.webp', '2023-12-14 11:24:40', '2023-12-14 11:24:40', 'kz_zsn_pro_x_6.webp', 25),
(32, '/storage/product/1/tDbOtfbFATlY51T1c8ij.webp', '2023-12-14 11:25:30', '2023-12-14 11:25:30', 'sony_mdr_e9lp_3.webp', 26),
(33, '/storage/product/1/hM1AYUm7mX5zTyOo5GI4.webp', '2023-12-14 11:25:30', '2023-12-14 11:25:30', 'sony_mdr_e9lp_2.webp', 26),
(34, '/storage/product/1/01SUf7FqVcM1LTMN7ILY.webp', '2023-12-14 11:27:12', '2023-12-14 11:27:12', 'tai-nghe-earpods-apple-md827fea-trang-5-200x200.webp', 27),
(35, '/storage/product/1/29ru4tll9IL4G0XpPEN7.webp', '2023-12-14 11:27:12', '2023-12-14 11:27:12', 'tai-nghe-earpods-apple-md827fea-trang-4-200x200.webp', 27),
(36, '/storage/product/1/jZMzLjDngvbb6PbP6dLd.webp', '2023-12-14 11:28:46', '2023-12-14 11:28:46', 'tai-nghe-earpods-cong-lightning-apple-mmtn2-trang-11.jpg-200x200.webp', 28),
(37, '/storage/product/1/V6PmD66qy4QHKpJswL0v.webp', '2023-12-14 11:28:46', '2023-12-14 11:28:46', 'tai-nghe-earpods-cong-lightning-apple-mmtn2-44-200x200.webp', 28),
(38, '/storage/product/1/HTqPa0z5WfApWCzP4lmZ.webp', '2023-12-14 11:52:02', '2023-12-14 11:52:02', 'edifier_w820nb_6.webp', 29),
(39, '/storage/product/1/9I657EA3vBI8WLp23T6d.webp', '2023-12-14 11:52:02', '2023-12-14 11:52:02', 'edifier_w820nb_7.webp', 29),
(40, '/storage/product/1/mokT00IHb76udux14vgx.webp', '2023-12-14 11:52:02', '2023-12-14 11:52:02', 'edifier_w820nb_1.webp', 29),
(41, '/storage/product/1/bdphvJzsqvWjC4INKt52.webp', '2023-12-14 11:52:02', '2023-12-14 11:52:02', 'edifier_w820nb_2.webp', 29),
(42, '/storage/product/1/LDbRBj5A6NC4BhwTRMBo.webp', '2023-12-14 11:52:50', '2023-12-14 11:52:50', 'tai-nghe-chup-tai-jbl-tune-520bt_1_.webp', 30),
(43, '/storage/product/1/zxDCN6ZJXEUFiGCHC8U8.webp', '2023-12-14 11:52:50', '2023-12-14 11:52:50', 'tai-nghe-chup-tai-jbl-tune-520bt_3_.webp', 30),
(44, '/storage/product/1/kmhEJ3FZHymOd8a2uEl9.webp', '2023-12-14 11:52:50', '2023-12-14 11:52:50', 'tai-nghe-chup-tai-jbl-tune-520bt_4_.webp', 30),
(45, '/storage/product/1/vEHhMxaOcIapZfjus0zP.webp', '2023-12-14 11:53:34', '2023-12-14 11:53:34', 'tai-nghe-chup-tai-marshall-major-4_4_.webp', 31),
(46, '/storage/product/1/NjnZBmMNjDixnocBTDox.webp', '2023-12-14 11:53:34', '2023-12-14 11:53:34', 'tai-nghe-chup-tai-marshall-major-4_13_.webp', 31),
(47, '/storage/product/1/x46sZS1UTVcjrNpIRXau.webp', '2023-12-14 11:53:34', '2023-12-14 11:53:34', 'tai-nghe-chup-tai-marshall-major-4_15_.webp', 31),
(48, '/storage/product/1/4O4PuYSR68dfaxokyj0O.webp', '2023-12-14 11:53:34', '2023-12-14 11:53:34', 'tai-nghe-chup-tai-marshall-major-4_17__1.webp', 31),
(49, '/storage/product/1/Qx45YmJvnMbIwSTVBJHb.webp', '2023-12-14 11:54:39', '2023-12-14 11:54:39', 'tai-nghe-chup-tai-sennheiser-momentum-4_8_.webp', 32),
(50, '/storage/product/1/Y5UhSkgYEhV2B5adSrrd.webp', '2023-12-14 11:54:39', '2023-12-14 11:54:39', 'tai-nghe-chup-tai-sennheiser-momentum-4.webp', 32),
(51, '/storage/product/1/cb5vbwekyFAk3rEW3s8a.webp', '2023-12-14 11:54:39', '2023-12-14 11:54:39', 'tai-nghe-chup-tai-sennheiser-momentum-4_3_.webp', 32),
(52, '/storage/product/1/IJ1JwyTdRK7sfMgRy1nB.webp', '2023-12-14 11:55:36', '2023-12-14 11:55:36', 'tai-nghe-chup-tai-sony-wh-1000xm4-ksp_1_.webp', 33),
(53, '/storage/product/1/VP7DmFikSCXKvgCAu8J7.webp', '2023-12-14 11:55:36', '2023-12-14 11:55:36', 'sony_wh-1000xm4_4.webp', 33),
(54, '/storage/product/1/4bxYUEzTKzijp0agamNv.webp', '2023-12-14 11:55:36', '2023-12-14 11:55:36', 'sony_wh-1000xm4_5.webp', 33),
(55, '/storage/product/1/7jrhBp3MtHeZggNXxLL9.webp', '2023-12-14 11:56:20', '2023-12-14 11:56:20', 'tai-nghe-chup-tai-sony-wh-1000xm5-ksp_1.webp', 34),
(56, '/storage/product/1/yI5PSINrPKSn9X81f88m.webp', '2023-12-14 11:56:20', '2023-12-14 11:56:20', 'tai-nghe-chup-tai-sony-wh-1000xm5-1.webp', 34),
(57, '/storage/product/1/i85av6Zs4AYoFzTwXIyR.webp', '2023-12-14 11:56:20', '2023-12-14 11:56:20', 'tai-nghe-chup-tai-sony-wh-1000xm5-3.webp', 34),
(58, '/storage/product/1/LaHALHYOyRsBvdhrIe5O.webp', '2023-12-14 11:57:03', '2023-12-14 11:57:03', 't_i_xu_ng_13__1_12.webp', 35),
(59, '/storage/product/1/Gdp07CCWB4PhuxCF6dHJ.webp', '2023-12-14 11:57:03', '2023-12-14 11:57:03', 't_i_xu_ng_17__1_10.webp', 35),
(60, '/storage/product/1/HhGrh7XXD1FxVa1pVanz.webp', '2023-12-14 11:57:03', '2023-12-14 11:57:03', '_edifier_qd35_2.webp', 35),
(61, '/storage/product/1/QRuIXvjz9uyqjzKuvF4r.webp', '2023-12-14 11:57:49', '2023-12-14 11:57:49', 'loa-jbl-authentics-200_6_.webp', 36),
(62, '/storage/product/1/J8yKxIBbqjge24eT65qj.webp', '2023-12-14 11:57:49', '2023-12-14 11:57:49', 'loa-jbl-authentics-200_11_.webp', 36),
(63, '/storage/product/1/ou8CTABzxAGNFTcS4HOV.webp', '2023-12-14 11:57:49', '2023-12-14 11:57:49', 'loa-jbl-authentics-200-ksp.webp', 36),
(64, '/storage/product/1/X4HdPUAWUS6kID3EK9MA.webp', '2023-12-14 11:58:37', '2023-12-14 11:58:37', 'loa-jbl-authentics-500-ksp.webp', 37),
(65, '/storage/product/1/QaxvcV2ZzF4dq1z5a13H.webp', '2023-12-14 11:58:37', '2023-12-14 11:58:37', 'loa-jbl-authentics-500_2_.webp', 37),
(66, '/storage/product/1/VCWqqVlCHUcqO8UuiJlR.webp', '2023-12-14 11:58:37', '2023-12-14 11:58:37', 'loa-jbl-authentics-500_9_.webp', 37),
(67, '/storage/product/1/5W6zlwo8GLePICfgB7It.webp', '2023-12-14 11:59:12', '2023-12-14 11:59:12', 'loa-bluetooth-jbl-charge-5-ksp.webp', 38),
(68, '/storage/product/1/xow6eSoXRYFRSonzOvVw.webp', '2023-12-14 11:59:12', '2023-12-14 11:59:12', 'loa-bluetooth-jbl-charge-5_1_1.webp', 38),
(69, '/storage/product/1/Wp0qx7s2HukyEIZwukAR.webp', '2023-12-14 11:59:12', '2023-12-14 11:59:12', 'loa-bluetooth-jbl-charge-5-7_1.webp', 38),
(70, '/storage/product/1/XREbtqbhRyRaqQRTvmQt.webp', '2023-12-14 12:00:31', '2023-12-14 12:00:31', 'loa-bluetooth-jbl-flip-6-ksp.webp', 39),
(71, '/storage/product/1/mvAuhZJi5jMsrOGBRNxB.webp', '2023-12-14 12:00:31', '2023-12-14 12:00:31', 'jbl_flip_6_5.webp', 39),
(72, '/storage/product/1/H02QBjWWeUjZRb8oDN9j.webp', '2023-12-14 12:00:31', '2023-12-14 12:00:31', 'jbl_flip_6_7.webp', 39),
(73, '/storage/product/1/4E0a919T2xpB9X4SNX4y.webp', '2023-12-14 12:01:11', '2023-12-14 12:01:11', 'loa-jbl-partybox-on-the-go-2.webp', 40),
(74, '/storage/product/1/Cl1TRn2JuxR5G2tKaNcJ.webp', '2023-12-14 12:01:11', '2023-12-14 12:01:11', 'loa-jbl-partybox-on-the-go-1.webp', 40),
(75, '/storage/product/1/SjtCx31onesra5O7aPyb.webp', '2023-12-14 12:02:00', '2023-12-14 12:02:00', 'tai-nghe-khong-day-huawei-freebuds-se-2-ksp.webp', 41),
(76, '/storage/product/1/pwnaQUISb1ZkmDgllnoC.webp', '2023-12-14 12:02:00', '2023-12-14 12:02:00', 'tai-nghe-khong-day-huawei-freebuds-se-2_1__1.webp', 41),
(77, '/storage/product/1/MlBE7AnuCVHHs2ZFUguT.webp', '2023-12-14 12:02:00', '2023-12-14 12:02:00', 'tai-nghe-khong-day-huawei-freebuds-se-2_6_.webp', 41),
(78, '/storage/product/1/HNbuCgkZdvpsOHHF1tO5.webp', '2023-12-14 12:03:28', '2023-12-14 12:03:28', 'tai-nghe-bluetooth-marshall-minor-3-ksp.webp', 43),
(79, '/storage/product/1/Gpbk2d9eFWfP9Z3Dqrbe.webp', '2023-12-14 12:03:28', '2023-12-14 12:03:28', 'tai-nghe-bluetooth-marshall-minor-3_1.webp', 43),
(80, '/storage/product/1/iFlPKCWOVXos6Aom4J7p.webp', '2023-12-14 12:03:51', '2023-12-14 12:03:51', 'tai-nghe-khong-day-jbl-wave-beam_6_.webp', 42),
(81, '/storage/product/1/1gNxBEKCUdPoW1J6H9oh.webp', '2023-12-14 12:03:51', '2023-12-14 12:03:51', 'tai-nghe-khong-day-jbl-wave-beam_2_.webp', 42),
(85, '/storage/product/1/xzTsuRK8YpiHqQJPVak1.webp', '2023-12-14 12:05:42', '2023-12-14 12:05:42', 'tai-nghe-khong-day-sony-wf-c500-ksp.webp', 45),
(86, '/storage/product/1/H3i717meIWx9pBsGAoVt.webp', '2023-12-14 12:05:42', '2023-12-14 12:05:42', '3_a_su_a.webp', 45),
(87, '/storage/product/1/Xzu0UHWQRllIPY6EVGoj.webp', '2023-12-14 12:05:42', '2023-12-14 12:05:42', '17_9_3.webp', 45),
(88, '/storage/product/1/DsVtjETkYSWhKBaneoiC.webp', '2023-12-14 22:54:47', '2023-12-14 22:54:47', 'tai-nghe-khong-day-soundpeats-capsule-3-pro-transparent_5_.webp', 46),
(89, '/storage/product/1/U5IK071D2igxgj7uIPXn.webp', '2023-12-14 22:54:47', '2023-12-14 22:54:47', 'tai-nghe-khong-day-soundpeats-capsule-3-pro-transparent_11_.webp', 46),
(90, '/storage/product/1/bj2OkzejWSAwfEK0WzFz.webp', '2023-12-14 22:54:47', '2023-12-14 22:54:47', 'tai-nghe-khong-day-soundpeats-capsule-3-pro-transparent_12_.webp', 46),
(94, '/storage/product/1/RUUCe2PONELoeRm7LZnq.jpg', '2024-02-11 11:55:36', '2024-02-11 11:55:36', 'En_nGkuVgAI1JrE.jpg', 44),
(95, '/storage/product/1/g00xBU5eBQE9mHscAzWP.webp', '2024-02-11 11:55:36', '2024-02-11 11:55:36', 'sticker.webp', 44),
(96, '/storage/product/1/1IVxYKiK0DzFc10QZseQ.webp', '2024-02-11 11:55:36', '2024-02-11 11:55:36', 'sticker1.webp', 44);

-- --------------------------------------------------------

--
-- Table structure for table `product_sale`
--

CREATE TABLE `product_sale` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `flashsale_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price_after_discount` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `discount_type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sale`
--

INSERT INTO `product_sale` (`id`, `product_id`, `flashsale_id`, `created_at`, `updated_at`, `price_after_discount`, `quantity`, `discount_type`, `discount`) VALUES
(38, 17, 45, '2024-02-12 11:13:43', '2024-02-12 11:13:43', 105600, 1, 'percent', 12),
(39, 18, 45, '2024-02-12 11:13:44', '2024-02-12 11:13:44', 2267100, 1, 'percent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(6, 17, 6, '2023-12-07 10:14:33', '2023-12-07 10:14:33'),
(7, 18, 7, '2023-12-07 10:18:14', '2023-12-07 10:18:14'),
(9, 44, 9, '2024-02-11 12:08:01', '2024-02-11 12:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint DEFAULT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`id`, `created_at`, `updated_at`, `name`, `address`, `phone`, `email`, `note`, `store_id`, `warehouse_id`) VALUES
(1, NULL, NULL, 'rec_test', 'ádasd', '323423', 'sdgdf', 'sdbf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Quản tri hệ thống', NULL, '2023-11-14 13:05:23'),
(2, 'guest', 'Khách hàng', NULL, '2023-11-14 13:04:59'),
(3, 'developer', 'Phat trien he thong', NULL, NULL),
(4, 'content', 'Chinh sua content', NULL, NULL),
(5, 'Koneko', '234234', '2023-11-14 10:22:52', '2023-11-14 10:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, NULL, NULL),
(5, 4, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 1, 3, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 2, NULL, NULL),
(11, 11, 2, NULL, NULL),
(12, 12, 2, NULL, NULL),
(15, 15, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `config_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Text',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `config_key`, `config_value`, `type`, `deleted_at`) VALUES
(3, '2023-11-11 13:18:00', '2023-11-11 13:27:30', '3', 'Hi1', NULL, NULL),
(4, '2023-11-11 13:18:37', '2023-11-12 12:51:08', '4', 'Test', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `created_at`, `updated_at`, `name`, `description`, `image_path`, `image_name`, `deleted_at`, `active`) VALUES
(5, '2024-02-03 12:49:53', '2024-02-03 12:53:36', 'Koneko', '234234', '/storage/slider/1/qAEQy9sFBTQ3pfQ16lmo.jpg', '85797661_p0_master1200.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_products`
--

CREATE TABLE `store_products` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `store_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` bigint UNSIGNED NOT NULL,
  `store_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `store_id`, `created_at`, `updated_at`, `name`, `email`, `phone`, `address`, `warehouse_id`) VALUES
(1, NULL, NULL, NULL, 'Test_sp', 'ứdf', '123123', '5345', 1),
(2, NULL, NULL, NULL, 'old_prvd', 'ư', 'ư', 'ư', NULL),
(3, NULL, '2024-05-01 10:35:39', '2024-05-01 10:35:39', 'qưeqwe', 'ádasd', 'ádasd', 'ádasd', NULL),
(4, NULL, '2024-05-01 10:42:23', '2024-05-01 10:42:23', 'ádasd', 'đ', 'qư', 'ff', NULL),
(5, NULL, '2024-05-01 10:43:31', '2024-05-01 10:43:31', 'ádasd', 'ádasd', 'ádasd', 'ádasd', NULL),
(6, NULL, '2024-05-01 10:45:10', '2024-05-01 10:45:10', 'huy', '1', '1', '1', NULL),
(7, NULL, '2024-05-01 12:04:28', '2024-05-01 12:04:28', '12', '555', '34', '55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'vhbd', '2023-11-05 11:35:52', '2023-11-05 11:35:52'),
(2, 'nhvios', '2023-11-05 11:35:52', '2023-11-05 11:35:52'),
(3, '2', '2023-11-06 12:12:26', '2023-11-06 12:12:26'),
(4, '123', '2023-11-06 12:12:26', '2023-11-06 12:12:26'),
(5, '12312', '2023-11-06 12:12:44', '2023-11-06 12:12:44'),
(6, 'airpod', '2023-12-07 10:14:33', '2023-12-07 10:14:33'),
(7, 'jbl', '2023-12-07 10:18:14', '2023-12-07 10:18:14'),
(8, 'bvnbn', '2023-12-14 07:14:54', '2023-12-14 07:14:54'),
(9, 'hello', '2024-02-11 12:08:01', '2024-02-11 12:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `phone`, `address`, `first_name`, `last_name`) VALUES
(1, 'trần ngọc huy', 'huycoixvb@gmail.com', '2024-01-23 06:07:37', '$2y$12$nXtCoF2W9UhUlw/2Fp9tQ.52W9T5KD5gdaZ8XL/KcG3XA2crtO7Ci', 'h0R1YMfccfkG9rsn8rvUYT7jTnM43gogUWCXXfnI2RzGqyNKQs7G98tzhGwd', NULL, '2024-01-23 12:43:58', NULL, '0386239871', 'Tỉnh Lai Châu/Thành phố Lai Châu/Phường Tân Phong/345', NULL, NULL),
(4, 'Koneko', '2@gmail.com', NULL, '$2y$10$X7QnwWFTxOPVuDus6KeDaOhv.U7jL8nmav.RH8xHxJy9q.Ik.EmR6', NULL, '2023-11-16 13:13:41', '2023-11-16 13:13:41', NULL, NULL, NULL, NULL, NULL),
(5, 'Koneko111', 'huycoix22332vb@gmail.com', NULL, '$2y$12$mtEk77oerRlhgvRtXKYt3uISEG778wM6QRz1/BNT3gZaTXKzRz3oG', NULL, '2023-11-28 13:44:20', '2023-11-28 13:44:20', NULL, NULL, NULL, NULL, NULL),
(6, 'HUy111', 'duongthan2222h58441@gmail.com', NULL, '$2y$12$Ec7Uu9/xNJJX.8YUV.2neOJx9sp4W/e/j9v64pOkPsJ04JvcL.oBC', NULL, '2023-11-29 03:59:18', '2023-11-29 03:59:18', NULL, NULL, NULL, NULL, NULL),
(7, 'Vũ Hải Hà', '11@gmail.com', NULL, '$2y$12$vTGDjQSwwC0Cg0wv3x3hjeLy83/Z6fNpcWBT.lv5WP2eNrHGpGRN2', NULL, '2023-11-30 04:28:24', '2023-11-30 04:28:24', NULL, NULL, NULL, NULL, NULL),
(8, 'trần ngọc huy', 'hu2222ycoixvb@gmail.com', NULL, '$2y$12$OVN5zGfyY/sny/C5jk6SCu446jcmhBbUJ2EU7HrbmSvbsnEWzAqli', NULL, '2023-11-30 04:39:44', '2023-11-30 04:39:44', NULL, NULL, NULL, NULL, NULL),
(9, 'trần ngọc', 'admin12@gmail.com', NULL, '$2y$12$PT/nQxE3YtI/IITT67j67.TnbNnFU3kp8ZtOnuYeFxR3DVfrlcqfC', NULL, '2023-12-06 12:46:32', '2023-12-06 12:46:32', NULL, NULL, NULL, NULL, NULL),
(10, 'huy', '1222222@gmail.com', NULL, '$2y$12$hHWfPIw.puGtkagcxShsbO1.rjx5jT1pQmP341hZEweferas6VIqG', NULL, '2023-12-06 12:59:02', '2023-12-06 12:59:02', NULL, NULL, NULL, NULL, NULL),
(11, 'Huy', 'juhbasuhduh@gmail.com', NULL, '$2y$12$VCDd9jiO0OeqQ7fkvt3PGusrAGSseGvKTdsX4yKE0Jc/oUPrH/KFC', NULL, '2023-12-14 07:04:16', '2023-12-14 07:04:16', NULL, NULL, NULL, NULL, NULL),
(12, 'hieu', 'hieu@gmail.com', NULL, '$2y$12$QWX1iIP7Tt8jpX0pIollM.LvfrWDPxFHtID2B8jNhU/rQS8yV082.', NULL, '2023-12-14 23:01:19', '2023-12-14 23:01:19', NULL, NULL, NULL, NULL, NULL),
(15, 'vuhaiha', 'duongthanh58441@gmail.com', '2024-01-23 06:07:37', '$2y$12$0wRRCrL.3o43.NIRuUXfQu5EtnBQln7DM3bWzZEyCX54w32g9juOO', NULL, '2024-01-23 05:57:14', '2024-01-23 06:07:37', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint UNSIGNED NOT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `address`, `manager_phone`, `created_at`, `updated_at`, `name`, `note`) VALUES
(1, 'Hà nội', '01281938', NULL, NULL, 'Kho Hn', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_goods_transactions`
--

CREATE TABLE `warehouse_goods_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_products`
--

CREATE TABLE `warehouse_products` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_products`
--

INSERT INTO `warehouse_products` (`id`, `created_at`, `updated_at`, `product_id`, `quantity`, `warehouse_id`) VALUES
(1, NULL, NULL, 36, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `export`
--
ALTER TABLE `export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `export_receiver_id_foreign` (`receiver_id`),
  ADD KEY `export_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `export_products`
--
ALTER TABLE `export_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `export_products_product_id_foreign` (`product_id`),
  ADD KEY `export_products_export_id_foreign` (`export_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_supplier_id_foreign` (`supplier_id`),
  ADD KEY `import_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `import_products`
--
ALTER TABLE `import_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_products_product_id_foreign` (`product_id`),
  ADD KEY `import_products_import_id_foreign` (`import_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_code` (`key_code`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `feature_image_path` (`feature_image_path`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `product_sale_flashsale_id_foreign` (`flashsale_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_product_id_foreign` (`product_id`),
  ADD KEY `product_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_products`
--
ALTER TABLE `store_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_products_product_id_foreign` (`product_id`),
  ADD KEY `store_products_store_id_foreign` (`store_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_goods_transactions`
--
ALTER TABLE `warehouse_goods_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_products`
--
ALTER TABLE `warehouse_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_products_product_id_foreign` (`product_id`),
  ADD KEY `warehouse_products_warehouse_id_foreign` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `export`
--
ALTER TABLE `export`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `export_products`
--
ALTER TABLE `export_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `import`
--
ALTER TABLE `import`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `import_products`
--
ALTER TABLE `import_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `product_sale`
--
ALTER TABLE `product_sale`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_products`
--
ALTER TABLE `store_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouse_goods_transactions`
--
ALTER TABLE `warehouse_goods_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_products`
--
ALTER TABLE `warehouse_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `export`
--
ALTER TABLE `export`
  ADD CONSTRAINT `export_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `receiver` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `export_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`);

--
-- Constraints for table `export_products`
--
ALTER TABLE `export_products`
  ADD CONSTRAINT `export_products_export_id_foreign` FOREIGN KEY (`export_id`) REFERENCES `export` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `export_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `import`
--
ALTER TABLE `import`
  ADD CONSTRAINT `import_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `import_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`);

--
-- Constraints for table `import_products`
--
ALTER TABLE `import_products`
  ADD CONSTRAINT `import_products_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `import` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `import_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sale`
--
ALTER TABLE `product_sale`
  ADD CONSTRAINT `product_sale_flashsale_id_foreign` FOREIGN KEY (`flashsale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_sale_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_products`
--
ALTER TABLE `store_products`
  ADD CONSTRAINT `store_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `store_products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse_products`
--
ALTER TABLE `warehouse_products`
  ADD CONSTRAINT `warehouse_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warehouse_products_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
