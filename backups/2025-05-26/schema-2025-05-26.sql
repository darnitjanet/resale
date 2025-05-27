-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: resale_inventory
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pictures_taken` tinyint(1) DEFAULT NULL,
  `pictures_taken_status` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `pounds` decimal(10,2) DEFAULT NULL,
  `ounces` decimal(10,2) DEFAULT NULL,
  `platform_posted` varchar(255) DEFAULT NULL,
  `posted_price` decimal(10,2) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `potential_earnings` decimal(10,2) DEFAULT NULL,
  `sale_platform` varchar(255) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `days_on_market` decimal(10,2) DEFAULT NULL,
  `net_from_platform` decimal(10,2) DEFAULT NULL,
  `total_net` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `depop` varchar(255) DEFAULT NULL,
  `ebay` varchar(255) DEFAULT NULL,
  `etsy` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `kidizen` varchar(255) DEFAULT NULL,
  `mercari` varchar(255) DEFAULT NULL,
  `vestaire` varchar(255) DEFAULT NULL,
  `grailed` varchar(255) DEFAULT NULL,
  `poshmark` varchar(255) DEFAULT NULL,
  `curtsey` varchar(255) DEFAULT NULL,
  `profit_margin` decimal(6,2) DEFAULT NULL,
  `stale_after_30` date DEFAULT NULL,
  `is_stale` tinyint(1) DEFAULT NULL,
  `listing_url` varchar(1000) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `stale_label` varchar(3) DEFAULT NULL,
  `description` text,
  `material` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `condition_description` text,
  `color` varchar(255) DEFAULT NULL,
  `size_adult` varchar(255) DEFAULT NULL,
  `size_kids` varchar(255) DEFAULT NULL,
  `size_plus` varchar(255) DEFAULT NULL,
  `shoulder_to_shoulder` decimal(5,2) DEFAULT NULL,
  `shoulder_to_hem` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `waist_to_hem` decimal(5,2) DEFAULT NULL,
  `chest` decimal(5,2) DEFAULT NULL,
  `sleeve` decimal(5,2) DEFAULT NULL,
  `length_measurement` decimal(5,2) DEFAULT NULL,
  `inseam` decimal(5,2) DEFAULT NULL,
  `shoes_adult` varchar(255) DEFAULT NULL,
  `shoes_kids` varchar(255) DEFAULT NULL,
  `height_measure` decimal(5,2) DEFAULT NULL,
  `width_measure` decimal(5,2) DEFAULT NULL,
  `depth_measure` decimal(5,2) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `quality_score` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `uniq_item_combo` (`item`,`category`,`purchase_price`,`source`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `normalize_category` BEFORE INSERT ON `inventory` FOR EACH ROW SET NEW.category = CONCAT(UPPER(LEFT(NEW.category,1)), LOWER(SUBSTRING(NEW.category,2))) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_update_inventory` AFTER UPDATE ON `inventory` FOR EACH ROW BEGIN
  IF OLD.is_stale != NEW.is_stale THEN
    UPDATE inventory
    SET stale_label = IF(NEW.is_stale = 1, 'Yes', 'No')
    WHERE item_id = NEW.item_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventory_backup`
--

DROP TABLE IF EXISTS `inventory_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_backup` (
  `item_id` int NOT NULL DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pictures_taken` tinyint(1) DEFAULT NULL,
  `pictures_taken_status` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `pounds` decimal(10,2) DEFAULT NULL,
  `ounces` decimal(10,2) DEFAULT NULL,
  `platform_posted` varchar(255) DEFAULT NULL,
  `posted_price` decimal(10,2) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `potential_earnings` decimal(10,2) DEFAULT NULL,
  `sale_platform` varchar(255) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `days_on_market` decimal(10,2) DEFAULT NULL,
  `net_from_platform` decimal(10,2) DEFAULT NULL,
  `total_net` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `depop` varchar(255) DEFAULT NULL,
  `ebay` varchar(255) DEFAULT NULL,
  `etsy` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `kidizen` varchar(255) DEFAULT NULL,
  `mercari` varchar(255) DEFAULT NULL,
  `vestaire` varchar(255) DEFAULT NULL,
  `grailed` varchar(255) DEFAULT NULL,
  `poshmark` varchar(255) DEFAULT NULL,
  `curtsey` varchar(255) DEFAULT NULL,
  `profit_margin` decimal(6,2) DEFAULT NULL,
  `stale_after_30` date DEFAULT NULL,
  `is_stale` tinyint(1) DEFAULT NULL,
  `listing_url` varchar(1000) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `stale_label` varchar(3) DEFAULT NULL,
  `description` text,
  `material` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `condition_description` text,
  `color` varchar(255) DEFAULT NULL,
  `size_adult` varchar(255) DEFAULT NULL,
  `size_kids` varchar(255) DEFAULT NULL,
  `size_plus` varchar(255) DEFAULT NULL,
  `shoulder_to_shoulder` decimal(5,2) DEFAULT NULL,
  `shoulder_to_hem` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `waist_to_hem` decimal(5,2) DEFAULT NULL,
  `chest` decimal(5,2) DEFAULT NULL,
  `sleeve` decimal(5,2) DEFAULT NULL,
  `length_measurement` decimal(5,2) DEFAULT NULL,
  `inseam` decimal(5,2) DEFAULT NULL,
  `shoes_adult` varchar(255) DEFAULT NULL,
  `shoes_kids` varchar(255) DEFAULT NULL,
  `height_measure` decimal(5,2) DEFAULT NULL,
  `width_measure` decimal(5,2) DEFAULT NULL,
  `depth_measure` decimal(5,2) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `quality_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_backup_full`
