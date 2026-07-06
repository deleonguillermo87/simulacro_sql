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
-- Dumping data for table `rm_categories`
--

LOCK TABLES `rm_categories` WRITE;
/*!40000 ALTER TABLE `rm_categories` DISABLE KEYS */;
INSERT INTO `rm_categories` VALUES (1,'Accesorios'),(2,'Herramientas'),(3,'Materiales de ConstrucciÃ³n'),(4,'Pinturas'),(5,'Seguridad Industrial');
/*!40000 ALTER TABLE `rm_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_cities`
--

LOCK TABLES `rm_cities` WRITE;
/*!40000 ALTER TABLE `rm_cities` DISABLE KEYS */;
INSERT INTO `rm_cities` VALUES (1,'Barranquilla','Colombia'),(2,'BogotÃ¡','Colombia'),(3,'Cartagena','Colombia'),(4,'MedellÃ­n','Colombia');
/*!40000 ALTER TABLE `rm_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_employees`
--

LOCK TABLES `rm_employees` WRITE;
/*!40000 ALTER TABLE `rm_employees` DISABLE KEYS */;
INSERT INTO `rm_employees` VALUES (1,'Ana Torres'),(2,'Carlos Ruiz'),(3,'Laura MÃ©ndez'),(4,'Lina MejÃ­a'),(5,'Pedro GÃ³mez');
/*!40000 ALTER TABLE `rm_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_movements`
--

LOCK TABLES `rm_movements` WRITE;
/*!40000 ALTER TABLE `rm_movements` DISABLE KEYS */;
INSERT INTO `rm_movements` VALUES (1,'MOV-0001','IN','2026-06-23',8,8,'Missing purchase quantity',1,1,1,4),(2,'MOV-0002','IN','2026-06-04',25,194,'City format inconsistent',2,2,2,1),(3,'MOV-0003','OUT','2026-06-01',1,137,'',1,1,NULL,4),(4,'MOV-0004','OUT','2026-06-07',3,218,'City format inconsistent',3,2,3,5),(5,'MOV-0005','IN','2026-05-21',8,41,'',1,1,4,4),(6,'MOV-0006','IN','2026-05-05',12,54,'',1,2,5,1),(7,'MOV-0007','OUT','2026-06-03',8,191,'Review price',4,2,6,1),(8,'MOV-0008','OUT','2026-05-05',5,98,'Missing purchase quantity',3,1,5,1),(9,'MOV-0009','IN','2026-06-24',15,40,'',5,2,7,1),(10,'MOV-0010','IN','2026-06-25',40,138,'',5,2,8,4),(13,'MOV-0013','IN','2026-05-05',5,18,'',4,2,10,3),(15,'MOV-0015','IN','2026-06-05',5,186,'Duplicated supplier name',4,2,11,2),(16,'MOV-0016','IN','2026-05-26',30,25,'',4,2,9,3),(17,'MOV-0017','IN','2026-07-01',25,67,'City format inconsistent',4,1,12,5),(18,'MOV-0018','IN','2026-06-14',20,128,'',2,1,13,4),(19,'MOV-0019','IN','2026-06-25',12,158,'Missing purchase quantity',5,1,4,4),(20,'MOV-0020','OUT','2026-05-21',5,237,'Review price',2,3,14,4),(21,'MOV-0021','IN','2026-05-11',20,112,'Missing purchase quantity',3,1,15,4),(22,'MOV-0022','OUT','2026-05-11',2,72,'Duplicated supplier name',3,2,4,1),(23,'MOV-0023','OUT','2026-06-01',10,41,'Review price',5,3,NULL,4),(24,'MOV-0024','OUT','2026-05-16',2,32,'',5,1,2,1),(26,'MOV-0026','IN','2026-06-21',12,219,'Review price',1,1,11,1),(28,'MOV-0028','OUT','2026-05-09',3,155,'Missing purchase quantity',1,1,15,2),(29,'MOV-0029','OUT','2026-06-26',2,110,'City format inconsistent',4,1,NULL,4),(30,'MOV-0030','IN','2026-06-06',15,141,'Review price',5,2,8,2),(31,'MOV-0031','OUT','2026-05-26',3,113,'Review price',3,3,8,2),(32,'MOV-0032','OUT','2026-05-25',2,37,'Review price',3,3,16,4),(33,'MOV-0033','IN','2026-05-13',25,228,'',4,3,17,5),(34,'MOV-0034','OUT','2026-05-21',8,243,'',3,1,7,4),(35,'MOV-0035','OUT','2026-07-03',3,124,'',4,2,18,1),(36,'MOV-0036','OUT','2026-05-09',10,16,'Review price',1,3,7,5),(37,'MOV-0037','IN','2026-06-07',5,241,'Review price',4,1,5,4),(38,'MOV-0038','OUT','2026-05-04',10,215,'Missing purchase quantity',2,3,19,4),(39,'MOV-0039','IN','2026-05-10',25,97,'City format inconsistent',3,3,20,5),(40,'MOV-0040','IN','2026-05-02',5,193,'',1,3,19,4),(41,'MOV-0041','OUT','2026-06-07',2,199,'',2,1,21,4),(42,'MOV-0042','OUT','2026-05-27',2,178,'Missing purchase quantity',3,3,22,3),(43,'MOV-0043','OUT','2026-05-06',5,110,'Review price',3,3,3,2),(44,'MOV-0044','IN','2026-06-13',40,82,'',3,1,15,1),(45,'MOV-0045','IN','2026-05-30',5,204,'Missing purchase quantity',4,1,4,1),(46,'MOV-0046','OUT','2026-06-23',10,114,'Duplicated supplier name',2,2,NULL,5),(47,'MOV-0047','OUT','2026-06-10',3,69,'',3,3,7,2),(48,'MOV-0048','IN','2026-05-20',12,152,'Duplicated supplier name',3,1,2,1),(49,'MOV-0049','OUT','2026-06-06',10,163,'',2,3,2,4),(50,'MOV-0050','IN','2026-05-05',15,102,'',4,3,9,3),(51,'MOV-0051','OUT','2026-05-19',8,198,'Review price',3,1,23,1),(52,'MOV-0052','OUT','2026-06-18',3,40,'Duplicated supplier name',3,3,16,3),(54,'MOV-0054','OUT','2026-05-22',8,112,'',3,1,1,5),(55,'MOV-0055','IN','2026-06-12',5,6,'Missing purchase quantity',3,2,23,4),(56,'MOV-0056','IN','2026-06-22',10,46,'Review price',1,2,5,3),(57,'MOV-0057','IN','2026-05-13',10,208,'',4,3,4,1),(58,'MOV-0058','OUT','2026-07-02',8,105,'Missing purchase quantity',5,3,22,5),(59,'MOV-0059','IN','2026-05-22',30,181,'Missing purchase quantity',2,1,1,5),(60,'MOV-0060','IN','2026-06-15',10,106,'Duplicated supplier name',5,1,21,5),(61,'MOV-0061','OUT','2026-06-22',5,239,'',2,3,24,1),(62,'MOV-0062','IN','2026-07-03',10,195,'City format inconsistent',3,2,19,2),(63,'MOV-0063','OUT','2026-06-02',5,169,'Duplicated supplier name',4,2,5,5),(64,'MOV-0064','IN','2026-07-02',8,3,'',3,1,14,2),(66,'MOV-0066','OUT','2026-05-13',1,42,'',1,1,18,1),(67,'MOV-0067','OUT','2026-05-18',2,20,'',1,3,1,2),(70,'MOV-0070','IN','2026-06-29',5,198,'City format inconsistent',4,2,17,2),(71,'MOV-0071','OUT','2026-06-26',3,8,'',1,2,18,1),(72,'MOV-0072','IN','2026-06-24',40,212,'Review price',4,2,1,1),(73,'MOV-0073','OUT','2026-06-26',5,93,'City format inconsistent',4,1,1,4),(75,'MOV-0075','IN','2026-06-14',15,77,'Duplicated supplier name',5,2,25,4),(76,'MOV-0076','OUT','2026-06-15',5,213,'City format inconsistent',4,3,18,3),(77,'MOV-0077','IN','2026-06-29',20,15,'',4,1,10,5),(80,'MOV-0080','IN','2026-05-13',5,121,'Missing purchase quantity',2,3,20,3);
/*!40000 ALTER TABLE `rm_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_products`
--

LOCK TABLES `rm_products` WRITE;
/*!40000 ALTER TABLE `rm_products` DISABLE KEYS */;
INSERT INTO `rm_products` VALUES (1,'SKU-2001','Cemento gris 50kg','Bulto cemento gris uso general','Bulto',37700.00,3),(2,'SKU-1002','Broca acero 8mm','Broca HSS 8mm','UND',8200.00,1),(3,'SKU-4001','Casco de seguridad amarillo','Casco seguridad industrial','UND',22500.00,5),(4,'SKU-3001','Pintura vinilo blanca 5 galones','Vinilo blanco 5gl','CUN',167500.00,4),(5,'SKU-1001','Taladro industrial 1/2 pulg.','Taladro percutor industrial media pulgada','UND',285000.00,2);
/*!40000 ALTER TABLE `rm_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_purchase_items`
--

LOCK TABLES `rm_purchase_items` WRITE;
/*!40000 ALTER TABLE `rm_purchase_items` DISABLE KEYS */;
INSERT INTO `rm_purchase_items` VALUES (1,1,1,8,37700.00),(2,2,2,25,8200.00),(3,3,3,12,22500.00),(4,4,1,8,38200.00),(5,5,1,12,38200.00),(6,6,4,10,167500.00),(7,5,3,8,22500.00),(8,7,5,15,285000.00),(9,8,5,40,285000.00),(10,9,4,40,168000.00),(12,4,3,12,23500.00),(13,11,4,5,169000.00),(14,9,4,30,167500.00),(15,12,4,25,168000.00),(17,4,5,12,284700.00),(18,14,2,15,9500.00),(19,15,3,20,22500.00),(20,4,3,10,22500.00),(22,3,2,40,9000.00),(23,11,1,12,39200.00),(24,15,1,8,38000.00),(25,8,5,15,285000.00),(26,8,3,12,22200.00),(27,16,3,8,22500.00),(28,17,4,25,168000.00),(29,7,3,8,23000.00),(30,18,4,30,167500.00),(31,7,1,10,38700.00),(32,5,4,5,167700.00),(33,19,2,25,9500.00),(34,20,3,25,23000.00),(36,21,2,12,8500.00),(38,3,3,40,22500.00),(39,15,3,40,23000.00),(41,7,3,20,23500.00),(42,2,3,12,23000.00),(43,2,2,10,8500.00),(44,9,4,15,168000.00),(45,23,3,8,23000.00),(46,16,3,8,22500.00),(47,13,3,15,23500.00),(49,23,3,5,23500.00),(50,5,1,10,39000.00),(51,4,4,10,169000.00),(52,22,5,40,285000.00),(53,1,2,30,9000.00),(54,21,5,10,286000.00),(55,24,2,10,8500.00),(56,19,3,10,23000.00),(57,5,4,5,168500.00),(58,14,3,8,23000.00),(59,2,1,8,39000.00),(60,18,1,25,39000.00),(61,1,1,40,39200.00),(62,6,2,30,8500.00),(63,25,4,15,168500.00),(64,17,4,5,169000.00),(65,18,1,10,39000.00),(66,1,4,40,168000.00),(67,1,4,12,168500.00),(68,4,1,50,39200.00),(69,25,5,15,285000.00),(70,18,4,40,168500.00),(72,16,2,5,8500.00),(73,16,2,15,8500.00);
/*!40000 ALTER TABLE `rm_purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_purchases`
--

LOCK TABLES `rm_purchases` WRITE;
/*!40000 ALTER TABLE `rm_purchases` DISABLE KEYS */;
INSERT INTO `rm_purchases` VALUES (1,'PO-2026-005','2026-06-17',1),(2,'PO-2026-023','2026-06-04',1),(3,'PO-2026-012','2026-06-06',3),(4,'PO-2026-022','2026-05-18',3),(5,'PO-2026-025','2026-05-04',2),(6,'PO-2026-021','2026-05-30',2),(7,'PO-2026-018','2026-06-18',1),(8,'PO-2026-010','2026-06-23',2),(9,'PO-2026-006','2026-05-17',2),(10,'PO-2026-008','2026-05-05',4),(11,'PO-2026-014','2026-05-30',1),(12,'PO-2026-007','2026-06-25',2),(13,'PO-2026-002','2026-06-07',4),(14,'PO-2026-011','2026-05-16',3),(15,'PO-2026-009','2026-05-09',1),(16,'PO-2026-020','2026-05-22',1),(17,'PO-2026-019','2026-05-13',1),(18,'PO-2026-024','2026-06-25',4),(19,'PO-2026-016','2026-05-02',2),(20,'PO-2026-001','2026-05-06',1),(21,'PO-2026-004','2026-06-06',2),(22,'PO-2026-013','2026-05-26',1),(23,'PO-2026-003','2026-05-16',2),(24,'PO-2026-017','2026-06-17',2),(25,'PO-2026-015','2026-06-24',3);
/*!40000 ALTER TABLE `rm_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_suppliers`
--

LOCK TABLES `rm_suppliers` WRITE;
/*!40000 ALTER TABLE `rm_suppliers` DISABLE KEYS */;
INSERT INTO `rm_suppliers` VALUES (1,'S-001','FerreterÃ­a Andina S.A.S.','900-111-222-1','601 555 0101',2),(2,'S-003','Aceros del Norte Ltda.','901-333-444-5','605 333 2222',1),(3,'S-005','TecnoTornillos Colombia','901-777-888-2','604 444 9090',4),(4,'S-007','Pinturas Caribe S.A.','900-999-111-3','605 666 1212',3);
/*!40000 ALTER TABLE `rm_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rm_warehouses`
--

LOCK TABLES `rm_warehouses` WRITE;
/*!40000 ALTER TABLE `rm_warehouses` DISABLE KEYS */;
INSERT INTO `rm_warehouses` VALUES (1,'WH-BAQ-01','Bodega Principal Barranquilla','Via 40 # 72-10',1),(2,'WH-MED-01','Bodega MedellÃ­n Sur','Cra 50 # 10-20',4),(3,'WH-BOG-01','Centro LogÃ­stico BogotÃ¡','Calle 80 # 90-15',2);
/*!40000 ALTER TABLE `rm_warehouses` ENABLE KEYS */;
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

-- Dump completed on 2026-07-05 21:52:12
