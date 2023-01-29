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
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Password` char(100) NOT NULL,
  `Photo` varchar(50) DEFAULT 'default.jpg',
  `PsychiatristId` int DEFAULT NULL,
  PRIMARY KEY (`PatientId`),
  UNIQUE KEY `registered_patient` (`Name`,`PhoneNumber`,`PsychiatristId`),
  KEY `PsychiatristId` (`PsychiatristId`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`PsychiatristId`) REFERENCES `psychiatrists` (`PsychiatristId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (5,'patient1','patient1@gmail.com','India,uttarakhand','+11111111111','$2a$12$y3GYYaIpfpV9ZTP/FY1W5uSphlxlhepqVyxIMPLAXNx3A36gDjchO','patient-+11111111111-1674984044561.jpeg',1),(8,'patient4','patient4@gmail.com','India,uttarakhand','+11111111100','$2a$12$w4Xno0J78x9GRqIleN27auKhN3sBnxRQtQL5.1p.v.jjzI6zFULte','default.jpg',2),(9,'patient5','patient5@gmail.com','India,uttarakhand','+11111111111','$2a$12$y30o6D9JZS80OI5XWLXPq.k0VyzvW1twTcbMaJAStEfGR/cslK7vG','default.jpg',2),(10,'patient6','patient6@gmail.com','India,uttarakhand','+11111111111','$2a$12$rAUeiq8eUnBi0ieYipOfKO.DXKN5UhlXfjmB4K8OycuoR6v6ExFvm','default.jpg',3),(11,'patient7','patient7@gmail.com','India,uttarakhand','+11111111111','$2a$12$sbK.J3slRJmnKhVInc/7l.d.AeipaAv26eeR1MhMyoEqp4zpeWFrK','default.jpg',4),(12,'patient8','patient8@gmail.com','India,uttarakhand','+11111111111','$2a$12$OD8A7NqZjqS85sEQlZC2ZOR4tKRj5WKYD3m62ikPDdl8WA/bW/bgi','default.jpg',4),(13,'patient9','patient9@gmail.com','India,uttarakhand','+11111111111','$2a$12$9DUObDXTbBr8a6QNxCye1.hViDizaax6mig6zDCC.EdJTw/E/9E4m','default.jpg',4),(14,'patient10','patient10@gmail.com','India,uttarakhand','+11111111111','$2a$12$5Yx1FqDkoQBEvNhfKHsivu6vtSOaUQwZnk.U1BBnhqIvz6k10hS1i','default.jpg',5),(15,'patient11','patient11@gmail.com','India,uttarakhand','+11111111111','$2a$12$xtcokXJ57kTxYTp5q5xn4.Ay0FrzgHgbQFRVgQuH5IReuWZWw84am','default.jpg',5),(16,'patient12','patient12@gmail.com','India,uttarakhand','+11111111111','$2a$12$wjzSqidt/hM84os3xnZm..yn0R1WwNMPxsWbkacuxr7lizYaC4MPC','default.jpg',6),(17,'patient13','patient13@gmail.com','India,uttarakhand','+11111111111','$2a$12$T5UkVVRpGrdHT4D5LCHweulB95Nyi4VvtXJyR8KaQ.9KvJ2wyrnQG','default.jpg',6),(18,'patient17','patient17@gmail.com','India,uttarakhand','+11111111111','$2a$12$F.hcGEH7ZRADhvpV4j9lCOQYUMfbmd5fdPxLvZDjub9xfX95yOKKa','default.jpg',7),(19,'patient18','patient18@gmail.com','India,uttarakhand','+11111111111','$2a$12$ftKTeHdIdOKP3WTiw9holed4VzbS1r8z7ZkstZKOeSSsbKy/hhj1y','default.jpg',8),(20,'patient19','patient19@gmail.com','India,uttarakhand','+11111111111','$2a$12$sUTTpeyqIunnkzHMPvfGgO.E6puF0AKlN9ApgeSeKwQtfYbxCX/ki','default.jpg',8),(21,'patient20','patient20@gmail.com','India,uttarakhand','+11111111111','$2a$12$/AWg93UCH9WwcleRHBvmMOnBJIVyIp7sKKNrT2sZ.ln2UhHGeQB6q','default.jpg',8),(22,'patient21','patient21@gmail.com','India,uttarakhand','+11111111111','$2a$12$cNiMuXCWmSyshXepFk7SYOq5cD19KhXX1CrX8YKh3NU/byRBpnPXy','default.jpg',8),(23,'patient22','patient22@gmail.com','India,uttarakhand','+11111111111','$2a$12$wmq2S9Mbe2anMo6WOZaWA.zl9H7aE0IqBG/9qBTZQp2nfU///61vS','default.jpg',8),(24,'patient23','patient23@gmail.com','India,uttarakhand','+11111111111','$2a$12$/UDy4BFolcHpwXsEB2tpEeDLrvobNjkM9EtEFUO6/A8pnotgkc852','default.jpg',8),(25,'patient24','patient24@gmail.com','India,uttarakhand','+11111111111','$2a$12$/61Yll.iya6XAE6uTl3otudsHGs0E3tiIPycvQHhZ5yGKYt/80.k2','default.jpg',10),(26,'patient25','patient25@gmail.com','India,uttarakhand','+11111111111','$2a$12$8C9MX270MiUoV8AHy89o3u/Tpkz/Hus4giTOa/B3zDv2AeF6h8eI2','default.jpg',10),(27,'patient26','patient26@gmail.com','India,uttarakhand','+11111111111','$2a$12$L4eLbMVJ32urIw0N4SrvFO82xECdEGbpJUOaSjgeVrZG.AJPRw7MK','default.jpg',11),(28,'patient27','patient27@gmail.com','India,uttarakhand','+11111111111','$2a$12$QEo8qNhVjNMpqGTHywAQNuvL18RLbN1oOe.zoj8mqdf7ZuQo1qBaC','default.jpg',12),(29,'patient28','patient28@gmail.com','India,uttarakhand','+11111111111','$2a$12$e04VnYgDfZCaTrcjtNFpwOec/DPJxYoAkKBnlSjpE0hktrhdb69kq','default.jpg',12),(30,'patient29','patient29@gmail.com','India,uttarakhand','+11111111111','$2a$12$u0UINKatFm1PcNFJH9HbiernyRGPSZNMWD/tj6j8A7uf8ek3WpEme','default.jpg',12),(31,'patient30','patient30@gmail.com','India,uttarakhand','+11111111111','$2a$12$Ww.elxb42YgVthkoWp1dYuyGS4WYyzUsyzdR.ORkYY26xcv62mdXe','default.jpg',14),(32,'patient31','patient31@gmail.com','India,uttarakhand','+11111111111','$2a$12$jfxAyvjS/lBeZrckIe9DX.MKewEsTuSb7vtYgAcaRgAcc8vJj7S0y','default.jpg',15),(33,'patient32','patient32@gmail.com','India,uttarakhand','+11111111111','$2a$12$n1M9Pj3lcZLY4Iw/uaxGmenG18gsUe27PzwrEbHOY1tY8Dw3sidVi','default.jpg',16),(34,'patient33','patient33@gmail.com','India,uttarakhand','+11111111111','$2a$12$H3p8/NlE8rLW7UUg4ItjquiP2aOWHR.EZpjxq5J0IIIHS7zDAdUyW','default.jpg',18),(35,'patient34','patient34@gmail.com','India,uttarakhand','+11111111111','$2a$12$66tR.5eCcWpgu1R92tpyjOyGcZHDWeIZsx0JyW.6jpX49qwVWZhx2','default.jpg',18),(36,'patient35','patient35@gmail.com','India,uttarakhand','+11111111111','$2a$12$c2q34RrjWR3I5VReLPppXOdCm4CFTyZ0OK8TGwLQBf47nnfGnRgzu','default.jpg',18),(37,'patient36','patient36@gmail.com','India,uttarakhand','+11111111111','$2a$12$/gbogy9YNNc.zbaR9Qm/C.IPNZSCLVJZ0O71wA58vZhf7X1USd7By','default.jpg',18),(38,'patient37','patient37@gmail.com','India,uttarakhand','+11111111111','$2a$12$H0eaMlja8hAn9v5Zk0fPIOFwgC5zOinl8lLkKJzjRTfnnnr.egQCG','default.jpg',19),(39,'patient38','patient38@gmail.com','India,uttarakhand','+11111111111','$2a$12$ZelvuYRcvT1w.uPLvGyW1.5Y0trd0ShXzb.JseVkZO1MfShOqStia','default.jpg',19),(40,'patient39','patient39@gmail.com','India,uttarakhand','+11111111111','$2a$12$jUjyFP8jxV/ZlQw4T52T7u2ssLedLmyCkhu5ZFfGUaSVXJ6rgI2N.','default.jpg',19),(41,'patient40','patient40@gmail.com','India,uttarakhand','+11111111111','$2a$12$tIFnmHitSpUomMFffjTdyeV1gIUSQYTOlNBD5ny8Ra0z/j5RVBuE2','default.jpg',20),(42,'patient41','patient41@gmail.com','India,uttarakhand','+11111111111','$2a$12$QkxfIRc5POp3WflMkcpmzOs2IZ9YRMiS1TahbOTOV2mitKTgDl/t2','patient-+11111111111-1674984868324.jpeg',20),(47,'patient42','patient42@gmail.com','India,uttarakhand','+11111111111','$2a$12$xwty9eDiX//i48FXJq68HeiKbIB7rsEzL6iOrhIsl3AVMgXAAs/dS','default.jpg',20),(48,'patient43','patient43@gmail.com','India,uttarakhand','+11111111111','$2a$12$rj59UtJWa.yxgBUbKrczO.0wHiMD4CPKSjiSmAz7nGH9/iK2/T2ua','default.jpg',19),(49,'patient44','patient44@gmail.com','India,uttarakhand','+11111111111','$2a$12$vR516nfgzWeDBtPev4Y.ee/z9NxUxnOa8ti2f4jvPr5KL6k3pbXv6','patient-+11111111111-1674986265943.jpeg',13),(50,'patient45','patient45@gmail.com','India,uttarakhand','+11111111111','$2a$12$1UJVE3B.qWpqAIHwZ.Fp3OXtyX0BsUVrp5jIpRiKy09I0.RHNZ9rS','patient-+11111111111-1674986287510.jpeg',13);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
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