--

DROP TABLE IF EXISTS `inventory_backup_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_backup_full` (
  `item_id` int NOT NULL DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pictures_taken` tinyint(1) DEFAULT NULL,
  `pictures_taken_status` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `pounds` decimal(10,2) DEFAULT NULL,
  `ounces` decimal(10,2) DEFAULT NULL,
  `platform_posted` varchar(255) DEFAULT NULL,
  `posted_price` decimal(10,2) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `potential_earnings` decimal(10,2) DEFAULT NULL,
  `sale_platform` varchar(255) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `days_on_market` decimal(10,2) DEFAULT NULL,
  `net_from_platform` decimal(10,2) DEFAULT NULL,
  `total_net` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `depop` varchar(255) DEFAULT NULL,
  `ebay` varchar(255) DEFAULT NULL,
  `etsy` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `kidizen` varchar(255) DEFAULT NULL,
  `mercari` varchar(255) DEFAULT NULL,
  `vestaire` varchar(255) DEFAULT NULL,
  `grailed` varchar(255) DEFAULT NULL,
  `poshmark` varchar(255) DEFAULT NULL,
  `curtsey` varchar(255) DEFAULT NULL,
  `profit_margin` decimal(6,2) DEFAULT NULL,
  `stale_after_30` date DEFAULT NULL,
  `is_stale` tinyint(1) DEFAULT NULL,
  `listing_url` varchar(1000) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `stale_label` varchar(3) DEFAULT NULL,
  `description` text,
  `material` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `condition_description` text,
  `color` varchar(255) DEFAULT NULL,
  `size_adult` varchar(255) DEFAULT NULL,
  `size_kids` varchar(255) DEFAULT NULL,
  `size_plus` varchar(255) DEFAULT NULL,
  `shoulder_to_shoulder` decimal(5,2) DEFAULT NULL,
  `shoulder_to_hem` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `waist_to_hem` decimal(5,2) DEFAULT NULL,
  `chest` decimal(5,2) DEFAULT NULL,
  `sleeve` decimal(5,2) DEFAULT NULL,
  `length_measurement` decimal(5,2) DEFAULT NULL,
  `inseam` decimal(5,2) DEFAULT NULL,
  `shoes_adult` decimal(5,2) DEFAULT NULL,
  `shoes_kids` decimal(5,2) DEFAULT NULL,
  `height_measure` decimal(5,2) DEFAULT NULL,
  `width_measure` decimal(5,2) DEFAULT NULL,
  `depth_measure` decimal(5,2) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `quality_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posted_statuses`
--

DROP TABLE IF EXISTS `posted_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posted_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_platforms`
--

DROP TABLE IF EXISTS `sale_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_platforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `platform` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synclog_old`
--

DROP TABLE IF EXISTS `synclog_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `synclog_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sync_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platforms_added` int DEFAULT '0',
  `links_added` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 21:21:48
