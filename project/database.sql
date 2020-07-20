-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2020 at 03:44 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ceciliachengdb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Turn Trash` ()  NO SQL
Update donations set donations.Donation_Status="Trashed" WHERE
donations.Expired_Date<CURRENT_TIMESTAMP$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `big_category`
--

CREATE TABLE `big_category` (
  `Id` int(8) NOT NULL,
  `Category_Name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `big_category`
--

INSERT INTO `big_category` (`Id`, `Category_Name`) VALUES
(5, 'Meat'),
(4, 'Milk'),
(1, 'Rice'),
(2, 'Snacks'),
(3, 'SoftDrink'),
(6, 'Vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Branch_Name` char(50) NOT NULL,
  `Donor_Id` int(5) NOT NULL,
  `Number` int(4) DEFAULT NULL COMMENT 'street number\r\n',
  `SName` char(50) DEFAULT NULL COMMENT 'street name',
  `Suburb` char(50) DEFAULT NULL,
  `Pcode` char(4) DEFAULT NULL COMMENT 'Postcode'
) ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Branch_Name`, `Donor_Id`, `Number`, `SName`, `Suburb`, `Pcode`) VALUES
('Brisbane City Shop', 10, 110, 'Edward Street', 'Brisbane City', '4000'),
('DFO Brisbane Shop', 10, 3, 'Edward Street', 'Brisbane City', '4000'),
('KFC Centenary: Delivery & Drive Thru', 11, 171, 'Dandenong Rd', 'Mount Ommaney', '4074'),
('KFC Runaway Bay: Delivery & Drive Thru', 11, 151, 'Morala Ave', 'Runway Bay', '4267'),
('Toohey Shop', 10, 655, 'Toohey Rd', 'Salisbury', '4107');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Description_Product` varchar(255) NOT NULL,
  `Category_Name` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Description_Product`, `Category_Name`) VALUES
('Don Footy Frankfurts Skinless 600g', 'Meat'),
('Woolworths Beef Mince 500g', 'Meat'),
('Devondale 100% Pure Full Cream Long Life Milk 2L', 'Milk'),
('Woolworths Uht Full Cream Milk 1L', 'Milk'),
('Sunrise medium grain rice 10 KG', 'Rice'),
('Welch\'s Mixed Fruit Snacks 160g', 'Snacks'),
('Woolworths Soya Crisps Snacks 400g pack', 'Snacks'),
('Coca-Cola Classic 2L', 'SoftDrink'),
('Schweppes Lemonade 1.1L', 'SoftDrink'),
('Birds Eye Country Harvest Mixed Vegetables Carrot Cauliflower & Broccoli 1kg', 'Vegetables'),
('Woolworths Carrots Peas & Corn 1kg', 'Vegetables');

-- --------------------------------------------------------

--
-- Stand-in structure for view `category_all`
-- (See below for the actual view)
--
CREATE TABLE `category_all` (
`Id` int(8)
,`Category_Name` char(50)
,`Description_Product` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `collect`
--

CREATE TABLE `collect` (
  `Id` int(4) NOT NULL,
  `Donation_Id` int(8) NOT NULL,
  `Role` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collect`
--

INSERT INTO `collect` (`Id`, `Donation_Id`, `Role`) VALUES
(4, 2, 'Driver'),
(4, 8, 'Driver'),
(5, 3, 'Coordinator'),
(5, 6, 'Coordinator'),
(7, 1, 'Driver'),
(7, 2, 'Driver');

-- --------------------------------------------------------

--
-- Table structure for table `collection_centre`
--

CREATE TABLE `collection_centre` (
  `Centre_Id` int(3) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Number` int(10) NOT NULL,
  `SName` char(50) NOT NULL,
  `Pcode` char(4) NOT NULL,
  `Subrub` char(50) NOT NULL,
  `Operating_Hour_Start` time NOT NULL,
  `Operating_Hours_End` time NOT NULL,
  `Phone_Number` char(10) NOT NULL,
  `Id` int(4) NOT NULL,
  `password` char(50) NOT NULL
) ;

--
-- Dumping data for table `collection_centre`
--

INSERT INTO `collection_centre` (`Centre_Id`, `Name`, `Number`, `SName`, `Pcode`, `Subrub`, `Operating_Hour_Start`, `Operating_Hours_End`, `Phone_Number`, `Id`, `password`) VALUES
(2, 'Foodbank Queensland', 179, 'Beverley Street', '4171', 'Morningside', '09:00:00', '18:00:00', '0733953422', 1, '12345678'),
(3, 'Brisbane Relief Hub\r\n', 316, 'St Pauls Terrace', '4006', 'Fortitude Valley', '09:00:00', '15:30:00', '0422133333', 1, '43939349'),
(4, 'Ramero Centre', 8, 'Dutton Street', '4102', 'Dutton Park', '09:00:00', '16:00:00', '0730130100', 4, '39294849'),
(5, 'West End Community House', 4, 'Norfolk Rd', '4101', 'South Brisbane', '09:00:00', '15:30:00', '0732172333', 5, '93929393'),
(6, 'Metro Community Hub\r\n', 22, 'Qualtrough St', '4102', 'Woolloongabba', '08:00:00', '14:00:00', '0733918122', 6, '93929594');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Donor_Id` int(5) NOT NULL,
  `Person_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Donor_Id`, `Person_Name`) VALUES
