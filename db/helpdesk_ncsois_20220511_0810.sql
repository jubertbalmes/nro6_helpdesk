-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 02:03 AM
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
-- Database: `helpdesk_ncsois`
--

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees`
--

CREATE TABLE `hr_employees` (
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `biometric_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assumption_date` date DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_employees`
--

INSERT INTO `hr_employees` (`employee_id`, `user_id`, `full_name`, `biometric_id`, `assumption_date`, `created_date`, `modified_date`) VALUES
(668, 720, 'JARABATA ROLANDO', '912169', '2021-02-14', '2022-04-29 06:24:40', '2022-04-29 06:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `hr_emp_contacts`
--

CREATE TABLE `hr_emp_contacts` (
  `employee_id` int(11) NOT NULL,
  `contact_type_id` int(10) UNSIGNED NOT NULL,
  `contact_value` text DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_emp_contacts`
--

INSERT INTO `hr_emp_contacts` (`employee_id`, `contact_type_id`, `contact_value`, `modified_date`) VALUES
(668, 1, '639999999999', NULL),
(668, 2, '', NULL),
(668, 3, 'RGJarabata@neda.gov.ph', NULL),
(668, 4, 'dummyemail@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hr_emp_personal_info`
--

CREATE TABLE `hr_emp_personal_info` (
  `employee_id` int(11) NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maiden_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `sex_code` enum('M','F') NOT NULL DEFAULT 'M',
  `agency_employee_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `hr_emp_personal_info`
--

INSERT INTO `hr_emp_personal_info` (`employee_id`, `last_name`, `first_name`, `middle_name`, `ext_name`, `maiden_name`, `birth_date`, `sex_code`, `agency_employee_no`, `created_date`, `modified_date`) VALUES
(668, 'JARABATA', 'ROLANDO', 'BERNAL', '', NULL, '1995-04-11', 'M', '921286', '2022-04-29 06:59:27', '2022-04-29 06:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `hr_emp_work_experiences`
--

CREATE TABLE `hr_emp_work_experiences` (
  `emp_work_exp_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employ_type_flag` enum('PR','OG','AP','WP','JO') NOT NULL DEFAULT 'AP',
  `company` text DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `position_id` int(11) UNSIGNED DEFAULT NULL,
  `org_code` varchar(25) DEFAULT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `position` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_emp_work_experiences`
--

INSERT INTO `hr_emp_work_experiences` (`emp_work_exp_id`, `employee_id`, `employ_type_flag`, `company`, `agency_id`, `position_id`, `org_code`, `org_name`, `position`, `start_date`, `end_date`, `created_date`, `modified_date`) VALUES
(11738, 668, 'AP', 'National Economic and Development Authority', NULL, 43, '3ICTS-ISDD', 'Information Systems Development Division', 'Computer Programmer II', '2021-01-15', '2021-01-15', '2021-03-25 06:49:47', NULL),
(11739, 668, 'AP', 'National Economic and Development Authority', NULL, 43, '3ICTS-ISDD', 'Information Systems Development Division', 'Computer Programmer II', '2021-01-16', '2021-12-31', '2021-03-25 07:02:59', NULL),
(11740, 668, 'PR', 'Accenture', NULL, NULL, NULL, 'SAP-ABAP', 'Computer Programmer II', '2014-01-23', '2016-12-02', '2021-03-25 07:06:15', NULL),
(11741, 668, 'PR', 'Banco De Oro', NULL, NULL, NULL, 'Information Security Division', 'Data Analyst III', '2017-01-01', '2020-11-29', '2021-03-25 07:09:40', NULL),
(15936, 668, 'AP', 'National Economic and Development Authority', NULL, 43, '3ICTS-ISDD', 'Information Systems Development Division', 'Computer Programmer II', '2022-01-01', NULL, '2022-03-23 01:40:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hr_positions`
--

CREATE TABLE `hr_positions` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_positions`
--

INSERT INTO `hr_positions` (`position_id`, `position_name`, `created_date`, `modified_date`) VALUES
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
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `org_code` varchar(25) NOT NULL,
  `location_code` varchar(50) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `name` text NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`org_code`, `location_code`, `short_name`, `name`, `phone`, `created_date`, `modified_date`) VALUES
('2ANRES', NULL, 'ANRES', 'Agriculture, Natural Resources and Environment Staff', NULL, '2021-03-15 04:17:20', NULL),
('2ANRES-ACD', NULL, 'ANRES-ACD', 'Agricultural Commodities Division', NULL, '2021-03-16 02:36:51', NULL),
('2ANRES-ED', NULL, 'ANRES-ED', 'Environment Division', NULL, '2021-03-16 02:37:43', NULL),
('2ANRES-NRD', NULL, 'ANRES-NRD', 'Natural Resources Division', NULL, '2021-03-16 02:38:12', NULL),
('2ANRES-OD', NULL, 'ANRES-OD', 'Office of the Director', NULL, '2021-03-16 02:36:23', NULL),
('2ANRES-RISSD', NULL, 'ANRES-RISSD', 'Rural Institutions and Support Services Division', NULL, '2021-03-16 02:38:56', NULL),
('2AS', NULL, 'AS', 'Administrative Staff', NULL, '2021-03-15 04:12:29', NULL),
('2AS-AMD', NULL, 'AS-AMD', 'Asset Management Division', NULL, '2021-03-16 02:02:42', NULL),
('2AS-GSD', NULL, 'AS-GSD', 'General Services Division', NULL, '2021-03-16 02:03:23', NULL),
('2AS-HRDD', NULL, 'AS-HRDD', 'Human Resource Development Division', NULL, '2021-03-16 02:04:51', NULL),
('2AS-HRMD', NULL, 'AS-HRMD', 'Human Resource Management Division', NULL, '2021-03-16 02:06:08', NULL),
('2AS-OD', NULL, 'AS-OD', 'Office of the Director', NULL, '2021-03-16 02:01:46', NULL),
('2AS-PMD', NULL, 'AS-PMD', 'Procurement Management Division', NULL, '2021-03-16 02:07:12', NULL),
('2CSO', NULL, 'CSO', 'Central Support Office', NULL, '2021-03-15 02:56:32', NULL),
('2DIS', NULL, 'DIS', 'Development Information Staff', NULL, '2021-03-15 04:09:53', NULL),
('2DIS-DRD', NULL, 'DIS-DRD', 'Development Research Division', NULL, '2021-06-02 22:33:52', NULL),
('2DIS-KMD', NULL, 'DIS-KMD', 'Knowledge Management Division', NULL, '2021-03-16 01:50:16', NULL),
('2DIS-MDD', NULL, 'DIS-MDD', 'Multimedia Development Division', NULL, '2021-03-16 01:49:08', NULL),
('2DIS-OD', NULL, 'DIS-OD', 'Office of the Director', NULL, '2021-03-16 01:48:26', NULL),
('2DIS-PRD', NULL, 'DIS-PRD', 'Public Relations Division', NULL, '2021-03-16 01:49:41', NULL),
('2FPMS', NULL, 'FPMS', 'Financial, Planning and Management Staff', NULL, '2021-03-15 04:13:18', NULL),
('2FPMS-AD', NULL, 'FPMS-AD', 'Accounting Division', NULL, '2021-03-16 02:09:26', NULL),
('2FPMS-BD', NULL, 'FPMS-BD', 'Budget Division', NULL, '2021-03-16 02:10:21', NULL),
('2FPMS-CPMD', NULL, 'FPMS-CPMD', 'Corporate Planning and Monitoring Division', NULL, '2021-03-16 02:11:04', NULL),
('2FPMS-MD', NULL, 'FPMS-MD', 'Management Division', NULL, '2021-03-16 02:18:31', NULL),
('2FPMS-OD', NULL, 'FPMS-OD', 'Office of the Director', NULL, '2021-03-16 02:08:48', NULL),
('2GS', NULL, 'GS', 'Governance Staff', NULL, '2021-03-15 04:18:21', NULL),
('2GS-AGD', NULL, 'GS-AGD', 'Administrative Governance Division', NULL, '2021-03-16 02:40:11', NULL),
('2GS-DRD', NULL, 'GS-DRD', 'Development Research Division', NULL, '2021-05-26 16:49:03', NULL),
('2GS-OD', NULL, 'GS-OD', 'Office of the Director', NULL, '2021-03-16 02:39:40', NULL),
('2GS-PGD', NULL, 'GS-PGD', 'Political Governance Division', NULL, '2021-03-16 02:40:46', NULL),
('2IAS', NULL, 'IAS', 'Internal Audit Service', NULL, '2021-03-15 03:59:18', NULL),
('2IAS-MAD', NULL, 'IAS-MAD', 'Management Audit Division', NULL, '2021-03-15 04:49:52', NULL),
('2IAS-OAD', NULL, 'IAS-OAD', 'Operations Audit Division', NULL, '2021-03-15 04:58:09', NULL),
('2IAS-OD', NULL, 'IAS-OD', 'Office of the Director', NULL, '2021-03-15 04:48:57', NULL),
('2ICTS', NULL, 'ICTS', 'Information and Communications Technology Staff', NULL, '2021-03-15 04:14:12', NULL),
('2ICTS-IND', NULL, 'ICTS-IND', 'ICT Network Division', NULL, '2021-03-16 02:20:11', NULL),
('2ICTS-ISDD', NULL, 'ICTS-ISDD', 'Information Systems Development Division', NULL, '2021-03-16 02:20:59', NULL),
('2ICTS-OD', NULL, 'ICTS-OD', 'Office of the Director', NULL, '2021-03-16 02:19:31', NULL),
('2IPO', NULL, 'IPO', 'Investment Programming Office', NULL, '2021-03-15 03:36:18', NULL),
('2IS', NULL, 'IS', 'Infrastructure Staff', NULL, '2021-03-15 04:23:46', NULL),
('2IS-ICTD', NULL, 'IS-ICTD', 'ICT Division', NULL, '2021-03-16 04:35:18', NULL),
('2IS-OD', NULL, 'IS-OD', 'Office of the Director', NULL, '2021-03-16 04:33:32', NULL),
('2IS-PEED', NULL, 'IS-PEED', 'Power, Energy and Electrification Division', NULL, '2021-03-16 04:36:02', NULL),
('2IS-SOPID', NULL, 'IS-SOPID', 'Social and Other Public Infrastructure Division', NULL, '2021-03-16 04:36:35', NULL),
('2IS-TD', NULL, 'IS-TD', 'Transportation Division', NULL, '2021-03-16 04:38:04', NULL),
('2IS-VRAIRD', NULL, 'IS-VRAIRD', 'Value/Risk Analysis and Infrastructure Regulation Division', NULL, '2021-03-16 04:39:27', NULL),
('2IS-WRD', NULL, 'IS-WRD', 'Water Resources Division', NULL, '2021-03-16 04:40:42', NULL),
('2LLO', NULL, 'LLO', 'Legislative Liaison Office', NULL, '2021-03-15 03:56:13', NULL),
('2LLOasDIV', NULL, 'LLO', 'Legislative Liaison Office', NULL, '2021-03-15 04:48:18', NULL),
('2LS', NULL, 'LS', 'Legal Staff', NULL, '2021-03-15 04:14:54', NULL),
('2LS-ILD', NULL, 'LS-ILD', 'Investigation and Litigation Division', NULL, '2021-03-16 02:22:25', NULL),
('2LS-LCAD', NULL, 'LS-LCAD', 'Legal Counselling and Assistance Division', NULL, '2021-03-16 02:23:00', NULL),
('2LS-LRCD', NULL, 'LS-LRCD', 'Legal Research and Compliance Division', NULL, '2021-03-16 02:23:43', NULL),
('2LS-OD', NULL, 'LS-OD', 'Office of the Director', NULL, '2021-03-16 02:21:50', NULL),
('2MES', NULL, 'MES', 'Monitoring and Evaluation Staff', NULL, '2021-03-15 04:24:17', NULL),
('2MES-ESD', NULL, 'MES-ESD', 'Economic Sector Division', NULL, '2021-03-16 04:42:59', NULL),
('2MES-NTISD', NULL, 'MES-NTISD', 'Non-Transport Infrastructure Sector Division', NULL, '2021-03-16 04:43:46', NULL),
('2MES-OD', NULL, 'MES-OD', 'Office of the Director', NULL, '2021-03-16 04:41:54', '2021-04-22 12:55:51'),
('2MES-SDAD', NULL, 'MES-SDAD', 'Systems and Data Analysis Division', NULL, '2021-03-16 04:45:02', NULL),
('2MES-SSD', NULL, 'MES-SSD', 'Social Sector Division', NULL, '2021-03-16 04:44:25', NULL),
('2MES-TISD', NULL, 'MES-TISD', 'Transport Infrastructure Sector Division', NULL, '2021-03-16 04:46:05', NULL),
('2NPPS', NULL, 'NPPS', 'National Policy and Planning Staff', NULL, '2021-03-15 04:19:02', NULL),
('2NPPS-DRD', NULL, 'NPPS-DRD', 'Development Research Division', NULL, '2021-03-16 02:42:06', NULL),
('2NPPS-IED', NULL, 'NPPS-IED', 'International Economics Division', NULL, '2021-03-16 02:42:49', NULL),
('2NPPS-MD', NULL, 'NPPS-MD', 'Macroeconomic Division', NULL, '2021-03-16 02:43:20', NULL),
('2NPPS-OD', NULL, 'NPPS-OD', 'Office of the Director', NULL, '2021-03-16 02:41:34', NULL),
('2NPPS-PCD', NULL, 'NPPS-PCD', 'Policy Coordination Division', NULL, '2021-03-16 02:43:59', NULL),
('2NPPS-PFD', NULL, 'NPPS-PFD', 'Public Finance Division', NULL, '2021-03-16 02:44:37', NULL),
('2OADG-CSO', NULL, 'OADG-CSO', 'Office of the Assistant Director-General - Central Support Office', NULL, '2021-03-15 04:11:37', NULL),
('2OADG-CSOasDIV', NULL, 'OADG-CSO', 'Office of the Assistant Director-General - Central Support Office', NULL, '2021-03-16 02:01:03', NULL),
('2OADG-IDO', NULL, 'OADG-IDO', 'Office of the Assistant Director-General - Infrastructure Development Office', NULL, '2021-03-15 04:23:01', NULL),
('2OADG-IPO', NULL, 'OADG-IPO', 'Office of the Assistant Director-General - Investment Programming Office', NULL, '2021-03-15 04:22:11', NULL),
('2OADG-IPOasDIV', NULL, 'OADG-IPO', 'Office of the Assistant Director-General - Investment Programming Office', NULL, '2021-03-16 04:27:26', NULL),
('2OADG-PPO', NULL, 'OADG-PPO', 'Office of the Assistant Director-General - Policy and Planning Office', NULL, '2021-03-15 04:16:38', NULL),
('2OADG-PPOasDIV', NULL, 'OADG-PPO', 'Office of the Assistant Director-General - Policy and Planning Office', NULL, '2021-03-16 02:35:50', NULL),
('2OADG-RDO', NULL, 'OADG-RDO', 'Office of the Assistant Director-General - Regional Development Office', NULL, '2021-03-15 04:26:20', NULL),
('2OADG-RDOasDIV', NULL, 'OADG-RDO', 'Office of the Assistant Director-General - Regional Development Office', NULL, '2021-03-16 02:28:16', NULL),
('2ODDG-CSO', NULL, 'ODDG-CSO', 'Office of the Deputy Director-General - Central Support Office', NULL, '2021-03-15 04:10:52', NULL),
('2ODDG-CSOasDIV', NULL, 'ODDG-CSO', 'Office of the Deputy Director-General - Central Support Office', NULL, '2021-03-16 01:56:56', NULL),
('2ODDG-IPO', NULL, 'ODDG-IPO', 'Office of the Deputy Director-General- Investment Programming Office', NULL, '2021-03-15 04:21:34', NULL),
('2ODDG-IPOasDIV', NULL, 'ODDG-IPO', 'Office of the Deputy Director-General- Investment Programming Office', NULL, '2021-03-16 04:26:44', NULL),
('2ODDG-PPO', NULL, 'ODDG-PPO', 'Office of the Deputy Director-General - Policy and Planning Office', NULL, '2021-03-15 04:15:54', NULL),
('2ODDG-PPOasDIV', NULL, 'ODDG-PPO', 'Office of the Deputy Director-General - Policy and Planning Office', NULL, '2021-03-16 02:34:39', NULL),
('2ODDG-RDOasDIV', NULL, 'ODDG-RDO', 'Office of the Deputy Director-General - Regional Development Office', NULL, '2021-03-16 02:33:36', NULL),
('2ODG', NULL, 'ODG', 'Office of the Director-General', NULL, '2021-03-15 02:55:37', NULL),
('2ODGasDIV', NULL, 'ODG', 'Office of the Director-General', NULL, '2021-03-15 04:47:28', NULL),
('2ODGasSTAFF', NULL, 'ODG', 'Office of the Director-General', NULL, '2021-03-15 03:46:32', '2021-03-14 19:57:57'),
('2PIS', NULL, 'PIS', 'Public Investment Staff', NULL, '2021-03-15 04:24:49', NULL),
('2PIS-IPD', NULL, 'PIS-IPD', 'Investment Programming Division', NULL, '2021-03-16 02:46:47', NULL),
('2PIS-OD', NULL, 'PIS-OD', 'Office of the Director', NULL, '2021-03-16 02:45:37', NULL),
('2PIS-PFD-I', NULL, 'PIS-PFD-I', 'Program Financing I Division', NULL, '2021-03-16 02:47:44', NULL),
('2PIS-PFD-II', NULL, 'PIS-PFD-II', 'Program Financing II Division', NULL, '2021-03-16 02:48:46', NULL),
('2PIS-PFD-III', NULL, 'PIS-PFD-III', 'Program Financing III Division', NULL, '2021-03-16 02:49:42', NULL),
('2PPO', NULL, 'PPO', 'Policy and Planning Office', NULL, '2021-03-15 03:34:54', NULL),
('2RDO', NULL, 'RDO', 'Regional Development Office', NULL, '2021-03-15 03:39:01', NULL),
('2RDS', NULL, 'RDS', 'Regional Development Staff', NULL, '2021-03-15 04:27:12', NULL),
('2RDS-LUPPD', NULL, 'RDS-LUPPD', 'Land Use and Physical Planning Division', NULL, '2021-03-16 02:25:20', NULL),
('2RDS-OD', NULL, 'RDS-OD', 'Office of the Director', NULL, '2021-03-16 02:24:42', NULL),
('2RDS-RDAD', NULL, 'RDS-RDAD', 'Regional Development Assistance Division', NULL, '2021-03-16 02:26:50', NULL),
('2RDS-RDPD', NULL, 'RDS-RDPD', 'Regional Development Planning Division', NULL, '2021-03-16 02:27:35', NULL),
('2RDS-RLIDD', NULL, 'RDS-RLIDD', 'Regional and Local Institutional Development Division', NULL, '2021-03-16 02:25:55', NULL),
('2SDS', NULL, 'SDS', 'Social Development Staff', NULL, '2021-03-15 04:19:55', NULL),
('2SDS-ESDD', NULL, 'SDS-ESDD', 'Education and Skills Development Division', NULL, '2021-03-16 02:51:04', NULL),
('2SDS-HHSD', NULL, 'SDS-HHSD', 'Housing and Human Settlements Division', NULL, '2021-03-16 02:52:28', NULL),
('2SDS-HNPD', NULL, 'SDS-HNPD', 'Health, Nutrition and Population Division', NULL, '2021-03-16 02:51:53', NULL),
('2SDS-OD', NULL, 'SDS-OD', 'Office of the Director', NULL, '2021-03-16 02:50:31', NULL),
('2SDS-SPID', NULL, 'SDS-SPID', 'Social Protection and Integration Division', NULL, '2021-03-16 02:53:13', '2021-06-23 13:51:27'),
('2TSIS', NULL, 'TSIS', 'Trade, Services and Industry Staff', NULL, '2021-03-15 04:20:31', NULL),
('2TSIS-ID', NULL, 'TSIS-ID', 'Industry Division', NULL, '2021-03-16 04:14:19', NULL),
('2TSIS-OD', NULL, 'TSIS-OD', 'Office of the Director', NULL, '2021-03-16 04:13:48', NULL),
('2TSIS-SD', NULL, 'TSIS-SD', 'Services Division', NULL, '2021-03-16 04:14:50', NULL),
('2TSIS-TD', NULL, 'TSIS-TD', 'Trade Division', NULL, '2021-03-16 04:20:51', NULL),
('3ANRES', NULL, 'ANRES', 'Agriculture, Natural Resources and Environment Staff', NULL, '2021-03-03 23:48:25', NULL),
('3ANRES-ACD', NULL, 'ANRES-ACD', 'Agricultural Commodities Division', NULL, '2021-03-04 01:52:55', NULL),
('3ANRES-ED', NULL, 'ANRES-ED', 'Environment Division', NULL, '2021-03-04 01:55:28', NULL),
('3ANRES-NRD', NULL, 'ANRES-NRD', 'Natural Resources Division', NULL, '2021-03-04 01:57:01', NULL),
('3ANRES-OD', NULL, 'ANRES-OD', 'Office of the Director', NULL, '2021-03-04 01:49:44', NULL),
('3ANRES-RISSD', NULL, 'ANRES-RISSD', 'Rural Institutions and Support Services Division', NULL, '2021-03-04 01:59:34', NULL),
('3AS', NULL, 'AS', 'Administrative Staff', NULL, '2021-03-03 22:35:58', NULL),
('3AS-AMD', NULL, 'AS-AMD', 'Asset Management Division', NULL, '2021-03-04 00:19:05', NULL),
('3AS-GSD', NULL, 'AS-GSD', 'General Services Division', NULL, '2021-03-04 00:20:01', NULL),
('3AS-HRDD', NULL, 'AS-HRDD', 'Human Resource Development Division', NULL, '2021-03-04 00:21:57', NULL),
('3AS-HRMD', NULL, 'AS-HRMD', 'Human Resource Management Division', NULL, '2021-03-04 00:23:35', NULL),
('3AS-OD', NULL, 'AS-OD', 'Office of the Director', NULL, '2021-03-04 00:17:59', NULL),
('3AS-PMD', NULL, 'AS-PMD', 'Procurement Management Division', NULL, '2021-03-04 00:24:20', NULL),
('3CAG', NULL, 'CAG', 'Corporate Affairs Group', NULL, '2021-03-03 22:02:35', NULL),
('3DIS', NULL, 'DIS', 'Development Information Staff', NULL, '2021-03-03 22:28:05', NULL),
('3DIS-DRD', NULL, 'DIS-DRD', 'Development Research Division', NULL, '2021-06-02 22:32:48', NULL),
('3DIS-KMD', NULL, 'DIS-KMD', 'Knowledge Management Division', NULL, '2021-03-04 00:13:55', NULL),
('3DIS-MDD', NULL, 'DIS-MDD', 'Multimedia Development Division', NULL, '2021-03-04 00:11:04', NULL),
('3DIS-OD', NULL, 'DIS-OD', 'Office of the Director', NULL, '2021-03-04 00:10:02', NULL),
('3DIS-PRD', NULL, 'DIS-PRD', 'Public Relations Division', NULL, '2021-03-04 00:12:41', NULL),
('3FPMS', NULL, 'FPMS', 'Financial, Planning and Management Staff', NULL, '2021-03-03 22:37:01', NULL),
('3FPMS-AD', NULL, 'FPMS-AD', 'Accounting Division', NULL, '2021-03-04 00:26:11', NULL),
('3FPMS-BD', NULL, 'FPMS-BD', 'Budget Division', NULL, '2021-03-04 00:27:01', NULL),
('3FPMS-CPMD', NULL, 'FPMS-CPMD', 'Corporate Planning and Monitoring Division', NULL, '2021-03-04 00:27:49', NULL),
('3FPMS-MD', NULL, 'FPMS-MD', 'Management Division', NULL, '2021-03-04 00:28:37', NULL),
('3FPMS-OD', NULL, 'FPMS-OD', 'Office of the Director', NULL, '2021-03-04 00:25:13', NULL),
('3GS', NULL, 'GS', 'Governance Staff', NULL, '2021-03-03 23:24:23', NULL),
('3GS-AGD', NULL, 'GS-AGD', 'Administrative Governance Division', NULL, '2021-03-04 00:39:14', NULL),
('3GS-DRD', NULL, 'GS-DRD', 'Development Research Division', NULL, '2021-05-26 16:47:22', NULL),
('3GS-OD', NULL, 'GS-OD', 'Office of the Director', NULL, '2021-03-04 00:38:12', NULL),
('3GS-PGD', NULL, 'GS-PGD', 'Political Governance Division', NULL, '2021-03-04 00:40:03', NULL),
('3IAS', NULL, 'IAS', 'Internal Audit Service', NULL, '2021-03-03 22:26:25', NULL),
('3IAS-MAD', NULL, 'IAS-MAD', 'Management Audit Division', NULL, '2021-03-04 00:07:13', NULL),
('3IAS-OAD', NULL, 'IAS-OAD', 'Operations Audit Division', NULL, '2021-03-04 00:08:02', NULL),
('3IAS-OD', NULL, 'IAS-OD', 'Office of the Director', NULL, '2021-03-04 00:06:27', NULL),
('3ICTS', NULL, 'ICTS', 'Information and Communications Technology Staff', NULL, '2021-03-03 22:41:10', NULL),
('3ICTS-IND', NULL, 'ICTS-IND', 'ICT Network Division', NULL, '2021-03-04 00:30:50', NULL),
('3ICTS-ISDD', NULL, 'ICTS-ISDD', 'Information Systems Development Division', NULL, '2021-03-04 00:31:40', NULL),
('3ICTS-OD', NULL, 'ICTS-OD', 'Office of the Director', NULL, '2021-03-04 00:29:31', NULL),
('3INNS-OD', NULL, 'INNS-OD', 'Office of the Director', NULL, '2021-08-02 22:46:15', NULL),
('3INO-IFMD', NULL, 'INO-IFMD', 'Innovation Fund Management Division', NULL, '2022-03-13 17:58:49', NULL),
('3INO-OED', NULL, 'INO-OED', 'Office of the Executive Director', NULL, '2022-03-13 18:01:50', NULL),
('3INO-SPID', NULL, 'INO-SPID', 'Strategic Policy Initiatives Division', NULL, '2022-03-13 18:07:14', NULL),
('3IPG', NULL, 'IPG', 'Investment Programming Group', NULL, '2021-03-03 22:04:47', NULL),
('3IS', NULL, 'IS', 'Infrastructure Staff', NULL, '2021-03-03 23:41:03', NULL),
('3IS-ICTD', NULL, 'IS-ICTD', 'ICT Division', NULL, '2021-03-04 01:10:08', NULL),
('3IS-OD', NULL, 'IS-OD', 'Office of the Director', NULL, '2021-03-04 01:06:06', NULL),
('3IS-PEED', NULL, 'IS-PEED', 'Power, Energy and Electrification Division', NULL, '2021-03-04 01:12:49', NULL),
('3IS-SOPID', NULL, 'IS-SOPID', 'Social and Other Public Infrastructure Division', NULL, '2021-03-04 01:14:08', NULL),
('3IS-TD', NULL, 'IS-TD', 'Transportation Division', NULL, '2021-03-04 01:16:50', NULL),
('3IS-VRAIRD', NULL, 'IS-VRAIRD', 'Value/Risk Analysis and Infrastructure Regulation Division', NULL, '2021-03-04 01:18:29', NULL),
('3IS-WRD', NULL, 'IS-WRD', 'Water Resources Division', NULL, '2021-03-04 01:19:40', NULL),
('3LLO', NULL, 'LLO', 'Legislative Liaison Office', NULL, '2021-03-03 22:24:32', NULL),
('3LLOasDIV', NULL, 'LLO', 'Legislative Liaison Office', NULL, '2021-03-04 00:05:03', NULL),
('3LS', NULL, 'LS', 'Legal Staff', NULL, '2021-03-03 22:43:08', NULL),
('3LS-ILD', NULL, 'LS-ILD', 'Investigation and Litigation Division', NULL, '2021-03-04 00:33:19', NULL),
('3LS-LCAD', NULL, 'LS-LCAD', 'Legal Counselling and Assistance Division', NULL, '2021-03-04 00:34:35', NULL),
('3LS-LRCD', NULL, 'LS-LRCD', 'Legal Research and Compliance Division', NULL, '2021-03-04 00:35:23', NULL),
('3LS-OD', NULL, 'LS-OD', 'Office of the Director', NULL, '2021-03-04 00:32:30', NULL),
('3MES', NULL, 'MES', 'Monitoring and Evaluation Staff', NULL, '2021-03-03 23:41:54', NULL),
('3MES-ESD', NULL, 'MES-ESD', 'Economic Sector Division', NULL, '2021-03-04 01:22:08', NULL),
('3MES-NTISD', NULL, 'MES-NTISD', 'Non-Transport Infrastructure Sector Division', NULL, '2021-03-04 01:23:18', NULL),
('3MES-OD', NULL, 'MES-OD', 'Office of the Director', NULL, '2021-03-04 01:20:58', NULL),
('3MES-SDAD', NULL, 'MES-SDAD', 'Systems and Data Analysis Division', NULL, '2021-03-04 01:26:17', NULL),
('3MES-SSD', NULL, 'MES-SSD', 'Social Sector Division', NULL, '2021-03-04 01:24:59', NULL),
('3MES-TISD', NULL, 'MES-TISD', 'Transport Infrastructure Sector Division', NULL, '2021-03-04 01:30:42', NULL),
('3NPPS', NULL, 'NPPS', 'National Policy and Planning Staff', NULL, '2021-03-03 23:27:51', NULL),
('3NPPS-DRD', NULL, 'NPPS-DRD', 'Development Research Division', NULL, '2021-03-04 00:42:48', NULL),
('3NPPS-IED', NULL, 'NPPS-IED', 'International Economics Division', NULL, '2021-03-04 00:43:51', NULL),
('3NPPS-MD', NULL, 'NPPS-MD', 'Macroeconomic Division', NULL, '2021-03-04 00:45:11', NULL),
('3NPPS-OD', NULL, 'NPPS-OD', 'Office of the Director', NULL, '2021-03-04 00:41:02', NULL),
('3NPPS-PCD', NULL, 'NPPS-PCD', 'Policy Coordination Division', NULL, '2021-03-04 00:46:13', NULL),
('3NPPS-PFD', NULL, 'NPPS-PFD', 'Public Finance Division', NULL, '2021-03-04 00:47:19', NULL),
('3OASEC-CAG', NULL, 'OASEC-CAG', 'Office of the Assistant Secretary - Corporate Affairs Group', NULL, '2021-03-03 22:33:48', NULL),
('3OASEC-CAGasDIV', NULL, 'OASEC-CAG', 'Office of the Assistant Secretary - Corporate Affairs Group', NULL, '2021-03-04 00:16:41', NULL),
('3OASEC-IDO', NULL, 'OASEC-IDO', 'Office of the Assistant Secretary - Infrastructure Development Office', NULL, '2021-03-03 23:39:46', NULL),
('3OASEC-IDOasDIV', NULL, 'OASEC-IDO', 'Office of the Assistant Secretary - Infrastructure Development Office', NULL, '2021-03-04 01:04:48', NULL),
('3OASEC-IPG', NULL, 'OASEC-IPG', 'Office of the Assistant Secretary - Investment Programming Group', NULL, '2021-03-03 23:38:48', NULL),
('3OASEC-IPGasDIV', NULL, 'OASEC-IPG', 'Office of the Assistant Secretary - Investment Programming Group', NULL, '2021-03-04 01:03:37', NULL),
('3OASEC-PPG', NULL, 'OASEC-PPG', 'Office of the Assistant Secretary - Policy and Planning Group', NULL, '2021-03-03 23:21:17', NULL),
('3OASEC-PPGasDIV', NULL, 'OASEC-PPG', 'Office of the Assistant Secretary - Policy and Planning Group', NULL, '2021-03-04 00:37:25', '2021-03-08 21:39:03'),
('3OASEC-RDG', NULL, 'OASEC-RDG', 'Office of the Assistant Secretary - Regional Development Group', NULL, '2021-03-03 23:46:18', NULL),
('3OASEC-RDGasDIV', NULL, 'OASEC-RDG', 'Office of the Assistant Secretary - Regional Development Group', NULL, '2021-03-04 01:41:08', NULL),
('3OSEC', NULL, 'OSEC', 'Office of the Secretary', NULL, '2021-03-03 22:00:59', NULL),
('3OSECasDIV', NULL, 'OSEC', 'Office of the Secretary', NULL, '2021-03-04 00:03:30', NULL),
('3OSECasSTAFF', NULL, 'OSEC', 'Office of the Secretary', NULL, '2021-03-03 22:21:24', NULL),
('3OUSEC-CAG', NULL, 'OUSEC-CAG', 'Office of the Undersecretary - Corporate Affairs Group', NULL, '2021-03-03 22:32:29', NULL),
('3OUSEC-CAGasDIV', NULL, 'OUSEC-CAG', 'Office of the Undersecretary - Corporate Affairs Group', NULL, '2021-03-04 00:15:31', NULL),
('3OUSEC-INO', NULL, 'INNS', 'Innovation Staff', NULL, '2021-05-13 18:16:28', '2021-08-02 14:46:31'),
('3OUSEC-IPG', NULL, 'OUSEC-IPG', 'Office of the Undersecretary - Investment Programming Group', NULL, '2021-03-03 23:37:40', NULL),
('3OUSEC-IPGasDIV', NULL, 'OUSEC-IPG', 'Office of the Undersecretary - Investment Programming Group', NULL, '2021-03-04 01:00:07', NULL),
('3OUSEC-PPG', NULL, 'OUSEC-PPG', 'Office of the Undersecretary - Policy and Planning Group', NULL, '2021-03-03 22:44:31', NULL),
('3OUSEC-PPGasDIV', NULL, 'OUSEC-PPG', 'Office of the Undersecretary - Policy and Planning Group', NULL, '2021-03-04 00:36:25', '2021-03-08 21:41:02'),
('3OUSEC-RDG', NULL, 'OUSEC-RDG', 'Office of the Undersecretary - Regional Development Group', NULL, '2021-03-03 23:44:35', NULL),
('3OUSEC-RDGasDIV', NULL, 'OUSEC-RDG', 'Office of the Undersecretary - Regional Development Group', NULL, '2021-03-04 01:39:51', NULL),
('3PIS', NULL, 'PIS', 'Public Investment Staff', NULL, '2021-03-03 23:43:08', NULL),
('3PIS-IPD', NULL, 'PIS-IPD', 'Investment Programming Division', NULL, '2021-03-04 01:33:15', NULL),
('3PIS-OD', NULL, 'PIS-OD', 'Office of the Director', NULL, '2021-03-04 01:31:59', NULL),
('3PIS-PFD-I', NULL, 'PIS-PFD-I', 'Program Financing I Division', NULL, '2021-03-04 01:35:28', NULL),
('3PIS-PFD-II', NULL, 'PIS-PFD-II', 'Program Financing II Division', NULL, '2021-03-04 01:36:55', NULL),
('3PIS-PFD-III', NULL, 'PIS-PFD-III', 'Program Financing III Division', NULL, '2021-03-04 01:38:15', NULL),
('3PPG', NULL, 'PPG', 'Policy and Planning Group', NULL, '2021-03-03 22:03:39', NULL),
('3RDG', NULL, 'RDG', 'Regional Development Group', NULL, '2021-03-03 22:05:52', NULL),
('3RDS', NULL, 'RDS', 'Regional Development Staff', NULL, '2021-03-03 23:47:29', NULL),
('3RDS-LUPPD', NULL, 'RDS-LUPPD', 'Land Use and Physical Planning Division', NULL, '2021-03-04 01:43:53', NULL),
('3RDS-OD', NULL, 'RDS-OD', 'Office of the Director', NULL, '2021-03-04 01:42:32', NULL),
('3RDS-RDAD', NULL, 'RDS-RDAD', 'Regional Development Assistance Division', NULL, '2021-03-04 01:46:39', NULL),
('3RDS-RDPD', NULL, 'RDS-RDPD', 'Regional Development Planning Division', NULL, '2021-03-04 01:48:17', NULL),
('3RDS-RLIDD', NULL, 'RDS-RLIDD', 'Regional and Local Institutional Development Division', NULL, '2021-03-04 01:45:14', NULL),
('3SDS', NULL, 'SDS', 'Social Development Staff', NULL, '2021-03-03 23:28:43', NULL),
('3SDS-ESDD', NULL, 'SDS-ESDD', 'Education and Skills Development Division', NULL, '2021-03-04 00:49:39', NULL),
('3SDS-HHSD', NULL, 'SDS-HHSD', 'Housing and Human Settlements Division', NULL, '2021-03-04 00:51:59', NULL),
('3SDS-HNPD', NULL, 'SDS-HNPD', 'Health, Nutrition and Population Division', NULL, '2021-03-04 00:50:53', NULL),
('3SDS-OD', NULL, 'SDS-OD', 'Office of the Director', NULL, '2021-03-04 00:48:18', NULL),
('3SDS-SPID', NULL, 'SDS-SPID', 'Social Protection and Integration Division', NULL, '2021-03-04 00:53:07', NULL),
('3TSIS', NULL, 'TSIS', 'Trade, Services and Industry Staff', NULL, '2021-03-03 23:29:37', NULL),
('3TSIS-ID', NULL, 'TSIS-ID', 'Industry Division', NULL, '2021-03-04 00:56:38', NULL),
('3TSIS-OD', NULL, 'TSIS-OD', 'Office of the Director', NULL, '2021-03-04 00:55:38', NULL),
('3TSIS-SD', NULL, 'TSIS-SD', 'Services Division', NULL, '2021-03-04 00:57:51', NULL),
('3TSIS-TD', NULL, 'TSIS-TD', 'Trade Division', NULL, '2021-03-04 00:58:54', NULL),
('ACD', NULL, 'ANRES-ACD', 'AGRICULTURAL COMMODITIES DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('AD', NULL, 'AD', 'ACCOUNTING DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('ADS', NULL, 'ADS', 'ADMINISTRATIVE STAFF', NULL, '2018-08-16 01:41:10', NULL),
('AGD', NULL, 'GOVS-AGD', 'ADMINISTRATIVE GOVERNANCE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('AMD', NULL, 'AMD', 'ASSETS MANAGEMENT DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('ANRES', NULL, 'NDOI-ANRES', 'AGRICULTURAL, NATURAL, RESOURCES AND ENVIRONMENTAL STAFF', NULL, '2019-04-23 08:00:00', '2021-12-21 14:37:36'),
('APPLICANT', NULL, 'APPLICANT', 'APPLICANT', NULL, '2018-08-16 01:41:10', NULL),
('BD', NULL, 'BD', 'BUDGET DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('CA', NULL, 'CA', 'COMPENSATION ADMINISTRATION', NULL, '2018-08-16 01:41:10', NULL),
('CAR-DRD', NULL, 'CAR-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CAR-FAD', NULL, 'CAR-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CAR-PDIPBD', NULL, 'CAR-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CAR-PFPD', NULL, 'CAR-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CAR-PMED', NULL, 'CAR-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CARAGA-DRD', NULL, 'CARAGA-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CARAGA-FAD', NULL, 'CARAGA-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CARAGA-PDIPBD', NULL, 'CARAGA-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CARAGA-PFPD', NULL, 'CARAGA-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CARAGA-PMED', NULL, 'CARAGA-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('CDS', NULL, 'CDS', 'CAREER DEVELOPMENT AND SCHOLARSHIP', NULL, '2018-08-16 01:41:10', NULL),
('CM', NULL, 'CM', 'CASH MANAGEMENT', NULL, '2018-08-16 01:41:10', NULL),
('CO', NULL, 'CO', 'CENTRAL OFFICE', NULL, '2019-05-06 19:00:00', NULL),
('CPMD', NULL, 'CPMD', 'CORPORATE PLANNING AND MONITORING DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('CSO', NULL, 'CSO', 'CENTRAL SUPPORT OFFICE', NULL, '2018-08-16 01:41:10', '2019-07-25 10:54:38'),
('DIS', NULL, 'DIS', 'DEVELOPMENT INFORMATION STAFF', NULL, '2018-08-16 01:41:10', NULL),
('DRD', NULL, 'NPPS-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('ED', NULL, 'ANRES-ED', 'ENVIRONMENT DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('ERDWB', NULL, 'ERDWB', 'EMPLOYEE RELATIONS, DISCIPLINE AND WELFARE & BENEFITS', NULL, '2018-08-16 01:41:10', NULL),
('ESD', NULL, 'MES-ESD', 'ECONOMIC SECTOR DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('ESDD', NULL, 'SDS-ESDD', 'EDUCATION AND SKILLS DEVELOPMENT DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('FPMS', NULL, 'FPMS', 'FINANCIAL, PLANNING AND MANAGEMENT STAFF', NULL, '2018-08-16 01:41:10', NULL),
('GOVS', NULL, 'NDOI-GOVS', 'GOVERNANCE STAFF', NULL, '2019-04-23 08:00:00', NULL),
('GSD', NULL, 'GSD', 'GENERAL SERVICES DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('HHSD', NULL, 'SDS-HHSD', 'HOUSING AND HUMAN SETTLEMENTS DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('HNPD', NULL, 'SDS-HNPD', 'HEALTH NUTRITION AND POPULATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('HRDD', NULL, 'HRDD', 'HUMAN RESOURCE DEVELOPMENT DIVISON', NULL, '2018-08-16 01:41:10', NULL),
('HRMD', NULL, 'HRMD', 'HUMAN RESOURCE MANAGEMENT DIVISON', NULL, '2018-08-16 01:41:10', NULL),
('HRPASA', NULL, 'HRPASA', 'HR PLANNING, ACQUISITION, SELECTION AND APPOINTMENT', NULL, '2018-08-16 01:41:10', NULL),
('HRPI', NULL, 'HRPI', 'HR POLICIES AND INFORMATION', NULL, '2018-08-16 01:41:10', NULL),
('I-DRD', NULL, 'I-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('I-FAD', NULL, 'I-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('I-PDIPBD', NULL, 'I-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('I-PFPD', NULL, 'I-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('I-PMED', NULL, 'I-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IAS', NULL, 'IAS', 'INTERNAL AUDIT SERVICE', NULL, '2019-04-23 08:00:00', NULL),
('ICTD', NULL, 'IS-ICTD', 'ICT DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('ICTND', NULL, 'ICTND', 'ICT NETWORK DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('ID', NULL, 'TSIS-ID', 'INDUSTRY DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IED', NULL, 'NPPS-IED', 'INTERNATIONAL ECONOMICS DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('II-DRD', NULL, 'II-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('II-FAD', NULL, 'II-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('II-PDIPBD', NULL, 'II-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('II-PFPD', NULL, 'II-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('II-PMED', NULL, 'II-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('III-DRD', NULL, 'III-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('III-FAD', NULL, 'III-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('III-PDIPBD', NULL, 'III-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('III-PFPD', NULL, 'III-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('III-PMED', NULL, 'III-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('ILD', NULL, 'ILD', 'INVESTIGATION AND LITIGATION DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('IPD', NULL, 'PIS-IPD', 'INVESTMENT PROGRAMMING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IS', NULL, 'NDOII-IS', 'INFRASTRUCTURE STAFF', NULL, '2019-04-23 08:00:00', '2021-12-21 14:37:47'),
('ISDD', NULL, 'ISDD', 'INFORMATION SYSTEMS DEVELOPMENT DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('ITCS', NULL, 'ICTS', 'INFORMATION AND COMMUNICATIONS TECHNOLOGY STAFF', NULL, '2018-08-16 01:41:10', '2020-11-04 16:03:57'),
('IVA-DRD', NULL, 'IVA-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVA-FAD', NULL, 'IVA-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVA-PDIPBD', NULL, 'IVA-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVA-PFPD', NULL, 'IVA-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVA-PMED', NULL, 'IVA-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVB-DRD', NULL, 'IVB-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVB-FAD', NULL, 'IVB-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVB-PDIPBD', NULL, 'IVB-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVB-PFPD', NULL, 'IVB-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IVB-PMED', NULL, 'IVB-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IX-DRD', NULL, 'IX-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IX-FAD', NULL, 'IX-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IX-PDIPBD', NULL, 'IX-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IX-PFPD', NULL, 'IX-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('IX-PMED', NULL, 'IX-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('LCAD', NULL, 'LCAD', 'LEGAL COUNSELING AND ASSISTANCE DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('LEDAC', NULL, 'LEDAC', 'LEGISLATIVE EXECUTIVE DEVELOPMENT ADVISORY COUNCIL', NULL, '2019-05-22 19:00:00', NULL),
('LEDAC-DIVISION', NULL, 'LEDAC', 'LEGISLATIVE EXECUTIVE DEVELOPMENT ADVISORY COUNCIL', NULL, '2018-08-16 01:41:10', NULL),
('LEDAC-OFFICE', NULL, 'LEDAC', 'LEGISLATIVE EXECUTIVE DEVELOPMENT ADVISORY COUNCIL', NULL, '2019-05-22 08:00:00', NULL),
('LEDAC-STAFF', NULL, 'LEDAC', 'LEGISLATIVE EXECUTIVE DEVELOPMENT ADVISORY COUNCIL', NULL, '2018-08-16 01:41:10', NULL),
('LRCD', NULL, 'LRCD', 'LEGAL RESEARCH AND COMPLIANCE DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('LS', NULL, 'LS', 'LEGAL STAFF', NULL, '2018-08-16 01:41:10', NULL),
('LUPPD', NULL, 'RDS-LUPPD', 'LAND USE AND PHYSICAL PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('MAD', NULL, 'MAD', 'MANAGEMENT AUDIT DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('MD', NULL, 'MD', 'MANAGEMENT DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('MDD', NULL, 'MDD', 'MULTIMEDIA DEVELOPMENT DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('MED', NULL, 'NPPS-MED', 'MACROECONOMIC DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('MES', NULL, 'MES', 'MONITORING AND EVALUATION STAFF', NULL, '2018-08-16 01:41:10', '2019-04-24 10:00:42'),
('NDO-I', NULL, 'NDO I', 'NDO I - POLICY AND PLANNING', NULL, '2018-08-16 01:41:10', '2019-07-25 10:54:38'),
('NDO-II', NULL, 'NDO II', 'NDO II - INVESTMENT PROGRAMMING', NULL, '2018-08-16 01:41:10', '2019-07-25 10:54:38'),
('NEDA', NULL, 'NEDA', 'NATIONAL ECONOMIC DEVELOPMENT AUTHORITY', NULL, '2018-08-16 01:41:10', '2018-11-19 16:57:25'),
('NPPS', NULL, 'NPPS', 'NATIONAL POLICY AND PLANNING STAFF', NULL, '2018-08-16 01:41:10', '2019-04-24 10:00:42'),
('NRD', NULL, 'ANRES-NRD', 'NATURAL RESOURCES DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('NRO', '137602000', 'NRO', 'NEDA REGIONAL OFFICE', NULL, '2019-03-21 19:10:56', '2019-03-21 13:23:57'),
('NRO-CAR', NULL, 'RDO-NRO-CAR', 'NRO - CORDILLERA ADMINISTRATIVE REGION', NULL, '2019-04-23 08:00:00', NULL),
('NRO-CARAGA', NULL, 'RDO-NRO-CARAGA', 'NRO - CARAGA REGION', NULL, '2019-04-23 08:00:00', NULL),
('NRO-I', NULL, 'RDO-NRO-I', 'NRO - REGION I (ILOCOS REGION)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-II', NULL, 'RDO-NRO-II', 'NRO - REGION II (CAGAYAN VALLEY)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-III', NULL, 'RDO-NRO-III', 'NRO - REGION III (CENTRAL LUZON)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-IVA', NULL, 'RDO-NRO-IVA', 'NRO - REGION IVA (CALABARZON)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-IVB', NULL, 'RDO-NRO-IVB', 'NRO - REGION IVB (MIMAROPA)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-IX', NULL, 'RDO-NRO-IX', 'NRO - REGION IX (ZAMBOANGA PENINSULA)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-V', NULL, 'RDO-NRO-V', 'NRO - REGION V (BICOL REGION)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-VI', NULL, 'RDO-NRO-VI', 'NRO - REGION VI (WESTERN VISAYAS)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-VII', NULL, 'RDO-NRO-VII', 'NRO - REGION VII (CENTRAL VISAYAS)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-VIII', NULL, 'RDO-NRO-VIII', 'NRO - REGION VIII (EASTERN VISAYAS)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-X', NULL, 'RDO-NRO-X', 'NRO - REGION X (NORTHERN MINDANAO)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-XI', NULL, 'RDO-NRO-XI', 'NRO - REGION XI (DAVAO REGION)', NULL, '2019-04-23 08:00:00', NULL),
('NRO-XII', NULL, 'RDO-NRO-XII', 'NRO - REGION XII (SOCCSKSARGEN)', NULL, '2019-04-23 08:00:00', NULL),
('NTISD', NULL, 'MES-NTISD', 'NON-TRANSPORT INFRASTRUCTURE SECTOR DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('OAD', NULL, 'OAD', 'OPERATIONS AUDIT DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('OD', NULL, 'OD', 'OFFICE OF THE DIRECTOR-GENERAL', NULL, '2019-04-23 08:00:00', NULL),
('OD-ANRES', NULL, 'OD-ANRES', 'OFFICE OF THE DIRECTOR', NULL, '2019-07-29 00:09:27', '2019-07-28 16:37:51'),
('OD-AS', NULL, 'OD-AS', 'OFFICE OF THE DIRECTOR', NULL, '2019-07-29 00:08:53', '2019-07-28 16:37:46'),
('OD-DIS', NULL, 'OD-DIS', 'OFFICE OF THE DIRECTOR', NULL, '2019-07-29 00:10:33', '2019-07-28 16:37:39'),
('OD-ICTS', NULL, 'OD-ICTS', 'OFFICE OF THE DIRECTOR', NULL, '2019-07-29 00:35:33', '2019-07-28 16:37:59'),
('OD-LS', NULL, 'OD-LS', 'OFFICE OF THE DIRECTOR', NULL, '2019-07-29 00:35:00', '2019-07-28 16:37:31'),
('ODDG-RDO', NULL, 'ODDG-RDO', 'Office of the Deputy Director-General - Regional Development Office', NULL, '2021-03-15 04:25:42', NULL),
('ODG', NULL, 'ODG', 'OFFICE OF THE DIRECTOR', NULL, '2019-04-23 08:00:00', '2021-07-20 10:33:50'),
('ODG-S', NULL, 'ODG', 'OFFICE OF THE DIRECTOR-GENERAL', NULL, '2020-10-14 22:30:36', NULL),
('OODG', NULL, 'OODG', 'OFFICE OF THE DIRECTOR-GENERAL', NULL, '2019-04-23 08:00:00', NULL),
('PCD', NULL, 'NPPS-PCD', 'POLICY COORDINATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PEED', NULL, 'IS-PEED', 'POWER, ENERGY AND ELECTRIFICATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PFD', NULL, 'NPPS-PFD', 'PUBLIC FINANCE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PFD-I', NULL, 'PIS-PFD-I', 'PROGRAM FINANCING I DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PFD-II', NULL, 'PIS-PFD-II', 'PROGRAM FINANCING II DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PFD-III', NULL, 'PIS-PFD-III', 'PROGRAM FINANCING III DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PGD', NULL, 'GOVS-PGD', 'POLITICAL GOVERNANCE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('PIS', NULL, 'NDOII-PIS', 'PUBLIC INVESTMENT STAFF', NULL, '2019-04-23 08:00:00', NULL),
('PMD', NULL, 'PMD', 'PROCUREMENT MANAGEMENT DIVISION', NULL, '2018-08-16 01:41:10', NULL),
('PRD', NULL, 'PRD', 'PUBLIC RELATIONS DIVISION', NULL, '2018-08-16 01:41:10', '2022-04-07 11:25:51'),
('PS', NULL, 'PS', 'PROPERTY AND SUPPLY', NULL, '2018-08-16 01:41:10', NULL),
('qwee', '137602000', 'qwerty', 'qwe', NULL, '2018-10-23 23:04:15', NULL),
('RDAD', NULL, 'RDS-RDAD', 'REGIONAL DEVELOPMENT ASSISTANCE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('RDO', NULL, 'RDO', 'REGIONAL DEVELOPMENT OFFICE', NULL, '2018-08-16 01:41:10', '2019-07-25 10:54:38'),
('RDPD', NULL, 'RDS-RDPD', 'REGIONAL DEVELOPMENT PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('RDS', NULL, 'RDS', 'REGIONAL DEVELOPMENT STAFF', NULL, '2018-08-16 01:41:10', NULL),
('RISSD', NULL, 'ANRES-RISSD', 'RURAL INSTITUTIONS AND SUPPORT SERVICES DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('RLIDD', NULL, 'RDS-RILDD', 'REGIONAL AND LOCAL INSTITUTIONAL DEVELOPMENT DIVISION', NULL, '2019-04-23 08:00:00', '2019-07-25 10:54:38'),
('RO', NULL, 'RO', 'REGIONAL OFFICE', NULL, '2019-05-06 19:00:00', NULL),
('SD', NULL, 'TSIS-SD', 'SERVICES DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('SDAD', NULL, 'MES-SDAD', 'SYSTEMS AND DATA ANALYSIS DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('SDS', NULL, 'NDOI-SDS', 'SOCIAL DEVELOPMENT STAFF', NULL, '2019-04-23 08:00:00', NULL),
('SOPID', NULL, 'IS-SOPID', 'SOCIAL AND OTHER PUBLIC INFRASTRUCTURE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('SPID', NULL, 'SDS-SPID', 'SOCIAL PROTECTION AND INTERGATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('SSD', NULL, 'MES-SSD', 'SOCIAL SECTOR DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('TD', NULL, 'TSIS-TD', 'TRADE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('TISD', NULL, 'MES-TISD', 'TRANSPORT INFRASTRUCTURE SECTOR DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('TRD', NULL, 'IS-TRD', 'TRANSPORTATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('TSIS', NULL, 'NDOI-TSIS', 'TRADE, SERVICES, AND INDUSTRY STAFF', NULL, '2019-04-23 08:00:00', NULL),
('TSM', NULL, 'TSM', 'TRANSPORT SERVICE MANAGEMENT', NULL, '2018-08-16 01:41:10', NULL),
('V-DRD', NULL, 'V-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('V-FAD', NULL, 'V-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('V-PDIPBD', NULL, 'V-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('V-PFPD', NULL, 'V-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('V-PMED', NULL, 'V-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VI-DRD', NULL, 'VI-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VI-FAD', NULL, 'VI-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VI-PDIPBD', NULL, 'VI-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VI-PFPD', NULL, 'VI-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VI-PMED', NULL, 'VI-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VII-DRD', NULL, 'VII-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VII-FAD', NULL, 'VII-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VII-PDIPBD', NULL, 'VII-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VII-PFPD', NULL, 'VII-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VII-PMED', NULL, 'VII-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VIII-DRD', NULL, 'VIII-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VIII-FAD', NULL, 'VIII-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VIII-PDIPBD', NULL, 'VIII-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VIII-PFPD', NULL, 'VIII-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VIII-PMED', NULL, 'VIII-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('VRAIRD', NULL, 'IS-VRAIRD', 'VALUE/RISK ANALYSIS AND INFRASTRUCTURE REGULATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('WPL', NULL, 'WPL', 'WORKPLACE AND PERFORMANCE LEARNING', NULL, '2018-08-16 01:41:10', NULL),
('WRD', NULL, 'IS-WRD', 'WATER RESOURCES DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('X-DRD', NULL, 'X-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('X-FAD', NULL, 'X-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('X-PDIPBD', NULL, 'X-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('X-PFPD', NULL, 'X-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('X-PMED', NULL, 'X-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XI-DRD', NULL, 'XI-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XI-FAD', NULL, 'XI-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XI-PDIPBD', NULL, 'XI-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XI-PFPD', NULL, 'XI-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XI-PMED', NULL, 'XI-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XII-DRD', NULL, 'XII-DRD', 'DEVELOPMENT RESEARCH DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XII-FAD', NULL, 'XII-FAD', 'FINANCE AND ADMINISTRATIVE DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XII-PDIPBD', NULL, 'XII-PDIPBD', 'PROJECT DEVELOPMENT, INVESTMENT PROGRAMMING AND BUDGETTING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XII-PFPD', NULL, 'XII-PFPD', 'POLICY FORMULATION AND PLANNING DIVISION', NULL, '2019-04-23 08:00:00', NULL),
('XII-PMED', NULL, 'XII-PMED', 'PROJECT MONITORING AND EVALUATION DIVISION', NULL, '2019-04-23 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `param_agencies`
--

CREATE TABLE `param_agencies` (
  `agency_id` int(11) NOT NULL,
  `agency_name` varchar(100) NOT NULL,
  `default_agency_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `param_agencies`
--

INSERT INTO `param_agencies` (`agency_id`, `agency_name`, `default_agency_flag`, `active_flag`, `created_date`, `modified_date`) VALUES
(1, 'Department of Health', 'N', 'Y', '2018-10-09 02:48:32', '2020-07-27 22:00:55'),
(2, 'Department of Agrarian Reform', 'N', 'Y', '2019-03-28 16:00:00', '2020-07-27 22:00:03'),
(3, 'Department of Education', 'N', 'Y', '2019-03-28 16:00:00', '2020-07-27 22:00:14'),
(5, 'Department of Agriculture', 'N', 'Y', '2018-10-10 01:33:09', '2020-07-27 22:00:09'),
(6, 'Department of Energy', 'N', 'Y', '2018-10-10 01:33:09', '2020-07-27 22:00:23'),
(7, 'National Economic and Development Authority', 'Y', 'Y', '2019-04-03 08:28:02', '2019-07-25 18:54:38'),
(8, 'Department of Public Works and Highways', 'N', 'Y', '2019-05-08 08:55:43', '2020-07-27 22:01:01'),
(9, 'Presidential Management Staff', 'N', 'Y', '2019-05-08 09:51:28', '2020-07-27 22:10:53'),
(10, 'City Government of Muntinlipa-City Planning and Development Office', 'N', 'Y', '2020-09-01 06:11:58', '2022-04-06 19:46:39'),
(11, 'Tiburcio Tancinco Memorial Institute of Science and Technology', 'N', 'Y', '2020-09-03 05:24:16', NULL),
(12, 'Office of the Mayor - Municipality of Loreto', 'N', 'Y', '2020-09-03 07:38:38', NULL),
(13, 'Department of Finance', 'N', 'Y', '2020-09-15 06:37:04', NULL),
(14, 'National Commission on the Role of Filipino Women', 'N', 'Y', '2020-09-18 06:05:43', NULL),
(15, 'Philippine Veterans Affairs Office', 'N', 'Y', '2020-09-21 03:02:01', '2021-01-17 18:34:10'),
(16, 'Philippine Cotton Corporation', 'N', 'Y', '2020-09-21 04:53:04', NULL),
(17, 'National Economic and Development Authority -  RO5', 'N', 'Y', '2020-09-23 03:46:46', NULL),
(18, 'Commission on Information and Communications Technology', 'N', 'Y', '2020-09-29 01:32:17', NULL),
(19, 'Municipality of Aritao, Nueva Vizcaya', 'N', 'Y', '2020-09-29 05:06:54', '2021-12-22 22:08:01'),
(20, 'Bureau of Agricultural Statistics', 'N', 'Y', '2020-10-01 06:52:47', NULL),
(21, 'Bureau of Soils and Water Management', 'N', 'Y', '2020-10-02 08:41:01', NULL),
(22, 'Center for International Trade Expositions and Missions', 'N', 'Y', '2020-10-06 06:40:54', NULL),
(23, 'House of Representatives', 'N', 'Y', '2020-10-06 07:05:51', NULL),
(24, 'Department of Budget and Management', 'N', 'Y', '2020-10-07 08:48:20', NULL),
(25, 'Department of Justice', 'N', 'Y', '2020-10-07 10:59:07', NULL),
(26, 'National Statistics Office', 'N', 'Y', '2020-10-12 05:37:27', NULL),
(27, 'Office of the Mun. Treasurer', 'N', 'Y', '2020-10-15 07:22:17', '2022-04-10 23:41:18'),
(28, 'Commission on Audit', 'N', 'Y', '2020-10-20 05:00:56', NULL),
(29, 'City Government of Makati', 'N', 'Y', '2020-10-20 08:01:46', NULL),
(31, 'Armed Forces of the Philippines', 'N', 'Y', '2020-10-26 08:45:07', NULL),
(32, 'Philippine National Volunteer Service Coordinating Agency', 'N', 'Y', '2020-10-28 07:34:24', NULL),
(33, 'Department of Social Welfare and Development', 'N', 'Y', '2020-11-03 08:25:30', NULL),
(34, 'City Social Welfare and Development Department', 'N', 'Y', '2020-11-04 04:59:23', NULL),
(35, 'Banko Sentral ng Pilipinas', 'N', 'Y', '2020-11-04 07:09:02', NULL),
(36, 'Department of Trade and Industry', 'N', 'Y', '2020-11-04 08:05:47', NULL),
(37, 'Department of Tourism', 'N', 'Y', '2020-11-05 01:51:55', NULL),
(38, 'Board of Investments', 'N', 'Y', '2020-11-09 02:33:06', NULL),
(39, 'National Wages and and Productivity Commission', 'N', 'Y', '2020-11-09 03:03:55', NULL),
(40, 'University of the Philippines', 'N', 'Y', '2020-11-09 05:21:50', NULL),
(41, 'Commission of Filipino Overseas', 'N', 'Y', '2020-11-10 02:43:56', NULL),
(42, 'Masbate Office of the Administration', 'N', 'Y', '2020-11-18 07:14:44', NULL),
(43, 'DILG-Local Government Academy', 'N', 'Y', '2020-11-18 08:40:22', NULL),
(44, 'Philippine Statistics Authority', 'N', 'Y', '2020-11-19 05:55:20', NULL),
(45, 'Department of Human Resource Management', 'N', 'Y', '2020-11-24 02:02:47', NULL),
(46, 'City Human Resources Management Department', 'N', 'Y', '2020-11-24 02:03:20', NULL),
(47, 'Philippine Institute for Development Studies', 'N', 'Y', '2021-01-18 02:34:52', NULL),
(48, 'Development Academy of the Philippines', 'N', 'Y', '2021-01-18 05:02:32', NULL),
(49, 'Alcantara National High School', 'N', 'Y', '2021-01-18 07:46:04', NULL),
(50, 'Libertad National High School', 'N', 'Y', '2021-01-18 07:46:16', NULL),
(51, 'Romblon National High School', 'N', 'Y', '2021-01-18 07:46:34', NULL),
(52, 'Romblon State University', 'N', 'Y', '2021-01-18 07:46:48', NULL),
(53, 'Asset Privatization Trust', 'N', 'Y', '2021-02-23 01:48:28', NULL),
(54, 'Department of Science and Technology', 'N', 'Y', '2021-03-08 01:49:59', NULL),
(55, 'Environmental Management Bureau', 'N', 'Y', '2021-03-08 05:44:16', NULL),
(56, 'Department of Environment and Natural Resources', 'N', 'Y', '2021-03-08 05:48:34', NULL),
(57, 'National Intelligence Coordinating Agency', 'N', 'Y', '2021-03-08 08:16:27', NULL),
(58, 'Office of Transportation Cooperatives', 'N', 'Y', '2021-03-12 07:26:26', NULL),
(59, 'City Legal Office-Cebu City', 'N', 'Y', '2021-03-26 04:15:48', '2022-04-06 19:46:57'),
(60, 'Home Development Mutual Fund', 'N', 'Y', '2021-03-30 03:44:44', NULL),
(61, 'National Statistical Coordination Board', 'N', 'Y', '2021-04-20 05:11:23', NULL),
(62, 'Film Development Council of the Philippines', 'N', 'Y', '2021-04-27 02:40:09', NULL),
(63, 'Land Bank of the Philippines', 'N', 'Y', '2021-07-26 07:07:47', '2021-07-25 23:08:59'),
(64, 'Pamantasan ng Lungsod ng Maynila', 'N', 'Y', '2021-08-04 05:52:07', NULL),
(65, 'Philippine Navy', 'N', 'Y', '2021-08-10 03:29:34', NULL),
(66, 'AFP Retirement and Separation Benefits System', 'N', 'Y', '2021-08-10 06:07:42', NULL),
(67, 'Agricultural Credit Policy Council', 'N', 'Y', '2021-08-10 07:44:55', NULL),
(68, 'Philippine Rice Research Institute', 'N', 'Y', '2021-08-11 03:20:03', '2022-01-10 22:15:18'),
(69, 'Provincial Government of Misamis Oriental', 'N', 'Y', '2021-08-11 08:20:24', NULL),
(70, 'Office of the Ombudsman', 'N', 'Y', '2021-08-13 00:48:37', NULL),
(71, 'Department of Information and Communications Technology', 'N', 'Y', '2021-08-18 06:32:38', NULL),
(72, 'Climate Change Commission', 'N', 'Y', '2021-08-20 06:16:03', NULL),
(73, 'Department of the Interior and Local Government', 'N', 'Y', '2021-08-23 03:34:51', '2021-08-22 19:36:08'),
(74, 'College of Public Health-UP Manila', 'N', 'Y', '2021-08-23 06:59:15', '2022-04-06 19:47:31'),
(75, 'Ateneo de Manila University', 'N', 'Y', '2021-08-25 02:29:00', NULL),
(76, 'National Meat Inspection Service', 'N', 'Y', '2021-10-21 03:29:43', NULL),
(77, 'Bases Conversion and Development Authority', 'N', 'Y', '2021-11-09 01:31:55', NULL),
(78, 'Department of the Interior and Local Government-Region IV', 'N', 'Y', '2021-11-09 01:33:26', NULL),
(80, 'City Legal Office-Valenzuela', 'N', 'Y', '2021-11-11 06:02:11', '2022-04-06 19:47:08'),
(81, 'Office of the City Mayor-Valenzuela', 'N', 'Y', '2021-11-11 06:03:05', '2022-04-22 00:04:47'),
(82, 'Pasig City Treasurer\'s Office', 'N', 'Y', '2021-11-11 07:02:32', NULL),
(83, 'Philippine Tourism Authority', 'N', 'Y', '2021-11-18 00:56:34', NULL),
(84, 'Department of Public Works and Highways-Region IV-A', 'N', 'Y', '2021-11-22 01:08:48', NULL),
(85, 'NEDA Regional Office-IVB', 'N', 'Y', '2021-11-25 03:53:30', NULL),
(87, 'Philippine Competition Commission', 'N', 'Y', '2021-12-06 04:38:25', NULL),
(88, 'Zamboanga City Special Economic Zone Authority', 'N', 'Y', '2021-12-13 03:02:03', NULL),
(89, 'National Youth Commission', 'N', 'Y', '2021-12-13 03:12:17', NULL),
(90, 'Department of Foreign Affairs and Trade', 'N', 'Y', '2021-12-14 02:36:18', NULL),
(91, 'MSO-Department of Justice', 'N', 'Y', '2021-12-20 07:54:03', NULL),
(92, 'NEDA Regional Office IV-A', 'N', 'Y', '2021-12-27 02:12:29', NULL),
(94, 'National Museum of the Philippines', 'N', 'Y', '2022-01-12 07:45:43', NULL),
(95, 'BAS, DA', 'N', 'Y', '2022-01-21 01:04:49', NULL),
(96, 'DA-OSEC', 'N', 'Y', '2022-01-21 05:09:58', NULL),
(97, 'National Coast Watch Council Secretariat', 'N', 'Y', '2022-01-26 09:01:13', NULL),
(98, 'Subic Bay Metropolitan Authority-Public Affairs Office', 'N', 'Y', '2022-02-04 01:24:12', NULL),
(99, 'Subic Bay Metropolitan Authority-Promotions and Mktg. Dept.', 'N', 'Y', '2022-02-04 02:00:00', NULL),
(100, 'Luzon Urban Beltway', 'N', 'Y', '2022-02-16 08:29:36', NULL),
(101, 'Office of External Affairs', 'N', 'Y', '2022-02-16 08:29:56', NULL),
(102, 'Department of National Defense', 'N', 'Y', '2022-03-15 01:07:22', NULL),
(103, 'NEDA-RO5', 'N', 'Y', '2022-03-21 05:44:38', NULL),
(104, 'Public-Private Partnership Center', 'N', 'Y', '2022-03-23 05:26:30', NULL),
(105, 'PLM-Internal Control Office', 'N', 'Y', '2022-04-04 08:57:43', NULL),
(106, 'Tariff Commission', 'N', 'Y', '2022-04-05 03:28:30', NULL),
(107, 'NFA-GMOD', 'N', 'Y', '2022-04-05 05:31:03', NULL),
(108, 'DENR', 'N', 'Y', '2022-04-05 06:48:31', NULL),
(109, 'NCPAG', 'N', 'Y', '2022-04-06 01:03:39', NULL),
(110, 'UP Diliman (INFO-S)', 'N', 'Y', '2022-04-06 01:35:19', NULL),
(111, 'NEDA-TIUS', 'N', 'Y', '2022-04-06 05:17:44', NULL),
(112, 'DPWH-BOD-Ma.', 'N', 'Y', '2022-04-06 23:42:02', NULL),
(113, 'DPWH-Osec-Ma.', 'N', 'Y', '2022-04-07 00:48:45', NULL),
(114, 'DBM RO2 Tug. City', 'N', 'Y', '2022-04-07 03:49:32', NULL),
(115, 'NEDA RO2 Tug. City', 'N', 'Y', '2022-04-07 06:17:45', NULL),
(116, 'SENATE/Office of Senator Juan Edgardo \"Sonny\" A. Angara', 'N', 'Y', '2022-04-08 01:11:41', NULL),
(117, 'House of Rep., Congress Office of Cong. V. Yap', 'N', 'Y', '2022-04-08 01:37:18', NULL),
(118, 'SENATE/Office of Senator Pia S. Cayetano', 'N', 'Y', '2022-04-08 01:51:59', NULL),
(119, 'City Government of Makati, Internal Management Control Office', 'N', 'Y', '2022-04-08 05:20:39', NULL),
(120, 'DBM USEC', 'N', 'Y', '2022-04-08 07:09:16', NULL),
(121, 'NEDA Region IV', 'N', 'Y', '2022-04-11 00:39:34', NULL),
(122, 'NEDA Region VI', 'N', 'Y', '2022-04-11 01:32:51', NULL),
(123, 'NEDA Region IV-A', 'N', 'Y', '2022-04-11 02:06:04', NULL),
(124, 'DBM', 'N', 'Y', '2022-04-11 03:22:46', NULL),
(125, 'DBMBMB-G', 'N', 'Y', '2022-04-11 03:24:51', NULL),
(126, 'DBMBMB-HDS', 'N', 'Y', '2022-04-11 03:27:24', NULL),
(127, 'DBMBMB-B', 'N', 'Y', '2022-04-11 03:28:28', NULL),
(128, 'NEDA IV-A', 'N', 'Y', '2022-04-12 02:44:44', NULL),
(129, 'Office of the Provincial Administrator - Bulacan', 'N', 'Y', '2022-04-12 07:45:44', NULL),
(130, 'NEDA RO IV-A', 'N', 'Y', '2022-04-13 03:34:36', NULL),
(131, 'NEDA-INFRACOM', 'N', 'Y', '2022-04-21 00:48:01', NULL),
(132, 'NEDA Region IV-B', 'N', 'Y', '2022-04-25 05:29:37', NULL),
(133, 'PNVSCA', 'N', 'Y', '2022-04-25 05:41:30', NULL),
(134, 'NEDA-IACTP', 'N', 'Y', '2022-04-25 06:45:22', NULL),
(135, 'NEDA-CPEDS', 'N', 'Y', '2022-04-26 00:37:49', NULL),
(136, 'OCLO-Cebu City', 'N', 'Y', '2022-04-26 01:53:14', NULL),
(137, 'Commission on Elections', 'N', 'Y', '2022-04-26 02:52:53', NULL),
(138, 'UPLB Foundation Inc. (LWRD, CEAT, UPLB)', 'N', 'Y', '2022-04-28 06:05:04', NULL),
(139, 'UPLB Foundation Inc. (IARDS, CPAf, UPLB)', 'N', 'Y', '2022-04-28 06:05:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `param_contact_types`
--

CREATE TABLE `param_contact_types` (
  `contact_type_id` int(11) NOT NULL,
  `contact_type_name` varchar(50) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `param_contact_types`
--

INSERT INTO `param_contact_types` (`contact_type_id`, `contact_type_name`, `active_flag`) VALUES
(1, 'Cellphone Number', 'Y'),
(2, 'Telephone Number', 'Y'),
(3, 'Primary Email Address', 'Y'),
(4, 'Alternate Email Address', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_code` varchar(25) NOT NULL,
  `fname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(30) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'STATUS_PENDING',
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `org_code`, `fname`, `lname`, `mname`, `ext_name`, `nickname`, `gender`, `email`, `job_title`, `contact_no`, `mobile_no`, `status`, `created_date`, `modified_date`) VALUES
(720, 'JARABATA.ROLANDO', '3ICTS-ISDD', 'ROLANDO', 'JARABATA', 'BERNAL', NULL, '', 'GENDER_MALE', 'RGJarabata@neda.gov.ph', '', '', '', 'STATUS_ACTIVE', '2021-03-25 06:28:06', '2022-04-26 18:14:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hr_employees`
--
ALTER TABLE `hr_employees`
  ADD PRIMARY KEY (`employee_id`) USING BTREE;

--
-- Indexes for table `hr_emp_contacts`
--
ALTER TABLE `hr_emp_contacts`
  ADD PRIMARY KEY (`contact_type_id`,`employee_id`) USING BTREE;

--
-- Indexes for table `hr_emp_personal_info`
--
ALTER TABLE `hr_emp_personal_info`
  ADD PRIMARY KEY (`employee_id`) USING BTREE;

--
-- Indexes for table `hr_emp_work_experiences`
--
ALTER TABLE `hr_emp_work_experiences`
  ADD PRIMARY KEY (`emp_work_exp_id`) USING BTREE;

--
-- Indexes for table `hr_positions`
--
ALTER TABLE `hr_positions`
  ADD PRIMARY KEY (`position_id`) USING BTREE,
  ADD UNIQUE KEY `position_name_unique` (`position_name`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`org_code`) USING BTREE;

--
-- Indexes for table `param_agencies`
--
ALTER TABLE `param_agencies`
  ADD PRIMARY KEY (`agency_id`) USING BTREE;

--
-- Indexes for table `param_contact_types`
--
ALTER TABLE `param_contact_types`
  ADD PRIMARY KEY (`contact_type_id`) USING BTREE,
  ADD UNIQUE KEY `contact_type_name_UNIQUE` (`contact_type_name`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hr_employees`
--
ALTER TABLE `hr_employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=930;

--
-- AUTO_INCREMENT for table `hr_emp_work_experiences`
--
ALTER TABLE `hr_emp_work_experiences`
  MODIFY `emp_work_exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16922;

--
-- AUTO_INCREMENT for table `hr_positions`
--
ALTER TABLE `hr_positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `param_agencies`
--
ALTER TABLE `param_agencies`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `param_contact_types`
--
ALTER TABLE `param_contact_types`
  MODIFY `contact_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=982;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
