-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 02:08 AM
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
(11, 5, 'avatar.jpg', '09nrz0DUW7q2S5FGhEKB0yloF6sGCw8ZW3jlGWUk.jpg', '2022-04-19 14:47:35', '2022-04-19 14:47:35'),
(13, 8, 'card-1.jpeg', 'Wy6aZfahzYtW4Bl24RRXKe0yB3WSIjkHOcpBs36C.jpg', '2022-05-10 08:20:12', '2022-05-10 08:20:12');

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
(3, 'Unable to receive email', 'Unable to receive email', '2022-04-18 00:40:04', '2022-04-18 00:40:04');

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
(8, 3, 1, '09089212196', '2022-05-10 07:36:08', '2022-05-10 07:36:08'),
(9, 3, 2, '0101213', '2022-05-10 07:36:08', '2022-05-10 07:36:08'),
(10, 3, 4, 'dummy113@gmail.com', '2022-05-10 07:36:08', '2022-05-10 07:36:08');

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
(4, 5, 3, 1, 'asdfsdf', 'dsfsdf', 5, 4, NULL, 'Restart laptop', NULL, NULL, NULL, 1, 'Mabagal', NULL, '2022-04-18 05:35:03', '2022-05-05 01:05:35'),
(5, 5, 3, 1, 'sdds', 'sdfsdf', 5, 4, NULL, 'Nag restart lang ako', 4, 'fine!', NULL, 1, 'Inabot ng dalawag segundo', NULL, '2022-04-18 05:57:19', '2022-05-10 07:53:43'),
(6, 6, 1, 1, 'sdfd', 'dsfsdf', 4, 4, NULL, 'Easy peasy restart PC', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-18 05:58:55', '2022-04-28 15:31:53'),
(7, 3, 1, 1, 'dfsdf', 'sdfsdf', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-19 12:15:10', '2022-04-19 12:15:10'),
(8, 5, 2, 2, '1', '1', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-10 08:20:12', '2022-05-10 08:22:27');

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
(2, 'Creator', 'This is the creator role', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
(3, 'Member', 'This is the member role', '2021-09-28 08:33:14', '2021-09-28 08:33:14'),
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
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
(3, NULL, 'Rolando G. Jarabata', 'rgjarabata@neda.gov.ph', '2022-04-18 00:40:32', '2ICTS-ISDD', 1, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', 'profile/Y3D9V0jAljI8LegkBpTBiPXUQ0Je0Mxikor6VA46.png', 1, 1, NULL, '2022-04-18 00:40:04', '2022-05-10 07:38:46'),
(4, NULL, 'John T. Doe', 'rolandojarabata12@gmail.com', '2022-04-18 00:40:32', '2', 2, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 2, 1, NULL, '2022-04-18 00:40:04', '2022-04-28 15:04:42'),
(5, 668, 'Juan T. Dela Cruz', 'rolandojarabata11@gmail.com', '2022-04-18 00:40:32', '3', 4, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 3, 2, NULL, '2022-04-18 00:40:04', '2022-04-25 13:40:43'),
(6, NULL, 'Lorem T. Ipsum', 'rolandojarabata112@gmail.com', '2022-04-18 00:40:32', '4', 1, '$2y$10$0mxOul7PaSNBjigtfhW24.chVaitTv/tTTVLRoh.zmMrnXHHGotZ6', NULL, 3, 1, NULL, '2022-04-18 00:40:04', '2022-04-26 13:58:46'),
(14, NULL, 'HOD - Helpdesk of the day', 'rolandojarabata13@yahoo.com', '2022-04-26 14:41:14', '1', 2, '$2y$10$k6TtdwKbeBcduTdvdKqkbOF0QwxO26oa.cp79w.DnwAYGGdK1U0Zq', NULL, 4, 1, NULL, '2022-04-26 14:14:16', '2022-04-26 14:41:50'),
(19, NULL, 'Gipong Jarabata', 'rolandojarabata113@gmail.com', '2022-05-04 08:51:51', '2ICTS-ISDD', 43, '$2y$10$bMulog4gaAn2tHugoVtogOeG0yHWQlbyM7AkhNmzd6/OPIfNBUp9S', NULL, 3, 1, NULL, '2022-05-04 08:48:56', '2022-05-04 08:52:48');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
