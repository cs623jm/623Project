-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: 623jm
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned`
--

DROP TABLE IF EXISTS `assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assigned` (
  `paper_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  KEY `paper_id` (`paper_id`),
  KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `assigned_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `assigned_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned`
--

LOCK TABLES `assigned` WRITE;
/*!40000 ALTER TABLE `assigned` DISABLE KEYS */;
INSERT INTO `assigned` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(1,2),(3,2),(6,2),(2,3),(4,3),(5,3);
/*!40000 ALTER TABLE `assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `EmailAddr` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'StevenKing@pace.edu','Stephen','King'),(2,'JKRowling@pace.edu','Joanne','Rowling'),(3,'DrSeuss@pace.edu','Theodor','Seuss');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `abstract` varchar(600) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`paper_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,'Pet Sematary','After tragedy strikes, a grieving father discovers an ancient burial ground behind his home with the power to raise the dead.','PET_Sematary.doc',1),(2,'IT','In 1960, seven preteen outcasts fight an evil demon that poses as a child-killing clown. Thirty years later, they reunite to stop the demon once and for all when it returns to their hometown.','IT.doc',1),(3,'Harry Potter and the Sorcerer\'s Stone','An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.','HarryPotter_Book1.doc',2),(4,'Harry Potter, Chamber of Secrets','An ancient prophecy seems to be coming true when a mysterious presence begins stalking the corridors of a school of magic and leaving its victims paralyzed.','HarryPotter_book2.doc',2),(5,'Cat In The Hat','The story centers on a tall anthropomorphic cat, who wears a red and white-striped hat and a red bow tie. ','CatInHat.doc',3),(6,'Green Eggs and Ham','Sam-I-Am, trying to convince the narrator to try green eggs and ham. He spends most of the book, offering the unnamed character different locations and dining partners to try the delicacy.','GreenEggs.doc',3);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `recommendation` varchar(1000) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `MeritScore` int(11) DEFAULT NULL,
  `PaperId` int(11) DEFAULT NULL,
  `ReadabilityScore` int(11) DEFAULT NULL,
  `Reviewer_id` int(11) DEFAULT NULL,
  `OriginalityScore` int(11) DEFAULT NULL,
  `RelevanceScorce` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Reviewer_id`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('would read again 10/10',1,8,1,7,1,10,6),('Highly Recommend 10/10',2,9,2,10,1,10,9),('7/10',3,6,3,8,1,7,6),('5/10 not my type',4,4,4,10,1,5,3),('3/10 too childish',5,3,5,10,1,3,2),('Great with the kids 8/10',6,10,6,10,1,8,9),('Scary, chill to the bone 10/10',7,10,1,10,2,10,10),('My favorite 10/10',8,10,3,10,2,10,10),('1/10 too easy of a read',9,1,6,10,2,4,3),('9/10 very enjoyable read',10,9,2,10,3,8,9),('8/10 another rare read',11,8,4,10,3,10,9),('10/10 childhood favorite',12,10,5,10,3,10,10);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviewer` (
  `EmailAddr` varchar(50) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `PhoneNum` varchar(20) DEFAULT NULL,
  `Affiliation` varchar(20) DEFAULT NULL,
  `AuthorFeedback` varchar(100) DEFAULT NULL,
  `CommiteeFeedback` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmailAddr` (`EmailAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES ('StevenHScully@armyspy.com','Steven','Scully','740-402-3906','Soft Warehouse','','',1),('LindaSParrish@dayrep.com','Linda','Parrish','269-626-6631','White Hen Pantry','','',2),('DianneDDunn@armyspy.com','Dianne','Dunn','202-347-8409','Expo Superstore','','',3);
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `topic` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TopicName` varchar(255) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'fiction',1),(2,'children books',1),(3,'children books',3),(4,'horror',2),(6,'non-fiction',3);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 12:24:29
