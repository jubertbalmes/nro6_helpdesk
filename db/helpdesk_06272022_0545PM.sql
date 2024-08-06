-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2022 at 11:45 AM
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
  `man_day` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `man_day`, `created_at`, `updated_at`) VALUES
(1, 'Unable to signin to NEDA WIFI', 'Unable to signin to NEDA WIFI', 2, '2022-04-18 00:40:04', '2022-06-26 15:15:00'),
(2, 'No internet connection', 'No internet connection', 1, '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(3, 'Unable to receive email', 'Unable to receive email', 1, '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(4, 'dsfds', 'dfdsf', 1, '2022-05-19 01:33:19', '2022-05-19 01:33:19'),
(5, 'asdas', 'asdasdsd', 1, '2022-06-26 08:09:29', '2022-06-26 08:13:53');

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
(48, 36, 1, '2134d', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(49, 36, 2, '234234d', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(50, 36, 4, 'rolandojarabata1121@gmail.com', '2022-05-17 08:03:13', '2022-05-17 08:03:13'),
(51, 37, 1, '09089219612', '2022-05-19 02:03:23', '2022-05-19 02:03:23'),
(55, 5, 1, '4535345', '2022-06-26 01:13:13', '2022-06-26 01:13:13'),
(56, 5, 2, '4535345', '2022-06-26 01:13:13', '2022-06-26 01:13:13'),
(57, 5, 4, 'Rolandojarabata11@gmail.com', '2022-06-26 01:13:13', '2022-06-26 01:13:13'),
(61, 3, 1, NULL, '2022-06-27 08:46:22', '2022-06-27 08:46:22'),
(62, 3, 2, NULL, '2022-06-27 08:46:22', '2022-06-27 08:46:22'),
(63, 3, 4, NULL, '2022-06-27 08:46:22', '2022-06-27 08:46:22'),
(64, 4, 1, NULL, '2022-06-27 08:50:20', '2022-06-27 08:50:20'),
(65, 4, 2, NULL, '2022-06-27 08:50:20', '2022-06-27 08:50:20'),
(66, 4, 4, NULL, '2022-06-27 08:50:20', '2022-06-27 08:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(1, 'OFFICE OF THE SECRETARY', 'OSEC', '2022-06-01 07:54:58', '2022-06-01 07:54:58'),
(2, 'POLICY AND PLANNING GROUP', 'PPG', '2022-06-01 07:55:32', '2022-06-01 07:55:32'),
(3, 'INVESTMENT PROGRAMMING GROUP', 'IPG', '2022-06-01 07:57:04', '2022-06-01 07:57:04'),
(4, 'REGIONAL DEVELOPMENT GROUP', 'RDG', '2022-06-01 07:57:04', '2022-06-01 07:57:04'),
(5, 'CORPORATE AFFAIRS GROUP', 'CAG', '2022-06-01 07:57:04', '2022-06-01 07:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `repeat` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `date`, `repeat`, `created_at`, `updated_at`) VALUES
(1, 'New Year', '1900-01-01', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(2, 'Chinese New Year', '2022-02-01', 0, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(3, 'EDSA Revolution Anniversary', '1900-02-25', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(4, 'Day of Valor', '1900-04-09', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(5, 'Maundy Thursday', '2022-04-14', 0, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(6, 'Good Friday', '2022-04-15', 0, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(7, 'Labor Day', '1900-05-01', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(8, 'Independence Day', '1900-06-12', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(9, 'Ninoy Aquino Day', '1900-08-21', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(10, 'All Saints’ Day', '1900-11-01', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(11, 'Bonifacio Day', '1900-11-30', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(12, 'Feast of the Immaculate Conception of Mary', '1900-12-08', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(13, 'Christmas Day', '1900-12-25', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(14, 'Rizal Day', '1900-12-30', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25');

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
(33, 5, 1, 2, '1234', NULL, 3, 4, NULL, 'dsfdsfdsf', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:07:09', '2022-05-16 05:37:33', '2022-06-26 01:46:22'),
(34, 5, 1, 1, 'asdsad', NULL, 4, 4, NULL, 'sdsads', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:17:45', '2022-05-16 05:39:14', '2022-05-19 03:21:32'),
(35, 5, 1, 2, 'fgfdg', NULL, 4, 4, NULL, 'sdasdsa', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:34:09', '2022-05-16 06:22:25', '2022-05-19 03:40:01'),
(36, 5, 1, 2, 'asdsad', NULL, 4, 4, NULL, 'asdsad', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:41:25', '2022-05-16 06:26:59', '2022-05-19 03:46:14'),
(37, 5, 1, 1, 'sdfdsf', NULL, 4, 4, NULL, 'dfsdfdsf', NULL, NULL, NULL, NULL, NULL, '2022-05-19 05:03:36', '2022-05-17 08:01:43', '2022-05-19 05:08:35'),
(38, 19, 1, 2, 'dsfdsf', NULL, 4, 4, NULL, 'cgbnbn', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:30:15', '2022-05-19 06:30:15', '2022-05-19 06:30:59'),
(39, 6, 1, 2, 'sdfdsf', NULL, 4, 4, NULL, 'sadsad', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:36:21', '2022-05-19 06:36:21', '2022-05-19 06:36:39'),
(40, 5, 1, 1, 'test', NULL, 2, 4, NULL, NULL, 3, 'asdasdasd', NULL, NULL, NULL, '2022-06-27 00:36:38', '2022-06-22 01:15:38', '2022-06-27 00:36:38');

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
(109, 30, 5, 3, 5, 'Rating: 1; Comments: Konting bilis pa', '2022-06-24 09:13:30', '2022-06-24 09:13:30'),
(110, 33, 3, 1, 3, 'rolandojarabata11-Tech', '2022-06-26 01:46:28', '2022-06-26 01:46:28'),
(111, 40, 3, 1, 6, 'asdasdasd', '2022-06-26 02:01:58', '2022-06-26 02:01:58');

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
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `name`, `abbreviation`, `voip`, `main`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'Office of the Secretary', 'OS', NULL, 0, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(2, 'Internal Audit Service', 'IAS', NULL, 0, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(3, 'Internal Audit Service - Office of the Director', 'IAS - OD', NULL, 2, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(4, 'Internal Audit Service - Management Audit Division', 'IAS - MAD', NULL, 2, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(5, 'Internal Audit Service - Operations Audit Division', 'IAS - OAD', NULL, 2, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(6, 'Legislative Executive Development Advisory Council', 'LEDAC', NULL, NULL, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(7, 'Legislative Liaison Office', 'LLO', NULL, 0, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(8, 'Development Information Staff', 'DIS', NULL, 0, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(9, 'Development Information Staff - Office of the Director', 'DIS - OD', NULL, 8, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(10, 'Development Information Staff - Knowledge Management Division', 'DIS - KMD', NULL, 8, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(11, 'Development Information Staff - Multimedia Development Division', 'DIS - MDD', NULL, 8, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(12, 'Development Information Staff - Public Relations Division', 'DIS - PRD', NULL, 8, 1, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(13, 'Office of the Undersecretary - Corporate Affairs Group', 'OUSEC - CAG', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(14, 'Office of the Assistant Secretary - Corporate Affairs Group', 'OASEC - CAG', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(15, 'Administrative Staff', 'AS', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(16, 'Administrative Staff - Office of the Director', 'AS - OD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(17, 'Administrative Staff - Assets Management Division', 'AS - AMD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(18, 'Administrative Staff - Human Resource Development Division', 'AS - HRDD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(19, 'Administrative Staff - Human Resource Management Division', 'AS - HRMD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(20, 'Administrative Staff - General Services Division', 'AS - GSD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(21, 'Administrative Staff - Procurement Management Division', 'AS - PMD', NULL, 15, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(22, 'Financial, Planning and Management Staff', 'FPMS', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(23, 'Financial, Planning and Management Staff - Office of the Director', 'FPMS - OD', NULL, 22, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(24, 'Financial, Planning and Management Staff - Accounting Division', 'FPMS - AD', NULL, 22, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(25, 'Financial, Planning and Management Staff - Budget Division', 'FPMS - BD', NULL, 22, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(26, 'Financial, Planning and Management Staff - Corporate Planning and Monitoring Division', 'FPMS - CPMD', NULL, 22, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(27, 'Financial, Planning and Management Staff - Management Division', 'FPMS - MD', NULL, 22, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(28, 'Information and Communications Technology Staff', 'ICTS', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(29, 'Information and Communications Technology Staff - Office of the Director', 'ICTS - OD', NULL, 28, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(30, 'Information and Communications Technology Staff - ICT Network Division', 'ICTS - IND', NULL, 28, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(31, 'Information and Communications Technology Staff - Information Systems Development Division', 'ICTS - ISDD', '9999', 28, 0, '2022-06-09 00:00:42', '2022-06-27 09:26:55'),
(32, 'Legal Staff', 'LS', NULL, 0, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(33, 'Legal Staff - Office of the Director', 'LS - OD', NULL, 32, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(34, 'Legal Staff - Investigation and Litigation Division', 'LS - ILD', NULL, 32, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(35, 'Legal Staff - Legal Counselling and Assistance Division', 'LS - LCAD', NULL, 32, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(36, 'Legal Staff - Legal Research and Compliance Division', 'LS - LRCD', NULL, 32, 5, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(37, 'Office of the Undersecretary - Policy and Planning Group', 'OUSEC - PPG', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(38, 'Office of the Undersecretary - Policy and Planning Group - Social Development Group', 'OUSEC - PPG - SDG', NULL, 37, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(39, 'Office of the Assistant Secretary - Policy and Planning Group', 'OASEC - PPG', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(40, 'Office of the Assistant Secretary - Policy and Planning Group - Innovation Staff - Office of the Director', 'OASEC - PPG - IS - OD', NULL, 39, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(41, 'Office of the Assistant Secretary - Policy and Planning Group - Innovation Staff - Innovation Fund Management Division', 'OASEC - PPG - IS - IFMD', NULL, 39, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(42, 'Office of the Assistant Secretary - Policy and Planning Group - Innovation Staff - Strategic Policy Initiatives Division', 'OASEC - PPG - IS - SPID', NULL, 39, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(43, 'Office of the Assistant Secretary - Policy and Planning Group - Innovation Staff - Innovation Community and Partnerships Development Division ', 'OASEC - PPG - IS - ICPDD', NULL, 39, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(44, 'Governance Staff', 'GS', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(45, 'Governance Staff - Office of the Director', 'GS - OD', NULL, 44, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(46, 'Governance Staff - Administrative Governance Division', 'GS - AGD', NULL, 44, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(47, 'Governance Staff - Political Governance Division', 'GS - PGD', NULL, 44, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(48, 'Governance Staff - Development Research Division', 'GS - DRD', NULL, 44, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(49, 'National Policy and Planning Staff', 'NPPS', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(50, 'National Policy and Planning Staff - Office of the Director', 'NPPS - OD', NULL, 49, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(51, 'National Policy and Planning Staff - International Economics Division', 'NPPS - IED', NULL, 49, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(52, 'National Policy and Planning Staff - Macroeconomic Division', 'NPPS - MD', NULL, 49, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(53, 'National Policy and Planning Staff - Policy Coordination Division', 'NPPS - PCD', NULL, 49, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(54, 'National Policy and Planning Staff - Public Finance Division', 'NPPS - PFD', NULL, 49, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(55, 'Social Development Staff', 'SDS', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(56, 'Social Development Staff - Office of the Director', 'SDS - OD', NULL, 55, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(57, 'Social Development Staff - Education and Skills Development Division', 'SDS - ESDD', NULL, 55, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(58, 'Social Development Staff - Health, Nutrition and Population Division', 'SDS - HNPD', NULL, 55, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(59, 'Social Development Staff - Housing and Human Settlements Division', 'SDS - HHSD', NULL, 55, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(60, 'Social Development Staff - Social Protection and Integration Division', 'SDS - SPID', NULL, 55, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(61, 'Trade, Services, and Industry Staff', 'TSIS', NULL, 0, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(62, 'Trade, Services, and Industry Staff - Office of the Director', 'TSIS - OD', NULL, 61, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(63, 'Trade, Services, and Industry Staff - Industry Division', 'TSIS - ID', NULL, 61, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(64, 'Trade, Services, and Industry Staff - Services Division', 'TSIS - SD', NULL, 61, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(65, 'Trade, Services, and Industry Staff - Trade Division', 'TSIS - TD', NULL, 61, 2, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(66, 'Office of the Undersecretary - Investment Planning Group', 'OUSEC - IPG', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(67, 'Office of the Assistant Secretary - Investment Planning Group', 'OASEC - IPG', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(68, 'Office of the Assistant Secretary - Infrastructure Development', 'OASEC - ID', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(69, 'Infrastructure Staff', 'IS', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(70, 'Infrastructure Staff - Office of the Director', 'IS - OD', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(71, 'Infrastructure Staff - ICT Division', 'IS - ID', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(72, 'Infrastructure Staff - Power, Energy and Electrification Division', 'IS - PEED', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(73, 'Infrastructure Staff - Social and Other Public Infrastructure Division', 'IS - SOPID', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(74, 'Infrastructure Staff - Transportation Division', 'IS - TD', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(75, 'Infrastructure Staff - Value/Risk Analysts and Infrastructure Regulation Division', 'IS - VAIRD', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(76, 'Infrastructure Staff - Water Resources Division', 'IS - WRD', NULL, 69, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(77, 'Monitoring and Evaluation Staff', 'MES', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(78, 'Monitoring and Evaluation Staff - Office of the Director', 'MES - OD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(79, 'Monitoring and Evaluation Staff - Economic Sector Division', 'MES - ESD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(80, 'Monitoring and Evaluation Staff - Non-Transport Infrastructure Sector Division', 'MES - NISD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(81, 'Monitoring and Evaluation Staff - Social Sector Division', 'MES - SSD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(82, 'Monitoring and Evaluation Staff - Systems and Data Analysis Division', 'MES - SDAD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(83, 'Monitoring and Evaluation Staff - Transport Infrastructure Sector Division', 'MES - TISD', NULL, 77, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(84, 'Public Investment Staff', 'PIS', NULL, 0, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(85, 'Public Investment Staff - Office of the Director', 'PIS - OD', NULL, 84, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(86, 'Public Investment Staff - Investment Programming Division', 'PIS - IPD', NULL, 84, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(87, 'Public Investment Staff - Program Financing I Division', 'PIS - PFD - I', NULL, 84, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(88, 'Public Investment Staff - Program Financing Il Division', 'PIS - PFD - II', NULL, 84, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(89, 'Public Investment Staff - Program Financing Ill Division', 'PIS - PFID - II', NULL, 84, 3, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(90, 'Office of the Undersecretary - Regional Development Group', 'OUSEC - RDG', NULL, 0, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(91, 'Office of the Assistant Secretary - Regional Development Group', 'OASEC - RDG', NULL, 0, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(92, 'Agriculture, Natural Resources and Environment Staff', 'ANRES', NULL, 0, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(93, 'Agriculture, Natural Resources and Environment Staff - Office of the Director', 'ANRES - OD', NULL, 92, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(94, 'Agriculture, Natural Resources and Environment Staff - Agricultural Commodities Division', 'ANRES - ACD', NULL, 92, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(95, 'Agriculture, Natural Resources and Environment Staff - Environment Division', 'ANRES - ED', NULL, 92, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(96, 'Agriculture, Natural Resources and Environment Staff - Natural Resources Division', 'ANRES - NRD', NULL, 92, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(97, 'Agriculture, Natural Resources and Environment Staff - Rural Institutions and Support Services Division', 'ANRES - RISSD', NULL, 92, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(98, 'Regional Development Staff', 'RDS', NULL, 0, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(99, 'Regional Development Staff - Office of the Director', 'RDS - OD', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(100, 'Regional Development Staff - Land Use and Physical Planning', 'RDS - LUPP', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(101, 'Regional Development Staff - Regional and Local Institutional Development Division', 'RDS - RLIDD', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(102, 'Regional Development Staff - Regional Development Assistance Division', 'RDS - RDAD', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(103, 'Regional Development Staff - Regional Development Planning Division', 'RDS - RDPD', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42'),
(104, 'Others', 'Others', NULL, 98, 4, '2022-06-09 00:00:42', '2022-06-01 00:00:42');

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
(6, 'Invalid', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
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
(1, 4, 4),
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
  `staff_id` int(11) NOT NULL,
  `voip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `email_verified_at`, `staff_id`, `voip`, `position_id`, `password`, `picture`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, NULL, 'Rolando G. Jarabata', 'rgjarabata1@neda.gov.ph', '2022-04-17 16:40:32', 31, '1234', 1, '$2y$10$7cCQoCYnZG9G62muKhp0ROhqv8RcBg.2hIsEwSDS7LmhAFp1N65M6', 'profile/cDskGukcTHEhFbsO2Ln5WXUrNheX6VO8E4uDWMOV.jpg', 1, 1, NULL, '2022-04-17 16:40:04', '2022-06-27 08:47:06'),
(4, NULL, 'rolandojarabata11-Tech', 'rolandojarabata11@gmail.com', '2022-04-17 16:40:32', 30, '4321', 16, '$2y$10$nziGw1soLU02RjWCNVG1a.jUeTDb/50laGuGFQoodQ3wxacgU0xR2', NULL, 2, 1, NULL, '2022-04-17 16:40:04', '2022-06-27 08:52:14'),
(5, 668, 'rgjarabata-Owner', 'rgjarabata0@neda.gov.ph', '2022-04-17 16:40:32', 31, NULL, 18, '$2y$10$QDtiE1738uukmK4xLmrDaO02wyOnCfQsWJeHrmzAohTOAECD.3vxq', NULL, 3, 1, 'SoeUbialjspAOxEGqQgh5QwoqwDvoKWFxLhjJ79H3hqY6LnmLilOcMRe5aZF', '2022-04-17 16:40:04', '2022-06-25 17:13:13'),
(6, NULL, 'Lorem T. Ipsum', 'marjoriedubria131@gmail.com', '2022-04-17 16:40:32', 2, NULL, 1, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 3, 1, NULL, '2022-04-17 16:40:04', '2022-04-26 05:58:46'),
(14, NULL, 'HOD - Helpdesk of the day', 'rolandojarabata13@yahoo.com', '2022-04-26 06:41:14', 2, NULL, 2, '$2y$10$k6TtdwKbeBcduTdvdKqkbOF0QwxO26oa.cp79w.DnwAYGGdK1U0Zq', NULL, 4, 1, NULL, '2022-04-26 06:14:16', '2022-04-26 06:41:50'),
(19, NULL, 'Gipong Jarabata', 'rolandojarabata113@gmail.com', '2022-05-04 00:51:51', 2, NULL, 43, '$2y$10$bMulog4gaAn2tHugoVtogOeG0yHWQlbyM7AkhNmzd6/OPIfNBUp9S', NULL, 3, 1, NULL, '2022-05-04 00:48:56', '2022-05-04 00:52:48'),
(28, NULL, 'Test User', 'testuser@gmail.com', '2022-05-12 00:41:30', 2, NULL, 19, '$2y$10$dXfUHC0bu0GKLCp39i5eP.jTaTK9h/ayMRJCdcww7cVlsYhHZT6Me', NULL, 3, 1, NULL, '2022-05-12 00:41:30', '2022-05-12 00:41:30'),
(29, NULL, 'rolandojarabata12-Tech', 'rolandojarabata12@gmail.com', '2022-04-17 16:40:32', 30, NULL, 4, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 2, 1, NULL, '2022-04-17 16:40:04', '2022-05-18 17:19:09'),
(36, NULL, 'asd', 'rolandojarabata111@gmail.com', '2022-05-17 00:02:36', 2, NULL, 16, '$2y$10$2.wdA59w1NHXTgwK.YdQ6.Lig02IgxovxMnFjtoAdLxsdF4f0yKp2', 'profile/uELNUQtYOmczpbscTGUe2Af2EHOopPoBsNOgedBZ.jpg', 4, 1, NULL, '2022-05-17 00:02:36', '2022-05-17 00:02:46'),
(37, NULL, 'Marjorie Dubria - Technician', 'marjoriedubria31@gmail.com', '2022-06-27 08:53:39', 30, '0987', 61, '$2y$10$CbrFZJaZJkOTbUuSWgCKd.7pL71LbjZq3HiBibAhK1sH/pc2CnSXC', NULL, 2, 1, NULL, '2022-06-27 08:53:39', '2022-06-27 08:53:39');

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
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `holidays_name_unique` (`name`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
