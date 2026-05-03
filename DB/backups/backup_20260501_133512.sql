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
  CONSTRAINT `mustelidhabitats_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
(56,1),
(65,1),
(29,2),
(19,3),
(36,4),
(4,5),
(29,6),
(14,7),
(12,8),
(47,9),
(5,10),
(33,10),
(42,10),
(44,10),
(35,11),
(17,12),
(62,13),
(1,14),
(39,14),
(41,14),
(53,14),
(1,15),
(39,15),
(41,15),
(53,15),
(8,16),
(24,17),
(3,18),
(27,18),
(31,18),
(34,18),
(43,18),
(45,18),
(48,18),
(57,18),
(13,19),
(15,19),
(16,19),
(18,19),
(21,19),
(26,19),
(28,19),
(30,19),
(56,19),
(63,19),
(65,19),
(8,20),
(19,20),
(55,20),
(13,21),
(15,21),
(16,21),
(18,21),
(21,21),
(26,21),
(28,21),
(30,21),
(63,21),
(51,22),
(51,24),
(60,25),
(4,26),
(5,26),
(14,26),
(20,26),
(33,26),
(42,26),
(44,26),
(32,27),
(12,28),
(7,29),
(23,30),
(22,31),
(6,32),
(59,33),
(10,34),
(35,35),
(60,36),
(38,37),
(9,38),
(46,38),
(17,39),
(36,40),
(54,41),
(10,42),
(11,43),
(64,44),
(37,45),
(50,45),
(58,45),
(7,46),
(24,46),
(20,47),
(2,48),
(25,48),
(40,48),
(49,48),
(52,48),
(61,48),
(38,49),
(55,50),
(2,51),
(25,51),
(40,51),
(49,51),
(52,51),
(61,51),
(37,52),
(50,52),
(58,52),
(24,53),
(3,54),
(9,54),
(27,54),
(31,54),
(34,54),
(38,54),
(43,54),
(45,54),
(46,54),
(48,54),
(57,54),
(59,55);
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
  CONSTRAINT `mustelidtraits_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
