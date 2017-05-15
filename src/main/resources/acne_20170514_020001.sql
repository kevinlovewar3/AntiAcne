-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: acne
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_acne_article`
--

LOCK TABLES `t_acne_article` WRITE;
/*!40000 ALTER TABLE `t_acne_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_acne_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_acne_goods`
--

DROP TABLE IF EXISTS `t_acne_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_acne_goods` (
  `acneUserGoodsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acneUserId` bigint(20) unsigned DEFAULT NULL,
  `goodsId` bigint(20) unsigned DEFAULT NULL,
  `viewTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acneUserGoodsId`),
  KEY `fk_acne_user_id` (`acneUserId`),
  KEY `goods_id` (`goodsId`),
  CONSTRAINT `fk_acne_user_id` FOREIGN KEY (`acneUserId`) REFERENCES `t_acne_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `goods_id` FOREIGN KEY (`goodsId`) REFERENCES `t_goods` (`goodsId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_acne_goods`
--

LOCK TABLES `t_acne_goods` WRITE;
/*!40000 ALTER TABLE `t_acne_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_acne_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_acne_images`
--

DROP TABLE IF EXISTS `t_acne_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_acne_images` (
  `imageId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acneUserId` bigint(20) unsigned DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `authorith` int(11) DEFAULT '0',
  `desc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `index2` (`acneUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_acne_images`
--

LOCK TABLES `t_acne_images` WRITE;
/*!40000 ALTER TABLE `t_acne_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_acne_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_acne_user`
--

DROP TABLE IF EXISTS `t_acne_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_acne_user` (
  `userId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registerDate` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `skinType` varchar(255) DEFAULT NULL,
  `acneTimeSpan` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`) USING HASH,
  UNIQUE KEY `phone` (`phone`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_acne_user`
--

LOCK TABLES `t_acne_user` WRITE;
/*!40000 ALTER TABLE `t_acne_user` DISABLE KEYS */;
INSERT INTO `t_acne_user` VALUES (4,'','123456','17898848594','2017-05-12 04:49:27',NULL,'新晋美肤成员一枚',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `t_acne_user` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anti_article`
--

LOCK TABLES `t_anti_article` WRITE;
/*!40000 ALTER TABLE `t_anti_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anti_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anti_goods`
--

DROP TABLE IF EXISTS `t_anti_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anti_goods` (
  `antiGoodsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `antiUserId` bigint(20) unsigned DEFAULT NULL,
  `goodsId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`antiGoodsId`),
  UNIQUE KEY `goodsId_UNIQUE` (`goodsId`),
  KEY `fk_anti_user_id_idx` (`antiUserId`),
  KEY `fk_goods_id_idx` (`goodsId`),
  CONSTRAINT `fk_anti_goods_id` FOREIGN KEY (`goodsId`) REFERENCES `t_goods` (`goodsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anti_user_goods_id` FOREIGN KEY (`antiUserId`) REFERENCES `t_anti_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anti_goods`
--

LOCK TABLES `t_anti_goods` WRITE;
/*!40000 ALTER TABLE `t_anti_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anti_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anti_user`
--

DROP TABLE IF EXISTS `t_anti_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anti_user` (
  `userId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registerDate` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`) USING HASH,
  UNIQUE KEY `phone` (`phone`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anti_user`
--

LOCK TABLES `t_anti_user` WRITE;
/*!40000 ALTER TABLE `t_anti_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anti_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_article` (
  `articleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `publishDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `viewTimes` int(11) DEFAULT NULL,
  `upTimes` int(11) DEFAULT NULL,
  `downTimes` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article`
--

LOCK TABLES `t_article` WRITE;
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goods`
--

DROP TABLE IF EXISTS `t_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_goods` (
  `goodsId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(255) DEFAULT NULL,
  `goodsPicture` text,
  `description` text,
  `uploadDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `score` int(11) DEFAULT NULL,
  `browseNum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goods`
--

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(45) NOT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`rolePermissionId`),
  KEY `f_role_id_idx` (`role_id`),
  KEY `f_permission_id_idx` (`permission_id`),
  CONSTRAINT `f_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`permissionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `f_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_user`
--

DROP TABLE IF EXISTS `t_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_user` (
  `roleUserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `acne_user_id` bigint(20) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `anti_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`roleUserId`),
  KEY `index_acne_user_id` (`acne_user_id`),
  KEY `index_anti_user_id` (`anti_user_id`),
  KEY `index_role_id` (`role_id`),
  CONSTRAINT `f_acne_user_id` FOREIGN KEY (`acne_user_id`) REFERENCES `t_acne_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `f_anti_user_id` FOREIGN KEY (`anti_user_id`) REFERENCES `t_anti_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `f_role_id_` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_user`
--

LOCK TABLES `t_role_user` WRITE;
/*!40000 ALTER TABLE `t_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_suggest`
--

DROP TABLE IF EXISTS `t_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_suggest` (
  `suggestionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) unsigned DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `suggestText` text,
  `suggestTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`suggestionId`),
  KEY `user_id` (`userId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_suggest`
--

LOCK TABLES `t_suggest` WRITE;
/*!40000 ALTER TABLE `t_suggest` DISABLE KEYS */;
INSERT INTO `t_suggest` VALUES (10,NULL,'null','hello world!','2017-05-12 04:35:15',1);
/*!40000 ALTER TABLE `t_suggest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-14  2:00:01
