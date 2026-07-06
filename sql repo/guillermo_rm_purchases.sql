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
-- Dumping data for table `rm_purchases`
--

LOCK TABLES `rm_purchases` WRITE;
/*!40000 ALTER TABLE `rm_purchases` DISABLE KEYS */;
INSERT INTO `rm_purchases` VALUES (1,'PO-2026-005','2026-06-17',1),(2,'PO-2026-023','2026-06-04',1),(3,'PO-2026-012','2026-06-06',3),(4,'PO-2026-022','2026-05-18',3),(5,'PO-2026-025','2026-05-04',2),(6,'PO-2026-021','2026-05-30',2),(7,'PO-2026-018','2026-06-18',1),(8,'PO-2026-010','2026-06-23',2),(9,'PO-2026-006','2026-05-17',2),(10,'PO-2026-008','2026-05-05',4),(11,'PO-2026-014','2026-05-30',1),(12,'PO-2026-007','2026-06-25',2),(13,'PO-2026-002','2026-06-07',4),(14,'PO-2026-011','2026-05-16',3),(15,'PO-2026-009','2026-05-09',1),(16,'PO-2026-020','2026-05-22',1),(17,'PO-2026-019','2026-05-13',1),(18,'PO-2026-024','2026-06-25',4),(19,'PO-2026-016','2026-05-02',2),(20,'PO-2026-001','2026-05-06',1),(21,'PO-2026-004','2026-06-06',2),(22,'PO-2026-013','2026-05-26',1),(23,'PO-2026-003','2026-05-16',2),(24,'PO-2026-017','2026-06-17',2),(25,'PO-2026-015','2026-06-24',3);
/*!40000 ALTER TABLE `rm_purchases` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-05 20:57:19
