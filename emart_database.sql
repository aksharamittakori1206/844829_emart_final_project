-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 01:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emart`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(30) NOT NULL,
  `bill_id` int(20) NOT NULL,
  `item_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(801, 701, 201),
(802, 702, 201),
(805, 707, 201),
(806, 708, 202),
(807, 708, 203),
(808, 708, 201),
(809, 708, 201),
(810, 709, 201),
(811, 710, 203),
(812, 711, 203),
(813, 711, 201),
(814, 711, 202),
(815, 712, 202),
(816, 712, 201),
(817, 712, 203),
(818, 713, 203),
(819, 713, 205),
(820, 713, 206),
(821, 713, 202),
(822, 713, 204),
(823, 714, 201),
(824, 714, 202),
(825, 715, 202),
(826, 715, 201);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(20) NOT NULL,
  `bill_type` varchar(30) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remarks` varchar(100) NOT NULL,
  `bill_amount` int(20) NOT NULL,
  `buyer_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `bill_type`, `bill_date`, `bill_remarks`, `bill_amount`, `buyer_id`) VALUES
(701, 'debit', '2020-02-03', 'paid', 23000, 501),
(702, 'credit', '2020-02-03', 'paid', 23000, 501),
(707, 'debit', '2020-02-03', 'paid', 23000, 501),
(708, 'credit', '2020-03-07', 'paid', 82000, 501),
(709, 'debit', '2020-02-03', 'paid', 23000, 501),
(710, 'credit', '2020-03-07', 'paid', 40000, 501),
(711, 'credit', '2020-03-09', 'paid', 62000, 501),
(712, 'credit', '2020-03-11', 'paid', 62000, 501),
(713, 'credit', '2020-03-11', 'paid', 143200, 501),
(714, 'credit', '2020-03-13', 'paid', 22000, 501),
(715, 'credit', '2020-03-13', 'paid', 22000, 501);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_signup_table`
--

CREATE TABLE `buyer_signup_table` (
  `buyer_username` varchar(30) NOT NULL,
  `buyer_password` varchar(30) NOT NULL,
  `buyer_email` varchar(50) NOT NULL,
  `buyer_mobile` bigint(20) NOT NULL,
  `buyer_date` date NOT NULL,
  `buyer_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer_signup_table`
--

INSERT INTO `buyer_signup_table` (`buyer_username`, `buyer_password`, `buyer_email`, `buyer_mobile`, `buyer_date`, `buyer_id`) VALUES
('aksh', 'aksh', 'aksh@gmail.com', 12345678, '2020-02-11', 501),
('sneha', 'sneha', 'sne@gmail.com', 23456, '2020-03-02', 502),
('sweety', 'sweety', 'sweety@gmail.com', 6321456987, '2020-03-06', 507),
('akshara', 'akshara', 'Akshara.Mittakori@cognizant.com', 76542989876, '2020-03-21', 508),
('tinku', 'tinku', 'tinku@gmail.com', 76542989876, '2020-03-13', 509),
('a', 'a', 'Akshara.Mittakori@cognizant.com', 5, '2020-02-29', 510),
('nandu', 'nandu', 'nandu@gmail.com', 76542989876, '2020-03-13', 511),
('nandu', 'nandu', 'nandu@gmail.com', 76542989876, '2020-03-14', 512);

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_brief` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(401, 'Electronics', 'electronics like tv, mobiles,  gadgets'),
(402, 'Clothes', 'Womens , Mens and kids wear'),
(403, 'footwear', 'sports wear');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_image` varchar(300) NOT NULL,
  `item_price` int(20) NOT NULL,
  `item_stock` int(20) NOT NULL,
  `item_description` varchar(200) NOT NULL,
  `subcategory_id` int(20) NOT NULL,
  `item_remarks` varchar(200) NOT NULL,
  `seller_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remarks`, `seller_id`) VALUES
(201, 'samsung m30s', 'https://assets.mspimages.in/wp-content/uploads/2019/10/Samsung-Galaxy-M30s-Review-Header-696x464.jpg', 20000, 5, 'Samsung’s Galaxy M Series’ lineup of affordable, budget smartphones', 301, 'Samsung’s Galaxy M Series’ lineup of affordable, budget smartphones', 601),
(202, 'kurthi', 'https://images.shop101.com/i/4986800326.jpeg', 2000, 4, 'Cut Stitched Long Reyon Kurthi with navy blue and pale orange combination', 303, 'Cut Stitched Long Reyon Kurthi with navy blue and pale orange combination', 602),
(203, 'lenovo ideapad', 'https://images-na.ssl-images-amazon.com/images/I/81z5-EY9T3L._SL1500_.jpg', 40000, 3, 'Lenovo Ideapad S145 Intel Core I3 8th Gen 15.6-inch HD Thin and Light Laptop ', 301, 'Lenovo Ideapad S145 Intel Core I3 8th Gen 15.6-inch HD Thin and Light Laptop ', 602),
(204, 'shoes', 'https://images.ctfassets.net/od02wyo8cgm5/vjfq6gVmJQ2arZFM1Mxr7/0c090d6927856fe9d18c46deaf0d5d9f/cloudswift-fw19-rock_slate-m-d.png', 1200, 3, 'Cloudswift-Road shoe for urban Running', 302, 'Cloudswift-Road shoe for urban Running', 601),
(205, 'Watch', 'https://cdn.shopify.com/s/files/1/0253/0672/6484/products/752023749004_500x.png?v=1578779012', 50000, 5, 'Digital black coloured Wrist Watch, International', 301, 'Digital black coloured Wrist Watch, International', 602),
(206, 'iphone x', 'https://cf.shopee.ph/file/abaabf21cee77f24e37ffd5af42d6445', 50000, 4, '\r\nShopee\r\niPhone X Dark Screen Non-Working Fake Dummy Display Model', 301, '\r\nShopee\r\niPhone X Dark Screen Non-Working Fake Dummy Display Model', 601),
(207, 'Party wear', 'https://5.imimg.com/data5/UT/RS/MY-19885899/beautiful-designer-organza-kids-party-wear-gown-500x500.jpg', 3000, 6, 'Party Wear Dresses for Girls | Designer Kids Party Dresses', 303, 'Party Wear Dresses for Girls | Designer Kids Party Dresses ', 601),
(208, 'Washing Machine', 'https://media3.bsh-group.com/Images/400x/MCMI02620363_Laundry_Mobile_StageBanner_2.jpg', 35000, 5, 'Washing machines for expert textile care | Siemens Home', 304, 'Washing machines for expert textile care | Siemens Home', 601),
(209, 'Sandals', 'https://www.dhresource.com/0x0/f2/albu/g2/M00/72/25/rBVaGlXQOviAYu6WAAFz1fm0mXw076.jpg', 1200, 8, 'Girls Sandals Shoes Cross Lace Up Beading Children Kids Girl Slip On Party Dance For Dress ', 302, 'Girls Sandals Shoes Cross Lace Up Beading Children Kids Girl Slip On Party Dance For Dress ', 601);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(20) NOT NULL,
  `seller_username` varchar(30) NOT NULL,
  `seller_password` varchar(30) NOT NULL,
  `seller_company` varchar(50) NOT NULL,
  `seller_brief` varchar(50) NOT NULL,
  `seller_gst` int(20) NOT NULL,
  `seller_address` varchar(40) NOT NULL,
  `seller_email` varchar(30) NOT NULL,
  `seller_contact` bigint(20) NOT NULL,
  `seller_website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `seller_username`, `seller_password`, `seller_company`, `seller_brief`, `seller_gst`, `seller_address`, `seller_email`, `seller_contact`, `seller_website`) VALUES
