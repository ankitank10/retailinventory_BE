-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: retail_inventory_system
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `line1` varchar(255) DEFAULT NULL,
                             `line2` varchar(255) DEFAULT NULL,
                             `city` varchar(45) DEFAULT NULL,
                             `state` varchar(45) DEFAULT NULL,
                             `country` varchar(45) DEFAULT NULL,
                             `phone` varchar(10) DEFAULT NULL,
                             `pincode` int DEFAULT NULL,
                             `user_id` int NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `fk_addresses_users1_idx` (`user_id`),
                             CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Test Address','Test Address','New Delhi','Delhi','India','9855698981',110045,1),(2,'Test Address 2','Gollahalli, Electronic City','Bangalore','Karnataka','India','9855698981',560100,1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `title` varchar(255) NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Clothing'),(2,'Footwear'),(3,'Accessories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `user_id` int NOT NULL,
                          PRIMARY KEY (`id`),
                          KEY `fk_orders_users1_idx` (`user_id`),
                          CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1),(8,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(6,2),(42,2),(43,2),(44,2),(63,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
                                  `id` int NOT NULL AUTO_INCREMENT,
                                  `order_id` int NOT NULL,
                                  `product_id` int NOT NULL,
                                  `quantity` int NOT NULL DEFAULT '1',
                                  PRIMARY KEY (`id`),
                                  KEY `fk_orders_has_products_products1_idx` (`product_id`),
                                  KEY `fk_orders_has_products_orders1_idx` (`order_id`),
                                  CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                  CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
INSERT INTO `orders_details` VALUES (1,6,27,1),(2,6,26,1),(3,6,49,1),(4,7,4,1),(5,8,38,1),(6,8,5,1),(7,8,53,1),(9,24,26,1),(10,24,49,1),(11,24,38,1),(12,24,27,1),(45,39,1,3),(46,39,13,3),(47,39,18,2),(49,40,1,2),(50,40,18,1),(51,40,38,2),(52,40,13,2),(53,41,31,2),(54,42,1,2),(55,42,18,1),(56,42,38,2),(57,42,13,2),(58,43,13,2),(59,43,1,2),(60,43,18,1),(61,43,38,2),(62,44,1,2),(63,44,32,3),(64,44,13,8),(65,44,18,5),(66,52,4,1),(67,53,7,1),(68,54,1,1),(69,55,3,6),(70,56,1,1),(71,56,4,1),(72,56,7,1),(73,56,6,1),(74,57,2,1),(75,57,3,1),(76,58,3,1),(77,58,2,1),(78,59,2,1),(79,59,3,1),(80,60,2,1),(81,60,3,1),(82,61,2,1),(83,61,3,1),(84,62,1,1),(85,62,4,1),(86,63,1,2),(87,63,18,5),(88,63,32,3),(89,63,13,8),(90,64,1,1),(91,64,2,1),(92,65,2,1),(93,65,3,1),(94,66,2,1),(95,67,3,2),(96,67,2,3),(97,68,8,2),(98,68,7,1),(99,69,5,2),(100,69,6,1),(101,70,2,1),(102,70,3,1),(103,71,2,1),(104,71,1,2),(105,71,4,6),(106,71,3,3),(107,72,1,1),(108,72,3,1),(109,73,6,2),(110,73,4,1),(111,74,5,1),(112,75,6,1),(113,76,2,1),(114,77,2,1),(115,77,3,1),(116,78,1,1),(117,78,2,1),(118,79,6,2),(119,79,8,1),(120,79,7,1),(121,80,1,1),(122,80,2,3),(123,81,4,3),(124,81,2,6),(125,81,3,6),(126,82,2,1),(127,82,3,1),(128,83,5,1),(129,85,3,3),(130,85,6,4),(131,85,4,1),(132,86,2,1),(133,87,4,3),(134,87,6,1),(135,89,7,4),(136,89,4,2),(137,89,5,3),(138,89,6,8),(139,90,4,4),(140,91,2,1),(141,93,2,1),(142,93,3,1),(143,94,2,1),(144,94,3,3),(145,95,5,1),(146,95,3,1),(147,95,2,1),(148,96,2,8),(149,96,4,1),(150,96,3,1),(151,97,6,1),(152,97,5,1),(153,98,3,6),(154,98,4,3),(155,99,2,14),(156,99,5,2),(157,100,2,5),(158,101,3,1),(159,102,3,3),(160,103,2,1),(161,103,4,3),(162,104,1,2),(163,104,32,3),(164,104,13,8),(165,104,18,5),(166,105,1,2),(167,105,32,3),(168,105,18,5),(169,105,13,8),(170,106,13,8),(171,106,1,2),(172,106,32,3),(173,106,18,5),(174,107,1,2),(175,107,18,5),(176,107,32,3),(177,107,13,8),(178,108,2,1),(179,109,2,1),(180,110,5,1),(181,110,4,1),(182,111,6,4),(183,111,7,1),(184,112,5,1),(185,112,2,1),(186,112,3,1),(187,113,2,1),(188,114,3,1),(189,115,2,1),(190,115,3,1),(191,116,3,1),(192,116,5,6),(193,117,4,1),(194,117,5,1),(195,118,2,1),(196,119,3,1);
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `title` varchar(255) NOT NULL,
                            `image` varchar(255) NOT NULL,
                            `images` text CHARACTER SET utf8 COLLATE utf8_general_ci,
                            `description` text NOT NULL,
                            `price` float NOT NULL,
                            `quantity` int NOT NULL,
                            `short_desc` varchar(255) NOT NULL,
                            `cat_id` int DEFAULT NULL,
                            `subcat_id` int NOT NULL,
                            `color` varchar(20) DEFAULT NULL,
                            `discount` int DEFAULT '0',
                            PRIMARY KEY (`id`),
                            KEY `products_ibfk_1` (`cat_id`),
                            FULLTEXT KEY `description` (`description`),
                            CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Adidas shoes men','https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80','','A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',240.99,1,'SPORTS SHOES',2,6,'Red',0),(2,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg;https://i.ebayimg.com/images/g/eQgAAOSw2XdePfc0/s-l640.jpg;https://i.ebayimg.com/images/g/j~gAAOSwQ6FdG9Eh/s-l640.jpg;https://i.ebayimg.com/images/g/OesAAOSwDnpeJhWN/s-l640.jpg','The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,51,'SPORTS SHOES',2,6,'Blue',0),(3,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,69,'SPORTS SHOES',2,8,'Red',15),(4,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,78,'Gaming console',3,15,'Red',0),(5,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,83,'Gaming console',3,15,'Blue',0),(6,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,1,'SPORTS SHOES',2,6,'Blue',0),(7,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,95,'SPORTS SHOES',2,8,'Red',15),(8,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(9,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(10,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(11,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(12,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(13,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,68,'Gaming console',3,15,'Blue',0),(14,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(15,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(16,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(17,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(18,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,80,'SPORTS SHOES',2,6,'Blue',0),(19,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(20,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(21,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(22,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(23,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(24,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(25,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(26,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(27,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(28,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(29,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(30,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(31,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(32,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,88,'Gaming console',3,15,'Red',0),(33,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Red',0),(34,'WOMEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,7,'Blue',0),(35,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Blue',0),(36,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Red',25),(37,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Red',0),(38,'WOMEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,7,'Blue',0),(39,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Blue',0),(40,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(41,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(42,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(43,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Blue',0),(44,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Blue',0),(45,'MEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,8,'Red',15),(46,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Red',0),(47,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Red',0),(48,'WOMEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,7,'Blue',0),(49,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Blue',0),(50,'PlayStation 4','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd',NULL,'With PS4, gaming becomes a lot more power packed. Ultra-fast processors, high-performance system, real-time game sharing, remote play and lots more makes it the ultimate companion device.',240.99,100,'Gaming console',3,15,'Red',25),(51,'PEGASUS 33 Running Shoes For Men','https://i.pinimg.com/originals/43/40/8e/43408ee5a8d234752ecf80bbc3832e65.jpg',NULL,'The Nike Zoom Pegasus Turbo 2 is updated with a feather-light upper, while innovative foam brings revolutionary responsiveness to your long-distance training',59.99,100,'SPORTS SHOES',2,6,'Red',0),(52,'WOMEN\'S ADIDAS RUNNING KALUS SHOES','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrEqFHfSbs6rUzcYnN_PcnS_D2JLXusKMVFk4Y8N_tn3hJgNIf',NULL,'A well cushioned shoe with a fresher look that will appeal to young runners. Features Mesh upper for maximum ventilation, lightstrike IMEVA midsole with visible adiprene providing protection from harmful impact forces and durable Rubber outsole for long-lasting wear',39.99,100,'SPORTS SHOES',2,7,'Blue',0),(53,'Xbox One X Star Wars Jedi','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ8ufSADR9EyusxEfgMLErqISEcKVzQyjoD81zWcdpBvuEGBnYP',NULL,'Own the Xbox One X Star Wars Jedi: Fallen Order™ Bundle and step into the role of a Jedi Padawan who narrowly escaped the purge of Order 66. This bundle includes a full-game download of Star Wars Jedi: Fallen Order™ Deluxe Edition, a 1-month trial of Xbox Game Pass for console and Xbox Live Gold, and 1-month of EA Access.***',250,100,'Gaming console',3,15,'Blue',0),(55,'Men\' Shirt','https://images.unsplash.com/photo-1594938291221-94f18cbb5660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',NULL,'Decent shirt with grace and look',250,100,'SHIRTS',1,1,'BLUE',0),(56,'Men\' Shirt','https://images.unsplash.com/photo-1594938291221-94f18cbb5660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',NULL,'Decent shirt with grace and look',250,100,'SHIRTS',1,1,'BLUE',0),(57,'Men\' Shirt','https://images.unsplash.com/photo-1594938291221-94f18cbb5660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',NULL,'Decent shirt with grace and look',250,100,'SHIRTS',1,1,'BLUE',0),(58,'Men\' Shirt','https://images.unsplash.com/photo-1594938291221-94f18cbb5660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',NULL,'Decent shirt with grace and look',250,100,'SHIRTS',1,1,'BLUE',0),(59,'Men\' Shirt','https://images.unsplash.com/photo-1594938291221-94f18cbb5660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',NULL,'Decent shirt with grace and look',250,100,'SHIRTS',1,1,'BLUE',0),(60,'KIDS\' SHORTS','https://images.unsplash.com/photo-1591195853828-11db59a44f6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2550&q=80',NULL,'Decent SHORTS with grace and look',250,100,'CLOTHING',1,3,'BLUE',0),(61,'Women decent clothing','https://images.unsplash.com/photo-1541101767792-f9b2b1c4f127?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1232&q=80',NULL,'Women clothing by brand',250,5,'CLOTHING',1,2,'White',0),(62,'Women decent clothing','https://images.unsplash.com/photo-1554568218-0f1715e72254?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80',NULL,'Women clothing by brand',250,5,'CLOTHING',1,2,'White',0),(63,'Denim jeans','https://images.unsplash.com/photo-1475178626620-a4d074967452?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1233&q=80',NULL,'Denims at its best',500,5,'CLOTHING',1,5,'Blue',0),(64,'Denim jeans','https://images.unsplash.com/photo-1475178626620-a4d074967452?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1233&q=80',NULL,'Denims at its best',500,5,'CLOTHING',1,5,'Blue',0),(65,'Denim jeans','https://images.unsplash.com/photo-1475178626620-a4d074967452?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1233&q=80',NULL,'Denims at its best',500,5,'CLOTHING',1,5,'Blue',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
                                 `id` int NOT NULL,
                                 `title` varchar(255) NOT NULL,
                                 `cat_id` int DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `subcategories_categories_id_fk` (`cat_id`),
                                 CONSTRAINT `subcategories_categories_id_fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Men',1),(2,'Women',1),(3,'Shorts',1),(4,'Shirts',1),(5,'Bottom Wear',1),(6,'Men',2),(7,'Women',2),(8,'Shoes',2),(9,'Sleepers',2),(10,'Men',3),(11,'Women',3),(12,'Kids',3),(13,'Backpacks',3),(14,'Sumglasses',3),(15,'Gaming',3);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `username` varchar(255) NOT NULL,
                         `password` varchar(255) NOT NULL,
                         `email` varchar(255) NOT NULL,
                         `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
                         `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
                         `age` int DEFAULT '18',
                         `role` int DEFAULT '555',
                         `photoUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci,
                         `type` varchar(255) NOT NULL DEFAULT 'local',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john','$2b$10$iLEz3tkVKeOCwuagcqhDUOV.Iswjc.I41unbnnFGiqK/gmstDCC3i','john@gmail.com','Ind','Mukherjee',31,777,'','local'),(2,'shane','$2b$10$ewemZ.oLASXUIWfUrjkDeOTCZUCpnhSlR3/Act2eQnvGg6mnGLOtG','shane123@gmail.com','Navoneel','Mukherjee',27,555,'','local'),(11,'mike','$2b$10$vIS0W3LKhbx2tFh1GMYWhul7GWtIg4jnKU2C/NGux1pUG3QKMdNzO','mike-doe@excellent.com','Mike','Leming',40,555,'https://i.pinimg.com/originals/dc/55/a0/dc55a0fec14d93d9cf6fa32c32f7c7f2.jpg','local'),(14,'david','$2b$10$po91FRkYQIfPDN6G1BxG0uIV7Z54GbJRkJw2t9wRec9uqmRKillqa','abc@hotmail.com','josh','David',NULL,555,'https://image.shutterstock.com/image-vector/person-gray-photo-placeholder-man-260nw-1259815156.jpg','local'),(19,'test','$2b$10$cSa3jm7cboNSJRTgNRFJg.GviAzr/pyfptMxwxmjdKP./CdxDtLlK','test@gmail.com','Herry','Mister',NULL,555,'https://image.shutterstock.com/image-vector/person-gray-photo-placeholder-man-260nw-1259815156.jpg','local'),(20,'bhaikaju','$2b$10$P9X8c/MC39.Zxr2k5SfxK.lwbcj6PNou2ueqod29CFZrmuDUCvlfe','bhaikaju@gmail.com','Programming\'s Fun','not set',NULL,555,'https://lh3.googleusercontent.com/a-/AOh14GiPx0OQHJOCy-fSfNmKr1vbnM-Rp7CgS_jx_6oY=s96-c','social'),(21,'shreyamukherjee07','$2b$10$SOw/LSErH0IbZ96h7pop.O6NJreOD3HjRGiZZmKnqiXiuUPCl8b8W','shreyamukherjee07@gmail.com','Shreya','Mukherjee',NULL,555,'https://lh3.googleusercontent.com/a-/AOh14Gg2Be7kKwqsUbQwyuCGToyZcCQ3ZDDWNkvSbQJVHA=s96-c','social');
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

-- Dump completed on 2021-05-10 12:52:59
