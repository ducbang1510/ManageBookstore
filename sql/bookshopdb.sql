-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshopdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Thomas Harris','assets/img/140x140/img1.jpg'),(2,'Higashino Keigo','assets/img/140x140/img2.jpg'),(3,'Haruki Murakami','assets/img/140x140/img3.jpg'),(4,'Masashi Kishimoto','assets/img/140x140/img4.jpg'),(5,'Jeffrey Archer','assets/img/140x140/img5.jpg'),(6,'Sir Arthur Conan Doyle','assets/img/140x140/img6.jpg'),(7,'Agatha Christie','assets/img/140x140/img7.jpg'),(8,'Nguyễn Nhật Ánh','assets/img/140x140/img8.jpg'),(9,'Fumiyo Kono',NULL),(10,'Maita Yohei',NULL),(11,'Bộ Giáo Dục Và Đào Tạo',NULL),(12,'Gosho Aoyama',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Sự Im Lặng Của Bầy Cừu','Bìa mềm','assets/img/book_img/img6.jpg',115000),(2,'Án Mạng Mười Một Chữ','Bìa mềm','assets/img/book_img/img8.jpg',110000),(3,'Rừng Nauy (Tái Bản 2018)','Bìa mềm','assets/img/book_img/img1.jpg',128000),(4,'Naruto Tập 43','Bìa mềm','assets/img/book_img/img12.jpg',22000),(5,'Hai Số Phận','Bìa Cứng','assets/img/book_img/img4.jpg',175000),(6,'Sherlock Holmes (Trọn Bộ 3 Cuốn)','Bìa mềm','assets/img/book_img/img7.jpg',345000),(7,'Án Mạng Trên Chuyến Tàu Tốc Hành Phương Đông','Bìa mềm','assets/img/book_img/img2.jpg',110000),(8,'Tôi Thấy Hoa Vàng Trên Cỏ Xanh','Bìa mềm','assets/img/book_img/img5.jpg',125000),(9,'Mắt Biếc','Bìa mềm','assets/img/book_img/img11.jpg',110000),(10,'Ở Một Góc Nhân Gian','Bìa mềm','assets/img/book_img/img13.jpg',80000),(11,'Toán 2','Bìa mềm','assets/img/book_img/img9.jpg',13000),(12,'Sách Giáo Khoa Bộ Lớp 9 (Bộ 12 Cuốn)','Bìa mềm','assets/img/book_img/img10.jpg',136000),(13,'Thám Tử Lừng Danh Conan - Tập 97','Bìa mềm','assets/img/book_img/img3.jpg',20000);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,8),(10,9),(10,10),(11,11),(12,11),(13,12);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_cate`
--

DROP TABLE IF EXISTS `book_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_cate` (
  `book_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `book_cate_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `book_cate_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_cate`
--

LOCK TABLES `book_cate` WRITE;
/*!40000 ALTER TABLE `book_cate` DISABLE KEYS */;
INSERT INTO `book_cate` VALUES (3,1),(8,1),(9,1),(10,1),(1,4),(2,4),(6,4),(7,4),(4,6),(13,6),(11,7),(12,7),(5,9);
/*!40000 ALTER TABLE `book_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_image`
--

DROP TABLE IF EXISTS `book_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_image_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_image`
--

LOCK TABLES `book_image` WRITE;
/*!40000 ALTER TABLE `book_image` DISABLE KEYS */;
INSERT INTO `book_image` VALUES (15,'assets/img/300x452/img6.jpg',1),(16,'assets/img/300x452/img8.jpg',2),(17,'assets/img/300x452/img1.jpg',3),(18,'assets/img/300x452/img12.jpg',4),(19,'assets/img/300x452/img4.jpg',5),(20,'assets/img/300x452/img7.jpg',6),(21,'assets/img/300x452/img2.jpg',7),(22,'assets/img/300x452/img5.jpg',8),(23,'assets/img/300x452/img11.jpg',9),(24,'assets/img/300x452/img13.jpg',10),(25,'assets/img/300x452/img9.jpg',11),(26,'assets/img/300x452/img10.jpg',12),(27,'assets/img/300x452/img3.jpg',13);
/*!40000 ALTER TABLE `book_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tiểu thuyết'),(2,'Truyện ngắn'),(3,'Light Novel'),(4,'Truyện trinh thám'),(5,'Truyện kiếm hiệp'),(6,'Manga - Comic'),(7,'Sách giáo khoa'),(8,'Sách tham khảo'),(9,'Tác phẩm kinh điển');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debt` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Tran Duc Bang','24 Nguyen Anh Thu','0977477916','bang@gmail.com',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt_collection_note`
--

DROP TABLE IF EXISTS `debt_collection_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt_collection_note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `collection_date` date DEFAULT NULL,
  `proceeds` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `debt_collection_note_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `debt_collection_note_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt_collection_note`
--

LOCK TABLES `debt_collection_note` WRITE;
/*!40000 ALTER TABLE `debt_collection_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt_collection_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_report`
--

DROP TABLE IF EXISTS `dept_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_report`
--

LOCK TABLES `dept_report` WRITE;
/*!40000 ALTER TABLE `dept_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_dept_report`
--

DROP TABLE IF EXISTS `detail_dept_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_dept_report` (
  `report_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `money_before` float DEFAULT NULL,
  `money_after` float DEFAULT NULL,
  `arise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`report_id`,`customer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `detail_dept_report_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `dept_report` (`id`),
  CONSTRAINT `detail_dept_report_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_dept_report`
--

LOCK TABLES `detail_dept_report` WRITE;
/*!40000 ALTER TABLE `detail_dept_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_dept_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_inventory_report`
--

DROP TABLE IF EXISTS `detail_inventory_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_inventory_report` (
  `report_id` int NOT NULL,
  `book_id` int NOT NULL,
  `quantity_before` int DEFAULT NULL,
  `quantity_after` int DEFAULT NULL,
  `arise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`report_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `detail_inventory_report_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `inventory_report` (`id`),
  CONSTRAINT `detail_inventory_report_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_inventory_report`
