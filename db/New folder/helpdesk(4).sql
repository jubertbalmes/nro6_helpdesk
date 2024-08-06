-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2022 at 11:35 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `orig_file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Unable to signin to NEDA WIFI', 'Unable to signin to NEDA WIFI', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(2, 'No internet connection', 'No internet connection', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(3, 'Unable to receive email', 'Unable to receive email', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(4, 'dsfds', 'dfdsf', '2022-05-19 01:33:19', '2022-05-19 01:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 16, 1, '09485789937', '2022-05-04 08:35:10', '2022-05-04 08:35:10'),
(2, 17, 1, '09485789837', '2022-05-04 08:38:41', '2022-05-04 08:38:41'),
(3, 18, 1, '09485799937', '2022-05-04 08:44:04', '2022-05-04 08:44:04'),
(4, 19, 1, '09089691212', '2022-05-04 08:48:56', '2022-05-04 08:48:56'),
(5, 4, 1, '09999999999', '2022-05-04 12:29:47', '2022-05-04 12:29:47'),
(6, 4, 4, 'jtdoe@gmail.com', '2022-05-04 12:39:16', '2022-05-04 12:39:16'),
(7, 4, 2, '042-76492', '2022-05-04 13:20:01', '2022-05-04 13:20:01'),
(11, 28, 1, '09089219612', '2022-05-12 08:41:30', '2022-05-12 08:41:30'),
(12, 28, 2, '084515622', '2022-05-12 08:41:30', '2022-05-12 08:41:30'),
(13, 28, 4, 'testuser1@gmail.com', '2022-05-12 08:41:30', '2022-05-12 08:41:30'),
(14, 29, 1, '7', '2022-05-13 00:20:07', '2022-05-13 00:20:07'),
(15, 30, 1, '7', '2022-05-13 00:21:31', '2022-05-13 00:21:31'),
(16, 31, 1, '7', '2022-05-13 00:24:05', '2022-05-13 00:24:05'),
(17, 32, 1, '7', '2022-05-13 00:25:00', '2022-05-13 00:25:00'),
(18, 33, 1, '7', '2022-05-13 00:26:19', '2022-05-13 00:26:19'),
(19, 34, 1, '7', '2022-05-13 00:41:34', '2022-05-13 00:41:34'),
(20, 35, 1, '09089219612', '2022-05-16 06:29:02', '2022-05-16 06:29:02'),
(36, 3, 1, '09089212196', '2022-05-16 07:11:14', '2022-05-16 07:11:14'),
(37, 3, 2, '01012132132', '2022-05-16 07:11:14', '2022-05-16 07:11:14'),
(38, 3, 4, 'dummy113@gmail.com', '2022-05-16 07:11:14', '2022-05-16 07:11:14'),
(48, 36, 1, '2134d', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(49, 36, 2, '234234d', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(50, 36, 4, 'rolandojarabata1121@gmail.com', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(51, 37, 1, '09089219612', '2022-05-19 02:03:23', '2022-05-19 02:03:23'),
(52, 5, 1, '639089219612', '2022-06-24 08:44:46', '2022-06-24 08:44:46'),
(53, 5, 2, '0123456789', '2022-06-24 08:44:46', '2022-06-24 08:44:46'),
(54, 5, 4, 'Rolandojarabata11@gmail.com', '2022-06-24 08:44:46', '2022-06-24 08:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `priority` int(1) DEFAULT 1,
  `description` text DEFAULT NULL,
  `steps_to_replicate` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `resolver_id` int(11) DEFAULT NULL,
  `assigned_by_system` int(1) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `rejected_id` int(11) DEFAULT NULL,
  `reason_for_rejection` text DEFAULT NULL,
  `reason_for_reopen` text DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `remarks_creator` text DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `user_id`, `category_id`, `priority`, `description`, `steps_to_replicate`, `status`, `resolver_id`, `assigned_by_system`, `remarks`, `rejected_id`, `reason_for_rejection`, `reason_for_reopen`, `rating`, `remarks_creator`, `started_at`, `created_at`, `updated_at`) VALUES
(30, 5, 1, 1, '1', '1', 5, 4, NULL, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal\r\n\r\nlast\r\n\r\neto parin?', NULL, NULL, 'may error pa rin 2x\r\n\r\npromise may error pa rin 2x', 1, 'Konting bilis pa', '2022-05-19 05:22:57', '2022-05-13 06:19:14', '2022-06-24 09:13:23'),
(31, 5, 1, 1, 'Testing ng walang steps to rep', NULL, 4, 4, NULL, 'sdfdsf', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 07:03:19', '2022-05-19 03:03:19'),
(32, 5, 1, 1, 'test2', NULL, 5, 4, NULL, NULL, NULL, NULL, NULL, 4, 'ok naman', NULL, '2022-05-16 05:20:06', '2022-05-17 08:14:49'),
(33, 5, 1, 2, '1234', NULL, 4, 4, NULL, 'dsfdsfdsf', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:07:09', '2022-05-16 05:37:33', '2022-05-19 03:11:40'),
(34, 5, 1, 1, 'asdsad', NULL, 4, 4, NULL, 'sdsads', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:17:45', '2022-05-16 05:39:14', '2022-05-19 03:21:32'),
(35, 5, 1, 2, 'fgfdg', NULL, 4, 4, NULL, 'sdasdsa', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:34:09', '2022-05-16 06:22:25', '2022-05-19 03:40:01'),
(36, 5, 1, 2, 'asdsad', NULL, 4, 4, NULL, 'asdsad', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:41:25', '2022-05-16 06:26:59', '2022-05-19 03:46:14'),
(37, 5, 1, 1, 'sdfdsf', NULL, 4, 4, NULL, 'dfsdfdsf', NULL, NULL, NULL, NULL, NULL, '2022-05-19 05:03:36', '2022-05-17 08:01:43', '2022-05-19 05:08:35'),
(38, 19, 1, 2, 'dsfdsf', NULL, 4, 4, NULL, 'cgbnbn', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:30:15', '2022-05-19 06:30:15', '2022-05-19 06:30:59'),
(39, 6, 1, 2, 'sdfdsf', NULL, 4, 4, NULL, 'sadsad', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:36:21', '2022-05-19 06:36:21', '2022-05-19 06:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_tag`
--

CREATE TABLE `item_tag` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_user`
--

CREATE TABLE `message_user` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_01_15_100000_create_roles_table', 1),
(3, '2019_01_15_110000_create_users_table', 1),
(4, '2019_01_17_121504_create_categories_table', 1),
(5, '2019_01_21_130422_create_tags_table', 1),
(6, '2019_01_21_163402_create_items_table', 1),
(7, '2019_01_21_163414_create_item_tag_table', 1),
(8, '2019_03_06_132557_add_photo_column_to_users_table', 1),
(9, '2019_03_06_143255_add_fields_to_items_table', 1),
(10, '2019_03_20_090438_add_color_tags_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `position` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Accountant I', '2022-04-18 00:40:04', '2022-04-25 06:56:04'),
(2, 'Accountant II', '2022-04-25 06:42:58', '2022-04-25 06:42:58'),
(4, 'Accountant III', '2022-04-25 07:02:23', '2022-04-25 07:02:23'),
(5, 'sdfdfdsf', '2022-04-29 01:36:02', '2022-04-29 01:36:02'),
(6, 'tae', '2022-04-29 01:36:08', '2022-04-29 01:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `projectlogs`
--

CREATE TABLE `projectlogs` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectlogs`
--

