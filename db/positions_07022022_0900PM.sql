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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `position_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
