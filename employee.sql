-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 08:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `cat_level` int(11) NOT NULL,
  `parent_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `cat_level`, `parent_cat_id`) VALUES
(3, 'Manufacturing', 0, 0),
(4, 'Construction materials', 1, 3),
(5, 'Electronics and Optics', 1, 3),
(6, 'Food and Beverage', 1, 3),
(7, 'Bakery & confectionery product', 2, 6),
(8, 'Beverages', 2, 6),
(9, 'Fish & fish products', 2, 6),
(10, 'Meat & meat products', 2, 6),
(11, 'Milk & dairy products', 2, 6),
(12, 'Other', 2, 6),
(13, 'Sweets & snack food', 2, 6),
(14, 'Furniture', 1, 3),
(15, 'Bathroom/sauna', 2, 14),
(16, 'Bedroom', 2, 14),
(17, 'Children\'s room', 2, 14),
(18, 'Kitchen', 2, 14),
(19, 'Living room', 2, 14),
(20, 'Office', 2, 14),
(21, 'Office (Furniture)', 2, 14),
(22, 'Outdoor', 2, 14),
(23, 'Project furniture', 2, 14),
(24, 'Machinery', 1, 3),
(25, 'Machinery components', 2, 24),
(26, 'Machinery equipment/tools', 2, 24),
(27, 'Manufacture of machinery', 2, 24),
(28, 'Maritime', 2, 24),
(29, 'Aluminium and steel workboats', 3, 28),
(30, 'Boat/Yacht building', 3, 28),
(31, 'Ship repair and conversion', 3, 28),
(32, 'Metal structures', 2, 24),
(33, 'Other', 2, 24),
(34, 'Repair and maintenance service', 2, 24),
(35, 'Metalworking', 1, 3),
(36, 'Construction of metal structures', 2, 35),
(37, 'Houses and buildings', 2, 35),
(38, 'Metal products', 2, 35),
(39, 'Metal works', 2, 35),
(40, 'CNC-machining', 3, 39),
(41, 'Forgings, Fasteners', 3, 39),
(42, 'Gas, Plasma, Laser cutting', 3, 39),
(43, 'MIG, TIG, Aluminum welding', 3, 39),
(44, 'Plastic and Rubber', 1, 3),
(45, 'Packaging', 2, 44),
(46, 'Plastic goods', 2, 44),
(47, 'Plastic processing technology', 2, 44),
(48, 'Blowing', 3, 47),
(49, 'Moulding', 3, 47),
(50, 'Plastics welding and processing', 3, 47),
(51, 'Plastic profiles', 2, 44),
(52, 'Printing', 1, 3),
(53, 'Advertising', 2, 52),
(54, 'Book/Periodicals printing', 2, 52),
(55, 'Labelling and packaging printing', 2, 52),
(56, 'Textile and Clothing', 1, 3),
(57, 'Clothing', 2, 56),
(58, 'Textile', 2, 56),
(59, 'Wood', 1, 3),
(60, 'Other (Wood)', 2, 59),
(61, 'Wooden building materials', 2, 59),
(62, 'Wooden houses', 2, 59),
(63, 'Other', 0, 0),
(64, 'Creative industries', 1, 63),
(65, 'Energy technology', 1, 63),
(66, 'Environment', 1, 63),
(67, 'Service', 0, 0),
(68, 'Business services', 1, 67),
(69, 'Engineering', 1, 67),
(70, 'Information Technology and Telecommunications', 1, 67),
(71, 'Data processing, Web portals, E-marketing', 2, 70),
(72, 'Programming, Consultancy', 2, 70),
(73, 'Software, Hardware', 2, 70),
(74, 'Telecommunications', 2, 70),
(75, 'Tourism', 1, 67),
(76, 'Translation services', 1, 67),
(77, 'Transport and Logistics', 1, 67),
(78, 'Air', 2, 77),
(79, 'Rail', 2, 77),
(80, 'Road', 2, 77),
(81, 'Water', 2, 77);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` int(11) NOT NULL,
  `term` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `category`, `term`) VALUES
(10, 'Fahad', 15, 1),
(11, 'Fahad Ali', 3, 1),
(12, 'Abdur Rehman', 5, 1),
(13, 'Bilal Akbar', 3, 1),
(14, 'Ali 12', 3, 1),
(15, 'Zain', 7, 1),
(16, 'Zain Mubashir', 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cat_id` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_cat_id` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
