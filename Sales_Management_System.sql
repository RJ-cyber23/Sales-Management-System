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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Customers`
--

LOCK TABLES `IM_Customers` WRITE;
/*!40000 ALTER TABLE `IM_Customers` DISABLE KEYS */;
set autocommit=0;
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
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Employee`
--

LOCK TABLES `IM_Employee` WRITE;
/*!40000 ALTER TABLE `IM_Employee` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `IM_Employee` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `IM_Invoice_Status`
--

DROP TABLE IF EXISTS `IM_Invoice_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IM_Invoice_Status` (
  `is_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_name` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`is_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Invoice_Status`
--

LOCK TABLES `IM_Invoice_Status` WRITE;
/*!40000 ALTER TABLE `IM_Invoice_Status` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `IM_Invoice_Status` ENABLE KEYS */;
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
  `is_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_code` (`invoice_code`),
  KEY `customer_id` (`customer_id`),
  KEY `is_id` (`is_id`),
  CONSTRAINT `IM_Invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `IM_Customers` (`customer_id`),
  CONSTRAINT `IM_Invoices_ibfk_2` FOREIGN KEY (`is_id`) REFERENCES `IM_Invoice_Status` (`is_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Invoices`
--

LOCK TABLES `IM_Invoices` WRITE;
/*!40000 ALTER TABLE `IM_Invoices` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment`
--

LOCK TABLES `IM_Payment` WRITE;
/*!40000 ALTER TABLE `IM_Payment` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment_Method`
--

LOCK TABLES `IM_Payment_Method` WRITE;
/*!40000 ALTER TABLE `IM_Payment_Method` DISABLE KEYS */;
set autocommit=0;
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
  `paymethod_id` int(11) DEFAULT NULL,
  `amount_paid` decimal(15,2) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payvariant_id`),
  KEY `payment_id` (`payment_id`),
  KEY `paymethod_id` (`paymethod_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `IM_Payment` (`payment_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_2` FOREIGN KEY (`paymethod_id`) REFERENCES `IM_Payment_Method` (`paymethod_id`),
  CONSTRAINT `IM_Payment_Variant_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `IM_Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Payment_Variant`
--

LOCK TABLES `IM_Payment_Variant` WRITE;
/*!40000 ALTER TABLE `IM_Payment_Variant` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Roles`
--

LOCK TABLES `IM_Roles` WRITE;
/*!40000 ALTER TABLE `IM_Roles` DISABLE KEYS */;
set autocommit=0;
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
  `invoice_id` int(11) DEFAULT NULL,
  `pv_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,2) DEFAULT NULL,
  `quom_id` int(11) DEFAULT NULL,
  `selling_price` decimal(15,2) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sales_id`),
  KEY `pv_id` (`pv_id`),
  KEY `quom_id` (`quom_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `IM_Sales_ibfk_1` FOREIGN KEY (`pv_id`) REFERENCES `PM_Product_Variants` (`pv_id`),
  CONSTRAINT `IM_Sales_ibfk_2` FOREIGN KEY (`quom_id`) REFERENCES `PM_Quantity_Unit_of_Measure` (`quom_id`),
  CONSTRAINT `IM_Sales_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `IM_Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IM_Sales`
--

LOCK TABLES `IM_Sales` WRITE;
/*!40000 ALTER TABLE `IM_Sales` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Adjustment_Type`
--

LOCK TABLES `PM_Adjustment_Type` WRITE;
/*!40000 ALTER TABLE `PM_Adjustment_Type` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Brand`
--

LOCK TABLES `PM_Brand` WRITE;
/*!40000 ALTER TABLE `PM_Brand` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Category`
--

LOCK TABLES `PM_Category` WRITE;
/*!40000 ALTER TABLE `PM_Category` DISABLE KEYS */;
set autocommit=0;
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
  KEY `pv_id` (`pv_id`),
  KEY `quom_id` (`quom_id`),
  KEY `wuom_id` (`wuom_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_1` FOREIGN KEY (`pv_id`) REFERENCES `PM_Product_Variants` (`pv_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_2` FOREIGN KEY (`quom_id`) REFERENCES `PM_Quantity_Unit_of_Measure` (`quom_id`),
  CONSTRAINT `PM_Product_Stocks_ibfk_3` FOREIGN KEY (`wuom_id`) REFERENCES `PM_Weight_Unit_of_Measure` (`wuom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Product_Stocks`
--

LOCK TABLES `PM_Product_Stocks` WRITE;
/*!40000 ALTER TABLE `PM_Product_Stocks` DISABLE KEYS */;
set autocommit=0;
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
  `product_code` varchar(30) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `size` enum('S','M','L','XL') DEFAULT NULL,
  `mark_up` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pv_id`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `fk_pv_product` (`product_id`),
  KEY `fk_pv_brand` (`brand_id`),
  KEY `fk_pv_supplier` (`supplier_id`),
  CONSTRAINT `fk_pv_brand` FOREIGN KEY (`brand_id`) REFERENCES `PM_Brand` (`brand_id`),
  CONSTRAINT `fk_pv_product` FOREIGN KEY (`product_id`) REFERENCES `PM_Products` (`product_id`),
  CONSTRAINT `fk_pv_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `PM_Supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Product_Variants`
--

LOCK TABLES `PM_Product_Variants` WRITE;
/*!40000 ALTER TABLE `PM_Product_Variants` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Products`
--

LOCK TABLES `PM_Products` WRITE;
/*!40000 ALTER TABLE `PM_Products` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Quantity_Unit_of_Measure`
--

LOCK TABLES `PM_Quantity_Unit_of_Measure` WRITE;
/*!40000 ALTER TABLE `PM_Quantity_Unit_of_Measure` DISABLE KEYS */;
set autocommit=0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PM_Supplier`
--

LOCK TABLES `PM_Supplier` WRITE;
/*!40000 ALTER TABLE `PM_Supplier` DISABLE KEYS */;
set autocommit=0;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-24 16:18:32
