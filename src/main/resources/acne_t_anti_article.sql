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
-- Table structure for table `t_anti_article`
--

DROP TABLE IF EXISTS `t_anti_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anti_article` (
  `antiArticleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `antiUserId` bigint(20) unsigned DEFAULT NULL,
  `articleId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`antiArticleId`),
  UNIQUE KEY `articleId_UNIQUE` (`articleId`),
  KEY `fk_anti_user_id_idx` (`antiUserId`),
  KEY `fk_article_id_idx` (`articleId`),
  CONSTRAINT `fk_anti_user_id` FOREIGN KEY (`antiUserId`) REFERENCES `t_anti_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_id` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`articleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anti_article`
--

LOCK TABLES `t_anti_article` WRITE;
/*!40000 ALTER TABLE `t_anti_article` DISABLE KEYS */;
INSERT INTO `t_anti_article` VALUES (1,1,1),(4,1,2),(5,1,3),(6,1,4),(7,1,5),(8,1,6),(9,1,7),(10,1,8),(11,1,9),(12,1,10),(13,1,11),(14,1,12),(15,1,13),(16,1,14),(17,1,15),(18,1,16),(19,1,17),(20,1,18),(21,1,19),(22,1,20),(23,1,21),(24,1,22),(25,1,23),(26,1,24),(27,1,25),(28,1,26),(29,1,27),(30,1,28),(31,1,29);
/*!40000 ALTER TABLE `t_anti_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19  8:43:10
