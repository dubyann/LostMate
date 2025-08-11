-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: design
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_approvals`
--

DROP TABLE IF EXISTS `post_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_approvals` (
  `approval_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `status` varchar(10) NOT NULL COMMENT '2 审核通过\n3 审核未通过',
  `reason` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`approval_id`),
  KEY `post_id` (`post_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `post_approvals_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `post_approvals_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_approvals`
--

LOCK TABLES `post_approvals` WRITE;
/*!40000 ALTER TABLE `post_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,21,'交友组局','篮球友谊赛','本周六下午3点，篮球场不见不散。',NULL,'审核通过','2024-07-10 09:45:49','2024-07-10 10:06:40'),(3,22,'失物招领','寻物启事','昨日丢失钥匙一串，有捡到者请联系我。',NULL,'待审核','2024-07-10 09:45:49','2024-07-10 09:45:49'),(4,23,'二手交易','出售自行车','九成新自行车，低价转让。',NULL,'审核通过','2024-07-10 09:45:49','2024-07-10 10:06:40'),(5,24,'交友组局','羽毛球双打招募','寻找羽毛球双打搭档，每周三晚上活动。',NULL,'待审核','2024-07-10 09:45:49','2024-07-10 09:45:49'),(6,25,'失物招领','捡到钱包','有人在超市丢失钱包，请失主联系我。',NULL,'审核通过','2024-07-10 09:45:49','2024-07-10 10:06:40'),(7,26,'二手交易','二手吉他出售','出售一把二手吉他，状况良好。',NULL,'待审核','2024-07-10 09:45:49','2024-07-10 09:45:49'),(8,27,'交友组局','足球比赛组队','本周末有足球比赛，诚邀队友。',NULL,'审核通过','2024-07-10 09:45:49','2024-07-10 10:06:40'),(9,28,'失物招领','失物招领-手机','谁的手机遗失在图书馆，请来认领。',NULL,'待审核','2024-07-10 09:45:49','2024-07-10 09:45:49'),(10,29,'二手交易','求购二手冰箱','需要一台二手冰箱，有意向者请联系。',NULL,'审核通过','2024-07-10 09:45:49','2024-07-10 10:06:40'),(11,30,'交友组局','周末徒步活动','周末组织徒步活动，欢迎加入。',NULL,'待审核','2024-07-10 09:45:49','2024-07-10 09:45:49'),(12,21,'交友组局','test','<p>这是一个测试</p>','http://localhost:8182/static/uploads/img1720679756136.png','待审核','2024-07-11 06:36:01','2024-07-11 06:36:01'),(13,21,'失物招领','第二个测试','<p>这也是一个测试</p>','','待审核','2024-07-11 06:40:16','2024-07-11 06:40:16'),(14,21,'二手交易','第三个测试','<p>这是第三个测试</p>','','待审核','2024-07-11 06:41:05','2024-07-11 06:41:05'),(15,21,'交友组局','第四个测试','<p>4</p>','','待审核','2024-07-11 06:43:14','2024-07-11 06:43:14'),(16,21,'交友组局','打算读','<p>艾斯大</p>','','待审核','2024-07-11 06:44:04','2024-07-11 06:44:04');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `birthdate` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (21,'alice','pbkdf2hash1','alice@example.com','正常','用户','https://example.com/avatar/alice.jpg','12345678901','1990-05-15 00:00:00.000000','Wonderland','2024-07-08 08:55:25','2024-07-08 08:55:25'),(22,'bob','pbkdf2hash2','bob@example.com','正常','用户','https://example.com/avatar/bob.jpg','12345678902','1991-06-16 00:00:00.000000','Builderland','2024-07-08 08:55:25','2024-07-08 08:55:25'),(23,'carol','pbkdf2hash3','carol@example.com','正常','用户','https://example.com/avatar/carol.jpg','12345678903','1992-07-17 00:00:00.000000','Dreamtown','2024-07-08 08:55:25','2024-07-08 08:55:25'),(24,'dave','pbkdf2hash4','dave@example.com','冻结','用户','https://example.com/avatar/dave.jpg','12345678904','1993-08-18 00:00:00.000000','Frostville','2024-07-08 08:55:25','2024-07-08 08:55:25'),(25,'eve','pbkdf2hash5','eve@example.com','封禁','用户','https://example.com/avatar/eve.jpg','12345678905','1994-09-19 00:00:00.000000','Ban City','2024-07-08 08:55:25','2024-07-08 08:55:25'),(26,'frank','pbkdf2hash6','frank@example.com','正常','用户','https://example.com/avatar/frank.jpg','12345678906','1995-10-20 00:00:00.000000','Frankfurt','2024-07-08 08:55:25','2024-07-08 08:55:25'),(27,'grace','pbkdf2hash7','grace@example.com','正常','用户','https://example.com/avatar/grace.jpg','12345678907','1996-11-21 00:00:00.000000','Graceland','2024-07-08 08:55:25','2024-07-08 08:55:25'),(28,'helen','pbkdf2hash8','helen@example.com','冻结','用户','https://example.com/avatar/helen.jpg','12345678908','1997-12-22 00:00:00.000000','Winterfell','2024-07-08 08:55:25','2024-07-08 08:55:25'),(29,'ian','pbkdf2hash9','ian@example.com','封禁','用户','https://example.com/avatar/ian.jpg','12345678909','1998-01-23 00:00:00.000000','Iceberg','2024-07-08 08:55:25','2024-07-08 08:55:25'),(30,'judy','pbkdf2hash10','judy@example.com','正常','管理员','https://example.com/avatar/judy.jpg','12345678910','1999-02-24 00:00:00.000000','Judgement Junction','2024-07-08 08:55:25','2024-07-08 08:55:25'),(31,'99999','1121313','imak63344@gmail.com','正常','用户',NULL,NULL,NULL,NULL,'2024-07-09 08:49:19','2024-07-09 08:49:19'),(32,'21321312','213213','312312','正常','用户',NULL,NULL,NULL,NULL,'2024-07-09 09:14:19','2024-07-09 09:14:19'),(33,'99998','111','213','正常','用户',NULL,NULL,NULL,NULL,'2024-07-09 09:27:39','2024-07-09 15:40:09');
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

-- Dump completed on 2024-07-11 16:52:04