--

LOCK TABLES `detail_inventory_report` WRITE;
/*!40000 ALTER TABLE `detail_inventory_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_inventory_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_invoice`
--

DROP TABLE IF EXISTS `detail_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_invoice` (
  `invoice_id` int NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`invoice_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `detail_invoice_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `detail_invoice_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_invoice`
--

LOCK TABLES `detail_invoice` WRITE;
/*!40000 ALTER TABLE `detail_invoice` DISABLE KEYS */;
INSERT INTO `detail_invoice` VALUES (25,2,1,110000),(25,3,1,128000),(26,4,2,22000),(26,5,1,175000),(33,4,1,22000),(34,1,1,115000),(34,4,1,22000),(35,2,3,110000),(35,3,1,128000),(36,2,1,110000),(36,3,1,128000),(37,3,1,128000),(37,4,1,22000),(38,9,1,110000),(40,3,1,128000),(40,4,1,22000),(41,2,2,110000),(41,4,1,22000),(42,2,2,110000),(42,4,1,22000),(43,3,1,128000),(43,4,1,22000);
/*!40000 ALTER TABLE `detail_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_received_note`
--

DROP TABLE IF EXISTS `detail_received_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_received_note` (
  `note_id` int NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`note_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `detail_received_note_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `received_note` (`id`),
  CONSTRAINT `detail_received_note_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_received_note`
--

LOCK TABLES `detail_received_note` WRITE;
/*!40000 ALTER TABLE `detail_received_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_received_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_report`
--

DROP TABLE IF EXISTS `inventory_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_report`
--

LOCK TABLES `inventory_report` WRITE;
/*!40000 ALTER TABLE `inventory_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_invoice` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (25,'2020-12-09',0,0,1,NULL),(26,'2020-12-09',0,0,1,NULL),(33,'2020-12-10',0,0,1,NULL),(34,'2020-12-10',0,0,1,NULL),(35,'2020-12-10',0,0,1,NULL),(36,'2020-12-10',0,0,1,NULL),(37,'2020-12-10',0,0,1,NULL),(38,'2020-12-10',110000,0,1,NULL),(40,'2020-12-11',150000,0,1,NULL),(41,'2020-12-11',132000,0,1,NULL),(42,'2020-12-11',242000,0,1,NULL),(43,'2020-12-11',150000,0,1,NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `received_note`
--

DROP TABLE IF EXISTS `received_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `received_note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_received` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `received_note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_note`
--

LOCK TABLES `received_note` WRITE;
/*!40000 ALTER TABLE `received_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `received_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `user_role` enum('USER','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tran Duc Bang',NULL,'admin','e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-11-14','ADMIN'),(2,'Tin',NULL,'Tin123','e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-11-16','USER'),(8,'Tran Trong Tin','','tin234','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,'2020-11-17','USER'),(9,'Khoa','','khoa123','e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-11-17','USER'),(10,'Tran Van A','','user123','827ccb0eea8a706c4c34a16891f84e7b',NULL,1,'2020-11-17','USER'),(11,'Nguyen Van B','','user1','827ccb0eea8a706c4c34a16891f84e7b','images/upload/Tin.jpg',1,'2020-11-21','USER'),(12,'Phan Van T','trungba@gmail.com','trung21','827ccb0eea8a706c4c34a16891f84e7b','images/upload/Tin.jpg',1,'2020-12-10','USER'),(13,'Tran Trung','trung3213@gmail.com','tester1','827ccb0eea8a706c4c34a16891f84e7b','images/upload/Tin.jpg',1,'2020-12-10','USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12 10:28:54
