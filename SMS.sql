/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Sales_Management_System
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `IM_Customers`
--

DROP TABLE IF EXISTS `IM_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Customers`
--

LOCK TABLES `IM_Customers` WRITE;
/*!40000 ALTER TABLE `IM_Customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Customers` VALUES
(1,'Lanie','Algrabio',NULL,'2026-03-25 08:06:53','2026-03-25 08:06:53'),
(2,'Chuzabelle','Porras',NULL,'2026-03-25 08:06:53','2026-03-25 10:33:56'),
(3,'Jessa','Batayo',NULL,'2026-03-25 08:06:53','2026-03-25 10:35:05'),
(4,'Phebe','Batayo',NULL,'2026-03-25 08:06:53','2026-03-25 10:35:05'),
(5,'Emmry','Manait',NULL,'2026-03-25 08:06:53','2026-03-25 08:06:53'),
(6,'Beulah','Porras',NULL,'2026-03-25 08:06:53','2026-03-25 10:35:05');
/*!40000 ALTER TABLE `IM_Customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Employee`
--

DROP TABLE IF EXISTS `IM_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`employee_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `IM_Employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `IM_Roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Employee`
--

LOCK TABLES `IM_Employee` WRITE;
/*!40000 ALTER TABLE `IM_Employee` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Employee` VALUES
(1,'RJ','Marcelo',NULL,1,'2026-03-25 10:37:25','2026-03-25 10:37:25');
/*!40000 ALTER TABLE `IM_Employee` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Invoices`
--

DROP TABLE IF EXISTS `IM_Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Invoices` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_code` (`invoice_code`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `IM_Invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `IM_Customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Invoices`
--

LOCK TABLES `IM_Invoices` WRITE;
/*!40000 ALTER TABLE `IM_Invoices` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Invoices` VALUES
(1,'LANIE-1001',1,NULL,1,'2026-03-25 10:53:34','2026-03-26 04:31:04'),
(3,'CHUZABELLE-1002',2,NULL,1,'2026-03-25 10:53:34','2026-03-28 05:32:41'),
(4,'JESSA-1003',3,NULL,1,'2026-03-25 10:53:34','2026-03-28 05:32:41'),
(6,'EMRY-1004',5,NULL,1,'2026-03-25 10:53:34','2026-03-28 05:32:41'),
(7,'BEULAH-1005',6,NULL,1,'2026-03-25 10:53:34','2026-03-28 05:32:41'),
(8,'PHEBE-1006',4,NULL,1,'2026-03-25 10:57:10','2026-03-28 05:32:41');
/*!40000 ALTER TABLE `IM_Invoices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Payment`
--

DROP TABLE IF EXISTS `IM_Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(20) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_code` (`payment_code`),
  KEY `invoice_id` (`invoice_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `IM_Payment_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `IM_Invoices` (`invoice_id`),
  CONSTRAINT `IM_Payment_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `IM_Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment`
--

LOCK TABLES `IM_Payment` WRITE;
/*!40000 ALTER TABLE `IM_Payment` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Payment` VALUES
(92,'BEULAH-1005-P ',7,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:14'),
(93,'CHUZABELLE-1002-P ',3,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:59'),
(94,'EMRY-1004-P ',6,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:59'),
(95,'JESSA-1003-P ',4,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:59'),
(96,'LANIE-1001-P ',1,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:59'),
(97,'PHEBE-1006-P ',8,NULL,NULL,'2026-03-28 06:51:01','2026-03-28 07:01:59');
/*!40000 ALTER TABLE `IM_Payment` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Payment_Method`
--

DROP TABLE IF EXISTS `IM_Payment_Method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Payment_Method` (
  `paymethod_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`paymethod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment_Method`
--

LOCK TABLES `IM_Payment_Method` WRITE;
/*!40000 ALTER TABLE `IM_Payment_Method` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Payment_Method` VALUES
(1,'CASH',NULL,'2026-03-26 10:46:24','2026-03-26 10:46:24'),
(2,'GCASH',NULL,'2026-03-26 10:46:24','2026-03-26 10:46:24');
/*!40000 ALTER TABLE `IM_Payment_Method` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Payment_Variant`
--

DROP TABLE IF EXISTS `IM_Payment_Variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Payment_Variant` (
  `payvariant_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `paymethod_id` int(11) DEFAULT NULL,
  `amount_paid` decimal(15,2) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payvariant_id`),
  KEY `payment_id` (`payment_id`),
  KEY `paymethod_id` (`paymethod_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sales_id` (`sales_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `IM_Payment` (`payment_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_2` FOREIGN KEY (`paymethod_id`) REFERENCES `IM_Payment_Method` (`paymethod_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `IM_Employee` (`employee_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_4` FOREIGN KEY (`sales_id`) REFERENCES `IM_Sales` (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment_Variant`
--

LOCK TABLES `IM_Payment_Variant` WRITE;
/*!40000 ALTER TABLE `IM_Payment_Variant` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Payment_Variant` VALUES
(11,96,26,1,130.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(12,96,27,1,230.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(13,93,28,1,130.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(14,95,29,1,130.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(15,97,30,1,130.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(16,97,31,1,46.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(17,94,32,1,200.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(18,94,33,1,50.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(19,92,34,1,100.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50'),
(20,92,35,1,50.00,1,'2026-03-28 07:06:09','2026-03-28 08:17:50');
/*!40000 ALTER TABLE `IM_Payment_Variant` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Roles`
--

DROP TABLE IF EXISTS `IM_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Roles`
--

LOCK TABLES `IM_Roles` WRITE;
/*!40000 ALTER TABLE `IM_Roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Roles` VALUES
(1,'Admin',NULL,'2026-03-25 10:37:11','2026-03-25 10:37:11');
/*!40000 ALTER TABLE `IM_Roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Sales`
--

DROP TABLE IF EXISTS `IM_Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_code` varchar(30) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `pv_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quom_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sales_id`),
  KEY `pv_id` (`pv_id`),
  KEY `quom_id` (`quom_id`),
  KEY `employee_id` (`employee_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `IM_Sales_ibfk_1` FOREIGN KEY (`pv_id`) REFERENCES `PM_Product_Variants` (`pv_id`),
  CONSTRAINT `IM_Sales_ibfk_2` FOREIGN KEY (`quom_id`) REFERENCES `PM_Quantity_Unit_of_Measure` (`quom_id`),
  CONSTRAINT `IM_Sales_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `IM_Employee` (`employee_id`),
  CONSTRAINT `IM_Sales_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `IM_Invoices` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Sales`
--

LOCK TABLES `IM_Sales` WRITE;
/*!40000 ALTER TABLE `IM_Sales` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `IM_Sales` VALUES
(26,'LANIE-1001-S',1,19,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(27,'LANIE-1002-S',1,19,2,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(28,'CHU-1003-S',3,19,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(29,'JESSA-1004-S',4,19,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(30,'PHEBE-1005-S',8,19,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(31,'PHEBE-1006-S',8,2,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(32,'EMRY-1007-S',6,1,2,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(33,'EMRY-1008-S',6,4,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(34,'BEULLAH-1009-S',7,1,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19'),
(35,'BEULLAH-1010-S',7,4,1,1,1,'2026-03-28 08:12:19','2026-03-28 08:12:19');
/*!40000 ALTER TABLE `IM_Sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Adjustment_Type`
--

DROP TABLE IF EXISTS `PM_Adjustment_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Adjustment_Type` (
  `pat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pat_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Adjustment_Type`
--

LOCK TABLES `PM_Adjustment_Type` WRITE;
/*!40000 ALTER TABLE `PM_Adjustment_Type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Adjustment_Type` VALUES
(1,'DAMAGE',NULL,'2026-03-24 10:54:58','2026-03-24 10:54:58'),
(2,'STOCK IN',NULL,'2026-03-24 10:54:58','2026-03-24 10:54:58'),
(3,'STOCK OUT',NULL,'2026-03-24 10:54:58','2026-03-24 10:54:58');
/*!40000 ALTER TABLE `PM_Adjustment_Type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Brand`
--

DROP TABLE IF EXISTS `PM_Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Brand`
--

LOCK TABLES `PM_Brand` WRITE;
/*!40000 ALTER TABLE `PM_Brand` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Brand` VALUES
(1,'Merci',NULL,'2026-03-24 09:43:15','2026-03-24 09:43:15'),
(3,'N/A',NULL,'2026-03-26 09:07:19','2026-03-26 09:07:19');
/*!40000 ALTER TABLE `PM_Brand` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Category`
--

DROP TABLE IF EXISTS `PM_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Category`
--

LOCK TABLES `PM_Category` WRITE;
/*!40000 ALTER TABLE `PM_Category` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Category` VALUES
(1,'Food',NULL,'2026-03-24 09:20:59','2026-03-25 04:04:27'),
(2,'Bag',NULL,'2026-03-24 09:20:59','2026-03-25 04:04:27');
/*!40000 ALTER TABLE `PM_Category` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Product_Adjustments`
--

DROP TABLE IF EXISTS `PM_Product_Adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Product_Adjustments` (
  `pa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `adjustment_date` datetime DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `udpated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Product_Adjustments`
--

LOCK TABLES `PM_Product_Adjustments` WRITE;
/*!40000 ALTER TABLE `PM_Product_Adjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `PM_Product_Adjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Product_Stocks`
--

DROP TABLE IF EXISTS `PM_Product_Stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Product_Stocks` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quom_id` int(11) DEFAULT NULL,
  `weight` decimal(15,2) DEFAULT NULL,
  `wuom_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `udpated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ps_id`),
  KEY `quom_id` (`quom_id`),
  KEY `wuom_id` (`wuom_id`),
  KEY `pv_id` (`pv_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_2` FOREIGN KEY (`quom_id`) REFERENCES `PM_Quantity_Unit_of_Measure` (`quom_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_3` FOREIGN KEY (`wuom_id`) REFERENCES `PM_Weight_Unit_of_Measure` (`wuom_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_4` FOREIGN KEY (`pv_id`) REFERENCES `PM_Product_Variants` (`pv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Product_Stocks`
--

LOCK TABLES `PM_Product_Stocks` WRITE;
/*!40000 ALTER TABLE `PM_Product_Stocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Product_Stocks` VALUES
(1,1,2,2,NULL,NULL,'2026-03-24 10:40:22','2026-03-24 10:49:38'),
(2,2,2,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(3,3,3,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(4,4,2,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(5,5,2,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(6,6,2,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(7,7,5,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(8,8,4,2,NULL,NULL,'2026-03-24 10:45:02','2026-03-24 10:49:38'),
(10,9,1,1,NULL,NULL,'2026-03-26 08:53:02','2026-03-26 08:53:02'),
(11,19,8,1,NULL,NULL,'2026-03-26 09:09:50','2026-03-26 09:09:50');
/*!40000 ALTER TABLE `PM_Product_Stocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Product_Variants`
--

DROP TABLE IF EXISTS `PM_Product_Variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Product_Variants` (
  `pv_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `size` enum('S','M','L','XL') DEFAULT NULL,
  `mark_up` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pv_id`),
  UNIQUE KEY `product_code` (`product_code`),
  UNIQUE KEY `product_code_2` (`product_code`),
  KEY `fk_pv_product` (`product_id`),
  KEY `fk_pv_brand` (`brand_id`),
  KEY `fk_pv_supplier` (`supplier_id`),
  CONSTRAINT `fk_pv_brand` FOREIGN KEY (`brand_id`) REFERENCES `PM_Brand` (`brand_id`),
  CONSTRAINT `fk_pv_product` FOREIGN KEY (`product_id`) REFERENCES `PM_Products` (`product_id`),
  CONSTRAINT `fk_pv_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `PM_Supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Product_Variants`
--

LOCK TABLES `PM_Product_Variants` WRITE;
/*!40000 ALTER TABLE `PM_Product_Variants` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Product_Variants` VALUES
(1,'PULCERAS-101',1,1,1,NULL,35.00,65.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(2,'EGG-102',2,1,1,NULL,35.00,65.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(3,'PENASUGBO-103',3,1,1,NULL,24.00,41.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(4,'UBE-PIYAYA-104',4,1,1,NULL,23.00,27.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(5,'TOASTED-MAMON-105',5,1,1,NULL,16.00,49.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(6,'PIYAYA-ORIG-106',6,1,1,NULL,33.00,62.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(7,'BROWNER-107',7,1,1,NULL,4.50,20.50,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(8,'BANANA-CHIPS-108',8,1,1,NULL,19.00,56.00,'2026-03-24 09:28:31','2026-03-26 08:49:02'),
(9,'ECHO-BAG-109',9,1,1,NULL,0.00,50.00,'2026-03-26 04:11:11','2026-03-26 08:49:02'),
(19,'CASOY-110',12,3,2,NULL,15.00,115.00,'2026-03-26 09:05:16','2026-03-27 13:42:58');
/*!40000 ALTER TABLE `PM_Product_Variants` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Products`
--

DROP TABLE IF EXISTS `PM_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name` (`product_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `PM_Products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `PM_Category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Products`
--

LOCK TABLES `PM_Products` WRITE;
/*!40000 ALTER TABLE `PM_Products` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Products` VALUES
(1,'Pulceras',1,'2026-03-24 09:19:54','2026-03-26 09:02:32'),
(2,'Egg',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(3,'Penasugbo',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(4,'Ube Piyaya',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(5,'Toasted Mamon',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(6,'Piyaya Orig',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(7,'Browner',1,'2026-03-24 09:19:54','2026-03-26 09:02:57'),
(8,'Banana Chips',1,'2026-03-24 09:19:54','2026-03-26 09:02:32'),
(9,'Echo Bag',2,'2026-03-26 03:37:58','2026-03-26 04:04:42'),
(12,'Casoy',1,'2026-03-26 09:00:33','2026-03-26 09:00:33');
/*!40000 ALTER TABLE `PM_Products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Quantity_Unit_of_Measure`
--

DROP TABLE IF EXISTS `PM_Quantity_Unit_of_Measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Quantity_Unit_of_Measure` (
  `quom_id` int(11) NOT NULL AUTO_INCREMENT,
  `quom_name` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`quom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Quantity_Unit_of_Measure`
--

LOCK TABLES `PM_Quantity_Unit_of_Measure` WRITE;
/*!40000 ALTER TABLE `PM_Quantity_Unit_of_Measure` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Quantity_Unit_of_Measure` VALUES
(1,'pcs',NULL,'2026-03-24 10:46:29','2026-03-24 10:46:29'),
(2,'pack',NULL,'2026-03-24 10:46:29','2026-03-24 10:46:29');
/*!40000 ALTER TABLE `PM_Quantity_Unit_of_Measure` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Supplier`
--

DROP TABLE IF EXISTS `PM_Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Supplier`
--

LOCK TABLES `PM_Supplier` WRITE;
/*!40000 ALTER TABLE `PM_Supplier` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `PM_Supplier` VALUES
(1,'Perleta',NULL,'2026-03-24 09:54:46','2026-03-24 09:54:46'),
(2,'Rose',NULL,'2026-03-26 09:06:28','2026-03-26 09:06:28');
/*!40000 ALTER TABLE `PM_Supplier` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `PM_Weight_Unit_of_Measure`
--

DROP TABLE IF EXISTS `PM_Weight_Unit_of_Measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PM_Weight_Unit_of_Measure` (
  `wuom_id` int(11) NOT NULL AUTO_INCREMENT,
  `wuom_name` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`wuom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Weight_Unit_of_Measure`
--

LOCK TABLES `PM_Weight_Unit_of_Measure` WRITE;
/*!40000 ALTER TABLE `PM_Weight_Unit_of_Measure` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `PM_Weight_Unit_of_Measure` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Temporary table structure for view `TV_Invoice_Details`
--

DROP TABLE IF EXISTS `TV_Invoice_Details`;
/*!50001 DROP VIEW IF EXISTS `TV_Invoice_Details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TV_Invoice_Details` AS SELECT
 1 AS `invoice_id`,
  1 AS `invoice_code`,
  1 AS `customer_id`,
  1 AS `invoice_date`,
  1 AS `employee_id`,
  1 AS `created_at`,
  1 AS `updated_at` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TV_Payment_Total_Details`
--

DROP TABLE IF EXISTS `TV_Payment_Total_Details`;
/*!50001 DROP VIEW IF EXISTS `TV_Payment_Total_Details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TV_Payment_Total_Details` AS SELECT
 1 AS `invoice_id`,
  1 AS `invoice_code`,
  1 AS `total_payment`,
  1 AS `payment_date`,
  1 AS `first_name`,
  1 AS `created_at`,
  1 AS `updated_at` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TV_Sales_Details`
--

DROP TABLE IF EXISTS `TV_Sales_Details`;
/*!50001 DROP VIEW IF EXISTS `TV_Sales_Details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TV_Sales_Details` AS SELECT
 1 AS `sales_id`,
  1 AS `invoice_id`,
  1 AS `invoice_code`,
  1 AS `product_code`,
  1 AS `quantity`,
  1 AS `selling_price`,
  1 AS `total_amount`,
  1 AS `amount_paid`,
  1 AS `payment_name`,
  1 AS `status` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VS_Product_Details`
--

DROP TABLE IF EXISTS `VS_Product_Details`;
/*!50001 DROP VIEW IF EXISTS `VS_Product_Details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VS_Product_Details` AS SELECT
 1 AS `product_id`,
  1 AS `product_name`,
  1 AS `category_name`,
  1 AS `brand_name`,
  1 AS `supplier_name`,
  1 AS `size`,
  1 AS `mark_up`,
  1 AS `cost_price` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VS_Product_Price_Details`
--

DROP TABLE IF EXISTS `VS_Product_Price_Details`;
/*!50001 DROP VIEW IF EXISTS `VS_Product_Price_Details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VS_Product_Price_Details` AS SELECT
 1 AS `pv_id`,
  1 AS `product_name`,
  1 AS `quantity`,
  1 AS `quom_name`,
  1 AS `mark_up`,
  1 AS `cost_price`,
  1 AS `unit_price`,
  1 AS `subtotal_mark_up`,
  1 AS `subtotal_cost`,
  1 AS `subtotal_unit_price` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `VS_Products_Grand_Total`
--

DROP TABLE IF EXISTS `VS_Products_Grand_Total`;
/*!50001 DROP VIEW IF EXISTS `VS_Products_Grand_Total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VS_Products_Grand_Total` AS SELECT
 1 AS `subtotal_mark_up`,
  1 AS `subtotal_cost`,
  1 AS `subtotal_unit_price`,
  1 AS `total_mark_up`,
  1 AS `total_cost`,
  1 AS `total_unit_price` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `TV_Invoice_Details`
--

/*!50001 DROP VIEW IF EXISTS `TV_Invoice_Details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TV_Invoice_Details` AS select `ii`.`invoice_id` AS `invoice_id`,`ii`.`invoice_code` AS `invoice_code`,`ic`.`first_name` AS `customer_id`,`ii`.`invoice_date` AS `invoice_date`,`ie`.`first_name` AS `employee_id`,`ii`.`created_at` AS `created_at`,`ii`.`updated_at` AS `updated_at` from ((`IM_Invoices` `ii` left join `IM_Customers` `ic` on(`ii`.`customer_id` = `ic`.`customer_id`)) left join `IM_Employee` `ie` on(`ii`.`employee_id` = `ie`.`employee_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TV_Payment_Total_Details`
--

/*!50001 DROP VIEW IF EXISTS `TV_Payment_Total_Details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TV_Payment_Total_Details` AS select `ii`.`invoice_id` AS `invoice_id`,`ii`.`invoice_code` AS `invoice_code`,sum(`ipv`.`amount_paid`) AS `total_payment`,`ip`.`payment_date` AS `payment_date`,`ie`.`first_name` AS `first_name`,`ipv`.`created_at` AS `created_at`,`ipv`.`updated_at` AS `updated_at` from (((`IM_Invoices` `ii` left join `IM_Payment` `ip` on(`ii`.`invoice_id` = `ip`.`invoice_id`)) left join `IM_Payment_Variant` `ipv` on(`ip`.`payment_id` = `ipv`.`payment_id`)) left join `IM_Employee` `ie` on(`ipv`.`employee_id` = `ie`.`employee_id`)) group by `ii`.`invoice_id`,`ii`.`invoice_code`,`ip`.`payment_date`,`ie`.`first_name`,`ipv`.`created_at`,`ipv`.`updated_at` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TV_Sales_Details`
--

/*!50001 DROP VIEW IF EXISTS `TV_Sales_Details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TV_Sales_Details` AS select `t`.`sales_id` AS `sales_id`,`ii`.`invoice_id` AS `invoice_id`,`ii`.`invoice_code` AS `invoice_code`,`ppv`.`product_code` AS `product_code`,`t`.`quantity` AS `quantity`,`ppv`.`cost_price` + `ppv`.`mark_up` AS `selling_price`,(`ppv`.`cost_price` + `ppv`.`mark_up`) * `t`.`quantity` AS `total_amount`,`ipv`.`amount_paid` AS `amount_paid`,`ipm`.`payment_name` AS `payment_name`,case when `ipv`.`amount_paid` = (`ppv`.`mark_up` + `ppv`.`cost_price`) * `t`.`quantity` then 'PAID' when `ipv`.`amount_paid` < (`ppv`.`mark_up` + `ppv`.`cost_price`) * `t`.`quantity` then 'PARTIAL' else 'NOT PAID' end AS `status` from ((((`IM_Sales` `t` left join `IM_Invoices` `ii` on(`t`.`invoice_id` = `ii`.`invoice_id`)) left join `PM_Product_Variants` `ppv` on(`t`.`pv_id` = `ppv`.`pv_id`)) left join `IM_Payment_Variant` `ipv` on(`t`.`sales_id` = `ipv`.`sales_id`)) left join `IM_Payment_Method` `ipm` on(`ipv`.`paymethod_id` = `ipm`.`paymethod_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VS_Product_Details`
--

/*!50001 DROP VIEW IF EXISTS `VS_Product_Details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VS_Product_Details` AS select `ppv`.`product_id` AS `product_id`,`pp`.`product_name` AS `product_name`,`pc`.`category_name` AS `category_name`,`pb`.`brand_name` AS `brand_name`,`ps`.`supplier_name` AS `supplier_name`,`ppv`.`size` AS `size`,`ppv`.`mark_up` AS `mark_up`,`ppv`.`cost_price` AS `cost_price` from ((((`PM_Product_Variants` `ppv` left join `PM_Products` `pp` on(`ppv`.`product_id` = `pp`.`product_id`)) left join `PM_Category` `pc` on(`pp`.`category_id` = `pc`.`category_id`)) left join `PM_Brand` `pb` on(`ppv`.`brand_id` = `pb`.`brand_id`)) left join `PM_Supplier` `ps` on(`ppv`.`supplier_id` = `ps`.`supplier_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VS_Product_Price_Details`
--

/*!50001 DROP VIEW IF EXISTS `VS_Product_Price_Details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VS_Product_Price_Details` AS select `ppv`.`pv_id` AS `pv_id`,`pp`.`product_name` AS `product_name`,`pps`.`quantity` AS `quantity`,`pquom`.`quom_name` AS `quom_name`,`ppv`.`mark_up` AS `mark_up`,`ppv`.`cost_price` AS `cost_price`,if(`ppv`.`mark_up` = 0,0,`ppv`.`mark_up` + `ppv`.`cost_price`) AS `unit_price`,if(`ppv`.`mark_up` = 0,0,`ppv`.`mark_up` * `pps`.`quantity`) AS `subtotal_mark_up`,if(`ppv`.`cost_price` = 0,0,`ppv`.`cost_price` * `pps`.`quantity`) AS `subtotal_cost`,if(`ppv`.`mark_up` = 0,0,(`ppv`.`mark_up` + `ppv`.`cost_price`) * `pps`.`quantity`) AS `subtotal_unit_price` from (((`PM_Product_Variants` `ppv` left join `PM_Products` `pp` on(`ppv`.`product_id` = `pp`.`product_id`)) left join `PM_Product_Stocks` `pps` on(`ppv`.`pv_id` = `pps`.`pv_id`)) left join `PM_Quantity_Unit_of_Measure` `pquom` on(`pps`.`quom_id` = `pquom`.`quom_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VS_Products_Grand_Total`
--

/*!50001 DROP VIEW IF EXISTS `VS_Products_Grand_Total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RJ`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VS_Products_Grand_Total` AS with Filtered as (select if(`ppv`.`mark_up` = 0,0,sum(`ppv`.`mark_up`)) AS `subtotal_mark_up`,if(`ppv`.`cost_price` = 0,0,sum(`ppv`.`cost_price`)) AS `subtotal_cost`,sum(if(`ppv`.`mark_up` = 0,0,`ppv`.`mark_up` + `ppv`.`cost_price`)) AS `subtotal_unit_price`,sum(if(`ppv`.`mark_up` = 0,0,`ppv`.`mark_up` * `pps`.`quantity`)) AS `total_mark_up`,sum(if(`ppv`.`cost_price` = 0,0,`ppv`.`cost_price` * `pps`.`quantity`)) AS `total_cost`,sum(if(`ppv`.`mark_up` = 0,0,(coalesce(`ppv`.`mark_up`,0) + coalesce(`ppv`.`cost_price`,0)) * coalesce(`pps`.`quantity`,0))) AS `total_unit_price` from (`PM_Product_Variants` `ppv` left join `PM_Product_Stocks` `pps` on(`ppv`.`pv_id` = `pps`.`pv_id`)))select `Filtered`.`subtotal_mark_up` AS `subtotal_mark_up`,`Filtered`.`subtotal_cost` AS `subtotal_cost`,`Filtered`.`subtotal_unit_price` AS `subtotal_unit_price`,`Filtered`.`total_mark_up` AS `total_mark_up`,`Filtered`.`total_cost` AS `total_cost`,`Filtered`.`total_unit_price` AS `total_unit_price` from `Filtered` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-28 18:54:50
