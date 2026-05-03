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
(1,'Alpine Scree'),
(2,'Arctic Tundra'),
(3,'Arid Savanna'),
(4,'Arid Steppes'),
(5,'Bamboo Groves'),
(6,'Boreal Forest'),
(7,'Broad-leaved'),
(8,'Cloud Forests'),
(9,'Coastal Marine'),
(10,'Coniferous'),
(11,'Deciduous Woodlands'),
(12,'Deciduous Woods'),
(13,'Domesticated'),
(14,'Dry Scrub'),
(15,'Farmland'),
(16,'Forest Streams'),
(17,'Forests'),
(18,'Freshwater Rivers'),
(19,'Grassland'),
(20,'Grasslands'),
(21,'Hedgerows'),
(22,'Hilly Mixed Forests'),
(23,'Humid Lowland Rainforests'),
(24,'Lowland'),
(25,'Mangrove Swamps'),
(26,'Mixed Forests'),
(27,'Moist Shola Rainforests'),
(28,'Montane'),
(29,'Montane Meadows'),
(30,'Montane Riparian Cloud Forests'),
(31,'Nearshore Kelp Forests'),
(32,'Old-growth Deciduous Forests'),
(33,'Open Fields'),
(34,'Pampas'),
(35,'Pastures'),
(36,'Rice Paddies'),
(37,'River Valleys'),
(38,'Riverbanks'),
(39,'Rocky Mountains'),
(40,'Semi-deserts'),
(41,'Shortgrass Prairie'),
(42,'Shrubby Woodlands'),
(43,'Slow-moving Amazonian Rivers'),
(44,'Southeast Asian Swamp Forests'),
(45,'Steppe'),
(46,'Steppes'),
(47,'Subtropical'),
(48,'Subtropical Forests'),
(49,'Taiga'),
(50,'Temperate Forests'),
(51,'Tropical'),
(52,'Tropical Forests'),
(53,'Tundra Edges'),
(54,'Wetlands'),
(55,'Woodlands');
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
(57,1),
(66,1),
(30,2),
(20,3),
(37,4),
(5,5),
(30,6),
(15,7),
(13,8),
(48,9),
(6,10),
(34,10),
(43,10),
(45,10),
(36,11),
(18,12),
(63,13),
(2,14),
(40,14),
(42,14),
(54,14),
(2,15),
(40,15),
(42,15),
(54,15),
(9,16),
(25,17),
(4,18),
(28,18),
(32,18),
(35,18),
(44,18),
(46,18),
(49,18),
(58,18),
(14,19),
(16,19),
(17,19),
(19,19),
(22,19),
(27,19),
(29,19),
(31,19),
(57,19),
(64,19),
(66,19),
(9,20),
(20,20),
(56,20),
(14,21),
(16,21),
(17,21),
(19,21),
(22,21),
(27,21),
(29,21),
(31,21),
(64,21),
(52,22),
(1,23),
(52,24),
(61,25),
(5,26),
(6,26),
(15,26),
(21,26),
(34,26),
(43,26),
(45,26),
(33,27),
(13,28),
(8,29),
(24,30),
(23,31),
(7,32),
(60,33),
(11,34),
(36,35),
(61,36),
(39,37),
(10,38),
(47,38),
(18,39),
(37,40),
(55,41),
(11,42),
(12,43),
(65,44),
(38,45),
(51,45),
(59,45),
(8,46),
(25,46),
(21,47),
(3,48),
(26,48),
(41,48),
(50,48),
(53,48),
(62,48),
(39,49),
(56,50),
(3,51),
(26,51),
(41,51),
(50,51),
(53,51),
(62,51),
(38,52),
(51,52),
(59,52),
(25,53),
(4,54),
(10,54),
(28,54),
(32,54),
(35,54),
(39,54),
(44,54),
(46,54),
(47,54),
(49,54),
(58,54),
(60,55);
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
(1,1,4.02),
(1,2,4.32),
(1,3,3.34),
(1,4,2.35),
(1,5,2.78),
(2,1,1.06),
(2,2,2.17),
(2,3,3.46),
(2,4,2.89),
(2,5,2.48),
(3,1,3.65),
(3,2,1.98),
(3,3,1.12),
(3,4,2.66),
(3,5,5),
(4,1,4.32),
(4,2,3.58),
(4,3,2.78),
(4,4,4.23),
(4,5,3.4),
(5,1,1.86),
(5,2,1.49),
(5,3,4.38),
(5,4,4.1),
(5,5,3.83),
(6,1,2.48),
(6,2,2.42),
(6,3,2.05),
(6,4,3.7),
(6,5,3.95),
(7,1,3.28),
(7,2,2.6),
(7,3,4.82),
(7,4,3.09),
(7,5,3.58),
(8,1,2.17),
(8,2,1.43),
(8,3,1.37),
(8,4,4.42),
(8,5,1.8),
(9,1,2.85),
(9,2,4.82),
(9,3,4.02),
(9,4,2.3),
(9,5,3.46),
(10,1,4.75),
(10,2,4.2),
(10,3,5),
(10,4,3),
(10,5,1.86),
(11,1,3.52),
(11,2,3.95),
(11,3,2.42),
(11,4,1.83),
(11,5,3.71),
(12,1,4.63),
(12,2,1.06),
(12,3,1.31),
(12,4,4.97),
(12,5,1.98),
(13,1,2.6),
(13,2,2.11),
(13,3,1.25),
(13,4,4.33),
(13,5,4.82),
(14,1,1.74),
(14,2,4.45),
(14,3,4.63),
(14,4,3.06),
(14,5,3.09),
(15,1,2.35),
(15,2,3.28),
(15,3,4.69),
(15,4,2.95),
(15,5,2.66),
(16,1,1.49),
(16,2,4.63),
(16,3,4.94),
(16,4,1.96),
(16,5,1.55),
(17,1,3.77),
(17,2,4.38),
(17,3,4.51),
(17,4,3),
(17,5,4.14),
(18,1,2.91),
(18,2,3.89),
(18,3,3.83),
(18,4,3.18),
(18,5,3.28),
(19,1,3.03),
(19,2,4.75),
(19,3,4.75),
(19,4,1.45),
(19,5,2.17),
(20,1,1.62),
(20,2,3.34),
(20,3,1.06),
(20,4,4.33),
(20,5,4.63),
(21,1,1.92),
(21,2,4.02),
(21,3,4.57),
(21,4,3.61),
(21,5,2.29),
(22,1,2.54),
(22,2,4.88),
(22,3,3.89),
(22,4,1.93),
(22,5,1.68),
(23,1,4.82),
(23,2,1.12),
(23,3,3.58),
(23,4,5),
(23,5,1.06),
(24,1,1.8),
(24,2,4.08),
(24,3,4.14),
(24,4,1.5),
(24,5,3.15),
(25,1,1.98),
(25,2,2.29),
(25,3,2.29),
(25,4,3.99),
(25,5,3.34),
(26,1,3.4),
(26,2,1.74),
(26,3,1.49),
(26,4,3.25),
(26,5,4.51),
(27,1,2.72),
(27,2,4.69),
(27,3,3.95),
(27,4,1.32),
(27,5,1.92),
(28,1,4.69),
(28,2,1.31),
(28,3,3.65),
(28,4,4.3),
(28,5,1.49),
(29,1,1.68),
(29,2,4.51),
(29,3,3.77),
(29,4,1),
(29,5,1.31),
(30,1,4.2),
(30,2,1),
(30,3,1),
(30,4,4.47),
(30,5,3.77),
(31,1,1.31),
(31,2,4.94),
(31,3,3.4),
(31,4,3.06),
(31,5,4.02),
(32,1,4.26),
(32,2,1.55),
(32,3,1.43),
(32,4,4.66),
(32,5,3.65),
(33,1,3.71),
(33,2,2.66),
(33,3,1.98),
(33,4,3.28),
(33,5,2.35),
(34,1,1.12),
(34,2,2.85),
(34,3,4.2),
(34,4,2.96),
(34,5,2.11),
(35,1,4.94),
(35,2,1.37),
(35,3,4.88),
(35,4,3.78),
(35,5,1.25),
(36,1,3.58),
(36,2,3.52),
(36,3,2.6),
(36,4,4.42),
(36,5,4.08),
(37,1,1),
(37,2,3.77),
(37,3,2.85),
(37,4,2.35),
(37,5,2.91),
(38,1,2.78),
(38,2,1.62),
(38,3,3.03),
(38,4,3.43),
(38,5,4.32),
(39,1,3.89),
(39,2,3.83),
(39,3,4.26),
(39,4,2.46),
(39,5,2.23),
(40,1,1.43),
(40,2,2.97),
(40,3,4.08),
(40,4,3.01),
(40,5,4.2),
(41,1,3.34),
(41,2,3.09),
(41,3,3.52),
(41,4,3.25),
(41,5,4.45),
(42,1,1.55),
(42,2,2.54),
(42,3,2.97),
(42,4,2.38),
(42,5,4.26),
(43,1,2.66),
(43,2,4.26),
(43,3,2.48),
(43,4,2.83),
(43,5,1.18),
(44,1,4.45),
(44,2,1.68),
(44,3,2.72),
(44,4,4.62),
(44,5,1.74),
(45,1,2.29),
(45,2,1.18),
(45,3,4.32),
(45,4,2.95),
(45,5,2.54),
(46,1,4.88),
(46,2,2.91),
(46,3,3.71),
(46,4,4.11),
(46,5,1.12),
(47,1,4.38),
(47,2,3.46),
(47,3,2.91),
(47,4,2.57),
(47,5,3.89),
(48,1,5),
(48,2,3.4),
(48,3,1.8),
(48,4,3.78),
(48,5,1.37),
(49,1,4.51),
(49,2,1.25),
(49,3,2.23),
(49,4,4.26),
(49,5,1.43),
(50,1,3.22),
(50,2,2.35),
(50,3,2.66),
(50,4,3.06),
(50,5,2.72),
(51,1,3.83),
(51,2,2.05),
(51,3,1.62),
(51,4,3.89),
(51,5,2.97),
(52,1,3.15),
(52,2,3.03),
(52,3,1.18),
(52,4,4.33),
(52,5,4.94),
(53,1,3.46),
(53,2,3.65),
(53,3,1.68),
(53,4,3.25),
(53,5,4.38),
(54,1,2.11),
(54,2,2.72),
(54,3,3.28),
(54,4,2.83),
(54,5,2.42),
(55,1,1.25),
(55,2,3.22),
(55,3,2.35),
(55,4,2.8),
(55,5,3.22),
(56,1,2.05),
(56,2,1.8),
(56,3,1.92),
(56,4,4.33),
(56,5,4.88),
(57,1,2.97),
(57,2,5),
(57,3,3.15),
(57,4,2.05),
(57,5,4.57),
(58,1,4.57),
(58,2,2.23),
(58,3,2.17),
(58,4,4.26),
(58,5,2.05),
(59,1,4.14),
(59,2,2.78),
(59,3,1.86),
(59,4,3.16),
(59,5,3.03),
(60,1,2.23),
(60,2,1.86),
(60,3,2.11),
(60,4,4.15),
(60,5,4.69),
(61,1,3.95),
(61,2,1.92),
(61,3,3.09),
(61,4,3.57),
(61,5,1.62),
(62,1,3.09),
(62,2,3.71),
(62,3,1.55),
(62,4,3.25),
(62,5,4.75),
(63,1,1.37),
(63,2,2.48),
(63,3,3.22),
(63,4,2.95),
(63,5,2.85),
(64,1,2.42),
(64,2,4.14),
(64,3,1.74),
(64,4,2.03),
(64,5,3.52),
(65,1,4.08),
(65,2,3.15),
(65,3,2.54),
(65,4,4.02),
(65,5,1),
(66,1,1.18),
(66,2,4.57),
(66,3,4.45),
(66,4,1.86),
(66,5,2.6);
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
(1,'Amazon weasel','Neogale africana','Mustelinae','Neogale','The Amazon weasel is a species of mustelid native to the Amazon basin in South America. Despite its name, it is not found in Africa.','They are the only mustelids with a ventral stripe, a dark line that runs down the middle of their pale-colored chest and belly.','/Mustelids/amazon_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Amazon_weasel'),
(2,'Striped polecat','Ictonyx striatus','Ictonychinae','Ictonyx','The striped polecat, also known as the zorilla, is a member of the family Mustelidae that resembles a skunk. It is found in sub-Saharan Africa.','Often called the zorilla, their defensive spray is so powerful it can cause temporary blindness in potential predators.','/Mustelids/striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Striped_polecat'),
(3,'Vietnam ferret-badger','Melogale cucphuongensis','Helictidinae','Melogale','The Vietnam ferret-badger is a species of mustelid endemic to Vietnam. It was only described as a distinct species in 2011.','This extremely rare species was only discovered by scientists in 2011 and is one of the least-studied mammals in the world.','/Mustelids/vietnam_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Vietnam_ferret-badger'),
(4,'Smooth-coated otter','Lutrogale perspicillata','Lutrinae','Lutrogale','The smooth-coated otter is an otter species found in South and Southeast Asia. It is known for its smooth, sleek fur.','They are highly social and hunt in coordinated V-shaped formations to herd schools of fish into shallow water where they are easier to catch.','/Mustelids/smooth_coated_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Smooth-coated_otter'),
(5,'Japanese badger','Meles anakuma','Melinae','Meles','The Japanese badger is a species of badger endemic to Japan, where it is found on Honshu, Kyushu, Shikoku, and Shodoshima.','In Japanese folklore, they are known as mujina and are believed to be shapeshifters capable of taking human form.','/Mustelids/japanese_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_badger'),
(6,'Fisher','Pekania pennanti','Guloninae','Pekania','The fisher is a small carnivorous mammal native to North America. It is a member of the mustelid family and is the only living species in the genus Pekania.','They are one of the few animals capable of successfully preying on porcupines by using their agility to attack the face or flip them over.','/Mustelids/fisher/assets/photo.webp','https://en.wikipedia.org/wiki/Fisher_(animal)'),
(7,'European pine marten','Martes martes','Guloninae','Martes','The European pine marten, also known as the pine marten or the sweet marten, is an animal native to Northern Europe.','They are the only mustelids with semi-retractable claws, which combined with 180-degree rotating ankles, makes them expert climbers.','/Mustelids/european_pine_marten/assets/photo.webp','https://en.wikipedia.org/wiki/European_pine_marten'),
(8,'Caucasian badger','Meles canescens','Melinae','Meles','The Caucasian badger, also known as the Southwest Asian badger, is a species of badger native to Western Asia and some islands in the Mediterranean Sea.','They were only officially recognized as a distinct species from the European badger in 2013 following genetic studies.','/Mustelids/caucasian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Caucasian_badger'),
(9,'Japanese weasel','Mustela itatsi','Mustelinae','Mustela','The Japanese weasel is a carnivorous mammal belonging to the genus Mustela in the family Mustelidae. It is native to Japan.','In Japanese folklore, they are associated with the kamaitachi, a supernatural creature depicted as a weasel with sickle-like claws.','/Mustelids/japanese_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_weasel'),
(10,'American mink','Neogale vison','Mustelinae','Neogale','The American mink is a semiaquatic species of mustelid native to North America. It has been introduced to many other parts of the world.','When they are happy or content, minks have been known to make a soft purring sound similar to a domestic cat.','/Mustelids/american_mink/assets/photo.webp','https://en.wikipedia.org/wiki/American_mink'),
(11,'Patagonian weasel','Lyncodon patagonicus','Ictonychinae','Lyncodon','The Patagonian weasel is a small mustelid native to the Pampas of Argentina and Chile. It is the only species in the genus Lyncodon.','They are the only member of their genus, Lyncodon, and were historically kept as \'working pets\' by ranchers to control rodent populations.','/Mustelids/patagonian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Patagonian_weasel'),
(12,'Giant otter','Pteronura brasiliensis','Lutrinae','Pteronura','The giant otter is a South American carnivorous mammal. It is the longest member of the mustelid family.','Known as the \'river wolf\', they are the noisiest otter species and have unique cream-colored throat patches that act like fingerprints for identification.','/Mustelids/giant_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Giant_otter'),
(13,'Sumatran hog badger','Arctonyx hoevenii','Melinae','Arctonyx','The Sumatran hog badger is a species of mustelid endemic to the island of Sumatra in Indonesia. It is the smallest of the three species in the genus Arctonyx.','They are the smallest species in their genus and are exclusively found on the island of Sumatra, often at high altitudes.','/Mustelids/sumatran_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Sumatran_hog_badger'),
(14,'Malayan weasel','Mustela nudipes','Mustelinae','Mustela','The Malayan weasel is a species of weasel native to the Malay Peninsula and the islands of Sumatra and Borneo.','Their scientific name, Mustela nudipes, translates to \'bare feet\', referring to the fact that their foot pads have no fur at all.','/Mustelids/malayan_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Malayan_weasel'),
(15,'Japanese marten','Martes melampus','Guloninae','Martes','The Japanese marten is a mammal in the marten genus. It is most closely related to the sable. It is endemic to the islands of Japan.','They play a vital role in their ecosystem as seed dispersers, with over 60% of their droppings containing seeds from the fruits they eat.','/Mustelids/japanese_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_marten'),
(16,'Stoat (Beringian ermine)','Mustela erminea','Mustelinae','Mustela','The stoat, also known as the ermine or Beringian ermine, is a species of mustelid native to Eurasia and the northern regions of North America.','Regardless of whether its coat is brown or winter white, the tip of a stoat\'s tail always remains black, likely to distract predators.','/Mustelids/stoat_beringian_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Stoat'),
(17,'Back-striped weasel','Mustela strigidorsa','Mustelinae','Mustela','The back-striped weasel, also known as the stripe-backed weasel, is a species of mustelid found in Southeast Asia.','They are characterized by a narrow, silvery stripe running down the entire length of their back, which is mirrored by a yellowish streak on their belly.','/Mustelids/back_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Back-striped_weasel'),
(18,'Beech marten','Martes foina','Guloninae','Martes','The beech marten, also known as the stone marten, house marten or white-breasted marten, is a species of marten native to much of Europe and Central Asia.','They have a notorious reputation for entering parked vehicle engine bays and chewing on cables and hoses, a behavior often called \'marten damage\'.','/Mustelids/beech_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Beech_marten'),
(19,'Haida ermine','Mustela haidarum','Mustelinae','Mustela','The Haida ermine is a species of mustelid endemic to the islands of the Haida Gwaii archipelago in British Columbia and the Alexander Archipelago in Alaska.','They were only recognized as a distinct species in 2021 after being isolated on the Haida Gwaii archipelago for approximately 300,000 years.','/Mustelids/haida_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Haida_ermine'),
(20,'Honey badger','Mellivora capensis','Mellivorinae','Mellivora','The honey badger, also known as the ratel, is a mammal widely distributed in Africa, Southwest Asia, and the Indian subcontinent. Because of its wide range and occurrence in many different habitats, it is listed as Least Concern on the IUCN Red List.','They have incredibly thick, loose skin that allows them to twist and turn inside it to bite back at an attacker even if they are caught in its jaws.','/Mustelids/honey_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Honey_badger'),
(21,'Yellow-throated marten','Martes flavigula','Guloninae','Martes','The yellow-throated marten, also known as the kharza, is a marten species native to Asia. It is listed as Least Concern on the IUCN Red List due to its wide distribution.','They are the largest marten species in the Old World and are sometimes seen hunting in small family groups to take down larger prey like musk deer.','/Mustelids/yellow_throated_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-throated_marten'),
(22,'Long-tailed weasel','Neogale frenata','Mustelinae','Neogale','The long-tailed weasel, also known as the bridled weasel or big over-and-under, is a species of mustelid native to North America.','Unlike skunks which spray, long-tailed weasels drag and rub their bodies against surfaces to mark territory with their musky odor.','/Mustelids/long_tailed_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Long-tailed_weasel'),
(23,'Sea otter','Enhydra lutris','Lutrinae','Enhydra','The sea otter is a marine mammal native to the coasts of the northern and eastern North Pacific Ocean.','Sea otters have the densest fur of any animal, with up to one million hairs per square inch; they lack blubber and rely entirely on this fur to stay warm.','/Mustelids/sea_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Sea_otter'),
(24,'Colombian weasel','Neogale felipei','Mustelinae','Neogale','The Colombian weasel, also known as Don Felipe\'s weasel, is a very rare species of mustelid found in Colombia and Ecuador.','They are considered the rarest carnivore in South America and have noticeable webbing between their toes, suggesting a semi-aquatic lifestyle.','/Mustelids/colombian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Colombian_weasel'),
(25,'Asian badger','Meles leucurus','Melinae','Meles','The Asian badger, also known as the sand badger, is a species of badger native to Asia. It is widely distributed from the Volga River in the west to the Korean Peninsula in the east.','Unlike many other badgers, they often hibernate in family groups, with adults sharing their dens with the previous year\'s cubs.','/Mustelids/asian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_badger'),
(26,'Bornean ferret-badger','Melogale everetti','Helictidinae','Melogale','The Bornean ferret-badger, also known as Everett\'s ferret-badger or the Kinabalu ferret-badger, is a small mustelid endemic to the island of Borneo. It is listed as Endangered on the IUCN Red List due to its restricted range and habitat loss.','They cleverly repurpose abandoned burrows created by other animals rather than digging their own, despite having strong claws.','/Mustelids/bornean_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Bornean_ferret-badger'),
(27,'American ermine','Mustela richardsonii','Mustelinae','Mustela','The American ermine is a species of mustelid native to North America. It was formerly considered a subspecies of the stoat.','They exhibit a reproductive strategy called embryonic diapause, where the embryo remains dormant for months so the young are born in spring.','/Mustelids/american_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/American_ermine'),
(28,'Neotropical otter','Lontra longicaudis','Lutrinae','Lontra','The neotropical otter, also known as the neotropical river otter, is an otter species found in Central America, South America and the island of Trinidad.','They are intelligent tool users and have been observed using rocks to break open the shells of crustaceans and mollusks.','/Mustelids/neotropical_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Neotropical_otter'),
(29,'Least weasel','Mustela nivalis','Mustelinae','Mustela','The least weasel is the smallest member of the genus Mustela, the family Mustelidae and the order Carnivora. It is native to Eurasia, North America and North Africa.','They are the smallest carnivorous mammals in the world and must consume up to 60% of their body weight every day to survive.','/Mustelids/least_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Least_weasel'),
(30,'Wolverine','Gulo gulo','Guloninae','Gulo','The wolverine, also referred to as the glutton, carcajou, or quickhatch, is the largest terrestrial member of the family Mustelidae. It is a muscular carnivore and a solitary animal.','Their paws act like natural snowshoes by spreading to twice their size when they hit the ground, allowing them to travel easily over deep snow.','/Mustelids/wolverine/assets/photo.webp','https://en.wikipedia.org/wiki/Wolverine'),
(31,'Yellow-bellied weasel','Mustela kathiah','Mustelinae','Mustela','The yellow-bellied weasel is a species of mustelid found in the forests of central and eastern Asia. It is known for its distinctive yellow underbelly.','Historically in Nepal, they were kept by humans to control rodent populations and were even trained to attack larger animals for sport.','/Mustelids/yellow_bellied_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-bellied_weasel'),
(32,'Congo clawless otter','Aonyx congicus','Lutrinae','Aonyx','The Congo clawless otter is a species of otter in the family Mustelidae. It is found in Cameroon, Congo, Democratic Republic of the Congo, Equatorial Guinea, and Gabon.','They are considered the most terrestrial of all otter species and spend a significant amount of time exploring shores and land compared to their relatives.','/Mustelids/congo_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Congo_clawless_otter'),
(33,'Nilgiri marten','Martes gwatkinsii','Guloninae','Martes','The Nilgiri marten is the only species of marten found in southern India. It is found in the hills of the Nilgiris and parts of the Western Ghats.','They are the only species of marten found in India and are endemic exclusively to the Western Ghats mountain range.','/Mustelids/nilgiri_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Nilgiri_marten'),
(34,'Pacific marten','Martes caurina','Guloninae','Martes','The Pacific marten is a species of North American mammal in the family Mustelidae. It is found in the western United States and southwestern Canada.','They are capable of descending tree trunks headfirst by rotating their hind limbs, a rare ability among mammals.','/Mustelids/pacific_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Pacific_marten'),
(35,'Spotted-necked otter','Hydrictis maculicollis','Lutrinae','Hydrictis','The spotted-necked otter, or speckle-throated otter, is a species of otter native to sub-Saharan Africa.','Each individual has a unique pattern of creamy-white blotches on its throat and chest, which researchers use to identify them in the wild.','/Mustelids/spotted_necked_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Spotted-necked_otter'),
(36,'European badger','Meles meles','Melinae','Meles','The European badger is a badger species native to almost all of Europe. It is a powerful animal with a small head, a stocky body, small black eyes and a short tail.','They live in communal burrow systems called setts that can be hundreds of years old and are passed down through many generations of the same clan.','/Mustelids/european_badger/assets/photo.webp','https://en.wikipedia.org/wiki/European_badger'),
(37,'Marbled polecat','Vormela peregusna','Ictonychinae','Vormela','The marbled polecat is a small mustelid native to southeast Europe and parts of Asia. It is known for its striking, multi-colored coat.','They have a unique \'marbled\' coat of yellow, white, and brown spots, and when threatened, they fluff up their fur and stand on their hind legs to look larger.','/Mustelids/marbled_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Marbled_polecat'),
(38,'Greater grison','Galictis vittata','Ictonychinae','Galictis','The greater grison is a species of mustelid found in Central and South America. It is a medium-sized animal with a grizzled grey coat and a black underside.','When hunting, they move in a zigzag pattern and frequently pause to raise their heads above tall grass to sniff the air and survey their surroundings.','/Mustelids/greater_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_grison'),
(39,'Siberian weasel','Mustela sibirica','Mustelinae','Mustela','The Siberian weasel, also known as the kolinsky, is a medium-sized species of mustelid native to Asia.','The famous \'Kolinsky sable-hair\' artist brushes are actually made from the winter fur of the male Siberian weasel, not from actual sables.','/Mustelids/siberian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Siberian_weasel'),
(40,'Steppe polecat','Mustela eversmanii','Mustelinae','Mustela','The steppe polecat, also known as the white or masked polecat, is a species of mustelid native to Central and Eastern Europe and Central Asia.','They perform a \'war dance\' to disorient prey, leaping and jumping around while making soft clucking sounds before they attack.','/Mustelids/steppe_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Steppe_polecat'),
(41,'Chinese ferret-badger','Melogale moschata','Helictidinae','Melogale','The Chinese ferret-badger, also known as the small-toothed ferret-badger, is a small mustelid widely distributed in Southeast Asia and southern China. It is known for its distinctive facial mask and agile climbing abilities.','They are agile climbers that often sleep in tree branches and are encouraged by farmers to stay near agricultural areas to control pests.','/Mustelids/chinese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Chinese_ferret-badger'),
(42,'Saharan striped polecat','Ictonyx libycus','Ictonychinae','Ictonyx','The Saharan striped polecat, also known as the Saharan striped weasel, is a species of mustelid found in North Africa and parts of the Sahel region.','They have fur on the undersides of their paws, which is an adaptation to help them walk and hunt in sandy desert environments.','/Mustelids/saharan_striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Saharan_striped_polecat'),
(43,'American marten','Martes americana','Guloninae','Martes','The American marten is a North American mammal, a member of the family Mustelidae. It is also sometimes referred to as the American pine marten.','A group of martens is collectively known as a richness.','/Mustelids/american_marten/assets/photo.webp','https://en.wikipedia.org/wiki/American_marten'),
(44,'African clawless otter','Aonyx capensis','Lutrinae','Aonyx','The African clawless otter, also known as the Cape clawless otter, is the second-largest freshwater species of otter. It is found in much of sub-Saharan Africa.','They are the second-largest freshwater otter and have incredibly dexterous front paws that are almost entirely clawless and unwebbed, allowing them to feel for prey in the mud.','/Mustelids/african_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/African_clawless_otter'),
(45,'Sable','Martes zibellina','Guloninae','Martes','The sable is a species of marten, a small carnivorous mammal inhabiting forest environments, primarily in Russia from the Ural Mountains throughout Siberia, and northern Mongolia.','Their fur is unique because it feels smooth regardless of which direction you stroke it, unlike most animals where the fur has a distinct \'grain\'.','/Mustelids/sable/assets/photo.webp','https://en.wikipedia.org/wiki/Sable'),
(46,'Southern river otter','Lontra provocax','Lutrinae','Lontra','The southern river otter is a species of otter that lives in Chile and Argentina. It is also known as the huillín.','In Chile, they are known as the \'Huillín\' and have the smallest geographical range of all otter species, living in both freshwater and marine habitats.','/Mustelids/southern_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Southern_river_otter'),
(47,'European mink','Mustela lutreola','Mustelinae','Mustela','The European mink is a semiaquatic species of mustelid native to Europe. It is one of the most endangered mammals in the world.','Unlike the American mink, they have a distinctive white upper lip that forms a small mask around their mouth.','/Mustelids/european_mink/assets/photo.webp','https://en.wikipedia.org/wiki/European_mink'),
(48,'Marine otter','Lontra felina','Lutrinae','Lontra','The marine otter is a rare and relatively unknown South American mammal of the weasel family. It is found along the Pacific coast of South America.','Locally known as the \'chungungo\', they are one of the few otter species adapted to live in marine environments along the Pacific coast of South America.','/Mustelids/marine_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Marine_otter'),
(49,'North American river otter','Lontra canadensis','Lutrinae','Lontra','The North American river otter, also known as the northern river otter or common otter, is a semiaquatic mammal endemic to the North American continent.','They are famous for their playful behavior, such as sliding down mud or snow banks, which helps them strengthen social bonds and practice hunting skills.','/Mustelids/north_american_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/North_American_river_otter'),
(50,'Javan ferret-badger','Melogale orientalis','Helictidinae','Melogale','The Javan ferret-badger is a small mustelid endemic to the Indonesian islands of Java and Bali. It is a secretive, nocturnal animal found in various forest types.','They have partially webbed toes and specialized ridges on their foot pads that help them scramble through trees and bushes in the forests of Java and Bali.','/Mustelids/javan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Javan_ferret-badger'),
(51,'Tayra','Eira barbara','Guloninae','Eira','The tayra is an omnivorous animal from the weasel family, native to the Americas. It is the only species in the genus Eira and is found from southern Mexico to northern Argentina and on the island of Trinidad.','They have been observed picking unripe plantains and hiding them to ripen, which may be evidence of future planning behavior.','/Mustelids/tayra/assets/photo.webp','https://en.wikipedia.org/wiki/Tayra'),
(52,'Greater hog badger','Arctonyx collaris','Melinae','Arctonyx','The greater hog badger is a mustelid native to Southeast Asia. It is listed as Vulnerable on the IUCN Red List because the population is thought to be declining due to habitat loss and hunting.','They are among the largest terrestrial mustelids and are capable of digging complex tunnel systems that serve as essential habitat for many other small animals.','/Mustelids/greater_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_hog_badger'),
(53,'Formosan ferret-badger','Melogale subaurantiaca','Helictidinae','Melogale','The Formosan ferret-badger is a species of mustelid endemic to the island of Taiwan. It is nocturnal and omnivorous, feeding on insects, earthworms, and fruit.','Once considered a subspecies of the Chinese ferret-badger, they were reclassified as a distinct species in 2019 following a genetic study.','/Mustelids/formosan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Formosan_ferret-badger'),
(54,'European polecat','Mustela putorius','Mustelinae','Mustela','The European polecat, also known as the common forest polecat, is a species of mustelid native to western Eurasia and North Africa.','They are the wild ancestors of the domestic ferret and were once nicknamed \'chicken-cats\' due to their habit of raiding poultry coops.','/Mustelids/european_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/European_polecat'),
(55,'Black-footed ferret','Mustela nigripes','Mustelinae','Mustela','The black-footed ferret, also known as the American polecat or prairie dog hunter, is a species of mustelid native to central North America.','They were once thought to be extinct until a small population was rediscovered in Wyoming in 1981; all living individuals today descend from just seven ancestors.','/Mustelids/black_footed_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Black-footed_ferret'),
(56,'Northern hog badger','Arctonyx albogularis','Melinae','Arctonyx','The northern hog badger is a mustelid species native to South and East Asia. It was formerly considered a subspecies of the greater hog badger.','They have a highly sensitive, pig-like snout that they use to root through soil for earthworms and insects.','/Mustelids/northern_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Northern_hog_badger'),
(57,'Indonesian mountain weasel','Mustela lutreolina','Mustelinae','Mustela','The Indonesian mountain weasel is a species of weasel that lives on the islands of Java and Sumatra in Indonesia.','They are among the rarest weasels in the world, endemic to the high-altitude tropical rainforests of Java and Sumatra, and very few specimens have ever been studied.','/Mustelids/indonesian_mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Indonesian_mountain_weasel'),
(58,'Eurasian otter','Lutra lutra','Lutrinae','Lutra','The Eurasian otter, also known as the European otter, Eurasian river otter, common otter, or Old World otter, is a semiaquatic mammal native to Eurasia.','Their droppings, known as \'spraint\', have a surprisingly pleasant smell that is often compared to jasmine tea or mown hay.','/Mustelids/eurasian_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Eurasian_otter'),
(59,'Lesser grison','Galictis cuja','Ictonychinae','Galictis','The lesser grison is a species of mustelid found in South America. It is a small, slender animal with a long neck and short legs.','They have a habit of traveling in small family groups that move together in a single-file line through the undergrowth.','/Mustelids/lesser_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Lesser_grison'),
(60,'American badger','Taxidea taxus','Taxidiinae','Taxidea','The American badger is a North American badger, somewhat similar in appearance to the European badger, although not closely related. It is found in the western and central United States, northern Mexico, and south-central Canada to certain areas of southwestern British Columbia.','They occasionally hunt in short-term alliances with coyotes, where the badger digs prey out of burrows while the coyote catches any that escape to the surface.','/Mustelids/american_badger/assets/photo.webp','https://en.wikipedia.org/wiki/American_badger'),
(61,'Asian small-clawed otter','Aonyx cinereus','Lutrinae','Aonyx','The Asian small-clawed otter, also known as the oriental small-clawed otter, is the smallest otter species in the world, native to South and Southeast Asia.','They are the smallest of all 13 otter species and form monogamous pairs that often stay together for life, with both parents helping to raise the pups.','/Mustelids/asian_small_clawed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_small-clawed_otter'),
(62,'Burmese ferret-badger','Melogale personata','Helictidinae','Melogale','The Burmese ferret-badger, also known as the large-toothed ferret-badger, is a species of mustelid found in Southeast Asia, from Nepal and northeastern India to Indochina.','Each individual has a unique pattern of black and white patches on its face, making them easy to identify from one another.','/Mustelids/burmese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Burmese_ferret-badger'),
(63,'Domestic ferret','Mustela furo','Mustelinae','Mustela','The ferret is the domesticated form of the European polecat, a mammal belonging to the same genus as the weasel, Mustela, in the family Mustelidae.','The name \'ferret\' is derived from the Latin word furittus, meaning \'little thief\', referring to their habit of stealing and stashing small items.','/Mustelids/domestic_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Ferret'),
(64,'African striped weasel','Poecilogale albinucha','Ictonychinae','Poecilogale','The African striped weasel, also known as the white-naped weasel, is a small, burrowing mustelid native to sub-Saharan Africa.','They obtain almost all the water they need directly from the prey they consume and rarely drink standing water.','/Mustelids/african_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/African_striped_weasel'),
(65,'Hairy-nosed otter','Lutra sumatrana','Lutrinae','Lutra','The hairy-nosed otter is an otter species native to Southeast Asia. It is one of the rarest and least-known otter species.','They are one of the world\'s rarest otters and are named for their nose pad, which is completely covered in short velvety hair, unlike the naked noses of most other otters.','/Mustelids/hairy_nosed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Hairy-nosed_otter'),
(66,'Mountain weasel','Mustela altaica','Mustelinae','Mustela','The mountain weasel, also known as the pale weasel, Altai weasel or solongoi, primarily lives in high-altitude environments in Asia.','In parts of China, there have been reports of these elusive weasels acting surprisingly friendly and appearing tame when encountering people in tents.','/Mustelids/mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Mountain_weasel');
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Stats` VALUES
(1,1,'weight','0.5 kg (estimated)'),
(2,1,'lifespan','3–5 years'),
(3,2,'weight','0.5–1.8 kg'),
(4,2,'lifespan','5–8 years'),
(5,3,'weight','0.8 kg'),
(6,3,'lifespan','5–8 years'),
(7,4,'weight','7–11 kg'),
(8,4,'lifespan','4–10 years'),
(9,5,'weight','3.8–11 kg'),
(10,5,'lifespan','10 years'),
(11,6,'weight','2–6 kg'),
(12,6,'lifespan','7–10 years'),
(13,7,'weight','0.9–2.2 kg'),
(14,7,'lifespan','3–4 years'),
(15,8,'weight','7–17 kg'),
(16,8,'lifespan','15 years'),
(17,9,'weight','0.1–0.82 kg'),
(18,9,'lifespan','2–3 years'),
(19,10,'weight','0.7–2.0 kg'),
(20,10,'lifespan','3–5 years'),
(21,11,'weight','0.225 kg'),
(22,11,'lifespan','1–3 years'),
(23,12,'weight','22–34 kg'),
(24,12,'lifespan','8–13 years'),
(25,13,'weight','7–14 kg'),
(26,13,'lifespan','14–15 years (captivity)'),
(27,14,'weight','1–2 kg'),
(28,14,'lifespan','3–10 years'),
(29,15,'weight','1–1.5 kg'),
(30,15,'lifespan','8–12 years'),
(31,16,'weight','0.1–0.45 kg'),
(32,16,'lifespan','1–5 years'),
(33,17,'weight','0.7–2.0 kg'),
(34,17,'lifespan','4–7 years'),
(35,18,'weight','1.1–2.5 kg'),
(36,18,'lifespan','3–10 years'),
(37,19,'weight','0.1–0.15 kg'),
(38,19,'lifespan','< 2 years'),
(39,20,'weight','5–16 kg'),
(40,20,'lifespan','7–8 years'),
(41,21,'weight','1.2–5.7 kg'),
(42,21,'lifespan','7–10 years'),
(43,22,'weight','0.07–0.45 kg'),
(44,22,'lifespan','3–7 years'),
(45,23,'weight','14–45 kg'),
(46,23,'lifespan','10–15 years'),
(47,24,'weight','0.12–0.15 kg'),
(48,24,'lifespan','1–6 years'),
(49,25,'weight','3.5–9 kg'),
(50,25,'lifespan','5–10 years'),
(51,26,'weight','1–3 kg'),
(52,26,'lifespan','< 5 years'),
(53,27,'weight','0.025–0.18 kg'),
(54,27,'lifespan','1–2 years'),
(55,28,'weight','5–15 kg'),
(56,28,'lifespan','10–15 years'),
(57,29,'weight','0.025–0.1 kg'),
(58,29,'lifespan','< 1 year'),
(59,30,'weight','8–18 kg'),
(60,30,'lifespan','5–10 years'),
(61,31,'weight','1.5 kg'),
(62,31,'lifespan','3–4 years'),
(63,32,'weight','10–25 kg'),
(64,32,'lifespan','10–15 years'),
(65,33,'weight','2.1 kg'),
(66,33,'lifespan','12–15 years'),
(67,34,'weight','0.75–1.8 kg'),
(68,34,'lifespan','4–6 years'),
(69,35,'weight','3–6 kg'),
(70,35,'lifespan','8 years'),
(71,36,'weight','7–17 kg'),
(72,36,'lifespan','3–8 years'),
(73,37,'weight','0.3–0.7 kg'),
(74,37,'lifespan','8–12 years'),
(75,38,'weight','1.5–3.8 kg'),
(76,38,'lifespan','10–12 years'),
(77,39,'weight','0.36–0.82 kg'),
(78,39,'lifespan','2.1 years'),
(79,40,'weight','0.7–2.05 kg'),
(80,40,'lifespan','Up to 5 years'),
(81,41,'weight','1–3 kg'),
(82,41,'lifespan','< 10 years'),
(83,42,'weight','0.24–0.8 kg'),
(84,42,'lifespan','5–6 years'),
(85,43,'weight','0.5–1.6 kg'),
(86,43,'lifespan','12–17 years'),
(87,44,'weight','12–21 kg'),
(88,44,'lifespan','10–12 years'),
(89,45,'weight','0.7–1.8 kg'),
(90,45,'lifespan','Up to 18 years'),
(91,46,'weight','5–10 kg'),
(92,46,'lifespan','3–5 years'),
(93,47,'weight','0.5–0.9 kg'),
(94,47,'lifespan','6–10 years'),
(95,48,'weight','3–6 kg'),
(96,48,'lifespan','10–15 years'),
(97,49,'weight','5–14 kg'),
(98,49,'lifespan','8–13 years'),
(99,50,'weight','1–2 kg'),
(100,50,'lifespan','5–8 years'),
(101,51,'weight','2.7–8 kg'),
(102,51,'lifespan','Unknown (Wild)'),
(103,52,'weight','7–14 kg'),
(104,52,'lifespan','8–12 years'),
(105,53,'weight','< 2 kg'),
(106,53,'lifespan','< 10 years'),
(107,54,'weight','0.4–1.7 kg'),
(108,54,'lifespan','5–6 years'),
(109,55,'weight','0.6–1.4 kg'),
(110,55,'lifespan','1–4 years'),
(111,56,'weight','7–14 kg'),
(112,56,'lifespan','14 years (captivity)'),
(113,57,'weight','0.29–0.34 kg'),
(114,57,'lifespan','7–10 years'),
(115,58,'weight','7–12 kg'),
(116,58,'lifespan','3–4 years'),
(117,59,'weight','1–2.5 kg'),
(118,59,'lifespan','10+ years (captivity)'),
(119,60,'weight','4–12 kg'),
(120,60,'lifespan','4–10 years'),
(121,61,'weight','1–5.5 kg'),
(122,61,'lifespan','10–16 years'),
(123,62,'weight','1–3 kg'),
(124,62,'lifespan','< 10 years'),
(125,63,'weight','0.5–2.0 kg'),
(126,63,'lifespan','5–8 years'),
(127,64,'weight','0.23–0.38 kg'),
(128,64,'lifespan','5–6 years'),
(129,65,'weight','5–8 kg'),
(130,65,'lifespan','10–12 years'),
(131,66,'weight','0.12–0.35 kg'),
(132,66,'lifespan','7–10 years');
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

-- Dump completed on 2026-05-01 10:08:35
