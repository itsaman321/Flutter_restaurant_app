-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2021 at 11:56 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16724714_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `categoryname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryname`, `imageurl`) VALUES
('c1', 'Italian', 'https://pics.freeicons.io/uploads/icons/png/5192140361604779597-512.png'),
('c2', 'Chinese', 'https://www.logopik.com/wp-content/uploads/edd/2018/08/Chinese-Food-Logo.png'),
('c3', 'Indian', 'https://cdn1.iconfinder.com/data/icons/food-fruits-vegetables-1/100/95-512.png'),
('c4', 'Russian', 'https://st2.depositphotos.com/21175540/45102/v/380/depositphotos_451023542-stock-illustration-pirozhki-russian-little-stuffed-pies.jpg'),
('c5', 'American', 'https://previews.123rf.com/images/sonulkaster/sonulkaster1707/sonulkaster170700510/82258601-american-fast-food-symbols-for-usa-america-travel-tourist-attractions-vector-icon.jpg'),
('c6', 'Australian', 'https://cdn3.iconfinder.com/data/icons/australian/100/Australia_Australian_Sydney_Summer_Queensland-53-512.png'),
('c7', 'rajasthani', 'https://thumbs.dreamstime.com/b/rajasthani-rabari-man-close-up-portrait-150575235.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `imageurl` varchar(250) NOT NULL,
  `price` varchar(50) NOT NULL,
  `todayspecial` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `categoryid` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `title`, `description`, `imageurl`, `price`, `todayspecial`, `bestseller`, `categoryid`) VALUES
('f1', 'Pizza', '', 'https://media01.stockfood.com/previews/MTMzOTk5OTIw/11166660.jpg', '120', 1, 0, 'c1'),
('f2', 'Spaghetti', 'Spaghetti with Tomato Sauce', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg', '50', 0, 1, 'c2'),
('f3', 'Toast Hawaii', '', 'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg', '30', 1, 1, 'c1'),
('f4', 'Classic Hamburger', '', 'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg', '100', 1, 1, 'c4'),
('f5', 'chowmein', 'sds', 'https://greenbowl2soul.com/wp-content/uploads/2019/11/veg-chowmein.jpg', '30', 1, 1, 'c3'),
('t6', 'Chole Bhature', 'cxvc', 'https://img-global.cpcdn.com/recipes/f449da8de2696daf/751x532cq70/chole-bhature-recipe-main-photo.jpg', '25', 1, 0, 'c5');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `tableid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ordertime` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `prodid` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `tableid`, `amount`, `ordertime`, `prodid`) VALUES
('d53a88c0-b4dc-11eb-9b41-5d9e08aff5a1', '', '150.0', '2021-05-14 23:20:12.816444', 'f1'),
('d53a88c0-b4dc-11eb-9b41-5d9e08aff5a1', '', '150.0', '2021-05-14 23:20:12.816444', 'f3'),
('30bb1070-b4dd-11eb-b0c5-7baaccca186a', '', '150.0', '2021-05-14 23:22:46.333482', 'f1'),
('30bb1070-b4dd-11eb-b0c5-7baaccca186a', '', '150.0', '2021-05-14 23:22:46.333482', 'f3'),
('848653e0-b4dd-11eb-8297-99f6c955365c', '', '150.0', '2021-05-14 23:25:06.913014', 'f1'),
('848653e0-b4dd-11eb-8297-99f6c955365c', '', '150.0', '2021-05-14 23:25:06.913014', 'f3'),
('0c340200-b59d-11eb-84d8-095beed02a50', '', '150.0', '2021-05-15 22:16:08.419638', 'f1'),
('0c340200-b59d-11eb-84d8-095beed02a50', '', '150.0', '2021-05-15 22:16:08.419638', 'f3'),
('008250e0-b59f-11eb-8cb6-1d85efe9e3d3', '', '340.0', '2021-05-15 22:30:07.794596', 'f1'),
('008250e0-b59f-11eb-8cb6-1d85efe9e3d3', '', '340.0', '2021-05-15 22:30:07.794596', 'f4'),
('9c03b820-bbbb-11eb-ab5e-ed60973ed5b6', '', '150.0', '2021-05-23 17:10:01.571058', 'f1'),
('9c03b820-bbbb-11eb-ab5e-ed60973ed5b6', '', '150.0', '2021-05-23 17:10:01.571058', 'f3'),
('9c6279f0-bbbb-11eb-ab5e-ed60973ed5b6', '', '150.0', '2021-05-23 17:10:02.191589', 'f1'),
('9c6279f0-bbbb-11eb-ab5e-ed60973ed5b6', '', '150.0', '2021-05-23 17:10:02.191589', 'f3');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` varchar(50) NOT NULL,
  `tablename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `tablename`) VALUES
('t1', 'Table 1'),
('t2', 'Table 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