(10, 'Jenny Chan'),
(11, 'Ann Lau'),
(12, 'Sunny Elizabeth'),
(13, 'Mary Tong'),
(16, 'Juzzie Mak');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `Donation_Id` int(8) NOT NULL,
  `Delivered_Day` date NOT NULL DEFAULT current_timestamp(),
  `Created_Day` date NOT NULL DEFAULT current_timestamp(),
  `Description_Product` varchar(255) NOT NULL,
  `Weight` double NOT NULL COMMENT 'kg',
  `Expired_Date` date NOT NULL,
  `Donation_Status` enum('Active','Trashed','Inactive') NOT NULL DEFAULT 'Active',
  `Donor_Id` int(5) NOT NULL,
  `Delivery_Mode` enum('Donor_Delivered','FoodBank_Delivered','Third_Party_Delivered') NOT NULL
) ;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`Donation_Id`, `Delivered_Day`, `Created_Day`, `Description_Product`, `Weight`, `Expired_Date`, `Donation_Status`, `Donor_Id`, `Delivery_Mode`) VALUES
(1, '2020-04-16', '2020-04-08', 'Sunrise medium grain rice 10 KG', 999, '2020-08-15', 'Active', 5, 'Third_Party_Delivered'),
(2, '2020-04-13', '2020-04-13', 'Birds Eye Country Harvest Mixed Vegetables Carrot Cauliflower & Broccoli 1kg', 100, '2020-07-10', 'Active', 11, 'Donor_Delivered'),
(3, '2020-04-30', '2020-04-13', 'Coca-Cola Classic 2L', 200, '2021-09-01', 'Active', 10, 'Donor_Delivered'),
(4, '2020-04-13', '2020-04-13', 'Woolworths Beef Mince 500g', 50, '2020-09-30', 'Active', 5, 'Third_Party_Delivered'),
(5, '2020-04-13', '2020-04-13', 'Welch\'s Mixed Fruit Snacks 160g', 10, '2020-08-31', 'Inactive', 7, ''),
(6, '2020-04-13', '2020-04-13', 'Don Footy Frankfurts Skinless 600g', 10, '2021-06-01', 'Active', 10, 'Third_Party_Delivered'),
(7, '2020-04-13', '2020-04-13', 'Sunrise medium grain rice 10 KG', 100, '2020-06-12', 'Trashed', 14, ''),
(8, '2020-04-13', '2020-04-13', 'Woolworths Uht Full Cream Milk 1L', 30, '2020-09-24', 'Active', 15, 'Third_Party_Delivered'),
(9, '2020-06-02', '2020-06-02', 'Woolworths Carrots Peas & Corn 1kg', 500, '2021-02-19', 'Active', 5, 'Donor_Delivered'),
(10, '2020-05-11', '2020-05-11', 'Woolworths Carrots Peas & Corn 1kg', 43.23, '2020-12-04', 'Active', 5, ''),
(22, '2020-06-03', '2020-06-03', 'Don Footy Frankfurts Skinless 600g', 500, '2020-08-07', 'Inactive', 11, 'Third_Party_Delivered'),
(23, '2020-05-12', '2020-05-12', 'Don Footy Frankfurts Skinless 600g', 500, '2020-06-21', 'Active', 11, 'Third_Party_Delivered'),
(24, '2020-05-12', '2020-05-12', 'Woolworths Carrots Peas & Corn 1kg', 50, '2020-07-17', 'Active', 5, ''),
(25, '2020-06-03', '2020-06-03', 'Schweppes Lemonade 1.1L', 500, '2020-10-16', 'Inactive', 7, 'Donor_Delivered'),
(26, '2020-05-20', '2020-05-20', 'Schweppes Lemonade 1.1L', 500, '2020-12-20', 'Active', 7, 'Donor_Delivered'),
(27, '2020-06-03', '2020-06-03', 'Devondale 100% Pure Full Cream Long Life Milk 2L', 500, '2020-09-25', 'Active', 11, 'Third_Party_Delivered'),
(28, '2020-05-23', '2020-05-22', 'Schweppes Lemonade 1.1L', 500, '2020-06-14', 'Trashed', 7, ''),
(29, '2020-05-23', '2020-05-14', 'Devondale 100% Pure Full Cream Long Life Milk 2L', 500, '2020-11-13', 'Active', 19, 'Donor_Delivered'),
(30, '2020-06-05', '2020-05-31', 'Woolworths Uht Full Cream Milk 1L', 300, '2020-11-28', 'Active', 5, 'Donor_Delivered'),
(31, '2020-07-11', '2020-05-31', 'Woolworths Uht Full Cream Milk 1L', 500, '2020-08-15', 'Active', 5, ''),
(32, '2020-06-20', '2020-05-31', 'Devondale 100% Pure Full Cream Long Life Milk 2L', 500, '2020-12-05', 'Active', 5, 'FoodBank_Delivered'),
(33, '2020-08-15', '2020-05-31', 'Welch\'s Mixed Fruit Snacks 160g', 400, '2020-09-12', 'Active', 5, 'Donor_Delivered'),
(34, '2020-07-30', '2020-05-31', 'Don Footy Frankfurts Skinless 600g', 300, '2020-10-31', 'Active', 5, 'FoodBank_Delivered'),
(35, '2020-06-17', '2020-06-01', 'Devondale 100% Pure Full Cream Long Life Milk 2L', 300, '2021-03-26', 'Active', 5, 'FoodBank_Delivered'),
(36, '2020-06-10', '2020-06-01', 'Woolworths Uht Full Cream Milk 1L', 430, '2020-07-31', 'Active', 6, 'FoodBank_Delivered'),
(37, '2020-06-05', '2020-06-01', 'Woolworths Uht Full Cream Milk 1L', 10, '2020-06-18', 'Active', 10, 'FoodBank_Delivered'),
(38, '2020-06-11', '2020-06-01', 'Devondale 100% Pure Full Cream Long Life Milk 2L', 300, '2020-09-18', 'Active', 7, 'FoodBank_Delivered'),
(39, '2020-06-06', '2020-06-03', 'Don Footy Frankfurts Skinless 600g', 30, '2020-06-25', 'Active', 5, 'Donor_Delivered'),
(40, '2020-06-13', '2020-06-13', 'Woolworths Soya Crisps Snacks 400g pack', 10, '2020-08-22', 'Active', 5, 'FoodBank_Delivered'),
(41, '2020-06-18', '2020-06-13', 'Woolworths Beef Mince 500g', 46, '2020-09-11', 'Active', 5, 'FoodBank_Delivered');

