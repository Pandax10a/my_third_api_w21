-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: my_third_api_w21b
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.9-MariaDB

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
-- Table structure for table `philosopher`
--

DROP TABLE IF EXISTS `philosopher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `philosopher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bio` text COLLATE utf8mb4_bin DEFAULT NULL,
  `date_of_birth` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `date_of_death` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `image_url` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `philosopher_un` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `philosopher`
--

LOCK TABLES `philosopher` WRITE;
/*!40000 ALTER TABLE `philosopher` DISABLE KEYS */;
INSERT INTO `philosopher` VALUES (1,'test1','from test ....','-45','1','https://google.com'),(2,'socrates','Socrates was born, as far as we know, in Athens around 469 B.C. Our knowledge of his life is sketchy and derives mainly from three contemporary sources, the dialogues of Plato and Xenophon (c. 431 - 355 B.C.), and the plays of Aristophanes (c. 456 - 386 B.C.). According to Plato, Socrates\' father was Sophroniscus (a sculptor and stonemason) and his mother was Phaenarete (a midwife). His family was respectable in descent, but humble in means. He appears to have had no more than an ordinary Greek education (reading, writing, gymnastics and music, and, later, geometry and astronomy) before devoting his time almost completely to intellectual interests.','-469','-399','https://www.philosophybasics.com/photos/socrates.jpg'),(3,'socrates test 2','Socrates was born, as far as we know, in Athens around 469 B.C. Our knowledge of his life is sketchy and derives mainly from three contemporary sources, the dialogues of Plato and Xenophon (c. 431 - 355 B.C.), and the plays of Aristophanes (c. 456 - 386 B.C.). According to Plato, Socrates\' father was Sophroniscus (a sculptor and stonemason) and his mother was Phaenarete (a midwife). His family was respectable in descent, but humble in means. He appears to have had no more than an ordinary Greek education (reading, writing, gymnastics and music, and, later, geometry and astronomy) before devoting his time almost completely to intellectual interests.','-469','-399','https://www.philosophybasics.com/photos/socrates.jpg'),(8,'martin heidegger','Heidegger (pronounced HIE-de-ger) was born on 26 September 1889 in Messkirch in rural southern Germany, to a poor Catholic family. He was the son of the sexton of the village church, and was raised a Roman Catholic. Even as a child, he was clearly a strong and charismatic personality, despite his physical frailty. In 1903, he went to the high school in Konstanz, where the church supported him by a scholarship, and then moved to the Jesuit seminary at Freiburg in 1906. His early introduction to philosophy came with his reading of \'On the Manifold Meaning of Being according to Aristotle\' by the philosopher and psychologist Franz Brentano (1838 - 1917)','1889','1976','https://www.philosophybasics.com/photos/heidegger.jpg'),(9,'william james','William James was born on 11 January 1842 at Astor House (then the finest hotel in New York City). He was the son of Henry James Sr., an independently wealthy and notoriously eccentric Swedenborgian theologian, and was the elder brother of the novelist Henry James and of the diarist Alice James, as well as three other brothers. His family was well acquainted with the literary and intellectual elites of his day, and he received an eclectic trans-Atlantic education, developing fluency in both German and French (along with a cosmopolitan character) from his many childhood trips to Europe.','1842','1910','https://www.philosophybasics.com/photos/james.jpg'),(10,'aristotle','Aristotle was born to an aristocratic family in Stageira on the Chalcidice Peninsula of Macedonia (a region of northern Greece) in 384 B.C. His father, Nicomachus, was the personal physician to King Amyntas of Macedon, and Aristotle was trained and educated as a member of the aristocracy. Aristotle\'s mother, Phaestis, came from Chalcis on the island of Euboea, and her family owned property there.','-384','-322','https://www.philosophybasics.com/photos/aristotle.jpg');
/*!40000 ALTER TABLE `philosopher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `philosopher_id` int(10) unsigned DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_FK` (`philosopher_id`),
  CONSTRAINT `quote_FK` FOREIGN KEY (`philosopher_id`) REFERENCES `philosopher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` VALUES (1,1,'testing add quote'),(2,2,'The unexamined life is not worth living');
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'my_third_api_w21b'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_philosopher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_philosopher`(name_input varchar(100), bio_input text, date_of_birth_input varchar(20), date_of_death_input varchar(20), image_url_input varchar(200))
    MODIFIES SQL DATA
begin
	insert into philosopher(name, bio, date_of_birth, date_of_death, image_url)
	values
	(name_input, bio_input, date_of_birth_input, date_of_death_input, image_url_input);
	commit;
	select last_insert_id(); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_quote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_quote`(philosopher_id_input int unsigned, content_input varchar(255))
    MODIFIES SQL DATA
begin
	insert into `quote`(philosopher_id, content)
	values
	(philosopher_id_input, content_input);
	commit;
	select last_insert_id(); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_philosopher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all_philosopher`()
begin
	select id, name, bio, date_of_birth, date_of_death, image_url from philosopher;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_quote_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_quote_by_id`(philosopher_id_input int unsigned)
begin
	select q.content, q.id, p.name
	from `quote` q inner join philosopher p on q.philosopher_id = p.id
	where q.philosopher_id = philosopher_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-11  2:03:15
