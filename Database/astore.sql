-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2023 at 11:18 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "00.00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astore`
--
CREATE DATABASE IF NOT EXISTS `astore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `astore`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(1, 1, 'Admin', 'Warinchamrap', '34190', 'Warin', 'Thailand', '0909184054'),
(5, 5, 'SURAKIAT TABLAKORN', 'That', '34190', 'Amphoe Warin Chamrap', 'ไทย', '0909184054'),
(6, 6, 'JE DI', 'That', '34190', 'Amphoe Warin Chamrap', 'ไทย', '0909184054'),
(8, 6, 'สุรเกียรติ', 'ธาตุ', '34190', 'วารินชำราบ', 'ไทย', '0909184055'),
(9, 7, 'Surakiat Tablakorn', 'ทวีชัยแมนชั่น 95, ทวีชัยแมนชั่น', '34190', 'วารินชำราบ', 'ไทย', '0909184054'),
(10, 8, 'Test 01', 'That, Taweechaimansion', '34190', 'Amphoe Warin Chamrap', 'ไทย', '0909184054'),
(12, 8, 'ที่อยู่ใหม่', 'ทวีชัยแมนชั่น 95, ทวีชัยแมนชั่น', '34190', 'กรุงเทพ', 'ไทย', '0909184054'),
(13, 9, 'SATAPORN', 'ทวีชัยแมนชั่น 95, ทวีชัยแมนชั่น', '34190', 'วารินชำราบ', 'ไทย', '0909184054');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'BLACKPINK', 'Blackpink is a South Korean girl group formed by YG Entertainment, consisting of members Jisoo, Jennie, Rosé, and Lisa. The group debuted in August 2016.', 'BLACKPINK', 'blackpink.png'),
(2, 'BTS - BANGTAN', 'BTS also known as the Bangtan is a South Korean boy band formed in 2010.', 'BTS-BANGTAN', 'bts.png'),
(3, 'TWICE', 'Twice (Korean: 트와이스; RR: Teuwaiseu; Japanese: トゥワイス, Hepburn: To~uwaisu; commonly stylized as TWICE) is a South Korean girl group formed by JYP Entertainment. The group is composed of nine members: Nayeon, Jeongyeon, Momo, Sana, Jihyo, Mina, Dahyun, Chaeyoung, and Tzuyu. Twice was formed under the television program Sixteen (2015) and debuted on October 20, 2015, with the extended play (EP) The Story Begins.', 'twice', 'twice.png'),
(4, 'Girl Generation', 'Girls\' Generation (Korean: 소녀시대; RR: Sonyeo Sidae), also known as SNSD, is a South Korean girl group formed by SM Entertainment. The group is composed of eight members: Taeyeon, Sunny, Tiffany, Hyoyeon, Yuri, Sooyoung, Yoona, and Seohyun. Originally a nine-piece ensemble, Jessica departed from the group in September 2014. Among the prominent South Korean figures and most popular K-pop groups worldwide, Girls\' Generation has earned numerous accolades and the honorific nickname \"The Nation\'s Girl Group\" in their home country.', 'grilgeneration', 'girlgeneration.png'),
(5, 'Seventeen', 'Seventeen (Korean: 세븐틴; stylized in all caps or as SVT) is a South Korean boy band formed by Pledis Entertainment. The group consists of thirteen members: S.Coups, Jeonghan, Joshua, Jun, Hoshi, Wonwoo, Woozi, DK, Mingyu, The8, Seungkwan, Vernon, and Dino.\r\n\r\nThe group debuted on May 26, 2015 with the extended play (EP) 17 Carat,[2] which became the longest-charting K-pop album of the year in the US[3] and the only rookie album to appear on Billboard\'s \"10 Best K-Pop Albums of 2015\" list.[4][5] Seventeen has released four studio albums, twelve EPs and three reissues.', 'seventeen', 'seventeen.png'),
(7, 'GOT7', 'Got7 (Korean: 갓세븐; commonly stylized in all caps) is a South Korean boy band formed by JYP Entertainment. The group is composed of seven members: Jay B, Mark, Jackson, Jinyoung, Youngjae, BamBam, and Yugyeom. Got7 debuted in January 2014 with the release of their first EP Got It?, which peaked at number two on the Gaon Album Chart and number one on Billboard\'s World Albums Chart. The group gained attention also for their live performances, which often include elements of martial arts tricking and street dancing.', 'got7', 'got7.png'),
(16, 'Stray kids', 'Stray Kids (Korean: 스트레이 키즈; RR: Seuteurei Kijeu; often abbreviated as SKZ) is a South Korean boy band formed by JYP Entertainment through the 2017 reality show of the same name. The group is composed of eight members: Bang Chan, Lee Know, Changbin, Hyunjin, Han, Felix, Seungmin, and I.N. Originally a nine-piece group, member Woojin left due to undisclosed personal reasons in October 2019.', 'Stray-kids', 'Stray-kids.png'),
(21, 'NCT127', 'NCT 127 (Korean: 엔시티 127; RR: ensiti il-i-chil) is the first fixed and second overall sub-unit of the South Korean boy band NCT, formed and managed by SM Entertainment. The current lineup consists of nine active members: Taeil, Johnny, Taeyong, Yuta, Doyoung, Jaehyun, Jungwoo, Mark, and Haechan.[3] NCT 127 are known for their experimental hip hop-based music, which they refer to as \"neo music\", while majority of their album tracks are R&B with pop and ballad. They are also noted for their vocal and rap abilities, as well as their choreographies and performances. After debuting in 2016, they broke into the domestic mainstream in 2017', 'NCT127', 'NCT127.png');

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`OrderID`, `ProductID`, `Quantity`, `Total`) VALUES
(13, 19, 1, '124.00'),
(13, 23, 2, '1200.00'),
(13, 24, 1, '450.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddressID`, `Discount`, `ShippingFee`, `Total`, `OrderDate`, `Status`) VALUES
(4, 5, 5, '0.00', '0.00', '690.00', '2023-01-06 13:47:06', 'Delivered'),
(5, 5, 5, '0.00', '0.00', '520.00', '2023-01-06 14:02:03', 'Order Received'),
(6, 5, 5, '0.00', '0.00', '830.00', '2023-01-06 14:02:32', 'Order Received'),
(7, 5, 5, '0.00', '0.00', '1870.00', '2023-01-06 14:10:58', 'Processed'),
(8, 5, 5, '0.00', '0.00', '1110.00', '2023-01-06 14:13:24', 'Order Received'),
(10, 5, 5, '1040.00', '0.00', '1040.00', '2023-01-19 11:25:37', 'Order Received'),
(11, 8, 10, '1350.00', '0.00', '1350.00', '2023-02-09 09:43:49', 'Delivered'),
(12, 8, 10, '1450.00', '0.00', '1450.00', '2023-02-09 09:52:27', 'Order Received'),
(13, 9, 13, '1774.00', '0.00', '1774.00', '2023-03-22 16:14:25', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`) VALUES
(19, 'BTS YOONGI Card', 2, '124.00', 4, 'พี่ก้าสุดน่ารัก', 1980, 'BTS-YOONGI-Card.png', 'BTS-YOONGI-Card'),
(20, 'BTS V Card', 2, '400.00', 3, 'วี แทยังการ์ดแรร์ๆ', 2021, 'BTS-V-Card.png', 'BTS-V-Card'),
(21, 'GOT7 BamBam Card', 7, '500.00', 3, 'bambam card', 2000, 'GOT7-BamBam-Card.png', 'GOT7-BamBam-Card'),
(22, 'GOT7 Jackson Card', 7, '250.00', 13, 'Jackson card', 2020, 'GOT7-Jackson-Card.png', 'GOT7-Jackson-Card'),
(23, 'BLACKPINK Rose Card', 1, '600.00', 5, 'Rose so cute card', 2022, 'BLACKPINK-Rose-Card.png', 'BLACKPINK-Rose-Card'),
(24, 'BLACKPINK Lisa Card', 1, '450.00', 5, 'Lisa card so cute', 2023, 'BLACKPINK-Lisa-Card.png', 'BLACKPINK-Lisa-Card'),
(26, 'SEVENTEEN SCOUP Card', 5, '120.00', 4, 'Scoup so cute card', 2022, 'SEVENTEEN-SCOUP-Card.png', 'SEVENTEEN-SCOUP-Card'),
(27, 'SEVENTEEN DK Card', 5, '200.00', 7, 'DK Card so cute', 2021, 'SEVENTEEN-DK-Card.png', 'SEVENTEEN-DK-Card'),
(28, 'SK Hyunjin Card', 16, '220.00', 7, 'การ์ดฮยอนจินน่ารักสุดๆ', 2022, 'SK-Hyunjin-Card.png', 'SK-Hyunjin-Card'),
(29, 'SK Felix Card', 16, '300.00', 13, 'น้องฟิลิกซ์น่ารักๆ', 2023, 'SK-Felix-Card.png', 'SK-Felix-Card'),
(30, 'NCT127 Haechan Card', 21, '400.00', 300, 'มักเน่ของ nct127 สุดน่ารัก', 2022, 'NCT127-Haechan-Card.png', 'NCT127-Haechan-Card'),
(32, 'NCT127 Mark Card', 21, '300.00', 8, 'mark card so cute', 2023, 'NCT127-Mark-Card.png', 'NCT127-Mark-Card'),
(33, 'GIRLGEN Yoona Card', 4, '220.00', 2, '>< yoona card', 2023, 'GIRLGEN-Yoona-Card.png', 'GIRLGEN-Yoona-Card'),
(36, 'TWICE Sana Card', 3, '300.00', 2, 'Sana // ><', 2023, 'TWICE-Sana-Card.png', 'TWICE-Sana-Card'),
(37, 'TWICE Jiwon Card', 3, '400.00', 9, 'jiwon so cute >>,//', 2023, 'TWICE-Jiwon-Card.png', 'TWICE-Jiwon-Card');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Admin', 'That', '34190', 'Warin', 'Thailand', '0909184054', 'admin@gmail.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1),
(5, 'SURAKIAT TABLAKORN', 'That', '34190', 'Amphoe Warin Chamrap', 'Thailand', '0909184054', 'mr.surakiat.ta.62@ubu.ac.th', 'jedi', '$2a$10$dx56jqxrAYMipSZxjDNEM.9Zn2ZFhbbGz4ddMMSas/dKwdEv4Mt8O', 1),
(6, 'JE DI', 'That', '34190', 'Amphoe Warin Chamrap', 'ไทย', '0909184054', 'test@ubu.ac.th', 'test', '$2a$10$cqfccOvWWjy3i7kzFQ.e8Oe4pywKSJQK7w7NR3En8BkuMWylwgROC', 0),
(7, 'Surakiat Tablakorn', 'ทวีชัยแมนชั่น 95, ทวีชัยแมนชั่น', '34190', 'วารินชำราบ', 'ไทย', '0909184054', 'surakiatlt@gmail.com', 'test01', '$2a$10$uCZyrDC89h5QpIi1nEu9Few42Yty6q6XsDYrIeME2ZfIQcdsfR1uC', 1),
(8, 'Test 03', 'That, Taweechaimansion', '34190', 'Amphoe Warin Chamrap', 'ไทย', '0909184054', 'test01@ubu.ac.th', 'test02', '$2a$10$V.2vj6.3v06yyPfCZvA7FubN1oijQDIMvRaxvcZCPon0Vv60MOe.i', 0),
(9, 'SATAPORN', 'ทวีชัยแมนชั่น 95, ทวีชัยแมนชั่น', '34190', 'วารินชำราบ', 'ไทย', '0909184054', 'sataporn@gmail.com', 'sataporn', '$2a$10$pofSCtug3jPbZ0kjg8BX4OjqF9xp6.AFUak5oMoFvWOrnZe7bIqwu', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
