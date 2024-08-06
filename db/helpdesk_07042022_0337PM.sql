-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2022 at 09:37 AM
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

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `issue_id`, `orig_file`, `hash_file`, `created_at`, `updated_at`) VALUES
(14, 41, 'card-profile2-square.jpg', 'uWhdNUfjZ1prvwd1M88JWkRsKl6AiD9Nv0JcDct9.jpg', '2022-06-28 12:57:00', '2022-06-28 12:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `man_day` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `ts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `man_day`, `ts`, `created_at`, `updated_at`) VALUES
(1, 'WIFI issue', 'WIFI issue', 3, NULL, '2022-04-17 16:40:04', '2022-06-28 05:14:44'),
(2, 'No internet connection', 'No internet connection', 1, NULL, '2022-04-17 16:40:04', '2022-04-17 16:40:04'),
(3, 'Unable to receive email', 'Unable to receive email', 1, NULL, '2022-04-17 16:40:04', '2022-04-17 16:40:04'),
(4, 'Setup/Configure new laptop/desktop', 'Setup/Configure new laptop/desktop', 1, NULL, '2022-05-18 17:33:19', '2022-05-18 17:33:19'),
(5, 'Document related ', 'Document related ', 1, 'This is a troubleshooting steps', '2022-06-26 00:09:29', '2022-06-28 06:49:07'),
(6, 'Hardware', 'Hardware', 1, NULL, NULL, NULL),
(7, 'Network Connectivity', 'Network Connectivity', 1, NULL, NULL, NULL),
(8, 'Printer', 'Printer', 1, NULL, NULL, NULL),
(9, 'Shared Folder', 'Shared Folder', 1, NULL, NULL, NULL),
(10, 'Software installation/configuration', 'Software installation', 1, NULL, NULL, NULL),
(11, 'Office 365 related', 'Office 365 related', 1, NULL, NULL, NULL),
(12, 'Active Directory related', 'Active Directory related', 1, NULL, NULL, NULL),
(13, 'Laptop/Desktop diagnostic', 'Hardware diagnostic', 2, NULL, NULL, NULL),
(14, 'Kaseya - Antivirus', 'Kaseya - Antivirus', 1, NULL, NULL, NULL),
(15, 'Projector setup', 'Projector setup', 1, NULL, NULL, NULL),
(16, 'Scanner setup', 'Scanner setup', 1, NULL, NULL, NULL),
(17, 'Lotus Notes', 'Lotus Notes', 1, NULL, NULL, NULL),
(18, 'Outlook/Email related', 'Outlook/Email', 1, NULL, NULL, NULL),
(19, 'Audio and Visual assistance', 'Audio and Visual assistance', 1, NULL, NULL, NULL),
(20, 'Monitor/CPU/Keyboard/Mouse/UPS related', 'Monitor/CPU/Keyboard/Mouse/UPS related', 1, NULL, NULL, NULL),
(21, 'Zoom setup', 'Zoom setup', 1, NULL, NULL, NULL),
(22, 'Font Installation', 'Font Installation', 1, NULL, NULL, NULL),
(23, 'WIFI credentials', 'WIFI credentials', 1, NULL, NULL, NULL),
(24, 'IP/VoIP Phone', 'IP/VoIP Phone', 1, NULL, NULL, NULL),
(25, 'PNPKI', 'PNPKI', 1, NULL, NULL, NULL),
(26, 'Email/Group Email creation', 'Email/Group Email creation', 1, NULL, NULL, NULL),
(27, 'Group Email Inclusion', 'Group Email Inclusion', 1, NULL, NULL, NULL),
(28, 'Photocopier setup', 'Photocopier setup', 1, NULL, NULL, NULL),
(29, 'BIR Forms setup', 'BIR Forms setup', 1, NULL, NULL, NULL),
(30, 'Inquiry', 'Inquiry', 1, NULL, NULL, NULL),
(31, 'Adobe Acrobat', 'Adobe Acrobat', 1, NULL, NULL, NULL),
(32, 'USB/Flash Drive related', 'USB/Flash Drive related', 1, NULL, NULL, NULL);

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
(14, 'Rizal Day', '1900-12-30', 1, '2022-06-26 08:28:25', '2022-06-26 08:28:25'),
(16, 'Indep', '2022-06-28', 0, '2022-06-28 13:30:19', '2022-06-28 13:30:19'),
(17, 'Test', '2022-06-29', 0, '2022-06-28 23:48:04', '2022-06-28 23:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `reff_no` varchar(12) NOT NULL,
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
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `reff_no`, `user_id`, `category_id`, `priority`, `description`, `steps_to_replicate`, `status`, `resolver_id`, `assigned_by_system`, `remarks`, `rejected_id`, `reason_for_rejection`, `reason_for_reopen`, `rating`, `remarks_creator`, `started_at`, `completed_at`, `created_at`, `updated_at`) VALUES
(30, '2022-05-0001', 5, 1, 1, '1', '1', 5, 4, NULL, 'basta\r\n\r\nnew basta\r\n\r\nnew ulit\r\n\r\nfinal\r\n\r\nlast\r\n\r\neto parin?', NULL, NULL, 'may error pa rin 2x\r\n\r\npromise may error pa rin 2x', 1, 'Konting bilis pa', '2022-05-19 05:22:57', '2022-05-24 05:22:57', '2022-05-13 06:19:14', '2022-06-24 09:13:23'),
(31, '2022-05-0002', 5, 1, 1, 'Testing ng walang steps to rep', NULL, 5, 4, NULL, 'sdfdsf', NULL, NULL, NULL, 5, NULL, '2022-05-13 07:03:19', '2022-05-18 07:03:19', '2022-05-13 07:03:19', '2022-06-30 02:00:53'),
(32, '2022-05-0003', 5, 1, 1, 'test2', NULL, 5, 4, NULL, NULL, NULL, NULL, NULL, 4, 'ok naman', '2022-05-16 05:20:06', '2022-05-21 05:20:06', '2022-05-16 05:20:06', '2022-05-17 08:14:49'),
(33, '2022-05-0004', 5, 1, 2, '1234', NULL, 3, 4, NULL, 'dsfdsfdsf', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:07:09', NULL, '2022-05-16 05:37:33', '2022-06-26 01:46:22'),
(34, '2022-05-0005', 5, 1, 1, 'asdsad', NULL, 4, 4, NULL, 'sdsads', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:17:45', '2022-05-19 03:22:45', '2022-05-16 05:39:14', '2022-05-19 03:21:32'),
(35, '2022-05-0006', 5, 1, 2, 'fgfdg', NULL, 4, 4, NULL, 'sdasdsa', NULL, NULL, NULL, NULL, NULL, '2022-05-19 03:34:09', '2022-05-24 03:34:09', '2022-05-16 06:22:25', '2022-05-19 03:40:01'),
(36, '2022-05-0007', 5, 1, 2, 'asdsad', NULL, 5, 4, NULL, 'asdsad', NULL, NULL, NULL, 5, 'Testing', '2022-05-19 03:41:25', '2022-05-24 03:41:25', '2022-05-16 06:26:59', '2022-06-30 09:04:28'),
(37, '2022-05-0008', 5, 1, 1, 'sdfdsf', NULL, 5, 4, NULL, 'dfsdfdsf', NULL, NULL, NULL, 5, NULL, '2022-05-19 05:03:36', '2022-05-24 05:03:36', '2022-05-17 08:01:43', '2022-06-30 04:33:50'),
(38, '2022-05-0009', 19, 1, 2, 'dsfdsf', NULL, 4, 4, NULL, 'cgbnbn', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:30:15', '2022-05-24 06:30:15', '2022-05-19 06:30:15', '2022-05-19 06:30:59'),
(39, '2022-05-0010', 6, 1, 2, 'sdfdsf', NULL, 4, 4, NULL, 'sadsad', NULL, NULL, NULL, NULL, NULL, '2022-05-19 06:36:21', '2022-05-24 06:36:21', '2022-05-19 06:36:21', '2022-05-19 06:36:39'),
(40, '2022-06-0001', 5, 1, 1, 'test', NULL, 2, 4, NULL, NULL, 3, 'asdasdasd', NULL, NULL, NULL, '2022-06-27 00:36:38', NULL, '2022-06-22 01:15:38', '2022-06-27 00:36:38'),
(41, '2022-06-0002', 38, 2, 1, 'Unable to connect on the internet via lan', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-28 12:56:46', '2022-06-28 12:56:46'),
(42, '2022-06-0003', 38, 2, 1, 'No connection during peak hours', NULL, 6, NULL, NULL, NULL, 3, 'Duplicate request', NULL, NULL, NULL, NULL, NULL, '2022-06-28 23:58:18', '2022-06-29 00:02:58'),
(43, '2022-06-0004', 38, 5, 1, 'On and off connection during afternoon', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-29 00:01:38', '2022-06-29 00:01:38'),
(44, '2022-07-0001', 41, 1, 1, 'ss', NULL, 5, 42, NULL, 'okay', NULL, NULL, 'di marunong mag ayos , paayos ulit', 1, 'di marunong mag ayos', '2022-07-01 00:22:26', '2022-07-01 00:27:07', '2022-06-30 23:51:22', '2022-07-01 00:28:37'),
(45, '2022-07-0002', 41, 1, 1, 'asds', NULL, 5, 42, NULL, 'aaa', NULL, NULL, NULL, 5, NULL, '2022-07-01 00:44:55', '2022-07-01 00:58:49', '2022-07-01 00:42:36', '2022-07-01 01:00:31'),
(46, '2022-07-0003', 41, 5, 1, 'asdasdas', NULL, 4, 42, NULL, 'asd', NULL, NULL, NULL, NULL, NULL, '2022-07-01 05:18:46', '2022-07-01 05:18:46', '2022-07-01 01:21:00', '2022-07-01 05:18:46'),
(47, '2022-07-0004', 41, 5, 1, 'asdasdas', NULL, 4, 42, NULL, '000', NULL, NULL, NULL, NULL, NULL, '2022-07-01 01:21:50', '2022-07-01 01:22:31', '2022-07-01 01:21:01', '2022-07-01 01:22:31'),
(48, '2022-07-0005', 41, 3, 1, 'asasds', NULL, 4, 42, NULL, 'asdasd', NULL, NULL, NULL, NULL, NULL, '2022-07-01 05:19:17', '2022-07-01 06:32:48', '2022-07-01 05:16:42', '2022-07-01 06:32:48'),
(49, '2022-07-0006', 41, 7, 1, 'adasdsdas', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-01 06:08:49', NULL, '2022-07-01 05:17:51', '2022-07-01 06:09:12');

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
  `name` varchar(255) NOT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_date`, `modified_date`) VALUES
(16, 'Accountant I', '2018-12-31 16:00:00', '2021-12-01 23:12:43'),
(17, 'Accountant II', '2018-12-31 16:00:00', '2021-12-01 23:18:43'),
(18, 'Accountant III', '2018-12-31 16:00:00', '2022-04-07 22:07:47'),
(19, 'Accountant IV', '2018-12-31 16:00:00', NULL),
(20, 'Administrative Aide III', '2018-12-31 16:00:00', '2021-11-11 19:44:32'),
(21, 'Administrative Aide IV', '2018-12-31 16:00:00', '2021-11-22 23:04:21'),
(22, 'Administrative Aide V', '2018-12-31 16:00:00', '2021-11-14 23:52:46'),
(23, 'Administrative Aide VI', '2018-12-31 16:00:00', '2021-11-30 23:09:26'),
(24, 'Administrative Assistant I', '2018-12-31 16:00:00', '2021-10-25 19:39:21'),
(25, 'Administrative Assistant II', '2018-12-31 16:00:00', '2019-07-29 22:12:44'),
(26, 'Administrative Assistant III', '2018-12-31 16:00:00', '2019-06-18 23:10:25'),
(27, 'Administrative Assistant V', '2018-12-31 16:00:00', '2021-11-09 23:58:21'),
(28, 'Administrative Officer I', '2018-12-31 16:00:00', '2021-11-09 17:08:35'),
(29, 'Administrative Officer II', '2018-12-31 16:00:00', '2021-11-05 00:04:32'),
(30, 'Administrative Officer III', '2018-12-31 16:00:00', '2021-11-09 17:49:52'),
(31, 'Administrative Officer IV', '2018-12-31 16:00:00', '2021-11-05 00:18:11'),
(32, 'Administrative Officer V', '2018-12-31 16:00:00', '2021-11-04 22:05:41'),
(33, 'Assistant Director-General', '2018-12-31 16:00:00', '2022-03-24 17:40:10'),
(34, 'Attorney III', '2018-12-31 16:00:00', '2021-12-08 18:18:54'),
(35, 'Attorney IV', '2018-12-31 16:00:00', '2022-04-12 18:19:55'),
(36, 'Attorney V', '2018-12-31 16:00:00', '2022-04-12 18:23:02'),
(37, 'Chief Accountant', '2018-12-31 16:00:00', '2021-11-22 23:39:59'),
(38, 'Chief Administrative Officer ', '2018-12-31 16:00:00', '2021-11-14 18:33:36'),
(39, 'Chief Economic Development Specialist', '2018-12-31 16:00:00', '2021-12-09 17:43:50'),
(40, 'Chief Economic Developmet Specialist', '2018-12-31 16:00:00', '2021-12-08 17:33:21'),
(41, 'Computer Maintenance Technologist I', '2018-12-31 16:00:00', '2022-03-15 22:27:57'),
(42, 'Computer Operator I', '2018-12-31 16:00:00', '2022-04-19 18:51:29'),
(43, 'Computer Programmer II', '2018-12-31 16:00:00', '2021-11-25 23:34:20'),
(44, 'Department Legislative Liaison Specialist', '2018-12-31 16:00:00', '2022-01-26 00:42:21'),
(45, 'Deputy Director-General', '2018-12-31 16:00:00', NULL),
(46, 'Director III', '2018-12-31 16:00:00', '2021-12-06 19:37:17'),
(47, 'Director IV', '2018-12-31 16:00:00', '2021-11-08 00:01:32'),
(48, 'Director-General', '2018-12-31 16:00:00', NULL),
(49, 'Draftsman III', '2018-12-31 16:00:00', '2022-04-25 16:23:07'),
(50, 'Economic Development Specialist I', '2018-12-31 16:00:00', '2021-11-25 18:38:55'),
(51, 'Economic Development Specialist II', '2018-12-31 16:00:00', '2021-11-25 21:18:52'),
(52, 'Engineer III', '2018-12-31 16:00:00', '2021-11-14 16:17:47'),
(53, 'Executive Assistant III', '2018-12-31 16:00:00', NULL),
(54, 'Executive Assistant IV', '2018-12-31 16:00:00', '2021-11-25 22:53:44'),
(55, 'Executive Assistant V', '2018-12-31 16:00:00', '2021-12-08 22:55:12'),
(56, 'Head Executive Assistant', '2018-12-31 16:00:00', NULL),
(57, 'Information Officer I', '2018-12-31 16:00:00', NULL),
(58, 'Information Officer II', '2018-12-31 16:00:00', '2021-11-30 21:37:53'),
(59, 'Information Officer III', '2018-12-31 16:00:00', '2021-12-06 22:03:43'),
(60, 'Information Officer IV', '2018-12-31 16:00:00', '2021-12-06 21:57:34'),
(61, 'Information Officer V', '2018-12-31 16:00:00', '2022-02-03 18:19:17'),
(62, 'Information Systems Analyst I', '2018-12-31 16:00:00', '2022-04-19 21:42:24'),
(63, 'Information Systems Analyst II', '2018-12-31 16:00:00', '2022-03-15 22:31:10'),
(64, 'Information Systems Analyst III', '2018-12-31 16:00:00', '2022-04-20 15:27:49'),
(65, 'Information Technology Officer I', '2018-12-31 16:00:00', NULL),
(66, 'Information Technology Officer II', '2018-12-31 16:00:00', '2022-04-19 18:26:39'),
(67, 'Information Technology Officer III', '2018-12-31 16:00:00', '2022-04-17 16:07:26'),
(68, 'Internal Auditing Assistant', '2018-12-31 16:00:00', '2022-04-24 18:42:25'),
(69, 'Internal Auditor II', '2018-12-31 16:00:00', '2022-04-24 18:46:10'),
(70, 'Internal Auditor III', '2018-12-31 16:00:00', '2022-03-22 17:56:02'),
(71, 'Internal Auditor IV', '2018-12-31 16:00:00', '2022-03-22 17:54:02'),
(72, 'Internal Auditor V', '2018-12-31 16:00:00', '2021-12-09 00:44:31'),
(73, 'Legal Assistant III', '2018-12-31 16:00:00', '2021-12-22 21:40:26'),
(74, 'Planning Officer I', '2018-12-31 16:00:00', NULL),
(75, 'Planning Officer II', '2018-12-31 16:00:00', '2021-12-06 23:28:12'),
(76, 'Planning Officer III', '2018-12-31 16:00:00', '2022-04-11 21:37:01'),
(77, 'Planning Officer IV', '2018-12-31 16:00:00', '2021-12-06 23:19:13'),
(78, 'Planning Officer V', '2018-12-31 16:00:00', '2022-04-10 18:41:47'),
(79, 'Security Officer II', '2018-12-31 16:00:00', NULL),
(80, 'Security Officer IV', '2018-12-31 16:00:00', NULL),
(81, 'Senior Administrative Assistant V', '2018-12-31 16:00:00', NULL),
(82, 'Senior Economic Development Specialist', '2018-12-31 16:00:00', '2021-11-25 21:22:56'),
(83, 'Supervising Administrative Officer ', '2018-12-31 16:00:00', '2021-11-11 22:08:46'),
(84, 'Supervising Economic Development Specialist', '2018-12-31 16:00:00', '2021-12-09 17:29:50'),
(85, 'Encoder', '2019-05-09 06:40:41', '2021-04-06 20:17:49'),
(86, 'Security Guard (Outsource)', '2019-05-16 11:25:00', NULL),
(87, 'OJT (Outsource)', '2019-05-16 11:25:00', NULL),
(88, 'Driver (Outsource)', '2019-05-16 11:25:00', '2021-02-01 23:36:24'),
(89, 'Encoder (Outsource)', '2019-05-16 11:25:00', NULL),
(90, 'Admin. Officer IV', '2020-10-22 06:24:41', NULL),
(91, 'Sr. Economic Development Specialist', '2020-10-26 07:44:54', NULL),
(92, 'Acctnt. I', '2020-10-27 05:30:54', NULL),
(93, 'Admin. Officer III', '2020-10-27 06:33:16', NULL),
(94, 'Senior Eco. Development Specialist', '2020-11-04 07:13:36', NULL),
(95, 'Eco. Development Specialist I', '2020-11-09 02:13:43', NULL),
(96, 'Eco. Development Specialist II', '2020-11-09 02:17:47', NULL),
(97, 'Executive Assistant I', '2020-11-19 07:51:11', NULL),
(98, 'Eco. Dev. Specialist II', '2021-01-14 06:14:16', NULL),
(99, 'Sr. Eco. Development Specialist', '2021-01-18 06:22:37', NULL),
(100, 'Eco. Dev. Specialist I', '2021-01-26 00:45:50', NULL),
(101, 'Sr. Eco. Dev. Specialist', '2021-01-26 01:13:27', NULL),
(102, 'Department Secretary', '2021-03-05 02:54:43', NULL),
(103, 'Department Undersecretary', '2021-03-05 02:55:45', NULL),
(104, 'Department Assistant Secretary', '2021-03-05 02:56:33', '2021-07-20 18:22:16'),
(105, 'Computer Operator II', '2021-03-16 03:59:23', NULL),
(106, 'HR-Payroll', '2021-03-30 04:02:31', NULL),
(107, 'Administrative Staff', '2021-04-07 04:23:23', '2021-04-06 20:24:10'),
(108, 'Executive Director III', '2021-05-14 02:02:24', NULL),
(109, 'Driver', '2021-08-03 06:33:48', NULL),
(110, 'Job Order', '2021-08-03 06:47:10', '2021-11-10 00:57:09'),
(111, 'Human Res. Mgnt. Off. II', '2021-11-09 06:40:45', NULL),
(112, 'Human Res. Mgnt. Off. III', '2021-11-09 07:29:01', NULL),
(113, 'Utility Worker II', '2021-11-12 01:18:51', NULL),
(114, 'Driver I', '2021-11-12 02:19:15', NULL),
(115, 'Carpenter II', '2021-11-16 03:08:19', NULL),
(116, 'Accounting Clerk III', '2021-11-16 03:41:54', NULL),
(117, 'Clerk II', '2021-11-17 01:24:22', NULL),
(118, 'Budgeting Assistant', '2021-11-17 01:28:21', NULL),
(119, 'Budget Officer III', '2021-11-17 01:34:46', NULL),
(120, 'Clerk III', '2021-11-17 03:18:12', NULL),
(121, 'Supply Officer II', '2021-11-18 02:30:20', NULL),
(122, 'Accounting Clerk II', '2021-11-18 06:00:37', NULL),
(123, 'Sr. Bookkeeper', '2021-11-18 06:03:26', NULL),
(124, 'Cashier I', '2021-11-18 07:29:03', NULL),
(125, 'Mechanic II', '2021-11-18 09:47:09', NULL),
(126, 'Mechanic III', '2021-11-18 09:48:20', NULL),
(127, 'Storekeeper II', '2021-11-19 02:43:33', '2021-12-26 17:25:27'),
(128, 'Comm. Eq. Oper. III', '2021-11-22 05:26:27', NULL),
(129, 'Records Officer I', '2021-11-22 05:40:30', NULL),
(130, 'Comm. Eq. Oper . III', '2021-11-22 07:00:28', NULL),
(131, 'Electrician I', '2021-11-23 00:55:11', NULL),
(132, 'Electrician II', '2021-11-23 00:55:30', NULL),
(133, 'Aircon Technician I', '2021-11-23 02:39:46', NULL),
(134, 'Plumber II', '2021-11-23 05:15:59', NULL),
(135, 'Secretary II', '2021-12-01 02:36:59', NULL),
(136, 'Artist Illustrator II', '2021-12-20 07:00:53', NULL),
(137, 'Legal Assistant II', '2021-12-23 06:20:06', '2021-12-22 22:23:09'),
(138, 'Supply Officer I', '2021-12-27 01:19:17', NULL),
(141, 'Project Manager II', '2022-02-15 08:15:32', NULL),
(142, 'Photographer  II', '2022-04-07 07:27:34', NULL),
(143, 'Utilityman', '2022-04-08 01:24:56', NULL),
(144, 'Budgeting Aide', '2022-04-10 23:12:15', NULL),
(145, 'Budget Officer I', '2022-04-11 05:14:12', '2022-04-10 21:14:50'),
(146, 'Budget Officer II', '2022-04-11 05:22:18', NULL),
(147, 'Eco. Dev. Specialist', '2022-04-21 01:02:54', NULL),
(148, 'Rep. Mach. Oper. II', '2022-04-26 02:18:58', NULL);

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
(111, 40, 3, 1, 6, 'asdasdasd', '2022-06-26 02:01:58', '2022-06-26 02:01:58'),
(112, 41, 38, 3, 1, NULL, '2022-06-28 12:57:00', '2022-06-28 12:57:00'),
(113, 42, 38, 3, 1, NULL, '2022-06-28 23:58:26', '2022-06-28 23:58:26'),
(114, 43, 38, 3, 1, NULL, '2022-06-29 00:01:45', '2022-06-29 00:01:45'),
(115, 42, 3, 1, 6, 'Duplicate request', '2022-06-29 00:03:01', '2022-06-29 00:03:01'),
(116, 37, 5, 3, 5, 'Rating: 5; Comments: ', '2022-06-30 04:33:53', '2022-06-30 04:33:53'),
(117, 36, 5, 3, 5, 'Rating: 5; Comments: Testing', '2022-06-30 09:04:31', '2022-06-30 09:04:31'),
(118, 44, 41, 3, 1, NULL, '2022-06-30 23:51:43', '2022-06-30 23:51:43'),
(119, 44, 40, 1, 4, 'aaa', '2022-06-30 23:52:51', '2022-06-30 23:52:51'),
(120, 44, 40, 1, 1, NULL, '2022-07-01 00:18:43', '2022-07-01 00:18:43'),
(121, 44, 43, 4, 2, 'Shaina Manalo (Technician)', '2022-07-01 00:22:32', '2022-07-01 00:22:32'),
(122, 44, 42, 2, 4, '12121', '2022-07-01 00:24:06', '2022-07-01 00:24:06'),
(123, 44, 41, 3, 7, 'di marunong mag ayos , paayos ulit', '2022-07-01 00:25:31', '2022-07-01 00:25:31'),
(124, 44, 42, 2, 4, 'okay', '2022-07-01 00:27:16', '2022-07-01 00:27:16'),
(125, 44, 41, 3, 5, 'Rating: 1; Comments: di marunong mag ayos', '2022-07-01 00:28:45', '2022-07-01 00:28:45'),
(126, 44, 41, 3, 5, 'Rating: 1; Comments: di marunong mag ayos', '2022-07-01 00:28:49', '2022-07-01 00:28:49'),
(127, 45, 41, 3, 1, NULL, '2022-07-01 00:42:49', '2022-07-01 00:42:49'),
(128, 45, 43, 4, 2, 'Shaina Manalo (Technician)', '2022-07-01 00:45:12', '2022-07-01 00:45:12'),
(129, 45, 39, 1, 4, 'aaa', '2022-07-01 00:58:59', '2022-07-01 00:58:59'),
(130, 45, 41, 3, 5, 'Rating: 5; Comments: ', '2022-07-01 01:00:39', '2022-07-01 01:00:39'),
(131, 47, 41, 3, 1, NULL, '2022-07-01 01:21:15', '2022-07-01 01:21:15'),
(132, 46, 41, 3, 1, NULL, '2022-07-01 01:21:20', '2022-07-01 01:21:20'),
(133, 47, 43, 4, 2, 'Jester Marinas (Technician)', '2022-07-01 01:21:54', '2022-07-01 01:21:54'),
(134, 47, 42, 2, 4, '000', '2022-07-01 01:22:34', '2022-07-01 01:22:34'),
(135, 48, 41, 3, 1, NULL, '2022-07-01 05:17:10', '2022-07-01 05:17:10'),
(136, 49, 41, 3, 1, NULL, '2022-07-01 05:18:16', '2022-07-01 05:18:16'),
(137, 46, 43, 4, 4, 'asd', '2022-07-01 05:18:50', '2022-07-01 05:18:50'),
(138, 48, 43, 4, 4, 'asdasd', '2022-07-01 05:19:26', '2022-07-01 05:19:26'),
(139, 49, 40, 1, 3, 'Jester Marinas (Technician)', '2022-07-01 06:08:51', '2022-07-01 06:08:51'),
(140, 49, 40, 1, 1, NULL, '2022-07-01 06:09:16', '2022-07-01 06:09:16');

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
(3, 'End User', 'This is the member role', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
(4, 'HOOD', 'This is the helpdesk officer of the day', '2022-04-26 14:00:00', '2022-04-26 14:00:00');

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
(4, 'Resolved', '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
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
(2, 29, 2),
(4, 42, 4);

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
(3, NULL, 'Rolando G. Jarabata', 'rgjarabata1@neda.gov.ph', '2022-04-17 16:40:32', 31, '1234', 16, '$2y$10$7cCQoCYnZG9G62muKhp0ROhqv8RcBg.2hIsEwSDS7LmhAFp1N65M6', 'profile/omu2YdlTAzhgi3FvVcbKWTX5NUgYW3oIDvTIXSaM.jpg', 1, 1, NULL, '2022-04-17 16:40:04', '2022-07-04 01:53:03'),
(4, NULL, 'rolandojarabata11-Tech', 'rolandojarabata11@gmail.com', '2022-04-17 16:40:32', 30, '4321', 16, '$2y$10$nziGw1soLU02RjWCNVG1a.jUeTDb/50laGuGFQoodQ3wxacgU0xR2', NULL, 2, 1, NULL, '2022-04-17 16:40:04', '2022-06-29 05:07:54'),
(5, 668, 'rgjarabata-Owner', 'rgjarabata0@neda.gov.ph', '2022-04-17 16:40:32', 31, NULL, 18, '$2y$10$QDtiE1738uukmK4xLmrDaO02wyOnCfQsWJeHrmzAohTOAECD.3vxq', NULL, 3, 1, 'rJAHkpB4EAkrMeW67bgesDlqEgyNkZfUSN2qO61jPDlvgyGQYicD4lL5y3GQ', '2022-04-17 16:40:04', '2022-06-25 17:13:13'),
(6, NULL, 'Lorem T. Ipsum', 'marjoriedubria131@gmail.com', '2022-04-17 16:40:32', 2, NULL, 104, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 3, 1, NULL, '2022-04-17 16:40:04', '2022-04-26 05:58:46'),
(14, NULL, 'HOD - Helpdesk of the day', 'rolandojarabata13@yahoo.com', '2022-04-26 06:41:14', 2, NULL, 2, '$2y$10$k6TtdwKbeBcduTdvdKqkbOF0QwxO26oa.cp79w.DnwAYGGdK1U0Zq', NULL, 4, 1, NULL, '2022-04-26 06:14:16', '2022-04-26 06:41:50'),
(19, NULL, 'Gipong Jarabata', 'rolandojarabata113@gmail.com', '2022-05-04 00:51:51', 2, NULL, 43, '$2y$10$bMulog4gaAn2tHugoVtogOeG0yHWQlbyM7AkhNmzd6/OPIfNBUp9S', NULL, 3, 1, NULL, '2022-05-04 00:48:56', '2022-05-04 00:52:48'),
(28, NULL, 'Test User', 'testuser@gmail.com', '2022-05-12 00:41:30', 2, NULL, 19, '$2y$10$dXfUHC0bu0GKLCp39i5eP.jTaTK9h/ayMRJCdcww7cVlsYhHZT6Me', NULL, 3, 1, NULL, '2022-05-12 00:41:30', '2022-05-12 00:41:30'),
(29, NULL, 'rolandojarabata12-Tech', 'rolandojarabata12@gmail.com', '2022-04-17 16:40:32', 30, NULL, 4, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 2, 1, NULL, '2022-04-17 16:40:04', '2022-05-18 17:19:09'),
(36, NULL, 'asd', 'rolandojarabata111@gmail.com', '2022-05-17 00:02:36', 2, NULL, 16, '$2y$10$2.wdA59w1NHXTgwK.YdQ6.Lig02IgxovxMnFjtoAdLxsdF4f0yKp2', 'profile/uELNUQtYOmczpbscTGUe2Af2EHOopPoBsNOgedBZ.jpg', 4, 1, NULL, '2022-05-17 00:02:36', '2022-05-17 00:02:46'),
(37, NULL, 'Secret - Technician', 'unknown@gmail.com', '2022-06-27 08:53:39', 30, '0987', 61, '$2y$10$CbrFZJaZJkOTbUuSWgCKd.7pL71LbjZq3HiBibAhK1sH/pc2CnSXC', NULL, 2, 1, NULL, '2022-06-27 08:53:39', '2022-07-01 05:23:00'),
(38, NULL, 'Rolando G. Jarabata', 'rgjarabata@neda.gov.ph', '2022-06-28 12:55:36', 31, NULL, 43, '$2y$10$.8VjSpMxQT02F1h3E5GAHuBHBai4IG5FORvE./wdjMhdsmuGpulKW', NULL, 3, 1, 'ra5lS1uPUmkAJ1vIHUvyvE5MxXthfFgY6ln2Zo8q0pyGlOnZiMay8iirGKQR', '2022-06-28 12:55:36', '2022-06-28 12:55:57'),
(39, NULL, 'Shaina Dacome', 'shainadacome@gmail.com', '2022-06-30 14:42:52', 31, NULL, 87, '$2y$10$f2crH57Ghld0nmwm14tVW.vcWuzEI2HCEU5ZBQ690UOTyNgTzj0MW', 'profile/0xmhDFcUaI9iLCKfYDn5uJVGen4DrWR0h7Vi4rO8.jpg', 1, 1, NULL, '2022-06-30 14:42:52', '2022-07-01 00:55:20'),
(40, NULL, 'Henry Villalobos Jr.', 'henry.villalobosjr012@gmail.com', '2022-06-30 14:43:38', 30, NULL, 87, '$2y$10$Um2cLQvFIWidj0NGWETxCu3c.E2d2arNdImS7sdVrW6T7879.o6IW', NULL, 1, 1, NULL, '2022-06-30 14:43:38', '2022-06-30 23:42:40'),
(41, NULL, 'Henry V(End User)', 'ptc.henryvillalobos@gmail.com', '2022-06-30 23:48:40', 28, NULL, 87, '$2y$10$mNLs0FHBCuQ88owV8yF1POsgacetf3uflOMn64oanY.Zdhb5rHVKO', NULL, 3, 1, NULL, '2022-06-30 23:48:40', '2022-06-30 23:48:40'),
(42, NULL, 'Jester Marinas (Technician)', 'ptc.shainadacome@gmail.com', '2022-06-30 23:52:16', 28, '0222', 20, '$2y$10$T0tPYSR5.lG2dLEcJQe1p.D52udU3gqSIi3I26nkH6.nG59mOKOkW', 'profile/D8S6kZMtEKzCnAawJdKw0jKQTzcXJr6j29teje85.jpg', 2, 1, NULL, '2022-06-30 23:52:16', '2022-07-01 00:55:53'),
(43, NULL, 'Maria Jheelyne Perey(HOOD)', 'ghamers002@gmail.com', '2022-06-30 23:54:19', 28, '33333', 42, '$2y$10$niXrsr.tJGe7CdNh4Y/uKuRes/cZi1MOWKXa7rak0m4dBdrr88i4G', NULL, 4, 1, NULL, '2022-06-30 23:54:19', '2022-07-01 05:21:03');

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
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `position_name_unique` (`name`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `projectlogs`
--
ALTER TABLE `projectlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
