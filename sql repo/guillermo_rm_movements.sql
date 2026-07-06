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
-- Dumping data for table `rm_movements`
--

LOCK TABLES `rm_movements` WRITE;
/*!40000 ALTER TABLE `rm_movements` DISABLE KEYS */;
INSERT INTO `rm_movements` VALUES (1,'MOV-0001','IN','2026-06-23',8,8,'Missing purchase quantity',1,1,1,4),(2,'MOV-0002','IN','2026-06-04',25,194,'City format inconsistent',2,2,2,1),(3,'MOV-0003','OUT','2026-06-01',1,137,'',1,1,NULL,4),(4,'MOV-0004','OUT','2026-06-07',3,218,'City format inconsistent',3,2,3,5),(5,'MOV-0005','IN','2026-05-21',8,41,'',1,1,4,4),(6,'MOV-0006','IN','2026-05-05',12,54,'',1,2,5,1),(7,'MOV-0007','OUT','2026-06-03',8,191,'Review price',4,2,6,1),(8,'MOV-0008','OUT','2026-05-05',5,98,'Missing purchase quantity',3,1,5,1),(9,'MOV-0009','IN','2026-06-24',15,40,'',5,2,7,1),(10,'MOV-0010','IN','2026-06-25',40,138,'',5,2,8,4),(13,'MOV-0013','IN','2026-05-05',5,18,'',4,2,10,3),(15,'MOV-0015','IN','2026-06-05',5,186,'Duplicated supplier name',4,2,11,2),(16,'MOV-0016','IN','2026-05-26',30,25,'',4,2,9,3),(17,'MOV-0017','IN','2026-07-01',25,67,'City format inconsistent',4,1,12,5),(18,'MOV-0018','IN','2026-06-14',20,128,'',2,1,13,4),(19,'MOV-0019','IN','2026-06-25',12,158,'Missing purchase quantity',5,1,4,4),(20,'MOV-0020','OUT','2026-05-21',5,237,'Review price',2,3,14,4),(21,'MOV-0021','IN','2026-05-11',20,112,'Missing purchase quantity',3,1,15,4),(22,'MOV-0022','OUT','2026-05-11',2,72,'Duplicated supplier name',3,2,4,1),(23,'MOV-0023','OUT','2026-06-01',10,41,'Review price',5,3,NULL,4),(24,'MOV-0024','OUT','2026-05-16',2,32,'',5,1,2,1),(26,'MOV-0026','IN','2026-06-21',12,219,'Review price',1,1,11,1),(28,'MOV-0028','OUT','2026-05-09',3,155,'Missing purchase quantity',1,1,15,2),(29,'MOV-0029','OUT','2026-06-26',2,110,'City format inconsistent',4,1,NULL,4),(30,'MOV-0030','IN','2026-06-06',15,141,'Review price',5,2,8,2),(31,'MOV-0031','OUT','2026-05-26',3,113,'Review price',3,3,8,2),(32,'MOV-0032','OUT','2026-05-25',2,37,'Review price',3,3,16,4),(33,'MOV-0033','IN','2026-05-13',25,228,'',4,3,17,5),(34,'MOV-0034','OUT','2026-05-21',8,243,'',3,1,7,4),(35,'MOV-0035','OUT','2026-07-03',3,124,'',4,2,18,1),(36,'MOV-0036','OUT','2026-05-09',10,16,'Review price',1,3,7,5),(37,'MOV-0037','IN','2026-06-07',5,241,'Review price',4,1,5,4),(38,'MOV-0038','OUT','2026-05-04',10,215,'Missing purchase quantity',2,3,19,4),(39,'MOV-0039','IN','2026-05-10',25,97,'City format inconsistent',3,3,20,5),(40,'MOV-0040','IN','2026-05-02',5,193,'',1,3,19,4),(41,'MOV-0041','OUT','2026-06-07',2,199,'',2,1,21,4),(42,'MOV-0042','OUT','2026-05-27',2,178,'Missing purchase quantity',3,3,22,3),(43,'MOV-0043','OUT','2026-05-06',5,110,'Review price',3,3,3,2),(44,'MOV-0044','IN','2026-06-13',40,82,'',3,1,15,1),(45,'MOV-0045','IN','2026-05-30',5,204,'Missing purchase quantity',4,1,4,1),(46,'MOV-0046','OUT','2026-06-23',10,114,'Duplicated supplier name',2,2,NULL,5),(47,'MOV-0047','OUT','2026-06-10',3,69,'',3,3,7,2),(48,'MOV-0048','IN','2026-05-20',12,152,'Duplicated supplier name',3,1,2,1),(49,'MOV-0049','OUT','2026-06-06',10,163,'',2,3,2,4),(50,'MOV-0050','IN','2026-05-05',15,102,'',4,3,9,3),(51,'MOV-0051','OUT','2026-05-19',8,198,'Review price',3,1,23,1),(52,'MOV-0052','OUT','2026-06-18',3,40,'Duplicated supplier name',3,3,16,3),(54,'MOV-0054','OUT','2026-05-22',8,112,'',3,1,1,5),(55,'MOV-0055','IN','2026-06-12',5,6,'Missing purchase quantity',3,2,23,4),(56,'MOV-0056','IN','2026-06-22',10,46,'Review price',1,2,5,3),(57,'MOV-0057','IN','2026-05-13',10,208,'',4,3,4,1),(58,'MOV-0058','OUT','2026-07-02',8,105,'Missing purchase quantity',5,3,22,5),(59,'MOV-0059','IN','2026-05-22',30,181,'Missing purchase quantity',2,1,1,5),(60,'MOV-0060','IN','2026-06-15',10,106,'Duplicated supplier name',5,1,21,5),(61,'MOV-0061','OUT','2026-06-22',5,239,'',2,3,24,1),(62,'MOV-0062','IN','2026-07-03',10,195,'City format inconsistent',3,2,19,2),(63,'MOV-0063','OUT','2026-06-02',5,169,'Duplicated supplier name',4,2,5,5),(64,'MOV-0064','IN','2026-07-02',8,3,'',3,1,14,2),(66,'MOV-0066','OUT','2026-05-13',1,42,'',1,1,18,1),(67,'MOV-0067','OUT','2026-05-18',2,20,'',1,3,1,2),(70,'MOV-0070','IN','2026-06-29',5,198,'City format inconsistent',4,2,17,2),(71,'MOV-0071','OUT','2026-06-26',3,8,'',1,2,18,1),(72,'MOV-0072','IN','2026-06-24',40,212,'Review price',4,2,1,1),(73,'MOV-0073','OUT','2026-06-26',5,93,'City format inconsistent',4,1,1,4),(75,'MOV-0075','IN','2026-06-14',15,77,'Duplicated supplier name',5,2,25,4),(76,'MOV-0076','OUT','2026-06-15',5,213,'City format inconsistent',4,3,18,3),(77,'MOV-0077','IN','2026-06-29',20,15,'',4,1,10,5),(80,'MOV-0080','IN','2026-05-13',5,121,'Missing purchase quantity',2,3,20,3);
/*!40000 ALTER TABLE `rm_movements` ENABLE KEYS */;
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
