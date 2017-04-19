-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: acne
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `t_acne_article`
--

DROP TABLE IF EXISTS `t_acne_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_acne_article` (
  `acneUserArticleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acneUserId` bigint(20) unsigned DEFAULT NULL,
  `articleId` bigint(20) unsigned DEFAULT NULL,
  `viewTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acneUserArticleId`),
  UNIQUE KEY `unique_acne_article` (`articleId`,`acneUserId`) USING BTREE,
  KEY `acne_user_id` (`acneUserId`),
  CONSTRAINT `acne_user_id` FOREIGN KEY (`acneUserId`) REFERENCES `t_acne_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `article_id` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`articleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_acne_article`
--

LOCK TABLES `t_acne_article` WRITE;
/*!40000 ALTER TABLE `t_acne_article` DISABLE KEYS */;
INSERT INTO `t_acne_article` VALUES (5,1,14,'2017-03-28 15:57:12'),(7,1,2,'2017-04-05 08:34:38'),(13,1,7,'2017-03-28 16:12:37'),(20,1,4,'2017-03-28 16:12:36'),(22,1,5,'2017-03-28 16:12:37'),(23,1,10,'2017-03-28 16:12:36'),(24,1,22,'2017-03-29 10:55:47');
/*!40000 ALTER TABLE `t_acne_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19  8:43:09
