-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql5.freemysqlhosting.net
-- Generation Time: Aug 13, 2022 at 08:19 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql5512420`
--
CREATE DATABASE IF NOT EXISTS `sql5512420` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sql5512420`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(8) NOT NULL,
  `username` varchar(5) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
('gippmx1', 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(3) NOT NULL,
  `firstName` char(15) NOT NULL,
  `lastName` char(15) NOT NULL,
  `gender` char(8) NOT NULL,
  `address` char(20) NOT NULL,
  `region` char(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstName`, `lastName`, `gender`, `address`, `region`, `telephone`, `username`, `password`) VALUES
(65, 'Group 23', 'NAD', 'Male', 'COCIS', 'Central', '0777777777', 'name', 'password'),
(66, 'Peter', 'Emmanuel', 'Male', 'COCIS', 'Northern', '256888888', 'name', 'password'),
(67, 'simon', 'peter', 'male', 'Jinja', 'Eastern', '256394683230', 'kenyana', 'uhuru'),
(68, 'Jonathan', 'Gates', 'Male', 'Mbarara', 'Western', '256887993906', 'gates', 'foodgatesdfo9'),
(69, 'Akello', 'Jane', 'Female', 'Mukono', 'Northern', '0788432422', 'akello', 'ghw4o40320)@)'),
(70, 'Ivan', 'Makanga', 'Male', 'Kampala', 'Christian', '0784601961', 'Ivy', '21@Mcevans.c'),
(71, 'reg', 'rgt', 'mal', 'regt', 'eastern', 'rr', 'rey', 'pass'),
(72, 'peter', 'simon', 'male', 'kikoni', 'eastern', '25639874839', 'petersimon', 'kikule'),
(73, 'ipip', 'khll', 'kjnlk', 'khkhk', 'lknnml', 'lknl', 'lnl', 'lknn'),
(74, 'simon', 'peter', 'male', 'jinja', 'eastern', '256749384898', 'simonpeter', 'rubgur');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `customer_id` int(8) NOT NULL,
  `order_id` int(8) NOT NULL,
  `milk` int(8) DEFAULT NULL,
  `butter` int(8) DEFAULT NULL,
  `ghee` int(8) DEFAULT NULL,
  `yoghurt` int(8) DEFAULT NULL,
  `total` int(8) DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL,
  `status` char(10) DEFAULT 'active',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`customer_id`, `order_id`, `milk`, `butter`, `ghee`, `yoghurt`, `total`, `payment`, `status`, `date`) VALUES
(67, 1, 333000, 45942000, 1338000, 864000, 48477000, 'visa', 'active', '2022-08-10 09:06:04'),
(67, 2, 648000, 728000, 3990000, 0, 5366000, 'visa', 'active', '2022-08-10 09:22:21'),
(67, 3, 6000, 728000, 3990000, 0, 4724000, 'visa', 'active', '2022-08-10 09:25:51'),
(67, 4, 4500, 858000, 18000, 72000, 952500, 'visa', 'active', '2022-08-10 09:28:33'),
(67, 5, 5301000, 429000, 330000, 64000, 6124000, 'visa', 'active', '2022-08-10 09:30:01'),
(67, 6, 351000, 3276000, 1950000, 66000, 5643000, 'visa', 'active', '2022-08-10 09:32:03'),
(67, 7, 4500, 78000, 48000, 12000, 142500, 'visa', 'active', '2022-08-10 09:33:16'),
(67, 8, 52500, 0, 0, 0, 52500, 'visa', 'active', '2022-08-10 09:34:15'),
(67, 9, 5314500, 39000, 18000, 10000, 5381500, 'visa', 'active', '2022-08-10 09:35:48'),
(67, 10, 4500, 39000, 0, 0, 43500, 'visa', 'active', '2022-08-10 09:36:30'),
(67, 11, 6000, 416000, 12000, 4000, 438000, 'visa', 'active', '2022-08-10 09:37:35'),
(67, 12, 364500, 78000, 330000, 8000, 780500, 'visa', 'active', '2022-08-10 09:47:27'),
(67, 13, 52500, 455000, 0, 16000, 523500, 'visa', 'active', '2022-08-10 09:50:30'),
(67, 14, 36000, 312000, 12000, 48000, 408000, 'visa', 'active', '2022-08-10 09:56:08'),
(67, 15, 364500, 169000, 0, 156000, 689500, 'visa', 'active', '2022-08-10 09:58:50'),
(67, 16, 52500, 0, 0, 88000, 140500, 'visa', 'active', '2022-08-10 10:05:48'),
(67, 17, 6000, 715000, 12000, 126000, 859000, 'visa', 'active', '2022-08-10 10:07:41'),
(67, 18, 3648000, 728000, 3264000, 910000, 8550000, 'visa', 'active', '2022-08-10 10:08:56'),
(67, 19, 52500, 455000, 18000, 10000, 535500, 'visa', 'active', '2022-08-10 10:11:39'),
(67, 20, 7500, 65000, 0, 186000, 258500, 'visa', 'active', '2022-08-10 13:25:03'),
(67, 21, 5314500, 3016000, 2538000, 4846000, 15714500, 'visa', 'active', '2022-08-10 13:29:50'),
(67, 22, 531000, 8242000, 21204000, 7068000, 37045000, 'visa', 'active', '2022-08-10 13:56:05'),
(67, 23, 8154000, 4719000, 24000, 126906000, 139803000, 'visa', 'active', '2022-08-10 14:00:52'),
(67, 24, 0, 0, 0, 2000, 2000, 'visa', 'active', '2022-08-10 15:33:22'),
(67, 25, 0, 0, 0, 4000, 4000, 'visa', 'active', '2022-08-10 16:31:24'),
(67, 26, 3000, 0, 0, 0, 3000, 'visa', 'active', '2022-08-12 09:43:35'),
(67, 27, 3000, 0, 0, 0, 3000, 'visa', 'active', '2022-08-12 09:44:18'),
(67, 28, 3000, 0, 0, 0, 3000, 'visa', 'active', '2022-08-12 09:50:24'),
(67, 29, 3000, 0, 0, 0, 3000, 'visa', 'active', '2022-08-12 09:50:28'),
(67, 30, 0, 26000, 0, 8000, 34000, 'visa', 'active', '2022-08-12 11:20:53'),
(67, 31, 0, 13000, 0, 4000, 17000, 'visa', 'active', '2022-08-12 11:23:20'),
(67, 32, 0, 13000, 0, 4000, 17000, 'visa', 'active', '2022-08-12 12:52:51'),
(67, 33, 1500, 0, 0, 0, 1500, 'visa', 'active', '2022-08-12 13:19:48'),
(67, 34, 0, 0, 6000, 2444000, 2450000, NULL, 'active', '2022-08-12 15:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `production_lines`
--

CREATE TABLE `production_lines` (
  `prdtn_line_id` int(3) NOT NULL,
  `prdtn_line_name` varchar(10) NOT NULL,
  `prdtn_size` int(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production_lines`
--

INSERT INTO `production_lines` (`prdtn_line_id`, `prdtn_line_name`, `prdtn_size`) VALUES
(0, 'unassigned', 0),
(1, 'short term', 18),
(2, 'mid term', 16),
(3, 'long term', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(4) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_quantity` int(100) NOT NULL DEFAULT '0',
  `production line` int(3) NOT NULL,
  `productionline` int(3) NOT NULL,
  `stock` int(10) DEFAULT '0',
  `sales` int(100) DEFAULT '0',
  `likes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_quantity`, `production line`, `productionline`, `stock`, `sales`, `likes`) VALUES
('g001', 'uht full cream milk', 1500, 0, 0, 1, 10745, 13500, 1),
('g002', 'yoghurt', 2000, 0, 1, 1, 9520, 2464000, 1),
('g003', 'butter', 13000, 0, 2, 2, 2146, 52000, 1),
('g004', 'ghee', 6000, 0, 3, 3, 1074, 6000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(8) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `allocation` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `allocation`) VALUES
('g000', 'final_test1', 2),
('gippm001', 'andrew', 2),
('gippm002', 'john', 2),
('gippm003', 'jacob', 2),
('gippm006', 'fernando', 2),
('gippm008', 'timothy', 2),
('gippm009', 'jerome', 2),
('gippm023', 'fonaes', 2),
('gippm034', 'rw', 0),
('gippm082', 'yosiah', 0),
('gippm090', 'gregory', 2),
('gippm092', 'jones', 2),
('gippm345', 'jonah', 2),
('gippm349', 'zamba', 2),
('gippm456', 'gilbert', 2),
('gippm533', 'joshua', 0),
('gippm900', 'given', 2),
('gippm986', 'lord', 0),
('gippmx1', 'group23', 2),
('ii', 'iii', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `production_lines`
--
ALTER TABLE `production_lines`
  ADD PRIMARY KEY (`prdtn_line_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `production line` (`production line`),
  ADD KEY `productionline` (`productionline`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `allocation` (`allocation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productionline`) REFERENCES `production_lines` (`prdtn_line_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`allocation`) REFERENCES `production_lines` (`prdtn_line_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