--
-- Triggers `donations`
--
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `donations` FOR EACH ROW Delete from inventory_remain where inventory_remain.Donation_Id IN (select donation_Id from donations where Donation_Status="Trashed")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_row` AFTER INSERT ON `donations` FOR EACH ROW begin
 insert into inventory_remain
 (Donation_Id,R_Weight)
 values
 (new.Donation_Id,new.Weight);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `Donor_id` int(5) NOT NULL COMMENT 'Computer-Generated index, Primary Key',
  `Name` varchar(255) NOT NULL COMMENT 'Name of the Donor',
  `Phone_Number` char(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Number` int(4) NOT NULL COMMENT 'Street Number\r\n',
  `SName` char(50) NOT NULL COMMENT 'Street Name\r\n',
  `Suburb` char(50) NOT NULL,
  `Pcode` char(4) NOT NULL COMMENT 'Postcode\r\n'
) ;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`Donor_id`, `Name`, `Phone_Number`, `Email`, `Number`, `SName`, `Suburb`, `Pcode`) VALUES
(5, 'Cecilia Ng', '0123456789', 'ceciliacheneg@gmail.com', 12, 'Merivale Street', 'South Brisbane', '4101'),
(6, 'Richard Ng', '0992212124', 'richarfdg@gmail.com', 41, 'Peel Streets', 'South Brisbane', '4102'),
(7, 'Richard Ng', '0322210221', 'richardng123@gmail.com', 40, 'Sherwood Road', 'Toowong', '4066'),
(10, 'Subway', '0800630355', 'PublicRelationsANZ@subway.com', 41, 'Amelia Street', 'Fortitude Valley', '4006'),
(11, 'KFC', '0732214734', 'kfc@outlook.com', 259, 'Queen Street', 'Brisbane City', '4000'),
(12, 'Sun Rice', '0954333333', 'sunrice@gmail.com', 100, 'Edward Street', 'Brisbane City', '4000'),
(13, 'Aldi', '0959333339', 'aldi@gmail.com', 68, 'Kremzow Rd', 'Brendale', '4500'),
(14, 'Betty Acker', '0959333394', 'bettyacker3@gmail.com', 18, 'Kremzow Rd', 'Brendale', '4500'),
(15, 'Billy Alby', '0859333394', 'billylalby3@gmail.com', 92, 'Rock Street', 'St Lucia', '4066'),
(16, 'Juzzy Snacks', '0438282843', 'snackenquiry@gmail.com', 58, 'Mollison St', 'South Brisbane', '4101'),
(17, 'Wing Sze Sze', '0432333232', 'wschemfs@gmail.com', 32, 'John Street', 'Garden City', '4301'),
(18, 'Wing Sze e', '0122332939', 'wssdfsdfsf@gmail.com', 14, 'John Street', 'South Bank', '4042'),
(19, 'Wing Szd Cheng', '0129292929', 'qwewe@connect.ust.hk', 12, 'Rock Street', 'Garden City', '4067'),
(20, 'Wing SdCheng', '0122222222', 'cdagae@connect.ust.hk', 123, 'Hello Street', 'CBD', '4001'),
(21, 'Wing Sze Cung', '0122222224', 'wdedede@connect.ust.hk', 243, 'Bye Street', 'South Bank', '9329'),
(22, 'Wing Sze Ch2', '0123232232', '32323@connect.ust.hk', 120, 'Merivale Street', 'South Bank', '4101'),
(23, 'Wing Sze', '0232323323', 'wschdae@connect.ust.hk', 123, 'Hello Street', 'South Bank', '4001'),
(25, 'Wing Sze', '0232323322', 'wschd32e@connect.ust.hk', 0, 'Hello Street', 'South Bank', '4001');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Id` int(4) NOT NULL,
  `Entering_Date` date NOT NULL,
  `Salary` double NOT NULL,
  `Education_Level` enum('Certificates I-IV','Diploma, Advanced diploma, Associate degree','Bachelor degree and honours','Graduate Certificate and Graduate Diploma','Masters degree','Doctoral degree') NOT NULL,
  `Title` char(50) NOT NULL,
  `Department` enum('Human Resources Department','Logistics and Supply Chain Department','Risk Management Department','IT department','Operation Department') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Id`, `Entering_Date`, `Salary`, `Education_Level`, `Title`, `Department`) VALUES
