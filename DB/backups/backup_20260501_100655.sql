/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: MustelidSelector2000
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Habitats`
--

DROP TABLE IF EXISTS `Habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Habitats` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitats`
--

LOCK TABLES `Habitats` WRITE;
/*!40000 ALTER TABLE `Habitats` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Habitats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `MustelidHabitats`
--

DROP TABLE IF EXISTS `MustelidHabitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MustelidHabitats` (
  `mustelid_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  PRIMARY KEY (`mustelid_id`,`habitat_id`),
  KEY `habitat_id` (`habitat_id`),
  CONSTRAINT `mustelidhabitats_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`),
  CONSTRAINT `mustelidhabitats_ibfk_2` FOREIGN KEY (`habitat_id`) REFERENCES `Habitats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MustelidHabitats`
--

LOCK TABLES `MustelidHabitats` WRITE;
/*!40000 ALTER TABLE `MustelidHabitats` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `MustelidHabitats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `MustelidTraits`
--

DROP TABLE IF EXISTS `MustelidTraits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MustelidTraits` (
  `mustelid_id` int(11) NOT NULL,
  `trait_id` int(11) NOT NULL,
  `value` double NOT NULL CHECK (`value` between 1.0 and 5.0),
  PRIMARY KEY (`mustelid_id`,`trait_id`),
  KEY `trait_id` (`trait_id`),
  CONSTRAINT `mustelidtraits_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`),
  CONSTRAINT `mustelidtraits_ibfk_2` FOREIGN KEY (`trait_id`) REFERENCES `Traits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MustelidTraits`
--

LOCK TABLES `MustelidTraits` WRITE;
/*!40000 ALTER TABLE `MustelidTraits` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `MustelidTraits` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Mustelids`
--

DROP TABLE IF EXISTS `Mustelids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mustelids` (
  `id` int(11) NOT NULL,
  `common_name` varchar(100) NOT NULL,
  `scientific_name` varchar(150) NOT NULL,
  `subfamily` varchar(100) DEFAULT NULL,
  `genus` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fun_fact` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `wiki_url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mustelids`
--

LOCK TABLES `Mustelids` WRITE;
/*!40000 ALTER TABLE `Mustelids` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Mustelids` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Stats`
--

DROP TABLE IF EXISTS `Stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stats` (
  `id` int(11) NOT NULL,
  `mustelid_id` int(11) NOT NULL,
  `stat_name` varchar(100) NOT NULL,
  `stat_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mustelid_id` (`mustelid_id`),
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Stats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Traits`
--

DROP TABLE IF EXISTS `Traits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Traits` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Traits`
--

LOCK TABLES `Traits` WRITE;
/*!40000 ALTER TABLE `Traits` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Traits` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Temporary table structure for view `mustelids_list`
--

DROP TABLE IF EXISTS `mustelids_list`;
/*!50001 DROP VIEW IF EXISTS `mustelids_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mustelids_list` AS SELECT
 1 AS `common_name`,
  1 AS `scientific_name`,
  1 AS `genus` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `mustelids_list`
--

/*!50001 DROP VIEW IF EXISTS `mustelids_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Mylo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mustelidselector2000`.`mustelids_list` AS select `mustelidselector2000`.`mustelids`.`common_name` AS `common_name`,`mustelidselector2000`.`mustelids`.`scientific_name` AS `scientific_name`,`mustelidselector2000`.`mustelids`.`genus` AS `genus` from `mustelidselector2000`.`mustelids` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-01 10:06:55
