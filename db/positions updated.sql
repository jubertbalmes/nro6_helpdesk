-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 10:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
(1, 'Accountant I', '2022-04-17 16:40:04', '2022-04-24 22:56:04'),
(2, 'Accountant II', '2022-04-24 22:42:58', '2022-04-24 22:42:58'),
(4, 'Accountant III', '2022-04-24 23:02:23', '2022-04-24 23:02:23'),
(5, 'Account Officer', '2022-04-29 01:37:45', '2022-04-29 01:37:45'),
(6, 'Accountant IV', '2022-04-29 01:40:48', '2022-04-29 01:40:48'),
(7, 'Administrative Aide I', '2022-04-29 01:41:00', '2022-04-29 01:41:00'),
(8, 'Administrative Aide II', '2022-04-29 01:41:09', '2022-04-29 01:41:09'),
(9, 'Administrative Aide III', '2022-04-29 01:41:19', '2022-04-29 01:41:19'),
(10, 'Administrative Aide IV', '2022-04-29 01:41:29', '2022-04-29 01:41:29'),
(11, 'Administrative Aide V', '2022-04-29 01:41:42', '2022-04-29 01:41:42'),
(12, 'Administrative Aide VI', '2022-04-29 01:41:46', '2022-04-29 01:41:46'),
(13, 'Administrative Assistant', '2022-04-29 01:41:58', '2022-04-29 01:41:58'),
(14, 'Administrative Assistant I', '2022-04-29 01:42:16', '2022-04-29 01:42:16'),
(15, 'Administrative Assistant II', '2022-04-29 01:42:29', '2022-04-29 01:42:29'),
(16, 'Administrative Assistant III', '2022-04-29 01:42:34', '2022-04-29 01:42:34'),
(17, 'Administrative Assistant IV', '2022-04-29 01:42:38', '2022-04-29 01:42:38'),
(18, 'Administrative Assistant V', '2022-04-29 01:42:46', '2022-04-29 01:42:46'),
(19, 'Administrative Assistant VI', '2022-04-29 01:42:50', '2022-04-29 01:42:50'),
(20, 'Administrative Officer I', '2022-04-29 01:43:31', '2022-04-29 01:43:31'),
(21, 'Administrative Officer II', '2022-04-29 01:43:35', '2022-04-29 01:43:35'),
(22, 'Administrative Officer III', '2022-04-29 01:43:39', '2022-04-29 01:43:39'),
(23, 'Administrative Officer IV', '2022-04-29 01:44:00', '2022-04-29 01:44:00'),
(24, 'Administrative Officer V', '2022-04-29 01:44:07', '2022-04-29 01:44:07'),
(25, 'Assistant Secretary', '2022-04-29 01:44:18', '2022-04-29 01:44:18'),
(26, 'Attorney I', '2022-04-29 01:44:38', '2022-04-29 01:44:38'),
(27, 'Attorney II', '2022-04-29 01:44:43', '2022-04-29 01:44:43'),
(28, 'Attorney III', '2022-04-29 01:44:47', '2022-04-29 01:44:47'),
(29, 'Attorney IV', '2022-04-29 01:45:23', '2022-04-29 01:45:23'),
(30, 'Attorney V', '2022-04-29 01:45:27', '2022-04-29 01:45:27'),
(31, 'Attorney VI', '2022-04-29 01:45:32', '2022-04-29 01:45:32'),
(32, 'Chief Economic Development Specialist', '2022-04-29 01:46:01', '2022-04-29 01:46:01'),
(33, 'Computer Maintenance Technologist I', '2022-04-29 01:47:54', '2022-04-29 01:47:54'),
(34, 'Computer Maintenance Technologist II', '2022-04-29 01:47:58', '2022-04-29 01:47:58'),
(35, 'Computer Maintenance Technologist III', '2022-04-29 01:48:03', '2022-04-29 01:48:03'),
(36, 'Computer Operator I', '2022-04-29 01:48:17', '2022-04-29 01:48:17'),
(37, 'Computer Operator II', '2022-04-29 01:48:22', '2022-04-29 01:48:22'),
(38, 'Computer Operator III', '2022-04-29 01:48:25', '2022-04-29 01:48:25'),
(39, 'Computer Operator IV', '2022-04-29 01:48:30', '2022-04-29 01:48:30'),
(41, 'Computer Programmer I', '2022-04-29 02:15:34', '2022-04-29 02:15:34'),
(42, 'Computer Programmer II', '2022-04-29 02:15:37', '2022-04-29 02:15:37'),
(43, 'Computer Programmer III', '2022-04-29 02:15:40', '2022-04-29 02:15:40'),
(44, 'Director III', '2022-04-29 02:15:48', '2022-04-29 02:15:48'),
(45, 'Director IV', '2022-04-29 02:16:02', '2022-04-29 02:16:02'),
(46, 'Division Chief', '2022-04-29 02:16:09', '2022-04-29 02:16:09'),
(47, 'Draftsman III', '2022-04-29 02:16:21', '2022-04-29 02:16:21'),
(48, 'Economic Development Specialist I', '2022-04-29 02:16:58', '2022-04-29 02:16:58'),
(49, 'Economic Development Specialist II', '2022-04-29 02:17:03', '2022-04-29 02:17:03'),
(50, 'Economic Development Specialist III', '2022-04-29 02:17:07', '2022-04-29 02:17:07'),
(51, 'Executive Assistant I', '2022-04-29 02:17:23', '2022-04-29 02:17:23'),
(52, 'Executive Assistant III', '2022-04-29 02:17:28', '2022-04-29 02:17:28'),
(53, 'Executive Assistant II', '2022-04-29 02:18:56', '2022-04-29 02:18:56'),
(54, 'Executive Assistant IV', '2022-04-29 02:19:12', '2022-04-29 02:19:12'),
(55, 'Executive Assistant V', '2022-04-29 02:19:17', '2022-04-29 02:19:17'),
(56, 'Executive Assistant VI', '2022-04-29 02:19:21', '2022-04-29 02:19:21'),
(57, 'Information Officer I', '2022-04-29 02:21:05', '2022-04-29 02:21:05'),
(58, 'Information Officer II', '2022-04-29 02:21:08', '2022-04-29 02:21:08'),
(59, 'Information Officer III', '2022-04-29 02:21:13', '2022-04-29 02:21:13'),
(60, 'Information Officer IV', '2022-04-29 02:21:18', '2022-04-29 02:21:18'),
(61, 'Information Officer V', '2022-04-29 02:21:24', '2022-04-29 02:21:24'),
(62, 'Information Systems Analyst I', '2022-04-29 02:21:49', '2022-04-29 02:21:49'),
(63, 'Information Systems Analyst II', '2022-04-29 02:21:54', '2022-04-29 02:21:54'),
(64, 'Information Systems Analyst III', '2022-04-29 02:22:03', '2022-04-29 02:22:03'),
(65, 'Information Systems Researcher I', '2022-04-29 02:22:33', '2022-04-29 02:22:33'),
(66, 'Information Systems Researcher II', '2022-04-29 02:22:36', '2022-04-29 02:22:36'),
(67, 'Information Systems Researcher III', '2022-04-29 02:22:39', '2022-04-29 02:22:39'),
(68, 'Information Technology Officer I', '2022-04-29 02:23:03', '2022-04-29 02:23:03'),
(69, 'Information Technology Officer II', '2022-04-29 02:23:07', '2022-04-29 02:23:07'),
(70, 'Information Technology Officer III', '2022-04-29 02:23:10', '2022-04-29 02:23:10'),
(71, 'Internal Auditing Assistant', '2022-04-29 02:23:28', '2022-04-29 02:23:28'),
(72, 'Internal Auditor I', '2022-04-29 02:23:50', '2022-04-29 02:23:50'),
(73, 'Internal Auditor II', '2022-04-29 02:23:55', '2022-04-29 02:23:55'),
(74, 'Internal Auditor III', '2022-04-29 02:23:58', '2022-04-29 02:23:58'),
(75, 'Internal Auditor IV', '2022-04-29 02:24:03', '2022-04-29 02:24:03'),
(76, 'Internal Auditor V', '2022-04-29 02:24:09', '2022-04-29 02:24:09'),
(77, 'Job Order / COS', '2022-04-29 02:24:53', '2022-04-29 02:24:53'),
(78, 'Legal Assistant I', '2022-04-29 02:25:10', '2022-04-29 02:25:10'),
(79, 'Legal Assistant II', '2022-04-29 02:25:14', '2022-04-29 02:25:14'),
(80, 'Legal Assistant III', '2022-04-29 02:25:18', '2022-04-29 02:25:18'),
(81, 'Legal Assistant IV', '2022-04-29 02:25:24', '2022-04-29 02:25:24'),
(82, 'Research Associate', '2022-04-29 02:25:39', '2022-04-29 02:25:39'),
(83, 'Senior Economic Development Specialist', '2022-04-29 02:25:53', '2022-04-29 02:25:53'),
(84, 'Senior Research Associate', '2022-04-29 02:26:15', '2022-04-29 02:26:15'),
(85, 'Supervising Economic Development Specialist', '2022-04-29 02:26:42', '2022-04-29 02:26:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