(1, '2018-01-04', 3200, 'Diploma, Advanced diploma, Associate degree', 'Secretary', 'Operation Department'),
(4, '2020-03-10', 4000, 'Bachelor degree and honours', 'Manager', 'IT department'),
(5, '2010-10-22', 3300, 'Bachelor degree and honours', 'Manager', 'Risk Management Department'),
(6, '2020-01-03', 2300, 'Bachelor degree and honours', 'Graduate Intern', 'Human Resources Department'),
(7, '2003-11-13', 100000, 'Masters degree', 'Director', 'Logistics and Supply Chain Department'),
(11, '2020-05-14', 3220, 'Bachelor degree and honours', 'Secretary', 'Human Resources Department'),
(12, '2020-05-01', 3600, 'Certificates I-IV', 'Assistant', 'Human Resources Department'),
(14, '2020-06-01', 2300, 'Certificates I-IV', 'Director', 'Risk Management Department'),
(49, '2020-04-30', 3299, 'Graduate Certificate and Graduate Diploma', 'Employee', 'Logistics and Supply Chain Department'),
(50, '2020-06-11', 3200, 'Diploma, Advanced diploma, Associate degree', 'Assistant', 'Human Resources Department'),
(54, '2020-04-29', 12000, 'Masters degree', 'Secretary', 'Human Resources Department'),
(65, '2020-05-06', 5420, 'Bachelor degree and honours', 'Secretary', 'Human Resources Department'),
(66, '2020-05-21', 3200, 'Diploma, Advanced diploma, Associate degree', 'Secretary', 'Human Resources Department'),
(67, '2020-05-06', 213231, 'Graduate Certificate and Graduate Diploma', 'Assistant', 'Human Resources Department'),
(68, '2020-05-31', 34000, 'Diploma, Advanced diploma, Associate degree', 'Secretary', 'Risk Management Department');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_join`
-- (See below for the actual view)
--
CREATE TABLE `employee_join` (
`Id` int(4)
,`Name` varchar(255)
,`Email` varchar(255)
,`Phone_Number` char(10)
,`Entering_Date` date
,`Salary` double
,`Education_Level` enum('Certificates I-IV','Diploma, Advanced diploma, Associate degree','Bachelor degree and honours','Graduate Certificate and Graduate Diploma','Masters degree','Doctoral degree')
,`Title` char(50)
,`Department` enum('Human Resources Department','Logistics and Supply Chain Department','Risk Management Department','IT department','Operation Department')
);

-- --------------------------------------------------------

--
-- Table structure for table `human_resource`
--

CREATE TABLE `human_resource` (
  `Id` int(4) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone_Number` char(10) NOT NULL
) ;

--
-- Dumping data for table `human_resource`
--

