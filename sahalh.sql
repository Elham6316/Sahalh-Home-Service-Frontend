-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.htmlmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2025 at 05:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sahalh`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_ID` int(11) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_password` varchar(255) NOT NULL,
  `cust_phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_ID`, `cust_name`, `cust_email`, `cust_password`, `cust_phone`, `address`, `created_at`) VALUES
(1, 'محمد أحمد عبد الله', 'mohamed@example.com', '123456', '+966 50 123 4567', 'الرياض، حي العليا، شارع الملك فهد', '2025-07-11 02:05:58'),
(2, 'سارة خالد علي', 'sara@example.com', 'password123', '+966 53 789 0123', 'جدة، حي الروضة، شارع الأمير سلطان', '2025-07-11 02:05:58'),
(3, 'عبدالله سعيد القحطاني', 'abdullah@example.com', 'password321', '+966 50 321 9876', 'الدمام، حي الفيصلية، شارع الملك عبد الله', '2025-07-11 02:05:58'),
(4, 'فاطمة محمود حسن', 'fatima@example.com', '123password', '+966 56 555 4444', 'المدينة المنورة، حي العوالي، شارع الملك سعود', '2025-07-11 02:05:58'),
(5, 'ماجد عبدالله', 'majed90@gmail.com', '123456', '12345678', 'الرياض، حي العليا، شارع الملك خالد', '2025-07-11 03:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `req_ID` int(11) NOT NULL,
  `cust_ID` int(11) DEFAULT NULL,
  `cust_name` varchar(255) NOT NULL,
  `service_type_ID` int(11) DEFAULT NULL,
  `pro_ID` int(11) DEFAULT NULL,
  `cust_email` varchar(255) NOT NULL,
  `cust_phone` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `req_statu_ID` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`req_ID`, `cust_ID`, `cust_name`, `service_type_ID`, `pro_ID`, `cust_email`, `cust_phone`, `price`, `created_at`, `description`, `image_path`, `req_statu_ID`) VALUES
(9, 1, 'محمد أحمد عبد الله', 1, 2, 'mohamed@example.com', '', '300.00', '2023-06-15 10:30:00', 'إصلاحات كهربائية، تركيب وصيانة لوحات كهربائية', 'images/electric_service_1.jpg', 1),
(10, 2, 'سارة خالد علي', 2, 3, 'sara@example.com', '', '200.00', '2023-06-20 11:00:00', 'صيانة شبكات المياه، إصلاح تسريبات، تركيب أدوات صحية', 'images/plumbing_service_1.jpg', 2),
(11, 3, 'عبدالله سعيد القحطاني', 3, 4, 'abdullah@example.com', '', '350.00', '2023-06-25 09:15:00', 'صيانة المكيفات، تنظيف الفلاتر، شحن غاز التبريد', 'images/AC_service_1.jpg', 1),
(12, 4, 'فاطمة محمود حسن', 4, 5, 'fatima@example.com', '', '250.00', '2023-06-28 14:20:00', 'تركيب أنظمة أمنية، كاميرات مراقبة، أنظمة إنذار', 'images/security_service_1.jpg', 3),
(13, NULL, 'عبدالله', 1, 1, '123@gmail.com', '123123', '300.00', '2025-07-11 04:39:16', 'q', NULL, 1),
(14, 2, 'سارة خالد علي', 8, 8, 'sara@example.com', '+966 53 789 0123', '350.00', '2025-07-11 05:14:19', 'حدائق', NULL, 1),
(15, 2, 'سارة خالد علي', 3, 3, 'sara@example.com', '+966 53 789 0123', '350.00', '2025-07-11 05:24:28', 'ثلاجة', NULL, 1),
(16, 5, 'ماجد عبدالله', 5, 5, 'majed90@gmail.com', '12345678', '150.00', '2025-07-11 05:34:52', 'تنظيف عميق غرفة 5*5', NULL, 1),
(17, 5, 'ماجد عبدالله', 4, 4, 'majed90@gmail.com', '12345678', '250.00', '2025-07-11 05:39:14', 'cctv', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `req_statu`
--

CREATE TABLE `req_statu` (
  `req_statu_ID` int(11) NOT NULL,
  `status_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `req_statu`
--

INSERT INTO `req_statu` (`req_statu_ID`, `status_name`) VALUES
(1, 'مكتمل'),
(2, 'قيد المعالجة'),
(3, 'ملغي');

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `pro_ID` int(11) NOT NULL,
  `pro_name` varchar(100) NOT NULL,
  `pro_phone` varchar(20) NOT NULL,
  `service` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `statu` varchar(50) DEFAULT 'متاح',
  `service_type_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`pro_ID`, `pro_name`, `pro_phone`, `service`, `price`, `statu`, `service_type_ID`) VALUES
(1, 'شركة الكهرباء الوطنية', '0501234567', 'الكهرباء', '300.00', 'متاح', 1),
(2, 'شركة الصفا للسباكة', '0532345678', 'السباكة', '200.00', 'متاح', 2),
(3, 'شركة تكييف الرياض', '0543456789', 'تكييف وتبريد', '350.00', 'متاح', 3),
(4, 'شركة الأمانة للأنظمة الأمنية', '0554567890', 'الأمن و السلامة', '250.00', 'متاح', 4),
(5, 'شركة التنظيف الحديث', '0565678901', 'التنظيف', '150.00', 'متاح', 5),
(6, 'صالون الحلاقة الملكية', '0501234567', 'الحلاقة', '100.00', 'متاح', 6),
(7, 'شركة الدهان الحديث', '0532345678', 'الدهان والطلاء', '400.00', 'متاح', 7),
(8, 'شركة الحدائق الخضراء', '0543456789', 'الحدائق', '350.00', 'متاح', 8);

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `service_type_ID` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`service_type_ID`, `service_name`, `price`) VALUES
(1, 'الكهرباء', '300.00'),
(2, 'السباكة', '200.00'),
(3, 'تكييف وتبريد', '350.00'),
(4, 'الأمن و السلامة', '250.00'),
(5, 'التنظيف', '150.00'),
(6, 'الحلاقة', '100.00'),
(7, 'الدهان والطلاء', '400.00'),
(8, 'الحدائق', '250.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_ID`),
  ADD UNIQUE KEY `cust_email` (`cust_email`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`req_ID`);

--
-- Indexes for table `req_statu`
--
ALTER TABLE `req_statu`
  ADD PRIMARY KEY (`req_statu_ID`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`pro_ID`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`service_type_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `req_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `req_statu`
--
ALTER TABLE `req_statu`
  MODIFY `req_statu_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `pro_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `service_type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
