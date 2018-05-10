-- MySQL dump 10.13  Distrib 5.7.21, for osx10.12 (x86_64)
--
-- Host: localhost    Database: spring_cms
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `created` datetime DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `categories_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKglvhv5e43dmjhmiovwhcax7aq` (`author_id`),
  KEY `FKti99q9tn5fnfrc44do60jovkw` (`categories_id`),
  CONSTRAINT `FKglvhv5e43dmjhmiovwhcax7aq` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `FKti99q9tn5fnfrc44do60jovkw` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'article1-content',NULL,'article1','2018-05-08 23:25:49',2,NULL),(2,'article1-content new',NULL,'article1','2018-05-08 22:43:50',1,NULL),(3,'article2-content','2018-05-08 12:23:06','article2',NULL,2,NULL),(4,'article5-content',NULL,'article5','2018-05-08 22:53:22',5,NULL),(5,'article4-content','2018-05-08 22:03:30','article4','2018-05-08 22:03:30',NULL,NULL),(7,'article7-content','2018-05-08 12:23:28','article7',NULL,1,NULL),(10,'zawartosc artykulu Jana - nowa',NULL,'artykul Jana','2018-05-08 22:44:19',10,NULL),(12,'article content','2018-05-08 22:51:14','Janina\'s article',NULL,5,NULL),(13,'new content','2018-05-09 09:47:16','new article','2018-05-09 09:47:28',10,NULL),(14,'Lorem ipsum dolor sit amet, ne aperiri vulputate adversarium usu. No tantas nostro eirmod sea, pro rationibus cotidieque ut. Equidem dolores vulputate est ut, illud homero democritum sit ex. In quis graece lobortis mel. Vis timeam urbanitas dissentiunt in, doming essent integre est ex.\r\n\r\nEquidem inermis accumsan ne ius, commodo tamquam nam et, ne sonet consul praesent sed. Sit ei complectitur consectetuer necessitatibus, eu unum hendrerit omittantur cum. Dicta antiopam mea ne, at unum adipiscing sit. Aeque dolores eu eum. In alterum reprehendunt nam, ex vis assentior constituto. Ne vidisse pertinacia vituperatoribus pri, ei cum omnes tamquam tibique, ea mei regione insolens. Cum reque mundi ut, usu facete facilisi persequeris ut.\r\n\r\nEa sea eleifend temporibus instructior. Tation virtute appellantur pri ei. Ne nam habemus pericula reprehendunt, eros viderer sed ad, te his facer ignota dicunt. Eam etiam fuisset lobortis ei.\r\n\r\nSed vivendo repudiandae id, sed lobortis abhorreant ex, ut persequeris instructior quo. In eos nonumy ancillae, exerci labitur ad per. Vim utamur neglegentur ne, mea malorum offendit ad. Eirmod meliore eam ex. Posse viderer ad vel, nibh elitr ocurreret an eos, pro unum ludus vulputate in.\r\n\r\nConvenire consequuntur eam eu, integre nostrum appareat mei eu. Qui ei alia nihil consequuntur, ad atqui minim sensibus pro. Magna putant constituam in per, vim dicit facilisi conceptam ei. Hinc alterum tibique ut eum, vidisse torquatos eam te. Tale everti signiferumque mel ei, inani facilisi expetendis eu nec.','2018-05-09 22:45:57','as',NULL,2,NULL),(15,'new article new article new article new article new article new article\r\nnew article new article new article new article new article new article\r\nnew article new article new article new article new article new article\r\nnew article new article new article new article new article new articlenew article new article new article new article new article new articlenew article new article new article new article new article new article\r\nnew article new article new article new article new article new article\r\nv\r\nvv\r\nv\r\n\r\nnew article new article new article new article new article new articlenew article new article new article new article new article new article','2018-05-09 23:37:55','new','2018-05-09 23:38:12',10,NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_categories`
--

DROP TABLE IF EXISTS `articles_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_categories` (
  `Article_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  KEY `FKbyyh68wdenkp9gl059qedoyev` (`categories_id`),
  KEY `FK1ug86ibln4au4l3jyy40vfafr` (`Article_id`),
  CONSTRAINT `FK1ug86ibln4au4l3jyy40vfafr` FOREIGN KEY (`Article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `FKbyyh68wdenkp9gl059qedoyev` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_categories`
--

LOCK TABLES `articles_categories` WRITE;
/*!40000 ALTER TABLE `articles_categories` DISABLE KEYS */;
INSERT INTO `articles_categories` VALUES (5,1),(5,3),(2,3),(10,4),(12,1),(1,1),(13,4),(14,4),(15,1),(15,4);
/*!40000 ALTER TABLE `articles_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Jan','Kowalski'),(2,'Janina','Nowak'),(4,'Jan','Kowalski'),(5,'Janina','Nowak'),(7,'Jan','Kowalski'),(9,'Tomasz','Kozlowski'),(10,'Jan','Madej');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'desc1','name1'),(3,'category3 - new','category3'),(4,'wspaniaÅa kategoria jana','Kategoria Jana');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-10  9:58:16