INSERT INTO `human_resource` (`Id`, `Name`, `Email`, `Phone_Number`) VALUES
(1, 'Wing Sze Cheng', 'abc@gmail.com', '0234567890'),
(4, 'Zhang Rachel', 'zhangrachel@gmail.com', '0876543210'),
(5, 'Mary Chan', 'marychan@yahoo.com.hk', '0923763733'),
(6, 'Robert Edward', 'robertedward@outlook.com', '0533232454'),
(7, 'Geroge Reece', 'georgereece@gmail.com', '0837489834'),
(11, 'Cecilia May', 'wsjsdn@yahoo.com.hk', '0123456784'),
(12, 'Wing Sze Cheng', 'wschengae@connect.ust.hk', '0450010177'),
(14, 'Wing Sze Cheng', 'cecilia1997@gmail.com', '0450010377'),
(48, 'Wing Sze Chenc', 'wschengae@conncct.ust.hk', '0450010377'),
(49, 'Wing Sze Chenc', 'wschengae@connect.ustd.ww', '0384939292'),
(50, 'Wing Sze Chendd', 'wschengae@connect.ust.h2', '0495939292'),
(52, 'Wing Sze Chene', 'wschengae@conwect.ust.hk', '0450010173'),
(53, 'Wing Sze Chen3', 'wschengae@connect.ust.h4', '0483838383'),
(54, 'Wing Sze Chen3', 'wschedsdsdgae@connect.ust.hs', '0538383838'),
(56, 'Chengksd', 'wdadsd@jsdkfsdf.com', '0323232222'),
(59, 'dasadasd', 'wschengae@connect.ust.h1231', '0324929929'),
(60, 'sdfsfdsf', 'wschengae@fdssf.sdfsd.sd', '0123929292'),
(61, 'Wing Sze Chend', 'wschengae@connect.ust.hd', '0450010173'),
(62, 'Wing Sze xheng', 'wschengae@connect.dst.hk', '0450010377'),
(64, 'Wing Sze Cdeng', 'wschengae@connect.udt.hk', '0450010377'),
(65, 'Wing Sze Cdeng', 'wschengae@conn3ct.udt.hk', '0450010373'),
(66, 'Wing Sze Chen3', 'w333hengae@conne3t.ust.hk', '0450010477'),
(67, 'Wing Sze Cjeng', 'wscjengae@connect.ust.hk', '0458010177'),
(68, 'Mary Law', 'marylaw@connect.ust.hk', '0334343232'),
(69, 'John Smith', 'wewe@gmail.com', '0493949393'),
(70, 'Rachel', 'dssf@gmail.com', '0345632323'),
(72, 'Mary Law', 'r23ng@ust.hk', '0343939292'),
(73, 'Wing Mary', 'wsch3ae@connect.ust.hk', '0232434347');

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE `individual` (
  `Donor_id` int(5) NOT NULL,
  `Mobile_Phone` char(10) NOT NULL
) ;

--
-- Dumping data for table `individual`
--

INSERT INTO `individual` (`Donor_id`, `Mobile_Phone`) VALUES
(5, '0548473887'),
(6, '0345454868'),
(7, '0234353434'),
(14, '0383843469'),
(15, '0384858395');

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory_leave_item`
-- (See below for the actual view)
--
CREATE TABLE `inventory_leave_item` (
`Id` int(8)
,`Category_Name` char(50)
,`Description_Product` varchar(255)
,`R_Weight` double
,`Expired_Date` date
,`Donation_Status` enum('Active','Trashed','Inactive')
,`Delivered_Day` date
,`Donation_Id` int(8)
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_remain`
--

CREATE TABLE `inventory_remain` (
  `Donation_Id` int(8) NOT NULL,
  `R_Weight` double NOT NULL
) ;

--
-- Dumping data for table `inventory_remain`
--

INSERT INTO `inventory_remain` (`Donation_Id`, `R_Weight`) VALUES
(1, 996),
(2, 99.5),
(3, 200),
(4, 50),
(5, 0),
(6, 5),
(8, 30),
(9, 500),
(10, 43.23),
(22, 500),
(23, 500),
(24, 50),
(25, 497),
(26, 500),
(27, 490),
(29, 500),
(30, 300),
(31, 500),
(32, 500),
(33, 400),
(34, 300),
(35, 300),
(36, 430),
(37, 10),
(38, 292),
(39, 30),
(40, 10),
(41, 46);