(1,1,1.06),
(1,2,2.17),
(1,3,3.46),
(1,4,2.89),
(1,5,2.48),
(2,1,3.65),
(2,2,1.98),
(2,3,1.12),
(2,4,2.66),
(2,5,5),
(3,1,4.32),
(3,2,3.58),
(3,3,2.78),
(3,4,4.23),
(3,5,3.4),
(4,1,1.86),
(4,2,1.49),
(4,3,4.38),
(4,4,4.1),
(4,5,3.83),
(5,1,2.48),
(5,2,2.42),
(5,3,2.05),
(5,4,3.7),
(5,5,3.95),
(6,1,3.28),
(6,2,2.6),
(6,3,4.82),
(6,4,3.09),
(6,5,3.58),
(7,1,2.17),
(7,2,1.43),
(7,3,1.37),
(7,4,4.42),
(7,5,1.8),
(8,1,2.85),
(8,2,4.82),
(8,3,4.02),
(8,4,2.3),
(8,5,3.46),
(9,1,4.75),
(9,2,4.2),
(9,3,5),
(9,4,3),
(9,5,1.86),
(10,1,3.52),
(10,2,3.95),
(10,3,2.42),
(10,4,1.83),
(10,5,3.71),
(11,1,4.63),
(11,2,1.06),
(11,3,1.31),
(11,4,4.97),
(11,5,1.98),
(12,1,2.6),
(12,2,2.11),
(12,3,1.25),
(12,4,4.33),
(12,5,4.82),
(13,1,1.74),
(13,2,4.45),
(13,3,4.63),
(13,4,3.06),
(13,5,3.09),
(14,1,2.35),
(14,2,3.28),
(14,3,4.69),
(14,4,2.95),
(14,5,2.66),
(15,1,1.49),
(15,2,4.63),
(15,3,4.94),
(15,4,1.96),
(15,5,1.55),
(16,1,3.77),
(16,2,4.38),
(16,3,4.51),
(16,4,3),
(16,5,4.14),
(17,1,2.91),
(17,2,3.89),
(17,3,3.83),
(17,4,3.18),
(17,5,3.28),
(18,1,3.03),
(18,2,4.75),
(18,3,4.75),
(18,4,1.45),
(18,5,2.17),
(19,1,1.62),
(19,2,3.34),
(19,3,1.06),
(19,4,4.33),
(19,5,4.63),
(20,1,1.92),
(20,2,4.02),
(20,3,4.57),
(20,4,3.61),
(20,5,2.29),
(21,1,2.54),
(21,2,4.88),
(21,3,3.89),
(21,4,1.93),
(21,5,1.68),
(22,1,4.82),
(22,2,1.12),
(22,3,3.58),
(22,4,5),
(22,5,1.06),
(23,1,1.8),
(23,2,4.08),
(23,3,4.14),
(23,4,1.5),
(23,5,3.15),
(24,1,1.98),
(24,2,2.29),
(24,3,2.29),
(24,4,3.99),
(24,5,3.34),
(25,1,3.4),
(25,2,1.74),
(25,3,1.49),
(25,4,3.25),
(25,5,4.51),
(26,1,2.72),
(26,2,4.69),
(26,3,3.95),
(26,4,1.32),
(26,5,1.92),
(27,1,4.69),
(27,2,1.31),
(27,3,3.65),
(27,4,4.3),
(27,5,1.49),
(28,1,1.68),
(28,2,4.51),
(28,3,3.77),
(28,4,1),
(28,5,1.31),
(29,1,4.2),
(29,2,1),
(29,3,1),
(29,4,4.47),
(29,5,3.77),
(30,1,1.31),
(30,2,4.94),
(30,3,3.4),
(30,4,3.06),
(30,5,4.02),
(31,1,4.26),
(31,2,1.55),
(31,3,1.43),
(31,4,4.66),
(31,5,3.65),
(32,1,3.71),
(32,2,2.66),
(32,3,1.98),
(32,4,3.28),
(32,5,2.35),
(33,1,1.12),
(33,2,2.85),
(33,3,4.2),
(33,4,2.96),
(33,5,2.11),
(34,1,4.94),
(34,2,1.37),
(34,3,4.88),
(34,4,3.78),
(34,5,1.25),
(35,1,3.58),
(35,2,3.52),
(35,3,2.6),
(35,4,4.42),
(35,5,4.08),
(36,1,1),
(36,2,3.77),
(36,3,2.85),
(36,4,2.35),
(36,5,2.91),
(37,1,2.78),
(37,2,1.62),
(37,3,3.03),
(37,4,3.43),
(37,5,4.32),
(38,1,3.89),
(38,2,3.83),
(38,3,4.26),
(38,4,2.46),
(38,5,2.23),
(39,1,1.43),
(39,2,2.97),
(39,3,4.08),
(39,4,3.01),
(39,5,4.2),
(40,1,3.34),
(40,2,3.09),
(40,3,3.52),
(40,4,3.25),
(40,5,4.45),
(41,1,1.55),
(41,2,2.54),
(41,3,2.97),
(41,4,2.38),
(41,5,4.26),
(42,1,2.66),
(42,2,4.26),
(42,3,2.48),
(42,4,2.83),
(42,5,1.18),
(43,1,4.45),
(43,2,1.68),
(43,3,2.72),
(43,4,4.62),
(43,5,1.74),
(44,1,2.29),
(44,2,1.18),
(44,3,4.32),
(44,4,2.95),
(44,5,2.54),
(45,1,4.88),
(45,2,2.91),
(45,3,3.71),
(45,4,4.11),
(45,5,1.12),
(46,1,4.38),
(46,2,3.46),
(46,3,2.91),
(46,4,2.57),
(46,5,3.89),
(47,1,5),
(47,2,3.4),
(47,3,1.8),
(47,4,3.78),
(47,5,1.37),
(48,1,4.51),
(48,2,1.25),
(48,3,2.23),
(48,4,4.26),
(48,5,1.43),
(49,1,3.22),
(49,2,2.35),
(49,3,2.66),
(49,4,3.06),
(49,5,2.72),
(50,1,3.83),
(50,2,2.05),
(50,3,1.62),
(50,4,3.89),
(50,5,2.97),
(51,1,3.15),
(51,2,3.03),
(51,3,1.18),
(51,4,4.33),
(51,5,4.94),
(52,1,3.46),
(52,2,3.65),
(52,3,1.68),
(52,4,3.25),
(52,5,4.38),
(53,1,2.11),
(53,2,2.72),
(53,3,3.28),
(53,4,2.83),
(53,5,2.42),
(54,1,1.25),
(54,2,3.22),
(54,3,2.35),
(54,4,2.8),
(54,5,3.22),
(55,1,2.05),
(55,2,1.8),
(55,3,1.92),
(55,4,4.33),
(55,5,4.88),
(56,1,2.97),
(56,2,5),
(56,3,3.15),
(56,4,2.05),
(56,5,4.57),
(57,1,4.57),
(57,2,2.23),
(57,3,2.17),
(57,4,4.26),
(57,5,2.05),
(58,1,4.14),
(58,2,2.78),
(58,3,1.86),
(58,4,3.16),
(58,5,3.03),
(59,1,2.23),
(59,2,1.86),
(59,3,2.11),
(59,4,4.15),
(59,5,4.69),
(60,1,3.95),
(60,2,1.92),
(60,3,3.09),
(60,4,3.57),
(60,5,1.62),
(61,1,3.09),
(61,2,3.71),
(61,3,1.55),
(61,4,3.25),
(61,5,4.75),
(62,1,1.37),
(62,2,2.48),
(62,3,3.22),
(62,4,2.95),
(62,5,2.85),
(63,1,2.42),
(63,2,4.14),
(63,3,1.74),
(63,4,2.03),
(63,5,3.52),
(64,1,4.08),
(64,2,3.15),
(64,3,2.54),
(64,4,4.02),
(64,5,1),
(65,1,1.18),
(65,2,4.57),
(65,3,4.45),
(65,4,1.86),
(65,5,2.6);
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
(1,'Striped polecat','Ictonyx striatus','Ictonychinae','Ictonyx','The striped polecat, also known as the zorilla, is a member of the family Mustelidae that resembles a skunk. It is found in sub-Saharan Africa.','Often called the zorilla, their defensive spray is so powerful it can cause temporary blindness in potential predators.','/Mustelids/striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Striped_polecat'),
(2,'Vietnam ferret-badger','Melogale cucphuongensis','Helictidinae','Melogale','The Vietnam ferret-badger is a species of mustelid endemic to Vietnam. It was only described as a distinct species in 2011.','This extremely rare species was only discovered by scientists in 2011 and is one of the least-studied mammals in the world.','/Mustelids/vietnam_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Vietnam_ferret-badger'),
(3,'Smooth-coated otter','Lutrogale perspicillata','Lutrinae','Lutrogale','The smooth-coated otter is an otter species found in South and Southeast Asia. It is known for its smooth, sleek fur.','They are highly social and hunt in coordinated V-shaped formations to herd schools of fish into shallow water where they are easier to catch.','/Mustelids/smooth_coated_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Smooth-coated_otter'),
(4,'Japanese badger','Meles anakuma','Melinae','Meles','The Japanese badger is a species of badger endemic to Japan, where it is found on Honshu, Kyushu, Shikoku, and Shodoshima.','In Japanese folklore, they are known as mujina and are believed to be shapeshifters capable of taking human form.','/Mustelids/japanese_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_badger'),
(5,'Fisher','Pekania pennanti','Guloninae','Pekania','The fisher is a small carnivorous mammal native to North America. It is a member of the mustelid family and is the only living species in the genus Pekania.','They are one of the few animals capable of successfully preying on porcupines by using their agility to attack the face or flip them over.','/Mustelids/fisher/assets/photo.webp','https://en.wikipedia.org/wiki/Fisher_(animal)'),
(6,'European pine marten','Martes martes','Guloninae','Martes','The European pine marten, also known as the pine marten or the sweet marten, is an animal native to Northern Europe.','They are the only mustelids with semi-retractable claws, which combined with 180-degree rotating ankles, makes them expert climbers.','/Mustelids/european_pine_marten/assets/photo.webp','https://en.wikipedia.org/wiki/European_pine_marten'),
(7,'Caucasian badger','Meles canescens','Melinae','Meles','The Caucasian badger, also known as the Southwest Asian badger, is a species of badger native to Western Asia and some islands in the Mediterranean Sea.','They were only officially recognized as a distinct species from the European badger in 2013 following genetic studies.','/Mustelids/caucasian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Caucasian_badger'),
(8,'Japanese weasel','Mustela itatsi','Mustelinae','Mustela','The Japanese weasel is a carnivorous mammal belonging to the genus Mustela in the family Mustelidae. It is native to Japan.','In Japanese folklore, they are associated with the kamaitachi, a supernatural creature depicted as a weasel with sickle-like claws.','/Mustelids/japanese_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_weasel'),
(9,'American mink','Neogale vison','Mustelinae','Neogale','The American mink is a semiaquatic species of mustelid native to North America. It has been introduced to many other parts of the world.','When they are happy or content, minks have been known to make a soft purring sound similar to a domestic cat.','/Mustelids/american_mink/assets/photo.webp','https://en.wikipedia.org/wiki/American_mink'),
(10,'Patagonian weasel','Lyncodon patagonicus','Ictonychinae','Lyncodon','The Patagonian weasel is a small mustelid native to the Pampas of Argentina and Chile. It is the only species in the genus Lyncodon.','They are the only member of their genus, Lyncodon, and were historically kept as \'working pets\' by ranchers to control rodent populations.','/Mustelids/patagonian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Patagonian_weasel'),
(11,'Giant otter','Pteronura brasiliensis','Lutrinae','Pteronura','The giant otter is a South American carnivorous mammal. It is the longest member of the mustelid family.','Known as the \'river wolf\', they are the noisiest otter species and have unique cream-colored throat patches that act like fingerprints for identification.','/Mustelids/giant_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Giant_otter'),
(12,'Sumatran hog badger','Arctonyx hoevenii','Melinae','Arctonyx','The Sumatran hog badger is a species of mustelid endemic to the island of Sumatra in Indonesia. It is the smallest of the three species in the genus Arctonyx.','They are the smallest species in their genus and are exclusively found on the island of Sumatra, often at high altitudes.','/Mustelids/sumatran_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Sumatran_hog_badger'),
(13,'Malayan weasel','Mustela nudipes','Mustelinae','Mustela','The Malayan weasel is a species of weasel native to the Malay Peninsula and the islands of Sumatra and Borneo.','Their scientific name, Mustela nudipes, translates to \'bare feet\', referring to the fact that their foot pads have no fur at all.','/Mustelids/malayan_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Malayan_weasel'),
(14,'Japanese marten','Martes melampus','Guloninae','Martes','The Japanese marten is a mammal in the marten genus. It is most closely related to the sable. It is endemic to the islands of Japan.','They play a vital role in their ecosystem as seed dispersers, with over 60% of their droppings containing seeds from the fruits they eat.','/Mustelids/japanese_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Japanese_marten'),
(15,'Stoat (Beringian ermine)','Mustela erminea','Mustelinae','Mustela','The stoat, also known as the ermine or Beringian ermine, is a species of mustelid native to Eurasia and the northern regions of North America.','Regardless of whether its coat is brown or winter white, the tip of a stoat\'s tail always remains black, likely to distract predators.','/Mustelids/stoat_beringian_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Stoat'),
(16,'Back-striped weasel','Mustela strigidorsa','Mustelinae','Mustela','The back-striped weasel, also known as the stripe-backed weasel, is a species of mustelid found in Southeast Asia.','They are characterized by a narrow, silvery stripe running down the entire length of their back, which is mirrored by a yellowish streak on their belly.','/Mustelids/back_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Back-striped_weasel'),
(17,'Beech marten','Martes foina','Guloninae','Martes','The beech marten, also known as the stone marten, house marten or white-breasted marten, is a species of marten native to much of Europe and Central Asia.','They have a notorious reputation for entering parked vehicle engine bays and chewing on cables and hoses, a behavior often called \'marten damage\'.','/Mustelids/beech_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Beech_marten'),
(18,'Haida ermine','Mustela haidarum','Mustelinae','Mustela','The Haida ermine is a species of mustelid endemic to the islands of the Haida Gwaii archipelago in British Columbia and the Alexander Archipelago in Alaska.','They were only recognized as a distinct species in 2021 after being isolated on the Haida Gwaii archipelago for approximately 300,000 years.','/Mustelids/haida_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/Haida_ermine'),
(19,'Honey badger','Mellivora capensis','Mellivorinae','Mellivora','The honey badger, also known as the ratel, is a mammal widely distributed in Africa, Southwest Asia, and the Indian subcontinent. Because of its wide range and occurrence in many different habitats, it is listed as Least Concern on the IUCN Red List.','They have incredibly thick, loose skin that allows them to twist and turn inside it to bite back at an attacker even if they are caught in its jaws.','/Mustelids/honey_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Honey_badger'),
(20,'Yellow-throated marten','Martes flavigula','Guloninae','Martes','The yellow-throated marten, also known as the kharza, is a marten species native to Asia. It is listed as Least Concern on the IUCN Red List due to its wide distribution.','They are the largest marten species in the Old World and are sometimes seen hunting in small family groups to take down larger prey like musk deer.','/Mustelids/yellow_throated_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-throated_marten'),
(21,'Long-tailed weasel','Neogale frenata','Mustelinae','Neogale','The long-tailed weasel, also known as the bridled weasel or big over-and-under, is a species of mustelid native to North America.','Unlike skunks which spray, long-tailed weasels drag and rub their bodies against surfaces to mark territory with their musky odor.','/Mustelids/long_tailed_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Long-tailed_weasel'),
(22,'Sea otter','Enhydra lutris','Lutrinae','Enhydra','The sea otter is a marine mammal native to the coasts of the northern and eastern North Pacific Ocean.','Sea otters have the densest fur of any animal, with up to one million hairs per square inch; they lack blubber and rely entirely on this fur to stay warm.','/Mustelids/sea_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Sea_otter'),
(23,'Colombian weasel','Neogale felipei','Mustelinae','Neogale','The Colombian weasel, also known as Don Felipe\'s weasel, is a very rare species of mustelid found in Colombia and Ecuador.','They are considered the rarest carnivore in South America and have noticeable webbing between their toes, suggesting a semi-aquatic lifestyle.','/Mustelids/colombian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Colombian_weasel'),
(24,'Asian badger','Meles leucurus','Melinae','Meles','The Asian badger, also known as the sand badger, is a species of badger native to Asia. It is widely distributed from the Volga River in the west to the Korean Peninsula in the east.','Unlike many other badgers, they often hibernate in family groups, with adults sharing their dens with the previous year\'s cubs.','/Mustelids/asian_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_badger'),
(25,'Bornean ferret-badger','Melogale everetti','Helictidinae','Melogale','The Bornean ferret-badger, also known as Everett\'s ferret-badger or the Kinabalu ferret-badger, is a small mustelid endemic to the island of Borneo. It is listed as Endangered on the IUCN Red List due to its restricted range and habitat loss.','They cleverly repurpose abandoned burrows created by other animals rather than digging their own, despite having strong claws.','/Mustelids/bornean_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Bornean_ferret-badger'),
(26,'American ermine','Mustela richardsonii','Mustelinae','Mustela','The American ermine is a species of mustelid native to North America. It was formerly considered a subspecies of the stoat.','They exhibit a reproductive strategy called embryonic diapause, where the embryo remains dormant for months so the young are born in spring.','/Mustelids/american_ermine/assets/photo.webp','https://en.wikipedia.org/wiki/American_ermine'),
(27,'Neotropical otter','Lontra longicaudis','Lutrinae','Lontra','The neotropical otter, also known as the neotropical river otter, is an otter species found in Central America, South America and the island of Trinidad.','They are intelligent tool users and have been observed using rocks to break open the shells of crustaceans and mollusks.','/Mustelids/neotropical_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Neotropical_otter'),
(28,'Least weasel','Mustela nivalis','Mustelinae','Mustela','The least weasel is the smallest member of the genus Mustela, the family Mustelidae and the order Carnivora. It is native to Eurasia, North America and North Africa.','They are the smallest carnivorous mammals in the world and must consume up to 60% of their body weight every day to survive.','/Mustelids/least_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Least_weasel'),
(29,'Wolverine','Gulo gulo','Guloninae','Gulo','The wolverine, also referred to as the glutton, carcajou, or quickhatch, is the largest terrestrial member of the family Mustelidae. It is a muscular carnivore and a solitary animal.','Their paws act like natural snowshoes by spreading to twice their size when they hit the ground, allowing them to travel easily over deep snow.','/Mustelids/wolverine/assets/photo.webp','https://en.wikipedia.org/wiki/Wolverine'),
(30,'Yellow-bellied weasel','Mustela kathiah','Mustelinae','Mustela','The yellow-bellied weasel is a species of mustelid found in the forests of central and eastern Asia. It is known for its distinctive yellow underbelly.','Historically in Nepal, they were kept by humans to control rodent populations and were even trained to attack larger animals for sport.','/Mustelids/yellow_bellied_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Yellow-bellied_weasel'),
(31,'Congo clawless otter','Aonyx congicus','Lutrinae','Aonyx','The Congo clawless otter is a species of otter in the family Mustelidae. It is found in Cameroon, Congo, Democratic Republic of the Congo, Equatorial Guinea, and Gabon.','They are considered the most terrestrial of all otter species and spend a significant amount of time exploring shores and land compared to their relatives.','/Mustelids/congo_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Congo_clawless_otter'),
(32,'Nilgiri marten','Martes gwatkinsii','Guloninae','Martes','The Nilgiri marten is the only species of marten found in southern India. It is found in the hills of the Nilgiris and parts of the Western Ghats.','They are the only species of marten found in India and are endemic exclusively to the Western Ghats mountain range.','/Mustelids/nilgiri_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Nilgiri_marten'),
(33,'Pacific marten','Martes caurina','Guloninae','Martes','The Pacific marten is a species of North American mammal in the family Mustelidae. It is found in the western United States and southwestern Canada.','They are capable of descending tree trunks headfirst by rotating their hind limbs, a rare ability among mammals.','/Mustelids/pacific_marten/assets/photo.webp','https://en.wikipedia.org/wiki/Pacific_marten'),
(34,'Spotted-necked otter','Hydrictis maculicollis','Lutrinae','Hydrictis','The spotted-necked otter, or speckle-throated otter, is a species of otter native to sub-Saharan Africa.','Each individual has a unique pattern of creamy-white blotches on its throat and chest, which researchers use to identify them in the wild.','/Mustelids/spotted_necked_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Spotted-necked_otter'),
(35,'European badger','Meles meles','Melinae','Meles','The European badger is a badger species native to almost all of Europe. It is a powerful animal with a small head, a stocky body, small black eyes and a short tail.','They live in communal burrow systems called setts that can be hundreds of years old and are passed down through many generations of the same clan.','/Mustelids/european_badger/assets/photo.webp','https://en.wikipedia.org/wiki/European_badger'),
(36,'Marbled polecat','Vormela peregusna','Ictonychinae','Vormela','The marbled polecat is a small mustelid native to southeast Europe and parts of Asia. It is known for its striking, multi-colored coat.','They have a unique \'marbled\' coat of yellow, white, and brown spots, and when threatened, they fluff up their fur and stand on their hind legs to look larger.','/Mustelids/marbled_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Marbled_polecat'),
(37,'Greater grison','Galictis vittata','Ictonychinae','Galictis','The greater grison is a species of mustelid found in Central and South America. It is a medium-sized animal with a grizzled grey coat and a black underside.','When hunting, they move in a zigzag pattern and frequently pause to raise their heads above tall grass to sniff the air and survey their surroundings.','/Mustelids/greater_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_grison'),
(38,'Siberian weasel','Mustela sibirica','Mustelinae','Mustela','The Siberian weasel, also known as the kolinsky, is a medium-sized species of mustelid native to Asia.','The famous \'Kolinsky sable-hair\' artist brushes are actually made from the winter fur of the male Siberian weasel, not from actual sables.','/Mustelids/siberian_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Siberian_weasel'),
(39,'Steppe polecat','Mustela eversmanii','Mustelinae','Mustela','The steppe polecat, also known as the white or masked polecat, is a species of mustelid native to Central and Eastern Europe and Central Asia.','They perform a \'war dance\' to disorient prey, leaping and jumping around while making soft clucking sounds before they attack.','/Mustelids/steppe_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Steppe_polecat'),
(40,'Chinese ferret-badger','Melogale moschata','Helictidinae','Melogale','The Chinese ferret-badger, also known as the small-toothed ferret-badger, is a small mustelid widely distributed in Southeast Asia and southern China. It is known for its distinctive facial mask and agile climbing abilities.','They are agile climbers that often sleep in tree branches and are encouraged by farmers to stay near agricultural areas to control pests.','/Mustelids/chinese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Chinese_ferret-badger'),
(41,'Saharan striped polecat','Ictonyx libycus','Ictonychinae','Ictonyx','The Saharan striped polecat, also known as the Saharan striped weasel, is a species of mustelid found in North Africa and parts of the Sahel region.','They have fur on the undersides of their paws, which is an adaptation to help them walk and hunt in sandy desert environments.','/Mustelids/saharan_striped_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/Saharan_striped_polecat'),
(42,'American marten','Martes americana','Guloninae','Martes','The American marten is a North American mammal, a member of the family Mustelidae. It is also sometimes referred to as the American pine marten.','A group of martens is collectively known as a richness.','/Mustelids/american_marten/assets/photo.webp','https://en.wikipedia.org/wiki/American_marten'),
(43,'African clawless otter','Aonyx capensis','Lutrinae','Aonyx','The African clawless otter, also known as the Cape clawless otter, is the second-largest freshwater species of otter. It is found in much of sub-Saharan Africa.','They are the second-largest freshwater otter and have incredibly dexterous front paws that are almost entirely clawless and unwebbed, allowing them to feel for prey in the mud.','/Mustelids/african_clawless_otter/assets/photo.webp','https://en.wikipedia.org/wiki/African_clawless_otter'),
(44,'Sable','Martes zibellina','Guloninae','Martes','The sable is a species of marten, a small carnivorous mammal inhabiting forest environments, primarily in Russia from the Ural Mountains throughout Siberia, and northern Mongolia.','Their fur is unique because it feels smooth regardless of which direction you stroke it, unlike most animals where the fur has a distinct \'grain\'.','/Mustelids/sable/assets/photo.webp','https://en.wikipedia.org/wiki/Sable'),
(45,'Southern river otter','Lontra provocax','Lutrinae','Lontra','The southern river otter is a species of otter that lives in Chile and Argentina. It is also known as the huillín.','In Chile, they are known as the \'Huillín\' and have the smallest geographical range of all otter species, living in both freshwater and marine habitats.','/Mustelids/southern_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Southern_river_otter'),
(46,'European mink','Mustela lutreola','Mustelinae','Mustela','The European mink is a semiaquatic species of mustelid native to Europe. It is one of the most endangered mammals in the world.','Unlike the American mink, they have a distinctive white upper lip that forms a small mask around their mouth.','/Mustelids/european_mink/assets/photo.webp','https://en.wikipedia.org/wiki/European_mink'),
(47,'Marine otter','Lontra felina','Lutrinae','Lontra','The marine otter is a rare and relatively unknown South American mammal of the weasel family. It is found along the Pacific coast of South America.','Locally known as the \'chungungo\', they are one of the few otter species adapted to live in marine environments along the Pacific coast of South America.','/Mustelids/marine_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Marine_otter'),
(48,'North American river otter','Lontra canadensis','Lutrinae','Lontra','The North American river otter, also known as the northern river otter or common otter, is a semiaquatic mammal endemic to the North American continent.','They are famous for their playful behavior, such as sliding down mud or snow banks, which helps them strengthen social bonds and practice hunting skills.','/Mustelids/north_american_river_otter/assets/photo.webp','https://en.wikipedia.org/wiki/North_American_river_otter'),
(49,'Javan ferret-badger','Melogale orientalis','Helictidinae','Melogale','The Javan ferret-badger is a small mustelid endemic to the Indonesian islands of Java and Bali. It is a secretive, nocturnal animal found in various forest types.','They have partially webbed toes and specialized ridges on their foot pads that help them scramble through trees and bushes in the forests of Java and Bali.','/Mustelids/javan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Javan_ferret-badger'),
(50,'Tayra','Eira barbara','Guloninae','Eira','The tayra is an omnivorous animal from the weasel family, native to the Americas. It is the only species in the genus Eira and is found from southern Mexico to northern Argentina and on the island of Trinidad.','They have been observed picking unripe plantains and hiding them to ripen, which may be evidence of future planning behavior.','/Mustelids/tayra/assets/photo.webp','https://en.wikipedia.org/wiki/Tayra'),
(51,'Greater hog badger','Arctonyx collaris','Melinae','Arctonyx','The greater hog badger is a mustelid native to Southeast Asia. It is listed as Vulnerable on the IUCN Red List because the population is thought to be declining due to habitat loss and hunting.','They are among the largest terrestrial mustelids and are capable of digging complex tunnel systems that serve as essential habitat for many other small animals.','/Mustelids/greater_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Greater_hog_badger'),
(52,'Formosan ferret-badger','Melogale subaurantiaca','Helictidinae','Melogale','The Formosan ferret-badger is a species of mustelid endemic to the island of Taiwan. It is nocturnal and omnivorous, feeding on insects, earthworms, and fruit.','Once considered a subspecies of the Chinese ferret-badger, they were reclassified as a distinct species in 2019 following a genetic study.','/Mustelids/formosan_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Formosan_ferret-badger'),
(53,'European polecat','Mustela putorius','Mustelinae','Mustela','The European polecat, also known as the common forest polecat, is a species of mustelid native to western Eurasia and North Africa.','They are the wild ancestors of the domestic ferret and were once nicknamed \'chicken-cats\' due to their habit of raiding poultry coops.','/Mustelids/european_polecat/assets/photo.webp','https://en.wikipedia.org/wiki/European_polecat'),
(54,'Black-footed ferret','Mustela nigripes','Mustelinae','Mustela','The black-footed ferret, also known as the American polecat or prairie dog hunter, is a species of mustelid native to central North America.','They were once thought to be extinct until a small population was rediscovered in Wyoming in 1981; all living individuals today descend from just seven ancestors.','/Mustelids/black_footed_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Black-footed_ferret'),
(55,'Northern hog badger','Arctonyx albogularis','Melinae','Arctonyx','The northern hog badger is a mustelid species native to South and East Asia. It was formerly considered a subspecies of the greater hog badger.','They have a highly sensitive, pig-like snout that they use to root through soil for earthworms and insects.','/Mustelids/northern_hog_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Northern_hog_badger'),
(56,'Indonesian mountain weasel','Mustela lutreolina','Mustelinae','Mustela','The Indonesian mountain weasel is a species of weasel that lives on the islands of Java and Sumatra in Indonesia.','They are among the rarest weasels in the world, endemic to the high-altitude tropical rainforests of Java and Sumatra, and very few specimens have ever been studied.','/Mustelids/indonesian_mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Indonesian_mountain_weasel'),
(57,'Eurasian otter','Lutra lutra','Lutrinae','Lutra','The Eurasian otter, also known as the European otter, Eurasian river otter, common otter, or Old World otter, is a semiaquatic mammal native to Eurasia.','Their droppings, known as \'spraint\', have a surprisingly pleasant smell that is often compared to jasmine tea or mown hay.','/Mustelids/eurasian_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Eurasian_otter'),
(58,'Lesser grison','Galictis cuja','Ictonychinae','Galictis','The lesser grison is a species of mustelid found in South America. It is a small, slender animal with a long neck and short legs.','They have a habit of traveling in small family groups that move together in a single-file line through the undergrowth.','/Mustelids/lesser_grison/assets/photo.webp','https://en.wikipedia.org/wiki/Lesser_grison'),
(59,'American badger','Taxidea taxus','Taxidiinae','Taxidea','The American badger is a North American badger, somewhat similar in appearance to the European badger, although not closely related. It is found in the western and central United States, northern Mexico, and south-central Canada to certain areas of southwestern British Columbia.','They occasionally hunt in short-term alliances with coyotes, where the badger digs prey out of burrows while the coyote catches any that escape to the surface.','/Mustelids/american_badger/assets/photo.webp','https://en.wikipedia.org/wiki/American_badger'),
(60,'Asian small-clawed otter','Aonyx cinereus','Lutrinae','Aonyx','The Asian small-clawed otter, also known as the oriental small-clawed otter, is the smallest otter species in the world, native to South and Southeast Asia.','They are the smallest of all 13 otter species and form monogamous pairs that often stay together for life, with both parents helping to raise the pups.','/Mustelids/asian_small_clawed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Asian_small-clawed_otter'),
(61,'Burmese ferret-badger','Melogale personata','Helictidinae','Melogale','The Burmese ferret-badger, also known as the large-toothed ferret-badger, is a species of mustelid found in Southeast Asia, from Nepal and northeastern India to Indochina.','Each individual has a unique pattern of black and white patches on its face, making them easy to identify from one another.','/Mustelids/burmese_ferret_badger/assets/photo.webp','https://en.wikipedia.org/wiki/Burmese_ferret-badger'),
(62,'Domestic ferret','Mustela furo','Mustelinae','Mustela','The ferret is the domesticated form of the European polecat, a mammal belonging to the same genus as the weasel, Mustela, in the family Mustelidae.','The name \'ferret\' is derived from the Latin word furittus, meaning \'little thief\', referring to their habit of stealing and stashing small items.','/Mustelids/domestic_ferret/assets/photo.webp','https://en.wikipedia.org/wiki/Ferret'),
(63,'African striped weasel','Poecilogale albinucha','Ictonychinae','Poecilogale','The African striped weasel, also known as the white-naped weasel, is a small, burrowing mustelid native to sub-Saharan Africa.','They obtain almost all the water they need directly from the prey they consume and rarely drink standing water.','/Mustelids/african_striped_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/African_striped_weasel'),
(64,'Hairy-nosed otter','Lutra sumatrana','Lutrinae','Lutra','The hairy-nosed otter is an otter species native to Southeast Asia. It is one of the rarest and least-known otter species.','They are one of the world\'s rarest otters and are named for their nose pad, which is completely covered in short velvety hair, unlike the naked noses of most other otters.','/Mustelids/hairy_nosed_otter/assets/photo.webp','https://en.wikipedia.org/wiki/Hairy-nosed_otter'),
(65,'Mountain weasel','Mustela altaica','Mustelinae','Mustela','The mountain weasel, also known as the pale weasel, Altai weasel or solongoi, primarily lives in high-altitude environments in Asia.','In parts of China, there have been reports of these elusive weasels acting surprisingly friendly and appearing tame when encountering people in tents.','/Mustelids/mountain_weasel/assets/photo.webp','https://en.wikipedia.org/wiki/Mountain_weasel');
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
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`mustelid_id`) REFERENCES `Mustelids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Stats` VALUES
(663,1,'weight','0.5–1.8 kg'),
(664,1,'lifespan','5–8 years'),
(665,2,'weight','0.8 kg'),
(666,2,'lifespan','5–8 years'),
(667,3,'weight','7–11 kg'),
(668,3,'lifespan','4–10 years'),
(669,4,'weight','3.8–11 kg'),
(670,4,'lifespan','10 years'),
(671,5,'weight','2–6 kg'),
(672,5,'lifespan','7–10 years'),
(673,6,'weight','0.9–2.2 kg'),
(674,6,'lifespan','3–4 years'),
(675,7,'weight','7–17 kg'),
(676,7,'lifespan','15 years'),
(677,8,'weight','0.1–0.82 kg'),
(678,8,'lifespan','2–3 years'),
(679,9,'weight','0.7–2.0 kg'),
(680,9,'lifespan','3–5 years'),
(681,10,'weight','0.225 kg'),
(682,10,'lifespan','1–3 years'),
(683,11,'weight','22–34 kg'),
(684,11,'lifespan','8–13 years'),
(685,12,'weight','7–14 kg'),
(686,12,'lifespan','14–15 years (captivity)'),
(687,13,'weight','1–2 kg'),
(688,13,'lifespan','3–10 years'),
(689,14,'weight','1–1.5 kg'),
(690,14,'lifespan','8–12 years'),
(691,15,'weight','0.1–0.45 kg'),
(692,15,'lifespan','1–5 years'),
(693,16,'weight','0.7–2.0 kg'),
(694,16,'lifespan','4–7 years'),
(695,17,'weight','1.1–2.5 kg'),
(696,17,'lifespan','3–10 years'),
(697,18,'weight','0.1–0.15 kg'),
(698,18,'lifespan','< 2 years'),
(699,19,'weight','5–16 kg'),
(700,19,'lifespan','7–8 years'),
(701,20,'weight','1.2–5.7 kg'),
(702,20,'lifespan','7–10 years'),
(703,21,'weight','0.07–0.45 kg'),
(704,21,'lifespan','3–7 years'),
(705,22,'weight','14–45 kg'),
(706,22,'lifespan','10–15 years'),
(707,23,'weight','0.12–0.15 kg'),
(708,23,'lifespan','1–6 years'),
(709,24,'weight','3.5–9 kg'),
(710,24,'lifespan','5–10 years'),
(711,25,'weight','1–3 kg'),
(712,25,'lifespan','< 5 years'),
(713,26,'weight','0.025–0.18 kg'),
(714,26,'lifespan','1–2 years'),
(715,27,'weight','5–15 kg'),
(716,27,'lifespan','10–15 years'),
(717,28,'weight','0.025–0.1 kg'),
(718,28,'lifespan','< 1 year'),
(719,29,'weight','8–18 kg'),
(720,29,'lifespan','5–10 years'),
(721,30,'weight','1.5 kg'),
(722,30,'lifespan','3–4 years'),
(723,31,'weight','10–25 kg'),
(724,31,'lifespan','10–15 years'),
(725,32,'weight','2.1 kg'),
(726,32,'lifespan','12–15 years'),
(727,33,'weight','0.75–1.8 kg'),
(728,33,'lifespan','4–6 years'),
(729,34,'weight','3–6 kg'),
(730,34,'lifespan','8 years'),
(731,35,'weight','7–17 kg'),
(732,35,'lifespan','3–8 years'),
(733,36,'weight','0.3–0.7 kg'),
(734,36,'lifespan','8–12 years'),
(735,37,'weight','1.5–3.8 kg'),
(736,37,'lifespan','10–12 years'),
(737,38,'weight','0.36–0.82 kg'),
(738,38,'lifespan','2.1 years'),
(739,39,'weight','0.7–2.05 kg'),
(740,39,'lifespan','Up to 5 years'),
(741,40,'weight','1–3 kg'),
(742,40,'lifespan','< 10 years'),
(743,41,'weight','0.24–0.8 kg'),
(744,41,'lifespan','5–6 years'),
(745,42,'weight','0.5–1.6 kg'),
(746,42,'lifespan','12–17 years'),
(747,43,'weight','12–21 kg'),
(748,43,'lifespan','10–12 years'),
(749,44,'weight','0.7–1.8 kg'),
(750,44,'lifespan','Up to 18 years'),
(751,45,'weight','5–10 kg'),
(752,45,'lifespan','3–5 years'),
(753,46,'weight','0.5–0.9 kg'),
(754,46,'lifespan','6–10 years'),
(755,47,'weight','3–6 kg'),
(756,47,'lifespan','10–15 years'),
(757,48,'weight','5–14 kg'),
(758,48,'lifespan','8–13 years'),
(759,49,'weight','1–2 kg'),
(760,49,'lifespan','5–8 years'),
(761,50,'weight','2.7–8 kg'),
(762,50,'lifespan','Unknown (Wild)'),
(763,51,'weight','7–14 kg'),
(764,51,'lifespan','8–12 years'),
(765,52,'weight','< 2 kg'),
(766,52,'lifespan','< 10 years'),
(767,53,'weight','0.4–1.7 kg'),
(768,53,'lifespan','5–6 years'),
(769,54,'weight','0.6–1.4 kg'),
(770,54,'lifespan','1–4 years'),
(771,55,'weight','7–14 kg'),
(772,55,'lifespan','14 years (captivity)'),
(773,56,'weight','0.29–0.34 kg'),
(774,56,'lifespan','7–10 years'),
(775,57,'weight','7–12 kg'),
(776,57,'lifespan','3–4 years'),
(777,58,'weight','1–2.5 kg'),
(778,58,'lifespan','10+ years (captivity)'),
(779,59,'weight','4–12 kg'),
(780,59,'lifespan','4–10 years'),
(781,60,'weight','1–5.5 kg'),
(782,60,'lifespan','10–16 years'),
(783,61,'weight','1–3 kg'),
(784,61,'lifespan','< 10 years'),
(785,62,'weight','0.5–2.0 kg'),
(786,62,'lifespan','5–8 years'),
(787,63,'weight','0.23–0.38 kg'),
(788,63,'lifespan','5–6 years'),
(789,64,'weight','5–8 kg'),
(790,64,'lifespan','10–12 years'),
(791,65,'weight','0.12–0.35 kg'),
(792,65,'lifespan','7–10 years');
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

-- Dump completed on 2026-05-01 13:35:12
