-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(45) NOT NULL,
  `preview_img` varchar(45) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Одежда','kartin'),(2,'Худи','kartin');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `link` varchar(45) NOT NULL,
  `ALT` varchar(45) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'link for image','image here'),(2,'link for image','image here');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `main_categories_id` int NOT NULL AUTO_INCREMENT,
  `categories_section_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`main_categories_id`,`categories_section_id`,`product_id`),
  KEY `fk_main_categories_categories_idx` (`categories_section_id`),
  KEY `fk_main_categories_product1_idx` (`product_id`),
  CONSTRAINT `fk_main_categories_categories` FOREIGN KEY (`categories_section_id`) REFERENCES `categories` (`section_id`),
  CONSTRAINT `fk_main_categories_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (1,1,13),(2,1,14),(3,1,15),(4,1,16),(5,1,17),(6,1,18),(7,1,19),(8,1,20),(9,1,21),(10,1,22),(11,1,23),(12,1,24),(13,1,25);
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_product_image`
--

DROP TABLE IF EXISTS `main_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_product_image` (
  `main_product_image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`main_product_image_id`,`product_id`,`image_id`),
  KEY `fk_main_product_image_product1_idx` (`product_id`),
  KEY `fk_main_product_image_image1_idx` (`image_id`),
  CONSTRAINT `fk_main_product_image_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  CONSTRAINT `fk_main_product_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_product_image`
--

LOCK TABLES `main_product_image` WRITE;
/*!40000 ALTER TABLE `main_product_image` DISABLE KEYS */;
INSERT INTO `main_product_image` VALUES (1,13,1),(2,14,1),(3,15,1),(4,16,1),(5,17,1),(6,18,1),(7,19,1),(8,20,1),(9,21,1),(10,22,1),(11,23,1),(12,24,1),(13,25,1);
/*!40000 ALTER TABLE `main_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `availability` tinyint NOT NULL,
  `full_price` double NOT NULL,
  `promo_price` double NOT NULL,
  `descripiton` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (13,'Худи1',1000,1,1200,1100,'cool_hoodi'),(14,'Худи2',1000,1,1200,1100,'cool_hoodi'),(15,'Худи3',1000,1,1200,1100,'cool_hoodi'),(16,'Худи4',1000,1,1200,1100,'cool_hoodi'),(17,'Худи5',1000,1,1200,1100,'cool_hoodi'),(18,'Худи6',1000,0,1200,1100,'cool_hoodi'),(19,'Худи7',1000,1,1200,1100,'cool_hoodi'),(20,'Худи8',1000,0,1200,1100,'cool_hoodi'),(21,'Худи9',1000,1,1200,1100,'cool_hoodi'),(22,'Худи10',1000,1,1200,1100,'cool_hoodi'),(23,'Худи11',1000,1,1200,1100,'cool_hoodi'),(24,'Худи12',1000,1,1200,1100,'cool_hoodi'),(25,'Худи13',1000,1,1200,1100,'cool_hoodi');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_product_category`
--

DROP TABLE IF EXISTS `secondary_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_product_category` (
  `secondary_product_category_id` int NOT NULL AUTO_INCREMENT,
  `categories_section_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`secondary_product_category_id`,`categories_section_id`,`product_id`),
  KEY `fk_secondary_product_category_categories1_idx` (`categories_section_id`),
  KEY `fk_secondary_product_category_product1_idx` (`product_id`),
  CONSTRAINT `fk_secondary_product_category_categories1` FOREIGN KEY (`categories_section_id`) REFERENCES `categories` (`section_id`),
  CONSTRAINT `fk_secondary_product_category_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_product_category`
--

LOCK TABLES `secondary_product_category` WRITE;
/*!40000 ALTER TABLE `secondary_product_category` DISABLE KEYS */;
INSERT INTO `secondary_product_category` VALUES (1,2,13),(2,2,14),(3,2,15),(4,2,16),(5,2,17),(6,2,18),(7,2,19),(8,2,20),(9,2,21),(10,2,22),(11,2,23),(12,2,24),(13,2,25);
/*!40000 ALTER TABLE `secondary_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_product_image`
--

DROP TABLE IF EXISTS `secondary_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_product_image` (
  `secondary_product_image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`secondary_product_image_id`,`product_id`,`image_id`),
  KEY `fk_secondary_product_image_product1_idx` (`product_id`),
  KEY `fk_secondary_product_image_image1_idx` (`image_id`),
  CONSTRAINT `fk_secondary_product_image_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  CONSTRAINT `fk_secondary_product_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_product_image`
--

LOCK TABLES `secondary_product_image` WRITE;
/*!40000 ALTER TABLE `secondary_product_image` DISABLE KEYS */;
INSERT INTO `secondary_product_image` VALUES (1,13,2),(2,14,2),(3,15,2),(4,16,2),(5,17,2),(6,18,2),(7,19,2),(8,20,2),(9,21,2),(10,22,2),(11,23,2),(12,24,2),(13,25,2);
/*!40000 ALTER TABLE `secondary_product_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 20:05:25
