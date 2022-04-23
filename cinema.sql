-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cashs`
--

DROP TABLE IF EXISTS `cashs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashs` (
  `id_cash_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `id_payment_method` int(11) NOT NULL,
  PRIMARY KEY (`id_cash_transaction`),
  KEY `id_payment_method` (`id_payment_method`),
  CONSTRAINT `cashs_ibfk_1` FOREIGN KEY (`id_payment_method`) REFERENCES `paymentmethods` (`id_payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashs`
--

LOCK TABLES `cashs` WRITE;
/*!40000 ALTER TABLE `cashs` DISABLE KEYS */;
INSERT INTO `cashs` VALUES
(1,3),
(2,3),
(3,3);
/*!40000 ALTER TABLE `cashs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checks`
--

DROP TABLE IF EXISTS `checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checks` (
  `id_check` int(11) NOT NULL AUTO_INCREMENT,
  `check_numbers` char(7) NOT NULL,
  `owner_name` varchar(40) NOT NULL,
  `owner_firs_name` varchar(40) NOT NULL,
  `bank_name` varchar(40) NOT NULL,
  `id_payment_method` int(11) NOT NULL,
  PRIMARY KEY (`id_check`),
  KEY `id_payment_method` (`id_payment_method`),
  CONSTRAINT `checks_ibfk_1` FOREIGN KEY (`id_payment_method`) REFERENCES `paymentmethods` (`id_payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checks`
--

LOCK TABLES `checks` WRITE;
/*!40000 ALTER TABLE `checks` DISABLE KEYS */;
INSERT INTO `checks` VALUES
(1,'1234567','Petit','Maurice','Le cr?dit femrier',2),
(2,'7419635','Riche','Catherine','Banque peu populaire',2),
(3,'0005588','Jackson','Michael','Caisse des d?penses',2);
/*!40000 ALTER TABLE `checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinemas` (
  `id_cinema` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone_number` char(10) DEFAULT NULL,
  `id_manager` char(36) NOT NULL,
  PRIMARY KEY (`id_cinema`),
  KEY `id_manager` (`id_manager`),
  CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `managers` (`id_manager`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES
(1,'Pat? Gaumard La Garde','Avenue de la Vallette 83','0436982510','9abb8f1e-c0a2-11ec-8c1f-b06ebf4e64de'),
(2,'Pat? Gaumard Centre Hy?res','Avenue Gambetta Hy?res 83','0436981414','9abd4649-c0a2-11ec-8c1f-b06ebf4e64de'),
(3,'Pat? Gaumard du Port','Port de Gassin 83','0436986998','9dde2a93-c0a2-11ec-8c1f-b06ebf4e64de');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcards` (
  `id_credit_card` int(11) NOT NULL AUTO_INCREMENT,
  `card_numbers` char(16) NOT NULL,
  `expiration_date` date NOT NULL,
  `cryptogram` char(3) NOT NULL,
  `id_payment_method` int(11) NOT NULL,
  PRIMARY KEY (`id_credit_card`),
  KEY `id_payment_method` (`id_payment_method`),
  CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`id_payment_method`) REFERENCES `paymentmethods` (`id_payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES
(1,'8456396512357541','2024-02-01','111',1),
(2,'5555444466662222','2023-08-01','123',1),
(3,'7419236582640000','2022-05-01','088',1);
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id_manager` char(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `manager_email` varchar(254) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_manager`),
  UNIQUE KEY `manager_email` (`manager_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES
('9abb8f1e-c0a2-11ec-8c1f-b06ebf4e64de','Pinier','Nicolas','nicolas_manager@gmail.com','$2y$10$JWMzNsW2dS3cmaY9Y3wjcOEN079DComazD/dHDUcSN90hZY63jojK'),
('9abd4649-c0a2-11ec-8c1f-b06ebf4e64de','Beauvarie','Simone','simone_manager@gmail.com','$2y$10$v09emFzXDxqjRpr3ywY0sOJ5y6EwnJ2kM2g0Lk0G0niHaHYyFVgnu'),
('9dde2a93-c0a2-11ec-8c1f-b06ebf4e64de','Mackie','Paul','paul_manager@gmail.com','$2y$10$6DK9/F5cx3z5u7q3WtfS7OPV6QrPXk.As2.JPYec.KorWkSMDb3Hu');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(50) NOT NULL,
  `duration` varchar(4) DEFAULT NULL,
  `id_session` int(11) NOT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `id_session` (`id_session`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id_session`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES
(1,'Les animaux classiques','2h26',1),
(2,'Les animaux classiques','2h26',2),
(3,'007 Bi?re blonde','3h14',3),
(4,'Les animaux classiques','2h26',4),
(5,'Arthur et la vie normale','1h58',5),
(6,'007 Bi?re blonde','3h14',6),
(7,'Les animaux classiques','2h26',7),
(8,'Les animaux classiques','2h26',8),
(9,'007 Bi?re blonde','3h14',9);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineorders`
--

DROP TABLE IF EXISTS `onlineorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineorders` (
  `user_email` varchar(254) NOT NULL,
  `id_order` char(36) NOT NULL,
  PRIMARY KEY (`user_email`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `onlineorders_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineorders`
--

LOCK TABLES `onlineorders` WRITE;
/*!40000 ALTER TABLE `onlineorders` DISABLE KEYS */;
INSERT INTO `onlineorders` VALUES
('didier52@mail.fr','52134fb9-c0a3-11ec-8c1f-b06ebf4e64de'),
('polo_cine@hotmail.fr','5216b8e4-c0a3-11ec-8c1f-b06ebf4e64de'),
('julie.morine@gmail.fr','5217a5e5-c0a3-11ec-8c1f-b06ebf4e64de');
/*!40000 ALTER TABLE `onlineorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id_order` char(36) NOT NULL,
  `amount` float NOT NULL,
  `status` tinyint(1) NOT NULL,
  `order_date` date NOT NULL,
  `id_payment_method` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_payment_method` (`id_payment_method`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_payment_method`) REFERENCES `paymentmethods` (`id_payment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
('52134fb9-c0a3-11ec-8c1f-b06ebf4e64de',26,1,'2022-04-20',1),
('5214ce61-c0a3-11ec-8c1f-b06ebf4e64de',38,1,'2022-04-20',3),
('52159faf-c0a3-11ec-8c1f-b06ebf4e64de',82.8,0,'2022-04-20',2),
('5216b8e4-c0a3-11ec-8c1f-b06ebf4e64de',18.4,1,'2022-04-20',1),
('5217a5e5-c0a3-11ec-8c1f-b06ebf4e64de',24.3,0,'2022-04-20',1),
('521a06d9-c0a3-11ec-8c1f-b06ebf4e64de',21,1,'2022-04-20',3),
('521c7f23-c0a3-11ec-8c1f-b06ebf4e64de',9.2,0,'2022-04-20',2),
('521f01af-c0a3-11ec-8c1f-b06ebf4e64de',15.2,1,'2022-04-20',3),
('54fca35b-c0a3-11ec-8c1f-b06ebf4e64de',85.2,1,'2022-04-20',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethods` (
  `id_payment_method` int(11) NOT NULL,
  `payment_method_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_payment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
INSERT INTO `paymentmethods` VALUES
(1,'Carte bancaire'),
(2,'Ch?que'),
(3,'?sp?ces');
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id_rate` int(11) NOT NULL,
  `rate_name` varchar(20) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id_rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES
(1,'Plein tarif',9.2),
(2,'?tudiant',7.6),
(3,'Moins de 14 ans',5.9);
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id_session` int(11) NOT NULL AUTO_INCREMENT,
  `places` int(11) NOT NULL,
  `session_date` datetime NOT NULL,
  `theatre_number` varchar(3) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinemas` (`id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
(1,200,'2022-05-10 11:00:00','A01',1),
(2,250,'2022-05-11 21:00:00','A02',1),
(3,180,'2022-05-14 15:00:00','A03',1),
(4,200,'2022-05-10 11:00:00','B01',2),
(5,250,'2022-05-11 21:00:00','B02',2),
(6,180,'2022-05-14 15:00:00','B03',2),
(7,200,'2022-05-10 11:00:00','C01',3),
(8,250,'2022-05-11 21:00:00','C02',3),
(9,180,'2022-05-14 15:00:00','C03',3);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id_ticket` char(36) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `id_rate` int(11) NOT NULL,
  `id_order` char(36) NOT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `id_cinema` (`id_cinema`),
  KEY `id_session` (`id_session`),
  KEY `id_movie` (`id_movie`),
  KEY `id_rate` (`id_rate`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinemas` (`id_cinema`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id_session`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`id_rate`) REFERENCES `rates` (`id_rate`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES
('532500c7-c0a5-11ec-8c1f-b06ebf4e64de',1,2,1,1,'52134fb9-c0a3-11ec-8c1f-b06ebf4e64de'),
('532502cb-c0a5-11ec-8c1f-b06ebf4e64de',1,2,1,1,'52134fb9-c0a3-11ec-8c1f-b06ebf4e64de'),
('5325041c-c0a5-11ec-8c1f-b06ebf4e64de',1,2,1,2,'52134fb9-c0a3-11ec-8c1f-b06ebf4e64de'),
('53285cbf-c0a5-11ec-8c1f-b06ebf4e64de',2,3,6,2,'5214ce61-c0a3-11ec-8c1f-b06ebf4e64de'),
('53285eb7-c0a5-11ec-8c1f-b06ebf4e64de',2,3,6,2,'5214ce61-c0a3-11ec-8c1f-b06ebf4e64de'),
('53285f92-c0a5-11ec-8c1f-b06ebf4e64de',2,3,6,2,'5214ce61-c0a3-11ec-8c1f-b06ebf4e64de'),
('5328601c-c0a5-11ec-8c1f-b06ebf4e64de',2,3,6,2,'5214ce61-c0a3-11ec-8c1f-b06ebf4e64de'),
('53286098-c0a5-11ec-8c1f-b06ebf4e64de',2,3,6,2,'5214ce61-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d5481-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d5738-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d57d4-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d5852-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d58cb-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d593d-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d59a8-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d5a12-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532d5a7e-c0a5-11ec-8c1f-b06ebf4e64de',3,8,8,1,'52159faf-c0a3-11ec-8c1f-b06ebf4e64de'),
('532f1a08-c0a5-11ec-8c1f-b06ebf4e64de',1,3,3,1,'5216b8e4-c0a3-11ec-8c1f-b06ebf4e64de'),
('532f1be2-c0a5-11ec-8c1f-b06ebf4e64de',1,3,3,1,'5216b8e4-c0a3-11ec-8c1f-b06ebf4e64de'),
('53317d4c-c0a5-11ec-8c1f-b06ebf4e64de',2,5,5,1,'5217a5e5-c0a3-11ec-8c1f-b06ebf4e64de'),
('53317f56-c0a5-11ec-8c1f-b06ebf4e64de',2,5,5,1,'5217a5e5-c0a3-11ec-8c1f-b06ebf4e64de'),
('53317ff2-c0a5-11ec-8c1f-b06ebf4e64de',2,5,5,3,'5217a5e5-c0a3-11ec-8c1f-b06ebf4e64de'),
('533331cf-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,1,'521a06d9-c0a3-11ec-8c1f-b06ebf4e64de'),
('533468da-c0a5-11ec-8c1f-b06ebf4e64de',1,1,1,2,'521f01af-c0a3-11ec-8c1f-b06ebf4e64de'),
('53346adf-c0a5-11ec-8c1f-b06ebf4e64de',1,1,1,2,'521f01af-c0a3-11ec-8c1f-b06ebf4e64de'),
('54667dd3-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,1,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('54667fa4-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('54668038-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('546680b5-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('54668127-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('54668198-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('546681fd-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('5466825d-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de'),
('546682bb-c0a5-11ec-8c1f-b06ebf4e64de',3,7,7,3,'54fca35b-c0a3-11ec-8c1f-b06ebf4e64de');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 17:44:52
