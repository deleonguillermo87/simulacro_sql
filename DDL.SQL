-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: guillermo
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '8ab15e49-7363-11f1-8045-9cc7d320addd:1-207';

--
-- Table structure for table `rm_categories`
--

DROP TABLE IF EXISTS `rm_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_cities`
--

DROP TABLE IF EXISTS `rm_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Colombia',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_employees`
--

DROP TABLE IF EXISTS `rm_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_movements`
--

DROP TABLE IF EXISTS `rm_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_movements` (
  `movement_id` int NOT NULL AUTO_INCREMENT,
  `movement_code` varchar(20) NOT NULL,
  `movement_type` varchar(10) NOT NULL,
  `movement_date` date NOT NULL,
  `quantity` int NOT NULL,
  `stock_after` int NOT NULL,
  `observations` varchar(100) DEFAULT NULL,
  `product_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`movement_id`),
  UNIQUE KEY `movement_code` (`movement_code`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `rm_movements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `rm_products` (`product_id`),
  CONSTRAINT `rm_movements_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `rm_warehouses` (`warehouse_id`),
  CONSTRAINT `rm_movements_ibfk_3` FOREIGN KEY (`purchase_id`) REFERENCES `rm_purchases` (`purchase_id`),
  CONSTRAINT `rm_movements_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `rm_employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_products`
--

DROP TABLE IF EXISTS `rm_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) NOT NULL,
  `unit_measure` varchar(10) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `rm_products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `rm_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_purchase_items`
--

DROP TABLE IF EXISTS `rm_purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_purchase_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `rm_purchase_items_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `rm_purchases` (`purchase_id`),
  CONSTRAINT `rm_purchase_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `rm_products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_purchases`
--

DROP TABLE IF EXISTS `rm_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_purchases` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `purchase_date` date NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`purchase_id`),
  UNIQUE KEY `code` (`code`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `rm_purchases_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `rm_suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_suppliers`
--

DROP TABLE IF EXISTS `rm_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `tax_id` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `tax_id` (`tax_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `rm_suppliers_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `rm_cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rm_warehouses`
--

DROP TABLE IF EXISTS `rm_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rm_warehouses` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  UNIQUE KEY `code` (`code`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `rm_warehouses_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `rm_cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-05 21:48:14
