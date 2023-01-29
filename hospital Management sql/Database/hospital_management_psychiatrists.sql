CREATE DATABASE  IF NOT EXISTS `hospital_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_management`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `psychiatrists`
--

DROP TABLE IF EXISTS `psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrists` (
  `PsychiatristId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `HospitalId` int NOT NULL,
  PRIMARY KEY (`PsychiatristId`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `registered_patient` (`Name`,`PhoneNumber`,`PsychiatristId`),
  KEY `HospitalId` (`HospitalId`),
  CONSTRAINT `psychiatrists_ibfk_1` FOREIGN KEY (`HospitalId`) REFERENCES `hospitals` (`HospitalId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrists`
--

LOCK TABLES `psychiatrists` WRITE;
/*!40000 ALTER TABLE `psychiatrists` DISABLE KEYS */;
INSERT INTO `psychiatrists` VALUES (1,'Psychiatrist3','Psychiatrist3@gmail.com','XXXXXXXXXX',1),(2,'Psychiatrist1','Psychiatrist1@gmail.com','XXXXXXXXXX',1),(3,'Psychiatrist10','Psychiatrist10@gmail.com','XXXXXXXXXX',1),(4,'Psychiatrist2','Psychiatrist2@gmail.com','XXXXXXXXXX',1),(5,'Psychiatrist4','Psychiatrist4@gmail.com','XXXXXXXXXX',2),(6,'Psychiatrist5','Psychiatrist5@gmail.com','XXXXXXXXXX',2),(7,'Psychiatrist6','Psychiatrist6@gmail.com','XXXXXXXXXX',2),(8,'Psychiatrist7','Psychiatrist7@gmail.com','XXXXXXXXXX',2),(9,'Psychiatrist8','Psychiatrist8@gmail.com','XXXXXXXXXX',2),(10,'Psychiatrist9','Psychiatrist9@gmail.com','XXXXXXXXXX',1),(11,'Psychiatrist11','Psychiatrist11@gmail.com','XXXXXXXXXX',3),(12,'Psychiatrist12','Psychiatrist12@gmail.com','XXXXXXXXXX',3),(13,'Psychiatrist13','Psychiatrist13@gmail.com','XXXXXXXXXX',3),(14,'Psychiatrist14','Psychiatrist14@gmail.com','XXXXXXXXXX',3),(15,'Psychiatrist15','Psychiatrist15@gmail.com','XXXXXXXXXX',3),(16,'Psychiatrist16','Psychiatrist16@gmail.com','XXXXXXXXXX',4),(17,'Psychiatrist17','Psychiatrist17@gmail.com','XXXXXXXXXX',4),(18,'Psychiatrist18','Psychiatrist18@gmail.com','XXXXXXXXXX',4),(19,'Psychiatrist19','Psychiatrist19@gmail.com','XXXXXXXXXX',4),(20,'Psychiatrist20','Psychiatrist20@gmail.com','XXXXXXXXXX',4),(21,'test-psychiatrist','test-psychiatrist@gmail.com','XXXXXXXXXXX',4);
/*!40000 ALTER TABLE `psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 15:38:01
