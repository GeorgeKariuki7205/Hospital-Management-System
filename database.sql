-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: monaowano
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `admin_details`
--

DROP TABLE IF EXISTS `admin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_details` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `SurName` varchar(20) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Residence` varchar(200) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `admin_details_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_details` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_details`
--

LOCK TABLES `admin_details` WRITE;
/*!40000 ALTER TABLE `admin_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_verification`
--

DROP TABLE IF EXISTS `admin_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_verification` (
  `dv_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`dv_id`),
  UNIQUE KEY `username` (`username`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_verification_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_details` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_verification`
--

LOCK TABLES `admin_verification` WRITE;
/*!40000 ALTER TABLE `admin_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_availability`
--

DROP TABLE IF EXISTS `appointment_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_availability` (
  `availability_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `Availability_Date` date DEFAULT NULL,
  PRIMARY KEY (`availability_id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `appointment_availability_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor_details` (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_availability`
--

LOCK TABLES `appointment_availability` WRITE;
/*!40000 ALTER TABLE `appointment_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments_booked`
--

DROP TABLE IF EXISTS `appointments_booked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments_booked` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `appointmant_date` date NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `doc_id` (`doc_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `appointments_booked_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor_details` (`doc_id`),
  CONSTRAINT `appointments_booked_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments_booked`
--

LOCK TABLES `appointments_booked` WRITE;
/*!40000 ALTER TABLE `appointments_booked` DISABLE KEYS */;
INSERT INTO `appointments_booked` VALUES (1,1,28,'12am','2011-05-05'),(2,2,29,'12am','2011-05-05');
/*!40000 ALTER TABLE `appointments_booked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_details`
--

DROP TABLE IF EXISTS `doctor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_details` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Residence` varchar(200) NOT NULL,
  `Specialisation` varchar(20) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_details`
--

LOCK TABLES `doctor_details` WRITE;
/*!40000 ALTER TABLE `doctor_details` DISABLE KEYS */;
INSERT INTO `doctor_details` VALUES (1,'George','Kariuki','Ngugi','2011-05-08',125445,'emisjjs@gmail.com','Kiambu','Oncology'),(2,'Maty','Mboge','Loko','1997-08-08',15854,'yhdhdhd@gmail.com','Naks','Serology');
/*!40000 ALTER TABLE `doctor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_verification`
--

DROP TABLE IF EXISTS `doctor_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_verification` (
  `dv_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `doc_id` int(11) NOT NULL,
  PRIMARY KEY (`dv_id`),
  UNIQUE KEY `username` (`username`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `doctor_verification_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor_details` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_verification`
--

LOCK TABLES `doctor_verification` WRITE;
/*!40000 ALTER TABLE `doctor_verification` DISABLE KEYS */;
INSERT INTO `doctor_verification` VALUES (1,'name','1010',1),(2,'doc@gmail.com','120120120',1),(3,'doc2@gmail.com','120120120',2);
/*!40000 ALTER TABLE `doctor_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_details`
--

DROP TABLE IF EXISTS `hospital_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_details` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_details`
--

LOCK TABLES `hospital_details` WRITE;
/*!40000 ALTER TABLE `hospital_details` DISABLE KEYS */;
INSERT INTO `hospital_details` VALUES (1,'Kiambu Hospital',4,'Kiambu Town');
/*!40000 ALTER TABLE `hospital_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_details` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `SurName` varchar(20) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Residence` varchar(200) NOT NULL,
  `birthCertificateNumber` int(20) NOT NULL,
  `kraNumber` int(20) NOT NULL,
  `NhifNumber` int(20) NOT NULL,
  `callTime` varchar(100) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_details`
--

LOCK TABLES `patient_details` WRITE;
/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
INSERT INTO `patient_details` VALUES (1,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(2,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(3,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(4,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(5,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(6,'George','Kariuki','Ngugi',1278,'georgekariukingugi@gmail.com','kianbi',1212,1212,121,'Morning','2019-02-14'),(7,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(8,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(9,'hfhjfjf','hfjfjfj','hfjfjfj',121221,'122hfjfhfjjf','hfjjf',1212,1212,121,'Morning','2019-02-05'),(10,'George','Kariuki','Ngugi',78547854,'chegejohn159@gmail.com','kiku',1212,1212,131,'Morning','2019-02-15'),(11,'George','Kariuki','Ngugi',701020109,'georgekariukingugi@gmail.com','fjfjfj',10100000,101,10,'Morning','2019-02-13'),(12,'George','Kariuki','Ngugi',701020109,'georgekariukingugi@gmail.com','fjfjfj',10100000,101,10,'Morning','2019-02-13'),(13,'George','Kariuki','Ngugi',701020109,'georgekariukingugi@gmail.com','fjfjfj',10100000,101,10,'Morning','2019-02-13'),(14,'daniel','Demba','Odhiambo',792107437,'daniel@gmail.com','seme',1212,1212,121,'Morning','2019-02-14'),(15,'Mary','Kilobi','Monare',792107437,'kilobi@gmail.com','',1010,1010,101,'Morning','1970-06-17'),(16,'Joseph','Ngugi','Kariuki',78547854,'chegejohn159@gmail.com','popop',1212,101,101,'Morning','2019-02-08'),(17,'name','name','name',792107437,'chegejohn159@gmail.com','',101,321,101,'Morning','2019-02-20'),(18,'George','Demba','Odhiambo',8575,'kenruthi409@gmail.com','seme',1212,1010,321,'Morning','2019-02-06'),(19,'George','Demba','Odhiambo',8575,'kenruthi409@gmail.com','seme',1212,1010,321,'Morning','2019-02-06'),(20,'Mona','akinyi','Owano',1278,'chegejohn159@gmail.com','01201682',1201682,1201682,101,'Morning','2019-02-07'),(21,'Mona','akinyi','Owano',1278,'chegejohn159@gmail.com','01201682',1201682,1201682,101,'Morning','2019-02-07'),(22,'Sally','Nyiwende','Oketch',8575,'nyiwende@gmail.com','kianbi',1201682,252525,121,'Morning','2019-02-13'),(23,'SSS','SSS','SSS',792107437,'ngugigeorge697@gmail.com','',1212,121221,121,'Morning','2019-02-07'),(24,'John','Chege','Kamau',78547854,'chegejohn159@gmail.com','Limuru',9898,9898,989,'Morning','2019-01-31'),(25,'Bendetta','Muluyu','Kavere',78547854,'named@gmail.com','Limuru',1212,1212,121,'Morning','2019-02-13'),(26,'Bendetta','Muluyu','Kavere',78547854,'named@gmail.com','Limuru',1212,1212,121,'Morning','2019-02-13'),(27,'Bendetta','Muluyu','Kavere',78547854,'named@gmail.com','Limuru',1212,1212,121,'Morning','2019-02-13'),(28,'Menye','Menye','Menye',78547854,'georgekariukingugi@gmail.com','lolo',12125,12125,121,'Morning','2019-02-01'),(29,'Bearing','Bearing','Bearing',78547854,'ngugigeorge@gmail.com','Limuru',454545,454545,454,'Morning','2019-02-18'),(30,'daniel','Kamau','Odhiambo',1201682,'masenosite@gmail.com','maseno',5874758,5874758,587,'Morning','2019-03-12'),(31,'daniel','Kamau','Odhiambo',1201682,'names@gmail.com','maseno',785785,74458,201,'Morning','2019-03-12');
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_history`
--

DROP TABLE IF EXISTS `patient_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_history` (
  `hisory_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `date_of_illnaess` date DEFAULT NULL,
  `symptoms` text NOT NULL,
  `test_perfomed` text NOT NULL,
  `medication` text NOT NULL,
  `illness` text NOT NULL,
  PRIMARY KEY (`hisory_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_details` (`hospital_id`),
  CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`),
  CONSTRAINT `patient_history_ibfk_3` FOREIGN KEY (`doc_id`) REFERENCES `doctor_details` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_history`
--

LOCK TABLES `patient_history` WRITE;
/*!40000 ALTER TABLE `patient_history` DISABLE KEYS */;
INSERT INTO `patient_history` VALUES (1,29,1,1,'2010-08-08','Heat pulses Fiver Vommiting','','',''),(2,29,1,1,'2010-08-08','Heat pulses , Fiver, Vommiting','','',''),(3,28,1,1,'2010-08-08','Heat pulses Fiver Vommiting','','',''),(4,28,1,1,'2010-08-08','Heat pulses Fiver Vommiting','','',''),(6,15,1,1,'2019-03-06','Headache','Maria test','Anti Malaria','Malaria '),(7,15,1,1,'2018-05-28','Pains In joints , Vomiting ','Malaria , Cholera , Tyfoid','Malaria','Chikungunya'),(8,15,1,1,'2019-03-07','Diaphram','Foloic','Malaria','Joiuny'),(9,16,1,1,'2019-02-25','Hair Loss','Hormones','Supplements','None'),(10,16,1,1,'2019-02-26','Insomia','None','Relaxers','Fatigue'),(11,16,1,1,'2019-02-25','bujhbyuhj','b bhjn','kjhjjk','bhjh ubjk'),(12,16,1,1,'2019-02-24','Joints','Fatigues','anti fatigue','Fatigues'),(13,14,1,1,'2019-02-25','hairy','none','none','hairness'),(14,15,1,1,'2019-03-13','kjoigkjrog','fjsiok;rejll;m','jtiogtogjitjg','rkjgoifmor');
/*!40000 ALTER TABLE `patient_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_verification`
--

DROP TABLE IF EXISTS `patient_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_verification` (
  `pv_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`pv_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_verification_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_verification`
--

LOCK TABLES `patient_verification` WRITE;
/*!40000 ALTER TABLE `patient_verification` DISABLE KEYS */;
INSERT INTO `patient_verification` VALUES (1,'121',1,''),(2,'010',1,'georgekariukingugi@gmail.com'),(3,'121',1,'daniel@gmail.com'),(4,'101',1,'kilobi@gmail.com'),(5,'101',1,'chegejohn159@gmail.com'),(6,'101',1,'chegejohn159@gmail.com'),(7,'321',1,'kenruthi409@gmail.com'),(8,'321',1,'kenruthi409@gmail.com'),(9,'101',1,'chegejohn159@gmail.com'),(10,'101',1,'chegejohn159@gmail.com'),(11,'121',1,'nyiwende@gmail.com'),(12,'121',1,'ngugigeorge697@gmail.com'),(13,'989',1,'chegejohn159@gmail.com'),(14,'121',1,'named@gmail.com'),(15,'121',1,'named@gmail.com'),(16,'121',1,'named@gmail.com'),(17,'',1,'120120120'),(18,'',1,'120120120'),(19,'120120120',1,'ngugigeorge@gmail.com'),(20,'120120120',1,'names@gmail.com');
/*!40000 ALTER TABLE `patient_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'monaowano'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-05 17:12:17
