-- MySQL dump 10.13  Distrib 5.5.42, for Linux (x86_64)
--
-- Host: site.cgeravtrrjt4.us-west-2.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.19-log

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
-- Table structure for table `BlogPost`
--

DROP TABLE IF EXISTS `BlogPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlogPost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `promoted` bit(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5n3smobwys4bwerfd6uux3wo4` (`image_id`),
  CONSTRAINT `FK_5n3smobwys4bwerfd6uux3wo4` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogPost`
--

LOCK TABLES `BlogPost` WRITE;
/*!40000 ALTER TABLE `BlogPost` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlogPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogPost_Comment`
--

DROP TABLE IF EXISTS `BlogPost_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlogPost_Comment` (
  `BlogPost_id` bigint(20) NOT NULL,
  `commentList_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_is86xxl25187ei9m04q0i2w7l` (`commentList_id`),
  KEY `FK_1aje300xjfchkrjp10nyey4bo` (`BlogPost_id`),
  CONSTRAINT `FK_1aje300xjfchkrjp10nyey4bo` FOREIGN KEY (`BlogPost_id`) REFERENCES `BlogPost` (`id`),
  CONSTRAINT `FK_is86xxl25187ei9m04q0i2w7l` FOREIGN KEY (`commentList_id`) REFERENCES `Comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogPost_Comment`
--

LOCK TABLES `BlogPost_Comment` WRITE;
/*!40000 ALTER TABLE `BlogPost_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlogPost_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogPost_Image`
--

DROP TABLE IF EXISTS `BlogPost_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlogPost_Image` (
  `BlogPost_id` bigint(20) NOT NULL,
  `imageList_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mlsbi95f1x5y87xnfqgwqti0l` (`imageList_id`),
  KEY `FK_rvifltibcy6k8vilw9l10ekc8` (`BlogPost_id`),
  CONSTRAINT `FK_rvifltibcy6k8vilw9l10ekc8` FOREIGN KEY (`BlogPost_id`) REFERENCES `BlogPost` (`id`),
  CONSTRAINT `FK_mlsbi95f1x5y87xnfqgwqti0l` FOREIGN KEY (`imageList_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogPost_Image`
--

LOCK TABLES `BlogPost_Image` WRITE;
/*!40000 ALTER TABLE `BlogPost_Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlogPost_Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carousel`
--

DROP TABLE IF EXISTS `Carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carousel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gnn2tego5gwcrqt01rkf5i63` (`image_id`),
  CONSTRAINT `FK_gnn2tego5gwcrqt01rkf5i63` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carousel`
--

LOCK TABLES `Carousel` WRITE;
/*!40000 ALTER TABLE `Carousel` DISABLE KEYS */;
INSERT INTO `Carousel` VALUES (2,'2015-04-03 14:57:39','2015-04-03 13:46:34','Снимка 1','ARCHIVED',139,NULL),(3,'2015-04-03 14:58:03','2015-04-03 13:46:36','Снимка 2','ARCHIVED',140,NULL),(4,'2015-04-03 14:58:28','2015-04-03 13:46:38','Снимка 3','ARCHIVED',141,NULL),(5,'2015-04-03 14:58:54','2015-04-03 13:46:40','Снимка 4','ARCHIVED',142,NULL),(6,'2015-04-03 16:18:31','2015-04-07 08:23:05','Test Pic 1','ARCHIVED',NULL,NULL),(7,'2015-04-03 13:47:42','2015-04-07 08:23:09','Снимка 1','ARCHIVED',150,NULL),(8,'2015-04-03 13:48:03','2015-04-14 18:55:47','Снимка 2','ACTIVE',182,'http://www.google.com'),(9,'2015-04-03 13:48:23',NULL,'Снимка 3','ACTIVE',152,NULL),(10,'2015-04-03 13:48:42','2015-04-07 08:22:43','Снимка 4','INACTIVE',NULL,NULL),(11,'2015-04-04 14:11:01','2015-04-07 14:43:52','omivalnq','INACTIVE',159,NULL),(12,'2015-04-07 09:14:59','2015-04-09 13:06:19','се','INACTIVE',NULL,NULL),(13,'2015-04-07 09:19:03','2015-05-04 20:22:25','','INACTIVE',193,NULL),(14,'2015-04-08 10:58:23','2015-04-08 11:07:04','resize','ACTIVE',163,NULL),(15,'2015-04-09 13:05:19','2015-04-09 13:06:59','Loreal','ACTIVE',166,NULL);
/*!40000 ALTER TABLE `Carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `address` longtext,
  `email` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,NULL,'2015-04-01 13:26:06','1175 София, бул. Цариградско Шосе 85, The Mall, етаж 2\r\n','salon_the_mall@hairspot.bg',42.6605727,23.3831368,'+359 88 555 03 51 ','салон 1 - the mall','+359 2 975 15 75','hairspot.eu','ACTIVE'),(2,NULL,'2015-04-01 13:14:48','1000 София, ж.к. Стрелбище, ул. Майор Първан Тошев 18-20','salon_the_mall@hairspot.bg',42.6780699,23.3009679,'+359 88 555 03 51','салон 2 - стрелбище','+359 2 975 15 75','hairspot.eu','ACTIVE');
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `description` longtext,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `mainImage_id` bigint(20) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `salon_id` bigint(20) DEFAULT NULL,
  `activity` longtext,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ovmmy5eb88hecd9cg2391uxr0` (`mainImage_id`),
  KEY `FK_rjlpe0377g893otv50pl60dsx` (`salon_id`),
  KEY `FK_mf6dmevuy574jwo1pvwu00cky` (`image_id`),
  CONSTRAINT `FK_mf6dmevuy574jwo1pvwu00cky` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`),
  CONSTRAINT `FK_ovmmy5eb88hecd9cg2391uxr0` FOREIGN KEY (`mainImage_id`) REFERENCES `Image` (`id`),
  CONSTRAINT `FK_rjlpe0377g893otv50pl60dsx` FOREIGN KEY (`salon_id`) REFERENCES `Salon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (2,'2015-03-24 19:06:40','2015-03-28 15:17:45','Длъжност 1','Иван Иванов','ARCHIVED',NULL,NULL,'5 Години',NULL,'асдасдасдасдасдасдасд','test@test.com','123123123123',NULL),(3,'2015-03-25 15:10:40','2015-03-28 15:17:47','Пичаха','Haho Hahov','ARCHIVED',NULL,NULL,'2 години',NULL,'фризьор маникюрист,','тсста@асд.бг','1233455',NULL),(6,'2015-03-30 07:04:45','2015-04-12 06:29:57','Фризьор','Пепо Калинков','ACTIVE',NULL,NULL,'6 години',2,'Здравейте. След първоначалния успешно преминат курс през 2011г. в салони Nushi гр.Варна, те ми гласуваха доверие и бях назначен за постоянно, като част от техния екип. В последствие продължих да влагам много средства и време до развиване на таланта си. Посещавах множество семинари и продължителни курсове провеждани от академия L\'Oréal. Постоянно търся методи за усъвършенстване. Сега работя за HairSpot - Валентин Цветков. \r\n ','','',170),(7,'2015-03-30 07:41:44','2015-04-11 09:29:00','фризьор','Валентина Червенокосова','ARCHIVED',NULL,NULL,'5 години',2,'мъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, дамскомъжко, ','valentina@abv.bg','+359 898 765 432',76),(8,'2015-04-01 14:24:07',NULL,'Програмист','Димитър Павлов','ARCHIVED',NULL,NULL,'2 дни',2,'INFO org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping - Mapped','tranewasd@gmail.com','+359 2 975 15 75',114),(9,'2015-04-02 16:44:04','2015-04-11 09:29:05','фризьор','Роси','ARCHIVED',NULL,NULL,'3 години',2,'подстри гванеподстр игван еподстригванепод стригв ан еподстр игванеподст ригва неподст ригв ан епо дст ригванеподс тригванеп о дстригван еподс тригванеподс','rosi@abv.bg','0987654321',128),(10,'2015-04-11 10:25:00','2015-04-12 06:31:11','Фризьор','Ради Петров','ACTIVE',NULL,NULL,'6 години',2,'Эавършил съм държавното училище по фриэьорство София.Преминал съм преэ обучения на Валентин Цветков и Венета Игнатова,както и дългогодишни обучения в Академия Лореал','','',171),(11,'2015-04-11 10:28:07','2015-04-12 06:32:56','Фризьор','Валентина Костова','ACTIVE',NULL,NULL,'7 години',2,'','','',172),(12,'2015-04-12 06:40:34','2015-04-14 12:11:41','Фризьор','Роси Тодорова','ACTIVE',NULL,NULL,'5 години',2,'','','',177),(13,'2015-04-14 12:05:36','2015-04-14 12:13:01','Тестов','Тесто','INACTIVE',NULL,NULL,'Някакъв',2,'Дейност 1, Дейност 2, Дейност 3, Дейност 4','mail@mail.com','123456',176),(14,'2015-04-18 13:02:30','2015-04-18 13:03:02','Фризьор','Деси Иванова','ACTIVE',NULL,NULL,'',2,'Завършвам фризьорски клас  при Вени Игнатова през 1999 г\r\n От 2000-2013 г. е управител и главен стилист във \"Форма студио\" ,а от \r\n.започва работа в екипа на Валентин Цветков 2013\r\n Участва в наши и чуждестранни  семинари и обучения , за повишаване на квалификацията си. През 2015 г  съм финалист в международното състезание Chromashine color -off за цвят и визия   на  американската компания  Farouk systems\r\nОт началото на 2015 г се присъединявам към техническият екип на  марката CHI за България , като преминава подготовка в Холандия.','','',183),(15,'2015-04-18 13:05:43','2015-04-18 13:08:46','Фризьор','Иван Кирчев','ACTIVE',NULL,NULL,'',2,'','','',185);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Image`
--

DROP TABLE IF EXISTS `Employee_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Image` (
  `Employee_id` bigint(20) NOT NULL,
  `imagesList_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_loq8xbts2jwn0fnhmw3ps6mcp` (`imagesList_id`),
  KEY `FK_pj2o9emvodejmbt5n420e6y8n` (`Employee_id`),
  CONSTRAINT `FK_pj2o9emvodejmbt5n420e6y8n` FOREIGN KEY (`Employee_id`) REFERENCES `Employee` (`id`),
  CONSTRAINT `FK_loq8xbts2jwn0fnhmw3ps6mcp` FOREIGN KEY (`imagesList_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Image`
--

LOCK TABLES `Employee_Image` WRITE;
/*!40000 ALTER TABLE `Employee_Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee_Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gallery`
--

DROP TABLE IF EXISTS `Gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `mainImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ochnsja74euh0ajypr3jpohwf` (`mainImage_id`),
  CONSTRAINT `FK_ochnsja74euh0ajypr3jpohwf` FOREIGN KEY (`mainImage_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gallery`
--

LOCK TABLES `Gallery` WRITE;
/*!40000 ALTER TABLE `Gallery` DISABLE KEYS */;
INSERT INTO `Gallery` VALUES (16,'2015-03-23 12:44:41','2015-03-24 19:06:55','Галерия Windows 5','ARCHIVED',44),(17,'2015-03-28 13:40:00','2015-03-28 15:17:33','Галерия 1','ARCHIVED',50),(18,'2015-03-28 13:46:09','2015-03-28 15:17:35','Галерия 2','ARCHIVED',54),(19,'2015-03-31 05:52:24','2015-04-03 10:21:52','test','ARCHIVED',126),(20,'2015-04-01 09:57:00','2015-04-01 09:57:35','Тест Галерия','ARCHIVED',NULL),(21,'2015-04-01 07:04:52','2015-04-03 10:21:58','Тест Галерия','ARCHIVED',79),(22,'2015-04-01 10:06:47','2015-04-01 13:35:16','Галерия Windows 1','ARCHIVED',84),(23,'2015-04-01 13:32:49','2015-04-01 13:35:14','Галерия Windows 2','ARCHIVED',NULL),(24,'2015-04-01 13:45:28','2015-04-03 10:21:58','Галерия Windows 1','ARCHIVED',104),(25,'2015-04-03 10:22:58','2015-04-07 09:13:44','Галерия № 1','INACTIVE',148),(26,'2015-04-03 07:47:26','2015-04-03 11:17:14','New gallery','ACTIVE',138),(27,'2015-04-03 12:58:08',NULL,'New Gallery','ACTIVE',143),(28,'2015-04-14 16:10:27',NULL,'1','ACTIVE',178);
/*!40000 ALTER TABLE `Gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gallery_Image`
--

DROP TABLE IF EXISTS `Gallery_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gallery_Image` (
  `Gallery_id` bigint(20) NOT NULL,
  `images_id` bigint(20) NOT NULL,
  KEY `FK_2xcgreoqchvsnqwdviaat4jhn` (`images_id`),
  KEY `FK_lw9180g85dbpetj4nw8lfbrc8` (`Gallery_id`),
  CONSTRAINT `FK_lw9180g85dbpetj4nw8lfbrc8` FOREIGN KEY (`Gallery_id`) REFERENCES `Gallery` (`id`),
  CONSTRAINT `FK_2xcgreoqchvsnqwdviaat4jhn` FOREIGN KEY (`images_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gallery_Image`
--

LOCK TABLES `Gallery_Image` WRITE;
/*!40000 ALTER TABLE `Gallery_Image` DISABLE KEYS */;
INSERT INTO `Gallery_Image` VALUES (16,46),(16,48),(17,51),(17,52),(17,53),(18,55),(18,56),(18,57),(22,85),(22,86),(22,87),(22,88),(23,100),(23,101),(23,102),(23,103),(24,105),(24,106),(24,107),(24,108),(19,78),(19,124),(19,125),(21,80),(21,81),(21,82),(21,83),(27,144),(27,145),(27,146),(25,131),(25,132),(25,147),(26,134),(26,135),(26,136),(26,137),(28,179),(28,180);
/*!40000 ALTER TABLE `Gallery_Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES (44,'2015-03-23 12:44:41',NULL,'1427107479087img2.jpg',NULL),(45,'2015-03-23 12:44:41',NULL,'1427107479083img3.jpg',NULL),(46,'2015-03-23 12:44:42',NULL,'1427107479086img2.jpg',NULL),(47,'2015-03-23 12:44:42',NULL,'1427107479087img3.jpg',NULL),(48,'2015-03-23 12:57:02',NULL,'1427108219997img2.jpg',NULL),(49,'2015-03-23 16:45:08',NULL,'1427121906356img2.jpg',NULL),(50,'2015-03-28 13:40:00',NULL,'14275427976901.jpg',NULL),(51,'2015-03-28 13:40:01',NULL,'14275427976791.jpg',NULL),(52,'2015-03-28 13:40:01',NULL,'14275427976882.jpg',NULL),(53,'2015-03-28 13:40:02',NULL,'14275427976893.jpg',NULL),(54,'2015-03-28 13:46:09',NULL,'14275431676651.jpg',NULL),(55,'2015-03-28 13:46:10',NULL,'14275431676471.jpg',NULL),(56,'2015-03-28 13:46:11',NULL,'14275431676622.jpg',NULL),(57,'2015-03-28 13:46:11',NULL,'14275431676643.jpg',NULL),(58,'2015-03-28 15:13:31',NULL,'14275484097851.jpg',NULL),(59,'2015-03-28 16:52:51',NULL,'14275543691731.jpg',NULL),(60,'2015-03-28 16:53:28',NULL,'14275544065551.jpg',NULL),(61,'2015-03-28 16:54:59',NULL,'14275544966421.jpg',NULL),(62,'2015-03-28 15:24:01',NULL,'14275562411841.jpg',NULL),(63,'2015-03-28 15:24:21',NULL,'14275562611051.jpg',NULL),(64,'2015-03-28 15:24:35',NULL,'14275562751031.jpg',NULL),(65,'2015-03-30 07:00:26',NULL,'1427698826173Koala.jpg',NULL),(69,'2015-03-30 07:04:24',NULL,'1427699064329img.jpg',NULL),(76,'2015-03-30 08:04:55',NULL,'1427702695184Desert.jpg',NULL),(77,'2015-03-31 05:52:24',NULL,'142778114459910393148_10152570339396193_4023837337305359530_n.jpg',NULL),(78,'2015-03-31 05:52:24',NULL,'142778114459910444331_10152570339461193_8642401357378825877_n_reduced.jpg',NULL),(79,'2015-04-01 07:04:52',NULL,'14278718920281.jpg',NULL),(80,'2015-04-01 07:04:52',NULL,'14278718920171.jpg',NULL),(81,'2015-04-01 07:04:52',NULL,'14278718920202.jpg',NULL),(82,'2015-04-01 07:04:52',NULL,'14278718920233.jpg',NULL),(83,'2015-04-01 07:04:52',NULL,'14278718920264.jpg',NULL),(84,'2015-04-01 10:06:47',NULL,'14278720058661.jpg',NULL),(85,'2015-04-01 10:06:48',NULL,'14278720058391.jpg',NULL),(86,'2015-04-01 10:06:49',NULL,'14278720058572.jpg',NULL),(87,'2015-04-01 10:06:49',NULL,'14278720058613.jpg',NULL),(88,'2015-04-01 10:06:50',NULL,'14278720058634.jpg',NULL),(89,'2015-04-01 11:36:53',NULL,'14278774113323.jpg',NULL),(90,'2015-04-01 11:37:45',NULL,'14278774640144.jpg',NULL),(91,'2015-04-01 11:38:19',NULL,'14278774970264.jpg',NULL),(92,'2015-04-01 11:39:49',NULL,'14278775872673.jpg',NULL),(93,'2015-04-01 11:41:59',NULL,'14278777174483.jpg',NULL),(94,'2015-04-01 11:42:51',NULL,'14278777692553.jpg',NULL),(95,'2015-04-01 11:44:49',NULL,'14278778871343.jpg',NULL),(96,'2015-04-01 11:45:40',NULL,'14278779382654.jpg',NULL),(97,'2015-04-01 11:48:01',NULL,'14278780798763.jpg',NULL),(98,'2015-04-01 11:52:42',NULL,'14278783606453.jpg',NULL),(99,'2015-04-01 12:46:39',NULL,'14278815977744.jpg',NULL),(100,'2015-04-01 13:32:49',NULL,'14278843669001.jpg',NULL),(101,'2015-04-01 13:32:49',NULL,'14278843669052.jpg',NULL),(102,'2015-04-01 13:32:50',NULL,'14278843669083.jpg',NULL),(103,'2015-04-01 13:32:50',NULL,'14278843669114.jpg',NULL),(104,'2015-04-01 13:45:28',NULL,'thumbnail.14278851254831.jpg',NULL),(105,'2015-04-01 13:45:29',NULL,'14278851254491.jpg',NULL),(106,'2015-04-01 13:45:29',NULL,'14278851254532.jpg',NULL),(107,'2015-04-01 13:45:30',NULL,'14278851254783.jpg',NULL),(108,'2015-04-01 13:45:30',NULL,'14278851254814.jpg',NULL),(109,'2015-04-01 14:14:42',NULL,'14278868796111.jpg',NULL),(110,'2015-04-01 14:14:42',NULL,'14278868796152.jpg',NULL),(111,'2015-04-01 14:14:42',NULL,'14278868796183.jpg',NULL),(112,'2015-04-01 14:14:43',NULL,'14278868796214.jpg',NULL),(114,'2015-04-01 14:24:07',NULL,'1427887445872img3.jpg',NULL),(116,'2015-04-01 11:50:00',NULL,'14278890008961.jpg',NULL),(117,'2015-04-01 11:50:00',NULL,'14278890009052.jpg',NULL),(118,'2015-04-01 11:50:00',NULL,'14278890009123.jpg',NULL),(119,'2015-04-01 11:50:00',NULL,'14278890009154.jpg',NULL),(120,'2015-04-01 11:51:26',NULL,'14278890861741.jpg',NULL),(121,'2015-04-01 11:51:26',NULL,'14278890861772.jpg',NULL),(122,'2015-04-01 11:51:26',NULL,'14278890861803.jpg',NULL),(123,'2015-04-01 11:51:26',NULL,'14278890861824.jpg',NULL),(124,'2015-04-02 07:48:00',NULL,'1427960880631Desert.jpg',NULL),(125,'2015-04-02 07:48:00',NULL,'1427960880635Penguins.jpg',NULL),(126,'2015-04-02 17:15:44',NULL,'thumbnail.142798414134010444331_10152570339461193_8642401357378825877_n.jpg',NULL),(127,'2015-04-02 16:40:24',NULL,'1427992824455Koala.jpg',NULL),(128,'2015-04-02 16:44:04',NULL,'1427993044345Penguins.jpg',NULL),(129,'2015-04-02 16:48:27',NULL,'1427993307688Chrysanthemum.jpg',NULL),(130,'2015-04-03 10:22:58',NULL,'thumbnail.142804577620610444331_10152570339461193_8642401357378825877_n_reduced.jpg',NULL),(131,'2015-04-03 10:22:59',NULL,'1428045776193architecture-splendid-monochrome-exterior-in-boxy-home-design-deluxe-modern-home-design-photo-gallery.jpg',NULL),(132,'2015-04-03 10:23:00',NULL,'1428045776204HeaderIcon.png',NULL),(133,'2015-04-03 07:47:26',NULL,'thumbnail.1428047246521Lighthouse.jpg',NULL),(134,'2015-04-03 07:47:26',NULL,'1428047246513Chrysanthemum.jpg',NULL),(135,'2015-04-03 07:47:26',NULL,'1428047246516Lighthouse.jpg',NULL),(136,'2015-04-03 07:47:26',NULL,'1428047246517Tulips.jpg',NULL),(137,'2015-04-03 07:47:26',NULL,'1428047246519Koala.jpg',NULL),(138,'2015-04-03 11:17:14',NULL,'thumbnail.14280598339611.jpg',NULL),(139,'2015-04-03 14:57:39',NULL,'14280622578341.jpg',NULL),(140,'2015-04-03 14:58:03',NULL,'14280622799772.jpg',NULL),(141,'2015-04-03 14:58:28',NULL,'14280623056423.jpg',NULL),(142,'2015-04-03 14:58:54',NULL,'14280623311804.jpg',NULL),(143,'2015-04-03 12:58:08',NULL,'thumbnail.14280658887161.jpg',NULL),(144,'2015-04-03 12:58:08',NULL,'14280658887131.jpg',NULL),(145,'2015-04-03 12:58:08',NULL,'14280658887142.jpg',NULL),(146,'2015-04-03 12:58:08',NULL,'14280658887153.jpg',NULL),(147,'2015-04-03 13:01:29',NULL,'14280660889862.jpg',NULL),(148,'2015-04-03 13:01:29',NULL,'thumbnail.14280660886481.jpg',NULL),(149,'2015-04-03 16:18:31',NULL,'14280671088122.jpg',NULL),(150,'2015-04-03 13:47:42',NULL,'14280688617141.jpg',NULL),(151,'2015-04-03 13:48:03',NULL,'14280688835962.jpg',NULL),(152,'2015-04-03 13:48:23',NULL,'14280689032903.jpg',NULL),(153,'2015-04-03 13:48:42',NULL,'14280689225344.jpg',NULL),(154,'2015-04-04 14:11:01',NULL,'14281566609481013219_307885126020594_1949826540_n.jpg',NULL),(155,'2015-04-07 09:14:59',NULL,'14283980997711378845_307884992687274_479174544_n.jpg',NULL),(156,'2015-04-07 09:16:49',NULL,'142839820936711083850_787260654688680_5282212545415757944_n.jpg',NULL),(157,'2015-04-07 09:19:03',NULL,'14283983435171379979_307885279353912_1761678350_n.jpg',NULL),(158,'2015-04-07 09:32:20',NULL,'14283991404591379215_307885246020582_352452823_n.jpg',NULL),(159,'2015-04-07 14:43:52',NULL,'14284178327521013219_307885126020594_1949826540_n.jpg',NULL),(160,'2015-04-07 14:46:46',NULL,'14284180063121378845_307884992687274_479174544_n.jpg',NULL),(161,'2015-04-07 20:02:08',NULL,'1428436928057Jellyfish.jpg',NULL),(162,'2015-04-08 10:58:23',NULL,'1428490703608rsz__ssf2664.png',NULL),(163,'2015-04-08 11:07:04',NULL,'1428491224646rsz__ssf2664.png',NULL),(164,'2015-04-09 08:18:42',NULL,'1428567522890hot-scissors-hair-cut-300x199.jpg',NULL),(165,'2015-04-09 13:05:19',NULL,'1428584719417лореал 1.png',NULL),(166,'2015-04-09 13:06:59',NULL,'1428584819858лореал 1.png',NULL),(170,'2015-04-12 06:29:57',NULL,'1428820197056DSC_0624.JPG',NULL),(171,'2015-04-12 06:31:11',NULL,'142882027147011128320_387078061471914_8924853292461779413_n.jpg',NULL),(172,'2015-04-12 06:32:56',NULL,'142882037628320141213_182922.jpg',NULL),(174,'2015-04-13 09:23:29',NULL,'142891700926120150413_121223.jpg',NULL),(176,'2015-04-14 12:10:24',NULL,'1429002620452142882083441620140624_122241.jpg',NULL),(177,'2015-04-14 12:11:41',NULL,'142901350127320131018_201856.jpg',NULL),(178,'2015-04-14 16:10:27',NULL,'thumbnail.142901702463510393148_10152570339396193_4023837337305359530_n.jpg',NULL),(179,'2015-04-14 16:10:28',NULL,'142901702462210444331_10152570339461193_8642401357378825877_n.jpg',NULL),(180,'2015-04-14 16:10:28',NULL,'1429017024632Cage.png',NULL),(181,'2015-04-14 18:53:08',NULL,'14290375881351.jpg',NULL),(182,'2015-04-14 18:55:47',NULL,'14290377472721.jpg',NULL),(183,'2015-04-18 13:03:02',NULL,'1429362182767Share2015-04-15-2bfef0e89ec4ea38f38c84c6be3d43f30d4630176cf7d5854c0dc7ade14c72e3-Picture.jpg',NULL),(185,'2015-04-18 13:08:46',NULL,'1429362526181Share2015-04-18-ffaa1b192e3b9d4443bca16dc648bb1a188d137f5cf3f1043032b756f5b6de94-Picture.jpg',NULL),(186,'2015-04-18 13:51:08',NULL,'1429365068884Maria_Georgieva_detsko_podstrigvane_thumb.jpg',NULL),(187,'2015-04-28 12:28:14',NULL,'1430224094276208b1278b29d0062af8070d59bfd0119.jpg',NULL),(188,'2015-04-28 12:36:01',NULL,'1430224561735000012177carly_roberts_hair_3.jpg',NULL),(189,'2015-04-28 12:41:57',NULL,'1430224917504hot-beard-770x385.jpg',NULL),(190,'2015-04-28 12:47:44',NULL,'143022526429513591162779074.jpg',NULL),(191,'2015-04-28 12:59:28',NULL,'1430225968893MTM0OTM1ODQzOC5qcGd8aW1hZ2V8M3w2NzM5NXxpa0.jpg',NULL),(192,'2015-04-28 13:15:58',NULL,'1430226958441big_e9bb1e11829682deedcfb07cd8b2f8c8.jpg',NULL),(193,'2015-05-04 20:22:23',NULL,'14307601427425TOBcdj.jpg',NULL);
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (2,'2015-03-15 20:01:35',NULL,'tranewasd@gmail.com','димитър Павлов','asdasd асдасд'),(3,'2015-03-15 20:24:35',NULL,'ShortTextте','димитър Павлов','ShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextтеShortTextте'),(4,'2015-03-25 16:02:32',NULL,'','',''),(5,'2015-03-30 07:26:10',NULL,'tsolo@abv.bg','Tsolo','Здравейте, имам сериозен проблем! :)'),(6,'2015-04-02 17:01:17',NULL,'tsolo.tsvetkov@gmail.com','Цоло','имам съобщение, моля кажете ми wifi в салона Ви! ');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9lus1w5u918pd8add6txe8c6o` (`image_id`),
  CONSTRAINT `FK_9lus1w5u918pd8add6txe8c6o` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (3,'2015-03-30 07:00:26','2015-04-01 14:02:50',NULL,'ACTIVE',NULL,'Валентин Цветков с нов сайт','Новия сайт на коафьора Валентин Цветков вече е наличен! Новия сайт на коафьора Валентин Цветков вече е наличен!',65),(4,'2015-04-02 16:40:24','2015-04-02 16:41:47',NULL,'ARCHIVED',NULL,'Валя ще смени цвета на косата си','ВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТВАЛЯ С НОВ ЦВЯТ',127),(5,'2015-04-07 09:31:37','2015-04-07 09:32:20',NULL,'ACTIVE',NULL,'Господари на ефира','екипът на HairSpot прави косите на Господари на ефира',158),(6,'2015-04-07 20:02:08','2015-04-07 20:02:25',NULL,'ACTIVE',NULL,'test123','test 123test 123test 123test 123test 123test 123test 123',161);
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offer`
--

DROP TABLE IF EXISTS `Offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gi15vdfis6fyanv0a91j0lml8` (`product_id`),
  KEY `FK_ficpq9mxu34685pli3ds1gcfy` (`service_id`),
  CONSTRAINT `FK_ficpq9mxu34685pli3ds1gcfy` FOREIGN KEY (`service_id`) REFERENCES `Service` (`id`),
  CONSTRAINT `FK_gi15vdfis6fyanv0a91j0lml8` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offer`
--

LOCK TABLES `Offer` WRITE;
/*!40000 ALTER TABLE `Offer` DISABLE KEYS */;
INSERT INTO `Offer` VALUES (1,NULL,'2015-03-28 15:38:19',NULL,10.99,'ARCHIVED','2015-03-31 00:00:00',NULL,NULL,NULL),(2,'2015-03-28 15:39:01','2015-03-28 15:18:04','2015-03-01 00:00:00',10.99,'ARCHIVED','2015-03-31 00:00:00',2,NULL,''),(3,'2015-04-02 16:49:37','2015-04-03 16:58:38','2015-04-30 00:00:00',4.99,'ACTIVE','2015-05-25 00:00:00',9,NULL,'Керастас гел за коса'),(4,'2015-04-03 14:02:19',NULL,'2015-04-03 00:00:00',15.99,'ACTIVE','2015-04-30 00:00:00',8,NULL,'Оферта 2');
/*!40000 ALTER TABLE `Offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `description` longtext,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `oldPrice` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `promo` bit(1) DEFAULT NULL,
  `newPrice` double DEFAULT NULL,
  `promoted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4xs79c09k2c86bqt4spmjs77` (`image_id`),
  CONSTRAINT `FK_4xs79c09k2c86bqt4spmjs77` FOREIGN KEY (`image_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'2015-03-23 16:45:08','2015-03-24 19:05:21','asdas asdasda asdasd adsdasdasdasdas asdasda asdasd adsdasdasdasdas asdasda asdasd adsdasdasdasdas','Продукт 1','ARCHIVED',49,NULL,12.32,NULL,NULL,NULL),(2,'2015-03-28 15:13:31','2015-03-28 15:17:53','Описание на продукт 1 което трябва да е дълго. Описание на продукт 1 което трябва да е дълго. Описание на продукт 1 което трябва да е дълго','Продукт 1','ARCHIVED',58,NULL,12.99,NULL,NULL,'\0'),(3,'2015-03-28 16:52:51','2015-03-28 15:17:55','Описание','Продукт 2','ARCHIVED',59,NULL,9.99,NULL,NULL,'\0'),(4,'2015-03-28 16:53:28','2015-03-28 15:17:56','Описание 3 Описание 3 Описание 3 Описание 3 Описание 3 Описание 3 Описание 3 ','Продукт 3','ARCHIVED',60,NULL,4.99,NULL,NULL,'\0'),(5,'2015-03-28 16:54:59','2015-03-28 15:17:58','Описанееееее елее  елее елее  ','Продукт 4','ARCHIVED',61,NULL,22.99,NULL,NULL,'\0'),(6,'2015-03-28 15:19:14','2015-03-28 15:24:01','Lorem ipsum dolor sit amet, nam amet tota legendos cu. Sit at stet molestiae. In legimus ancillae mea, veritus consectetuer conclusionemque mei in. Eu impetus persecuti vel. Rebum fugit eos ea.','Продукт 1','ACTIVE',62,NULL,12.99,NULL,9.99,''),(7,'2015-03-28 15:19:39','2015-04-02 16:47:57','Lorem ipsum dolor sit amet, nam amet tota legendos cu. Sit at stet molestiae. In legimus ancillae mea, veritus consectetuer conclusionemque mei in. Eu impetus persecuti vel. Rebum fugit eos ea.','Продукт 2','ACTIVE',63,NULL,12.99,NULL,NULL,'\0'),(8,'2015-03-28 15:19:53','2015-03-28 15:24:35','Lorem ipsum dolor sit amet, nam amet tota legendos cu. Sit at stet molestiae. In legimus ancillae mea, veritus consectetuer conclusionemque mei in. Eu impetus persecuti vel. Rebum fugit eos ea.','Продукт 3','ACTIVE',64,NULL,23.99,NULL,NULL,'\0'),(9,'2015-04-02 16:48:27','2015-04-02 17:04:12','зьЦзжЗѝзь','Крастас','ACTIVE',129,NULL,40,NULL,30,'');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salon`
--

DROP TABLE IF EXISTS `Salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `information` longtext,
  `mobilePhoneNumber` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `images_id` bigint(20) DEFAULT NULL,
  `providedServices` longtext,
  `contact_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tj26m92rab8nccfimsjnjavl7` (`images_id`),
  KEY `FK_k7tp2r3009eehpyl42w9myqck` (`contact_id`),
  CONSTRAINT `FK_k7tp2r3009eehpyl42w9myqck` FOREIGN KEY (`contact_id`) REFERENCES `Contact` (`id`),
  CONSTRAINT `FK_tj26m92rab8nccfimsjnjavl7` FOREIGN KEY (`images_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salon`
--

LOCK TABLES `Salon` WRITE;
/*!40000 ALTER TABLE `Salon` DISABLE KEYS */;
INSERT INTO `Salon` VALUES (1,'2015-03-30 07:04:24','2015-04-01 11:46:54',NULL,NULL,'Opisanie',NULL,'салон 1 - the mall',NULL,NULL,'ARCHIVED',NULL,'Opisanie',1),(2,'2015-04-01 14:14:41','2015-04-01 15:43:19',NULL,NULL,'Suspendisse tempor nulla nulla, id gravida metus interdum vel. Praesent accumsan lorem blandit fermentum feugiat. Nam at mattis eros. Nulla facilisi. Curabitur consectetur accumsan libero quis molestie. Aenean tristique tellus rhoncus porttitor semper. Vivamus sit amet accumsan est. Maecenas fermentum porttitor vehicula. Sed tellus quam, hendrerit sit amet orci non, condimentum condimentum libero. Maecenas pellentesque vehicula tempus. Nulla maximus ipsum felis. Mauris ut lectus sed est accumsan cursus nec vel magna.',NULL,'The Mall',NULL,NULL,'ACTIVE',NULL,'Nunc porttitor dictum nibh, ut aliquet libero condimentum ac. Quisque semper rutrum condimentum. Sed tincidunt ultricies erat id maximus. Duis fermentum velit vel gravida porttitor. Etiam tempor, odio vel lacinia gravida, purus metus pretium eros, at fringilla magna sapien a ante. Sed lacinia pulvinar sapien vitae varius. Phasellus ornare molestie justo, in pharetra sem congue pharetra. Vestibulum suscipit maximus lorem et viverra. Etiam dolor lorem, bibendum ultrices leo a, lobortis pellentesque tellus. Praesent aliquam placerat nisi et facilisis.',1),(3,'2015-04-01 11:51:26','2015-04-02 17:12:27',NULL,NULL,'Suspendisse tempor nulla nulla, id gravida metus interdum vel. Praesent accumsan lorem blandit fermentum feugiat. Nam at mattis eros. Nulla facilisi. Curabitur consectetur accumsan libero quis molestie. Aenean tristique tellus rhoncus porttitor semper. Vivamus sit amet accumsan est. Maecenas fermentum porttitor vehicula. Sed tellus quam, hendrerit sit amet orci non, condimentum condimentum libero. Maecenas pellentesque vehicula tempus. Nulla maximus ipsum felis. Mauris ut lectus sed est accumsan cursus nec vel magna.',NULL,'Стрелбище',NULL,NULL,'ACTIVE',NULL,'Suspendisse tempor nulla nulla, id gravida metus interdum vel. Praesent accumsan lorem blandit fermentum feugiat. Nam at mattis eros. Nulla facilisi. Curabitur consectetur accumsan libero quis molestie. Aenean tristique tellus rhoncus porttitor semper. Vivamus sit amet accumsan est. Maecenas fermentum porttitor vehicula. Sed tellus quam, hendrerit sit amet orci non, condimentum condimentum libero. Maecenas pellentesque vehicula tempus. Nulla maximus ipsum felis. Mauris ut lectus sed est accumsan cursus nec vel magna.',2);
/*!40000 ALTER TABLE `Salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salon_Image`
--

DROP TABLE IF EXISTS `Salon_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salon_Image` (
  `Salon_id` bigint(20) NOT NULL,
  `images_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_t0ierwgkm9ykk5ut92pge4nse` (`images_id`),
  KEY `FK_cwmaq2b8t3pqnimkutk9y9t4w` (`Salon_id`),
  CONSTRAINT `FK_cwmaq2b8t3pqnimkutk9y9t4w` FOREIGN KEY (`Salon_id`) REFERENCES `Salon` (`id`),
  CONSTRAINT `FK_t0ierwgkm9ykk5ut92pge4nse` FOREIGN KEY (`images_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salon_Image`
--

LOCK TABLES `Salon_Image` WRITE;
/*!40000 ALTER TABLE `Salon_Image` DISABLE KEYS */;
INSERT INTO `Salon_Image` VALUES (1,69),(2,116),(2,117),(2,118),(2,119),(3,120),(3,121),(3,122),(3,123);
/*!40000 ALTER TABLE `Salon_Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `description` longtext,
  `status` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `mainImage_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `newPrice` double DEFAULT NULL,
  `promoted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iyenyfv8mcm87h3nqu672tjs5` (`mainImage_id`),
  CONSTRAINT `FK_iyenyfv8mcm87h3nqu672tjs5` FOREIGN KEY (`mainImage_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'2015-04-09 08:18:42',NULL,'дамско подстригване и стилизиране','ACTIVE',NULL,164,'Дамско подстригване',29,NULL,'\0'),(2,'2015-04-13 09:23:29','2015-04-28 12:30:02','къса до средна коса(до 20см.) - 36.00лв.\r\nсредна до дълга коса(от 20 до 30см.) - 38.00лв.\r\nдълга коса(от 30 до 40см.) - 40.00лв.\r\nмного дълга коса (над 40см.) - 44.00лв\r\nдамско подстригване по сешоар по визия от колекция +10лв.\r\n','ACTIVE',NULL,174,'дамско подстригване и сешоар/преса',36,NULL,'\0'),(3,'2015-04-18 13:51:08',NULL,'','ACTIVE',NULL,186,'детско подстригване',19,NULL,'\0'),(4,'2015-04-28 12:28:14',NULL,'мъжко подстригване(стандарт) - 24.00лв.\r\nмъжко подстригване с промяна на прическата - 29.00лв.\r\nмъжко подстригване + боядисване – 39.00лв.','ACTIVE',NULL,187,'мъжко подстригване',24,NULL,'\0'),(5,'2015-04-28 12:36:01','2015-04-28 12:36:30','','ACTIVE',NULL,188,'бретон',5,NULL,'\0'),(6,'2015-04-28 12:41:57','2015-04-28 12:42:47','брада - 5.00лв.\r\nврат - -5.00лв.','ACTIVE',NULL,189,'брада/врат',5,NULL,'\0'),(7,'2015-04-28 12:47:44',NULL,'измиване мъже - 3.00лв.\r\nизмиване жени - 6.00лв.','ACTIVE',NULL,190,'измиване',3,NULL,'\0'),(8,'2015-04-28 12:59:28',NULL,'','ACTIVE',NULL,191,'официална прическа',45,NULL,'\0'),(9,'2015-04-28 13:15:58',NULL,'къса до средна коса(до 20см.) - 24.00лв.\r\nсредна до дълга коса(от 20 до 40см) - 26.00лв.\r\nдълга коса(от 30 до 40см.) - 28.00лв.\r\nмного дълга коса(над 40см) - 32.00лв.\r\n\r\n','ACTIVE',NULL,192,'сешоар',24,NULL,'\0');
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Image`
--

DROP TABLE IF EXISTS `Service_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service_Image` (
  `Service_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_p45fh70eodnudjf2shsj46io3` (`gallery_id`),
  KEY `FK_abqhn2repk5q0wsnmx6vea0x4` (`Service_id`),
  CONSTRAINT `FK_abqhn2repk5q0wsnmx6vea0x4` FOREIGN KEY (`Service_id`) REFERENCES `Service` (`id`),
  CONSTRAINT `FK_p45fh70eodnudjf2shsj46io3` FOREIGN KEY (`gallery_id`) REFERENCES `Image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Image`
--

LOCK TABLES `Service_Image` WRITE;
/*!40000 ALTER TABLE `Service_Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Service_Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateLastModified` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'2015-04-04 14:12:02',NULL,'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','ADMINISTRATOR','admin');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-04 18:07:24
