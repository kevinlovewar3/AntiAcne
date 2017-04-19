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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article`
--

LOCK TABLES `t_article` WRITE;
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
INSERT INTO `t_article` VALUES (1,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-20 15:11:10',2,1,1,1),(2,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-04-08 07:11:37',105,11,10,1),(3,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:49',5,1,1,1),(4,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-28 16:12:36',7,1,1,1),(5,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:24',6,1,1,1),(6,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-22 14:39:36',3,1,1,1),(7,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-04-06 14:06:13',16,3,2,1),(8,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-22 14:56:21',2,1,1,1),(9,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 14:39:51',2,1,1,1),(10,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-04-06 14:06:15',10,1,1,1),(11,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 16:08:24',2,1,1,1),(12,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:25',5,1,1,1),(13,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 16:08:51',2,1,1,1),(14,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:28',13,1,1,1),(15,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 16:08:56',2,1,1,1),(16,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 16:10:16',2,1,1,1),(17,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-23 16:10:39',2,1,1,1),(18,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:33',7,1,1,1),(19,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-25 14:04:02',2,1,1,1),(20,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-25 14:04:04',2,1,1,1),(21,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-25 14:05:02',3,1,1,1),(22,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-30 14:30:29',8,1,1,1),(23,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-15 15:15:25',1,1,1,1),(24,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-15 15:15:25',1,1,1,1),(25,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-15 15:15:25',1,1,1,1),(26,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-15 15:15:26',1,1,1,1),(27,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-15 15:15:26',1,1,1,1),(28,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-29 12:20:05',3,1,1,1),(29,'如何去痘痘？','1.不要用手去挤压\r\n　　痘痘的形成是由于肌肤毛囊中囤积的分泌物无法排出体外，积累到一定量就会影响肌肤排气顺畅，出现发炎症状，进而形成红肿的小豆或白色的小豆。用手直接挤压可将痘痘强行逼出体外，但容易将包裹痘痘的外层分泌物一同挤破，使其小范围内的肌肤出现发炎症状，甚至造成肌肤局部区域的少量出血现象。如果时间长了，空气中的细菌会直接侵袭发炎出，使该范围内的肌肤形成凹凸不平的小洞，从而影响整个面部的美观。因此，如果我们平时长了青春痘，一定不要直接用手去挤压。\r\n2\r\n　2.不要拖延去痘时间\r\n　　俗话说：“治病如救火”，治疗青春痘也是如此。如果脸上长出了青春痘，需要我们及时地治疗，以免其破坏范围继续扩大，最终形成难看的痘痕，到时侯要想恢复就会非常困难了。因此，我们不能拖延治疗青春痘的时间，一旦出现，需立刻去之！\r\n3\r\n　3.正确的治疗方法\r\n　　很多患有痘子的部位炎症都较为严重，而分辨炎症严重的方法就是看出痘处是否有红肿的现象，或瘙痒难耐的症状。当出痘处有炎症时，需要我们通过药物的治疗才能得以解决。我们这时可通过内服药物与外用药物的双重治疗手段。但选用消炎的内服药物的时候，需要注意：不要选用效果较强的消炎药，如头孢类抗生素、磺胺等……一个对肾功能有影响，二个形成耐药性后吃什么药都不见效了哦！\r\n4\r\n4.及时地修复\r\n在发现脸部出现未成形的痘痘的时候，就选用有效外用药及时地修复出痘出。去除青春痘需要我们防范于未然，及时发现、及早修复，快速地消去炎症，把讨厌的痘痘杀死在摇篮中。\r\n5\r\n许多炎症较为严重的痘痘，不管使用任何药物都不见效，如：较大颗粒的红肿性青春痘、大颗粒的浓疡囊肿等，都需要通过高科技的医学干预才能得以恢复。但需要提醒各位美眉，在选择专业美容医院的时候，最好找知名度高的大型医院，以免上当受骗','2017-03-29 12:20:02',2,1,1,1);
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;
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
