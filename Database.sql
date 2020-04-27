-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: garagedoordatabase
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

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
  PRIMARY KEY (`id`),
  KEY `FK_garagedoors_materials_materialid_id` (`material`),
  KEY `FK_garagedoors_style_style_id` (`style`),
  CONSTRAINT `FK_garagedoors_materials_materialid_id` FOREIGN KEY (`material`) REFERENCES `materials` (`id`),
  CONSTRAINT `FK_garagedoors_style_style_id` FOREIGN KEY (`style`) REFERENCES `style` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garagedoors`
--

/*!40000 ALTER TABLE `garagedoors` DISABLE KEYS */;
INSERT INTO `garagedoors` VALUES (1,'csakegynev','egyjelszo',120,140,1,1,0,'2020-04-27 12:26:51');
/*!40000 ALTER TABLE `garagedoors` ENABLE KEYS */;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `material_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'wood');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

--
-- Table structure for table `order_images`
--

DROP TABLE IF EXISTS `order_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_images` (
  `id` int(11) NOT NULL,
  `path` varchar(250) COLLATE utf8_hungarian_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_images_orders_orderid_id` (`order_id`),
  CONSTRAINT `fk_order_images_orders_orderid_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_images`
--

/*!40000 ALTER TABLE `order_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_images` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ordered_by` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `description` varchar(1200) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_users_ordered_by_id` (`ordered_by`),
  CONSTRAINT `FK_orders_users_ordered_by_id` FOREIGN KEY (`ordered_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;

--
-- Table structure for table `partstodoor`
--

DROP TABLE IF EXISTS `partstodoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partstodoor` (
  `doorid` int(11) NOT NULL,
  `partid` int(11) NOT NULL,
  PRIMARY KEY (`doorid`),
  KEY `FK_partstodoor_parts_pariid_id` (`partid`),
  CONSTRAINT `FK_partstodoor_garagedoor_doorid_id` FOREIGN KEY (`doorid`) REFERENCES `garagedoors` (`id`),
  CONSTRAINT `FK_partstodoor_parts_pariid_id` FOREIGN KEY (`partid`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partstodoor`
--

/*!40000 ALTER TABLE `partstodoor` DISABLE KEYS */;
/*!40000 ALTER TABLE `partstodoor` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'lefttoright');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'tesztuser','$2b$10$1g5314hOAbaONJks2t70NeWbenqaV4oRboMn8wAbe9xk8zUXlqN6S','tesztemail@asd.asd','tesztnev','tesztnevmasodik','2020-04-23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoidGVzenR1c2VyIiwiaWF0IjoxNTg3NzM0OTQxLCJleHAiOjE1ODc3Mzg1NDF9.PUAxbQ7RlctzJOk4ZA6bm5Aj9acCjByMOv-WpAMDLy0',1);
INSERT INTO `users` VALUES (11,'csakegynev','$2b$10$k5T9bP.wpHknBKbjq8UdIO2HL7pfwbq3a/hkbm5JMH9ibE3hN9Fo.','tesztemailas@asd.asd','tesztnev','tesztnevmasodik','2020-04-23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInVzZXJuYW1lIjoiY3Nha2VneW5ldiIsImlhdCI6MTU4Nzk4NzYzMywiZXhwIjoxNTg3OTkxMjMzfQ.xVszM1zdYOqIzeCIRTQ4vbpGg0Px5tE8lax-5TK24xU',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 14:52:09
