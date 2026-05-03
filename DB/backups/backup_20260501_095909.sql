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
INSERT INTO `Habitats` VALUES
(1,'Freshwater Rivers'),
(2,'Wetlands'),
(3,'Hedgerows'),
(4,'Grassland'),
(5,'Humid Lowland Rainforests'),
(6,'Woodlands'),
(7,'Open Fields'),
(8,'Coniferous'),
(9,'Mixed Forests'),
(10,'Riverbanks'),
(11,'Steppes'),
(12,'Forests'),
(13,'Tundra Edges'),
(14,'Mangrove Swamps'),
(15,'Rice Paddies'),
(16,'Rocky Mountains'),
(17,'Deciduous Woods'),
(18,'Shortgrass Prairie'),
(19,'Tropical'),
(20,'Subtropical Forests'),
(21,'Montane Meadows'),
(22,'Montane Riparian Cloud Forests'),
(23,'Domesticated'),
(24,'Deciduous Woodlands'),
(25,'Pastures'),
(26,'Old-growth Deciduous Forests'),
(27,'Dry Scrub'),
(28,'Farmland'),
(29,'Slow-moving Amazonian Rivers'),
(30,'Tropical Forests'),
(31,'Steppe'),
(32,'Lowland'),
(33,'Hilly Mixed Forests'),
(34,'Southeast Asian Swamp Forests'),
(35,'Arid Savanna'),
(36,'Grasslands'),
(37,'Alpine Scree'),
(38,'Bamboo Groves'),
(39,'Broad-leaved'),
(40,'Forest Streams'),
(41,'Arid Steppes'),
(42,'Semi-deserts'),
(43,'Coastal Marine'),
(44,'Moist Shola Rainforests'),
(45,'Temperate Forests'),
(46,'Pampas'),
(47,'Shrubby Woodlands'),
(48,'Nearshore Kelp Forests'),
(49,'Taiga'),
(50,'River Valleys'),
(51,'Montane'),
(52,'Cloud Forests'),
(53,'Boreal Forest'),
(54,'Arctic Tundra'),
(55,'Subtropical');
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
INSERT INTO `MustelidHabitats` VALUES
(1,1),
(18,1),
(20,1),
(45,1),
(47,1),
(55,1),
(56,1),
(57,1),
(1,2),
(7,2),
(18,2),
(20,2),
(22,2),
(45,2),
(47,2),
(54,2),
(55,2),
(56,2),
(57,2),
(2,3),
(5,3),
(10,3),
(30,3),
(38,3),
(40,3),
(41,3),
(59,3),
(65,3),
(2,4),
(5,4),
(10,4),
(30,4),
(33,4),
(38,4),
(40,4),
(41,4),
(44,4),
(59,4),
(65,4),
(3,5),
(4,6),
(4,7),
(6,8),
(25,8),
(49,8),
(51,8),
(6,9),
(25,9),
(34,9),
(35,9),
(49,9),
(51,9),
(66,9),
(7,10),
(22,10),
(8,11),
(15,11),
(8,12),
(8,13),
(9,14),
(9,15),
(11,16),
(11,17),
(12,18),
(13,19),
(14,19),
(16,19),
(26,19),
(37,19),
(63,19),
(13,20),
(14,20),
(16,20),
(26,20),
(37,20),
(63,20),
(15,21),
(17,22),
(19,23),
(21,24),
(21,25),
(23,26),
(24,27),
(52,27),
(58,27),
(60,27),
(24,28),
(52,28),
(58,28),
(60,28),
(27,29),
(28,30),
(39,30),
(62,30),
(28,31),
(39,31),
(62,31),
(29,32),
(29,33),
(31,34),
(32,35),
(32,36),
(36,36),
(48,36),
(33,37),
(44,37),
(34,38),
(35,39),
(36,40),
(42,41),
(42,42),
(43,43),
(46,44),
(48,45),
(50,46),
(50,47),
(53,48),
(54,49),
(54,50),
(61,51),
(61,52),
(64,53),
(64,54),
(66,55);
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
INSERT INTO `MustelidTraits` VALUES
(1,1,1.68),
(1,2,4.62),
(1,3,4.45),
(1,4,2.72),
(1,5,1.74),
(2,1,4.14),
(2,2,2.03),
(2,3,2.42),
(2,4,1.74),
(2,5,3.52),
(3,1,4.32),
(3,2,2.35),
(3,3,4.02),
(3,4,3.34),
(3,5,2.78),
(4,1,1.86),
(4,2,4.15),
(4,3,2.23),
(4,4,2.11),
(4,5,4.69),
(5,1,4.69),
(5,2,1.32),
(5,3,2.72),
(5,4,3.95),
(5,5,1.92),
(6,1,4.26),
(6,2,2.83),
(6,3,2.66),
(6,4,2.48),
(6,5,1.18),
(7,1,4.2),
(7,2,3),
(7,3,4.75),
(7,4,5),
(7,5,1.86),
(8,1,2.29),
(8,2,3.99),
(8,3,1.98),
(8,4,2.29),
(8,5,3.34),
(9,1,1.92),
(9,2,3.57),
(9,3,3.95),
(9,4,3.09),
(9,5,1.62),
(10,1,4.38),
(10,2,3),
(10,3,3.77),
(10,4,4.51),
(10,5,4.14),
(11,1,3.89),
(11,2,3.18),
(11,3,2.91),
(11,4,3.83),
(11,5,3.28),
(12,1,3.22),
(12,2,2.8),
(12,3,1.25),
(12,4,2.35),
(12,5,3.22),
(13,1,1.74),
(13,2,3.25),
(13,3,3.4),
(13,4,1.49),
(13,5,4.51),
(14,1,3.71),
(14,2,3.25),
(14,3,3.09),
(14,4,1.55),
(14,5,4.75),
(15,1,1.43),
(15,2,4.42),
(15,3,2.17),
(15,4,1.37),
(15,5,1.8),
(16,1,3.09),
(16,2,3.25),
(16,3,3.34),
(16,4,3.52),
(16,5,4.45),
(17,1,4.08),
(17,2,1.5),
(17,3,1.8),
(17,4,4.14),
(17,5,3.15),
(18,1,1.55),
(18,2,4.66),
(18,3,4.26),
(18,4,1.43),
(18,5,3.65),
(19,1,2.48),
(19,2,2.95),
(19,3,1.37),
(19,4,3.22),
(19,5,2.85),
(20,1,2.23),
(20,2,4.26),
(20,3,4.57),
(20,4,2.17),
(20,5,2.05),
(21,1,3.52),
(21,2,4.42),
(21,3,3.58),
(21,4,2.6),
(21,5,4.08),
(22,1,3.46),
(22,2,2.57),
(22,3,4.38),
(22,4,2.91),
(22,5,3.89),
(23,1,2.6),
(23,2,3.09),
(23,3,3.28),
(23,4,4.82),
(23,5,3.58),
(24,1,2.72),
(24,2,2.83),
(24,3,2.11),
(24,4,3.28),
(24,5,2.42),
(25,1,2.42),
(25,2,3.7),
(25,3,2.48),
(25,4,2.05),
(25,5,3.95),
(26,1,3.65),
(26,2,3.25),
(26,3,3.46),
(26,4,1.68),
(26,5,4.38),
(27,1,1.06),
(27,2,4.97),
(27,3,4.63),
(27,4,1.31),
(27,5,1.98),
(28,1,1.62),
(28,2,3.43),
(28,3,2.78),
(28,4,3.03),
(28,5,4.32),
(29,1,3.03),
(29,2,4.33),
(29,3,3.15),
(29,4,1.18),
(29,5,4.94),
(30,1,4.75),
(30,2,1.45),
(30,3,3.03),
(30,4,4.75),
(30,5,2.17),
(31,1,3.15),
(31,2,4.02),
(31,3,4.08),
(31,4,2.54),
(31,5,1),
(32,1,3.34),
(32,2,4.33),
(32,3,1.62),
(32,4,1.06),
(32,5,4.63),
(33,1,5),
(33,2,2.05),
(33,3,2.97),
(33,4,3.15),
(33,5,4.57),
(34,1,1.49),
(34,2,4.1),
(34,3,1.86),
(34,4,4.38),
(34,5,3.83),
(35,1,3.28),
(35,2,2.95),
(35,3,2.35),
(35,4,4.69),
(35,5,2.66),
(36,1,4.82),
(36,2,2.3),
(36,3,2.85),
(36,4,4.02),
(36,5,3.46),
(37,1,2.35),
(37,2,3.06),
(37,3,3.22),
(37,4,2.66),
(37,5,2.72),
(38,1,4.51),
(38,2,1),
(38,3,1.68),
(38,4,3.77),
(38,5,1.31),
(39,1,2.78),
(39,2,3.16),
(39,3,4.14),
(39,4,1.86),
(39,5,3.03),
(40,1,4.88),
(40,2,1.93),
(40,3,2.54),
(40,4,3.89),
(40,5,1.68),
(41,1,4.45),
(41,2,3.06),
(41,3,1.74),
(41,4,4.63),
(41,5,3.09),
(42,1,3.77),
(42,2,2.35),
(42,3,1),
(42,4,2.85),
(42,5,2.91),
(43,1,3.4),
(43,2,3.78),
(43,3,5),
(43,4,1.8),
(43,5,1.37),
(44,1,4.57),
(44,2,1.86),
(44,3,1.18),
(44,4,4.45),
(44,5,2.6),
(45,1,1.31),
(45,2,4.3),
(45,3,4.69),
(45,4,3.65),
(45,5,1.49),
(46,1,2.66),
(46,2,3.28),
(46,3,3.71),
(46,4,1.98),
(46,5,2.35),
(47,1,1.25),
(47,2,4.26),
(47,3,4.51),
(47,4,2.23),
(47,5,1.43),
(48,1,1.8),
(48,2,4.33),
(48,3,2.05),
(48,4,1.92),
(48,5,4.88),
(49,1,2.85),
(49,2,2.96),
(49,3,1.12),
(49,4,4.2),
(49,5,2.11),
(50,1,3.95),
(50,2,1.83),
(50,3,3.52),
(50,4,2.42),
(50,5,3.71),
(51,1,1.18),
(51,2,2.95),
(51,3,2.29),
(51,4,4.32),
(51,5,2.54),
(52,1,2.54),
(52,2,2.38),
(52,3,1.55),
(52,4,2.97),
(52,5,4.26),
(53,1,1.12),
(53,2,5),
(53,3,4.82),
(53,4,3.58),
(53,5,1.06),
(54,1,3.83),
(54,2,2.46),
(54,3,3.89),
(54,4,4.26),
(54,5,2.23),
(55,1,3.58),
(55,2,4.23),
(55,3,4.32),
(55,4,2.78),
(55,5,3.4),
(56,1,2.91),
(56,2,4.11),
(56,3,4.88),
(56,4,3.71),
(56,5,1.12),
(57,1,1.37),
(57,2,3.78),
(57,3,4.94),
(57,4,4.88),
(57,5,1.25),
(58,1,2.97),
(58,2,3.01),
(58,3,1.43),
(58,4,4.08),
(58,5,4.2),
(59,1,4.63),
(59,2,1.96),
(59,3,1.49),
(59,4,4.94),
(59,5,1.55),
(60,1,2.17),
(60,2,2.89),
(60,3,1.06),
(60,4,3.46),
(60,5,2.48),
(61,1,2.11),
(61,2,4.33),
(61,3,2.6),
(61,4,1.25),
(61,5,4.82),
(62,1,2.05),
(62,2,3.89),
(62,3,3.83),
(62,4,1.62),
(62,5,2.97),
(63,1,1.98),
(63,2,2.66),
(63,3,3.65),
(63,4,1.12),
(63,5,5),
(64,1,1),
(64,2,4.47),
(64,3,4.2),
(64,4,1),
(64,5,3.77),
(65,1,4.94),
(65,2,3.06),
(65,3,1.31),
(65,4,3.4),
(65,5,4.02),
(66,1,4.02),
(66,2,3.61),
(66,3,1.92),
(66,4,4.57),
(66,5,2.29);
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
INSERT INTO `Mustelids` VALUES
(1,'African clawless otter','Aonyx capensis','Lutrinae','Aonyx','The African clawless otter, also known as the Cape clawless otter, is the second-largest freshwater species of otter. It is found in much of sub-Saharan Africa.','They are the second-largest freshwater otter and have incredibly dexterous front paws that are almost entirely clawless and unwebbed, allowing them to feel for prey in the mud.','Mustelids/african_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/African_clawless_otter'),
(2,'African striped weasel','Poecilogale albinucha','Ictonychinae','Poecilogale','The African striped weasel, also known as the white-naped weasel, is a small, burrowing mustelid native to sub-Saharan Africa.','They obtain almost all the water they need directly from the prey they consume and rarely drink standing water.','Mustelids/african_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/African_striped_weasel'),
(3,'Amazon weasel','Neogale africana','Mustelinae','Neogale','The Amazon weasel is a species of mustelid native to the Amazon basin in South America. Despite its name, it is not found in Africa.','They are the only mustelids with a ventral stripe, a dark line that runs down the middle of their pale-colored chest and belly.','Mustelids/amazon_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Amazon_weasel'),
(4,'American badger','Taxidea taxus','Taxidiinae','Taxidea','The American badger is a North American badger, somewhat similar in appearance to the European badger, although not closely related. It is found in the western and central United States, northern Mexico, and south-central Canada to certain areas of southwestern British Columbia.','They occasionally hunt in short-term alliances with coyotes, where the badger digs prey out of burrows while the coyote catches any that escape to the surface.','Mustelids/american_badger/assets/photo.webp','https://en.wikipedia.org/wiki/American_badger'),
(5,'American ermine','Mustela richardsonii','Mustelinae','Mustela','The American ermine is a species of mustelid native to North America. It was formerly considered a subspecies of the stoat.','They exhibit a reproductive strategy called embryonic diapause, where the embryo remains dormant for months so the young are born in spring.','Mustelids/american_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/American_ermine'),
(6,'American marten','Martes americana','Guloninae','Martes','The American marten is a North American mammal, a member of the family Mustelidae. It is also sometimes referred to as the American pine marten.','A group of martens is collectively known as a richness.','Mustelids/american_marten/assets/photo.webp','https://en.wikipedia.org/wiki/American_marten'),
(7,'American mink','Neogale vison','Mustelinae','Neogale','The American mink is a semiaquatic species of mustelid native to North America. It has been introduced to many other parts of the world.','When they are happy or content, minks have been known to make a soft purring sound similar to a domestic cat.','Mustelids/american_mink/assets/photo.webp','https://en.wikipedia.org/wiki/American_mink'),
(8,'Asian badger','Meles leucurus','Melinae','Meles','The Asian badger, also known as the sand badger, is a species of badger native to Asia. It is widely distributed from the Volga River in the west to the Korean Peninsula in the east.','Unlike many other badgers, they often hibernate in family groups, with adults sharing their dens with the previous year\'s cubs.','Mustelids/asian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_badger'),
(9,'Asian small-clawed otter','Aonyx cinereus','Lutrinae','Aonyx','The Asian small-clawed otter, also known as the oriental small-clawed otter, is the smallest otter species in the world, native to South and Southeast Asia.','They are the smallest of all 13 otter species and form monogamous pairs that often stay together for life, with both parents helping to raise the pups.','Mustelids/asian_small_clawed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_small-clawed_otter'),
(10,'Back-striped weasel','Mustela strigidorsa','Mustelinae','Mustela','The back-striped weasel, also known as the stripe-backed weasel, is a species of mustelid found in Southeast Asia.','They are characterized by a narrow, silvery stripe running down the entire length of their back, which is mirrored by a yellowish streak on their belly.','Mustelids/back_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Back-striped_weasel'),
(11,'Beech marten','Martes foina','Guloninae','Martes','The beech marten, also known as the stone marten, house marten or white-breasted marten, is a species of marten native to much of Europe and Central Asia.','They have a notorious reputation for entering parked vehicle engine bays and chewing on cables and hoses, a behavior often called \'marten damage\'.','Mustelids/beech_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Beech_marten'),
(12,'Black-footed ferret','Mustela nigripes','Mustelinae','Mustela','The black-footed ferret, also known as the American polecat or prairie dog hunter, is a species of mustelid native to central North America.','They were once thought to be extinct until a small population was rediscovered in Wyoming in 1981; all living individuals today descend from just seven ancestors.','Mustelids/black_footed_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Black-footed_ferret'),
(13,'Bornean ferret-badger','Melogale everetti','Helictidinae','Melogale','The Bornean ferret-badger, also known as Everett\'s ferret-badger or the Kinabalu ferret-badger, is a small mustelid endemic to the island of Borneo. It is listed as Endangered on the IUCN Red List due to its restricted range and habitat loss.','They cleverly repurpose abandoned burrows created by other animals rather than digging their own, despite having strong claws.','Mustelids/bornean_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Bornean_ferret-badger'),
(14,'Burmese ferret-badger','Melogale personata','Helictidinae','Melogale','The Burmese ferret-badger, also known as the large-toothed ferret-badger, is a species of mustelid found in Southeast Asia, from Nepal and northeastern India to Indochina.','Each individual has a unique pattern of black and white patches on its face, making them easy to identify from one another.','Mustelids/burmese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Burmese_ferret-badger'),
(15,'Caucasian badger','Meles canescens','Melinae','Meles','The Caucasian badger, also known as the Southwest Asian badger, is a species of badger native to Western Asia and some islands in the Mediterranean Sea.','They were only officially recognized as a distinct species from the European badger in 2013 following genetic studies.','Mustelids/caucasian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Caucasian_badger'),
(16,'Chinese ferret-badger','Melogale moschata','Helictidinae','Melogale','The Chinese ferret-badger, also known as the small-toothed ferret-badger, is a small mustelid widely distributed in Southeast Asia and southern China. It is known for its distinctive facial mask and agile climbing abilities.','They are agile climbers that often sleep in tree branches and are encouraged by farmers to stay near agricultural areas to control pests.','Mustelids/chinese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Chinese_ferret-badger'),
(17,'Colombian weasel','Neogale felipei','Mustelinae','Neogale','The Colombian weasel, also known as Don Felipe\'s weasel, is a very rare species of mustelid found in Colombia and Ecuador.','They are considered the rarest carnivore in South America and have noticeable webbing between their toes, suggesting a semi-aquatic lifestyle.','Mustelids/colombian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Colombian_weasel'),
(18,'Congo clawless otter','Aonyx congicus','Lutrinae','Aonyx','The Congo clawless otter is a species of otter in the family Mustelidae. It is found in Cameroon, Congo, Democratic Republic of the Congo, Equatorial Guinea, and Gabon.','They are considered the most terrestrial of all otter species and spend a significant amount of time exploring shores and land compared to their relatives.','Mustelids/congo_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Congo_clawless_otter'),
(19,'Domestic ferret','Mustela furo','Mustelinae','Mustela','The ferret is the domesticated form of the European polecat, a mammal belonging to the same genus as the weasel, Mustela, in the family Mustelidae.','The name \'ferret\' is derived from the Latin word furittus, meaning \'little thief\', referring to their habit of stealing and stashing small items.','Mustelids/domestic_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Ferret'),
(20,'Eurasian otter','Lutra lutra','Lutrinae','Lutra','The Eurasian otter, also known as the European otter, Eurasian river otter, common otter, or Old World otter, is a semiaquatic mammal native to Eurasia.','Their droppings, known as \'spraint\', have a surprisingly pleasant smell that is often compared to jasmine tea or mown hay.','Mustelids/eurasian_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Eurasian_otter'),
(21,'European badger','Meles meles','Melinae','Meles','The European badger is a badger species native to almost all of Europe. It is a powerful animal with a small head, a stocky body, small black eyes and a short tail.','They live in communal burrow systems called setts that can be hundreds of years old and are passed down through many generations of the same clan.','Mustelids/european_badger/assets/photo.webp','https://en.wikipedia.org/wiki/European_badger'),
(22,'European mink','Mustela lutreola','Mustelinae','Mustela','The European mink is a semiaquatic species of mustelid native to Europe. It is one of the most endangered mammals in the world.','Unlike the American mink, they have a distinctive white upper lip that forms a small mask around their mouth.','Mustelids/european_mink/assets/photo.webp','https://en.wikipedia.org/wiki/European_mink'),
(23,'European pine marten','Martes martes','Guloninae','Martes','The European pine marten, also known as the pine marten or the sweet marten, is an animal native to Northern Europe.','They are the only mustelids with semi-retractable claws, which combined with 180-degree rotating ankles, makes them expert climbers.','Mustelids/european_pine_marten/assets/photo.webp','https://en.wikipedia.org/wiki/European_pine_marten'),
(24,'European polecat','Mustela putorius','Mustelinae','Mustela','The European polecat, also known as the common forest polecat, is a species of mustelid native to western Eurasia and North Africa.','They are the wild ancestors of the domestic ferret and were once nicknamed \'chicken-cats\' due to their habit of raiding poultry coops.','Mustelids/european_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/European_polecat'),
(25,'Fisher','Pekania pennanti','Guloninae','Pekania','The fisher is a small carnivorous mammal native to North America. It is a member of the mustelid family and is the only living species in the genus Pekania.','They are one of the few animals capable of successfully preying on porcupines by using their agility to attack the face or flip them over.','Mustelids/fisher/assets/photo.webp','https://en.wikipedia.org/wiki/Fisher_(animal)'),
(26,'Formosan ferret-badger','Melogale subaurantiaca','Helictidinae','Melogale','The Formosan ferret-badger is a species of mustelid endemic to the island of Taiwan. It is nocturnal and omnivorous, feeding on insects, earthworms, and fruit.','Once considered a subspecies of the Chinese ferret-badger, they were reclassified as a distinct species in 2019 following a genetic study.','Mustelids/formosan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Formosan_ferret-badger'),
(27,'Giant otter','Pteronura brasiliensis','Lutrinae','Pteronura','The giant otter is a South American carnivorous mammal. It is the longest member of the mustelid family.','Known as the \'river wolf\', they are the noisiest otter species and have unique cream-colored throat patches that act like fingerprints for identification.','Mustelids/giant_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Giant_otter'),
(28,'Greater grison','Galictis vittata','Ictonychinae','Galictis','The greater grison is a species of mustelid found in Central and South America. It is a medium-sized animal with a grizzled grey coat and a black underside.','When hunting, they move in a zigzag pattern and frequently pause to raise their heads above tall grass to sniff the air and survey their surroundings.','Mustelids/greater_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_grison'),
(29,'Greater hog badger','Arctonyx collaris','Melinae','Arctonyx','The greater hog badger is a mustelid native to Southeast Asia. It is listed as Vulnerable on the IUCN Red List because the population is thought to be declining due to habitat loss and hunting.','They are among the largest terrestrial mustelids and are capable of digging complex tunnel systems that serve as essential habitat for many other small animals.','Mustelids/greater_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_hog_badger'),
(30,'Haida ermine','Mustela haidarum','Mustelinae','Mustela','The Haida ermine is a species of mustelid endemic to the islands of the Haida Gwaii archipelago in British Columbia and the Alexander Archipelago in Alaska.','They were only recognized as a distinct species in 2021 after being isolated on the Haida Gwaii archipelago for approximately 300,000 years.','Mustelids/haida_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Haida_ermine'),
(31,'Hairy-nosed otter','Lutra sumatrana','Lutrinae','Lutra','The hairy-nosed otter is an otter species native to Southeast Asia. It is one of the rarest and least-known otter species.','They are one of the world\'s rarest otters and are named for their nose pad, which is completely covered in short velvety hair, unlike the naked noses of most other otters.','Mustelids/hairy_nosed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Hairy-nosed_otter'),
(32,'Honey badger','Mellivora capensis','Mellivorinae','Mellivora','The honey badger, also known as the ratel, is a mammal widely distributed in Africa, Southwest Asia, and the Indian subcontinent. Because of its wide range and occurrence in many different habitats, it is listed as Least Concern on the IUCN Red List.','They have incredibly thick, loose skin that allows them to twist and turn inside it to bite back at an attacker even if they are caught in its jaws.','Mustelids/honey_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Honey_badger'),
(33,'Indonesian mountain weasel','Mustela lutreolina','Mustelinae','Mustela','The Indonesian mountain weasel is a species of weasel that lives on the islands of Java and Sumatra in Indonesia.','They are among the rarest weasels in the world, endemic to the high-altitude tropical rainforests of Java and Sumatra, and very few specimens have ever been studied.','Mustelids/indonesian_mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Indonesian_mountain_weasel'),
(34,'Japanese badger','Meles anakuma','Melinae','Meles','The Japanese badger is a species of badger endemic to Japan, where it is found on Honshu, Kyushu, Shikoku, and Shodoshima.','In Japanese folklore, they are known as mujina and are believed to be shapeshifters capable of taking human form.','Mustelids/japanese_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_badger'),
(35,'Japanese marten','Martes melampus','Guloninae','Martes','The Japanese marten is a mammal in the marten genus. It is most closely related to the sable. It is endemic to the islands of Japan.','They play a vital role in their ecosystem as seed dispersers, with over 60% of their droppings containing seeds from the fruits they eat.','Mustelids/japanese_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_marten'),
(36,'Japanese weasel','Mustela itatsi','Mustelinae','Mustela','The Japanese weasel is a carnivorous mammal belonging to the genus Mustela in the family Mustelidae. It is native to Japan.','In Japanese folklore, they are associated with the kamaitachi, a supernatural creature depicted as a weasel with sickle-like claws.','Mustelids/japanese_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_weasel'),
(37,'Javan ferret-badger','Melogale orientalis','Helictidinae','Melogale','The Javan ferret-badger is a small mustelid endemic to the Indonesian islands of Java and Bali. It is a secretive, nocturnal animal found in various forest types.','They have partially webbed toes and specialized ridges on their foot pads that help them scramble through trees and bushes in the forests of Java and Bali.','Mustelids/javan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Javan_ferret-badger'),
(38,'Least weasel','Mustela nivalis','Mustelinae','Mustela','The least weasel is the smallest member of the genus Mustela, the family Mustelidae and the order Carnivora. It is native to Eurasia, North America and North Africa.','They are the smallest carnivorous mammals in the world and must consume up to 60% of their body weight every day to survive.','Mustelids/least_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Least_weasel'),
(39,'Lesser grison','Galictis cuja','Ictonychinae','Galictis','The lesser grison is a species of mustelid found in South America. It is a small, slender animal with a long neck and short legs.','They have a habit of traveling in small family groups that move together in a single-file line through the undergrowth.','Mustelids/lesser_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Lesser_grison'),
(40,'Long-tailed weasel','Neogale frenata','Mustelinae','Neogale','The long-tailed weasel, also known as the bridled weasel or big over-and-under, is a species of mustelid native to North America.','Unlike skunks which spray, long-tailed weasels drag and rub their bodies against surfaces to mark territory with their musky odor.','Mustelids/long_tailed_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Long-tailed_weasel'),
(41,'Malayan weasel','Mustela nudipes','Mustelinae','Mustela','The Malayan weasel is a species of weasel native to the Malay Peninsula and the islands of Sumatra and Borneo.','Their scientific name, Mustela nudipes, translates to \'bare feet\', referring to the fact that their foot pads have no fur at all.','Mustelids/malayan_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Malayan_weasel'),
(42,'Marbled polecat','Vormela peregusna','Ictonychinae','Vormela','The marbled polecat is a small mustelid native to southeast Europe and parts of Asia. It is known for its striking, multi-colored coat.','They have a unique \'marbled\' coat of yellow, white, and brown spots, and when threatened, they fluff up their fur and stand on their hind legs to look larger.','Mustelids/marbled_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Marbled_polecat'),
(43,'Marine otter','Lontra felina','Lutrinae','Lontra','The marine otter is a rare and relatively unknown South American mammal of the weasel family. It is found along the Pacific coast of South America.','Locally known as the \'chungungo\', they are one of the few otter species adapted to live in marine environments along the Pacific coast of South America.','Mustelids/marine_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Marine_otter'),
(44,'Mountain weasel','Mustela altaica','Mustelinae','Mustela','The mountain weasel, also known as the pale weasel, Altai weasel or solongoi, primarily lives in high-altitude environments in Asia.','In parts of China, there have been reports of these elusive weasels acting surprisingly friendly and appearing tame when encountering people in tents.','Mustelids/mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Mountain_weasel'),
(45,'Neotropical otter','Lontra longicaudis','Lutrinae','Lontra','The neotropical otter, also known as the neotropical river otter, is an otter species found in Central America, South America and the island of Trinidad.','They are intelligent tool users and have been observed using rocks to break open the shells of crustaceans and mollusks.','Mustelids/neotropical_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Neotropical_otter'),
(46,'Nilgiri marten','Martes gwatkinsii','Guloninae','Martes','The Nilgiri marten is the only species of marten found in southern India. It is found in the hills of the Nilgiris and parts of the Western Ghats.','They are the only species of marten found in India and are endemic exclusively to the Western Ghats mountain range.','Mustelids/nilgiri_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Nilgiri_marten'),
(47,'North American river otter','Lontra canadensis','Lutrinae','Lontra','The North American river otter, also known as the northern river otter or common otter, is a semiaquatic mammal endemic to the North American continent.','They are famous for their playful behavior, such as sliding down mud or snow banks, which helps them strengthen social bonds and practice hunting skills.','Mustelids/north_american_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/North_American_river_otter'),
(48,'Northern hog badger','Arctonyx albogularis','Melinae','Arctonyx','The northern hog badger is a mustelid species native to South and East Asia. It was formerly considered a subspecies of the greater hog badger.','They have a highly sensitive, pig-like snout that they use to root through soil for earthworms and insects.','Mustelids/northern_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Northern_hog_badger'),
(49,'Pacific marten','Martes caurina','Guloninae','Martes','The Pacific marten is a species of North American mammal in the family Mustelidae. It is found in the western United States and southwestern Canada.','They are capable of descending tree trunks headfirst by rotating their hind limbs, a rare ability among mammals.','Mustelids/pacific_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Pacific_marten'),
(50,'Patagonian weasel','Lyncodon patagonicus','Ictonychinae','Lyncodon','The Patagonian weasel is a small mustelid native to the Pampas of Argentina and Chile. It is the only species in the genus Lyncodon.','They are the only member of their genus, Lyncodon, and were historically kept as \'working pets\' by ranchers to control rodent populations.','Mustelids/patagonian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Patagonian_weasel'),
(51,'Sable','Martes zibellina','Guloninae','Martes','The sable is a species of marten, a small carnivorous mammal inhabiting forest environments, primarily in Russia from the Ural Mountains throughout Siberia, and northern Mongolia.','Their fur is unique because it feels smooth regardless of which direction you stroke it, unlike most animals where the fur has a distinct \'grain\'.','Mustelids/sable/assets/photo.webp','https://en.wikipedia.org/wiki/Sable'),
(52,'Saharan striped polecat','Ictonyx libycus','Ictonychinae','Ictonyx','The Saharan striped polecat, also known as the Saharan striped weasel, is a species of mustelid found in North Africa and parts of the Sahel region.','They have fur on the undersides of their paws, which is an adaptation to help them walk and hunt in sandy desert environments.','Mustelids/saharan_striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Saharan_striped_polecat'),
(53,'Sea otter','Enhydra lutris','Lutrinae','Enhydra','The sea otter is a marine mammal native to the coasts of the northern and eastern North Pacific Ocean.','Sea otters have the densest fur of any animal, with up to one million hairs per square inch; they lack blubber and rely entirely on this fur to stay warm.','Mustelids/sea_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Sea_otter'),
(54,'Siberian weasel','Mustela sibirica','Mustelinae','Mustela','The Siberian weasel, also known as the kolinsky, is a medium-sized species of mustelid native to Asia.','The famous \'Kolinsky sable-hair\' artist brushes are actually made from the winter fur of the male Siberian weasel, not from actual sables.','Mustelids/siberian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Siberian_weasel'),
(55,'Smooth-coated otter','Lutrogale perspicillata','Lutrinae','Lutrogale','The smooth-coated otter is an otter species found in South and Southeast Asia. It is known for its smooth, sleek fur.','They are highly social and hunt in coordinated V-shaped formations to herd schools of fish into shallow water where they are easier to catch.','Mustelids/smooth_coated_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Smooth-coated_otter'),
(56,'Southern river otter','Lontra provocax','Lutrinae','Lontra','The southern river otter is a species of otter that lives in Chile and Argentina. It is also known as the huillín.','In Chile, they are known as the \'Huillín\' and have the smallest geographical range of all otter species, living in both freshwater and marine habitats.','Mustelids/southern_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Southern_river_otter'),
(57,'Spotted-necked otter','Hydrictis maculicollis','Lutrinae','Hydrictis','The spotted-necked otter, or speckle-throated otter, is a species of otter native to sub-Saharan Africa.','Each individual has a unique pattern of creamy-white blotches on its throat and chest, which researchers use to identify them in the wild.','Mustelids/spotted_necked_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Spotted-necked_otter'),
(58,'Steppe polecat','Mustela eversmanii','Mustelinae','Mustela','The steppe polecat, also known as the white or masked polecat, is a species of mustelid native to Central and Eastern Europe and Central Asia.','They perform a \'war dance\' to disorient prey, leaping and jumping around while making soft clucking sounds before they attack.','Mustelids/steppe_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Steppe_polecat'),
(59,'Stoat (Beringian ermine)','Mustela erminea','Mustelinae','Mustela','The stoat, also known as the ermine or Beringian ermine, is a species of mustelid native to Eurasia and the northern regions of North America.','Regardless of whether its coat is brown or winter white, the tip of a stoat\'s tail always remains black, likely to distract predators.','Mustelids/stoat_beringian_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Stoat'),
(60,'Striped polecat','Ictonyx striatus','Ictonychinae','Ictonyx','The striped polecat, also known as the zorilla, is a member of the family Mustelidae that resembles a skunk. It is found in sub-Saharan Africa.','Often called the zorilla, their defensive spray is so powerful it can cause temporary blindness in potential predators.','Mustelids/striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Striped_polecat'),
(61,'Sumatran hog badger','Arctonyx hoevenii','Melinae','Arctonyx','The Sumatran hog badger is a species of mustelid endemic to the island of Sumatra in Indonesia. It is the smallest of the three species in the genus Arctonyx.','They are the smallest species in their genus and are exclusively found on the island of Sumatra, often at high altitudes.','Mustelids/sumatran_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Sumatran_hog_badger'),
(62,'Tayra','Eira barbara','Guloninae','Eira','The tayra is an omnivorous animal from the weasel family, native to the Americas. It is the only species in the genus Eira and is found from southern Mexico to northern Argentina and on the island of Trinidad.','They have been observed picking unripe plantains and hiding them to ripen, which may be evidence of future planning behavior.','Mustelids/tayra/assets/photo.webp','https://en.wikipedia.org/wiki/Tayra'),
(63,'Vietnam ferret-badger','Melogale cucphuongensis','Helictidinae','Melogale','The Vietnam ferret-badger is a species of mustelid endemic to Vietnam. It was only described as a distinct species in 2011.','This extremely rare species was only discovered by scientists in 2011 and is one of the least-studied mammals in the world.','Mustelids/vietnam_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Vietnam_ferret-badger'),
(64,'Wolverine','Gulo gulo','Guloninae','Gulo','The wolverine, also referred to as the glutton, carcajou, or quickhatch, is the largest terrestrial member of the family Mustelidae. It is a muscular carnivore and a solitary animal.','Their paws act like natural snowshoes by spreading to twice their size when they hit the ground, allowing them to travel easily over deep snow.','Mustelids/wolverine/assets/photo.webp','https://en.wikipedia.org/wiki/Wolverine'),
(65,'Yellow-bellied weasel','Mustela kathiah','Mustelinae','Mustela','The yellow-bellied weasel is a species of mustelid found in the forests of central and eastern Asia. It is known for its distinctive yellow underbelly.','Historically in Nepal, they were kept by humans to control rodent populations and were even trained to attack larger animals for sport.','Mustelids/yellow_bellied_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-bellied_weasel'),
(66,'Yellow-throated marten','Martes flavigula','Guloninae','Martes','The yellow-throated marten, also known as the kharza, is a marten species native to Asia. It is listed as Least Concern on the IUCN Red List due to its wide distribution.','They are the largest marten species in the Old World and are sometimes seen hunting in small family groups to take down larger prey like musk deer.','Mustelids/yellow_throated_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-throated_marten');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mustelid_id` int(11) NOT NULL,
  `stat_name` varchar(100) NOT NULL,
  `stat_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mustelid_id` (`mustelid_id`),
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2905 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Stats` VALUES
(2773,1,'weight','12–21 kg'),
(2774,1,'lifespan','10–12 years'),
(2775,2,'weight','0.23–0.38 kg'),
(2776,2,'lifespan','5–6 years'),
(2777,3,'weight','0.5 kg (estimated)'),
(2778,3,'lifespan','3–5 years'),
(2779,4,'weight','4–12 kg'),
(2780,4,'lifespan','4–10 years'),
(2781,5,'weight','0.025–0.18 kg'),
(2782,5,'lifespan','1–2 years'),
(2783,6,'weight','0.5–1.6 kg'),
(2784,6,'lifespan','12–17 years'),
(2785,7,'weight','0.7–2.0 kg'),
(2786,7,'lifespan','3–5 years'),
(2787,8,'weight','3.5–9 kg'),
(2788,8,'lifespan','5–10 years'),
(2789,9,'weight','1–5.5 kg'),
(2790,9,'lifespan','10–16 years'),
(2791,10,'weight','0.7–2.0 kg'),
(2792,10,'lifespan','4–7 years'),
(2793,11,'weight','1.1–2.5 kg'),
(2794,11,'lifespan','3–10 years'),
(2795,12,'weight','0.6–1.4 kg'),
(2796,12,'lifespan','1–4 years'),
(2797,13,'weight','1–3 kg'),
(2798,13,'lifespan','< 5 years'),
(2799,14,'weight','1–3 kg'),
(2800,14,'lifespan','< 10 years'),
(2801,15,'weight','7–17 kg'),
(2802,15,'lifespan','15 years'),
(2803,16,'weight','1–3 kg'),
(2804,16,'lifespan','< 10 years'),
(2805,17,'weight','0.12–0.15 kg'),
(2806,17,'lifespan','1–6 years'),
(2807,18,'weight','10–25 kg'),
(2808,18,'lifespan','10–15 years'),
(2809,19,'weight','0.5–2.0 kg'),
(2810,19,'lifespan','5–8 years'),
(2811,20,'weight','7–12 kg'),
(2812,20,'lifespan','3–4 years'),
(2813,21,'weight','7–17 kg'),
(2814,21,'lifespan','3–8 years'),
(2815,22,'weight','0.5–0.9 kg'),
(2816,22,'lifespan','6–10 years'),
(2817,23,'weight','0.9–2.2 kg'),
(2818,23,'lifespan','3–4 years'),
(2819,24,'weight','0.4–1.7 kg'),
(2820,24,'lifespan','5–6 years'),
(2821,25,'weight','2–6 kg'),
(2822,25,'lifespan','7–10 years'),
(2823,26,'weight','< 2 kg'),
(2824,26,'lifespan','< 10 years'),
(2825,27,'weight','22–34 kg'),
(2826,27,'lifespan','8–13 years'),
(2827,28,'weight','1.5–3.8 kg'),
(2828,28,'lifespan','10–12 years'),
(2829,29,'weight','7–14 kg'),
(2830,29,'lifespan','8–12 years'),
(2831,30,'weight','0.1–0.15 kg'),
(2832,30,'lifespan','< 2 years'),
(2833,31,'weight','5–8 kg'),
(2834,31,'lifespan','10–12 years'),
(2835,32,'weight','5–16 kg'),
(2836,32,'lifespan','7–8 years'),
(2837,33,'weight','0.29–0.34 kg'),
(2838,33,'lifespan','7–10 years'),
(2839,34,'weight','3.8–11 kg'),
(2840,34,'lifespan','10 years'),
(2841,35,'weight','1–1.5 kg'),
(2842,35,'lifespan','8–12 years'),
(2843,36,'weight','0.1–0.82 kg'),
(2844,36,'lifespan','2–3 years'),
(2845,37,'weight','1–2 kg'),
(2846,37,'lifespan','5–8 years'),
(2847,38,'weight','0.025–0.1 kg'),
(2848,38,'lifespan','< 1 year'),
(2849,39,'weight','1–2.5 kg'),
(2850,39,'lifespan','10+ years (captivity)'),
(2851,40,'weight','0.07–0.45 kg'),
(2852,40,'lifespan','3–7 years'),
(2853,41,'weight','1–2 kg'),
(2854,41,'lifespan','3–10 years'),
(2855,42,'weight','0.3–0.7 kg'),
(2856,42,'lifespan','8–12 years'),
(2857,43,'weight','3–6 kg'),
(2858,43,'lifespan','10–15 years'),
(2859,44,'weight','0.12–0.35 kg'),
(2860,44,'lifespan','7–10 years'),
(2861,45,'weight','5–15 kg'),
(2862,45,'lifespan','10–15 years'),
(2863,46,'weight','2.1 kg'),
(2864,46,'lifespan','12–15 years'),
(2865,47,'weight','5–14 kg'),
(2866,47,'lifespan','8–13 years'),
(2867,48,'weight','7–14 kg'),
(2868,48,'lifespan','14 years (captivity)'),
(2869,49,'weight','0.75–1.8 kg'),
(2870,49,'lifespan','4–6 years'),
(2871,50,'weight','0.225 kg'),
(2872,50,'lifespan','1–3 years'),
(2873,51,'weight','0.7–1.8 kg'),
(2874,51,'lifespan','Up to 18 years'),
(2875,52,'weight','0.24–0.8 kg'),
(2876,52,'lifespan','5–6 years'),
(2877,53,'weight','14–45 kg'),
(2878,53,'lifespan','10–15 years'),
(2879,54,'weight','0.36–0.82 kg'),
(2880,54,'lifespan','2.1 years'),
(2881,55,'weight','7–11 kg'),
(2882,55,'lifespan','4–10 years'),
(2883,56,'weight','5–10 kg'),
(2884,56,'lifespan','3–5 years'),
(2885,57,'weight','3–6 kg'),
(2886,57,'lifespan','8 years'),
(2887,58,'weight','0.7–2.05 kg'),
(2888,58,'lifespan','Up to 5 years'),
(2889,59,'weight','0.1–0.45 kg'),
(2890,59,'lifespan','1–5 years'),
(2891,60,'weight','0.5–1.8 kg'),
(2892,60,'lifespan','5–8 years'),
(2893,61,'weight','7–14 kg'),
(2894,61,'lifespan','14–15 years (captivity)'),
(2895,62,'weight','2.7–8 kg'),
(2896,62,'lifespan','Unknown (Wild)'),
(2897,63,'weight','0.8 kg'),
(2898,63,'lifespan','5–8 years'),
(2899,64,'weight','8–18 kg'),
(2900,64,'lifespan','5–10 years'),
(2901,65,'weight','1.5 kg'),
(2902,65,'lifespan','3–4 years'),
(2903,66,'weight','1.2–5.7 kg'),
(2904,66,'lifespan','7–10 years');
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
INSERT INTO `Traits` VALUES
(1,'biome'),
(2,'noodle'),
(3,'sillay'),
(4,'size'),
(5,'snoot');
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

-- Dump completed on 2026-05-01  9:59:09
