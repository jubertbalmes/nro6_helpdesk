-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2022 at 02:59 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

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
(1, 'WIFI issue', 'WIFI issue', 3, NULL, '2022-04-18 00:40:04', '2022-06-28 13:14:44'),
(2, 'No internet connection', 'No internet connection', 1, NULL, '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(3, 'Unable to receive email', 'Unable to receive email', 1, NULL, '2022-04-18 00:40:04', '2022-04-18 00:40:04'),
(4, 'Setup/Configure new laptop/desktop', 'Setup/Configure new laptop/desktop', 1, NULL, '2022-05-19 01:33:19', '2022-05-19 01:33:19'),
(5, 'Document related ', 'Document related ', 1, 'This is a troubleshooting steps', '2022-06-26 08:09:29', '2022-06-28 14:49:07'),
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
