-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 05:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `coffeeshop`
--

CREATE TABLE `coffeeshop` (
  `shopID` int(11) NOT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `shop_phoneNr` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coffeeshop`
--

INSERT INTO `coffeeshop` (`shopID`, `address`, `shop_phoneNr`) VALUES
(1, '87A Cách Mạng Tháng Tám, Phường Bến Thành, Quận 1, Hồ Chí Minh', '(+84) (028) 3925 1845'),
(2, '603 Đ. Trần Hưng Đạo, Cầu Kho, Quận 1, Thành phố Hồ Chí Minh 700000', '(+84) (028)  3837 3229');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `customerName` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `customerPhoneNr` int(11) NOT NULL,
  `Birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `customerName`, `customerPhoneNr`, `Birthdate`) VALUES
(1, 'Tran Le Nghi', 35003344, '1999-01-04'),
(2, 'Nguyen Huu Nghia', 443876215, '2000-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `generalmanager`
--

CREATE TABLE `generalmanager` (
  `generalManagerID` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `phoneNr` int(11) NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `generalmanager`
--

INSERT INTO `generalmanager` (`generalManagerID`, `salary`, `phoneNr`, `password`, `name`) VALUES
(1, 20000000, 36456987, '123456', 'Nguyen Van Long'),
(2, 20000000, 36456745, '654321', 'Phan Linh');

-- --------------------------------------------------------

--
-- Table structure for table `generalpromotion`
--

CREATE TABLE `generalpromotion` (
  `generalPromoID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `productID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL,
  `generalManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `generalpromotion`
--

INSERT INTO `generalpromotion` (`generalPromoID`, `startDate`, `endDate`, `productID`, `shopID`, `generalManagerID`) VALUES
(1, '2021-01-09', '2021-01-15', 1, 2, 1),
(2, '2021-01-14', '2021-01-18', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `localmanager`
--

CREATE TABLE `localmanager` (
  `localManagerID` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `phoneNr` int(11) NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `shopID` int(11) NOT NULL,
  `generalManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `localmanager`
--

INSERT INTO `localmanager` (`localManagerID`, `salary`, `phoneNr`, `password`, `name`, `shopID`, `generalManagerID`) VALUES
(1, 15000000, 28974563, '123456', 'Tran Van Thinh', 1, 1),
(2, 15000000, 456123963, '654321zxc', 'Tran Trung Tin', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `localpromotion`
--

CREATE TABLE `localpromotion` (
  `localPromoID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `productID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL,
  `localManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `localpromotion`
--

INSERT INTO `localpromotion` (`localPromoID`, `startDate`, `endDate`, `productID`, `shopID`, `localManagerID`) VALUES
(1, '2021-01-15', '2021-01-30', 1, 2, 1),
(2, '2021-01-10', '2021-02-01', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `paymentAmount` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `saleStaffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `customerID`, `time`, `paymentAmount`, `paymentID`, `productID`, `saleStaffID`) VALUES
(1, 1, '2020-01-03 23:03:01', 2, 1, 1, 2),
(2, 2, '2020-12-11 23:03:01', 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `paymentMethod` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `customerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `paymentMethod`, `customerID`) VALUES
(1, 'Credit card', 1),
(2, 'Cash', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `quantityStock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `expireDate` date NOT NULL,
  `shopID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `quantityStock`, `price`, `expireDate`, `shopID`) VALUES
(1, 'Cà Phê Năng Lượng\r\n(sữa, đá)', 50, 49, '2021-01-31', 1),
(2, 'Latte Đá', 50, 49, '2021-01-31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL,
  `sales` varchar(300) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `period` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `localManagerID` int(11) NOT NULL,
  `generalManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`reportID`, `shopID`, `sales`, `period`, `localManagerID`, `generalManagerID`) VALUES
(1, 1, 'Latte Đá: 3500/5000\r\n', '1/12/2020 - 1/1/2021', 1, 1),
(2, 2, 'Cà Phê Năng Lượng (sữa, nóng): 2300/4000', '1/10/2020 - 1/1/2021', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salesstaff`
--

CREATE TABLE `salesstaff` (
  `saleStaffID` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `phoneNr` int(11) NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `shopID` int(11) NOT NULL,
  `localManagerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salesstaff`
--

INSERT INTO `salesstaff` (`saleStaffID`, `salary`, `phoneNr`, `password`, `name`, `shopID`, `localManagerID`) VALUES
(1, 5000000, 24567891, '123456', 'Le Van Quang', 1, 1),
(2, 5000000, 756123963, '654321zxc', 'Pham Phuoc ', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coffeeshop`
--
ALTER TABLE `coffeeshop`
  ADD PRIMARY KEY (`shopID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `generalmanager`
--
ALTER TABLE `generalmanager`
  ADD PRIMARY KEY (`generalManagerID`);

--
-- Indexes for table `generalpromotion`
--
ALTER TABLE `generalpromotion`
  ADD PRIMARY KEY (`generalPromoID`),
  ADD KEY `FK_GeneralPromotion_to_Product` (`productID`),
  ADD KEY `FK_GeneralPromotion_to_Coffeeshop` (`shopID`),
  ADD KEY `FK_GeneralPromotion_to_GeneralManager` (`generalManagerID`);

--
-- Indexes for table `localmanager`
--
ALTER TABLE `localmanager`
  ADD PRIMARY KEY (`localManagerID`),
  ADD KEY `FK_LocalManager_to_Coffeeshop` (`shopID`),
  ADD KEY `FK_LocalManager_to_GeneralManager` (`generalManagerID`);

--
-- Indexes for table `localpromotion`
--
ALTER TABLE `localpromotion`
  ADD PRIMARY KEY (`localPromoID`),
  ADD KEY `FK_Local promotion_to_Product` (`productID`),
  ADD KEY `FK_Localpromotion_to_CoffeeShop` (`shopID`),
  ADD KEY `FK_Localpromotion_to_LocalManager` (`localManagerID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Order_to_Customer` (`customerID`),
  ADD KEY `FK_Order_to_Payment` (`paymentID`),
  ADD KEY `FK_Order_to_Product` (`productID`),
  ADD KEY `FK_Order_to_SalesStaff` (`saleStaffID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `FK_Payment_to_Customer` (`customerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `FK_Product_to_CoffeeShop` (`shopID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `FK_Report_to_CoffeeShop` (`shopID`),
  ADD KEY `FK_Report_to_LocalManager` (`localManagerID`),
  ADD KEY `FK_Report_to_GeneralManager` (`generalManagerID`);

--
-- Indexes for table `salesstaff`
--
ALTER TABLE `salesstaff`
  ADD PRIMARY KEY (`saleStaffID`),
  ADD KEY `FK_Sales Staff_to_CoffeeShop` (`shopID`),
  ADD KEY `FK_Sales Staff_to_LocalManager` (`localManagerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coffeeshop`
--
ALTER TABLE `coffeeshop`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `generalmanager`
--
ALTER TABLE `generalmanager`
  MODIFY `generalManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `generalpromotion`
--
ALTER TABLE `generalpromotion`
  MODIFY `generalPromoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `localmanager`
--
ALTER TABLE `localmanager`
  MODIFY `localManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `localpromotion`
--
ALTER TABLE `localpromotion`
  MODIFY `localPromoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesstaff`
--
ALTER TABLE `salesstaff`
  MODIFY `saleStaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