--
-- Triggers `inventory_remain`
--
DELIMITER $$
CREATE TRIGGER `Active_Inactive` AFTER UPDATE ON `inventory_remain` FOR EACH ROW BEGIN
	IF(new.R_Weight<=0 AND old.Donation_Id is not NULL) THEN
    	UPDATE donations
        SET Donation_Status="Inactive"
        WHERE Donation_Id= new.Donation_Id;
    END IF;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_Id` int(8) NOT NULL,
  `Category_Name` char(50) NOT NULL,
  `Weight` double NOT NULL COMMENT 'kg',
  `Required_Day` date NOT NULL,
  `Created_Day` date NOT NULL DEFAULT current_timestamp(),
  `Other_Details` varchar(255) NOT NULL,
  `Transfer_Day` date DEFAULT NULL,
  `R_id` int(8) NOT NULL,
  `Allocated` tinyint(1) NOT NULL
) ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_Id`, `Category_Name`, `Weight`, `Required_Day`, `Created_Day`, `Other_Details`, `Transfer_Day`, `R_id`, `Allocated`) VALUES
(1, 'Rice', 3, '2020-05-08', '2020-04-13', '', '2020-04-15', 1, 1),
(2, 'Snacks', 0.3, '2020-04-18', '0000-00-00', '', '2020-04-16', 3, 0),
(3, 'Snacks', 0.3, '2020-05-18', '0000-00-00', '', '2020-04-13', 3, 1),
(4, 'SoftDrink', 3, '2020-04-21', '2020-04-13', '', NULL, 7, 1),
(5, 'Milk', 3, '2020-04-23', '2020-04-13', '', NULL, 8, 0),
(6, 'Vegetables', 0.5, '2020-04-20', '2020-04-13', '', NULL, 7, 1),
(7, 'Snacks', 9.7, '2020-07-17', '2020-05-12', '', '2020-05-21', 4, 1),
(8, 'Milk', 5, '2020-08-08', '2020-06-01', 'No', NULL, 5, 1),
(9, 'Meat', 5, '2020-06-11', '0000-00-00', 'No', NULL, 1, 1),
(10, 'Milk', 5, '2020-06-06', '2020-06-03', 'No', NULL, 8, 0),
(11, 'Milk', 5, '2020-06-06', '2020-06-03', 'No', NULL, 8, 1),
(12, 'Rice', 4, '2020-06-04', '2020-06-01', 'No', NULL, 4, 1),
(13, 'Milk', 5, '2020-06-05', '2020-06-02', 'No', NULL, 7, 1),
(14, 'Milk', 3, '2020-06-18', '2020-06-01', 'No', NULL, 5, 1),
(15, 'Rice', 3, '2020-06-24', '2020-06-01', 'With bag', NULL, 5, 0),
(16, 'Meat', 7, '2020-06-17', '2020-06-04', '', NULL, 1, 0),
(17, 'Meat', 30, '2020-06-27', '2020-06-13', 'No', NULL, 4, 0),
(18, 'Meat', 1, '2020-06-17', '2020-06-13', '', NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `Id` int(4) NOT NULL,
  `Order_Id` int(8) NOT NULL,
  `Role` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`Id`, `Order_Id`, `Role`) VALUES
