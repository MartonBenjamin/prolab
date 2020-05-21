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
INSERT  IGNORE INTO `city` VALUES ('2794','Tápióbicske'),('3300','Eger'),('8087','Alcsútdoboz'),('8088','Tabajd');
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
  `name` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garagedoors`
--

LOCK TABLES `garagedoors` WRITE;
/*!40000 ALTER TABLE `garagedoors` DISABLE KEYS */;
INSERT  IGNORE INTO `garagedoors` VALUES (1,'csakegynev','egyjelszo',120,140,1,1,0,'2020-04-27 12:26:51',1),(2,'második ajtó','Egy második ajtó',100,120,1,1,1,'2020-04-27 12:27:12',1),(6,'BasicDoor','I need a dor from wood which is very basic. It opens to top. My only request is just it should work from mobile.',400,200,1,2,1,'0000-00-00 00:00:00',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT  IGNORE INTO `materials` VALUES (1,'wood'),(2,'iron'),(3,'steel'),(4,'plastic'),(5,'carbon');
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
  `to` int(11) NOT NULL DEFAULT 111,
  `message` varchar(2500) CHARACTER SET utf8mb4 NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_messages_users_from_id` (`from`),
  KEY `FK_messages_usersto_id` (`to`),
  CONSTRAINT `FK_messages_users_from_id` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_messages_usersto_id` FOREIGN KEY (`to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT  IGNORE INTO `messages` VALUES (2,10,11,'Teszt üzi','2020-05-19 13:55:37'),(6,10,10,'Szia ez egy teszt üzi','2020-05-19 14:22:12'),(7,11,10,'Ez egy második teszt üzenet lenne.','2020-05-19 14:29:34'),(8,10,111,'Admin üzenet teszt','2020-05-19 14:46:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_images`
--

LOCK TABLES `order_images` WRITE;
/*!40000 ALTER TABLE `order_images` DISABLE KEYS */;
INSERT  IGNORE INTO `order_images` VALUES (1,'./images/basicdoor.jpg',2);
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
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` varchar(1200) COLLATE utf8_hungarian_ci NOT NULL,
  `isAccepted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_orders_users_ordered_by_id` (`ordered_by`),
  CONSTRAINT `FK_orders_users_ordered_by_id` FOREIGN KEY (`ordered_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT  IGNORE INTO `orders` VALUES (1,10,'2020-04-28 15:35:17','Ez is egy teszt',0),(2,10,'2020-05-21 07:02:56','I need a dor from wood which is very basic. It opens to top. My only request is just it should work from mobile.',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT  IGNORE INTO `parts` VALUES (1,'elsoalkatresz',200,10,25),(2,'masodikalkatresz',300,20,300),(3,'léptetőmotor',250,2500,0),(4,'elektromos emelőszerkezet',450,1200,0),(5,'fa alap',200,8000,2000),(6,'fém alap',240,9120,1200),(7,'vas alap',230,4300,1000),(8,'carbon alap',560,2300,200);
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
INSERT  IGNORE INTO `partstodoor` VALUES (1,1,10),(1,2,3),(6,5,25),(6,4,2),(6,3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT  IGNORE INTO `style` VALUES (1,'lefttoright'),(2,'bottotop');
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
  `parts_installed` int(11) NOT NULL DEFAULT 0,
  `parts_needed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_TRACKING_states_state_id` (`state`),
  KEY `FK_TRACKING_users_ordered_by_id` (`ordered_by`),
  KEY `FK_tracking_doors_id_id` (`garagedoor_id`),
  KEY `FK_tracking_orders_order_id_id` (`order_id`),
  CONSTRAINT `FK_TRACKING_states_state_id` FOREIGN KEY (`state`) REFERENCES `states` (`id`),
  CONSTRAINT `FK_TRACKING_users_ordered_by_id` FOREIGN KEY (`ordered_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_tracking_doors_id_id` FOREIGN KEY (`garagedoor_id`) REFERENCES `garagedoors` (`id`),
  CONSTRAINT `FK_tracking_orders_order_id_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT  IGNORE INTO `tracking` VALUES (1,2,6,10,2,0,29);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `groupid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT  IGNORE INTO `users` VALUES (10,'tesztuser','$2b$10$1g5314hOAbaONJks2t70NeWbenqaV4oRboMn8wAbe9xk8zUXlqN6S','tesztemail@asd.asd','tesztnev','tesztnevmasodik','2020-04-22 22:00:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoidGVzenR1c2VyIiwiaWF0IjoxNTg5OTA3MDU2LCJleHAiOjE1ODk5MTA2NTZ9.S_DYSL3ALTYBocjI92UvJ4QD_nokZb0ANLBoAsQdqds',1),(11,'csakegynev','$2b$10$k5T9bP.wpHknBKbjq8UdIO2HL7pfwbq3a/hkbm5JMH9ibE3hN9Fo.','tesztemailas@asd.asd','tesztnev','tesztnevmasodik','2020-04-22 22:00:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInVzZXJuYW1lIjoiY3Nha2VneW5ldiIsImlhdCI6MTU4OTg4MzUxNywiZXhwIjoxNTg5ODg3MTE3fQ.8cydj5SEeqfbhnFTQqFYFbawTzJEZi3uUzEX-XgtF-I',2),(111,'manager','$2b$10$YTSyqbh11.dnT3OVTLYNlOm1AKSrWMZSJNXOiHuTdUiV7NbK0WNXW','none','manager','messages','2020-05-18 22:00:00',NULL,1),(112,'emben','$2b$10$rNnCYdZ0/9k.CY8A3aQa0O/HIMS1U4gGXfTHrsFKhBGgdre7cYwcq','nincs','titkos','nev','2020-05-19 13:58:29',NULL,1);
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

-- Dump completed on 2020-05-21  9:43:18
