-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2022 at 12:19 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gippm_db`
--

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
(67, 'simon', 'peter', 'male', 'Jinja', 'Eastern', '256394683230', 'kenyana', 'uhuru'),
(72, 'Howard', 'Stark', 'Male', 'Los Angeles', 'Central', '0788264514', 'howard', 'password');

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
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`customer_id`, `order_id`, `milk`, `butter`, `ghee`, `yoghurt`, `total`, `payment`, `status`, `date`) VALUES
(67, 40, 10500, 52000, 0, 40000, 102500, 'food', 'active', '2022-08-19 20:46:50'),
(67, 41, 1500, 13000, 6000, 2000, 22500, 'food', 'active', '2022-08-19 20:55:08'),
(67, 42, 12000, 104000, 48000, 16000, 180000, 'food', 'active', '2022-08-19 21:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `production_lines`
--

CREATE TABLE `production_lines` (
  `prdtn_line_id` int(3) NOT NULL,
  `prdtn_line_name` varchar(10) NOT NULL,
  `prdtn_size` int(100) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production_lines`
--

INSERT INTO `production_lines` (`prdtn_line_id`, `prdtn_line_name`, `prdtn_size`) VALUES
(0, 'unassigned', 0),
(1, 'short term', 1),
(2, 'mid term', 5),
(3, 'long term', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(4) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(10) NOT NULL,
  `productionline` int(3) NOT NULL,
  `stock` int(10) DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `sales` int(100) DEFAULT 0,
  `likes` int(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `productionline`, `stock`, `date_in`, `sales`, `likes`) VALUES
('g001', 'uht full cream milk', 1500, 1, 7971502, '2022-08-01', 61962000, 3),
('g002', 'yoghurt', 2000, 1, 8011567, '2022-08-01', 2486000, 3),
('g003', 'butter', 13000, 2, -8398663, '2022-08-16', 1166906120, 3),
('g004', 'ghee', 6000, 3, -8, '2022-08-16', 512766704, 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(8) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `allocation` int(3) NOT NULL DEFAULT 0,
  `password` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `allocation`, `password`) VALUES
('gippm001', 'head_shortstaff', 2, NULL),
('gippm002', 'head_midstaff', 2, NULL),
('gippm003', 'head_longstaff', 2, NULL),
('gippm239', 'david', 2, NULL),
('gippm453', 'florence', 2, NULL),
('gippm982', 'bob', 2, NULL),
('gippmx1', 'group23', 2, NULL);

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
  MODIFY `customer_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