(1, 2, 'Coordinator'),
(1, 4, 'Coordinator'),
(5, 2, 'Coordinator'),
(5, 3, 'Driver'),
(7, 1, 'Coordinator');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `R_Id` int(8) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Number` int(4) NOT NULL,
  `SName` char(50) NOT NULL,
  `Pcode` char(4) NOT NULL,
  `Subrub` char(50) NOT NULL,
  `Diet_Requirement` varchar(255) DEFAULT NULL,
  `Home_Telephone` char(10) NOT NULL,
  `Mobile_Phone` char(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Centre_Id` int(3) NOT NULL
) ;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`R_Id`, `Name`, `Number`, `SName`, `Pcode`, `Subrub`, `Diet_Requirement`, `Home_Telephone`, `Mobile_Phone`, `Email`, `Centre_Id`) VALUES
(1, 'Oliver Jack', 41, 'Adelaide Streets', '4101', 'Brisbane City2', 'None', '0843232223', '0244433323', 'OlverJack@yahoo.com.hk', 5),
(2, 'Jack Connor', 110, 'Charlotte Street', '4000', 'Brisbane City', NULL, '0312232384', '0234534344', 'jackconnor@yahoo.com.au', 6),
(3, 'Oliver Jack', 40, 'Adelaide Street', '4000', 'Brisbane City', 'Nut Allergy', '0843232222', '0244433333', 'OlverJack@yahoo.com.hk', 5),
(4, 'Jack Connor', 110, 'Charlotte Street', '4000', 'Brisbane City', 'None', '0312232384', '0234534344', 'jackconnor@yahoo.com.au', 6),
(5, 'Harry Callum', 23, 'Adelaide Street', '4000', 'Brisbane City', 'Carbohydrate Allergy', '0843632222', '0957485749', 'harryCallum@yahoo.com.hk', 5),
(6, 'Anny Connor', 110, 'Charlotte Street', '4000', 'Brisbane City', NULL, '0312232384', '0234534344', 'Annyconnor@yahoo.com.au', 5),
(7, 'Cherry Callum', 23, 'Adelaide Street', '4000', 'Brisbane City', 'Carbohydrate Allergy', '0856632222', '0957357487', 'CherryCallum@yahoo.com.hk', 5),
(8, 'Ben Connor', 110, 'Charlotte Street', '4000', 'Brisbane City', NULL, '0354232384', '0234563344', 'Annyconnor@yahoo.com.au', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_donation_weight`
-- (See below for the actual view)
--
CREATE TABLE `total_donation_weight` (
`Donation_Id` int(8)
,`SUM(Weight)` double
);

-- --------------------------------------------------------

--
-- Table structure for table `transact`
--

CREATE TABLE `transact` (
  `Donation_Id` int(8) NOT NULL,
  `Order_Id` int(8) NOT NULL,
  `Weight` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transact`
--

INSERT INTO `transact` (`Donation_Id`, `Order_Id`, `Weight`) VALUES
(1, 1, 3),
(2, 6, 0.5),
(5, 3, 0.3),
(5, 7, 9.7),
(6, 9, 5),
(7, 12, 4),
(25, 4, 3),
(27, 11, 5),
(27, 13, 5),
(38, 8, 5),
(38, 14, 3);

--
-- Triggers `transact`
--
DELIMITER $$
CREATE TRIGGER `Allocate` AFTER INSERT ON `transact` FOR EACH ROW begin
	UPDATE orders 
    SET orders.Allocated=1
    WHERE orders.Order_Id=NEW.Order_Id;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_R_Weight` AFTER INSERT ON `transact` FOR EACH ROW begin
	UPDATE inventory_remain 
    SET R_Weight =R_Weight- new.Weight
    WHERE Donation_Id=NEW.Donation_Id;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `Id` int(4) NOT NULL,
  `No_of_Service_Hour` int(5) NOT NULL,
  `Availability` varchar(255) NOT NULL,
  `Team` enum('Delivery Team','Warehouse Team','Food Parcel Team','Others') NOT NULL,
  `Mobile_Phone` char(10) NOT NULL
) ;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`Id`, `No_of_Service_Hour`, `Availability`, `Team`, `Mobile_Phone`) VALUES
(48, 11, 'Tuesday', 'Delivery Team', '0232434939');

-- --------------------------------------------------------

--
-- Stand-in structure for view `volunteer_join`
-- (See below for the actual view)
--
CREATE TABLE `volunteer_join` (
`Id` int(4)
,`Name` varchar(255)
,`Email` varchar(255)
,`Phone_Number` char(10)
,`No_of_Service_Hour` int(5)
,`Availability` varchar(255)
,`Team` enum('Delivery Team','Warehouse Team','Food Parcel Team','Others')
,`Mobile_Phone` char(10)
);

-- --------------------------------------------------------

--
-- Structure for view `category_all`
--
DROP TABLE IF EXISTS `category_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `category_all`  AS  (select `big_category`.`Id` AS `Id`,`category`.`Category_Name` AS `Category_Name`,`category`.`Description_Product` AS `Description_Product` from (`category` join `big_category`) where `category`.`Category_Name` = `big_category`.`Category_Name`) ;

-- --------------------------------------------------------

--
-- Structure for view `employee_join`
--
DROP TABLE IF EXISTS `employee_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_join`  AS  (select `h`.`Id` AS `Id`,`h`.`Name` AS `Name`,`h`.`Email` AS `Email`,`h`.`Phone_Number` AS `Phone_Number`,`e`.`Entering_Date` AS `Entering_Date`,`e`.`Salary` AS `Salary`,`e`.`Education_Level` AS `Education_Level`,`e`.`Title` AS `Title`,`e`.`Department` AS `Department` from (`human_resource` `h` join `employee` `e`) where `h`.`Id` = `e`.`Id`) ;

-- --------------------------------------------------------

--
-- Structure for view `inventory_leave_item`
--
DROP TABLE IF EXISTS `inventory_leave_item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventory_leave_item`  AS  (select `category_all`.`Id` AS `Id`,`category_all`.`Category_Name` AS `Category_Name`,`category_all`.`Description_Product` AS `Description_Product`,`inventory_remain`.`R_Weight` AS `R_Weight`,`donations`.`Expired_Date` AS `Expired_Date`,`donations`.`Donation_Status` AS `Donation_Status`,`donations`.`Delivered_Day` AS `Delivered_Day`,`inventory_remain`.`Donation_Id` AS `Donation_Id` from (`inventory_remain` left join (`donations` join `category_all`) on(`inventory_remain`.`Donation_Id` = `donations`.`Donation_Id` and `category_all`.`Description_Product` = `donations`.`Description_Product`)) where `donations`.`Donation_Status` = 'Active' order by `category_all`.`Id`,`category_all`.`Description_Product`,`donations`.`Expired_Date`) ;

-- --------------------------------------------------------

--
-- Structure for view `total_donation_weight`
--
DROP TABLE IF EXISTS `total_donation_weight`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_donation_weight`  AS  (select `transact`.`Donation_Id` AS `Donation_Id`,sum(`transact`.`Weight`) AS `SUM(Weight)` from `transact` group by `transact`.`Donation_Id`) ;

-- --------------------------------------------------------

--
-- Structure for view `volunteer_join`
--
DROP TABLE IF EXISTS `volunteer_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `volunteer_join`  AS  (select `h`.`Id` AS `Id`,`h`.`Name` AS `Name`,`h`.`Email` AS `Email`,`h`.`Phone_Number` AS `Phone_Number`,`v`.`No_of_Service_Hour` AS `No_of_Service_Hour`,`v`.`Availability` AS `Availability`,`v`.`Team` AS `Team`,`v`.`Mobile_Phone` AS `Mobile_Phone` from (`human_resource` `h` join `volunteer` `v`) where `h`.`Id` = `v`.`Id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `big_category`
--
ALTER TABLE `big_category`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Category_Name` (`Category_Name`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Branch_Name`,`Donor_Id`),
  ADD KEY `Donor_Id` (`Donor_Id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Description_Product`),
  ADD KEY `Category_Name` (`Category_Name`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`Id`,`Donation_Id`),
  ADD KEY `Id` (`Id`),
  ADD KEY `Donation_Id` (`Donation_Id`);

--
-- Indexes for table `collection_centre`
--
ALTER TABLE `collection_centre`
  ADD PRIMARY KEY (`Centre_Id`),
  ADD UNIQUE KEY `Phone_Number` (`Phone_Number`),
  ADD KEY `Id` (`Id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Donor_Id`),
  ADD KEY `Donor_Id` (`Donor_Id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`Donation_Id`),
  ADD KEY `Donor_Id` (`Donor_Id`),
  ADD KEY `Description_Product` (`Description_Product`),
  ADD KEY `Description_Product_2` (`Description_Product`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`Donor_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- Indexes for table `human_resource`
--
ALTER TABLE `human_resource`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `individual`
--
ALTER TABLE `individual`
  ADD PRIMARY KEY (`Donor_id`),
  ADD KEY `Donor_id` (`Donor_id`);

--
-- Indexes for table `inventory_remain`
--
ALTER TABLE `inventory_remain`
  ADD PRIMARY KEY (`Donation_Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `R_id` (`R_id`),
  ADD KEY `Category_Name` (`Category_Name`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`Id`,`Order_Id`),
  ADD KEY `Id` (`Id`),
  ADD KEY `Order_Id` (`Order_Id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`R_Id`),
  ADD KEY `Centre_Id` (`Centre_Id`);

--
-- Indexes for table `transact`
--
ALTER TABLE `transact`
  ADD PRIMARY KEY (`Donation_Id`,`Order_Id`),
  ADD KEY `Order_Id` (`Order_Id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `big_category`
--
ALTER TABLE `big_category`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `collection_centre`
--
ALTER TABLE `collection_centre`
  MODIFY `Centre_Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `Donation_Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `Donor_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Computer-Generated index, Primary Key';

--
-- AUTO_INCREMENT for table `human_resource`
--
ALTER TABLE `human_resource`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `R_Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`Donor_Id`) REFERENCES `company` (`Donor_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Category_Name`) REFERENCES `big_category` (`Category_Name`);

--
-- Constraints for table `collect`
--
ALTER TABLE `collect`
  ADD CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `human_resource` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`Donation_Id`) REFERENCES `donations` (`Donation_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `collection_centre`
--
ALTER TABLE `collection_centre`
  ADD CONSTRAINT `collection_centre_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `human_resource` (`Id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `Donor_Id` FOREIGN KEY (`Donor_Id`) REFERENCES `donor` (`Donor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`Description_Product`) REFERENCES `category` (`Description_Product`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`Donor_Id`) REFERENCES `donor` (`Donor_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `human_resource` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `individual`
--
ALTER TABLE `individual`
  ADD CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`Donor_id`) REFERENCES `donor` (`Donor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`R_id`) REFERENCES `recipient` (`R_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Category_Name`) REFERENCES `big_category` (`Category_Name`);

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `human_resource` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`Order_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`Centre_Id`) REFERENCES `collection_centre` (`Centre_Id`);

--
-- Constraints for table `transact`
--
ALTER TABLE `transact`
  ADD CONSTRAINT `transact_ibfk_1` FOREIGN KEY (`Donation_Id`) REFERENCES `donations` (`Donation_Id`),
  ADD CONSTRAINT `transact_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`Order_Id`);

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `human_resource` (`Id`) ON DELETE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `update expired date` ON SCHEDULE EVERY 1 DAY STARTS '2020-06-14 22:19:04' ON COMPLETION NOT PRESERVE ENABLE DO CALL `Turn Trash`()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
