-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ships
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `battles`
--
DROP TABLE IF EXISTS `capita`;

Create table capita(
	`idCapita` int(10) primary key,
	`Nom` varchar(20)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Insert into `capita` values(1, "Garfio"), (2, "Nemo"), (3, "BarbaNegra");


DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battles` (
  `name` varchar(20) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` VALUES ('Cuba62a','1962-10-20 00:00:00'),('Cuba62b','1962-10-25 00:00:00'),('Guadalcanal','1942-11-15 00:00:00'),('North Atlantic','1941-05-25 00:00:00'),('North Cape','1943-12-26 00:00:00'),('Surigao Strait','1944-10-25 00:00:00');
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class` varchar(50) NOT NULL,
  `type` varchar(2) NOT NULL,
  `country` varchar(20) NOT NULL,
  `numGuns` int DEFAULT NULL,
  `bore` decimal(10,2) DEFAULT NULL,
  `displacement` int DEFAULT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('Bismarck','bb','Germany',8,15.00,42000),('Iowa','bb','USA',9,16.00,46000),('Kongo','bc','Japan',8,14.00,32000),('North Carolina','bb','USA',12,16.00,37000),('Renown','bc','Gt.Britain',6,15.00,32000),('Revenge','bb','Gt.Britain',8,15.00,29000),('Tennessee','bb','USA',12,14.00,32000),('Yamato','bb','Japan',9,18.00,65000);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participa`
--

DROP TABLE IF EXISTS `participa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa` (
  `ship` varchar(50) NOT NULL,
  `battle` varchar(50) NOT NULL,
  `result` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ship`,`battle`),
  KEY `battle` (`battle`),
  CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`ship`) REFERENCES `ships` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`battle`) REFERENCES `battles` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa`
--

LOCK TABLES `participa` WRITE;
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` VALUES ('California','Guadalcanal','damaged'),('California','Surigao Strait','OK'),('Kirishima','Guadalcanal','sunk'),('Missouri','North Atlantic','damaged'),('Musashi','Surigao Strait','sunk'),('North Carolina','North Atlantic','sunk'),('Ramillies','North Atlantic','OK'),('Resolution','North Atlantic','OK'),('Revenge','North Atlantic','OK'),('Revenge','North Cape','OK'),('Revenge','Surigao Strait','sunk'),('South Dakota','Guadalcanal','damaged'),('South Dakota','North Cape','sunk'),('Tennessee','Surigao Strait','OK'),('Washington','Guadalcanal','OK'),('Yamato','Surigao Strait','OK');
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ships` (
  `name` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `launched` int DEFAULT NULL,
  `capita` int(10),
  PRIMARY KEY (`name`),
  KEY `class` (`class`),
  CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`class`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ships_ibfk_2` FOREIGN KEY (`capita`) REFERENCES `capita` (`idCapita`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships`(name,class,launched, capita) VALUES ('California','Tennessee',1921, 1),('Haruna','Kongo',1916, 2),('Hiei','Kongo',1914, 1),('Iowa','Iowa',1943, 3),('Kirishima','Kongo',1915, 1),('Kongo','Kongo',1913, 2),('Missouri','Iowa',1944, 3),('Musashi','Yamato',1942, 2),('New Jersey','Iowa',1943, 1),('North Carolina','North Carolina',1941, 3),('Ramillies','Revenge',1917, 2),('Renown','Renown',1916, 1),('Repulse','Renown',1916, 3),('Resolution','Renown',1916, 2),('Revenge','Revenge',1916, 1),('Royal Oak','Revenge',1916, 3),('Royal Sovereign','Revenge',1916, 1),('South Dakota','North Carolina',1941, 2),('Tennessee','Tennessee',1920, 3),('Washington','North Carolina',1941, 1),('Wisconsin','Iowa',1944, 2),('Yamato','Yamato',1941, 2);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14  9:26:07