INSERT INTO `projectlogs` (`id`, `issue_id`, `user_id`, `role_id`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(49, 30, 5, 3, 1, NULL, '2022-05-13 06:19:18', '2022-05-13 06:19:18'),
(50, 30, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-13 06:19:53', '2022-05-13 06:19:53'),
(51, 30, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-13 06:20:26', '2022-05-13 06:20:26'),
(52, 30, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-13 06:20:50', '2022-05-13 06:20:50'),
(53, 30, 4, 2, 4, 'basta', '2022-05-13 06:21:18', '2022-05-13 06:21:18'),
(54, 30, 5, 3, 7, 'may error pa rin', '2022-05-13 06:22:52', '2022-05-13 06:22:52'),
(55, 30, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-13 06:27:39', '2022-05-13 06:27:39'),
(56, 30, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-13 06:27:46', '2022-05-13 06:27:46'),
(57, 30, 29, 2, 4, 'basta\r\n\r\nnew basta', '2022-05-13 06:32:08', '2022-05-13 06:32:08'),
(58, 30, 5, 3, 7, 'may error pa rin 2x', '2022-05-13 06:32:50', '2022-05-13 06:32:50'),
(59, 30, 3, 1, 7, 'rolandojarabata11-Tech', '2022-05-13 06:33:32', '2022-05-13 06:33:32'),
(60, 30, 4, 2, 4, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit', '2022-05-13 06:34:50', '2022-05-13 06:34:50'),
(61, 30, 5, 3, 7, 'may error pa rin 2x\r\n\r\npromise may error pa rin', '2022-05-13 06:35:15', '2022-05-13 06:35:15'),
(62, 30, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-13 06:37:18', '2022-05-13 06:37:18'),
(63, 30, 29, 2, 4, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal', '2022-05-13 06:39:00', '2022-05-13 06:39:00'),
(64, 30, 5, 3, 7, 'may error pa rin 2x\r\n\r\npromise may error pa rin 2x', '2022-05-13 06:39:30', '2022-05-13 06:39:30'),
(65, 30, 3, 1, 0, 'rolandojarabata11-Tech', '2022-05-13 06:40:18', '2022-05-13 06:40:18'),
(66, 30, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-13 06:41:05', '2022-05-13 06:41:05'),
(67, 30, 3, 1, 3, 'rolandojarabata12-Tech', '2022-05-13 06:41:08', '2022-05-13 06:41:08'),
(68, 31, 5, 3, 1, NULL, '2022-05-13 07:03:23', '2022-05-13 07:03:23'),
(69, 30, 29, 2, 4, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal\r\n\r\nlast', '2022-05-13 07:05:24', '2022-05-13 07:05:24'),
(70, 30, 5, 3, 5, 'Rating: 4; Comments: Konting bilis pa', '2022-05-13 07:06:18', '2022-05-13 07:06:18'),
(71, 32, 5, 3, 1, NULL, '2022-05-16 05:20:12', '2022-05-16 05:20:12'),
(72, 33, 5, 3, 1, NULL, '2022-05-16 05:37:38', '2022-05-16 05:37:38'),
(73, 34, 5, 3, 1, NULL, '2022-05-16 05:39:17', '2022-05-16 05:39:17'),
(74, 35, 5, 3, 1, NULL, '2022-05-16 06:22:28', '2022-05-16 06:22:28'),
(75, 36, 5, 3, 1, NULL, '2022-05-16 06:27:03', '2022-05-16 06:27:03'),
(76, 31, 3, 1, 0, 'rolandojarabata11-Tech', '2022-05-16 06:41:51', '2022-05-16 06:41:51'),
(77, 31, 3, 1, 0, 'rolandojarabata12-Tech', '2022-05-16 06:45:03', '2022-05-16 06:45:03'),
(78, 30, 3, 1, 0, 'rolandojarabata11-Tech', '2022-05-16 06:47:33', '2022-05-16 06:47:33'),
(79, 31, 3, 1, 0, 'rolandojarabata11-Tech', '2022-05-16 06:49:26', '2022-05-16 06:49:26'),
(80, 37, 3, 1, 1, NULL, '2022-05-17 08:01:48', '2022-05-17 08:01:48'),
(81, 32, 3, 1, 5, 'Rating: 4; Comments: ok naman', '2022-05-17 08:14:53', '2022-05-17 08:14:53'),
(82, 30, 3, 1, 3, 'rolandojarabata11-Tech', '2022-05-19 02:17:15', '2022-05-19 02:17:15'),
(83, 30, 4, 2, 4, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal\r\n\r\nlast\r\n\r\neto parin?', '2022-05-19 02:33:35', '2022-05-19 02:33:35'),
(84, 31, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 03:00:29', '2022-05-19 03:00:29'),
(85, 31, 4, 2, 4, 'sdfdsf', '2022-05-19 03:03:24', '2022-05-19 03:03:24'),
(86, 33, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 03:07:15', '2022-05-19 03:07:15'),
(87, 33, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 03:10:56', '2022-05-19 03:10:56'),
(88, 33, 4, 2, 4, 'dsfdsfdsf', '2022-05-19 03:11:44', '2022-05-19 03:11:44'),
(89, 34, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 03:17:52', '2022-05-19 03:17:52'),
(90, 34, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 03:19:59', '2022-05-19 03:19:59'),
(91, 34, 4, 2, 4, 'sdsads', '2022-05-19 03:21:36', '2022-05-19 03:21:36'),
(92, 35, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 03:34:15', '2022-05-19 03:34:15'),
(93, 35, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 03:38:01', '2022-05-19 03:38:01'),
(94, 35, 4, 2, 4, 'sdasdsa', '2022-05-19 03:40:04', '2022-05-19 03:40:04'),
(95, 36, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 03:41:31', '2022-05-19 03:41:31'),
(96, 36, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 03:45:39', '2022-05-19 03:45:39'),
(97, 36, 4, 2, 4, 'asdsad', '2022-05-19 03:46:18', '2022-05-19 03:46:18'),
(98, 37, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 05:03:43', '2022-05-19 05:03:43'),
(99, 37, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 05:04:50', '2022-05-19 05:04:50'),
(100, 37, 4, 2, 4, 'dfsdfdsf', '2022-05-19 05:08:38', '2022-05-19 05:08:38'),
(101, 30, 3, 1, 1, NULL, '2022-05-19 05:09:47', '2022-05-19 05:09:47'),
(102, 30, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 05:23:04', '2022-05-19 05:23:04'),
(103, 30, 4, 2, 3, 'rolandojarabata11-Tech', '2022-05-19 05:27:43', '2022-05-19 05:27:43'),
(104, 30, 4, 2, 4, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal\r\n\r\nlast\r\n\r\neto parin?', '2022-05-19 06:12:47', '2022-05-19 06:12:47'),
(105, 38, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 06:30:20', '2022-05-19 06:30:20'),
(106, 38, 4, 2, 4, 'cgbnbn', '2022-05-19 06:31:02', '2022-05-19 06:31:02'),
(107, 39, 3, 1, 2, 'rolandojarabata11-Tech', '2022-05-19 06:36:24', '2022-05-19 06:36:24'),
(108, 39, 4, 2, 4, 'sadsad', '2022-05-19 06:36:42', '2022-05-19 06:36:42'),
(109, 30, 5, 3, 5, 'Rating: 1; Comments: Konting bilis pa', '2022-06-24 09:13:30', '2022-06-24 09:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'This is the administration roles', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
(2, 'Technician', 'This is the creator role', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
(3, 'Owner', 'This is the member role', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
(4, 'HOD', 'This is the helpdesk officer of the day', '2022-04-26 14:00:00', '2022-04-26 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `staff` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `staff`, `created_at`, `updated_at`) VALUES
(1, 'NEDA Secretariat', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(2, 'Office of the Secretary (OSEC)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(3, 'Office of the Undersecretaries and Assistant Secretaries', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(4, 'Internal Audit Service (IAS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(5, 'Financial, Planning and Management Staff (FPMS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(6, 'Legal Staff (LS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(7, 'Administrative Staff (AS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(8, 'Information and Communications Technology Staff (ICTS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(9, 'Development Information Staff (DIS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(10, 'Regional Development Staff (RDS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(11, 'Governance Staff (GOVS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(12, 'National Policy and Planning Staff (NPPS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(13, 'Agriculture, Natural Resources and Environment Staff (ANRES)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(14, 'Trade, Services and Industry Staff (TSIS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(15, 'Social Development Staff (SDS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(16, 'Monitoring and Evaluation Staff (MES)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(17, 'Infrastructure Staff (IS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(18, 'Public Investment Staff (PIS)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(19, 'Legislative Liaison Office (LLO)', '2022-04-11 08:09:10', '2022-04-11 08:09:10'),
(20, 'The Legislative-Executive Development Advisory Council (LEDAC) Secretariat', '2022-04-11 08:09:10', '2022-04-11 08:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Submitted', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(2, 'Assigned', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(3, 'Acknowledge/Ongoing', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(4, 'Resolved/Closed', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(5, 'Completed', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(6, 'Rejected', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(7, 'Reopened', '2022-04-18 00:40:04', '2022-04-18 00:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `techcounter`
--

CREATE TABLE `techcounter` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `techcounter`
--

INSERT INTO `techcounter` (`id`, `user_id`, `counter`) VALUES
(1, 4, 3),
(2, 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `staff` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, NULL, 'Rolando G. Jarabata', 'rgjarabata1@neda.gov.ph', '2022-04-18 00:40:32', '2ICTS-ISDD', 1, '$2y$10$7cCQoCYnZG9G62muKhp0ROhqv8RcBg.2hIsEwSDS7LmhAFp1N65M6', 'profile/GgAA1KLtjAO7dR9V8BAGbgcmooQKpYyhlqYVZGzF.png', 1, 1, NULL, '2022-04-18 00:40:04', '2022-05-16 07:17:16'),
(4, NULL, 'rolandojarabata11-Tech', 'rolandojarabata11@gmail.com', '2022-04-18 00:40:32', '2ANRES-ACD', 2, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 2, 1, NULL, '2022-04-18 00:40:04', '2022-05-19 00:38:49'),
(5, 668, 'rgjarabata-Owner', 'rgjarabata0@neda.gov.ph', '2022-04-18 00:40:32', '2ICTS-ISDD', 18, '$2y$10$tQQ8arpv/W9L4k89DqlYhe2gRHEL6H5mwiH/ZJW9w03yVmcIKUDDy', NULL, 3, 1, 'HxqCMWZmpuH47gnQ3b2Ppqi5EJteb5FZGPcuI2WEY1XcV2WktGwicf3Oaa1u', '2022-04-18 00:40:04', '2022-06-24 08:44:46'),
(6, NULL, 'Lorem T. Ipsum', 'marjoriedubria131@gmail.com', '2022-04-18 00:40:32', '2ICTS-ISDD', 1, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 3, 1, NULL, '2022-04-18 00:40:04', '2022-04-26 13:58:46'),
(14, NULL, 'HOD - Helpdesk of the day', 'rolandojarabata13@yahoo.com', '2022-04-26 14:41:14', '2ANRES-ACD', 2, '$2y$10$k6TtdwKbeBcduTdvdKqkbOF0QwxO26oa.cp79w.DnwAYGGdK1U0Zq', NULL, 4, 1, NULL, '2022-04-26 14:14:16', '2022-04-26 14:41:50'),
(19, NULL, 'Gipong Jarabata', 'rolandojarabata113@gmail.com', '2022-05-04 08:51:51', '2ICTS-ISDD', 43, '$2y$10$bMulog4gaAn2tHugoVtogOeG0yHWQlbyM7AkhNmzd6/OPIfNBUp9S', NULL, 3, 1, NULL, '2022-05-04 08:48:56', '2022-05-04 08:52:48'),
(28, NULL, 'Test User', 'testuser@gmail.com', '2022-05-12 08:41:30', '2ANRES-ACD', 19, '$2y$10$dXfUHC0bu0GKLCp39i5eP.jTaTK9h/ayMRJCdcww7cVlsYhHZT6Me', NULL, 3, 1, NULL, '2022-05-12 08:41:30', '2022-05-12 08:41:30'),
(29, NULL, 'rolandojarabata12-Tech', 'rolandojarabata12@gmail.com', '2022-04-18 00:40:32', '2ICTS-ISDD', 4, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 2, 1, NULL, '2022-04-18 00:40:04', '2022-05-19 01:19:09'),
(36, NULL, 'asd', 'rolandojarabata111@gmail.com', '2022-05-17 08:02:36', '2ANRES-ED', 16, '$2y$10$2.wdA59w1NHXTgwK.YdQ6.Lig02IgxovxMnFjtoAdLxsdF4f0yKp2', 'profile/uELNUQtYOmczpbscTGUe2Af2EHOopPoBsNOgedBZ.jpg', 4, 1, NULL, '2022-05-17 08:02:36', '2022-05-17 08:02:46'),
(2187, 1, 'DE LARA JENELYN', 'jldelara@neda.gov.ph', '2022-05-20 02:54:57', '3FPMS-AD', 110, '$2y$10$gOSeJiWbAzQBqFQh6IasuuLbjGBDis6W3QCz67umXeZWMciDLDWOi', NULL, 3, 1, NULL, '2022-05-20 02:54:57', '2022-05-20 02:54:57'),
(2188, 3, 'MARCO BRYAN', 'tomasmarco32@gmail.com', '2022-05-20 02:54:57', 'HRMD', 85, '$2y$10$Vjx4nc9zkSCV5gY2rBkOkOr4bvQ8h5zo95AMwVmglM5zRJmil1Phm', NULL, 3, 1, NULL, '2022-05-20 02:54:57', '2022-05-20 02:54:57'),
(2189, 81, 'GLOVA ALEXANDER', 'abglova@neda.gov.ph', '2022-05-20 02:54:57', 'SSD', 39, '$2y$10$vHV9W6y0mClGolxTN/s94e43Elxuua2.JeAK5Z6te1FyihyazK9IS', NULL, 3, 1, NULL, '2022-05-20 02:54:57', '2022-05-20 02:54:57'),
(2190, 83, 'MENDOZA JESECA MEY', 'jcmendoza@neda.gov.ph', '2022-05-20 02:54:57', 'TISD', 50, '$2y$10$n68Y7iyDnVqTzS863QPUfOS6nwRNSQ.eHWX28IQnH8rb9d77vW9Gu', NULL, 3, 1, NULL, '2022-05-20 02:54:57', '2022-05-20 02:54:57'),
(2191, 169, 'Miranda Janine', 'JHMiranda@neda.gov.ph', '2022-05-20 02:54:57', '3AS-AMD', 110, '$2y$10$NmoUpiLje4G6flPQircgJ.oXAB3uqxDRgTr8kF7gtca5ENAO4YDVu', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2192, 171, 'CUTIDIOC AXEL DAVE', 'ascutidioc@neda.gov.ph', '2022-05-20 02:54:58', 'HRMD', 85, '$2y$10$HdmWVtGBCtay5xYoHjnXbONRGvD24jWSgyyx7yxoFJxejXpi5FAqi', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2193, 372, 'JASMIN RACELI RODRIGUEZ', 'jasminrodriguez@gmail.com', '2022-05-20 02:54:58', 'SPID', 50, '$2y$10$ovtoaUOY7FBmXDmO2y.fBeVf8s6A15uOuSxgPBEY.ULpV65zz1Dkm', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2194, 7, 'MONZALES MARIA KRIS', 'MEMonzales@neda.gov.oh', '2022-05-20 02:54:58', 'ACD', 82, '$2y$10$Cp/pMHh2BoNxbdEWoVvX3OL6HzW4GhpHR.bbvo1E1YdDIsKnuO8tK', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2195, 58, 'SERVADO DAVID CARLOS', 'servadodavid@gmail.com', '2022-05-20 02:54:58', 'PFD-I', 51, '$2y$10$aBKt7udXHTUpTUfKQgm8oeaaglvkvcHCcJ2k98mit6SZ2Li8Ro4ue', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2196, 59, 'ARLENE SISON', 'enelra2003@yahoo.com', '2022-05-20 02:54:58', 'IED', 82, '$2y$10$UpgmMGnrEp3uV1Qef97M.OAOQu65pLLWUfa6z3ru0Fw8sEwwbSi/W', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2197, 92, 'TORILLOS RENZ', 'renz.torillos@gmail.com', '2022-05-20 02:54:58', 'ACD', 82, '$2y$10$dMdf0pQMxIMjILP8Lg05QOrqUZbg5LXGKhTgxGPfyKGIZIC3ieK7u', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2198, 94, 'TING DOMINIQUE YSOBEL', 'dpting@neda.gov.ph', '2022-05-20 02:54:58', 'IED', 51, '$2y$10$.NQ1P0qMBsDocJGY/k1rbuuu2kSgnyyP6/by5OGfqVZgAoEoocv2y', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2199, 128, 'CENTENO DESIREE JOY', 'dgcenteno@neda.gov.ph', '2022-05-20 02:54:58', 'AD', 17, '$2y$10$lu1.pDh9TIlt3zxSDKQ6Nubetl2QWk6S1nydxOt16F6bQGaC2QWU2', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2200, 129, 'DAVID FAUSTINO DE CASTRO', 'daustin.decastro@yahoo.com', '2022-05-20 02:54:58', 'PRD', 61, '$2y$10$HLIhDAL3fpdN2.N7OmnG.eOzBOY/vOVgxze3HZYQc4mW0m2mQXteS', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2201, 159, 'MA. GLORIA DALUDDUNG', 'MLDaladdung@neda.gov.ph', '2022-05-20 02:54:58', 'TISD', 82, '$2y$10$GT8bFeKtdqAk06u2wuWV8eWpHP4TUPOdiBmDhbEtzILcD11/7xX4K', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2202, 167, 'MARCELO TEODORICO CAYOSA', 'marco_fernan08@yahoo.com.ph', '2022-05-20 02:54:58', 'NTISD', 50, '$2y$10$HndA4uAkgD0fg1Vwn8XdP.EBuDgU/2SRbXLqhN/NI9enLwMl02x9C', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2203, 168, 'ANNE MINNETTE DASTAS', 'apmdastas@gmail.com', '2022-05-20 02:54:58', 'PFD-III', 82, '$2y$10$p9XzIOIFotaMAylhWPVcae8WdIcNqm5llliHbusEy5vs/6h6Ztrvq', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2204, 188, 'ANGELINE JOY AQUINO', 'agaquino@neda.gov.ph', '2022-05-20 02:54:58', '3IS-WRD', 82, '$2y$10$4glNMO3Wy4jO2LJ8uU32OO.E8S633hs7ZzcYlZ.xpcSGc0ELiapyO', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2205, 198, 'MONTAÑEZ AILA MARIE', 'acmontanez@neda.gov.ph', '2022-05-20 02:54:58', 'PFD-III', 51, '$2y$10$H6PbccyVhRTuPiWUzoHr1.A7a1XYCT1dBh0OsP3NyRVduTgsdKSaG', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2206, 218, 'MARIANNA ANTONIA MARTINEZ', 'tanyadiaz_24@yahoo.com', '2022-05-20 02:54:58', 'MDD', 59, '$2y$10$wy97qnYX6Qsoz2g6dbKwl.enTunVVN9g2iCb5tc.RQws0zdhcMhd.', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2207, 223, 'ANA CHRISTINA CRUZ', 'AVCruz@neda.gov.ph', '2022-05-20 02:54:58', 'TD', 51, '$2y$10$3vvmqlWcqqeXJvPCuylt9OylH6KyrGuXCH.rRFQ2xDIXG97VksvTW', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2208, 235, 'JENNO RAVALO', 'jzravalo@nesa.gov.ph', '2022-05-20 02:54:58', 'ESDD', 50, '$2y$10$hSpTRCpwIsXm3H/pWPTfieB09P7uGyAEfXmgBSnv/L.a8JzFkEAJW', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2209, 248, 'LIM DENNIS', 'dalim@neda.gov.ph', '2022-05-20 02:54:58', 'ID', 84, '$2y$10$Tp.f6tUtsWdDa6vNnL5dvuMKwNl3BHGjhU89CZmMV.fT9YRLUrFu.', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2210, 253, 'CALABIA VIVIAN', 'vscalabia@neda.gov.ph', '2022-05-20 02:54:58', 'PMD', 30, '$2y$10$K8.0SkMLakrq9iV21.6icOoho/XAL1pyJwFUq4L4BlRcTYAl.ADI6', NULL, 3, 1, NULL, '2022-05-20 02:54:58', '2022-05-20 02:54:58'),
(2211, 258, 'GUIA THERESA EGUIA', 'guiatheresaeguia@gmail.com', '2022-05-20 02:54:58', 'ACD', 50, '$2y$10$Xd.77bxcxz4onXEw7MCehuKfbaIhVaWIU91t1HCrLgc7j54vpIjSG', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2212, 294, 'ALLAN GOLENG', 'acgoleng@neda.gov.ph', '2022-05-20 02:54:59', 'ED', 82, '$2y$10$0Mc0qdZcyP6MwPNq5.gly.JtpIhMD4Cdb84Za20/cs92vZDnER8pa', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2213, 322, 'LORETO NIKKA MAE', 'nploreto@neda.gov.ph', '2022-05-20 02:54:59', 'PFD-II', 82, '$2y$10$Id/OcCyoXUHHgabZhpGY1eL.9zlxFdm1Y70oAt2fkbwC.sFeCzKPO', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2214, 340, 'ARSA ANNA ROSALIE', 'arsa.annarosalie@gmail.com', '2022-05-20 02:54:59', 'LUPPD', 82, '$2y$10$wcf7alzZAyfBa/KRIl28UOBMNIvnmIZH3RiCQ24Y25wzxqUMv6YSy', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2215, 349, 'ELAINE TORRES', 'bautista_elainec@yahoo.com', '2022-05-20 02:54:59', '3NPPS-PCD', 84, '$2y$10$bnMXGjlsLWdYLbG9GavR5u21DSN4.d6ML5fmFxjEes4N4154iym2q', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2216, 360, 'JOSEPH MICHAEL PANGANIBAN', 'josepanganiban11@gmail.com', '2022-05-20 02:54:59', 'TD', 51, '$2y$10$vnHUhYygvHskMz8K2fmcKO0.OFO6Pt7XG3zEoPwLw4rOaS2zffO2u', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2217, 374, 'GILBERT OFINA', 'ofina.gilbert@yahoo.com', '2022-05-20 02:54:59', 'TRD', 82, '$2y$10$L5zkiYnnTw8SZXwvdaDosOH.zGrg2zdyiRoTO6rS4l/Nn3kcpDNFm', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2218, 375, 'LAURENCE MICHAEL TIBON', 'LBTibon@neda.gov.ph', '2022-05-20 02:54:59', 'PFD-II', 82, '$2y$10$.ONriLRCkirjTcV1zpxX3uGo4zIbhP95XlDyMb9c1aFjM8T56FrK6', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2219, 417, 'GLORMINA SHAREN OBIDA', 'shrndln@gmail.com', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$o5J4oFGQfrH3EorLrO587eDZJKibIwsMX1lV9LvSfjize7IINbmE2', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2220, 418, 'ANTIDO ERWIN KARL', 'eiantido@neda.gov.ph', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$ZDEtGQRikBWB24zx2jTwZeenbowSiwaquKClWeKOj/OXOxyzXT5.S', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2221, 420, 'BABELA ROMEO', 'rbbabela@neda.gov.ph', '2022-05-20 02:54:59', '3AS-AMD', 110, '$2y$10$vhaZ8B61KsFvUl.MGKDYc.vHc4dccbV/PO.0zFIjYg1IdQAfFMNnG', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2222, 422, 'CADA-O JUDY ANN', 'jdcada-o@neda.gov.ph', '2022-05-20 02:54:59', '3OUSEC-PPGasDIV', 110, '$2y$10$9NiRKOS/DrKryoSBV/Ad.ubRXK/YyL3WUGX5qyQ4RcN6veEW.PTNG', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2223, 423, 'CALAMAYA JOHN TERENZ', 'jdcalamaya@neda.gov.ph', '2022-05-20 02:54:59', '2FPMS-MD', 110, '$2y$10$kfzUyKOzTJ2S1nXCF8K0KOUdc3cnIMDgOHU2vjvesPJcj9E0t8Xo2', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2224, 424, 'MICHAEL TRISTAN CONCEPCION', 'concepcion_bja@yahoo.coom', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$7YbcRUlQ1Tu.xKUjdWvNeO9bdjixT/TTfy45dm8uOxeVE6CtkjplC', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2225, 426, 'DE GUZMAN WILMA', 'wilzyraph@gmail.com', '2022-05-20 02:54:59', '3AS-AMD', 21, '$2y$10$6wPO9CgPGJsuSJ/LDQcQfu.1/eWHWIlsRJKvmO2IC1t/jfKchBW.i', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2226, 427, 'MARPHIL DELA CRUZ', 'marphil.delacruz@yahoo.com.ph', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$e6PktHzSHMQxCrGPyGzUX.PSqoKJ2IBlJEM1pPNS5BlJe.yGo9nzK', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2227, 428, 'FONTARUM JOHN ALBERT', 'JFFontarum@neda.gov.ph', '2022-05-20 02:54:59', '3AS-AMD', 110, '$2y$10$Qr7P9gdkfHCzpxy3u.vHt.K.1ciizG11f.J41RKNMrHdVOS0ZpqZS', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2228, 434, 'NESTOR ROMERO', 'MSGTNESROMERO@GMAIL.COM', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$/oFywDK9jlSL8PfERJQN7.MMGS10vgMC6zRi1tSeP6iGVgmtjCI3O', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2229, 435, 'RUPAC KAREN PAULA', 'klrupac@neda.gov.ph', '2022-05-20 02:54:59', 'HRMD', 85, '$2y$10$W758mhB2EeqaaKbXzWsF5.XqyOlz44TiGHIxQhm.7Ek.oy17JXRIO', NULL, 3, 1, NULL, '2022-05-20 02:54:59', '2022-05-20 02:54:59'),
(2230, 436, 'Silvestre Winston', 'WBSilvestre@neda.gov.ph', '2022-05-20 02:54:59', '3OASEC-PPGasDIV', 110, '$2y$10$cRJBLGOrA/EVcZ06WhTo9OLojrWlP3AnIdBV6SqhIsa9N9DT9X.SG', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2231, 437, 'SOLOMON BENAIDA', 'BYSolomon@neda.gov.ph', '2022-05-20 02:55:00', '3PIS-PFD-I', 110, '$2y$10$XwfNGdoCH6sxgZMXU0WCou01OCnsUlN6orYQPu2sgNcP1U2.FPjk6', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2232, 438, 'TAMANI JERISH MARK', 'jrtamani@neda.gov.ph', '2022-05-20 02:55:00', '3AS-AMD', 110, '$2y$10$zLUjCFPrH1UnnJ4mZSgaC.nMdpppdGQlx22GvtPue91cC2WeKPnu.', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2233, 439, 'TEPACE RAMON', 'RDTepace@neda.gov.ph', '2022-05-20 02:55:00', '3LS-ILD', 110, '$2y$10$7XCeBr/wzEBTlkr7cyAGqO6OHB8GVjB1sxh3hRgSDkf.2dddZfdCy', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2234, 440, 'VITOR AGNES NICOLE', 'abvitor@neda.gov.ph', '2022-05-20 02:55:00', '3ICTS-IND', 110, '$2y$10$gvd67GyCkk2Za9QwPi24Re3zN8N..iirAQRdCC8znttrCzKr9kq5u', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2235, 447, 'CALDERON MARIA ELOISA', 'micalderon@neda.gov.ph', '2022-05-20 02:55:00', 'OD', 46, '$2y$10$EmOnLRqmOIvzYcMkzBLHnezT1lgvhXJj3uOrEKj8fxCtkP6quENhy', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2236, 449, 'RENO JOSEPH CANTRE', 'RNCantre@neda.gov.ph', '2022-05-20 02:55:00', 'ODG', 56, '$2y$10$h.Dmv.1MRksT0fZVSZBK9uBSj40dWDI8ngY6L1J7ZJrEZzkBL3Nua', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2237, 465, 'ROLANDO TUNGPALAN', 'rgtungpalan@neda.gov.ph', '2022-05-20 02:55:00', 'ODG', 45, '$2y$10$TxliIfbIgxFlpYElLoH5.uBYI/Re3er86KQ0LRUzZQ7ChJ2ho36Wu', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2238, 467, 'ADORACION NAVARRO', 'amnavarro@neda.gov.ph', '2022-05-20 02:55:00', 'ODG', 45, '$2y$10$rAY3kRAqBwiTmnHyb25HTuh5H6luzTNQysx8Q8WAbWUgVFcaZlPEy', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2239, 472, 'MATIBAG REDENTOR', 'rematibag@neda.gov.ph', '2022-05-20 02:55:00', 'RLIDD', 82, '$2y$10$z74objtgw96sVHuEGIQu9uJdwU0QDyhr76e8vhdjc3G4JiITQ2sKm', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2240, 477, 'PABLO MA. ISABEL ALEANDRA', 'mlpablo@neda.gov.ph', '2022-05-20 02:55:00', 'ODG', 55, '$2y$10$3EGdpmzDsczu2yzCLNgTYuOr5JWxpWjffO9qG.7UjPKSNfSazGbH2', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2241, 506, 'SADDI ALLAN ADRIAN', 'absaddi@neda.gov.ph', '2022-05-20 02:55:00', 'OD', 25, '$2y$10$QPLma7gThtO1hyxMPwNHX.XzRiyLlk4tIeQwsgZzaW3rCD3C1czgu', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2242, 509, 'CHARITY GAY RAMOS-GALACGAC', 'cergalacgac@neda.gov.ph', '2022-05-20 02:55:00', 'OD', 46, '$2y$10$UqTdHIi6ubonJ44DCj/GJe8QYejLB8x33681RNUeLpePvGSL9PF4C', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2243, 241, 'GOLDA CAINGLET', 'golda.cainglet@gmail.com', '2022-05-20 02:55:00', 'HHSD', 82, '$2y$10$9JJpBAgeO45CIlmqYYjANeh1KfwnsX3xf.KU0ktkS4SznHdXlkZ5m', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2244, 411, 'CATINZA RIZALINA', 'rpcatinza@neda.gov.ph', '2022-05-20 02:55:00', 'HRMD', 26, '$2y$10$hx50g0oCmgGdRioQcaa2euBvpdJrD9JoV1fHvfYba4QuII4uojzci', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2245, 184, 'DOMINGO JUDY ANN', 'jfdomingo@neda.gov.ph', '2022-05-20 02:55:00', 'MED', 51, '$2y$10$zvMTYKInoTcCwrE4Pb/XGuRiQjd5JErTFpK9dAOh0sSs56ZV1z5IG', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2246, 123, 'ESGUERRA GIVETTE KRISTINE', 'gyesguerra@neda.gov.ph', '2022-05-20 02:55:00', 'WRD', 51, '$2y$10$pUDmr1uKOfvesLZalDJogOBzdQzymCjw5YTJ2h5eWfnKPcjpt4YXe', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2247, 403, 'RICHARDS ALDEN', 'ANOBAGAGAWINKODITO@GMAIL.COM', '2022-05-20 02:55:00', 'LEDAC-DIVISION', 84, '$2y$10$yNxXBfRHcEKlIqzjU3q77e6nfhGu36jpttJj7oP6o0FJ3QzF428ci', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2248, 514, 'JOHN DOE', 'john.doe.neda@yopmail.com', '2022-05-20 02:55:00', 'ODG', 21, '$2y$10$JjU180.Hm/g90niLNPqRGO0dR/Eb4RZKx6Tb4cFX4FxqR6quikLCu', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2249, 518, 'MAURICE JOSEPH IGTIBEN', 'maurice.igtiben@gmail.com', '2022-05-20 02:55:00', 'OD', 26, '$2y$10$7AeVGltGRdxSwtX1th4bJeU7b20PBAieckNRGqReloFntpU03aHJC', NULL, 3, 1, NULL, '2022-05-20 02:55:00', '2022-05-20 02:55:00'),
(2250, 524, 'NELIA MERCADO', 'nel020264@gmail.com', '2022-05-20 02:55:00', 'MAD', 72, '$2y$10$ZpfTfDqTkjRZNXbBm.EnN.THloBY13OwIx0KgHTLArFIBd9ke1YNa', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2251, 529, 'REYES KRISTIAN', 'kdreyes@neda.gov.ph', '2022-05-20 02:55:01', 'OD', 24, '$2y$10$/ys0vKDbZPOGg8t2B2XASu2Zj.w9F2zvtVd4ID3ZuJ7sJS1ItDmfm', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2252, 564, 'TAOPO RUBEN', 'rqtaopo@neda.gov.ph', '2022-05-20 02:55:01', '3PIS-IPD', 110, '$2y$10$5lv.nf6ovxLeLpJpV.spjOnTi2OVNa6Rv/67ixZYDZXy8xYL1bATK', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2253, 565, 'GARCIA REYNALDO', 'rngarcia@neda.gov.ph', '2022-05-20 02:55:01', 'HRMD', 85, '$2y$10$xQ/1aZUa/7kljFBv/eNLGuxZTqaZ/m8HYmaVFRvaaKQcf/7XYpZJ2', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2254, 567, 'Tolentino Aldrin', 'AVTolentino@neda.gov.ph', '2022-05-20 02:55:01', '3AS-AMD', 110, '$2y$10$hLnzVfwSuLL574n4AwiICOQc6nhJZwOWXeHU4qIEceCsXMtm2dvrW', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2255, 572, 'MELODY DOMINGUEZ', 'mmdomiguez@neda.gov.ph', '2022-05-20 02:55:01', 'GSD', 31, '$2y$10$LEoZIXeHQYtY/H.cHTYLpO8r9i44cy608JNPgqf4C6.ISviwiRoie', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2256, 576, 'ANDAYA JENNIFER', 'jandaya@neda.gov.ph', '2022-05-20 02:55:01', '3OASEC-CAGasDIV', 110, '$2y$10$sNzlxzG8030pYre4hQrHF.cFNHEKH3Pf4SOFvNljKNa5vlVq61gRe', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2257, 577, 'MARAGATE DOMINADOR', 'dsmaragate@neda.gov.ph', '2022-05-20 02:55:01', '3AS-GSD', 110, '$2y$10$gUs3ApIEPzaHX.UPWdsTHeSZCg3mULmTZl7NFUjb87lvBlEeL9PMa', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2258, 578, 'RABARA JOSEPH', 'jrrabara@neda.gov.ph', '2022-05-20 02:55:01', '3AS-GSD', 110, '$2y$10$uhOusnfsQcT4Rz7o/N4K/.WR/hnZBqvzfJsOD7CFkcCkcZvpHJcii', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2259, 579, 'REYNADO ANGELINE', 'apreynado@neda.gov.ph', '2022-05-20 02:55:01', '3OSECasDIV', 110, '$2y$10$kzWMmxu7a919jo8hbhLfe.mM.Z.lXTmLWQ3Xw790NH6vklWyOjj/u', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2260, 580, 'RAYNER JASTIVE', 'ramjastive@neda.gov.ph', '2022-05-20 02:55:01', 'HRMD', 85, '$2y$10$87g8a3bPokw/4C9FQaXn1uWzhCxe/v3u3iwutKZYrd69rnAL1b0m2', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2261, 581, 'SORIANO DOROTHY', 'dssoriano@neda.gov.ph', '2022-05-20 02:55:01', 'HRMD', 85, '$2y$10$UX8VuVbMNpOPLJzd8K4s8.unnLkUXe8sc0jDpy.ng684RnyapTcZy', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2262, 153, 'ELAINE JOY BATTUNG', 'elainejoytb@yahoo.com', '2022-05-20 02:55:01', 'ACD', 50, '$2y$10$OzqTmQM7rcvwD7PJk9JEI.7uR0.of/67jdWAbUfTdH/9PSGK45LY.', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2263, 87, 'ROLAND ANDREW UMANAN', 'ra.umanan@gmail.com', '2022-05-20 02:55:01', 'ACD', 82, '$2y$10$2hi72/eV.sz34pRppWFZF.0mPy5krVDcPUqjgfpzCUpH4hvpioLie', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2264, 584, 'PADERANGA MARK JASON', 'mrpaderanga@neda.gov.ph', '2022-05-20 02:55:01', '3OSECasDIV', 110, '$2y$10$mgO5dJ.gdIt7UcDvzSbZy.OTIWJXmwuF4FCUKzVlFf7DQvcWojPue', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2265, 585, 'REGALARIO ANDY', 'arregalario@neda.gov.ph', '2022-05-20 02:55:01', '3AS-GSD', 110, '$2y$10$YmjWOTR1bIsa3HrF5GgR0eey9yuHhUHBv0JHuICDK3U2erOdhfsGy', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2266, 587, 'SANTIBAÑEZ JOSE', 'jgsantibanez@neda.gov.ph', '2022-05-20 02:55:01', '3OASEC-IPGasDIV', 110, '$2y$10$oiT6o7V0nSWS8pctZ7PqWOaVnNBB0JwcEnoZDZ9F2oecunFWkFN5.', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2267, 589, 'RABOT ALICIA', 'arrabot@neda.gov.ph', '2022-05-20 02:55:01', '3FPMS-AD', 85, '$2y$10$CKFymxFe0OZ0K8wlnC7rHuq3CzXRIRNThS3gRh7JZUi.uS9F9QPr2', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2268, 379, 'JOSEPH MARK MEJIA', 'josephmejia18@gmail.com', '2022-05-20 02:55:01', 'SOPID', 50, '$2y$10$WE5.xEY2QrmkH2wd/qRLN./LQRhjM0dIKq3xYM8n/t1y.SxKJVPcC', NULL, 3, 1, NULL, '2022-05-20 02:55:01', '2022-05-20 02:55:01'),
(2269, 483, 'ANTHONETTE MENDOZA', 'admendoza@neda.gov.ph', '2022-05-20 02:55:01', 'ODG', 53, '$2y$10$.ImhZVu/9nPpvaa7eLptfupL4zIf3W8mv9.ER35qpHf4EprB0pXzq', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2270, 263, 'MENDOZA RENCI GALEN', 'rencicruz@yahoo.com', '2022-05-20 02:55:02', 'CPMD', 74, '$2y$10$DL//ST0crTQDWZODlRQDEualWh0uz3B4HnGyEqsd8TGKkvOsmN.Di', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2271, 617, 'TATON KAEDEAN JOHN', 'kctaton@neda.gov.ph', '2022-05-20 02:55:02', '3AS-HRMD', 85, '$2y$10$nE..v3T2aNM7nNeRpr6rRuwOGDubnp3iJZK6wYNjlBqBmejbNbePG', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2272, 618, 'SUPAN PAULA JOY', 'prsupan@neda.gov.ph', '2022-05-20 02:55:02', '3OSECasDIV', 110, '$2y$10$7p3Wq.GIIGrgehsUaNxkWumjuK6hxLQtlwLUtrWS1flh5L66RAx1.', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2273, 619, 'RIVERA DENNIS', 'ddrivera@neda.gov.ph', '2022-05-20 02:55:02', 'GSD', 21, '$2y$10$YX1yq2ZjAfMjMPBKp9Te0utc.2gzx/ixSODnobZ/Om9ye.cwNcVEe', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2274, 620, 'PONCE PENNIE ROSE', 'PFPonce@neda.gov.ph', '2022-05-20 02:55:02', '3FPMS-AD', 110, '$2y$10$cMFp8xg1tIZql3LuOk07r.h3FhKe3yZQVQ.AM9FzbT9ch6M97RY46', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2275, 621, 'PERLOTA MELCHOR', 'mrperlota@neda.gov.ph', '2022-05-20 02:55:02', '3OUSEC-PPGasDIV', 110, '$2y$10$jY/foPBsC5ik61DEKMufQeETIDxJUve2zGK/PK7Tnos.wKT4LBls.', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2276, 622, 'POGADO MOISES', 'mapogado@neda.gov.ph', '2022-05-20 02:55:02', '3AS-GSD', 85, '$2y$10$vHNR/yBY0K9OBclemCSqT.6jddgtPCNAhNBufzk0JF3o8TUckoTTm', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2277, 625, 'SALAMAT ARMAND PATRICK', 'arsalamat@neda.gov.ph', '2022-05-20 02:55:02', 'HRMD', 85, '$2y$10$56rWVM2.d1GoZ.DNHwQ4BObgMG0OteWg78i3TpHFEBqKSzDa5AFaC', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2278, 626, 'PACLIAN TERESA', 'tspaclian@neda.gov.ph', '2022-05-20 02:55:02', '3AS-GSD', 110, '$2y$10$VFN5dENvZmZR88nPzydB6OvJ2.1r4zKTjFVWk/eAV.2/5reHrn/5O', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2279, 627, 'Ordinal Cindy Estrella', 'CDOrdinal@neda.gov.ph', '2022-05-20 02:55:02', '3AS-AMD', 110, '$2y$10$SbUvlGI426feKZctZn.fn.dvvoXY8Uyh14QamMo4z999Ny5VyfEGS', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2280, 629, 'MEDINA BETTINA', 'bbmedina@neda.gov.ph', '2022-05-20 02:55:02', '3DIS-DRD', 110, '$2y$10$kI6T6GqxPeanlD9RgRb9mueQjvJrxIAZtR7RVj6LG9uv7EuHoOmRa', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2281, 632, 'BONETE DAINIELLE', 'djbonete@neda.gov.ph', '2022-05-20 02:55:02', 'HRMD', 85, '$2y$10$zJco.i3Iq/OWrPB1XNw85.9U2AV3PxTKWbcseVTkBqanUm8R8tKy2', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2282, 633, 'Belisario Primitivo', 'PBBelisario@neda.gov.ph', '2022-05-20 02:55:02', '3AS-AMD', 110, '$2y$10$R3G8ivdPBmfWHRY2xwr/Ue7GiKf5e/TIT9bTyPJ5pAMqGkZknOUPi', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2283, 636, 'JAVIER KARINA', 'KCJavier@neda.gov.ph', '2022-05-20 02:55:02', '3OUSEC-PPGasDIV', 110, '$2y$10$ujrhTFbuopYLPKx0zMMn4.MLpV0k34wxU2WGpduLa.U5ntF.A6ooC', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2284, 637, 'SERVILA JAIME', 'jvservila@neda.gov.ph', '2022-05-20 02:55:02', '3FPMS-MD', 110, '$2y$10$c7lWPDFo2lA6ySYPDbyfhuDEOod0S0iztTNAIeaKnSzuLJsjXA8hC', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2285, 89, 'SEE KAREN', 'kpsee@neda.gov.ph', '2022-05-20 02:55:02', 'ACD', 51, '$2y$10$YaEhaCikfZ9cAIbip8.9P./c5B6r6lP0TAsL3kjauEKV8OieG0Loq', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2286, 373, 'ESPAÑOL MARAL ANGEL', 'maralespanol@gmail.com', '2022-05-20 02:55:02', 'ILD', 34, '$2y$10$iRZKForMHEOYM3Z7h/PGZeV.zZDk21t31btt/kU7CmGJQSgdxzUC.', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2287, 148, 'CATLI MANUELITA', 'mfcatli@neda.gov.ph', '2022-05-20 02:55:02', 'GSD', 32, '$2y$10$Dp1hyA7Vb5LwMUskzPOcROFwxgEBYI1rNqa6sPBodUiBsSF5XLgG.', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2288, 365, 'CERIBO EMMANUEL', 'etceribo@neda.gov.ph', '2022-05-20 02:55:02', 'AMD', 20, '$2y$10$4ng/bCH7tdnO6QOegTMThOjbTdWB.HifIMQAhx2LC33AjXepLkG4m', NULL, 3, 1, NULL, '2022-05-20 02:55:02', '2022-05-20 02:55:02'),
(2289, 650, 'MARY ANNE DARAUAY', 'mrdarauay@gmail.com', '2022-05-20 02:55:02', 'OD', 47, '$2y$10$kkYuYKFcDllo7MBtR7T42enoWAv7K/qIMqQ7DVftcMGS9.RdiYWbO', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2290, 125, 'NIÑA CATHERINE CALLEJA', 'ncpcalleja@gmail.com', '2022-05-20 02:55:03', 'MDD', 59, '$2y$10$22So.o12WEoZ4oenIZRhpOLyrApXOW8b2BJjU9dRZrlUGX89/x.Uy', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2291, 651, 'PERNIA ERNESTO', 'ernestompernia@gmail.com', '2022-05-20 02:55:03', 'ODG', 48, '$2y$10$0LMaKHJDc5JWqCABU3KFOOMBBq7ROITInz9z9pfKcQDvsT2cLqQ2K', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2292, 12, 'MIRANDA MARC ANTONIO', 'maqmiranda@gmail.com', '2022-05-20 02:55:03', 'ACD', 82, '$2y$10$jPA2AOp7nR/iuJvALttiNuX8CvdpkGil5P86pecQDhpemL99HkDzK', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2293, 174, 'ABEN CESAR ANTHONY', 'caaben@neda.gov.ph', '2022-05-20 02:55:03', 'ACD', 82, '$2y$10$Hz2.THKzNfgCck3XV9V61OA/C6FcTInPSdYwfk4NvoO545TkfwGii', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2294, 213, 'MAGTIBAY FLORANTE', 'fgmagtibay@neda.gov.ph', '2022-05-20 02:55:03', 'AMD', 83, '$2y$10$5p0eS2pX2f0yjFjXwz3Ieul9npJaB8HL/9lbgz0SzqnSCRwoesItS', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2295, 311, 'MARIANNE ANGELA DEE', 'mariannedee@gmail.com', '2022-05-20 02:55:03', 'PRD', 58, '$2y$10$P0Z5JDgA6cGDNRI14eW5sumwk4LwXLEJlic.9OIFwLfrGYgFlKul6', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2296, 275, 'ALVAREZ MARY JANE', 'maalvarez@neda.gov.ph', '2022-05-20 02:55:03', 'ACD', 82, '$2y$10$yiu4p9Rwh1CCQNWTOm4kAOZ1wRHBgWm2s/FIV5fi8jBgijrQtns36', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2297, 91, 'REONEL ULEP', 'rmulep@neda.gov.ph', '2022-05-20 02:55:03', 'GSD', 52, '$2y$10$Ov/97m8fVr51W.QkL/44GOenmJpmBRNVr3yE07ieOwWt2eeJJtX6O', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2298, 320, 'GAMBOA MARIAN KAYE', 'mcgamboa@neda.gov.ph', '2022-05-20 02:55:03', 'TISD', 82, '$2y$10$hOE2HLZMzk0mxib0d9cr..I731dQZaSTmQmkHH5NgL55C/a5h5WY6', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2299, 657, 'ENCINAS RALPH JOSEPH', 'rcencinas@neda.gov.ph', '2022-05-20 02:55:03', '3AS-HRMD', 110, '$2y$10$FOl6Ng9lMkKtkh7P9tpKw.cSWDG4gZTjDzRTNs8HoMW2MdUCq2T1C', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2300, 378, 'PUBLICO ELENA', 'edpublico@neda.gov.ph', '2022-05-20 02:55:03', 'HRMD', 25, '$2y$10$S.vyi2xoPLl7Y0OwXPgz0u6fLjTcTVJnrcxntFHF1kbCYVc7sO6Uy', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2301, 2, 'CRISTAL KAYLA MICHELLE', 'kocristal@neda.gov.ph', '2022-05-20 02:55:03', 'HRMD', 85, '$2y$10$arVmjKREArze7idQRO8mB.acM4M3UDIp.xOPEu4UweQ7TIY8AnmyG', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2302, 495, 'SEGUMALIAN ELIAS', 'essegumalian@neda.gov.ph', '2022-05-20 02:55:03', '3OSECasDIV', 20, '$2y$10$HAx/oMkDhnfFG.cvfC9onuRwGRfLH2VHbU7XpA0zKUIQn9d4m0Chu', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2303, 644, 'PATAWARAN ARIZ', 'ampatawaran@neda.gov.ph', '2022-05-20 02:55:03', '2ODGasDIV', 21, '$2y$10$5tVQ.aPvMs1Nl14gLkH1T.5dFDmALloxKs1mrnz6LBAQ/l6SLnEJy', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2304, 501, 'GURANGO CRISTINE', 'ccgurango@neda.gov.ph', '2022-05-20 02:55:03', '3PIS-OD', 23, '$2y$10$z3Y8OYd8Cehh1qw1tFBOY.Zej9YAFDfWq6vSKQqjiPcuRxL/QlP5u', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2305, 628, 'NARVAEZ ERIKA MAE', 'EFNarvaez@neda.gov.ph', '2022-05-20 02:55:03', '3IAS-OD', 68, '$2y$10$mU0wX/Mck5Wf.CiXQSWOTuvKkYWXRQ7qjyxwDdp5aOF9vfG5BOlPe', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2306, 502, 'SALIDO MARY ROSE', 'mgsalido@neda.gov.ph', '2022-05-20 02:55:03', '3PIS-OD', 25, '$2y$10$wSIj8zTSf.BWCkd2xXGJ9eXM6FSJtzsn0ZFmdPoz2qFmilDaKHj.q', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2307, 387, 'COMPE-JAMERA GRACE', 'GPCompe@neda.gov.ph', '2022-05-20 02:55:03', '3ICTS-OD', 25, '$2y$10$bxlLqPCzG6kjXYH4WFzYCe8vembK9Vv3ASIi78QrrxY3oBKwIx6u6', NULL, 3, 1, NULL, '2022-05-20 02:55:03', '2022-05-20 02:55:03'),
(2308, 508, 'GARCIA ROCHENE', 'rigarcia@neda.gov.ph', '2022-05-20 02:55:03', 'OD-DIS', 26, '$2y$10$/CWt9FLUTx1uSZ8lYF/gaOE9Cy4uTZh0GUFUWcEfA4/XnviVOZrqm', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2309, 366, 'COLLERA AMIABLE KATHLEEN', 'accollera@neda.gov.ph', '2022-05-20 02:55:04', '3FPMS-AD', 26, '$2y$10$4WknoMnRcG6BTXoUtvPLpOFOtKKpNW6WtmZMGtti9ffPXeUDp3MZW', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2310, 318, 'GALICIA VIRGINIA', 'vmgalicia@neda.gov.ph', '2022-05-20 02:55:04', '3FPMS-AD', 26, '$2y$10$MbbS13zSdiytuvdFCKNJJOP6UKV/GbXXOH46U5IpdCwWfX9oWyAPi', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2311, 65, 'SIMON JOSHUA', 'jgsimon@neda.gov.ph', '2022-05-20 02:55:04', '3TSIS-TD', 50, '$2y$10$Upx.236gX8dnVAnEM4Q6TevWCmxX9v/yJwvxlY08hsYEQEHU3Jrli', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2312, 601, 'SHERIDAN LANCE CARABIO', 'sacarabio@neda.gov.ph', '2022-05-20 02:55:04', '3IS-SOPID', 50, '$2y$10$XL8NszIN.I./I4iw6sHE6eoYach0eY2Tbvseo0sdoHs4xZKXb4vUC', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2313, 323, 'LIGAYA MAGBOJOS', 'limagbojos@neda.gov.ph', '2022-05-20 02:55:04', '3AS-AMD', 30, '$2y$10$O2pX35CerGHBm1kTIxHtw.eHjK4mXHOovZ5ehkFEhEw/xQdlv62.S', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2314, 605, 'LEONORA MEMAR', 'MGLeonora@neda.gov.ph', '2022-05-20 02:55:04', '3IAS-OAD', 69, '$2y$10$VkVJrPffCb9YLkg2NFGPQO75MmxHOhTkrHdOQLFis3MGz.IjaYYGS', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2315, 443, 'EVARISTO JUROCHELLE', 'jgevaristo@neda.gov.ph', '2022-05-20 02:55:04', '3AS-HRDD', 31, '$2y$10$kkVUndCqwo8bhnzmwo8Bhe5qns7x35JinO9a8yk1eU3OTw4rNPThG', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2316, 85, 'OBRIQUE ROSELYN ANN', 'rpobrique@neda.gov.ph', '2022-05-20 02:55:04', '3IS-SOPID', 51, '$2y$10$SAQjTWkql49/9r.HVfnfoOHajC3.jd49bgkApj2GVLyuBw.XeWMQu', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2317, 39, 'PEREZ JOSE MA. ALBERT', 'jhperez@neda.gov.ph', '2022-05-20 02:55:04', '3IS-WRD', 51, '$2y$10$iMBhDBU.NV6oJ/ZHg3iPB.PB7tQZnmc1QsqzhAaxeqRnTHhuim50u', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2318, 236, 'REYES CARLO LORENZO', 'ccreyes@neda.gov.ph', '2022-05-20 02:55:04', '3SDS-HHSD', 51, '$2y$10$JnHi2wQjcsTez7PJh6HmLeZu472KkaMXenhytFEEc9gnSWgVapowu', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2319, 252, 'ONRUBIA ARNOLD', 'aconrubia@neda.gov.ph', '2022-05-20 02:55:04', '3IS-VRAIRD', 51, '$2y$10$z.XuR.d0JvcRzt/3KmV49OiyARdx.zbNR.hOTexkLOhaUKcEmlaXW', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2320, 574, 'ROSE MARGARET REDELICIA', 'rmredelicia@neda.gov.ph', '2022-05-20 02:55:04', '3NPPS-PCD', 51, '$2y$10$R46A7sRVzCqH3IxiHP4UeevMUGDC2j3TG9elL92hXzfr7bs44drqm', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2321, 140, 'CALINGO BEATRIZ', 'bccalingo@neda.gov.ph', '2022-05-20 02:55:04', '2NPPS-DRD', 51, '$2y$10$L7EFLHpiIpiNJ/4zgcGH2uvAhsCSQzZsv0i.t54MELGQ8quqkDzVu', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2322, 158, 'VIRAY ARIES IVAN', 'agviray@neda.gov.ph', '2022-05-20 02:55:04', '3FPMS-CPMD', 76, '$2y$10$OZHU4SlY.KBbY0WCkkofQe9p4CianAaoE5N23YThhlY1lXAJqpfjW', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2323, 139, 'SANTIAGO CHEENEE ROSE', 'cnsantiago@neda.gov.ph', '2022-05-20 02:55:04', 'NTISD', 82, '$2y$10$q1L2/MSQaeNkqe2VX93gAus3MB3rR8Wc/8d0e9vIEYaU4wcWYULFm', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2324, 34, 'PAYUMO LEA', 'lepayumo@neda.gov.ph', '2022-05-20 02:55:04', '3PIS-PFD-II', 82, '$2y$10$PXrY4SVDgkomkUD.bunwHOLueLVIY11TgB90pQQYujyIUSuDRq4GK', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2325, 25, 'PAREDES KARIZZA MAE', 'kpparedes@neda.gov.ph', '2022-05-20 02:55:04', '3GS-AGD', 82, '$2y$10$Bv/dGifWZQ2wPqPfSvytX.6V4Z7pFsTU9Bi1ztfTLKFypAWwoHW8a', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2326, 308, 'DEL ROSARIO MARY ANN', 'mal.delrosario@gmail.com', '2022-05-20 02:55:04', '3PIS-PFD-I', 82, '$2y$10$Qk6ZVqF5lRFtvPK3t3b/9OfChLbp/Wa7i5YZrX.ou1X4JarKuyz42', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2327, 264, 'MAMARADLO MARIVIC', 'mdmamaradio@gmail.com', '2022-05-20 02:55:04', '3PIS-IPD', 82, '$2y$10$VqPKbcwijMqvlABAaTgtp.dtIkIT5ypb6C1aU/eyg70iKtNJLsaom', NULL, 3, 1, NULL, '2022-05-20 02:55:04', '2022-05-20 02:55:04'),
(2328, 109, 'VILLARTA DENNIS', 'dvvillarta@neda.gov.ph', '2022-05-20 02:55:04', '3SDS-HHSD', 82, '$2y$10$D/MTH0IbJRk53rj8TiTEkOdAjv4Yc7R6xLpW7MXLBkULq5Xnx/KV.', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2329, 545, 'BANIA MARGARITA', 'MDBania@neda.gov.ph', '2022-05-20 02:55:05', '3LS-ILD', 34, '$2y$10$JPZKl4uWw9HmQlB0Mp4Y4.Ux0mKW4Mqdvrz52vzvF/MkXEy8G8Bme', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2330, 511, 'DIVINA ARCELI', 'ASDivina@neda.gov.ph', '2022-05-20 02:55:05', '3IAS-OAD', 71, '$2y$10$3FYoE16Uc3PsvkC5Kuyw8OJFtDUdA2Fk.ahN2D1CEkAk0iB3GO.ve', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2331, 162, 'DANAO MARIE CHRISTINE', 'mgdanao@neda.gov.ph', '2022-05-20 02:55:05', '3IS-VRAIRD', 84, '$2y$10$01sX7LU5nFP7QJuL8N56KubyL/08uw/2YpS6nsyZt9jD5zp7lngzq', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2332, 178, 'EUDELA MA. LOURDES', 'mteudela@neda.gov.ph', '2022-05-20 02:55:05', '3MES-SSD', 84, '$2y$10$WwqPkxmr9fizW0.6WANON.hbiYCJ/A4ikGq3qo3EUZE1be06SuAtK', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2333, 137, 'SAMONTE NANCY', 'nrsamonte@neda.gov.ph', '2022-05-20 02:55:05', '3DIS-PRD', 61, '$2y$10$vwHLTaX89Ruqb1L8rNBjfOXF6Auo2ycsY1dMgbAqoSk3uxMGby79i', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2334, 404, 'GOMEZ CELESTE', 'cvgomez@neda.gov.ph', '2022-05-20 02:55:05', 'LEDAC-DIVISION', 84, '$2y$10$mlO8KCXy7zpPu4u.yjs1..vtqWXFSbHoS4wdrDSU8eGWZFSLNXslq', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2335, 405, 'RIA ROBLES', 'rlrobles@neda.gov.ph', '2022-05-20 02:55:05', 'LEDAC-DIVISION', 84, '$2y$10$mVBA74CyNiIcP3EwZ58jCOszuA/vODM6C3Th8UlMRAaQKs/7FMSDS', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2336, 406, 'VALENCIA-RODRIGUEZ JENNYLYN', 'jlvalencia@neda.gov.ph', '2022-05-20 02:55:05', 'LEDAC-DIVISION', 84, '$2y$10$zgXdwVhYmyORN5rZU12L2uax9e7CyH2kkAGUNSBi0WDLR4vtaWSMC', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2337, 498, 'ABESAMIS ANNA CLARISSA', 'asabesamis@neda.gov.ph', '2022-05-20 02:55:05', '3SDS-HNPD', 82, '$2y$10$WrXseumyZng1TMjfxHKVc.8emsCxbveusksg5YMawrYRQAd9Ut8fK', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2338, 239, 'TAMONAN MARK JESTER', 'jestertamonan@gmail.com', '2022-05-20 02:55:05', 'SD', 51, '$2y$10$O0saiaWEfj.xDW52gX5/YeYTsJLye1Npvv/h7bdlx/MMeRzhDISrS', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2339, 183, 'APILADO GLADYS JOY', 'gmapilado@neda.gov.ph', '2022-05-20 02:55:05', '3AS-PMD', 29, '$2y$10$nENDMjfYRoVaA782/T42TusHYlOvvYnaA9Jt2vjPWFuSMQiBQH7QG', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2340, 127, 'RYAN JAMES CADAY', 'rcaday0@gmail.com', '2022-05-20 02:55:05', 'ISDD', 43, '$2y$10$cvQEIqMx3U.d/OHCTBc.PuqeTrc5TDMxuNGbF./PNvR11HhpDDBjS', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2341, 354, 'JOSEPHINE BAILO', 'josephine@attybailo.com', '2022-05-20 02:55:05', 'LCAD', 34, '$2y$10$tAZN9YMTau1XSx0m8zM/M.3U6.uz9h1OOB0sco1jVTsKcR80wVFyq', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2342, 390, 'BARRAMEDA DANILO', 'DDBarrameda@neda.gov.ph', '2022-05-20 02:55:05', '3LS-OD', 47, '$2y$10$8lNYiipEFdb1JsMb6tsGtuaGqS/b5Do8Mh//unGKJ69dgMDAg2QX2', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2343, 189, 'Lastrella Cella', 'crlastrella@neda.gov.ph', '2022-05-20 02:55:05', '3AS-AMD', 28, '$2y$10$1cIChzJ4JMcsE4hnmtgrOef0nbjLKuTWnadcgScO1.tto7nzYNLzm', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2344, 433, 'CORONADO HERMINIA', 'hgcoronado@neda.gov.ph', '2022-05-20 02:55:05', '3AS-HRMD', 110, '$2y$10$R18QV8gKbwNaKCpJ62IAt.AaGy6Ll2CEfvdsnKKJOv8uXPQF.FkBu', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2345, 382, 'ROY JAVIER', 'rsjavier@neda.gov.ph', '2022-05-20 02:55:05', '3AS-OD', 21, '$2y$10$Duwpvm6Ml9klKF4EEqJtfOmKfcBLxdUFgSJt.5Fd7gT0iuc0L0vVq', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2346, 667, 'FERNAN DIZON', 'FRDIZON@NEDA.GOV.PH', '2022-05-20 02:55:05', '3DIS-KMD', 61, '$2y$10$2P5oFeKS0JGqD8HwxmOCr.PvwnTQxKxxQM9tX9n7udclZsNsmsOpK', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2347, 548, 'CHAN-BARIA JERELINE', 'JCBaria@neda.gov.ph', '2022-05-20 02:55:05', '3LS-LCAD', 34, '$2y$10$DY6qePCm1YxR1XTu/F9YoO8NpNxZusVjnuT4km.UiGdjQRVDh6IEO', NULL, 3, 1, NULL, '2022-05-20 02:55:05', '2022-05-20 02:55:05'),
(2348, 679, 'RODELAS JAYVEE', 'JAYVEERODELAS@GMAIL.COM', '2022-05-20 02:55:05', '3AS-HRDD', 89, '$2y$10$2cUe0b4LeVK6piGzQzlgRu8hFoNSeR3ewsx0gIWQCAveQfKTQTJAK', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2349, 135, 'PARRERA MARIA KRISNA', 'krisnaparrera@gmail.com', '2022-05-20 02:55:06', '3DIS-PRD', 59, '$2y$10$SzO0l1PnwuldDMQbP6HHLuvBZjsTKdwRzbzshs71O/VuCICZzCKxG', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2350, 74, 'TANBENGCO HENCY', 'hltanbengco@neda.gov.ph', '2022-05-20 02:55:06', '3LS-LCAD', 35, '$2y$10$1bo/i413qMwqjzvbYx7dh.Fx/l7nuthnzwkXoODfK0LE2l/xxiCDO', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2351, 648, 'MACARAYA SITTIE ROHAIDA', 'SPMacaraya@neda.gov.ph', '2022-05-20 02:55:06', '3LS-ILD', 34, '$2y$10$.5PktNhQAyNJmBbrT9fsjulXoF4XEGa9zWaWNiu7BcxHZflHxFRgC', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2352, 101, 'VEGA KEVIN NICOLE', 'ksvega@neda.gov.ph', '2022-05-20 02:55:06', '3PIS-PFD-II', 82, '$2y$10$FVNk23yAawqnk7nkxbeE2e2mtP64AudVnykQeCMq721F.rm1yBXmS', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2353, 482, 'JUANI ANGELI GRACE', 'asjuani@neda.gov.ph', '2022-05-20 02:55:06', '3OSECasDIV', 54, '$2y$10$rXXa3cgdnnfiIHT0zoEexOKino0kaHhf8YUcPK7HMZ8CEVDKU3bIe', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2354, 684, 'LOU JEANNE SAN JUAN', 'LPSanjuan@neda.gov.ph', '2022-05-20 02:55:06', '3AS-HRMD', 110, '$2y$10$k8EnOvuBtz3B2wyUg0qdg..Zfw8NV5xsVA7uaHqH6iU7PmctB1dIK', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2355, 685, 'RELLY LLABRES', 'RBLlabres@neda.gov.ph', '2022-05-20 02:55:06', '3FPMS-BD', 110, '$2y$10$Zr0Hpp0oadzOR7Ll95XOY.D/xCxnflmwEW46iABUQsWOg.gM6.wdO', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2356, 686, 'DANILA MARIA CATHERINE', 'MBDanila@neda.gov.ph', '2022-05-20 02:55:06', '3OSECasDIV', 110, '$2y$10$jcrQB7tX8JdZxSwvT4U1DOFptuAQLiaMineT4Dxh6diNQl0bu.Tsi', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2357, 699, 'JANN SKYLER TENG', 'JYTeng@neda.gov.ph', '2022-05-20 02:55:06', '3INNS-OD', 110, '$2y$10$SyybXMhgVh9kOUpJpPqRI.9ZE/zcrWGiUjlJmXpM0hzhroeShwJii', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2358, 700, 'CAGA CZARINA THEA', 'cccaga@neda.gov.ph', '2022-05-20 02:55:06', '3INNS-OD', 110, '$2y$10$7M0FFU10nSioGZFgtD.dWeHWxpCXGUUsrs6GZ3btxyd7zTD1EVSqu', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2359, 702, 'KRISTINE JOYCE BAGUISI', 'KABaguisi@neda.gov.ph', '2022-05-20 02:55:06', '3AS-HRMD', 110, '$2y$10$f0CKukTQc/iGru25EQ2gAeFB5v9cyzQhsvmtE/AzdxP5bkIJbLk4S', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2360, 704, 'MEJIA PAMELA NICOLE', 'PEMejia@neda.gov.ph', '2022-05-20 02:55:06', '3AS-HRMD', 110, '$2y$10$kdgJJokYjLV8E/ZnB90f2ekkJRGhprxNe9JNUgtDw9/CYhPzRRWge', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2361, 705, 'SARITA ARGIE', 'AESarita@neda.gov.ph', '2022-05-20 02:55:06', '3AS-HRMD', 110, '$2y$10$I2wruuT8jUI0F2VRUfUBt.bgIFb6kJ7xDTgGb3OFz5DFgojHuwmH2', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2362, 706, 'MICAELLA JOYCE SAN MATEO', 'MUSanmateo@neda.gov.ph', '2022-05-20 02:55:06', '3AS-OD', 110, '$2y$10$LdMxqeaWjxhWozY9soH5V.MZSCYwYFAl8ank1A2yP5fBIrBknHOiu', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2363, 707, 'SAMUEL BRANDO PIAMONTE', 'SHPiamonte@neda.gov.ph', '2022-05-20 02:55:06', '3SDS-ESDD', 110, '$2y$10$1Eh0E1sBuNmFxqhn.Idu..IRbV5eUnf6Qjl7Pn1DDdVMwERm0arrK', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2364, 708, 'MICHAEL JAY DYTIOCO', 'MSDytioco@neda.gov.ph', '2022-05-20 02:55:06', '3AS-HRMD', 110, '$2y$10$M6pbGabkjR8t2DJv8fKFAOk8NPsIex.hwX.qiBwTGR1HEPxHu3gZG', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2365, 709, 'ALVIN BOOTS CONVOCAR', 'AJConvocar@neda.gov.ph', '2022-05-20 02:55:06', '3AS-GSD', 110, '$2y$10$p.XhpIZDzCfQJ4p.v7KcTOZoa30Rtqcsi98fDIgu6XNc.KvH6glpC', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2366, 710, 'EXEQUIEL TORRALBA', 'EBTorralba@neda.govph', '2022-05-20 02:55:06', '3AS-GSD', 110, '$2y$10$AtJCh2143wmoTz/MXN8Hreqi5kI.cIJ.lvKVAUdhVzCfsSvV1IA3O', NULL, 3, 1, NULL, '2022-05-20 02:55:06', '2022-05-20 02:55:06'),
(2367, 711, 'ROSANA QUIZON', 'RCQuizon@neda.gov.ph', '2022-05-20 02:55:06', '3INNS-OD', 110, '$2y$10$03vrgenJob92yxBbE4sCk.GhC3phkVmxKhMd48dFKIt2dDwhD.H0K', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2368, 713, 'EURICA FAITH CANONCE', 'ETCanonce@neda.gov.ph', '2022-05-20 02:55:07', '3AS-HRMD', 110, '$2y$10$EvVRXtt78yIlrC3B8JduY.UU2EEfQBBns4LZ841xr6rZ6ZDHHYpIK', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2369, 714, 'ALCALA LUDELL', 'LBAlcala@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$wkN/Tx7o66TEOGY4zUVyOOX/yYyPx9epiz6mJdo0vXgEmO5c0joUa', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2370, 715, 'AMAFEL BAYLON', 'ATBaylon@neda.gov.ph', '2022-05-20 02:55:07', '3OUSEC-PPGasDIV', 110, '$2y$10$pUazNo.f5MiYT1B7O1LEZu6OZVtJmrl6hcfWhYrfBB60prih/be42', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2371, 716, 'MARY GRACE FENIZA', 'MAFeniza@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$FgJpOWVzJEF4udRkMzxgiOBMUR95t3A0u5HtJPRV1rSvtDhSexRP.', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2372, 717, 'MARIA RUBY LAMAC', 'MLLamac@neda.gov.ph', '2022-05-20 02:55:07', '3OUSEC-PPGasDIV', 110, '$2y$10$On5FW9cOyOMA5YerFNqg4.2axmu2VXwUGXDV8AP9.XQKSG0maOaCm', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2373, 718, 'ALEINE LEILANIE ORO', 'ABOro@neda.gov.ph', '2022-05-20 02:55:07', '3OUSEC-PPGasDIV', 110, '$2y$10$VYCBjN1rR7NG.pDVaPq5R.QxiPplGoqdl1u/PJZVS45OQPxFJeHCW', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2374, 719, 'ARSENIA CRISILDA MAXINNE PEPINO', 'ABPepino@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$5jJlpPWuA0CcK1aHmaspeeRn7eLMc3gfTN64kQfNwOcxUYgyV0Xw.', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2375, 720, 'ROQUE JOCHEN BRYNE', 'JPRoque@neda.gov.ph', '2022-05-20 02:55:07', '3AS-PMD', 110, '$2y$10$YCDU1s8GNsMWcuPD3tM5H.Bm3gpwdCKOghvSkL4m9AGQNdJfocIc6', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2376, 721, 'ROLAN CALDERON', 'RRCalderon@neda.gov.ph', '2022-05-20 02:55:07', '3AS-HRDD', 110, '$2y$10$mLQzdlZnNM5x9wtDIkYOEO5cbD9KpyqwFeIcQfa9j6j8li9NiZ6ym', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2377, 722, 'KENNEDY WONG', 'KEWong@neda.gov.ph', '2022-05-20 02:55:07', '3AS-AMD', 110, '$2y$10$Ym0AHWi7uMR2XVcpTkXktencgdpTDtxIqEp8VUgs7MhsrYJan2Zq2', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2378, 723, 'VEAMIE PERLADA', 'VAPerlada@neda.gov.ph', '2022-05-20 02:55:07', '3AS-HRMD', 110, '$2y$10$f3EJD2hTjS698Q.ptpwNHes7YpxEnTEfVAGZP371E6MnnFRbMivqi', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2379, 724, 'LEVI GUILLERMO GEGANZO', 'LLGeganzo@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$.Y7.qraFBAllVt6KMFV6VerYGUo4YvBvVSI8uTJdqQEOrIyihk8uu', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2380, 725, 'MICHAEL ANGELO PROVIDO', 'MUProvido@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$dTd4qRlVLpR7f.gB8ZiOmOF5/3PI1KCMEgPfMPAf7cLDr6.r3T4w6', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2381, 726, 'JERMY FILEO', 'JBFileo@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$V0FKoyikxARr696PZEfzlujtolf1SKr2c2XEhjyK4BA3LS/5DV6bG', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2382, 729, 'ROCELLE ANGEL VALLENTE', 'RMVallente@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$Vse2J7x5LPCD115WNcRG7uojKHFP8V7Yy5XxwDC5kT5g5c0A9QR8S', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2383, 730, 'DEXTER ARVIN YANG', 'DEYang@neda.gov.ph', '2022-05-20 02:55:07', '3INNS-OD', 110, '$2y$10$BF1Zqo4W79khx5C6qqeDeu/yLFnvNZ7OSjW2JiioZ5f3Y2UugByVe', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2384, 731, 'ELIJAH OTREBOR PERALTA', 'ETPeralta@neda.gov.ph', '2022-05-20 02:55:07', '3OSECasDIV', 110, '$2y$10$Nnk89OEwTVHb9rfN/2Kczu5ayxG.mzB8ujy8OcJ5qddVbnt5XI94C', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2385, 732, 'JOSE CAEZAR JAMORALIN', 'JMJamoralin@neda.gov.ph', '2022-05-20 02:55:07', '3DIS-OD', 110, '$2y$10$Mc6V/UDlnlheLk2SPvsGZuyww8AaBd/6rMfWCQVlKeNP1u8ThsElu', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2386, 733, 'OCAMPO TAN MARCO ALDON', 'MCOcampotan@neda.gov.ph', '2022-05-20 02:55:07', '3OSECasDIV', 110, '$2y$10$dSQ4VMlN4kl04SPIG9m3cO3ow44D3IE/o4WDqC8sZofeCmLnrYvSq', NULL, 3, 1, NULL, '2022-05-20 02:55:07', '2022-05-20 02:55:07'),
(2387, 734, 'MARIFEL GERONIMO', 'MSGeronimo@neda.gov.ph', '2022-05-20 02:55:07', '3DIS-DRD', 110, '$2y$10$i7FhtSDjNGKKI.GQCwQybec47w11o1hSnjQWpYAHUYoFBmQfwbf6i', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2388, 736, 'SANTIBAÑEZ JOVEN', 'Jovgsantibanez@neda.gov.ph', '2022-05-20 02:55:08', '3FPMS-AD', 110, '$2y$10$fEAjGCMu.pnhCGxZhKeFjuPVj4Jw8.3KwSVs.GOoyAePu9fEdMBrW', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2389, 737, 'RENZ VENIELLE LAMAYO', 'RLLamayo@neda.gov.ph', '2022-05-20 02:55:08', '3SDS-ESDD', 110, '$2y$10$eZM32vGR6p7vuVFU2eQS3uey0NioGZqI5yb1PqE1H6pBvUjef.COO', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2390, 738, 'BOGÑALBAL NIKKO JOY', 'NBBognalbal@neda.gov.ph', '2022-05-20 02:55:08', '3OSECasDIV', 110, '$2y$10$VF.ykkhM.Hqpee8.nimiHeUa2goIAhPMDYcXKhPd8vUy.nO4LAWGS', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2391, 740, 'NADERA CLAIRE', 'ccnadera@neda.gov.ph', '2022-05-20 02:55:08', '3INNS-OD', 110, '$2y$10$G6T/4B6mQ0gaFWk9yR7nzeZKJvAAZg2x4Oa.9mnivnL1hLSIXFoRq', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2392, 741, 'RAÑOLA ERIC', 'EBRanola@neda.gov.ph', '2022-05-20 02:55:08', '3SDS-ESDD', 110, '$2y$10$hUd7utwE2E9JG.2UoYJebeupMt305FD88vath26CYAPIj0ixw5GJC', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2393, 743, 'LEGARDA JONEL ERICKA', 'jllegarda@neda.gov.ph', '2022-05-20 02:55:08', '3INNS-OD', 110, '$2y$10$06Zdo/8dHezomJSol2lHTO5F.ms5FPUWy14CZPDrRPm6waWztzEsq', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2394, 744, 'PESTAÑO JAN CHRISTINE', 'jcpestano@neda.gov.ph', '2022-05-20 02:55:08', '3INNS-OD', 110, '$2y$10$/eI8K30ChxEykFmYRybTJOGxjnr5L3w8sPGOklc6fNU.JSdiQFXUC', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2395, 748, 'MANTE GRACIELA', 'gemante@neda.gov.ph', '2022-05-20 02:55:08', '3INNS-OD', 110, '$2y$10$ldSxrINkq8CokhwU456See.7MMGSLf9yXJ4l6RHXWJUkpKozZj3r2', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2396, 623, 'MARIÑAS JESTER', 'JRMarinas@neda.gov.ph', '2022-05-20 02:55:08', '3ICTS-IND', 110, '$2y$10$Oej.wjIlDUsn3yldQcMZb.BqhykNromy5Q1j05Hs.u4.dN5WNHM/6', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2397, 563, 'PARALEJAS CARL NELSON', 'CBParalejas@neda.gov.ph', '2022-05-20 02:55:08', '3ICTS-IND', 110, '$2y$10$nXiqJyX6uW.DyOo0hw1moeuKz9sXxVIaQ1ltQrMGDFJzikBPLgX2G', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2398, 749, 'ALEXANDRA SHEINE LAMEG', 'ACLameg@neda.gov.ph', '2022-05-20 02:55:08', '3OUSEC-CAGasDIV', 110, '$2y$10$4ZAwDrXRDEBspgjlB5tro.2bvHi/5hwfdUB/o3XX6NKVjyU47ghny', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2399, 750, 'MARIA ALPHA LARGA', 'MALarga@neda.gov.ph', '2022-05-20 02:55:08', '3FPMS-AD', 110, '$2y$10$rrFiySYaUSgMWjw1Hsz.t.FWFh/EftB/c/Z1KCo2SJs8VPNRyebL2', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08');
INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2400, 751, 'ESTHER OGAS', 'EHOgas@neda.gov.ph', '2022-05-20 02:55:08', '3INNS-OD', 110, '$2y$10$mqVjsxMLPHD9.6p6U5z6iOcySCuGNDKuzGZZ9m5jcUfvZ1I/BH4Be', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2401, 752, 'MARION MICAH TINIO', 'MRTinio@neda.gov.ph', '2022-05-20 02:55:08', '3SDS-ESDD', 110, '$2y$10$zFj.brGFapbT2lH7O5/oEOKVxXqhHdH4m3UjrJfIHyxwbouPE5cTq', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2402, 753, 'KAREN PAULA INONCILLO', 'KRInoncillo@neda.gov.ph', '2022-05-20 02:55:08', '3OUSEC-PPGasDIV', 110, '$2y$10$.qrKWN5RChJ37WIZInLs0OjqLYSLd5LbxBrkmeKhdUYtxWO5TxMvS', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2403, 755, 'HADASSAH MAY CORDERO', 'HRCordero@neda.gov.ph', '2022-05-20 02:55:08', '3ANRES-ACD', 110, '$2y$10$uCMTWw6vPUKuM1IaCkZMpuL1w7sVPwHC6yPA2mkU8Of0njR/Igmc6', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2404, 756, 'ERUEL JOHN RODIL', 'EGRodil@neda.gov.ph', '2022-05-20 02:55:08', '3SDS-ESDD', 110, '$2y$10$KuxoDfw8BZUPwxovgpAo/OgTL90uAtMoHrrpurw6nNct4utZRsBoe', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2405, 638, 'BAGONTE IMRAN', 'imbagonte@neda.gov.ph', '2022-05-20 02:55:08', '3ICTS-IND', 110, '$2y$10$4FlVtA2cyEBlIi.2oN7SzurYDlblJdGJPmDxFQk54WrORsW6F6IGW', NULL, 3, 1, NULL, '2022-05-20 02:55:08', '2022-05-20 02:55:08'),
(2406, 586, 'PEREY MARIA JHEELYNE', 'MVPerey@neda.gov.ph', '2022-05-20 02:55:08', '3ICTS-IND', 110, '$2y$10$KT.C7jVK7N9XNHUqNNdWpu399kqOF1RaN76gVgD9Xs2zeuYtd5qc6', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2407, 419, 'ARRIOLA JEAN JERLYN', 'JNArriola@neda.gov.ph', '2022-05-20 02:55:09', '3ICTS-IND', 110, '$2y$10$DTMaffQ3Fz7s9uG05Nn2gu03WzEbUUkH8OboW316OBpMwHMUo04n.', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2408, 562, 'MOJANA ANTONIO', 'afmojana@neda.gov.ph', '2022-05-20 02:55:09', '3DIS-DRD', 110, '$2y$10$VXG31hB36GmrljCFHtNxu.EkxJagcZI1ZBmHx.osHLvMWiOrhSErC', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2409, 421, 'CABALLERO MARICEL', 'msccaballero027@gmail.com', '2022-05-20 02:55:09', '3AS-HRMD', 110, '$2y$10$naRDUCl4XnOrQw2w45XNseWaI1PbW2Qr/fxVYRLjpi//g.06Q/VRe', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2410, 645, 'VENUS DYLAN', 'vnscde@yahoo.com', '2022-05-20 02:55:09', '3AS-AMD', 110, '$2y$10$ybdX.aeyQos6FhLdhekJkugmlSxHF79obP8h6fSC8NS2BKIETS01i', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2411, 568, 'PASCUAL ISAGANI', 'iapascual@neda.gov.ph', '2022-05-20 02:55:09', '3FPMS-AD', 110, '$2y$10$5qDiAbR36.1iuQTjzyYme.vtg4wSiEMviLZSpKjbf3BYCTt29K11S', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2412, 429, 'GARCIA EVELYN', 'efgarcia@neda.gov.ph', '2022-05-20 02:55:09', '3PIS-IPD', 110, '$2y$10$xTmZsTt07I/BSfyVmTUiGuYHKKK8rjm7geuIzIQYivLfTO91ox5bO', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2413, 160, 'VIRAY MARY ROSE', 'MBViray@neda.gov.ph', '2022-05-20 02:55:09', '3AS-AMD', 28, '$2y$10$ua2B6FSji/HjInBGNj08DuLb0YCGDq22YBj4qKRiB1lTdECWWM8K2', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2414, 765, 'DEL ROSARIO RICARDO', 'rickdel8288@yahoo.com.sg', '2022-05-20 02:55:09', '3FPMS-BD', 110, '$2y$10$TK6iwmg8qkmkMVCgm5tkXOu.YENIHBLWPEhKwUxYWIatrKIzZ4J1W', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2415, 179, 'ANTIDO MARY', 'MIAntido@neda.gov.ph', '2022-05-20 02:55:09', '3AS-AMD', 25, '$2y$10$9Iqpdjc6Tku2YksQcQTZDOvfmTUSu9Bh5D3njP7vuKt1hOVWD0.8a', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2416, 66, 'GONZALES DOMINIQUE', 'Tamayodominieque@gmail.com', '2022-05-20 02:55:09', '3AS-GSD', 26, '$2y$10$/1ckJbGOPHb31BUsAsP1ZOQfZL8/vzjxb1WzIqopAaRqEeQCrk/Ce', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2417, 63, 'ROMILINDA SIBAL', 'mylenesibal@gmail.com', '2022-05-20 02:55:09', '3LS-LRCD', 73, '$2y$10$qDLw8LDXYadJa/nd/0hPIew7SYFzx/TOMya5ta/8A/hDc3DGxGTTW', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2418, 772, 'JOANA PAULA BAUTISTA', 'JABautista@neda.gov.ph', '2022-05-20 02:55:09', '3FPMS-OD', 110, '$2y$10$s4OWMyJmAB4gbqYe5.Prw.2om.YSpXXgGATYBWNVkrEzlHpCR7fKC', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2419, 773, 'JEFFERSON HAO', 'JEHao@neda.gov.ph', '2022-05-20 02:55:09', '3DIS-OD', 110, '$2y$10$ipyTEq/5Tt.g6rRFmSMaNeqBk2KKn7v43qrMsgDo88ISr7ln6lxxG', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2420, 774, 'ALFRAN LUMAJEN', 'AVLumajen@neda.gov.ph', '2022-05-20 02:55:09', '3OUSEC-CAGasDIV', 110, '$2y$10$nEy1IcoP0Btz2BjyVqo7XuOQ3HVEpl81XbBLUY4S32y5FHHPoh1s2', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2421, 775, 'KARLA MICHELLE YU', 'KOYu@neda.gov.ph', '2022-05-20 02:55:09', '3OSECasDIV', 110, '$2y$10$7hbD/ybjyDJcQwEUoGBAP.ufjdJdr7s6F6ZVijnK5Q0DkJ7avNi9K', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2422, 776, 'RITCHELLE ALBURO', 'RJAlburo@neda.gov.ph', '2022-05-20 02:55:09', '3ANRES-OD', 110, '$2y$10$EXGtLBzyzg9fTxseJn3SLepbFhmB/j9lynak6M4Pg3vmQ46GwDoja', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2423, 778, 'SYLVIA SUENO', 'SASueno@neda.gov.ph', '2022-05-20 02:55:09', '3SDS-OD', 110, '$2y$10$c513AIBbgxXfvE4RtvN2FuObk3R3/wBS6yhk.tjQ6KKw.FbD7YcT2', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2424, 779, 'RAMOS RONA RAISA', 'RARamos@neda.gov.ph', '2022-05-20 02:55:09', '3SDS-OD', 110, '$2y$10$Oo.13wJzM1tP7IL.PcFobO95K.j72T9gpNU4Df3cGNsrhFP4gmuDy', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2425, 78, 'Pajarillo Rikki Mae', 'rtpajarillo@neda.gov.ph', '2022-05-20 02:55:09', '3AS-HRMD', 29, '$2y$10$1kc6..J7T0odxLAap33g7udSq3W/8YoZ4/o59.X/rpzc/7PrCaxpe', NULL, 3, 1, NULL, '2022-05-20 02:55:09', '2022-05-20 02:55:09'),
(2426, 780, 'STEPHANIE BAROT', 'scbarot@neda.gov.ph', '2022-05-20 02:55:09', '3OSECasDIV', 110, '$2y$10$74njdeiljTpykXCn0REO9.LIwgXX0NVlJCewPOYe03sf/i.MBhu.u', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2427, 781, 'KARLO FERMIN ADRIANO', 'ksadriano@neda.gov.ph', '2022-05-20 02:55:10', '3AS-HRMD', 110, '$2y$10$26rriuKWo0KYh6nb6ywktONdTmA1CCNzFCxWCTUCJkT3NqOFGLXM6', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2428, 782, 'LAURETA MAR JOVETTE', 'mblaureta@neda.gov.ph', '2022-05-20 02:55:10', '3INNS-OD', 110, '$2y$10$regwmhqHmVtH7EohggtSeur7D.WmQXFB62uCgEnCHSnhxmPe.iu7i', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2429, 207, 'Laudencia Erika Henri', 'erlaudencia@neda.gov.ph', '2022-05-20 02:55:10', '3IS-SOPID', 82, '$2y$10$8ffk5jtvB1NUQo5QZqpsTONU9KWBK792OqS8ZRbUEC25aGm5NUEMm', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2430, 784, 'MARK JOVEN ROQUE', 'mproque@neda.gov.ph', '2022-05-20 02:55:10', '3AS-PMD', 110, '$2y$10$sMWpH6A1WzVUaDUCWTM2auq0o0zXv/nRj71HzhSsF1VtADIIlfB.6', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2431, 785, 'MAPA RIZ ANGELINE', 'rdmapa@neda.gov.ph', '2022-05-20 02:55:10', '3INNS-OD', 110, '$2y$10$CMc0Hb4AKuObv4OdMXvF4O0aCc61XAGlOqbOGzxpfYzBQknYCMytK', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2432, 786, 'RONALD JEREMY ANTONIO', 'jsantonio@neda.gov.oh', '2022-05-20 02:55:10', '3SDS-OD', 110, '$2y$10$4goMq3c23TsDEA2gfTqHbeGzNq4lMPHRHvnDwCSfO1BgriSgrva8S', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2433, 200, 'IBNO GILDA', 'gaibno@neda.gov.ph', '2022-05-20 02:55:10', '3AS-PMD', 32, '$2y$10$zL65JXA9tDAXJMmQKZrtfukCfieFPpz7qgQr4/QFS1iCV9wT6mFTO', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2434, 9, 'NOVILLA HONEYLEEN', 'hnnovilla@neda.gov.ph', '2022-05-20 02:55:10', '3DIS-MDD', 60, '$2y$10$Kl8AQAmseQutkw6JpLgkVOtqmJ8oF9oJC0clVujtgg8OxwoYdv2CO', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2435, 118, 'CHING PATRICIA MAE', 'paching@neda.gov.ph', '2022-05-20 02:55:10', '3DIS-MDD', 58, '$2y$10$XZSTR.biLi9z0WgVninp6edbdgxmhukiTAC6nYwc3hcKercWA8opO', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2436, 121, 'BALANO JORGE VINCENT', 'jvbalano@neda.gov.ph', '2022-05-20 02:55:10', '3FPMS-CPMD', 75, '$2y$10$DnWbaksBMsaoKjwLsD118uORiU37ghFGY9W8tr42Xf/s3kggkJUsG', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2437, 138, 'ADRIANO NATTASSIA', 'nvadriano@neda.gov.ph', '2022-05-20 02:55:10', '3FPMS-MD', 32, '$2y$10$Ytx7FBhqrKxhZhJq5xdMoezARO19SpG0EuIDjVDzmBhsRyLp8PKUO', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2438, 341, 'ARDALES MICHELLE', 'muardales@neda.gov.ph', '2022-05-20 02:55:10', '3GS-PGD', 40, '$2y$10$z2FbLbAqgoW1TImb5HXFZO3F.BierMXAvf7oeZ8FxX5odj4iU2TTW', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2439, 4, 'CASTILLO MARIANO', 'MCCastillo@neda.gov.ph', '2022-05-20 02:55:10', '3AS-HRMD', 110, '$2y$10$JHuKy9WI0kTzKKVQAlU19O.NZserJnQChIE35z1lL6SoTzqVYk0Vq', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2440, 457, 'MANUEL THELMA', 'tcmanuel@neda.gov.ph', '2022-05-20 02:55:10', '3GS-OD', 47, '$2y$10$3yg1FM9BqQuBs2ZoroKB4OgPCAd9rmsbtDs8IXyEa1QrdLwYNjhDG', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2441, 442, 'ANCHETA ALADIN', 'aaancheta@neda.gov.ph', '2022-05-20 02:55:10', 'ODG', 47, '$2y$10$LM97VXWlCRY7K6q3vPiKSu2m7kZ6DeDYEDQBgBrSkm8zIKDvdFU.u', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2442, 480, 'VILLANUEVA RAMAKRISHNA', 'rjvillanueva@neda.gov.ph', '2022-05-20 02:55:10', '3OSECasDIV', 54, '$2y$10$0h0wmNXPUAY.MkbDdYEcg.SoulIA9SDfF8IENKw7HqprYp2dhF11W', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2443, 588, 'VALENZUELA RICARDO', 'rrvalenzuela@neda.gov.ph', '2022-05-20 02:55:10', '3AS-HRMD', 110, '$2y$10$G1ktm.FLoNsMr0peHaZ40emMDeaIPGy42FS9.LU2BkDSH0P8OkMgK', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2444, 570, 'ANGELICA JOY GALVEZ', 'asgalvez@neda.gov.ph', '2022-05-20 02:55:10', '3IS-TD', 50, '$2y$10$m6N1Ts9QtJzcl2eZYFXa1.ODDlw7cxAnU.jOn6q/ILh1BdTLAhtHm', NULL, 3, 1, NULL, '2022-05-20 02:55:10', '2022-05-20 02:55:10'),
(2445, 181, 'ANTONIO GUADA ELVIRA', 'gsantonio@neda.gov.ph', '2022-05-20 02:55:10', '3PIS-PFD-III', 84, '$2y$10$EPuTrEz1Qr3NUKeXGdWW3ex8PEgsysRLUnGqfQmQySQuScEXEkVjW', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2446, 336, 'AMELIA MENARDO', 'aamenardo@neda.gov.ph', '2022-05-20 02:55:11', '3TSIS-TD', 39, '$2y$10$aFpxKyAAeSmXA13hmGqpk.9lVTBqrNky/z/y8KnM4pWN6aottffw.', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2447, 613, 'JANEL ASLEY RAVIZ', 'ravizjanel@gmail.com', '2022-05-20 02:55:11', '3ANRES-ED', 51, '$2y$10$Y7BQ1NjXFhcAWucNynU58Op74e0BgAWy5RZRt1/kj3XgyHUR4X/r6', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2448, 114, 'VELASQUEZ DOMINI', 'dsvelasquez@neda.gov.ph', '2022-05-20 02:55:11', '3NPPS-IED', 39, '$2y$10$LHjgj3bjrjz0CVM3qMkpg.Xu4gmjX0CUTiBDzecnU4nJwViUKthNW', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2449, 474, 'MERIEL HAILEY', 'hvmeriel@neda.gov.ph', '2022-05-20 02:55:11', '3RDS-RLIDD', 82, '$2y$10$DcMkcEx6JUMiXEs0xzHmHuNiWojkRjJAbQ8ZtbKMKKQ71CJhlWcy2', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2450, 813, 'Espartinez JOHN RONEL', 'jdespartinez@neda.gov.ph', '2022-05-20 02:55:11', '2AS-HRMD', 85, '$2y$10$LL6XpqzNVh6o6zoO.WXkhuxO/.sHFGYD5sTtDbgWxQAOkfvEswEE6', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2451, 814, 'RAMIL EGBUHAY', 'rmegbuhay@neda.gov.ph', '2022-05-20 02:55:11', '2AS-HRMD', 85, '$2y$10$X0ruQnaESu2Id1rxXkkbQeAZgwNSv/GO1iNKFctMg/ULRvm7uP0N2', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2452, 815, 'NAPAY DOROTHEA MAIR', 'dcnapay@neda.gov.ph', '2022-05-20 02:55:11', '3DIS-OD', 110, '$2y$10$mUO/YlpkGgNwNlAnKZfKB.cdDJX0X27Gqmdod/XEKci9wCEwVf6Gu', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2453, 816, 'JOSEPH MIRANDA', 'jsmiranda@neda.gov.ph', '2022-05-20 02:55:11', '2AS-HRMD', 85, '$2y$10$SDCRVy8/3i44z3TYWU2fX.a8CR0i5DXpm03MeJtjGfAkAbzFg1/q2', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2454, 817, 'CARLO JOSEPH MOSKITO', 'cmmoskito@neda.gov.ph', '2022-05-20 02:55:11', '2AS-HRMD', 85, '$2y$10$KgG6kGoC9iP.O6EWxPFyye391o/AWZ6xPROZ6/iuae0L53BHr7XcS', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2455, 818, 'ANDUQUE HENRY', 'hvanduque@neda.gov.ph', '2022-05-20 02:55:11', '3AS-GSD', 110, '$2y$10$cgdO1zeISWGYKnjBNnDi8OjRVP/16slsf/82DoEdUCZt2yvvCgOoK', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2456, 450, 'DALUSONG ROWEENA', 'RMDalusong@neda.gov.ph', '2022-05-20 02:55:11', '3IAS-OD', 47, '$2y$10$QkNf/D339NzDA3Z/9vYWmu514Jid88OdUC3j76U.yU1giiZahUvCm', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2457, 108, 'YUMUL MARIANE', 'mdyumul@neda.gov.ph', '2022-05-20 02:55:11', '3IS-VRAIRD', 82, '$2y$10$7EgrJwYTsFSm8DFHAMgrWONAU1CtbU0YjmSULUZDou0Wjjxtxc.au', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2458, 76, 'TIBLANI OMERCALIPH', 'omtiblani@neda.gov.ph', '2022-05-20 02:55:11', '3IS-PEED', 84, '$2y$10$ob12NYy6mV6bMdpmTBJXAuv0VUAoJrD/kOiBd6VXqAAg6PhImv/9O', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2459, 358, 'BUCAY MA. CATHERINE', 'catherine.bucay@gmail.com', '2022-05-20 02:55:11', '3MES-SDAD', 82, '$2y$10$1aLXKU3M.rlp1MFC.ud5F.OVM/7BGr46PdAe7vfFqH7wpJTn8HfEq', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2460, 194, 'MADRID RAVINA VIERA', 'ramadrid@neda.gov.ph', '2022-05-20 02:55:11', '3NPPS-PCD', 82, '$2y$10$13AbEegXMAPtiKxRnTKdyeGhKpNGWkNk6O75UDfwhb3cihngYJKqi', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2461, 649, 'DACANAY ALLAN CHRISTOPHER', 'addacanay@neda.gov.ph', '2022-05-20 02:55:11', '3OSECasDIV', 54, '$2y$10$1WHtP7ywjZkpJM5tMREwauLKui5.BMU9XIU0t6KscQwqxqYjW68Hq', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2462, 499, 'NUQUI CRISTINE', 'cbnuqui@neda.gov.ph', '2022-05-20 02:55:11', '3PIS-OD', 26, '$2y$10$v2Wh8jZrvswHTJJrPNbZY.B0DXuBXf3Wc/bSci.PVoTZLEs2ZLIym', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2463, 26, 'PASTORAL MARIA ELLAINE', 'mppastoral@neda.gov.ph', '2022-05-20 02:55:11', '3PIS-PFD-I', 84, '$2y$10$IWwAwGmNp9M3oSMms3vtd.x0EeyHVYwN5JSjBSW1Y3SOBIQ4930de', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2464, 665, 'BONITA RHED ELINOE PALAD', 'bspalad@neda.gov.ph', '2022-05-20 02:55:11', '3OSECasDIV', 54, '$2y$10$9ObkZ851V3hbaCBgBu4CQOjdWROHwPchCUD6d2g6i44nqHJQMykEy', NULL, 3, 1, NULL, '2022-05-20 02:55:11', '2022-05-20 02:55:11'),
(2465, 348, 'ARCENA KRISTINE ABBIE', 'kaarcena@neda.gov.ph', '2022-05-20 02:55:11', '3RDS-LUPPD', 82, '$2y$10$6xM7/SCdwLNE2aocBLDbg.Gsdf7mOMtphgZQ27x.vE7LjKOxhp.Ey', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2466, 268, 'GONZALES PRINCESS SARAH', 'psgonzales@neda.gov.ph', '2022-05-20 02:55:12', '3RDS-RDAD', 51, '$2y$10$NQgoyYIs5t/3zyXaewEXluAtFjsPe7HaZqjLbsKpkzGa7M15/St9y', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2467, 29, 'PATTAGUAN JEZREEL', 'jmpattaguan@neda.gov.ph', '2022-05-20 02:55:12', '3RDS-LUPPD', 82, '$2y$10$/6y9tZzGDv4ou14FDxqdOeDW7izqPAnj3ZDnWnoESx4DI1/fhYy4u', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2468, 50, 'RIVERA ANNIELYN', 'acrivera@neda.gov.ph', '2022-05-20 02:55:12', '3RDS-RDPD', 84, '$2y$10$bcCPIH07gn3prJSvMEDr6Or2NuOC/mXzF7v789eXz8L./g7DnzPq.', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2469, 326, 'MAG-ATAS JAYZON', 'jpmag-atas@neda.gov.ph', '2022-05-20 02:55:12', '3IS-TD', 82, '$2y$10$eMjmBZfWVKDefROno1u0y.LkBSQbe8MwI5JojrOE9elaHHR./TWIa', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2470, 53, 'RUIZ ARLENE', 'asruiz@neda.gov.ph', '2022-05-20 02:55:12', '2SDS-HNPD', 39, '$2y$10$/FE76E1IcjMEUF7htPqfP.widyO6ig2KCTGdxj1SlNJjjXkply2oS', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2471, 376, 'GUEVARRA LENARD MARTIN', 'lpguevarra@neda.gov.ph', '2022-05-20 02:55:12', '3ANRES-NRD', 39, '$2y$10$lglYtReCyoR2qkw8enmT5ue5/SEawuvYkDaIhOebgNC7kfxcVhExu', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2472, 364, 'CARONGOY AIKO', 'AGCarongoy@neda.gov.ph', '2022-05-20 02:55:12', '3AS-HRDD', 28, '$2y$10$QoX708DwsqxfPBjotfJzquzupghOMphIwBKO/jJ7j9zBzN/s.hRQK', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2473, 257, 'Ferranco Alen Joy', 'abferranco@neda.gov.ph', '2022-05-20 02:55:12', '3AS-HRMD', 29, '$2y$10$lJebnR.YzJNPMU5MHIcqOeYiig9zZenuPrP1FE39.uJhhIqonCFOa', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2474, 569, 'SEMINIANO RANDY', 'raseminiano@neda.gov.ph', '2022-05-20 02:55:12', '3IS-OD', 25, '$2y$10$jrSSmuYYzJ3r8aZXTG7CD.tW0lXJWn8UrHTVFCasRdNc/M6KLad62', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2475, 380, 'Mariano Mazen Margrette', 'msmariano@neda.gov.ph', '2022-05-20 02:55:12', '3AS-AMD', 28, '$2y$10$HOje7/QfSFLmg044kDa8cu0IykLZAjmobIVg1A3kYsT92F.PFHQfS', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2476, 550, 'JOHN KENNETH CADA', 'jbcada@neda.gov.ph', '2022-05-20 02:55:12', '3NPPS-PFD', 51, '$2y$10$hDdM4/UDL91HpKIEP0fyNe8Fb6W7MRDWbf4/THEvyBI3KpaacffLa', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2477, 519, 'VICTORIA JAVELLANA', 'vdjavellana@neda.gov.ph', '2022-05-20 02:55:12', '3SDS-OD', 26, '$2y$10$Xys5usaDXh1ufgTM6HjR6OTTROaL02Dx2QJ91PYFAjSj1rqMLHwGW', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2478, 470, 'VILLARINO KRISTINE', 'kmvillarino@neda.gov.ph', '2022-05-20 02:55:12', '3RDS-RLIDD', 39, '$2y$10$xsJ504LB4qKCPM1wBRrd0uROtweO3EqejB6DcbOEEEJyeWq7IQ/Ny', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2479, 819, 'MANGUERRA ROSETTE KOREEN', 'rrmanguerra@neda.gov.ph', '2022-05-20 02:55:12', '3OASEC-CAGasDIV', 110, '$2y$10$vyQsKzEvfZkCYUWSPN93eOe5mW5yFA2czerUq8tYdjL67Gev7qlf6', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2480, 838, 'RONALD GUMBAN', 'rcgumban@neda.gov.ph', '2022-05-20 02:55:12', '3AS-HRDD', 85, '$2y$10$SYHr.qMgK2xMzYyZV4742exlCDYrWKZbM4OpCMWnWYkOergq2l4JW', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2481, 839, 'ERIC ABOGADO', 'eeabogado@neda.gov.ph', '2022-05-20 02:55:12', '3FPMS-CPMD', 76, '$2y$10$p5lyRiJQCn16FoVn4vqhtuk.3xzUQtWWZVyU/JQmbuPHolOzgPlii', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2482, 631, 'LIM LESLIE', 'lplim@neda.gov.ph', '2022-05-20 02:55:12', '3DIS-MDD', 59, '$2y$10$2kvJVUsyU1awnBi40JDkzeNytYglzMQ5xhVhf9ODmrAAW0PkR5Qpm', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2483, 683, 'YUMUL DANNA JANE', 'dmyumul@neda.gov.ph', '2022-05-20 02:55:12', '3INO-IFMD', 51, '$2y$10$/n.2j27gd5jjvH5yn2n4h.MugqnLhK.YvZDZxmQHY2ZZKI1eKlCQ.', NULL, 3, 1, NULL, '2022-05-20 02:55:12', '2022-05-20 02:55:12'),
(2484, 682, 'GRUTA GINA', 'gggruta@neda.gov.ph', '2022-05-20 02:55:12', '3INO-IFMD', 50, '$2y$10$8KzrJaequsnpKC.Tu4DIl.N.gFY1T/98f.O68inQo2VcsqDWpvt7m', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2485, 754, 'ALANO JANA THALIA', 'jcalano@neda.gov.ph', '2022-05-20 02:55:13', '3DIS-MDD', 58, '$2y$10$WQOLyOukDynCTtjXhwEqDOmmDu7FZ0hh4mkAWO5Rixe2IcciBS9xu', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2486, 735, 'ESPINA ALEXIS GLENN', 'afespina@neda.gov.ph', '2022-05-20 02:55:13', '3INO-IFMD', 51, '$2y$10$crv3JQ85yL0E/DfhjcZJ4uRdj2Vrr.L70KkODN/AhhV4x8PUi6TlO', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2487, 681, 'GALURA FLORANTE', 'fdgalura@neda.gov.ph', '2022-05-20 02:55:13', '3INO-IFMD', 39, '$2y$10$SRLJXCoxXTdLQ0Fne25KweeAfJJY44OWMD4ImTnsK8HrzDTzdlEP6', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2488, 739, 'ATIENZA KATRINA BEATRICE', 'kmatienza@neda.gov.ph', '2022-05-20 02:55:13', '3INO-IFMD', 82, '$2y$10$D0F0wJUq4hdhGENdUN8QwONfdJN/G9.oRq1hXsioO1xgNUguSpoGq', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2489, 546, 'MELGAR JEMIMA KESIA', 'jvmelgar@neda.gov.ph', '2022-05-20 02:55:13', '3PIS-PFD-II', 82, '$2y$10$u1Zfg.DOBjQ1yXjHN072L.bEm5iYuqjiWVIja1xuaTvOjeX9LuwCa', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2490, 566, 'ALVAREZ CHANHELLE KEITH', 'cmalvarez@neda.gov.ph', '2022-05-20 02:55:13', '3PIS-IPD', 82, '$2y$10$fQjt.d113YqiEiViI.dj1.Egr.oeo8770S0p7t3fT0wkevIwvV32K', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2491, 840, 'ERIK MIGUEL AGUILAR', 'edaguilar@neda.gov.ph', '2022-05-20 02:55:13', '3DIS-MDD', 58, '$2y$10$Aq1yF4S4xrim/zfM64HnQOOfQl3dth2TsPYM1n8R4viiIy8D2XfM.', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2492, 841, 'JOHN MARK COLES', 'jfcoles@neda.gov.ph', '2022-05-20 02:55:13', '3DIS-PRD', 58, '$2y$10$GC/Qu3HyKpcLSd5M47qNUeP.aCb2hOiKuTdN1iYc4GEiFDHkXNS/C', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2493, 842, 'APRIL JOY LEYGA', 'amleyga@neda.gov.ph', '2022-05-20 02:55:13', '3FPMS-CPMD', 76, '$2y$10$hgz3vC.ev8vH98iwOaIo2etiD2WN6VTtuI3FbJRV7y9a.kDPWfZDa', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2494, 843, 'ALELI HABLA', 'achabla@neda.gov.ph', '2022-05-20 02:55:13', '3IS-OD', 26, '$2y$10$qoxIPMNVxu6K1Kmmbv/2W.ricd71T8J5woA/701sC/LZATVbZ6ZOe', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2495, 844, 'PATRICIA ANNE RAMOS', 'plramos@neda.gov.ph', '2022-05-20 02:55:13', '3MES-OD', 23, '$2y$10$eM6cayuvlt88Vd.3QM1hDettsBXP7p10Yww7/ZbLzbfUMbvdOT/7W', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2496, 746, 'ESPINO CHESKA', 'crespino@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 82, '$2y$10$a01vdltgzrGWaGWpDoSJ1Oj6fWLER4OrX0WlUIzXzojYuz3erVDQ2', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2497, 747, 'BARGOLA REGINA ALYSSA', 'rlbargola@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 50, '$2y$10$jO9.djQQ2aP6YY1Rj0PVruF/HPmaVTTAaSEjRqWcslOSnAE5IBSVS', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2498, 742, 'CUEVAS KEVIN', 'ksmcuevas@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 84, '$2y$10$q7JnPQZVl1NjyrAHVMqKR.TPzZBgy/sb5pTltuTqiHFaacowfomAC', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2499, 687, 'MIGUEL ROGERINE', 'rbmiguel@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 39, '$2y$10$lAuMhjjeMzw9tLASXlX6xO71wB119nTsuTWSpOmRoP0KJcg0BcbYC', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2500, 745, 'LOMIBAO IJY JAMES', 'iclomibao@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 50, '$2y$10$p70YKWVXap7d5EBXuTK4uu8IZ1MFfO0WLsAeCkbBTw7ca5NVA3Euy', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2501, 845, 'PAULO JAY DE JESUS', 'pjdejesus@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 51, '$2y$10$3beADDkiRPDczbg9p5cVQ.l3W./0V0TGbxOtNoM2EmQSi1gfNM20a', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2502, 701, 'MERCADO CELINDA', 'camercado@neda.gov.ph', '2022-05-20 02:55:13', '3INO-SPID', 51, '$2y$10$ysjlz26RhKNhZdJwAIvli.WMqD9nZZ7UZEazM09pK29omZQyiJAbm', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2503, 846, 'SARAH MAE DE CASTRO', 'smdecastro@neda.gov.ph', '2022-05-20 02:55:13', '3SDS-HNPD', 50, '$2y$10$Y27ascQybmMimCOfYeiKv.HuAgaoJGaUV956zqO/oqg7xfoMIyXIy', NULL, 3, 1, NULL, '2022-05-20 02:55:13', '2022-05-20 02:55:13'),
(2504, 847, 'HANNAH JOY ALCOMENDAS', 'hdalcomendas@neda.gov.ph', '2022-05-20 02:55:13', '3INO-IFMD', 50, '$2y$10$kV5QosFO6kQoEhNzs5BaletKXn71nTdBgxDMD/BfXyS/ngTa4IwpW', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2505, 848, 'MILLONTE KATE ANDREA', 'kmmillonte@neda.gov.ph', '2022-05-20 02:55:14', '3AS-HRMD', 110, '$2y$10$n/vK/VQNBEMld1kQR/CUsek5EqVTeuNQZOVjTrkPo151LFkmHg0ZW', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2506, 849, 'CHARLOTTE MAE MONTANO', 'montanochamae@gmail.com', '2022-05-20 02:55:14', '3AS-HRMD', 110, '$2y$10$GV1ue9ylCf8EpDxDnluJKe/HSbwEZCvsSuJuy32IsnhPMOXUHQC32', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2507, 850, 'GABRIEL NAPARATO', 'gmnaparato@neda.gov.ph', '2022-05-20 02:55:14', '3LS-LRCD', 73, '$2y$10$zt/4.U0KWlezbWeFJJyvG.dcjhkq92L9a2Ubic7Og2Ax595/JtlwS', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2508, 851, 'SALVADOR BARROZO', 'sbbarrozo@neda.gov.ph', '2022-05-20 02:55:14', '3DIS-MDD', 58, '$2y$10$CEdHEL/dp6ymXZM/hgNiW..u2he543EVetWDceZSPqIS5/aAEIVvm', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2509, 852, 'IMMAH CONCEPCION MAYOR', 'ismayor@neda.gov.ph', '2022-05-20 02:55:14', '3LS-ILD', 34, '$2y$10$tTqIopAPW45iOw6LgR48y.1gETNzUE8FRw6Y/loQebO7eeM2BQeVm', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2510, 853, 'ALEC KARLO BAGUNU', 'ambagunu@neda.gov.ph', '2022-05-20 02:55:14', '3PIS-IPD', 82, '$2y$10$Yn34GrIB44uGZpAsk5jgQ.1LpC0hq6yfY7/Z/QkdN69dkcUHL0pby', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2511, 43, 'RESURRECCION KAREN', 'kmresurreccion@neda.gov.ph', '2022-05-20 02:55:14', '3GS-PGD', 84, '$2y$10$bwdDlS4zgwmki2ucugWyiuGhyxPuqIKCp9C9a9Ked5tEVxzdVU/bi', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2512, 265, 'MANLANGIT GENEROSE', 'gbmanlangit@neda.gov.ph', '2022-05-20 02:55:14', '3NPPS-IED', 39, '$2y$10$pPHm8lfSFTbvcnr5NFA8Wef7k.aofOXQxXdPcCOD599CqaSR9Diii', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2513, 32, 'QUINTOS MELANIE GRACE', 'maquintos@neda.gov.ph', '2022-05-20 02:55:14', '3NPPS-MD', 39, '$2y$10$Mm2Y30pwdUS3vMpErhNU1OX5nIbuzpF80VgUjlpyi/khCnTSmM03C', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2514, 571, 'CASABAL JOHN KENNETH', 'jvcasabal@neda.gov.ph', '2022-05-20 02:55:14', '3ANRES-ED', 51, '$2y$10$dlcXSzEEuT48UJtJ2awYCuYC9FL8DuDamoGpAvaoSM3sYClD93pz6', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2515, 315, 'DELA ROSA MARY JANE', 'mmdelarosa@neda.gov.ph', '2022-05-20 02:55:14', '3ANRES-NRD', 39, '$2y$10$21W65di4wSxS0xLQ21.YU.FN4GSPefhsIDw6i.eJaXhtE3k9PKy6e', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2516, 640, 'GENSHEN ESPEDIDO', 'glespedido@neda.gov.ph', '2022-05-20 02:55:14', '3NPPS-DRD', 51, '$2y$10$DJSNJ9/HgjNhgPvUPbQ6tOmwKIxUruwTsgT0Hb13n7net9924/y3i', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2517, 242, 'TAPNIO KENNETH CASEY', 'kmtapnio@neda.gov.ph', '2022-05-20 02:55:14', '3SDS-HNPD', 51, '$2y$10$zG18GxTK0u0acohLDK7p9eOOPzmttVuaU5aVHHLLYk6II/69pIeLa', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2518, 804, 'HACLA IMEE', 'ishacla@neda.gov.ph', '2022-05-20 02:55:14', '3MES-ESD', 82, '$2y$10$OJa.zGN/H3nqKVCbIHxJ1ul4D3gOv1CTAVSXhXfnmN6qYVY5mF1W.', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2519, 254, 'OLONAN IANAH MARIE', 'ianah.olonan@gmail.com', '2022-05-20 02:55:14', '3MES-SDAD', 82, '$2y$10$F0A/Nm4K/OXYpmWQF/HEUeuMzTCDTSkjuJcq5Ss9Je17rQHfV8OmC', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2520, 166, 'CHENG RANEL RAM', 'rccheng@neda.gov.ph', '2022-05-20 02:55:14', '3INO-IFMD', 84, '$2y$10$xDFPQ1sEFlJq/iwgP1To7uddmUECuC5Sd1wu4FufCyYYYQYid3JdG', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2521, 344, 'AGUILOS CHARLENE MARGARET', 'cdaguilos@neda.gov.ph', '2022-05-20 02:55:14', '3OSECasDIV', 54, '$2y$10$WRQCqcgOhFd4K.Xslnqu4uzsQkLS3aS1Beff4eZtXdkglBFRvSuQC', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2522, 185, 'HIDALGO LARA GIANNA', 'lvhidalgo@neda.gov.ph', '2022-05-20 02:55:14', '3ANRES-NRD', 82, '$2y$10$mnoymFx5qDXjXnp68zeBZ.d7/3sTzvMCjp0cegSvkUB/oVg0v05CK', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2523, 381, 'ROSALES ANA FRANCESCA', 'avrosales@neda.gov.ph', '2022-05-20 02:55:14', '3RDS-RDPD', 84, '$2y$10$3Qm56t0XsNT/HwcZj16nZe92Ksn6/cgq62lUrOkP8b5sCUOOi0G56', NULL, 3, 1, NULL, '2022-05-20 02:55:14', '2022-05-20 02:55:14'),
(2524, 473, 'ABALOS KARL CHRISTIAN', 'kdabalos@neda.gov.ph', '2022-05-20 02:55:14', '3RDS-RDPD', 84, '$2y$10$L5ROoqkC1IudZYB49y8UqOSHZq9RdKA1EhROf1U8wFLTn08ewQcDy', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2525, 653, 'NILLAMA MAE GRACE JUNE', 'mcnillama@gmail.com', '2022-05-20 02:55:15', '3OSECasDIV', 103, '$2y$10$qscrkYUDpJcEOH07GIzhwuUEURdx08/DSaEIZy.4vTXJUeuReedse', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2526, 333, 'NARVAEZ DESIREE JOY', 'donarvaez@neda.gov.ph', '2022-05-20 02:55:15', '2NPPS-OD', 46, '$2y$10$KCUm9t5cBqSb168Pj5mEPuYhjeefFvpmXwiPJmoU0dXGKCfTGQWC6', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2527, 216, 'CAPISTRANO JOSEPH NORLEY', 'jycapistrano@neda.gov.ph', '2022-05-20 02:55:15', '3PIS-OD', 46, '$2y$10$MzqehWNDjcmyV629xnYUgOI3QYUMYgr14O3EnULp47zTb2KvrMQKu', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2528, 95, 'ALDWIN URBINA', 'auurbina@neda.gov.ph', '2022-05-20 02:55:15', '3MES-OD', 46, '$2y$10$Ss7KiSEpXVNusaZ1xt7AdOqGvWlJGBxnGhIA6shrOBJESQGanUGX.', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2529, 155, 'COBALLES FRANCIS BRYAN', 'fccoballes@neda.gov.ph', '2022-05-20 02:55:15', '3IS-OD', 46, '$2y$10$uJB3Onpom/W9wOwH74K.T.5b.1bB2m.dRdwLJAObcP3FzFyRgcrgS', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2530, 461, 'PAGUNSAN MA. MONICA', 'mmppagunsan@yahoo.com', '2022-05-20 02:55:15', '3OSECasDIV', 104, '$2y$10$CO3FubMFjKkoVw0nrA2Qmu3lIyMQjKjTWCL0tDzfPNpg2k2hIo3um', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2531, 47, 'REYES MARIANE GENELOU', 'msreyes@neda.gov.ph', '2022-05-20 02:55:15', '3GS-AGD', 84, '$2y$10$UdiPN0PfkElWCYACRK9EKO3QD7IFJ..KLKB7B/yWwg4bTh1RPrKAy', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2532, 854, 'OCCIANO MARIETTA', 'mhocciano@neda.gov.ph', '2022-05-20 02:55:15', '3AS-HRMD', 110, '$2y$10$oKYVClXt4JGDlHvE0cfQBeLaU6YOhPzW5m380Tv5LyIp81Vt30.jO', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2533, 855, 'REDANIEL LAURENCE JOHN', 'lmredaniel@neda.gov.ph', '2022-05-20 02:55:15', '3AS-HRMD', 110, '$2y$10$rzN2cZHwAKBzsi75hU2B2udDAFaDTjqkF1cTe4I9WuiPwS5l4yRHi', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2534, 71, 'TADEO MARY ANN', 'mmtadeo@neda.gov.ph', '2022-05-20 02:55:15', '3AS-AMD', 31, '$2y$10$Kkdok7cOzBXJW9hXXv2XMuoq6opb9cgizVDheAKd/gRDI7.I1sfUq', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2535, 282, 'BLAS RENATO', 'RPBlas@neda.gov.ph', '2022-05-20 02:55:15', '3ICTS-IND', 65, '$2y$10$M6tt9uMFmmWGQoNDU.rrheu5SrJWCJM2Lva8BTS1cW0EdKO6B8.2S', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2536, 270, 'KO RENANTE', 'ROKo@neda.gov.ph', '2022-05-20 02:55:15', '3LS-ILD', 35, '$2y$10$bwG5rVYWJA9zbPrcJcS4zemEIwKPDFKkmGuwYjzpMyb5OkrTIiITW', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2537, 88, 'ROXAS CHRISTINE', 'caroxas@neda.gov.ph', '2022-05-20 02:55:15', '3LS-LCAD', 73, '$2y$10$hafAQ5EAVQTZtVd/2ReHjefjJsAYHi9fq3L.eKdRXGcc/GMtnHZIu', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2538, 363, 'CABARRUBIAS DONNA MARIE', 'dpcabarrubias@neda.gov.ph', '2022-05-20 02:55:15', '3LS-LRCD', 35, '$2y$10$4kMNNfEZDoQNYFTEs8AuTem3JEp93J.CCZ3e2GdIb5AQzCJh6yTa2', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2539, 256, 'CRISOSTOMO CELSO', 'clcrisostomojr@neda.gov.ph', '2022-05-20 02:55:15', '3NPPS-MD', 82, '$2y$10$rZWG1T4BUQfcXGjPbHxOzOrOQlrAyQvsH0/Ue.1ut5NdLgfjKXdc6', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2540, 296, 'BORLONGAN JEREMY JOHN', 'jgborlongan@neda.gov.ph', '2022-05-20 02:55:15', '3IS-PEED', 82, '$2y$10$zYcub68KweVtbfZ4nBoxEOsYg8EBNxtofUvl6H1BZyxkJHu7q.bLO', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2541, 232, 'KINTANAR GILBERT', 'gvkintanar@neda.gov.ph', '2022-05-20 02:55:15', '3IS-PEED', 82, '$2y$10$5lGTiFRIoPhpOOs5/6X.7OZqYoAoh9fSFCAmnLXun14ufmPJm.X.e', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2542, 856, 'GRAGEDA JAN NICOLAS', 'nicolas.grageda@gmail.com', '2022-05-20 02:55:15', '3OSECasDIV', 110, '$2y$10$kOZbrX8QEH5/6GqjUTbVWu4wB8khhphes7IJw3ZThM6CgTk7jZmH2', NULL, 3, 1, NULL, '2022-05-20 02:55:15', '2022-05-20 02:55:15'),
(2543, 857, 'RODRIGUEZ AURA', 'asrodriguez@neda.gov.ph', '2022-05-20 02:55:15', '3OUSEC-PPGasDIV', 110, '$2y$10$pkqvditte.P8DfRcbOnhnO4Zf.aMyoI/JU4XcREqFJuzeH9jEZVKS', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2544, 858, 'ARELLANO ENA MAE', 'emarellano@neda.gov.ph', '2022-05-20 02:55:16', '3OUSEC-PPGasDIV', 110, '$2y$10$yXp8j/wmzb.Lz/szuElu6OD/u0ChAb0vSI4wBbaRozkHvwqFPNh/q', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2545, 859, 'CAPILI JOSHUA GABRIELLE', 'jfcapili@neda.gov.ph', '2022-05-20 02:55:16', '3OUSEC-PPGasDIV', 110, '$2y$10$LuJDhTazo4uITlsewR7IGOWhrjYY9HnyGkP5zn1byeYslYVrLP1LK', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2546, 860, 'TAN STEPHEN MAR', 'sstan@neda.gov.ph', '2022-05-20 02:55:16', '3OUSEC-PPGasDIV', 110, '$2y$10$Pig72MLNUyM3BXq9aGaAzuVRFld.9Y9qWUfe2s0DPNWrk/wsfSV2S', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2547, 861, 'DIEGO ZYRA EUNICE', 'zcdiego@neda.gov.ph', '2022-05-20 02:55:16', '3OUSEC-PPGasDIV', 110, '$2y$10$X39WI1.9zYe6L1QjUmHvHOc04SNNG3Zg2qFa40tMeFnb3c/DT7.yW', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2548, 862, 'CATOG MEIKA VIEVE', 'mdcatog@neda.gov.ph', '2022-05-20 02:55:16', '3DIS-OD', 110, '$2y$10$dyU1Noivm33cjZbMAI.NKOD5lKOILeK7VnS3n5Ad5yKUbWAATiRSm', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2549, 863, 'BALUNDAY JANICE', 'sdf@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$uc6Ld4RLHIajgkJ2yUwYF.h/7s5.BdmGBYqde4r/ZDpXTajPhJmjy', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2550, 864, 'VIANCA ANGELA CORDERO', 'vbcordero@neda.gov.ph', '2022-05-20 02:55:16', '3AS-OD', 110, '$2y$10$/xPRGZ0OwEiACWNLR4OsWuWUvOS/0T0.Sue1sx7QTc1WpP0tHlGim', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2551, 865, 'CRUZAT ARVIN', '11d@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$i8iXVgDuEAm4ali2hEy3ceoH.qI.gtElntWsHgScMa9okxOXVLToy', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2552, 866, 'DELOS SANTOS ROMAR', 'asf@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$YSSCfyYMgwKmfCXhx1ilnutMjkmVG6dwXzqlksqHSGn1fm/OIsr/a', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2553, 867, 'FLORES KRIZZY VON', 'adf2@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$z66tzGbovq/9FPICJFBguOqn.WHuTElmC6XqJE3Zv9N35keciL9Vy', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2554, 868, 'HERNANDEZ ANGELICA FAYE', 'sss2@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$9wTL3oxACEbAgHw/novKf.mHKe3fi0ujJGgRZxTpqz3Ml.eUFlBh.', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2555, 869, 'IGBUHAY ANTONIO', 'g51@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$Ta7Lr4lwhr/K.DHXs6Sk2eJ5Clox/ZVUh18YaBmVG64RYzyD7KLw2', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2556, 870, 'JIMENEZ SHAIRA KASSANDRA', 'nf2@gmail.com', '2022-05-20 02:55:16', '3AS-AMD', 110, '$2y$10$wLJoZ7ro33pLeVZkAWBoIesWIOfqdcRI3fr0yc2pC8j3zhNYz1HCe', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2557, 871, 'MARCIAL JOANA ROSE', 'jamarcial@neda.gov.ph', '2022-05-20 02:55:16', '3AS-AMD', 110, '$2y$10$IQu2h9VSeBQdll9azX23tukkFyvn0.m1/aLEvYjNAjAFY6XDIts16', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2558, 872, 'MIRANDA MA. JOANNA', 'fds2@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$9UIX/5z88PPpLRE3qZHTfufUR7ZMcUOtzYR4LzIIPleW4DSRs5MKi', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2559, 873, 'ROBREDILLO JAYVEE', 'd4@gmail.com', '2022-05-20 02:55:16', '3AS-HRMD', 110, '$2y$10$BiUWRTlMZT5t8U5ioE7pW.NYIBRERO3Okn.JB6EXxjVEWkViqXmde', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2560, 874, 'VICENTINO ROMEDA MAY', 'revicentino@neda.go.vph', '2022-05-20 02:55:16', '3AS-AMD', 110, '$2y$10$8wqFpVfv8vzliq55C06s4edxN1ITYCKaQ0EDk9ToanqC1tAgefhpS', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2561, 875, 'AGUILA NESTOR', 'nestor09aguila@gmail.com', '2022-05-20 02:55:16', '3AS-AMD', 109, '$2y$10$Y/h68cdZF25H8CHUfKhziuFsCrTWqMUhwhwAj90A.4dsiHjCQAigK', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2562, 876, 'ALESNA BENJAMIN', 'bjalesna@neda.gov.ph', '2022-05-20 02:55:16', '3AS-AMD', 109, '$2y$10$uZZOfsLJ65ZW/8/Mus3LCeYdXEEcAff0xhA6QxzmUa9t7oHq.9xbC', NULL, 3, 1, NULL, '2022-05-20 02:55:16', '2022-05-20 02:55:16'),
(2563, 877, 'ANISCO EDILBERTO', 'eaanisco@neda.gov.ph', '2022-05-20 02:55:16', '3AS-AMD', 109, '$2y$10$MttkAndv4uxfLIfd5vhqD.yqsIcfyt5LZ2x8xe1k6vM7fZXBTKT32', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2564, 878, 'ARTIEDA ROBERTO', 'obetartieda@gmail.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$vkKqm2g/Mg1Rq8GWp7tTf.NJSsVcvHm1ATeKZEGCfib.4y.VB/5O.', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2565, 879, 'CALAMAYA ROBERTO', 'rmcalamaya@neda.gov.ph', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$LLqEmMGrgBv2i8/zG1srIuMXzSWSOKX5pQuwbPsyExsNVWcB0I6dC', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2566, 880, 'CAÑARES JAIME', 'jscanares@neda.gov.ph', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$OqkM7WPh0c/jn48NozlBNeabKpRc00.CsgMfhRkcWcGyY.98l20fO', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2567, 881, 'CORONADO HAROLD', 'coronadoharold25@gmail.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$wRbaFyew2On1Jjmj9UT8IuMyTWemFZFIZcUQ1uy8PC.zsHDz7GqZm', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2568, 882, 'ORTIZ KEN AIZA', 'df3@gmail.com', '2022-05-20 02:55:17', '3AS-HRMD', 110, '$2y$10$zLX7GApw4Wnr8wRbWVc9Uu5GFTCHWn1o/Qfw/jjqxZAAYPWLHh13O', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2569, 883, 'RABUSA JOSHUA', 'df@gmail.com', '2022-05-20 02:55:17', '3AS-HRMD', 110, '$2y$10$Sc.a9fQI190GqOQB/td.D.N.bjlccREczalyCWIbcA4DSPl8fP2Sa', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2570, 884, 'ABES ARTHUR', 'acabes@neda.gov.ph', '2022-05-20 02:55:17', '3INNS-OD', 110, '$2y$10$r5cUpxobhvax21.uafr.8.kmSy7fkp2VmZb/x9bWhZh8qYGz.FObG', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2571, 885, 'MIRAFLOR MADELAINE', 'ts@gmail.com', '2022-05-20 02:55:17', '3AS-HRMD', 110, '$2y$10$SWjC6eV80zmbDhih67mW2et/2RdU24x7cu5odykAkFh3X6p3IaYau', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2572, 886, 'SANGALANG KIM PATRICK', 'khsangalang@neda.gov.ph', '2022-05-20 02:55:17', '3INNS-OD', 110, '$2y$10$nWEttWr4rtB92nfWh6hMDuvr5nXTuzLFQBpjt2VG22HoqcbkGZSi2', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2573, 887, 'VITUG APPLE MARIE', 'fghh@gmail.com', '2022-05-20 02:55:17', '3AS-HRMD', 110, '$2y$10$/J2KC7M4Y/e1GbWaMagTkub7IYDPHPl143kneXH9.Zakp5UmGjZo6', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2574, 888, 'EBIT CIELO', 'cieloebit@gmail.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$R0r9eVOe.ALycyY0gu15TeDpOK62pylaRLjHwyNtw7KtxtwAIhRsu', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2575, 889, 'ESTAÑOL MANUEL', 'manny09lisa13@gmail.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$dB3Ntchl6RaGTBLkt63OnefdgH5.oQTKauv1ye5Bb3Dw9pcYhxt8W', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2576, 890, 'ESTRELLA RENATO', 'roestrella@neda.gov.ph', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$vvMeSb7YEWd4FW0CXkdy4.vH9ApTgBtKj4iEQ9HD1xr0nbJlGu74y', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2577, 891, 'FRANCISCO GILBERT', 'gafranscisco@neda.gov.ph', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$QAmSM4C902Sne7zw98sA/OG9SiBszE1DvCF7CNxUtbM0pAq9Zppmu', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2578, 892, 'IGNACIO RICHARD', 'ignaciorichard688@gmail.com', '2022-05-20 02:55:17', '2AS-AMD', 109, '$2y$10$tHJ5K6RCmVmdiZGa28dtWOLkwCDl4mj9LE8fZNAfYfbZA6hMHxSxq', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2579, 893, 'LATORRE RONNIE', 'ronnielatorre53@gmail.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$V9nB.pKKgJiJhzQl5e29d.aDVnBdJjX2dyikiB0l1KM2bcn6JOXU.', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2580, 894, 'MONTECALVO JUNGER', 'junjeradiguemontecalvo@gmail.com', '2022-05-20 02:55:17', '2AS-AMD', 109, '$2y$10$FKesmy87Ss2j.BGoGs1zDeFAbSQnmDnwbx.YcOEOkq8ad5PhLjOEW', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2581, 895, 'MONTECALVO ROLLY', 'montecalvorolly@yahoo.com', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$.jVPI2ndf20PIwq1R7s4MuRLtEzEMH2iqhmlKXkxNT8veg3RN0PPi', NULL, 3, 1, NULL, '2022-05-20 02:55:17', '2022-05-20 02:55:17'),
(2582, 896, 'NALDOZA JOSE ERWIN', 'jrnaldoza@neda.gov.ph', '2022-05-20 02:55:17', '3AS-AMD', 109, '$2y$10$U9Fw9EJoXYFkr9RaOk4zeetUKegYJfBb/LoKCvCHp2kKxdVBsyxpG', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2583, 897, 'PAMPLONA MICHAEL', 'michaelpamplonaoff@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$8RpQbdCe/lSlqO0rZ6RpvO2t1OEDwYYfZ6Qz3OCCnLacceej7ykL2', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2584, 898, 'QUINTO SHERWIN', 'ssquinto@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$uUjeNiKs1B4ubYPhdqCVoeaJPuKSLwZ0UgiG6Yvhp4lMcwV1wjw/a', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2585, 899, 'ROQUE MAURICE', 'roquemaurice.neda1994@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 114, '$2y$10$vGNuSQCWUCAMxdxxG4rtju7wHo/xg0oVOOIK2CBZJk0kNUipuovpC', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2586, 900, 'SALUDEZ RAMIL', 'rsaludez952@gmail.com', '2022-05-20 02:55:18', '2AS-AMD', 109, '$2y$10$gSQXz3A132uItxin255b3uL5iAAs9DzQoK/stUcAthnLNbzZuST0.', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2587, 901, 'SANTANA ALVIN', 'alvinsantana1973@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$ZzbHTp4xvY8pSf5DqjgH7.pW1ibamesF1MUwDOJRnUtEj/A/5jS0O', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2588, 902, 'SISON FREDIL', 'dhel_92181@yahoo.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$jErfXoV2CDdpGoNuTeEM3OcKPoAmvWPamqd5Q1Vsyoh37TVRDbFGS', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2589, 903, 'SISON JEFFERSON', 'jegasi19@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$q9tu1ZHeQpMONJmU/JfTBu3VLospIqxVKo6dicZu5h9/b0F1U6pm.', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2590, 904, 'TANO ROY', 'rstano@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$rCEg0FsfuFnxJLyxXV.KMewmAa7c1MOWzX.IcfAUfWn/GSA7JIP7W', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2591, 905, 'TEJADA SAMUEL', 'sammytejada04@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$rcdL84E51L3snero/CBcY.Ju7cl8MqtFodFiIj74Qv/TY6OUdNS5i', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2592, 906, 'TINAO SEMION', 'tinaosemion01@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$ywIXyxVsR9AR6qK0Hl62Le8znbiQm.RGhlTOTPnq89XdwEdanbG9u', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2593, 907, 'TOLENTINO RODEL', 'rctolentino@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$GV2/fW7h5q/Wv6WYyCIbSuK1lgo43nsSlFKdQKusNx/x86vPXaX2O', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2594, 908, 'TRONO ERICSON ANGELO', 'ericsonangelotrono@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$cFwD2phR9fkPRYynrZikDuDL1wZM5p85UQ1FTKE1yMUcpHZH5n4ii', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2595, 909, 'UBAS RICARDO', 'richardubas64@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$8wgukxDqUTLbhbyKlCD6AOHjOqep/6Bphn0UTQ6qEuGyGuhk5Fuei', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2596, 910, 'VERIAN ANDRES', 'andybanog@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$pwHTBOgf4xMK36zcXR2p/ORdUUplybrh6YYUJ.9fDUH6X34shgK9O', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2597, 911, 'VILLAFLOR JOSE ASTROBAL', 'javillaflor@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$W70tBfHcFaW41sAiYqxA2O9Mq9kgK6hDDoxlL0tNU0CHM4qW21B/a', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2598, 912, 'ZANTUA CESAR', 'czarzant218@gmail.com', '2022-05-20 02:55:18', '3AS-AMD', 109, '$2y$10$FfRkI5ZaAruuF2TzK7ObY.N037RM25IIkYR0IleaAyukNPvr.wG9W', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2599, 539, 'LACSINA MARILOU', 'aurealacsinaa@yahoo.com', '2022-05-20 02:55:18', '3AS-AMD', 38, '$2y$10$/CQg2m9FxlcZj5RP6/ghCOFBoRFSF8X78F1hGQeGci3F8Yp6AT1ua', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2600, 208, 'BARROGA RAJEWEEN', 'rsbarroga@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 32, '$2y$10$J1HdD5JT2T7ZFZplJv9YYOsFcKa5nL9Lu15jcQ9ZCXNxkpuVBQQqG', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2601, 298, 'CAMINO BERNARDITA', 'bccamino@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 32, '$2y$10$k.ps9ciZEThSnD1YdEdQ.OTvfM9rPT/n8vJLf0Y0XjvWhEx.hedm6', NULL, 3, 1, NULL, '2022-05-20 02:55:18', '2022-05-20 02:55:18'),
(2602, 165, 'ENAGAN ROMMEL', 'rmenagan@neda.gov.ph', '2022-05-20 02:55:18', '3AS-AMD', 32, '$2y$10$1j0AKjlbNzN9RLUzKllf7e8O57Ig5FsVDchej6wbfSSBc9crxjBKa', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2603, 69, 'SISON APOLLO', 'agsison@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 30, '$2y$10$NsT2abud9sFUjYHte72ST.XNILv42HHxTTkESOIGOHeuLIhd9TF.6', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2604, 233, 'GARCILLANOSA MARY GRACE', 'mdgarcillanosa@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 30, '$2y$10$2DVQ6zIqcvSlO55ntVRLDu3Iu7ck0OFO4Ukwx5tmP4C754ORmvVTe', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2605, 14, 'OCAMPO RONALDO', 'rcocampo@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 27, '$2y$10$Ztk8TiI8y84Dda4e9I3koezZx0ktpOa04C0hN1H00qu/YUfB78n8C', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2606, 249, 'Yasay Arjay', 'aryasay@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 28, '$2y$10$.8Zfmop5wmqFxC4oIE.aDO/D3fFL3W2Y2gr2B2ZQWFfazhWV3yOKu', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2607, 832, 'JACQUELINE JOYCE GUERRA', 'jpguerra@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 28, '$2y$10$Gn3mA8IqketSGG0PE1J5d./n55q7c1jGgKJYrnZ6brwxkNEUt5iMu', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2608, 351, 'ANARNA REYNALDO', 'rmanarna@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 26, '$2y$10$vCEgeRuuhOFvWB6YFfCUle3fABPu4DLoencpzc21DqN9yTgOn7qx.', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2609, 97, 'TRINIDAD ALMARIO', 'agtrinidad@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 23, '$2y$10$pTs03PiQDxFyZRJZOoTZmOTzcGjYAGXohiuNZ2Ixo3RVAWDhoWxiO', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2610, 293, 'Belostrino Conrado', 'cpbelostrino@neda.gov.ph', '2022-05-20 02:55:19', '3AS-AMD', 20, '$2y$10$ya5bpdo8laiO3iuriYemCOxwBDkbKNohCN6II2SX7XPr697NUajDi', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2611, 67, 'SASOT JOSE RENATO', 'jtsasot@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 83, '$2y$10$rI25SxHKYEJl.OoGASdFiu6lu/6sLBCJpWh.7CnrpCmVW9zyEf1WC', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2612, 654, 'URMENITA FRANCIS', 'fdurmenita@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 52, '$2y$10$oBaQC7vlRVLmvsz0S2hJluGgVfbdndjhwwaokC8UvUlxsh280nKGS', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2613, 330, 'NACO MARIA THERESA', 'mbnaco@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 32, '$2y$10$Fal6hjYYKTzt0Z4LMNrxRe26aVxdjLoXJQp2TqrYlC1dRevGwZthi', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2614, 669, 'VILLARAN CHRISTOPHER MATTHEW', 'csvillaran@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 31, '$2y$10$tclrBOR3.qwhH8MspIXg5evyoC4aDqnCJ8HRgX08XsH1oH030m36S', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2615, 337, 'MAYUGA CONSTANTINE', 'crmayuga@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 28, '$2y$10$nOhTLCfix76tP3zLZGOLTeWlfHNigEWbuWsJcvQjNbGWpHcHvbK5e', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2616, 31, 'POGADO FLORIAN', 'fbpogado@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 26, '$2y$10$B2ETBowWa92H0cj8YctVBeoXnit0Lp0lULYzxX1D/4ENb2h4BrBWi', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2617, 338, 'Mendoza Benjamin', 'bbmendoza@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 23, '$2y$10$dz6TPVnThimlgfK8t1BGoeqtTY6DIXH1pPvXVSQK.plCtQoqiuxri', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2618, 369, 'CRISTOBAL MANUEL', 'mfcristobal@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 23, '$2y$10$u6eXLxXj.V2Oi8t784wzDeQCxAmQtdqjTxwBqdJnzhRTL3VqXYTkG', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2619, 247, 'LAGRADA RUFINO', 'rdlagrada@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 22, '$2y$10$0YbkNIg4cq8ROrUXhB3nGe7DMx14DFlEkTKbulP6OoGLkxjkISUPq', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2620, 321, 'MAGBOJOS JOSE', 'jimagbojos@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 22, '$2y$10$DcE3o/jRz/L1o8O/mGgwnesf4aOomwGA3tcp7PF2/DWNYrzVpFfzu', NULL, 3, 1, NULL, '2022-05-20 02:55:19', '2022-05-20 02:55:19'),
(2621, 70, 'Tabuzo Enrique', 'ettabuzo@neda.gov.ph', '2022-05-20 02:55:19', '3AS-GSD', 22, '$2y$10$yheuSBT7soM0jShlwJYbI.OhZuKXNl793Eb/HgzkQITBGDpAscCYK', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20');
INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2622, 277, 'BALLESTER GEORGE', 'gdballester@neda.gov.ph', '2022-05-20 02:55:20', '3AS-GSD', 21, '$2y$10$5xK8jObRJdlsezo1AuopK.skEAF1/vQIl1rzPH2kwFkXko94Hw44C', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2623, 230, 'GARCIA SERGIO', 'sngarcia@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 38, '$2y$10$XiABM6gLPNeEVUXXb2zp8uIEHNwAwNqvFpZwSXejVOMGYKEbUGMea', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2624, 287, 'BITUIN ELAINE', 'eybituin@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 83, '$2y$10$v/Wrmhua5nyBHwjIU/CtEOmvBbIZfTKawt.UWbdoh3F1Two7iZLEa', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2625, 329, 'Muhallin Analyn', 'afmuhallin@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 32, '$2y$10$WUgWPypZKUgmXQMof5rJC.nIF0etZ6zBN/Gd/HAosn6u9tfcK2Fiy', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2626, 36, 'PRIMERO SHENA MARIE', 'smprimero@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 32, '$2y$10$SfrtaVdAfP4upAkeRPwQkOthvMoXhYt6mh7K1j83kWBNN2fBmTqne', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2627, 187, 'Jarina Jaymar', 'jljarina@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 31, '$2y$10$D2ak3hhWdw6hpjoBogCQOOZK0qAqgO6ymb7ocxSqZt/ndJqa5xgJ2', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2628, 186, 'EUSEBIO HAZEL', 'hleusebio@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 31, '$2y$10$0HjDNotpxH3j5BPFWe44/uhZcuJOjb5zvThAbWcjTGoMdC.hXNXQ6', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2629, 11, 'MIGUEL MA. AGNES', 'momiguel@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 31, '$2y$10$nrD/vstFrLOpN7ODNkh9jOnet8ILDtBHzQQTa5aKg7GO7lzY8nL0e', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2630, 295, 'GOLEZ MARISSA', 'mlgolez@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 31, '$2y$10$GZ35MyWkSfaYYiRPvA4IXup2pWmsqw2lljOA5ATy3mTKzqSrqzeU6', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2631, 446, 'MONDERIN AUREA MAE', 'apmonderin@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 29, '$2y$10$rzpQ4kDaQLQ6hLdehC5sGOGNgb20mI0F1jEdE0Gi/ENOtIUx5CcEq', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2632, 103, 'VIDAL ANNA BIANCA', 'apvidal@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 29, '$2y$10$QQMNCKOCij9aGC7g7bcu1eIU7MrKhVdNk0IqkqwEi35y8qnsUKXDm', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2633, 176, 'ANTE RAQUEL', 'rvante@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 29, '$2y$10$VCmpHBakJr2VkVyDL5DqrexJeTBtBWLwkvcDJiVjL9EW06QnsVYj6', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2634, 269, 'Lopez John Benedict', 'jslopez@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 29, '$2y$10$vX3AVdBGw0Gj8rjvawG99ukxTILdIQ3SXSkStfKnPa8ds9wTNefoG', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2635, 272, 'ALEGNO MARI ROSE', 'mealegno@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 29, '$2y$10$DpeUyZIVca078lOoiRIU4.ueZT/Tn8PVYoIX7Q1pitgi1L31RKX9y', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2636, 368, 'CASTRO ANGELO', 'ascastro@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 25, '$2y$10$8.aLDbsRc56kPvq9C/Y6h.1WvkAiYR/R6edHsDWvvZJbTXkalXvhu', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2637, 557, 'AYROSO MARK FRANCIS', 'moayroso@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRDD', 25, '$2y$10$N426Zn96hMJjgMyIaehAquQlXKWx2oUUld04fbKNwaJJHT2HXAcT.', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2638, 116, 'DELA CRUZ MYRA', 'midelacruz@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRMD', 38, '$2y$10$zOC30fR3.fLKaJEDK.g7huH/HUwwNnGvVcCK9520yGQGE.Lh/M0qK', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2639, 343, 'Agustin Ma. Victoria', 'mlagustin@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRMD', 83, '$2y$10$MHKqjgKW443BzmDHF.jS2.0ncqyu.FqaqbnSIOpjba7ceqf8KGALO', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2640, 73, 'TALLA JENNIFER', 'jrtalla@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRMD', 32, '$2y$10$x6jLGjSEpVNvrtGo/LjV2uO9Bnm1QnvfmkfiRHcPXsVmPAQHbj.vm', NULL, 3, 1, NULL, '2022-05-20 02:55:20', '2022-05-20 02:55:20'),
(2641, 203, 'LARAYA LARRY', 'ltlaraya@neda.gov.ph', '2022-05-20 02:55:20', '3AS-HRMD', 32, '$2y$10$R.1Le.MT1/hTzPQy0m.3r.vyHnulhcEdsfVCfAY05/1UYKH1bsfI2', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2642, 384, 'Yudelmo Jeazel June', 'jcyudelmo@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 32, '$2y$10$slt7n5ubf.8aDRmQ5i/iauBgPovxmf7B4bmHsLIteBmQwzRksASju', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2643, 319, 'FURISCAL ERWIN', 'etfuriscal@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 31, '$2y$10$xTYZopvHiXlB1CNNDmzIDebH.sB7THYYmrg5ctQfcH1a8ZIMP93ru', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2644, 68, 'TABLADA ROSALIE', 'rstablada@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 31, '$2y$10$IOnBv4cwD4o6s7THgGo5iuFWnOdbrRXYaAsfVHpPnceMoPIx1gB.W', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2645, 712, 'ZAMORA-FRONDA PRECIOUS GAY', 'pzfronda@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 29, '$2y$10$WDzJsQpKJU9jJZo3T4.EIOr.ojMrh7Z6gbIrTdQPzsrhFHmF/G/l.', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2646, 783, 'JOSHUA VEDASTO PURO', 'jvpuro@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 29, '$2y$10$kBQmYs1CUlTQ9DYmCkYare.xFMF59d/B2xGdm/x8keYaosqE5aCo2', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2647, 310, 'DELA CRUZ LEONARDO', 'lpdelacruz@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 26, '$2y$10$pGvYcAn8QT0rfYJKi9bMR.jMuZ3Zg1SNskjwaPw8e5.7QiG3koxJe', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2648, 672, 'BO RAYMOND', 'rbbo@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 26, '$2y$10$Sf0L/HuUwrmiQ68.FDw8M.7LJFDCDUzZDK8NxKVzPscKyb9Vo8yhO', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2649, 84, 'GONZALES NISSHAMAE', 'ndgonzales@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 25, '$2y$10$q5qLHhaRxuFpqucmdjojeOX95GC34ActgkirMhHLHFDyllvEUDUB2', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2650, 703, 'SONDON WINJIE', 'wrsondon@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 25, '$2y$10$Qs7tFfGyaXzde4P7t.3ZOOXcgtoE6/ialCYyzToQZIVGRH4S7vEP6', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2651, 666, 'ANUB ROWENA', 'roanub@neda.gov.ph', '2022-05-20 02:55:21', '3AS-HRMD', 25, '$2y$10$rDOwT.P6n9/b3jqlT4QzO.btFCFyDzoi1dcxdDVqCNYCbH6Mk4WrG', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2652, 395, 'LUMALANG SARAH', 'sklumalang@neda.gov.ph', '2022-05-20 02:55:21', '3AS-OD', 26, '$2y$10$PvKhfHTqiCC9Hy7dT8yXMekhpZmk4EIgJN9hOyE/vXP6DBfZyal1i', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2653, 215, 'MARQUEZ DULCE AGNES', 'dsmarquez@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 38, '$2y$10$oc.iR8PhmdaAMmf8OFaAU.KvD7rcW44RdmYy3E0GQKRrKhDUbJD5a', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2654, 192, 'Aragon Edmond', 'eparagon@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 83, '$2y$10$hInlYdN3dtshhJaeYpwDBuyoYYL9dcLgF5Fa2uouVnGtnZ8x8E6Ee', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2655, 560, 'DELOS SANTOS JAIRUS', 'jjdelossantos@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 32, '$2y$10$cl/4cuYv5mrSNmucotnsquFWKd02mqA8x1Awwy.liNBlKzMhaplGC', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2656, 154, 'CANTOR MARILYN', 'mgcantor@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 32, '$2y$10$Ri2r0ziJmRk2VJAtJBo5yexIZWx.zELFWFrVaLgvx24sGvK4Lynh6', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2657, 219, 'LARAYA JOCELLE ANN', 'jmlaraya@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 31, '$2y$10$s1FMBPUslxqnrzRW3nlccukHG2yU/GjVgXksm9vsZuLkMj/5iogg2', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2658, 331, 'MANZANO ROM JOSEF', 'rpmanzano@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 31, '$2y$10$7UTE6pEjazCcpjn1q9rCnuvazbtv.EQuTgoFFRkFQFYNmrT8lKnA6', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2659, 334, 'NAVAL MARILOU CHERYL', 'marilou_naval@yahoo.com', '2022-05-20 02:55:21', '3AS-PMD', 30, '$2y$10$ZU5.bH2wxijNXtt3DhTlZOrvzXYeThUe3pVJfwCVj9wSz4VRzGO9m', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2660, 787, 'GERLY GRACE LOMBOY', 'grlomboy@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 29, '$2y$10$/p.k6Qxj9m/X1EfIERn4TOsnZ5G2UD44IYAoW114PJFVIyD63J.Ey', NULL, 3, 1, NULL, '2022-05-20 02:55:21', '2022-05-20 02:55:21'),
(2661, 538, 'DELA CRUZ ROSE', 'rldelacruz@neda.gov.ph', '2022-05-20 02:55:21', '3AS-PMD', 29, '$2y$10$N3ZnIT8Kw.7XPt2aGcijQeKNGcH2jFq3qSa7FGCfzgvFAgyGpN5y6', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2662, 64, 'SILLESA MARIA ELIZA', 'mssillesa@neda.gov.ph', '2022-05-20 02:55:22', '3AS-PMD', 29, '$2y$10$Y3znef0.xolMUmv9nl790eHXlaBX0BZrJ1jPrtxQfSF.ZzXWD7vYK', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2663, 40, 'Remos Christopher Anthony', 'cmremos@neda.gov.ph', '2022-05-20 02:55:22', '3AS-PMD', 26, '$2y$10$1EgOFFVK21cHAsQbbpA7euGgfFcsE2LapA/M7tuJPTzQ6UYS5pTp.', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2664, 204, 'BARCE RODOLFO', 'rbbarce@neda.gov.ph', '2022-05-20 02:55:22', '3AS-PMD', 26, '$2y$10$BBEp1y3H25mWMf/6Tfdxve6eyZqG.vYfnT3KddaSpZ7XaD.MO70Ru', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2665, 146, 'CASABAL JULIUS', 'jacasabal@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 39, '$2y$10$Nfel1E6lN.qf3.W1keNLM.kvKEvOQ1YevH25BHi3yKcshkoaRasQW', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2666, 328, 'MARIANO RALPH CAMELO', 'remariano@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 84, '$2y$10$dX2dbS3uAGOtavwYsuGweuPG6z2N3w6rISR5YNH/yIymsVBJ.geFO', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2667, 104, 'CALURA EUNICE CHLOE', 'evcalura@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 82, '$2y$10$JWJGU1y0ZV7IU.CpPBF0OuV4gYbb.W3DlSWWGddYUYUueQDkGxKMa', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2668, 115, 'AGCOPRA JESSA DANICA VILLA', 'jlagcopra@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 82, '$2y$10$nHpZ7Kpn8qKgz6KyVsJH8O5X.4mrEBvQYwbusuOHoJ7ctVpbDpUJu', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2669, 156, 'CELORICO REICHELLE', 'rccelorico@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 82, '$2y$10$yAm0Ww8pFEwiUXtrmO0BLuTgXTWgm0kKh0OGsXKnhfdQnZdTdXpNe', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2670, 663, 'ALCANTARA LIKHA MALAI', 'lcalcantara@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ACD', 51, '$2y$10$eNUwdw.iUNVO5TRxMcck2epn4a1MBbgTdTWEPQth6tPEHK58DYmeK', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2671, 157, 'DACUMOS RORY JAY', 'rsdacumos@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ED', 39, '$2y$10$rCOweT.BjPxA5BU6RGa9UeekdB79N.oIBDi7eNLGF5FW3YIMWmP5u', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2672, 161, 'ANDAL JANE DESIREE', 'jfandal@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ED', 84, '$2y$10$FGgxwZDgpUeep5BOehmfbuWBcwO4.OyW/wPP9xVWAHP8.WWhqUkJG', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2673, 342, 'OLANDAY ALVIN CAEZAR', 'avolanday@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ED', 82, '$2y$10$y1nWwME/AH.ingumXqtNWe1HjZNh7Lx5AqLk56vM3p3LFz0DRNGqO', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2674, 292, 'ISAAC CARYGINE', 'cvisaac@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ED', 82, '$2y$10$7pYJWbK6dXm5z/bhblva9.L7vrBmTCdbuYf7FQAB/A/lWcJPUAVim', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2675, 190, 'LAPURGA MARY GRACE', 'mclapurga@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-ED', 82, '$2y$10$EIg/rKP8TndzqW14Ingp/O8rehIHzfwyII6cLLaoZuNkMZcalo6s.', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2676, 77, 'CAGAMPAN MARK ANGELO', 'mvcagampan@gmail.com', '2022-05-20 02:55:22', '3ANRES-ED', 51, '$2y$10$zk79AMaGqSsizgRqpx1mqOAWxj8B1qzygi7B4X5TuUllHf1zPAQv6', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2677, 346, 'IPAC JILLIAN KAZUMI', 'jvipac@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-NRD', 84, '$2y$10$Clyld25DUSPRzPD2UFZ04OgaXp.DakcxfU/WV/C9sCoSSJy1nMr9G', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2678, 8, 'MIEL-SOLIGUIN JACQUELINE', 'jtmiel@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-NRD', 82, '$2y$10$a5wQQwqRNpBC00qFHm9XteN1SO9nyUzCBk4S0ffSha4LhfgHf7kK6', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2679, 279, 'BANTASAN DOROTHY', 'ddbantasan@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-NRD', 82, '$2y$10$bjRDLEo7GEmjr3iObZ1VDO0sxzsTgKGbFTkR.DdoXxB22FsykncPm', NULL, 3, 1, NULL, '2022-05-20 02:55:22', '2022-05-20 02:55:22'),
(2680, 597, 'BLANCO NICOLE FAITH', 'ndblanco@neda.gov.ph', '2022-05-20 02:55:22', '3ANRES-NRD', 51, '$2y$10$Dkt2bSnEFeqAVxzHTLddB.0yYJpXea9z.DIo12czj7O8WmNWv0EAa', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2681, 596, 'ANDRADA DOMINIC', 'deandrada@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-NRD', 51, '$2y$10$LhmRAp2PJH/J2wwIwBcBJexezLFaYZSkiEy7rEQ10Y9JI2MVXrKbS', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2682, 459, 'NATURAL NIEVA', 'ntnatural@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-OD', 47, '$2y$10$/EdR4PTQac5WMuVU3jIN9.eU.MvWAsju9BVBJOrqmkbe7bnf8sZDi', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2683, 112, 'MAHARJAN DIANE GAIL', 'djllanto@neda.gov.oh', '2022-05-20 02:55:23', '3AS-OD', 46, '$2y$10$3ijgpjBDIZbHZjDwBwjXmebuYTZF9.PCuxM1E6DxdhE84UYv4iAo6', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2684, 476, 'IBANEZ NELSON', 'nbibanez@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-OD', 26, '$2y$10$QHyONSfx2Xohn/AiLNOZQe4ZO4AFVIhjGk3rGdIbW88xWYxrp/s4G', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2685, 479, 'FRONDA FATIMA GRACE', 'tolentinofatimagrace@ymail.com', '2022-05-20 02:55:23', '3ANRES-OD', 25, '$2y$10$6j6oo07eQvV497eOJ46ajOqrZYumxKHONrIgOGPfzQN9W/hNKm/ge', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2686, 591, 'SALAZAR DEMI REI', 'salazardemirei@gmail.com', '2022-05-20 02:55:23', '3ANRES-OD', 23, '$2y$10$MTulQB91eGkbvlqpTY0GK.HfaxkJiSzXlEXusFu8W0c3PyZftfxcy', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2687, 481, 'LORENZANA NELITO', 'nnlorenzana@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-OD', 20, '$2y$10$CLDpMbuekycMD1UUoz19t.K8H/P/XH2Qo0Tisyvoa32MU98D8cRtq', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2688, 193, 'GOMEZ JOSE DOMINADOR', 'jcgomez@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-RISSD', 39, '$2y$10$kn0/qRGPyuBYvdErW4lQIOwvIrfmBzrHb.BZ3r0okhvCKhPxwxyfK', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2689, 273, 'ALFORJA HAZEL ANN', 'hlalforja@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-RISSD', 82, '$2y$10$L8Et/068Bd.hUqzyNBHBg.LkO9KWwTKigc3q3TfG6VxE4Rni3QvJW', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2690, 355, 'TAPERLA ROALD RAY', 'rbtaperla@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-RISSD', 82, '$2y$10$9ady/a5Z9FBB5F4TbPKHRefar0347P3lfzUFbx4jui8L0Og4nCrcq', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2691, 180, 'BONGCAC MARY DESCERY JOY', 'mbbongcac@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-RISSD', 82, '$2y$10$bs/2oZAthK9dfhpxHwSc9eemW7fKx9hTGBcsMPV4.JxgrzVDw71I6', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2692, 827, 'RODOLFO DE GRACIA', 'rsdegracia@neda.gov.ph', '2022-05-20 02:55:23', '3ANRES-RISSD', 50, '$2y$10$61RqEx3Obu3klBbsIRNYLuaz6HNW83LJMfkZ7ITC1nVxlKVE4ERk.', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2693, 790, 'LOGOC RAMON', 'rplogoc@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 61, '$2y$10$2xHHU38G.3vXNVenWZTQf.Mdw0S0WgMVZw9OLArXc9ck4iZqALDmm', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2694, 33, 'QUIRANTE CHERIE ANNE', 'crquirante@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 60, '$2y$10$AOpDjtLckKzXsMjwDdNGtut9dhb0q7T5AIZmcASKvGCJI4YkwKTmS', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2695, 98, 'TORRENTE PAUL CYRIL', 'pdtorrente@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 59, '$2y$10$JKIhkeYPZdwKYALJIqk4h.wciDbe0sT8315ZzOm0kg/4UAkiuYmS6', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2696, 821, 'SURIO JHON MARVIN', 'jrsurio@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 59, '$2y$10$W27KB9BQKVlU9o8hsMgZc.Luds6pe/DwmHx8lu0cKgARo7JAbx.3S', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2697, 122, 'ESCASINAS CLARISSA', 'ceescasinas@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 59, '$2y$10$4u30fJq3jX.r/Km2YZRraOzLD8RrvGXAGMgnuo6w6vucJkMurzl.C', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2698, 134, 'RODELAS ROBERT JAMES', 'rtrodelas@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 58, '$2y$10$lSVQICyMDOJhk2N.pdThleKCnwevv2KO.CI4EuXBQ29/jBgfGncKO', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2699, 788, 'LOUISE GARCIA', 'logarcia@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-KMD', 58, '$2y$10$ZPW0iqilSUedJ3hsjujx0u8vYGhOB0.b70cKWafegyz/v37fhlYxW', NULL, 3, 1, NULL, '2022-05-20 02:55:23', '2022-05-20 02:55:23'),
(2700, 656, 'QUIWA MARIA CHARINA', 'miquiwa@neda.gov.ph', '2022-05-20 02:55:23', '3DIS-MDD', 61, '$2y$10$bDeCMf7w5r/e06NSqyuZueiShT7WnPpaxccqTgl4cdcM1RGhmR/jS', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2701, 163, 'ANGELES RAISSA', 'rpangeles@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-MDD', 60, '$2y$10$R4eg3pcTmK7t6fvmzXTUC.gCuHAl3wknPqL2Nnad/CLofPcGMrMfu', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2702, 304, 'CORNISTA JUDITH', 'jlcornista@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-MDD', 82, '$2y$10$6Brxn/Y84akd.rRpuUrg7e5SWJ5ZoXuPU6QJqUhn2GdLhSGO5i1Tq', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2703, 126, 'CALUBAD RYAN JOSE', 'rccalubad@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-MDD', 59, '$2y$10$kTxAYVJ5PLBcLHKoI7yEfOj2v1jYXLiTDw.wGbEhvYDT4jqIp4UY.', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2704, 510, 'GUTIERREZ JOSE EMMANUEL', 'jkgutierrez@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-MDD', 57, '$2y$10$vTtuoFC7wHH3wi6WsE8ubOim0iAfIRD32UI4VBMu4goR3R04eDDG6', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2705, 455, 'ESGUERRA NERRISA', 'ntesguerra@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 47, '$2y$10$SFKprEFpO.5oVu.J/mU0AOp04di6aRBdg1xOuwKhL78I3yyutCfr6', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2706, 766, 'Cabana Frances Fatima', 'fmcabana@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 46, '$2y$10$MU9qbR9Q/Yn.yQZQLrdmtOYLRBhMkNuI1IQMMxgoS9Z.qTAX7Btnu', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2707, 757, 'LONDRES DRANREB', 'delondres@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 26, '$2y$10$MmK830BusWONmH77j5DpeO512KdY8.V1R5aM./Oe0qgJrMdBazDSa', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2708, 823, 'DELA CRUZ JOYCE BERNADETTE', 'jbdelacruz@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 24, '$2y$10$DVfPhJYP6AgV7.PhhXZk6uSW9S5iOewjGrrd6Lss6l61tIQF3PNLS', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2709, 401, 'BARCELON LEODY', 'lpbarcelon@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 24, '$2y$10$4me8BoWwkr.4rh34.Qgt6e105AquG7MGcz0hm4eyhwiWSn5.PKqgG', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2710, 639, 'ANARNA RONALDO', 'ranarna@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 21, '$2y$10$z6gicf3LQpL66edqrSdQzOZ34nyIa3VkT3fyx/h73El9kl0VUimfe', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2711, 416, 'CUARTERON MILTON', 'mccuarteron@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-OD', 20, '$2y$10$af4Lbq5uY2CmWRCs4.3DyeORkD1/DwvAMUf0ROWld/5foOi.zd92C', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2712, 301, 'CORDERO MARIE JEANETTE', 'mpcordero@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 60, '$2y$10$axH4DCtld1Y27T5EWSJecuTSfkFm6B1aN1gPJ4s9807uTLH/3Yxea', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2713, 130, 'GALURA AILYN', 'adgalura@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 59, '$2y$10$ji3ytlP34X.p049HG7oroe/qRBVmoU871V5dtbFbnsaYfGU6sZJRq', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2714, 362, 'DE LEON DANIEL WESLEY', 'dadeleon@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 59, '$2y$10$IONe535vim5FBslPaykWWeXSFL1zkBvmLg.2kjQs9cxBnhWuu8l4u', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2715, 661, 'NANTA CATHERINE', 'cnnanta@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 58, '$2y$10$owWmnCNnIUoNzuHVHnOIY.JhX0VYIj6/Zna4rExLfxosANhvBKy2i', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2716, 660, 'MARIANO SIGOURNEY RAE', 'sbmariano@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 57, '$2y$10$kKtlT5.ylEawSqsgdk0pduvt9p90e3ATo0jq2vt.AjVUJE0Rg7Svi', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2717, 662, 'VENTURA DEAN CARLO', 'dvventura@neda.gov.ph', '2022-05-20 02:55:24', '3DIS-PRD', 57, '$2y$10$GVB97Tkk8GmmMoknUbdmaOC7kSPX5y0siHAz0R09qiK9co7aOkW6y', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2718, 24, 'PASCUAL LILINDA', 'lcpascual@neda.gov.ph', '2022-05-20 02:55:24', '3FPMS-AD', 37, '$2y$10$ccK..IiX7qCMt20RkDaj3ut8YMwZ7msC4B9U0zBeNyp30Cf/ysXyS', NULL, 3, 1, NULL, '2022-05-20 02:55:24', '2022-05-20 02:55:24'),
(2719, 145, 'CASOY MARVIN', 'marvincasoy@gmail.com', '2022-05-20 02:55:24', '3FPMS-AD', 18, '$2y$10$lmV2.0tjAuwfrYkP4eLK4.C7ilPcvMo.cMETYroM8b2s3qfdiZZcC', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2720, 199, 'MAGALLON KRISTALE GENESSA', 'komagallon@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 18, '$2y$10$ZP1ET9jU5isU6NIXTP/Buuutky4H3qIYpd9x3SaLPmh2OelZoiJka', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2721, 151, 'VICTORIA JED MARI', 'jcvictoria@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 17, '$2y$10$wHIWDJ7GeNWbnsonms7RsOvGoAzU26xDBZFYwTDSpzEr.2cVg/WvK', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2722, 542, 'MANANSALA KRISTINE JOY', 'kpmanansala@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 17, '$2y$10$zCKJCtFqUW49qTZPSK0Xf.L1cTve68TsYbd.5mTUCkpl3pecSpWkm', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2723, 90, 'TOLENTINO LAUREN CHRISTY', 'lttolentino@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 17, '$2y$10$hhAdxfE1/x.KLXOCMWm9luYRFquEyPjpIWS4oeJAGrpGCsPlS55L6', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2724, 609, 'NAVARRO HOWARD ELTON', 'hnnavarro@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 16, '$2y$10$MBTTlBgzUeqk7WB5K4w0AuyeRmbQr6cDlXlvR/IK0VzFffGGXcUIq', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2725, 789, 'GHUELLENE MAGALONA', 'gvmagalona@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 16, '$2y$10$P9FtIXsu8n1FuXjSmj40TevN.qSDCXeDqbDLmr0soDy6O6ORzzwqq', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2726, 5, 'NEBAB MENHART', 'mtnebab@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 26, '$2y$10$znr.vBwJCYgXLzTsIIQbG.mbJzHhbv6/7uBhpJq2EUSKe3Ay4tIh2', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2727, 824, 'RINGEL JOJIE', 'jcringel@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 26, '$2y$10$7CugpMstXYkJR4lJrMvU4OCBlN29ctDNXGTnZLT7sp5dbkOFISG7a', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2728, 634, 'GRAVINES NORELI', 'nogravines@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 26, '$2y$10$FDjdV6sb759sXYGbXEGDUeQVlhhjOU/99VZWCSc.jY2ByxmM8h6ga', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2729, 317, 'ENAGAN MARCELA', 'mpenagan@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 26, '$2y$10$RACuCvC75LsaLKSGgvLq8ORntVTFgTIzTwTbmO7rYuuhVns9e64mm', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2730, 262, 'RAFAEL GLEAMON JAY', 'gmrafael@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-AD', 26, '$2y$10$ztnhIMGlsaBIp/VT4F9bxuTXgKILyJt50hpRQSaSmvMfiaLuOf28y', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2731, 371, 'NARVAEZ MELINDA', 'mfnarvaez@neda.gov.ph', '2022-05-20 02:55:25', '2FPMS-AD', 26, '$2y$10$A90FU5VI6BLARXdft.EGMuYY3t96DeK5sT/BwIQ5gamtL/xEynRhS', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2732, 111, 'LALOG JOSEPH', 'jtlalog@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 38, '$2y$10$u68he7aRxO2WT2YcQOgu.e.V4qr9VM7iip8Zq79LQBJgi0FXcHoiu', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2733, 238, 'JIMENEZ JOSEPHINE', 'jtjimenez@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 32, '$2y$10$aa6X3gtZoPhGi3IKZfGeO.DDn/T6jmhIS6pMIy5JvubgRuEyyzPN.', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2734, 44, 'SALCEDA MARIE ARIADNE CLARA', 'macsalceda21@gmail.com', '2022-05-20 02:55:25', '3FPMS-BD', 32, '$2y$10$/.x2ES9wJCbZZf2IXHck3Ot.nNNaFFp211WTgIBaG6gUjXjdVdwha', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2735, 61, 'TABILOG MYRNA', 'mttabilog@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 31, '$2y$10$IAe93fbcu6m4L08823Q0vO0S2rKVs5BOCHGiGNhIkv2S.m2nE2cvW', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2736, 152, 'CRUZ MARISSA', 'mpcruz@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 31, '$2y$10$SBH8yil5tMio0iJqFIKEl.L7FLvfWOvu.UqBDudWG1MoIMZCn/Xgq', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2737, 226, 'DE CASTRO JOCELYN', 'jddecastro@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 31, '$2y$10$Xqrx2jfoa7c75CkYFPzXTu.cF594KlKz7ZkP1gZ4tsSALxDLDUClS', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2738, 210, 'BARRON VIRGILIO', 'vbbarron@neda.gov.ph', '2022-05-20 02:55:25', '3FPMS-BD', 29, '$2y$10$zys4B1NYfkaR89xhkON9c.lkpPWmW4OkXAlMeiQAPiDQfx/ShgyGq', NULL, 3, 1, NULL, '2022-05-20 02:55:25', '2022-05-20 02:55:25'),
(2739, 347, 'ANSUS MARIFE', 'mafeansus@gmail.com', '2022-05-20 02:55:25', '3FPMS-BD', 29, '$2y$10$fMkwQuUc4ITmdpcnj11SBOxkHypuEC6bYmNv9GZhbOJ/yubEN4OtC', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2740, 541, 'JASTIVE RICHEAL', 'rmjastive@yahoo.com', '2022-05-20 02:55:26', '3FPMS-BD', 26, '$2y$10$4WKbquVD6F7bruz8IRfK0u2CjbEVHPjj.FAA.tt9/5vm2EjRhS.qq', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2741, 211, 'MAGDAY BYRON JOSEPH', 'bamagday@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-CPMD', 78, '$2y$10$GnLc3t62sYdce9b6t.1eE.gR9aX7OERXjBVOjCx8f05RidZrD/Nne', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2742, 143, 'CARPIO KRISTINE AMPARO', 'kbcarpio@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-CPMD', 77, '$2y$10$gfWj4MLcZ/2a4BZZnRutLOsuHIyQuacRlAOCbMixSbHvQzT7AUeHW', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2743, 611, 'DAVID DJOANNA ERIKA', 'dmdavid@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-CPMD', 75, '$2y$10$L7QgGW5ueyBw9y5hRFobzeAO1zlk9uToaqRaH.SYCLCF3U3p/xzL6', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2744, 630, 'MARTINEZ SAMANTHA GAYLE', 'shmartinez@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-CPMD', 74, '$2y$10$PkLUMv1ESg319.oBMwxDuO9CoHx8lYWlCGoiIvvRG1sTLPgaw82r6', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2745, 212, 'BATALLER WALTER', 'WMBataller@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-MD', 38, '$2y$10$xaBf6P5Xf1RuMMvPsSp84OW1OF6A8Xq0Dqe70qe3WUcRdoDYy0ubi', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2746, 46, 'SALVOSA ABE SALVADOR', 'amsalvosa@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-MD', 83, '$2y$10$A//l2X9TTNjehuPjJjt1tez2zxxPyKx0tjgTKB79VryTmBbb48Ofe', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2747, 792, 'ALEXANDRA AMRY HIPOLITO', 'abhipolito@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-MD', 32, '$2y$10$d.xKyacVk61vNU9Fltbdnun0FNo5ORgAL5td1Ctbd39euv8I8qyui', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2748, 635, 'QUERAL ARJOHN JANROE', 'agqueral@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-MD', 31, '$2y$10$kGI0s/MvwLRmR.Kz4qWXaurT.H42hStClesCG5qoD27rP2ym9vCSq', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2749, 520, 'JIMENEZ MARLENE', 'mgjimenez@neda.gov.ph', '2022-05-20 02:55:26', '3FPMS-OD', 26, '$2y$10$7d8g.kuUil0iPzFBw9xR7ewflxI3xjubRlke/2bDenR/cH59WlQzi', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2750, 196, 'GONDRA JUDITH', 'jvgondra@neda.gov.ph', '2022-05-20 02:55:26', '3GS-AGD', 39, '$2y$10$r3ArTrdNz7RXhNn.T3NMCOgLOw4xzhXr4MFxIQZt8y7DsxPzdMCB6', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2751, 833, 'ALFEE REI GALAPON', 'algalapon@neda.gov.ph', '2022-05-20 02:55:26', '3GS-AGD', 82, '$2y$10$nmgjPmvt2Ut.xygRdluE/.SZIF0zpI2yHsjqeQL4Xg55W7dinGm2u', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2752, 48, 'SAMBO HAZEL QUEEN', 'hrsambo@neda.gov.ph', '2022-05-20 02:55:26', '3GS-AGD', 82, '$2y$10$NobCPmzJ.3hh/ACrRxaYsuWYZFO3yH73Q0HpmgS/K4TPbNJALOlUe', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2753, 142, 'SARINAS MARIA ANGELICA', 'musarinas@neda.gov.ph', '2022-05-20 02:55:26', '3GS-AGD', 51, '$2y$10$N/eMcA8QKIho.jAFbee47uK4hxZ89ESnRsE9.f3bihGKbuh3jNtUK', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2754, 464, 'SAPAEN REVERIE PURE', 'rgsapaen@neda.gov.ph', '2022-05-20 02:55:26', '3GS-OD', 46, '$2y$10$cOnsDIOJXAx2IoIFv3QowOMkIgZ7ECCaGJvGOWqSy7IjuAxZirLYe', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2755, 533, 'SALANDANAN CORAZON', 'cssalandanan@neda.gov.ph', '2022-05-20 02:55:26', '2GS-OD', 26, '$2y$10$4OHzSjyQ9nL8zgmquXF3Oue3j67KwtRF./xbzyr/0EvQM0Mflk1FG', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2756, 526, 'NADADO NILO', 'npnadado@neda.gov.ph', '2022-05-20 02:55:26', '3GS-OD', 25, '$2y$10$/PRiJUxP.sFOkpwrgfR.m.wzgNiM/SJvPoeUOjEhCSiPRlKT3j2ji', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2757, 445, 'SANQUI JOEL', 'jtsanqui@neda.gov.ph', '2022-05-20 02:55:26', '3GS-OD', 21, '$2y$10$jVAgaTjX0aKLpLtot/bKZuKJy7rqqDN9Hm/AMKYg3Soebbj5Cv8gW', NULL, 3, 1, NULL, '2022-05-20 02:55:26', '2022-05-20 02:55:26'),
(2758, 222, 'DIVINAGRACIA JOY', 'jjdivine1983@gmail.com', '2022-05-20 02:55:26', '3GS-PGD', 40, '$2y$10$A2oxkQyIDSA8Nhkc92VBuuDEXtUvy8m6PDlJcJiw9JmzLaOlX6jB.', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2759, 100, 'UTANES JANICE', 'jgutanes@neda.gov.ph', '2022-05-20 02:55:27', '3GS-PGD', 82, '$2y$10$vATkbhAWjpOfwg1CjnPa.uvVu1xpKY8/i4Emhuud0iEUpUT.ZZQ/a', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2760, 175, 'ALVAREZ MICHELLE', 'mlalvarez@neda.gov.ph', '2022-05-20 02:55:27', '3GS-PGD', 82, '$2y$10$8l9OyA/dXblJSfDO1MHW4efIFfb1xJdbsQU7ljD2Ej23Q6tI53PYa', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2761, 525, 'MONDOYO ROD NORBERT', 'rdmondoyo@neda.gov.ph', '2022-05-20 02:55:27', '3GS-PGD', 51, '$2y$10$mUNToKckzWXFspH.9v3OPuB/ctMp6mfGqqS6bYq3OunoQ5lMvZY/K', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2762, 664, 'BAIRAN JOSE CARLOS ALEXIS', 'jcbairan@neda.gov.ph', '2022-05-20 02:55:27', '3GS-PGD', 50, '$2y$10$xubCtau1BQ61k4IUEihvausvZIZFbfuAGfk9EWQ.NHCL79O.kxkKW', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2763, 274, 'BABON JOSE RYAN', 'Joseryanbabon@gmail.com', '2022-05-20 02:55:27', '3ICTS-IND', 67, '$2y$10$Rva85m/YdYy/q6mplgnLzemvOBiBMD6yha7oCI5Ey2RszPm9yfoei', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2764, 18, 'OCHOA EMARSON', 'Emar08@gmail.com', '2022-05-20 02:55:27', '2ICTS-IND', 66, '$2y$10$rO7p4mLf2yd3P9N8DRBrRO2x5nPri98qxjeilnh2F7VE0Jm745vhO', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2765, 102, 'VENUS DARWIN', 'Darwin.venus@gmail.com', '2022-05-20 02:55:27', '3ICTS-IND', 63, '$2y$10$nx0nmPJg0S8pYRvWAKPS7.gBoV9w2bZV2w5z7bZcXt8c7P0v0zqcy', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2766, 72, 'TABIEN OSWALDO', 'ODTabien@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 62, '$2y$10$4PmcgnMYMfpo57K/Wqocu.5tfjJvmZ/xDDCnBVrXKpruS9Zzj2YUm', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2767, 507, 'MIRABITE RAFAEL', 'rfmirabite@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 41, '$2y$10$OVLg0Z8qj76ERSYp/iEiL.JrJyvl3ejmeDrtiw6IQ4b/v39nJfIOO', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2768, 556, 'LIM ROBERTO', 'RALim@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 41, '$2y$10$CxhfPrg8DfWH7BIBJ6lCDuSTBV.GmPUbYBShhx9oXY/NtR1vXTfXW', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2769, 141, 'SANTOS KIERL', 'KLSantos@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 42, '$2y$10$KeIxp0eCUqlmtJJtZy1cAO9lcMhbRFt1a28Yt9r8OvlMbjZLV3gm6', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2770, 16, 'PANELO PETER JOHN', 'PBPanelo@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 42, '$2y$10$DXnlZ4T7idFY4xyr5m4HQuJG5pdTqENvGkjX929MCkxnsKMC9XE.C', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2771, 558, 'AGUINALDO CELINE', 'CPAguinaldo@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-IND', 42, '$2y$10$m2hyJoNM2hmts03RHXkBtOmQEsHnUNlItKiz8g3VTHU7TeQ.Q40Bq', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2772, 616, 'TERUEL ALVIN', 'ajteruel@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 67, '$2y$10$g/yQlHfcWqWZwvUT0n1zoeeRzT4dmlvHRE4Q8G/ESakpwOHcnJuXC', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2773, 325, 'LAYON BERNARD', 'BNLayon@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 66, '$2y$10$0fk2jibvgMhBevovNoUzMuWFsFflQ2/W.TZwtAyzsz7ASKdN3fqym', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2774, 302, 'CASTILLO DORINA', 'DOCastillo@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 64, '$2y$10$upIMED7gmh8aYCMhZSF7oeDRHwsVm/P8ZlW7HNgI9Oyz.OKgM5Jkm', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2775, 54, 'SANTOS ARMANDO', 'ALSantos@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 64, '$2y$10$Q2F7w3VD5gtEilrTSX6LluRTO0x447PSC.r1zPkkGTpT9JDS2oPrK', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2776, 37, 'PEDROZO IRENE', 'ICPedrozo@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 63, '$2y$10$4fQ2hlPObOz4WEpamuJJr.19kFpxhwr4RramJXLzWReO/WsLr/SHG', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2777, 551, 'FUSI HAZEL JOY', 'HDFusi@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 43, '$2y$10$ra4zL2HmH2WxFRS2ZNQZN.gpsVr2RJSkDBcOsX4xDlzB9DnZkcBgW', NULL, 3, 1, NULL, '2022-05-20 02:55:27', '2022-05-20 02:55:27'),
(2778, 668, 'ROLANDO G. JARABATA', 'RGJarabataX@neda.gov.ph', '2022-05-20 02:55:27', '3ICTS-ISDD', 43, '$2y$10$IqknfkLmrnKXkaQ2Xu7GCuhyBXq7aysPagkn2Ki4uR32JvRlSYrym', NULL, 3, 1, '6sgGs4rY90vLHawxbRp5GuV32U1Zwn2ym0A7P8ERVT3yIUKHttSSshahVH8U', '2022-05-20 02:55:28', '2022-05-23 04:56:18'),
(2779, 770, 'ESTADILLA MARK JOVER', 'mvestadilla1@neda.gov.ph', '2022-05-20 02:55:28', '3ICTS-ISDD', 62, '$2y$10$HgJoSIFfc5C2Xul7wus9dephaP8pppsh4cn17bSBMt9KWHEoqzm76', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2780, 391, 'IGTIBEN FLORANTE', 'FGIgtiben@neda.gov.ph', '2022-05-20 02:55:28', '3ICTS-OD', 47, '$2y$10$md5hTuHbng3H12XDIoGqVO0iOQQ108z/e45Xp3j9FRg56sIPx3N5C', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2781, 388, 'CRUZ LAURICE ISOBEL', 'IGCruz@neda.gov.ph', '2022-05-20 02:55:28', '3ICTS-OD', 26, '$2y$10$r3oeSGxY6qHkmE6XODiXhOSFi6PcXRqTt5gLoIrPIcUKBAKT8.CUi', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2782, 385, 'BAGUISI SOL', 'SDBaguisi@neda.gov.ph', '2022-05-20 02:55:28', '2ICTS-OD', 21, '$2y$10$ZVvK.5y/Hp2EvkmC6GCYk.ufIlwPl5iss8UpPq2kRQCqWnjX7VXIa', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2783, 537, 'YUMUL ALLAN', 'aoyumul@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-MAD', 72, '$2y$10$4vGZAsh4ZZzA5rm8r9O59eMqfVdnfeEyh4WtbndEGuwav4.fVqWuq', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2784, 532, 'SANTOS REYSELLE ROSE', 'rosantos@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-MAD', 71, '$2y$10$jKv25uBUHMyNnuojLypL0.frr3YLDP7AxhCCkITMW.dB/ZkaM71EG', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2785, 673, 'NIDEA RUBY', 'ranidea@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-OD', 26, '$2y$10$w7H6ovJqfezCyeXYNSIc9.o2JQ1ujL9ka33oaWeAz8lROoIG4Pe.S', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2786, 812, 'LAARNI PONCE', 'laponce@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-OD', 68, '$2y$10$SC.u0thND4spHaOkwr7.3.svd/uDbHcSt1kWO2tCBUUfOF..0XBjW', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2787, 530, 'ROCAMORA JUAN ANGELO', 'jgrocamora@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-OAD', 72, '$2y$10$GkNxgYrYhxaSCOR3tcy.LuG4o2meDpTiW6WksrkasORNJv.Uv23jq', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2788, 522, 'MANGIBIN MICHELLE MAE', 'mcmangibin@neda.gov.ph', '2022-05-20 02:55:28', '3IAS-OAD', 70, '$2y$10$e1ddHTvsmqMr8pX0//IYy.kUmFeGgsn.kMAj7eknvHQvpubTFN5nG', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2789, 52, 'SANTOS CRISELLE', 'cssantos@neda.gov.ph', '2022-05-20 02:55:28', '3IS-ICTD', 39, '$2y$10$BxdHLVXKJZJCCp5KBWHKleP3rMvthzA4/8Dh07W9dbvNVeglI5h22', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2790, 228, 'GARCIA RENZ MARK', 'rvgarcia@neda.gov.ph', '2022-05-20 02:55:28', '3IS-ICTD', 84, '$2y$10$5Eh5GulOJUeZ0nyNX9Ak9Ohp8.ycCtPZv.fDgkMZVo7A1pGrbii5m', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2791, 30, 'RAMIREZ ARMANDO', 'amramirez@neda.gov.ph', '2022-05-20 02:55:28', '3IS-ICTD', 82, '$2y$10$Rr9W59CsNj0BWUKc1HmRZumk8PnED4EGC.06uTzCcItKvt29aOWnC', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2792, 297, 'BORROMEO SHERYL', 'saborromeo@neda.gov.ph', '2022-05-20 02:55:28', '3IS-ICTD', 82, '$2y$10$bDSsWHtg9S5SXT2Nf8FW.ui15FdC4A4Rcn8f4CLxfb7YTRiIiQGdq', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2793, 413, 'COLLANTES BRYAN RAYMUND', 'btcollantes@neda.gov.ph', '2022-05-20 02:55:28', '3IS-OD', 49, '$2y$10$7KOLJnTHLz9ToyprhPuBnel19KbpCJ7sLNtPwsG6g8BLrh5iPgnuy', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2794, 771, 'AGUILA MERLITA', 'mcaguila@neda.gov.ph', '2022-05-20 02:55:28', '3IS-OD', 25, '$2y$10$2ovq5MMJF/tqOgDRTgIoyuigdziS.A4CBxqeUOF/6XuotD8L1cRGq', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2795, 793, 'SHERELL WINVY ONGLEO', 'syongleo@neda.gov.ph', '2022-05-20 02:55:28', '3IS-OD', 25, '$2y$10$hvd//MDGa8I7wJRXF5ItoeEW5VE4KqskQKhW49c/RlMNdoirT2YeC', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2796, 505, 'VELO ANNABELLE', 'apvelo@neda.gov.ph', '2022-05-20 02:55:28', '3IS-OD', 24, '$2y$10$9GRsZKS8SouqI1Q7xAQ9hed8y25pivNt3p6gsULPffv9hdqGczdCK', NULL, 3, 1, NULL, '2022-05-20 02:55:28', '2022-05-20 02:55:28'),
(2797, 614, 'PARALEJAS NELSON', 'ncparalejas@neda.gov.ph', '2022-05-20 02:55:28', '3IS-OD', 21, '$2y$10$bC5udAOG43mnl.Oiz.Fmguvz3FaOlyRO0VhVFEXapBciuw89E9/Ai', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2798, 356, 'BASILIO EDGAR', 'eabasilio@neda.gov.ph', '2022-05-20 02:55:29', '3IS-PEED', 39, '$2y$10$hHEPRqEW.3EWbW6/RHxi/.Gw2yf0oWcTwxbNXYJf20wliEgX9uwxS', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2799, 10, 'MORALES CHARLENE CHRIS', 'crmorales@neda.gov.ph', '2022-05-20 02:55:29', '3IS-PEED', 82, '$2y$10$m4DyBxTSHWWq5otm6gKeguKYgg0ZcGCPDduRq.WRP.Vle.XDCiZ7K', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2800, 201, 'MAGTALAS BERNIE', 'bcmagtalas@neda.gov.ph', '2022-05-20 02:55:29', '3IS-PEED', 82, '$2y$10$7VHcwayrnHcqtUAV5uRWKei1oMTgOK1pPGvo.6oc8qHKLqVNuxF1W', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2801, 79, 'MALAYAO VINCENT', 'vtmalayao@neda.gov.ph', '2022-05-20 02:55:29', '3IS-PEED', 51, '$2y$10$4fFeI/ZoifRVEzg8Xb.Pc.O5EL.oYs7Xez6IgxzP69Idf04zEHA1S', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2802, 791, 'FERNANDO VICTOR MANICAD', 'famanicad@neda.gov.ph', '2022-05-20 02:55:29', '3IS-PEED', 50, '$2y$10$943slHzaWzZl0FK0/tdA5eOsrPhfDVimEFrTCKnP4FOvWzM.9KCk6', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2803, 214, 'BAYOT GERALDINE', 'gbbayot@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 84, '$2y$10$JoC4E28OTBV.Q1R8.pxek.gZ941mgJvYTtGNe3OrghG.TUF8LWQN2', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2804, 303, 'CORTES NATHANIA RAE', 'nzcortes@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 82, '$2y$10$kMOOsxu6Eet0345iTwa5Lu2GZjKT6iWw3Nk/9SbaR6Egrck.gp/P2', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2805, 339, 'DAYO JOHN PAUL', 'jydayo@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 82, '$2y$10$tDk4/F71f/IWR2INhyvqne.1C89UkBxanAoGK7Kh94Xy4BAcZ6XQe', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2806, 172, 'DE VERA DANELA', 'drdevera@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 82, '$2y$10$J/.sAf9jDaq9K2L9eZiH5eWiiLd9nbSKOnqHFRJ/biuJInzRVqIT6', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2807, 559, 'FERRER MARINA IRENE KARANA', 'mnferrer@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 82, '$2y$10$9yyiAkpW1AJfZvYxdQMg5uoA6ycWndesVj81zT6.WnmsLwckRu4E.', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2808, 610, 'ORDONIO PATRICIA CELINE', 'pcordonio@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 51, '$2y$10$JLJkbXwGHIuWtgFXzchTAuwnjggi1Si7p3vF3gr3eelnXCeGo30bi', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2809, 810, 'JEREL ELIBER EDWIN CRUZ', 'jlcruz@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 50, '$2y$10$pbnW/RjqVxCkBqQel2/qw.W6xZ53XcqvnqYILG/McZFdfOD/37FMy', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2810, 769, 'DEL RIO DENIECE RYANNA', 'DDDelrio@neda.gov.ph', '2022-05-20 02:55:29', '3IS-SOPID', 50, '$2y$10$B4JJ2Ft8xVMtc7dAo8q73uWJd/g25qfE8sAwgJbwKwhDrwWjwpfa.', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2811, 251, 'MALIMIT MARY ASH DAY', 'momalimit@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 39, '$2y$10$rg0VDrX.hkBJ4lDbINGJ7.zJM8orGeMiUXRtmk/Z.X6Z4MZ5/8o4C', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2812, 261, 'MANZANO KEVIN GILBERT', 'kmmanzano@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 84, '$2y$10$DXN1cJca9GRwXyY.oZgbfuaQ0otouMi2BpSyAXZQarfRh982Olkg6', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2813, 20, 'PANGILINAN FELJUNE', 'juenmadara@gmail.com', '2022-05-20 02:55:29', '3IS-TD', 82, '$2y$10$wNTJP600xZ1ucgoCynURaewuR8JTCvol89UbLQeeDflYyLw/4iEaW', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2814, 195, 'MANDI JESSICA VIEN', 'jsmandi@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 82, '$2y$10$lkqn4GEkBPUJzPUUGylk0OS9D5ET5Ufj/Sel0eDUSkB/6nKaClAYG', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2815, 96, 'TRIA ARGEL JOSEPH', 'astria@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 82, '$2y$10$o6h/QVnXMYFGvoQKhIa8EOQR3g13dQhY5UcfbWSdhGP6Aye83VSX.', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2816, 309, 'DE LUNA QUINTIN DWIGHT', 'qgdeluna@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 82, '$2y$10$nyCGtAn.McAdm23G/o278e4J.AP8XD9g9GpjDzxOzXljV5/Hq7rBm', NULL, 3, 1, NULL, '2022-05-20 02:55:29', '2022-05-20 02:55:29'),
(2817, 593, 'LICOS FRITZ KYLE', 'fplicos@neda.gov.ph', '2022-05-20 02:55:29', '3IS-TD', 51, '$2y$10$1evZ/GA4no3mxYPPtgGPK.0Go996ul0eBtOScvRpXKqnYckVEDdUa', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2818, 655, 'YUAG RONELLE', 'rsyuag@neda.gov.ph', '2022-05-20 02:55:30', '3IS-TD', 51, '$2y$10$J8kitT70GoobUV0EBuCGz.SbK.tiACX.TPF1m3DMr79QjhEOEBu7W', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2819, 598, 'LIM MELORIE', 'MDGLim@neda.gov.ph', '2022-05-20 02:55:30', '3IS-TD', 51, '$2y$10$UQ0UjIJggVJpuG5fmpXPWOU6lmkJuP4way2wr0jJ0qlmU09Xpo3/O', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2820, 794, 'ARIANNE ROSE SANTOS', 'aasantos@neda.gov.ph', '2022-05-20 02:55:30', '3IS-TD', 50, '$2y$10$krjIRec9FLYDw6U6cuqvAOou5AmafBi4V/vHS6RdM7cj0T7BUVn9K', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2821, 811, 'JOHN PEPARD RINCHON', 'jmrinchon@neda.gov.ph', '2022-05-20 02:55:30', '3IS-TD', 50, '$2y$10$ne//DH2IEG3OQoQq9GQkx.ar2p.uXRG/Rgev9TRbuZeeJLQhBkVr.', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2822, 271, 'LICOS MARIA GENELIN', 'genllorin@yahoo.com', '2022-05-20 02:55:30', '3IS-VRAIRD', 39, '$2y$10$rVCRXh/PmnmNiFO3zhYoluL6n5i5Tg0QQ5WnmqE8Hs8jwLgseX7Nu', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2823, 289, 'JARIN ART REAGAN', 'amjarin@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 84, '$2y$10$5Xxkwn42CfhG5aAylD/YfuFrDu6h0DFH.lJipwU/0/Ptd47mdG1um', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2824, 144, 'STA. ISABEL LEYDEN', 'lcstaisabel@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 82, '$2y$10$h6s9Lu2Wk58eKEuvE.lM5uSSZIvWfj3Lr4vOc33eUkrH3/wUv.L3S', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2825, 164, 'CORONEL MIKAEL ANGELICO', 'mpcoronel@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 82, '$2y$10$uQBLJzwRpPJjlUDtHojQgOeasoyjNDIRBDWS2/F5hCvCB2hgf8rYO', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2826, 49, 'ROXAS REYCHIEL', 'rlroxas@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 82, '$2y$10$AVl78Rpw17lTxHc/NfbeoO46XNMHQlF3vg/NTgD.VV0Mz877LvE5S', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2827, 205, 'MELLIZAS MARIAN MAE', 'mlmellizas@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 82, '$2y$10$2JbB3hTmTfDOw2rtX3r32uVUWZ2b6q7J.J3YeNl8ETKQPM.OkaBte', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2828, 582, 'ZORNOSA DAVE PAULO', 'dgzornosa@neda.gov.ph', '2022-05-20 02:55:30', '3IS-VRAIRD', 51, '$2y$10$56515BkoRnE0WNiUH5T5e.wK.dRZ45mPw1f18VKtGF.ZIi/2EdFeW', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2829, 659, 'SAMSON RAFAEL ANGELO', 'rafaelangelosamson@gmail.com', '2022-05-20 02:55:30', '3IS-VRAIRD', 51, '$2y$10$afDNZTUkOSDtZqpu7xeR4OZe8La./1HD0alI6gts.S2/wX6aJrojS', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2830, 836, 'ADRIAN JAY JARIN', 'adrianjaymjarin@yahoo.com', '2022-05-20 02:55:30', '3IS-VRAIRD', 50, '$2y$10$ZGtp7Uvgy.XGJizFCf4hfeVD8HfHYo3bHo0wiEF3H57fdq9yxkpwm', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2831, 312, 'DIAZ ERNEST ALBERT', 'eadiaz@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 84, '$2y$10$Dyncrz/nBu83DmBBsJJnr.BeFAkHTpSPGf3GDju8ugx3k31AudD9e', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2832, 240, 'JINGCO LUELLE RENEE', 'lcjingco@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 82, '$2y$10$fdyQggMS32kz9ifrK379Z.U0DIqW0hS491W1QDn.0TNE/smcfxdg6', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2833, 377, 'PEREZ KATHLEEN', 'kgperez@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 82, '$2y$10$LZ/aVDvgVjssKedi2KvAQuDMyrWtrBwxBczek1lEEPo8/wza5awF.', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2834, 42, 'ALCANTARA JUVY', 'jsalcantara@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 82, '$2y$10$r/EhbSF.wURGliuyGTC1U.YouEjmM14VjTvVlCls8B/KiFpIqZCK6', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2835, 41, 'ROJO DARWIN JARVIS', 'dbrojo@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 82, '$2y$10$KUH7HQ4vepdyuVzsN.XUx.a8X5cAK8lPCyG1rfzFpeAgCRt5r7d0q', NULL, 3, 1, NULL, '2022-05-20 02:55:30', '2022-05-20 02:55:30'),
(2836, 244, 'LAGAHIT CHERRIELYN', 'ctlagahit@neda.gov.ph', '2022-05-20 02:55:30', '3IS-WRD', 82, '$2y$10$4xGTZ2YPJu3QbY.Gy/qb4uIkh9pFVH5ut5hIBBgKP1LwbSMK9aaDy', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2837, 599, 'GO RAYMOND JOHN', 'rcgo@neda.gov.ph', '2022-05-20 02:55:31', '3IS-WRD', 51, '$2y$10$y2TLHbvMQzaxolePMK9rj.RBApKSD4x8TsG0hgNcv1hg7nOB4XPUO', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2838, 590, 'VILLALUZ FINELLA JIANNA', 'favillaluz@neda.gov.ph', '2022-05-20 02:55:31', '3IS-WRD', 51, '$2y$10$dwQPJCkYT/fa3A7Yz1LPVuGb.BUIUvbs1OWgYty6FH2E/4aweEvNK', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2839, 834, 'JENNA MAE DAWIS', 'jodawis@neda.gov.ph', '2022-05-20 02:55:31', '3IS-WRD', 50, '$2y$10$yNmnbrwgO4UHOe.x6IaaEuowQvxhqOdcyRA87h.8KvNu0lVXW6/Si', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2840, 124, 'BALDOS JENNIFER', 'jcbaldos@neda.gov.ph', '2022-05-20 02:55:31', '3LS-ILD', 36, '$2y$10$9xpU88YnxMSgZTsaPeR0GOzxwNf68GXOdJCqtExDvgR0OAhESiBvW', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2841, 768, 'BUELLA RALPH GABRIEL', 'rdbuella@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LRCD', 73, '$2y$10$w.YEQxKAw.vPQkYhydSRau2J0G4dyrmPYbm6sWwWv1dJ0bUcfXFDW', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2842, 359, 'BASQUINEZ FLORA SHERRY', 'fmbasquinez@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LCAD', 36, '$2y$10$7/U4qHkz6nNdsl80oNqiAO.2m.R7jbbIi1SR7BRd.x6OmSsSrscoW', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2843, 133, 'MENDOZA ALEXANDRIA', 'azmendoza@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LCAD', 35, '$2y$10$JkRliOsbQRM2MZvCejHJO.6tx7Oytl4Z2ecox8u/euKL2kPzYj3vO', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31');
INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2844, 670, 'YAP RAFAEL CHRISTOPHER', 'rlyap@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LCAD', 34, '$2y$10$Zm.Xuql5tBJJK01O891ejeIWWc/bILdKlazSqLJrJxkL23b4xEXTa', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2845, 796, 'LYRA MAE GONZAGA', 'lmgonzaga@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LCAD', 34, '$2y$10$U1PNb.MRKBBAuLwZJjweIOOWd26.4SFzYNcYzjuwJgUYLvCenrmTa', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2846, 56, 'SAQUETON-ANTONIO MARIA CRESENCIANA', 'msantonio@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LRCD', 36, '$2y$10$9UZbAQJHD2As9g.NWW2nMeP6CbbWBIM/MehFCnmQDv07pLnilb39S', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2847, 547, 'DAVID SHEIGLA NERIE', 'svdavid@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LRCD', 34, '$2y$10$IkcZVJKrskgOQAEQrgyoZuV94g6nd6ErjD07I0dNa2QmuS3pDSJ4u', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2848, 795, 'DE GUZMAN ERICCA MARIE', 'endeguzman@neda.gov.ph', '2022-05-20 02:55:31', '3LS-LRCD', 34, '$2y$10$ctCiRija13WxEXOuQShbxu896/8j62zaG2/zGHvz0Bfx0N1uNA5Lq', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2849, 386, 'BERNARDINO ORLANE', 'ombernardino@neda.gov.ph', '2022-05-20 02:55:31', '3LS-OD', 26, '$2y$10$blF8RwNEcQSspz2yw5rfEusx9mMXDefqnp7Zjuk1lcNhaxmlKD22K', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2850, 383, 'ASENJO AGNES', 'amasenjo@neda.gov.ph', '2022-05-20 02:55:31', '3LS-OD', 26, '$2y$10$8Q0QP8XX4HuktN5b3DgI/u3hH3bziZrzy4.2VpNCQRcgEKm0QXFqm', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2851, 389, 'GARCIA BENJAMIN SOLOMON', 'bagarcia@neda.gov.ph', '2022-05-20 02:55:31', '3LS-OD', 25, '$2y$10$t0TFYrU8YNGaGOlEDVeXzexteNHdRCfRfUGfE7hHMgBmK2ca4YsGq', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2852, 110, 'DAVID JESSE', 'jtdavid@neda.gov.ph', '2022-05-20 02:55:31', '3MES-ESD', 39, '$2y$10$g.dMBBYLuvE5GzpCFIA7Fe8T/2EsN49FKfNWHro/1W1OmGh7SeplS', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2853, 281, 'BERMUDEZ NIKKI ANN', 'ncbermudez@neda.gov.ph', '2022-05-20 02:55:31', '3MES-ESD', 84, '$2y$10$YrIZ069ZPJmeMDAFpgU4W.sE4BvHeTSvFwpO4L1LgnGyw3K/AoY0S', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2854, 55, 'SANTOS RHONEL', 'rmsantos@neda.gov.ph', '2022-05-20 02:55:31', '2MES-ESD', 82, '$2y$10$Jc0wIUxwOwN9Rqy4wUJDB.1ke6JcbmAVLLKY/hPMM7SfL/kOkqzgO', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2855, 237, 'JOSE MARIA SHERINNA YSABEL', 'msjose@neda.gov.ph', '2022-05-20 02:55:31', '3MES-NTISD', 39, '$2y$10$So1YeejUFBvzn52w90gE.OGhCt.s/UdUQ1cN0Z82AhcJ3DSZhR3se', NULL, 3, 1, NULL, '2022-05-20 02:55:31', '2022-05-20 02:55:31'),
(2856, 313, 'DELOS REYES MILDRED', 'mfdelosreyes@neda.gov.ph', '2022-05-20 02:55:31', '3MES-NTISD', 82, '$2y$10$vtKL4mbWT5ALEreH2mp95.yNE6Ip71Fd23efdN/ssMRWu/uNRX9X.', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2857, 117, 'ANDES ARJELETTE', 'agandes@neda.gov.ph', '2022-05-20 02:55:32', '3MES-NTISD', 82, '$2y$10$0R8WpIBsWPYUeTgTOFcLXeQflsNyZUqGA3nx.aLCUrgY6j1A994YW', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2858, 451, 'VIOLETA CORPUS', 'vscorpus@neda.gov.ph', '2022-05-20 02:55:32', '3MES-OD', 47, '$2y$10$MX6Zsy6scBJ2.omAmHCVUOi4whcAZ2IhWMRoKb6rnYPcPQt/ATIAe', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2859, 543, 'SALAZAR MARITES', 'mmsalazar@neda.gov.ph', '2022-05-20 02:55:32', '3MES-OD', 26, '$2y$10$DQ4LuJ4WMKNcpPYHUz9Ddu0IfpvU7yrCeiYZQsJSv.93XDh0nCF5y', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2860, 515, 'AUGUSTO FRANCISCO', 'asfrancisco@neda.gov.ph', '2022-05-20 02:55:32', '2MES-OD', 25, '$2y$10$asjgAOQ8xxjic/kgCOdw0u9cmFBY/vCHl/yxwrIQa9d4ijf/ukHIG', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2861, 513, 'FALLADO MA. ISABEL', 'mefallado@neda.gov.ph', '2022-05-20 02:55:32', '3MES-OD', 25, '$2y$10$IXK5VAUUXvWTqlyrFJHvyeVOTqd1bThr47EuHFGSjgkmmAXDFfVoi', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2862, 527, 'MUSNI RONNIEL', 'rpmusni@neda.gov.ph', '2022-05-20 02:55:32', '3MES-OD', 24, '$2y$10$Cg/kRPeE4vrlQzCN4cPVueLL0u4T2.kuCWmDzLz6TSYIgxchHTgTO', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2863, 353, 'BALA GEMMA', 'gabala@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 84, '$2y$10$RdtHAUQU.RY.lKeR76RU9.CgjOfl40Y4eLdUQejm0jVVF5m583cuS', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2864, 803, 'PAMELA MAE DELOS SANTOS', 'pydelossantos@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 82, '$2y$10$Fla6TT/boyqIHQ9mWuW/o.7NJE3eKk15.AhqFIsiyk7XdaHCbi94e', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2865, 27, 'PINEDA RAYMOND PAUL', 'rgpineda@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 82, '$2y$10$mD5I1nTFjRunXoiyIlYTKOamJ2VATj085JYaC1ZWanFy30fKc/Qgu', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2866, 255, 'REbultan CARLA MARIE', 'cmanago@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 82, '$2y$10$p8/mfEOiOJFrS10uNvPVy.fPvMIAyI3jFF93PSXUghd1E8Bkyq5i6', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2867, 797, 'CYARA YSABEL PEREZ', 'cmperez@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 50, '$2y$10$V1R1tDpA9B1BOqjttzi94eXVEqyU/PwuFxok6BDeGKXMB6z6m7yPy', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2868, 107, 'VIRTUSIO KATHLEEN', 'kjvirtusio@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SDAD', 39, '$2y$10$7PRMsOvbBrlPzrQkTZQ5IuPJw7HquUR9Ncg5elM4PUOV/SO7mklrS', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2869, 75, 'TATLONGHARI PAUL ANDREW', 'pmtatlonghari@neda.gov.ph', '2022-05-20 02:55:32', '3MES-TISD', 39, '$2y$10$giK93q5.WRMZmcpSj3NMk.JMo6MOa.edD8nyEYOxuJ27E5RIQdI0q', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2870, 243, 'WILLIAM KU', 'wcku@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SDAD', 82, '$2y$10$rzx84dOM5b51d/bWDz7cAuxX7/T91nIta.WbzjQb.MXTcIEAaZzTm', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2871, 38, 'QUEJADA NOEL ANGELO', 'nmquejada@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SDAD', 82, '$2y$10$TZvr0ZTUNNECGGBv9oMYcexIavpYaqZnHkwemn8/6Z3fNgaz2CS6.', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2872, 615, 'USON PHIL ANGELO', 'phil.uson@gmail.com', '2022-05-20 02:55:32', '3MES-SDAD', 50, '$2y$10$g8vVe6PMLcoVC0.FOvo.mubFrs/DOyLybE4c0kxF1kpdR7diDXGxq', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2873, 345, 'AGAGAS GEMMA', 'gbagagas@neda.gov.ph', '2022-05-20 02:55:32', '3MES-SSD', 39, '$2y$10$NFihK7rLqStopT9BsXN47ej4LSdJX956VSdYN36jlPcS5fo4vi6R.', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2874, 284, 'GATDULA MARK JUSTINE', 'mbgatdula@neda.gov.ph', '2022-05-20 02:55:32', '3MES-TISD', 82, '$2y$10$C44R/OmpKVpTc4E/tmoejec3ZZL9V53w2WzPy2MbO4DVCoimMlfxe', NULL, 3, 1, NULL, '2022-05-20 02:55:32', '2022-05-20 02:55:32'),
(2875, 305, 'CORRADO JAN CRISIDES', 'jccorrado@neda.gov.ph', '2022-05-20 02:55:32', '3MES-TISD', 82, '$2y$10$dRtHClSDtgA1m025BsYTDOTpZHUZp20RMLFSl27TylwE7fXfuKZHe', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2876, 80, 'GARIN JIMINA ROSE', 'jygarin@neda.gov.ph', '2022-05-20 02:55:33', '3MES-TISD', 82, '$2y$10$zp8D21J/3h5fAx70swH6guOZtSJi7tl8ehu6Blecb0ThYmQHILB1q', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2877, 798, 'ANDREA IONA RODENAS', 'aarodenas@neda.gov.p', '2022-05-20 02:55:33', '3MES-TISD', 50, '$2y$10$97jg7VUZf18BzHkGmKoXue9TGDxfdS5GkV5V99Z8yq6KMIdgGeL/e', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2878, 177, 'BERIDO JAZMIN', 'jdberido@neda.gov.ph', '2022-05-20 02:55:33', '3GS-DRD', 39, '$2y$10$STA6bBCQgu40vkBBVkbPM.S0MYCtbG8/7n9kmSHlv/RkGIk3IjUem', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2879, 23, 'OREIRO MAUREEN JANE', 'mboreiro@neda.gov.ph', '2022-05-20 02:55:33', '3GS-DRD', 84, '$2y$10$EC4GZIeJQF.UsfPWwEsuI.L5SEFKFCdo8E1J9/ptydtzHeKMzMP9m', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2880, 17, 'ROWENA PAGUIA', 'rrpaguia@neda.gov.ph', '2022-05-20 02:55:33', '3GS-DRD', 82, '$2y$10$JfeQxAAFWM3FPoNmVALaGeTj21jC5xmQjG/yulhqzXk8JEVSnGDzG', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2881, 332, 'MAPUTI MARIA ADELA', 'mtmaputi@neda.gov.ph', '2022-05-20 02:55:33', '3GS-DRD', 51, '$2y$10$.De98r9NkcoUzwkbiYP/SerILs6VBYP6f8b8zPSVpzyTQ60HeqVFK', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2882, 573, 'SHARAYAH NICOLE DOMINGUEZ', 'srdomiguez@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-IED', 82, '$2y$10$I0eekzZMz4XKhjZsCojfOeNDWZvBLfkFF5hcPRKVTJ4GSjKxtw4ni', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2883, 150, 'CUYA IRENE ANGELA', 'ivcuya@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-IED', 82, '$2y$10$N/.NIOsY9ivxdq.bn5U6..BSk0gC22.0VWNd1u0zpN9LKOgfHSGda', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2884, 13, 'MONTEJO GRETCHEN LEAH', 'gamontejo@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-IED', 82, '$2y$10$.yx42eZUxzLQLFM72hQBduBHn6Bm3ANL5Gz6zlr3DUGPs/82D394i', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2885, 549, 'DOROTHY JANE OBISPO', 'dmobispo@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-PCD', 82, '$2y$10$98oMOKiyS2JJEAP01tfH5.mHxOM0.tW6.c5I34MoQZeM2IaqP6sea', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2886, 671, 'MAGALING KRISTINE MARIE', 'KRMAGALING@NEDA.GOV.PH', '2022-05-20 02:55:33', '3NPPS-PFD', 51, '$2y$10$s1kl12PspIxSmxRpVeP/eeA6s55HYOWaqbQ60KBp8xNNjWlT8wIoa', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2887, 357, 'RIVERA RITA ANGELA', 'rmrivera@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-MD', 84, '$2y$10$zVGLzBdwzSUQWm04JV8g7.g0J5Qgbi9d0xC8Y27JmHpNymQex4fea', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2888, 561, 'MANGALINDAN DAVID CARLO', 'dcmangalindan@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-MD', 82, '$2y$10$T8/RmFXx.o5JkzbZcrnWFuRvZf6vyAd9N0GU/4uPS0uB9NqrOBuwq', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2889, 131, 'DELOS SANTOS REYNALDO', 'rbdelossantos@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-MD', 82, '$2y$10$MJdFytM77QMIPZrmD/hGgesb34fuCcbGLTERt9SFyXdett5afQIiS', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2890, 575, 'RACHELLE ANGELA RAMOS', 'rcramos@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-MD', 82, '$2y$10$qkfMYhOIcUJBY9C6MLFGa.e2m7TDLLW1i2QMRR4Uddd1vWtGJbxP2', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2891, 642, 'MARIA ANTONETTE PASQUIN', 'mdpasquin@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-MD', 51, '$2y$10$DGZLmvr64/04BAnvcpmVjOmAkxyPYsuOD1QhqpI5otDbj.0T10rfG', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2892, 448, 'CANCIO REYNALDO', 'rrcancio@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-OD', 47, '$2y$10$TjLP.4Nbe/vvXbQ.E3tOy.GyYeOSglGcp7u0Cv5POiaBO7FvZjq7q', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2893, 604, 'LORETTA ARBOLEDA', 'ltarboleda@neda.gov.ph', '2022-05-20 02:55:33', '2NPPS-OD', 26, '$2y$10$7Cwb2WuOR8Qdj5Ihabr8Ku5ra.tPUvwqgUvqwx61jEApYcnRa5BI2', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2894, 497, 'VENER MAGNO', 'vsmagno@neda.gov.ph', '2022-05-20 02:55:33', '3NPPS-OD', 25, '$2y$10$a0cw6Hm4rpoTal9ndrrQ4ezSlobleZsRDCdLUPkxiD9HGzbn5M2hi', NULL, 3, 1, NULL, '2022-05-20 02:55:33', '2022-05-20 02:55:33'),
(2895, 400, 'BANDO RAQUEL', 'rsbando@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-OD', 25, '$2y$10$Max2WjNUmXIyMgAcY6lSHe0FQ8DMwyetN4nbUoSozTxWDJAAHFUXW', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2896, 512, 'ESTRADA JEZEBEL', 'jlestrada@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-OD', 24, '$2y$10$9QbBHwBtLp9C8UXYITzt3O9yGHIhjIr0jOoZ8oI4dgcWIebLNIAy2', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2897, 397, 'AVILA FREXIE ANN', 'fvavila@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-OD', 23, '$2y$10$Z767o2hsSD1Oq1IGUyTEF.Xf5zONrmOt1py9vikTQbPuQSD0D8ukC', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2898, 361, 'CABADING IVEE', 'ilcabading@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PCD', 39, '$2y$10$gA/aLb9p9LTUcu.ZPQ.5S.JeE2RVlN/4PP/iSmfQxFALnAprzNHfK', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2899, 290, 'RACHEL LYNN BELANDRES', 'rybelandres@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PCD', 84, '$2y$10$qu6dolZtUf4/M6yvVECX4u7wxX8P551tH7n2PEYYfFuhif0AtFi72', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2900, 136, 'MARIA EVETTE SANTOS', 'mariaevettesantos@gmail.com', '2022-05-20 02:55:34', '3NPPS-IED', 84, '$2y$10$WaHdfoz3/Kd.9XOA5BRqxev1xPHsZDq.KIUo3FuWiREC87n.UD8EK', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2901, 583, 'JHAINE LYKA VILLA', 'javilla@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PFD', 82, '$2y$10$6c2yMwkDI9kkZY7.K2JEBu4BPomG9.a1FBMqNWo7XIeWQNzLO40dC', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2902, 62, 'ARTHUR PHILIP SEVILLA', 'aasevilla@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PFD', 82, '$2y$10$9S2cGKc8PpKzVF/1zVicvOPlLJFItGdlO3g2xwDFJaA3nrHecQMy.', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2903, 592, 'BUNAO DAVID FELIKS', 'dmbunao@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PFD', 82, '$2y$10$I8Lx4l8d6QcbqocQpeIVvOOqa5aFVIVmmH0SZuZZK5aK51GeoXr56', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2904, 913, 'VELASCO JEROME', 'jcvelasco@neda.gov.ph', '2022-05-20 02:55:34', '3IAS-OAD', 69, '$2y$10$e1MOnvbJFAv7C/hzEyz.Tuu77lkw4.lc.f1Z49RkLvxR1nYiOrMs2', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2905, 82, 'MANZON MA. CLARISA', 'mpmanzon@neda.gov.ph', '2022-05-20 02:55:34', '3NPPS-PCD', 82, '$2y$10$ao4UOcsHORlCYVxruoHBN.QVCq51RnWBgrraw2fLJM/67es/0Czw2', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2906, 652, 'CHUA KARL KENDRICK', 'ktchua@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 102, '$2y$10$FIF.DMuxem93HsEZVSXbZeKU0NFOh3fl5Hw7ynAd8bF2XXDTULQjq', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2907, 454, 'EDILLON ROSEMARIE', 'RGEdillon@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 103, '$2y$10$HN2PLJorgbG4EhY6l5QzUOlKfYn3.8Na/8mInTLeyfG78CARpwciK', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2908, 468, 'SOMBILLA MERCEDITA', 'MASombilla@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 103, '$2y$10$fh7tbpTGuWwcSwBkcjpFleqlz.XanCdCYXefDakvuiI1Q.pw2qLSq', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2909, 452, 'DE LA ROSA JOSE MIGUEL', 'JRDelarosa@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 103, '$2y$10$MGMl6AGtu5PN.akm/Vu6u.vLhtbnbx0xMri7ACIfoDXdPQDVDNEPy', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2910, 466, 'UY JONATHAN', 'JLUy@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 104, '$2y$10$IEJVWPu6xHqG0EiBT2DFQOKr..USEaP9Uk2u4eILtrfb4bV3y0osi', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2911, 463, 'PLANTA RODERICK', 'RMPlanta@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 104, '$2y$10$iVmHWX1vUJgGntdDISWueOCdQRBCVvrBfrTQ6ugGCVPEVj4YrRO2O', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2912, 441, 'ABAD SANTOS CARLOS BERNARDO', 'coabadsantos@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 104, '$2y$10$p6UinhsSBLAXemJvz7G7WOGLbQLR96PCR18RWqNvGUpojS2RLWdei', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2913, 462, 'PINEDA GREG', 'GLPineda@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 33, '$2y$10$1.Or7uv0F/gaCP5/1dOO0uKag0JwA.YMDJVNAgCFURgHMETG8s3si', NULL, 3, 1, NULL, '2022-05-20 02:55:34', '2022-05-20 02:55:34'),
(2914, 837, 'RENZO ENRICO BLANCO', 'rdblanco@neda.gov.ph', '2022-05-20 02:55:34', '3OSECasDIV', 56, '$2y$10$1SQ8p.NhFgiG7KYMgbn//uhWNLnhSLlmt5.aos9stjekZQ/TxPpZm', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2915, 805, 'SHIELO REYES', 'smreyes@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 55, '$2y$10$8K9CIYheNSP9U3iH6nwiZuDbxQeryv1oxxet.CZZVT1sQxVOgFbwq', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2916, 170, 'ESCLANDA CARMELITA', 'cgesclanda@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 55, '$2y$10$Cp9erXSDkEJt4DHg72w3QeajqVZXjIopw5rOza9aopyj0JgxNlL0C', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2917, 396, 'ARIOLA FERMINA', 'fcariola@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 54, '$2y$10$bHvGYf5n02aPb8xWbL985eUrfU.iGN0aTWh2i0vkMz/p2T0DhU8pG', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2918, 835, 'CHRISTOPHER MADRIGAL', 'clmadrigal@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 44, '$2y$10$erfBxRrziaBUrWKOW2KKi.n74Ut7d7qvSbKniJUA2Sn.r0wQjDAOy', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2919, 478, 'CRISTINA MORTEGA', 'cbmortega@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 44, '$2y$10$QVcKPtQVk0xkSPl7eKqXWuQyWknW5N6o5n0u/4NZp4UD06exauJWC', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2920, 410, 'CASTRO ANN CHERISSE', 'arcastro@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 44, '$2y$10$xS6nbJAeqDvopSftKZ4/CeadlZJ3B2nRRufdowXLCETboURrKKc5i', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2921, 412, 'CAYONGCONG DINA', 'dacayongcong@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 44, '$2y$10$C.Ssebe3z9Wr/9X1SBpfg.B7/h5KEfPJ7F99nYkvexRdUsbSRg3uW', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2922, 607, 'NAPOLEON BERGANIO', 'naberganio@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 80, '$2y$10$l8gHCQ2OOoe7xhrTjaGxbeenKQZCBwYM9ow3Sq6t99c5cKfNPnGty', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2923, 402, 'BELTRAN LOUELLA', 'lebeltran@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 53, '$2y$10$GsiJaHU6Wu.J2uYVcPlnpup/lwo6eHEmBgvn8lMz.fkyXzW1wUtmK', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2924, 516, 'FRANCISCO RONALIZA', 'rffrancisco@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 53, '$2y$10$KpJIHVlp7GWQ3w3q68t/L.6lAMjK.JnyAZqfAkSW9izCaflkF4qjS', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2925, 394, 'ARELLANO ROWENA', 'rmarellano@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 53, '$2y$10$qP/70VzDeyzus6FGf.owwOZibyUoUaV8gcqJcKh5ggYxZ28xzbqUG', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2926, 407, 'SARATE GLORIA JEWEL', 'gasarate@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 53, '$2y$10$TsFpJ..ZJGPPYJ.uY0hFsuvhLMHPuZUxWFH7cc1W7jN8io/1.it4u', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2927, 197, 'HERNANDEZ CHRISTIAN LENY', 'cghernandez@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 53, '$2y$10$YCqGwQM8nHnUjS/BVTgn2emJVOety.WlwUrpL4OW7ndKKSdugFxCu', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2928, 484, 'PERLAS MARIA CECILIA', 'mtperlas@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 81, '$2y$10$aR.x2ELymdBRcuFZj5FtuuHickNEUpArfawga8G6GKQNZ45gh.2ku', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2929, 487, 'SARMIENTO GINA', 'gfsarmiento@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 79, '$2y$10$6q3tpd5IghHPoxKa84Ah3OQxhmAmdmpwDHZAH0NQjqCC//En6ih2.', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2930, 540, 'HARON ARFIDA', 'artidah.haron@yahoo.com', '2022-05-20 02:55:35', '3OSECasDIV', 27, '$2y$10$oMXX6kTNoFbwtt56hf52..f8o/HuJuRy9lkES/AITi29Ns7RsPCGC', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2931, 430, 'DADURAL SUSAN', 'sadadural@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 27, '$2y$10$PGf1kdwNoECYUQ9EVtgkXOJJL.ZS9JmGCm1K98QyojaE4W1CMU44G', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2932, 485, 'CARLOS RUZZELL', 'rrejercito@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 26, '$2y$10$NzD6FmukXnom1hI0mgikjunsKFdgchjFcbjumFQ7P8WXezuJeprX2', NULL, 3, 1, NULL, '2022-05-20 02:55:35', '2022-05-20 02:55:35'),
(2933, 408, 'BROCAL BRIGIDA', 'btbrocal@neda.gov.ph', '2022-05-20 02:55:35', '3OSECasDIV', 26, '$2y$10$rz5tez60mIruJMayO987DuJzrn50h4TAQKG1BU9S83oXnwbFwF4hC', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2934, 488, 'CHRISTOFER SALES', 'clsales@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 26, '$2y$10$Akl.sDFAiBs6ggRl.NRLcOvCTtVAYo3S93D5TOf7noO54Z155Bzgi', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2935, 534, 'REMEDIOS SANTOS', 'rgsantos@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 26, '$2y$10$Vol0RtuQkp3NiowAbQb3Kusf7Klf1P8C.XYNgul.UsvQqQaLb6Aue', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2936, 486, 'LAJOM LILIAN', 'lianlajom@gmail.com', '2022-05-20 02:55:36', '3OSECasDIV', 26, '$2y$10$K.mFiJG29Mu87cU6ALhzNe./kTOVWEXQuCsfDqaDIqxIHHUSYVYOe', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2937, 276, 'ALVIS SONIA', 'soalvis@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 26, '$2y$10$4ALgjwNcewi9kOLwshU1dexalba6xWaqePUSyUdrKkmY.7K/qJgnO', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2938, 489, 'SAN JUAN BIENVINIDO', 'bcsanjuan@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 23, '$2y$10$H1kNPC5dvDaYNCjD57LVSe386OOU.Uu3emRQqT0I/k1b3vna8hiYG', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2939, 490, 'VALDEZ JAIRUS', 'jbvaldez@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 23, '$2y$10$PsHpNw56zoxthQgiLpY/B.hr4GT.NO1eQ9sDxt7ZO1ghNrQsjBg22', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2940, 491, 'SALAMANCA EVANGELINE', 'efsalamanca@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 22, '$2y$10$CAv6IIkVp/7QyT3Lke97ge2xyx7M3mjibWmF720wUGsHP5GSELn2a', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2941, 415, 'ANDAYA JANET', 'jbandaya@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 22, '$2y$10$mavjhGNOTLcuQmqgIapl0Onsff.AWfldR05HBWL.SEyz6u.3KdH1a', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2942, 432, 'DELA PENA ANTONIO', 'abdelapena@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 22, '$2y$10$ZaA0BmTUXJesgO659hHo3uiQGywnBIK5VTBvNMsUtvu1GbJZEsXVa', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2943, 643, 'ARGANDA ESTEBAN', 'elarganda@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 21, '$2y$10$bgBLr2Hf16/WD0heVpE0OesdDbCUboff6Qk419yp9UVoplXX3EO5a', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2944, 493, 'DUENAS SUNNY', 'sbduenas@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 21, '$2y$10$BWkUT1sSdWCJhE3RtPkR7eFdETR46mdBUqEV7rraVYeZDqMD3j.bi', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2945, 675, 'JHOANNA ROSE MAGBOJOS', 'JPMAGBOJOS@NEDA.GOV.PH', '2022-05-20 02:55:36', '3OSECasDIV', 21, '$2y$10$bpeAkNO3RU0lXBDRlxZRF.PIGh5kBmGXbdh6KQUktp6dBuwknPXfS', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2946, 492, 'SORIA DIOSDADO', 'dtsoria@neda.gov.ph', '2022-05-20 02:55:36', '2ODGasDIV', 20, '$2y$10$INg0szqu2wF2xqFfUBFCEOgKxSNYKuH/AKBO8Q3k4B9zfruZr7f0m', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2947, 399, 'BAGUNAS FERNANDO', 'fcbagunas@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 20, '$2y$10$4n0xHQLHZJVEdAavt1CMoe7N0XT5gVAnOCGHWL.tVz4uflfES.MV2', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2948, 594, 'ENRIQUEZ ANTONIO', 'afenriquez@neda.gov.ph', '2022-05-20 02:55:36', '3OSECasDIV', 20, '$2y$10$fYWvV3LAYaBjcJ9glM3E.uTHkuo24FwG5PWkZuheuSfFzUvPD2HRG', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2949, 409, 'CAMPOMANES FRANCISCO', 'flcampomanes@neda.gov.ph', '2022-05-20 02:55:36', '3OUSEC-PPGasDIV', 20, '$2y$10$oz4J1f9ERpNUB.1/G6OXsehkxpXNXtQAp.cMByZBY.43bi0jQ/fHm', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2950, 278, 'BALUGO JOCELYN', 'job_lea@yahoo.com', '2022-05-20 02:55:36', '3PIS-IPD', 84, '$2y$10$kN1u79BZpy/Oj/dutf0dPeCDtij6srYvY7Gotux9z2Qib5vkuXG9q', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2951, 828, 'JULIENE NICOLLE MILLARES', 'jcmillares@neda.gov.ph', '2022-05-20 02:55:36', '3PIS-IPD', 50, '$2y$10$MS8YMk9oE.t/0qOpv64xauiDoHDcDZ.mM0Pfbr6JdQ2iI5VyZ71PC', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2952, 458, 'BALIATAN HAZEL IRIS', 'HISBaliatan@NEDA.GOV.PH', '2022-05-20 02:55:36', '3PIS-OD', 47, '$2y$10$OokBzqIPM/MsOQVeORPvqO8rLrV5Wf9zqsjTCa5c4hApv5DjEQlca', NULL, 3, 1, NULL, '2022-05-20 02:55:36', '2022-05-20 02:55:36'),
(2953, 500, 'ABUTAR ANA ZANDREA', 'abfrasdilla@neda.gov.ph', '2022-05-20 02:55:36', '3PIS-OD', 25, '$2y$10$A.ZbwzX/A0fwioPNsu1ZhuS.ZzFWnH7O5Hrooz1mccSZ5YNMlp7/i', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2954, 799, 'ANDRE EDELLE NERIA', 'anneria@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-OD', 23, '$2y$10$TRNKV64hil5LpdCVBBq7Ju8hJmbdET.BbrYQMyUde1QgmKiMKUBJO', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2955, 829, 'CASANDRA EDCHEXELLE FERNANDEZ', 'cmfernandez@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-OD', 23, '$2y$10$1flQt5KSllFFMkM8Zw1v0uCcIyuVr4UlJdJ8EP2uzIlSXA5GTQo5O', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2956, 503, 'GONZALEZ MICHAEL', 'mgonzalez@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-OD', 21, '$2y$10$y416.CiP7B4cDq9fPiA7TuplU2rCU8mEKc8gdCIJGH3LXsRkMYDHq', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2957, 504, 'ARNEL INOCENCIO', 'aminocencio@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-OD', 21, '$2y$10$XConl9wim9VRQfhDKKjCWe.EMxp9a58oXVFnq2dSa7UcQoTZXrDp2', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2958, 234, 'JUMAQUIO ALDWIN', 'ahjumaquio@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-I', 84, '$2y$10$bK6E3kfjr4JQ20im.Sfn.u3H.miJ09MbD5Ne4v6FPZIVyn1UusOre', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2959, 807, 'MARIANNE LABRADOR', 'mplabrador@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-I', 82, '$2y$10$/DRUN9ABeza.l7lNNxmpe.Bwwa/n.kN10iuJWJsdFmAyAC.AkppUe', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2960, 182, 'DIZON CHRISTOPHER BRYAN', 'cmdizon@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-I', 82, '$2y$10$d0WTsk8eINMIzi04QVAXGOekJkgtq9okRug2AZ6gY4XwPfZ3pglnO', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2961, 600, 'LLANA ANDRIENNE BANGA', 'LCBanga@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-I', 82, '$2y$10$K8CBr2/Bh2ir/2ehDXg25OGzYpbIhhaSO7NwqWrqpmek1A9xvm2We', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2962, 831, 'JANINA FAITH CASUCOG', 'jccasucog@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-I', 50, '$2y$10$vrqwQY4l87lWb9sVzAA5jOvlDnaGPPqJoLdLJU72wSyKpiuM1/h1a', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2963, 267, 'MANGILIN CALIXTO', 'cmmangilin@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-II', 39, '$2y$10$65n5n0N/FBpA77WriA4lYeJGs3AMyEnZScX2FeoSi8M.ty0aaKNWK', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2964, 217, 'CAPISTRANO LAARNIE', 'lwcapistrano@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-II', 84, '$2y$10$L4q..FWguWiDgmje2zCvyuVQMoVAc3OqEKblykWY2tjA7qhtfXiTG', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2965, 800, 'NATHALIE GABRIELLE TATUALLA', 'natatualla@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-II', 82, '$2y$10$Or8E95lRyWRehGo7redQpe1NjPhAmmJR58D17rEO/pSqgpZ9UgaJ.', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2966, 822, 'ANGUE KRISCHELLE MARIE', 'kmangue@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-II', 50, '$2y$10$vuGakwkqtDqmEgmwRb1KJu0fG8CZxTjtZxqb158ZrLt9H0V48grN6', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2967, 227, 'FLORES MARTHA', 'floresmo@gmail.com', '2022-05-20 02:55:37', '2PIS-PFD-III', 39, '$2y$10$abwmN9ikTnnsboUFYaHkvem15KMrwJNg25PhccTZK8EWgeyAMz//y', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2968, 209, 'MAGBOJOS MARIA LUISA', 'mrmagbojos@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-IPD', 82, '$2y$10$tOByUx0pPQlCk9QkncVECekBupgWzBJSAVbP2/R7mCJV7GRXpul/u', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2969, 28, 'RAMOS LEILA GRACE', 'laramos@neda.gov.ph', '2022-05-20 02:55:37', '2PIS-PFD-III', 82, '$2y$10$aQV6HBrmLVZ0rbRHFio9D.N.6jRrvWFb32y6QuanNa0FHS9btbtqK', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2970, 603, 'DEL CAMAT PERINE', 'psdelcamat@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-III', 82, '$2y$10$IDP.VXLklyR26Wd57jDVwOTKOubQBLncTevwx9/kJUGXvRlPn4st6', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2971, 820, 'MATANOG AISAH', 'ammatanog@neda.gov.ph', '2022-05-20 02:55:37', '3PIS-PFD-III', 50, '$2y$10$SFTPOltz2.T9gx/.94xQWOBZLaLvXNcVmC4rOklme9HDfmagw9V6S', NULL, 3, 1, NULL, '2022-05-20 02:55:37', '2022-05-20 02:55:37'),
(2972, 469, 'CLAIRE MICHELLE BALDE', 'cgbalde@neda.gov.ph', '2022-05-20 02:55:37', '3RDS-LUPPD', 39, '$2y$10$zqdIi/.qLzb0WhxogZJGE.duYiBYCY3sf9.cDjSfl/q/mE59t.DVW', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2973, 306, 'DE LAS ALAS MARK', 'medelasalas@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-LUPPD', 84, '$2y$10$bm7xOasnwAm0dELa6u/ANOCk8P0XQsgW/3xfUdByV4eDecDuqFaw2', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2974, 475, 'MATIBAG MARIE ANTONETTE', 'mvtolentino@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-LUPPD', 82, '$2y$10$TOG7WkJn3q9lFf02NNQLbeDASGJNqgg9bmhmyfq4Uhn3T8PDTn7aW', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2975, 806, 'JOSHUA ACORDA', 'jaacorda@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-LUPPD', 82, '$2y$10$PYps.lhNBnZOk3GLIQDWFOG0Wn1TaUg1gL5oVvqVvtaJf2kHbCR92', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2976, 826, 'NICOLLO VEO ALEJANDRO ARAGON', 'nmaragon@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-LUPPD', 51, '$2y$10$UCIS6i.7i1JR1jguItAFA.1dO/WXQy36cmQf19p8hpE0WdAA5PjZ6', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2977, 453, 'ENDENCIA REMEDIOS', 'RSEndencia@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-OD', 47, '$2y$10$pxlGSyXwJQuC0IsM.ohpGuowKNHAaCQzAOz7lz9Dz1xAQ/zBOo2qW', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2978, 113, 'VILLENA CYNTHIA', 'CAVillena@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-OD', 46, '$2y$10$annsUJ5lKS96V7v5VhGg4.Y1lBxrZz2K8RhcI811SjAdJFblqsmAq', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2979, 393, 'ALANG MILDRED', 'maalang@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-OD', 26, '$2y$10$JC5cJkqCweW8eyPDRp3pouAG1f6fO9Sf.vC7Zb98NvfvVM6nigNEq', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2980, 414, 'CONCEPCION MELVERN', 'mnconcepcion@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-OD', 25, '$2y$10$3uuAxbG6401cQAa.xNeNtOTIIGONekBZ2vaZVZuCl1J5UH10zO2BO', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2981, 544, 'PANGANIBAN ELAINE', 'elainepanganiban20@gmail.com', '2022-05-20 02:55:38', '3RDS-OD', 24, '$2y$10$eecxNWaoQvHUN63YUMIAUeTjk51LpRwf5Mwux1T3InZnV1t/j0mwW', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2982, 777, 'DICHOS EZEKIEL JOHN', 'egdichos@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-OD', 23, '$2y$10$LRnNjXRMg0wfzGdQF0jNh.yDZxhxs3SkYrUwLFQK5u1vuSXqkHPAC', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2983, 471, 'ARANETA FRESITA', 'fsaraneta@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RLIDD', 84, '$2y$10$shCRrnRDvlxhZkaC1j44GuXf/LUS2ilSgOFZhHOsmmeimKPHFiFHC', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2984, 431, 'DE LARA JOANNA MARIE', 'jddelara@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RLIDD', 50, '$2y$10$UN1ieq7qt7Vqv4mo1K0AQOgIgVypJVpFqR1WNS4d2c/E3krvH0kOC', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2985, 288, 'GO MA. ZENAIDA', 'mggo@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDAD', 39, '$2y$10$jiYhZlw4XnXNm10GZAzw4.MQcxouEPZzCDCF9XZxCZ8CJ0qLyNc.e', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2986, 60, 'WILLIAM SESE', 'wgsese@neda.gov.ph', '2022-05-20 02:55:38', '2RDS-RDAD', 84, '$2y$10$Eig3tbqNFiOhkZ.hjYehfurfFoCcr70CC3MCK7ZAANfIDzhqV1eZG', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2987, 221, 'DE CHAVEZ HAZEL', 'hqdechavez@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDAD', 82, '$2y$10$ntIoNOBDBlUm.e5/NwaRLO/YlOviwQkb5EhU1Oms3X9e1DLXxCyby', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2988, 132, 'TANCHIATCO MA. NARCIELYN', 'mnprizal@gmail.com', '2022-05-20 02:55:38', '3RDS-RDAD', 82, '$2y$10$5DSTTpRqYAGDjg2odj8UA.WF1XpekPytjUXzpUqW5zsO/Ym7PEjzO', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2989, 206, 'BARRIOS ASYA MARIE', 'albarrios@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDAD', 82, '$2y$10$rbQ0lRh0kSXK94wpidMpA.MgpoacScxXlnbmw5sLVsQ49EAxVY22.', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2990, 825, 'MARIA EUNICE GONZALES', 'mmgonzales@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDAD', 51, '$2y$10$9cW53MGANwKvfy72CdT7Pe.daBEot8ErZ1X8auFx3vtRERKnpI/kq', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2991, 801, 'ELAIZA GRACE ORLANES', 'egorlanes@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDAD', 50, '$2y$10$JCBSpW7qDzTAX/9BkdvoCOidpvLPGKH4jskVLgje3PS5bE5Il.BzK', NULL, 3, 1, NULL, '2022-05-20 02:55:38', '2022-05-20 02:55:38'),
(2992, 307, 'DE LEON ROSAURO', 'rldeleon@neda.gov.ph', '2022-05-20 02:55:38', '3RDS-RDPD', 39, '$2y$10$WYqWNxvw.d150HdWPA.sz.9oGsYw9XG.srJBMXKj6IbjToK5hvG.u', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2993, 352, 'VALDELLON LEIA VINIA GEORGIA', 'llvaldellon@neda.gov.ph', '2022-05-20 02:55:39', '3RDS-RDPD', 82, '$2y$10$6XWtnkm3L6ukpwi4WLvkM.z0rW4v7GN4eV5oXvqd1cVW0/Ykp2kPG', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2994, 316, 'DIMAGIBA LEMUEL', 'ltdimagiba@neda.gov.ph', '2022-05-20 02:55:39', '3RDS-RDPD', 82, '$2y$10$0VgbUgfx/bSiq1WXhNpvluhEoz1zKtGTkOAnFR0STa7eBlyvy4LlS', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2995, 350, 'ARANJUEZ EDGARDO', 'esaranjuez@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 39, '$2y$10$RB8UUwKwjrZ7AMFpmjHYmO3oYS6eUMbdhVivBWyhe1U7szbMrpLEy', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2996, 299, 'SUSAN CARANDANG', 'smcarandang@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 84, '$2y$10$HwBnBcxgkX.bcIIUMia6nOc0siyx/ub5JdbwmObpR7rAXL.k07ylm', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2997, 220, 'CERALDE MARIE ELAINE', 'maceralde@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 82, '$2y$10$EWHf.D6X36TdlxNZpdy0bum9ucn/LxTfQOhO/N9ywObhWALj9q0d.', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2998, 15, 'PADLAN MICHAEL DOMINIC', 'mzpadlan@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 82, '$2y$10$D62zDkoVRyW72qcY9/kFQOvRqGnwmBijcrP.jQU5AD4xSHKlXsY.u', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(2999, 225, 'DOMINGO YUKO LISETTE', 'yrdomingo@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 82, '$2y$10$WGNpi9F7hdwJaplJsv09BumW7bEBd8/UsnBFqRz7VldSs8FjtY7xK', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3000, 259, 'MAMUYAC CHRISTINE JOY', 'comamuyac@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 51, '$2y$10$goaTAKmwFoH.W18oATwvn.uTURPMh47gHpYfktP.GEfcJNb9ir9iO', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3001, 280, 'AIRISH JANE BAQUIRAN', 'aabaquiran@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 51, '$2y$10$vpespyhFWaqiNO33FAZ7DO65K7PKCgWQyszF5Zr6DMWSWoB2HCjRG', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3002, 606, 'DIANNE JADE CALAY', 'ddcalay@up.edu.ph', '2022-05-20 02:55:39', '3SDS-ESDD', 50, '$2y$10$FYv8GLVbOuuu9L2zaOTtYeGnyzC6mIeliBvFMYq0bLjhGeZCv14s2', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3003, 286, 'JAVATE TOMASITO', 'tpjavate@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 84, '$2y$10$UekvAZ1CR6Gvc5F899XhfuwZrsnaZeu2GfhdDYXlivysMeEls4PIi', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3004, 19, 'PAPA MAURENE ANN', 'mdpapa@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 82, '$2y$10$cn.1v0SZrPgjmp/cTrUIi.lidarnywWHfpIjNrL.FB6lZd/PwIYhu', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3005, 51, 'RIVERA CAMILLE', 'cfrivera@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 82, '$2y$10$ar.6ioHCq4vO5x0vvXnC7u9s.pjm5VoDKJAXrN/4hQj.6b3PLeHVO', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3006, 291, 'GODOY KEVIN', 'kmgodoy@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HHSD', 84, '$2y$10$CMTwzj4wBPXNYTGP32zr6ep.Q3ua8vyEp86G5oarATnbygKyygASW', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3007, 327, 'MAHILUM JHOANNE', 'JJOrtiz@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 82, '$2y$10$JSIvkVFWrDPlqfG2Q3OPROU5izNnzk/BAPWTEAp3fSKdMWGe5fmmy', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3008, 57, 'SENIRES DENISE ERIKA', 'dpsenires@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 51, '$2y$10$5NbmzJd8Fxzqw/Wm7oZv5e68F/rCrBAYlYD2FF1vCMmzJ6/Jk2guW', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3009, 191, 'FALCON RAMON PAUL', 'rmfalcon@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HNPD', 39, '$2y$10$g54bESKUI0qttstpdDn/sOQJpo/iR7cVDyqpgpwVoXTh/7KVFXPQC', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3010, 229, 'ARETHA JANIN GARCIA', 'aogarcia@neda.gov.ph', '2022-05-20 02:55:39', '3SDS-HHSD', 82, '$2y$10$DunQbR/tijilYcUtD0b.Bu462.Z8OxbEpMFUdbwAfWSBDVgoWPoKO', NULL, 3, 1, NULL, '2022-05-20 02:55:39', '2022-05-20 02:55:39'),
(3011, 314, 'DETABALI DOROTHY CAMILLE', 'dmdetabali@neda.gov.ph', '2022-05-20 02:55:39', '2SDS-HHSD', 82, '$2y$10$TDyWu9UEFjDXtv0XN4PjXeou0jq6sRJTP/fQFUlilPMNoycM8Rwp2', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3012, 105, 'VILLALUZ CELSO', 'csvillaluz@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-HHSD', 51, '$2y$10$rXThTz62II.OjptiyWz17O6RHbLFeauhW5bxLnzaBRP8jMGH.R6kG', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3013, 678, 'BRIAN RICHARD DIAZ', 'BGDIAZ@NEDA.GOV.PH', '2022-05-20 02:55:40', '3SDS-HHSD', 50, '$2y$10$KYj7aJxHuRnbmDJpG6D26.b9pTXd4iE5WwhkI53KSqV/FxGCVvtF.', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3014, 147, 'CASIMIRO-IGTIBEN GIRLIE GRACE', 'gjcasimiro@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-OD', 47, '$2y$10$E0A/alFNKkbjJPEIOHUmOOM72xDZqBbq7xUKUK8abR.SOHXhIzNqC', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3015, 444, 'ASUNCION MYRNA CLARA', 'MBAsuncion@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-OD', 46, '$2y$10$Qb3.mlmLl3bLzaWmdFYxhe1BOUndE4l010sVnOIO9nYPeRHRlUQ1O', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3016, 517, 'Barlaan ALAIZA JADE', 'acgemira@neda.gov.ph', '2022-05-20 02:55:40', '2SDS-OD', 24, '$2y$10$DF/9yblFsNMXWXR8tVbX6uBqBfHX7X2eQW73f378oIrjsjA0HvNFG', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3017, 531, 'ROSARIO SEN GIRI', 'strosario@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-OD', 23, '$2y$10$g3ueYpp1apxtsmosEM0JM.a5hV2aZeXyEBbD0bKxtxGzOiGoOjjUi', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3018, 398, 'BABELA PETER', 'pvbabela@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-OD', 21, '$2y$10$924E9XJuWhQirbk4PO.onun3VaHqyD//7jqpo.1wpRen0Wta6SC.S', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3019, 21, 'PANOPIO LOIDA', 'lageronimo@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 39, '$2y$10$xcnri5uwquKui5ELBsNqs.4NcxI7Zn8kEulH3MshgA9OR1H5j5fOu', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3020, 335, 'MENDOZA APRIL', 'ammendoza@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 84, '$2y$10$lWvfaUDPVlMmqlwzZN6zPeJw108Dc2b4SeUyI7i00kHEDPdXkkTgS', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3021, 283, 'LEOMO YURI', 'ymleomo@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 82, '$2y$10$qJTMzV5GkNvEF1MU0r.DWuz.Xles1V5YDf4d3.35LZTji5fwDU..S', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3022, 22, 'PALOMA DULCE', 'dbpaloma@neda.gov.ph', '2022-05-20 02:55:40', '2SDS-SPID', 82, '$2y$10$hdFLyW5817jsCCoZMZIf9erYOei5MxcNW2Z57QnvGG8cgmENE74K6', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3023, 224, 'DAVID XARINA DOMINIQUE', 'xvdavid@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 82, '$2y$10$AK/dTyuOn04CafOCdCPtme7bSkE3jF11OqFhQY9VwMbYRLOjF8HiG', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3024, 285, 'GERONIMO JOHN ANTHONY', 'jugeronimo@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 82, '$2y$10$0MJwwb302Gj6MQejuTZ//..eKcTcf.zW15CotwcxhMvsKiqBU1.pm', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3025, 260, 'QUENDANGAN AMABELLE', 'acquendangan@neda.gov.ph', '2022-05-20 02:55:40', '3SDS-SPID', 51, '$2y$10$JRf1uBb6Yg5nlQ0VwzHPCe2IiyQo0yjYuGmBBM6i2wZf7XSSQHMn2', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3026, 677, 'DELENA JUAN ANTONIO', 'JNDELENA@NEDA.GOV.PH', '2022-05-20 02:55:40', '3SDS-SPID', 50, '$2y$10$woIsr2xKk3oltXe9HpahEukQN7znG4sg1fdmchpySRxJBIXvNVkUG', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3027, 608, 'RON JAMES ORTIZ', 'o.ronjames@gmail.com', '2022-05-20 02:55:40', '3SDS-SPID', 50, '$2y$10$JndMYb19Mte/wF5tQs/6g.PO2GF4t3tCmILTdokwHSlsmT0l.zKgy', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3028, 93, 'TURINGAN ESTRELLA', 'erturingan@neda.gov.ph', '2022-05-20 02:55:40', '3TSIS-ID', 39, '$2y$10$3L5lsBUwHcM/ZXRxg1r4gegHvty0KA7suxXFewuom/DNPSzAN4dHm', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3029, 250, 'LOPEZ LAURA', 'lplopez@neda.gov.ph', '2022-05-20 02:55:40', '3TSIS-ID', 84, '$2y$10$5s358FRirjLbgrIDaqt8KeTNGIjuceGIBixBPJ3a3xIW0pyHkFD.y', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3030, 324, 'ANTONIO JOSE LEUTERIO', 'agleuterio@neda.gov.ph', '2022-05-20 02:55:40', '3TSIS-ID', 82, '$2y$10$auOKwAAMnNJZ4ZtJBuxcvug/.2tjeFud0spMDK0lVLJghhD8C/Uy2', NULL, 3, 1, NULL, '2022-05-20 02:55:40', '2022-05-20 02:55:40'),
(3031, 300, 'CANDIDO VANESSA', 'vmcandido@neda.gov.ph', '2022-05-20 02:55:40', '3TSIS-ID', 82, '$2y$10$2fbwOoHMztH52t4Ifh/WB.iP/KviPCAtOYz2HWDXCCvuL0uWSvR7a', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3032, 674, 'LEO ALLAN HALCON', 'LCHALCON@NEDA.GOV.PH', '2022-05-20 02:55:41', '2TSIS-ID', 51, '$2y$10$e3qrsgz6yAh5/n2iwiQkG.677J0y3NP/kIrauQnu0Y7TKsEcgdgUq', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3033, 676, 'RHYS CARLO REVECHO', 'RUREVECHO@NEDA.GOV.PH', '2022-05-20 02:55:41', '3TSIS-ID', 50, '$2y$10$tA8ixGmInVC68.dpw3NHOuM1VvqDkLTQP7VxeRdWccYOOo9Mts/0.', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3034, 802, 'ZARA FIEL SIBULO', 'zosibulo@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-ID', 50, '$2y$10$CX4WNND3n/DRcXMT8lF1r.tLvBGHfCGZhzYrT7VqbNSZJuNRCGM2G', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3035, 456, 'GANAPIN BIEN', 'BAGanapin@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-OD', 47, '$2y$10$gJOEspnLv5jERRIkiTZ6Ce7leL2i3hqPsLZgBag/19wk1PLo8y8Ku', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3036, 460, 'RICHARD EMERSON BALLESTER', 'rdballester@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-OD', 46, '$2y$10$PxE7h6jhnArLIKgvGfHyyugabAtq54hTfBUvfkZk1uJ3ZRiOBieH.', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3037, 536, 'VALDEZ LEO', 'lbvaldez@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-OD', 26, '$2y$10$RQB9FxxrEAm3RQT8lTwiMuJr.Qj7YIi9ZrAoIuiCXUM6XS2V1X0ze', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3038, 647, 'FIGUEROA MARIE ROSE', 'marierosefigueroa@gmail.com', '2022-05-20 02:55:41', '3TSIS-OD', 23, '$2y$10$zvT1UqK1DU1ql9sh/i.KXO9BPG2/5wZ.3g5QVRBJlGnBloJTwf4ui', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3039, 830, 'MERWIN VILLAROSA', 'mmvillarosa@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-OD', 21, '$2y$10$PT/xS0K2SrboWtnl6mQPju1DBNjGWDzAJC95FGgzcZeMevjFptwLa', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3040, 595, 'LEONARDO CADIZ', 'ldcadiz@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-OD', 20, '$2y$10$bj7doP3VA4Z29RuSvwTYhuJFA4FYuX/lNBqDODfexGk.KTStDPip2', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3041, 245, 'LABADAN MA. CECILIA ANGELA', 'mdlabadan@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-SD', 39, '$2y$10$I3Ddz8.9SsM9cJvJjTXdYuvjjnEOtek4lU51PnokNLPNQmbDcvkqG', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3042, 231, 'KINUTA ESTHER', 'eokinuta@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-SD', 84, '$2y$10$OVWr2Odiz8oLm640FgVY0.9mcGeXTFHppLit.cEXGXno8LXa42jAu', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3043, 246, 'RODILLAS RODELYN', 'rlrodillas@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-SD', 82, '$2y$10$oYqKYKTwdvyIgaXO2gfKoOZXYXTFGScFesJvjkCo2rNQxvYr1v2EW', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3044, 86, 'JEREMIAH LOUIS RACELA', 'jmracela@up.edu.ph', '2022-05-20 02:55:41', '3TSIS-SD', 51, '$2y$10$DlH0rHhZQn/fzOeiT3vAf.rjdHUEQw/YvOGHchFYj4550CsiIYCkq', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3045, 45, 'ROME ROMMEL', 'rfrome@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-SD', 51, '$2y$10$MJhsnLcxA/LTJczUVBrczOYfEv3eZd3Qw9RRFj12QmFnmnN8XxPxu', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3046, 767, 'TOLENTINO POCHOLO LUIS', 'pstolentino@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-SD', 50, '$2y$10$ybiu9RVBLWoSrdUdlPQ1SOaSGjVintROe4HX7zoZca0V7s.gp1H0q', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3047, 99, 'URGEL MA. MILLICENT JOY', 'mnurgel@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-TD', 39, '$2y$10$2LnvsvjCMuASWqKoX9kKoe.FK.TGD8nkc9tji4Pnyos..0BNNSgP2', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3048, 6, 'MONTERAMOS MADELAINE', 'mpmonteramos@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-TD', 84, '$2y$10$qd/nmtNgcwJufrXzTL/u3.DnxpxBKwCjxYvybUfxjQXXRF5Q1LRPG', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3049, 809, 'EDWARD MARTIN MACASADIA', 'ebmacasadia@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-TD', 82, '$2y$10$rh.oc5.sI1.CPrBh0MfNpeZnq/KmQ6P7wGPJPISo0b1.fcLgNRwlC', NULL, 3, 1, NULL, '2022-05-20 02:55:41', '2022-05-20 02:55:41'),
(3050, 266, 'FELICIANO MARIA ANA MICHAELA', 'mrfeliciano@neda.gov.ph', '2022-05-20 02:55:41', '3TSIS-TD', 82, '$2y$10$rtTYJwtCeNmscS4TzmmJuuqrtTohpLFdGbTMARbKfra8mJeoFk1CW', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3051, 646, 'JUAN CARLO WAGE', 'jdwage@neda.gov.ph', '2022-05-20 02:55:42', '3TSIS-TD', 51, '$2y$10$qLpEcSoBEEDk.UBvR3sx7eErUt0QfCMso0B84C28xilHOzFtrEUSi', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3052, 808, 'JOHNMARK GABRIEL AUZA', 'jgauza@neda.gov.ph', '2022-05-20 02:55:42', '3TSIS-TD', 50, '$2y$10$AsJC07oH.WrayME4sunffu7/h6BW0gv4r.aT1OmmnSnkLyG2DhEe.', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3053, 528, 'CHARITO PANTE', 'capante@neda.gov.ph', '2022-05-20 02:55:42', '3SDS-OD', 26, '$2y$10$fh2halceQf4L68aupYp7k./Wrpw3T55IjB6HGtsB9GrMe.YG5LXp2', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3054, 914, 'JAMES CEDRIC CRUZ', 'jfcruz@neda.gov.ph', '2022-05-20 02:55:42', '3AS-HRMD', 29, '$2y$10$N1vauKJLy/679xoxw3Hefu7uVmKBE5PKxPPRgxr7IbZih70aTM./q', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3055, 915, 'LIEZEL ALDIANO', 'lmaldiano@neda.gov.ph', '2022-05-20 02:55:42', '3DIS-KMD', 58, '$2y$10$VGLNCTq2c8d2gxn8uV9A.e/xVRva8RSNdKTczXPTIv/aO1HBazc2e', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3056, 916, 'JOWELL ANGELO BANDA', 'jabanda@neda.gov.ph', '2022-05-20 02:55:42', '3ANRES-ACD', 50, '$2y$10$QgQDaqjqxs1/uwV7vQwvvuO0dMKPby9MQM/b/sqgVIbUez7T4x60q', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3057, 917, 'RAÑOLA ERIC', 'ranolaeric@hotmail.com', '2022-05-20 02:55:42', '3IS-ICTD', 50, '$2y$10$KHbaAyBRrzUfi9UWLCFCh.tNgbBrl3kUtbm/kr87marIgXi5Hy.Na', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3058, 918, 'BIANCA YLANNA DELA CRUZ', 'bmdelacruz@neda.gov.ph', '2022-05-20 02:55:42', '3IS-TD', 50, '$2y$10$0JYliOmH/PpIYilF00SNjueKiBAIkKy3reAI.ckHZVequbmRhLj2m', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3059, 624, 'TINIO KIMBERLY ANNE', 'khtinio@neda.gov.ph', '2022-05-20 02:55:42', '3AS-HRDD', 28, '$2y$10$PTlHLj2fBVgn8pxkFAX8D.u6XwfV3/Fen25UmyRzLx1GRUsIa7OZ6', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3060, 919, 'MERVIN LEGASPI', 'gjh3@gmail.com', '2022-05-20 02:55:42', '3AS-HRMD', 110, '$2y$10$VMWryCguSr1ML54RE3jV5.6i1W6qKl4Q504NJy.F1YFGScd1cFkwe', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3061, 920, 'JOHN MOISES NERI', 'ggggr@gmail.com', '2022-05-20 02:55:42', '3AS-HRMD', 110, '$2y$10$4GLylqD36.l3T0IXcDQbqOhL6oVNA2sxQWTa5mnK.7Xdn2NvERa2m', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3062, 921, 'ALFREDO CELIS', 'j9f@gmail.com', '2022-05-20 02:55:42', '3AS-HRMD', 110, '$2y$10$2e0zrbfOrH7nDZT5f0BiO.K9X74P3UUGby1m0UtDvJlLKGEdALOIi', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3063, 922, 'VINCENT SANTANA', 'jg23@gmail.com', '2022-05-20 02:55:42', '3AS-HRMD', 110, '$2y$10$mUkTaBSQEiBSdgjCTPC5venB2MxzGnWLkcZ0xXp4zqnUWn.BrB6Wi', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3064, 923, 'NIKKA GADDI', 'ok11@gmail.com', '2022-05-20 02:55:42', 'AD', 16, '$2y$10$NnfQRpMYrLbxOblvDZqHL.z62kA7118Eu8tJqxYtiP.730TEn5uVu', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42');
INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3065, 924, 'SHAIRA KASSANDRA JIMENEZ', 'stjimenez@neda.govph', '2022-05-20 02:55:42', '3AS-AMD', 28, '$2y$10$.lYtjam0.eNzWpj3QwtCJuNRp/abKW0z/6gEAfJPDLzANkd35JxAi', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3066, 925, 'LAYON HERBERT', 'hrbrt14@gmail.com', '2022-05-20 02:55:42', '3AS-HRMD', 85, '$2y$10$vd2hkmTjJqiYKo.U3kogIuX2gLsXWZwa4Fo/K.Mu5WKqibydUt/3y', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3067, 202, 'MANALAYSAY JACONIAH SHELUMIEL', 'jtmanalaysay@neda.gov.ph', '2022-05-20 02:55:42', '3PIS-PFD-II', 51, '$2y$10$Rv4uNCuOertRybYI1O8GyeD9RJvXXg/xyT8ULAaOCsAbkz8l1pS4.', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3068, 926, 'CHRISTINE MARIE FAUSTINO', 'cdfaustino@neda.gov.ph', '2022-05-20 02:55:42', '3PIS-PFD-II', 51, '$2y$10$NErYH7qlj/HWL3wQ3jrWKO2rVaNOFfYfRgifBN8LCQGUssADLQEwq', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3069, 927, 'CRISTOPHER MARIANO', 'cmmariano@neda.gov.ph', '2022-05-20 02:55:42', '3AS-AMD', 25, '$2y$10$5FIfjy98M9P1OGkFXxxu7enMd1ZJDe7l4DhgS2nKn6B1zgx8W2gS2', NULL, 3, 1, NULL, '2022-05-20 02:55:42', '2022-05-20 02:55:42'),
(3070, 535, 'TABASA OLIVIA', 'ostabasa@neda.gov.ph', '2022-05-20 02:55:42', '3IAS-OAD', 71, '$2y$10$x70FyAy/hc/W.2pHzKlehuJ9NI2iuP5ThtRfXM.cUy3F3Z7WQuLfu', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3071, 392, 'AGOT MARIA HARLENE', 'mdagot@neda.gov.ph', '2022-05-20 02:55:43', '3IAS-MAD', 70, '$2y$10$L482vgyHCovJnzOJLsB8YebMdvwavibfNI3WkaRrD9ViI6T4GTt6a', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3072, 658, 'DOMINGO EUNICE', 'egdomingo@neda.gov.ph', '2022-05-20 02:55:43', '3AS-HRDD', 28, '$2y$10$MajWwtCfxo0mdmblYb9zXOyoSQwFAxrAkgX0P0USTIJuWEPFDMEGi', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3073, 35, 'POLOAN SHEILA', 'srpoloan@neda.gov.ph', '2022-05-20 02:55:43', '3FPMS-BD', 29, '$2y$10$ncOWuav9M8dTUSzLSaTMrOJ.YbD67ihMbH/NaPfEH8oBaPcnVDMzC', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3074, 173, 'ESTOCAPIO MAYRA FE', 'mnestocapio@neda.gov.ph', '2022-05-20 02:55:43', '3AS-AMD', 83, '$2y$10$Ioz/2j.SR9cPqOmb2.se4.rMujZXJywXN6N5nDKN7OOwUmbKbFJmi', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3075, 106, 'VILLARINA NAUMIE', 'nevillarina@neda.gov.ph', '2022-05-20 02:55:43', '3AS-HRDD', 32, '$2y$10$RtHbfEuehFB1LkliuQL.uuM.oFbLTrQUDitjTLaOEkFavSdxuU8qi', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3076, 641, 'MONTAIS JOBELLE CLARISSE', 'jdmontais@neda.gov.ph', '2022-05-20 02:55:43', '3MES-NTISD', 51, '$2y$10$n8HW7GisDe7MwLZo3cFSdO1MIu6ZXCJvk98W1A7je6u/3a8kAqDU.', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3077, 612, 'PAGADUAN JUSTIN', 'justinpagad1@gmail.com', '2022-05-20 02:55:43', '3MES-ESD', 51, '$2y$10$xK1eiCOufg3U1/BaJ/KfCuw/s3NBkfYjFPr1uJDialrfIzwd1gJ3C', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3078, 119, 'RAQUID RAMON NIÑO', 'rtraquid@neda.gov.ph', '2022-05-20 02:55:43', '3DIS-PRD', 59, '$2y$10$utl3BdJN3QAUPOJOoW.s..hbHMyw.xu7YI9Nvpoa9exRjyeQFjgHi', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3079, 149, 'CLAVERIA BRENDA', 'bmclaveria@neda.gov.ph', '2022-05-20 02:55:43', '3FPMS-AD', 19, '$2y$10$Ubp5VTPJC1zd/ZCRsxyFHuQLU6IptNCE8NUtmZGK8dDZ4rKICDZi.', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3080, 928, 'ALLEN KHRISTIAN CRUZ', 'amcruz@neda.gov.ph', '2022-05-20 02:55:43', '3INNS-OD', 110, '$2y$10$fnASD8bJ3zOggxiRlRkVmukmoso.1Dyzd9uoHHpgA086RMndd8AQe', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3081, 370, 'DAVID RAMAVIR MAYLEN', 'rpdavid@neda.gov.ph', '2022-05-20 02:55:43', '3FPMS-MD', 32, '$2y$10$aRtrU0b9J3uhOo3vgNpRF.n7.l4at36gQ.SZIe8FJQVqBYjjXQluK', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3082, 680, 'DEPUTO ARWIN', 'apdeputo@neda.gov.ph', '2022-05-20 02:55:43', '3AS-HRMD', 110, '$2y$10$owJChAKjWBqyN477xMUeIenfhRlfE.u6NbwbOqrKXmnnvuDzm7qda', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3083, 929, 'MARY KRISSEL SANTOS', '1.x@gmail.com', '2022-05-20 02:55:43', '3AS-HRMD', 110, '$2y$10$v25XfR2.dxFOUzgg2KCrqOlxnRR5/FRoAZIlMCPxkI0ksnhVpdL0.', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3084, 367, 'CONSTANTINO DON', 'dpconstantino@neda.gov.ph', '2022-05-20 02:55:43', '3FPMS-BD', 83, '$2y$10$FG1hhDHMo.nhioHK7HKkhemhsG0HQmJE8ZSygX8ScH56T/uG/6qgm', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3085, 523, 'ORLANDA MARIA JOY', 'mborlanda@neda.gov.ph', '2022-05-20 02:55:43', '3AS-HRMD', 85, '$2y$10$blGfS4AblAMxHamamkwLwuxeJ1bxqqs9T9o2/eMkGMGCzzF7K6.6W', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3086, 602, 'MANGUNE KATHLEEN', 'kpmangune@neda.gov.ph', '2022-05-20 02:55:43', '3IS-OD', 47, '$2y$10$yCixRkQOti8VeoFT0/UFxevZYI9hvJJtAYsP2t/eBPSKtsUYEWNOm', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3087, 521, 'KATADA JULES LEMUEL', 'jbkatada@neda.gov.ph', '2022-05-20 02:55:43', '3IS-OD', 23, '$2y$10$kVWGJK59kt2ci83HyqSxx.oQCO7hKFihyX6vGBOHoCvEVSuL8Lb2y', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3088, 120, 'ERRO MARIA ERINA', 'mtsantos@neda.gov.ph', '2022-05-20 02:55:43', '3MES-NTISD', 82, '$2y$10$DiBqfQ2M7tm.RKO9uW5LKO53xaV86/hYu8gD3klOb/3TgypnN0zpO', NULL, 3, 1, NULL, '2022-05-20 02:55:43', '2022-05-20 02:55:43'),
(3089, NULL, 'Rolando G. Jarabata', 'rgjarabata@neda.gov.ph', '2022-05-23 06:22:44', '4ICTS-ISDD', 43, '$2y$10$tWJC9eIxu7qXmfw37Q9YU.fx0fSBYS6EKn/Qv/nih7FACwlzlAisi', NULL, 3, 1, '2nzN5w5JIWIOHlztMJ8rvoVudGzTVG2v4NaU9AEneUlE9bH4AfWx4aAPOUN4', '2022-05-23 06:22:45', '2022-05-23 06:22:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_id` (`issue_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_name_unique` (`name`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD KEY `item_tag_item_id_foreign` (`item_id`),
  ADD KEY `item_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `messages_issue_id_foreign` (`issue_id`);

--
-- Indexes for table `message_user`
--
ALTER TABLE `message_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `messages_users_message_id_foreign` (`message_id`),
  ADD KEY `messages_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectlogs`
--
ALTER TABLE `projectlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `techcounter`
--
ALTER TABLE `techcounter`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `techcounter_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_user`
--
ALTER TABLE `message_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projectlogs`
--
ALTER TABLE `projectlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcounter`
--
ALTER TABLE `techcounter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3090;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD CONSTRAINT `item_tag_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message_user`
--
ALTER TABLE `message_user`
  ADD CONSTRAINT `messages_users_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcounter`
--
ALTER TABLE `techcounter`
  ADD CONSTRAINT `techcounter_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
