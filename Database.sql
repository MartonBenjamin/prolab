CREATE DATABASE  IF NOT EXISTS `garagedoordatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `garagedoordatabase`;
-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: garagedoordatabase
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_bids_orders_order_id_id` (`order_id`),
  CONSTRAINT `FK_bids_orders_order_id_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `zip` char(4) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`zip`),
  UNIQUE KEY `zip` (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garagedoors`
--

DROP TABLE IF EXISTS `garagedoors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garagedoors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `material` int(11) NOT NULL,
  `style` int(11) NOT NULL,
  `smartdoor` tinyint(4) NOT NULL,
  `craft_date` datetime NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_garagedoors_style_style_id` (`style`),
  KEY `FK_garagedoors_material_materials_id` (`material`),
  KEY `FK_garagedoors_orders_ordernum_id` (`ordernum`),
  CONSTRAINT `FK_garagedoors_material_materials_id` FOREIGN KEY (`material`) REFERENCES `materials` (`id`),
  CONSTRAINT `FK_garagedoors_orders_ordernum_id` FOREIGN KEY (`ordernum`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_garagedoors_style_style_id` FOREIGN KEY (`style`) REFERENCES `style` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garagedoors`
--

LOCK TABLES `garagedoors` WRITE;
/*!40000 ALTER TABLE `garagedoors` DISABLE KEYS */;
INSERT  IGNORE INTO `garagedoors` VALUES (1,'csakegynev','egyjelszo',120,140,1,1,0,'2020-04-27 12:26:51',1),(2,'második ajtó','Egy második ajtó',100,120,1,1,1,'2020-04-27 12:27:12',1);
/*!40000 ALTER TABLE `garagedoors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT  IGNORE INTO `materials` VALUES (1,'wood');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL DEFAULT 1,
  `message` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_messages_users_from_id` (`from`),
  KEY `FK_messages_usersto_id` (`to`),
  CONSTRAINT `FK_messages_users_from_id` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_messages_usersto_id` FOREIGN KEY (`to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_images`
--

DROP TABLE IF EXISTS `order_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(250) COLLATE utf8_hungarian_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_images_orders_orderid_id` (`order_id`),
  CONSTRAINT `FK_order_images_orders_orderid_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_images`
--

LOCK TABLES `order_images` WRITE;
/*!40000 ALTER TABLE `order_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordered_by` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `description` varchar(1200) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_users_ordered_by_id` (`ordered_by`),
  CONSTRAINT `FK_orders_users_ordered_by_id` FOREIGN KEY (`ordered_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT  IGNORE INTO `orders` VALUES (1,11,'2020-04-28 17:35:17','Ez is egy teszt');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `ordered` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT  IGNORE INTO `parts` VALUES (1,'elsoalkatresz',200,10,25),(2,'masodikalkatresz',300,20,300);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partstodoor`
--

DROP TABLE IF EXISTS `partstodoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partstodoor` (
  `doorid` int(11) NOT NULL,
  `partid` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  KEY `FK_partstodoor_parts_id_id` (`partid`),
  KEY `FK_partstodoor_doors_id_id` (`doorid`),
  CONSTRAINT `FK_partstodoor_doors_id_id` FOREIGN KEY (`doorid`) REFERENCES `garagedoors` (`id`),
  CONSTRAINT `FK_partstodoor_parts_id_id` FOREIGN KEY (`partid`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partstodoor`
--

LOCK TABLES `partstodoor` WRITE;
/*!40000 ALTER TABLE `partstodoor` DISABLE KEYS */;
INSERT  IGNORE INTO `partstodoor` VALUES (1,1,10),(1,2,3);
/*!40000 ALTER TABLE `partstodoor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT  IGNORE INTO `states` VALUES (1,'Data processing'),(2,'Data processed'),(3,'Waiting for parts'),(4,'Under fabricate'),(5,'Fabricated'),(6,'Waiting for installation'),(7,'Installed');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT  IGNORE INTO `style` VALUES (1,'lefttoright');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `garagedoor_id` int(11) NOT NULL,
  `ordered_by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `parts installed` int(11) NOT NULL DEFAULT 0,
  `partsneeded` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_TRACKING_states_state_id` (`state`),
  KEY `FK_TRACKING_users_ordered_by_id` (`ordered_by`),
  KEY `FK_tracking_doors_id_id` (`garagedoor_id`),
  KEY `FK_tracking_orders_order_id_id` (`order_id`),
  CONSTRAINT `FK_TRACKING_states_state_id` FOREIGN KEY (`state`) REFERENCES `states` (`id`),
  CONSTRAINT `FK_TRACKING_users_ordered_by_id` FOREIGN KEY (`ordered_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_tracking_doors_id_id` FOREIGN KEY (`garagedoor_id`) REFERENCES `garagedoors` (`id`),
  CONSTRAINT `FK_tracking_orders_order_id_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `firstname` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
  `lastname` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` date NOT NULL,
  `token` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `groupid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT  IGNORE INTO `users` VALUES (10,'tesztuser','$2b$10$1g5314hOAbaONJks2t70NeWbenqaV4oRboMn8wAbe9xk8zUXlqN6S','tesztemail@asd.asd','tesztnev','tesztnevmasodik','2020-04-23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoidGVzenR1c2VyIiwiaWF0IjoxNTg3NzM0OTQxLCJleHAiOjE1ODc3Mzg1NDF9.PUAxbQ7RlctzJOk4ZA6bm5Aj9acCjByMOv-WpAMDLy0',1),(11,'csakegynev','$2b$10$k5T9bP.wpHknBKbjq8UdIO2HL7pfwbq3a/hkbm5JMH9ibE3hN9Fo.','tesztemailas@asd.asd','tesztnev','tesztnevmasodik','2020-04-23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInVzZXJuYW1lIjoiY3Nha2VneW5ldiIsImlhdCI6MTU4ODc3MDM5OCwiZXhwIjoxNTg4NzczOTk4fQ.zNlZVGwbFuILVNdRJZYJVRFbiyH0OnbX5xtPNXyoNWg',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 17:31:40