(601, 'akshara', 'akshara', 'akshu', 'good', 4, 'hyderabad', 'aksh@gmail.com', 9396217409, 'abc'),
(602, 'sneha', 'sneha', 'sne', 'good', 2, 'hyderabad', 'aksh', 6301837709, 'xyz'),
(604, 'a', 'a', 'a', 'a', 2, 'a', 'a', 9876543212, ''),
(605, 'sweety', 'sweety', 'abc', 'good', 3, 'chennai', 'abc@gmail.com', 9632145874, ''),
(606, 'frooty', 'frooty', 'xyz', 'good', 3, 'hyderabad', 'xyz@gmail.com', 6321456987, ''),
(608, 'tinku', 'tinku', 'akshu', 'good', 4, 'hyderabad', 'aksh@gmail.com', 9396217409, 'abc'),
(612, 'nandu', 'nandu', 'abc', 'good', 3, 'chennai', 'nandu@gmail.com', 7894561236, '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `subcategory_id` int(20) NOT NULL,
  `subcategory_name` varchar(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `subcategory_brief` varchar(50) NOT NULL,
  `subcategory_gst` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(301, 'Phones', 401, 'smart phones, tabs etc', 5),
(302, 'footwear', 403, 'formal shoes', 5),
(303, 'Dresses', 402, 'Formal and party women wear', 5),
(304, 'Electronics', 401, 'washingmachine,fridge', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_details_table_ibfk_1` (`bill_id`),
  ADD KEY `bill_details_table_ibfk_2` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_table_ibfk_1` (`subcategory_id`),
  ADD KEY `item_table_ibfk_2` (`seller_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `sub_category_table_ibfk_1` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=827;

--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;

--
-- AUTO_INCREMENT for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  MODIFY `buyer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  MODIFY `subcategory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_signup_table` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category_table` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
