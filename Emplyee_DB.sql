CREATE DATABASE  IF NOT EXISTS `omeara19200612` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `omeara19200612`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: omeara19200612
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants` (
  `app_id` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address01` varchar(45) NOT NULL,
  `address02` varchar(45) DEFAULT NULL,
  `address03` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) NOT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `app_id_UNIQUE` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES (1,'John','Byrne','01 Motorway Lane','Pinebank','Co. Dublin','A94 GH01','01 234 8799','john.byrne@gmail.com'),(2,'Mary','Bynre','23 Organon Park','Stillorgan','Co. Dublin','A94 TH03','01 345 6789','mary.byrne@gmail.com'),(3,'James','Murphy','47 Glaxo Avenue','Blackrock','Co. Dublin','G56 TY02','01 456 7899','james.murphy@gmail.com'),(4,'Paul','O\'Neill','27 The Elms','Kilcock','Co. Dublin','F56 RG78','01 567 8899','paul.oneill@gmail.com'),(5,'Peter','Peterson','109 Wesbury','Castleknock','Co. Dublin','H89 FF45','01 678 9012','peter.peterson@gmail.com'),(6,'Margaret','Dunne','4 Woodthorpe','Blanchardstown','Co. Dublin','K48 GT98','01 789 0123','margaret.dunne@gmail.com'),(7,'Elaine','Duffy','23 The Avenue','Limehill','Co. Cork','R78 GH65','01 890 1234','elaine.duffy@gmail.com'),(8,'Siobhan','Prendergast','45 Weeping Willows','The Bawn','Co. Cork','L98 TE76','01 901 2345','siobhan.prendergast@gmail.com'),(9,'Sinead','Heffernon','76 Market Square','Mitchelstown','Co. Cork','K45 UW98','01 012 3456','sinead.heffernon@gmail.com'),(10,'Malcolm','O\'Grady','89 Emoclew Road','Ricehill','Co. Limerick','J45 TY09','01 123 4567','malcolm.ogrady@gmail.com'),(11,'Brendan','McGrath','107 Sunny Villas','Peerstown','Co. Limerick','G45 EW67','01 987 6543','brendan.mcgrath@gmail.com'),(12,'Mark','O\'Toole','34 Winter Gale','Failview','Co. Limerick','G54 TR89','01 876 5432','mark.otoole@gmail.com'),(54,'','','','','','','','');
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants_with_skills`
--

DROP TABLE IF EXISTS `applicants_with_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants_with_skills` (
  `app_id` int(11) NOT NULL,
  `skillcode` varchar(10) NOT NULL,
  PRIMARY KEY (`app_id`,`skillcode`),
  KEY `skill_idx` (`skillcode`),
  CONSTRAINT `App` FOREIGN KEY (`app_id`) REFERENCES `applicants` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skill` FOREIGN KEY (`skillcode`) REFERENCES `skills` (`skillcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants_with_skills`
--

LOCK TABLES `applicants_with_skills` WRITE;
/*!40000 ALTER TABLE `applicants_with_skills` DISABLE KEYS */;
INSERT INTO `applicants_with_skills` VALUES (1,'XAC'),(11,'XAC'),(1,'XAD'),(2,'XAD'),(8,'XAD'),(9,'XAD'),(2,'XCA'),(9,'XCA'),(3,'XCL'),(6,'XCL'),(7,'XCL'),(3,'XGD'),(12,'XGD'),(8,'XHR'),(4,'XPR'),(4,'XRE'),(10,'XRE'),(5,'XSP'),(10,'XSP'),(4,'XTE'),(5,'XTE'),(10,'XTE'),(11,'XTE');
/*!40000 ALTER TABLE `applicants_with_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interviews` (
  `int_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `app_id` int(11) NOT NULL,
  `job_desc` int(11) NOT NULL,
  `interview_level` int(3) NOT NULL DEFAULT '1',
  `interview_outcome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `int_id_UNIQUE` (`int_id`),
  KEY `app_id_idx` (`app_id`),
  KEY `job_desc_idx` (`job_desc`),
  CONSTRAINT `app_id` FOREIGN KEY (`app_id`) REFERENCES `applicants` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_desc` FOREIGN KEY (`job_desc`) REFERENCES `job_description` (`desc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
INSERT INTO `interviews` VALUES (1,'2019-03-21',1,5,1,'Offer Job'),(2,'2019-02-12',2,7,1,'Call for 2nd Interview'),(3,'2019-05-15',3,2,1,'Offer Job'),(4,'2019-06-12',4,4,1,'Call for 2nd Interview'),(5,'2019-07-05',4,4,2,'Offer Job'),(6,'2019-03-21',2,7,2,'Offer Job'),(7,'2019-05-19',5,11,1,'Call for 2nd Interview'),(8,'2019-04-18',6,3,1,'Offer Job'),(9,'2019-04-18',7,3,1,'Offer Job'),(10,'2019-03-15',8,8,1,'Call for 2nd interview'),(11,'2019-07-26',9,1,1,'Offer Job'),(12,'2019-11-29',10,9,1,NULL);
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_description`
--

DROP TABLE IF EXISTS `job_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_description` (
  `desc_id` int(11) NOT NULL,
  `jobtype` varchar(45) NOT NULL,
  `universityid` int(11) NOT NULL,
  `num_positions` int(11) NOT NULL DEFAULT '1',
  `interview_levels` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`desc_id`),
  UNIQUE KEY `desc_id_UNIQUE` (`desc_id`),
  UNIQUE KEY `jobtype_UNIQUE` (`jobtype`),
  KEY `uni_idx` (`universityid`),
  CONSTRAINT `uni` FOREIGN KEY (`universityid`) REFERENCES `universities` (`un_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_description`
--

LOCK TABLES `job_description` WRITE;
/*!40000 ALTER TABLE `job_description` DISABLE KEYS */;
INSERT INTO `job_description` VALUES (1,'Caterer',11,2,1),(2,'Gardener',10,1,1),(3,'Cleaner',3,2,1),(4,'Programming_Lecturer',4,1,2),(5,'Bookkeeper',5,1,1),(6,'Accounts_Lecturer',6,1,2),(7,'Catering_Administrator',7,1,2),(8,'HR_Manager',1,1,2),(9,'Sports_Researcher',9,1,3),(10,'Faculty_Administrator',2,1,2),(11,'Sports_Lecturer',8,1,2);
/*!40000 ALTER TABLE `job_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_available`
--

DROP TABLE IF EXISTS `positions_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_available` (
  `positionid` int(11) NOT NULL,
  `job_description` int(11) NOT NULL,
  `applicant` int(11) DEFAULT NULL,
  PRIMARY KEY (`positionid`),
  UNIQUE KEY `positionid_UNIQUE` (`positionid`),
  UNIQUE KEY `applicant_UNIQUE` (`applicant`),
  KEY `job_desc_idx` (`job_description`),
  KEY `app_id_idx` (`applicant`),
  CONSTRAINT `applicant` FOREIGN KEY (`applicant`) REFERENCES `applicants` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job` FOREIGN KEY (`job_description`) REFERENCES `job_description` (`desc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_available`
--

LOCK TABLES `positions_available` WRITE;
/*!40000 ALTER TABLE `positions_available` DISABLE KEYS */;
INSERT INTO `positions_available` VALUES (1,1,9),(2,1,NULL),(3,2,3),(4,3,6),(5,3,7),(6,4,4),(7,5,1),(8,6,NULL),(9,7,2),(10,8,8),(11,9,NULL),(12,10,NULL),(13,11,NULL);
/*!40000 ALTER TABLE `positions_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skillcode` varchar(10) NOT NULL,
  `skillname` varchar(45) NOT NULL,
  PRIMARY KEY (`skillcode`),
  UNIQUE KEY `skillcode_UNIQUE` (`skillcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES ('XAC','accounting'),('XAD','administration'),('XCA','catering'),('XCG','career_guidance'),('XCL','cleaning'),('XGD','gardening'),('XHR','human_resources'),('XPR','programming'),('XRE','research'),('XSP','sports'),('XTE','teaching');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_for_job_description`
--

DROP TABLE IF EXISTS `skills_for_job_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_for_job_description` (
  `skillcode` varchar(10) NOT NULL,
  `descid` int(11) NOT NULL,
  PRIMARY KEY (`skillcode`,`descid`),
  KEY `desc_idx` (`descid`),
  CONSTRAINT `desc` FOREIGN KEY (`descid`) REFERENCES `job_description` (`desc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skills` FOREIGN KEY (`skillcode`) REFERENCES `skills` (`skillcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_for_job_description`
--

LOCK TABLES `skills_for_job_description` WRITE;
/*!40000 ALTER TABLE `skills_for_job_description` DISABLE KEYS */;
INSERT INTO `skills_for_job_description` VALUES ('XCA',1),('XGD',2),('XCL',3),('XPR',4),('XRE',4),('XTE',4),('XAC',5),('XAC',6),('XTE',6),('XAD',7),('XCA',7),('XAD',8),('XHR',8),('XRE',9),('XSP',9),('XAD',10),('XSP',11),('XTE',11);
/*!40000 ALTER TABLE `skills_for_job_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universities` (
  `un_id` int(11) NOT NULL,
  `universityname` varchar(45) NOT NULL,
  `address01` varchar(45) NOT NULL,
  `address02` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) NOT NULL,
  PRIMARY KEY (`un_id`),
  UNIQUE KEY `un_id_UNIQUE` (`un_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'University College Dublin','Belfield','Dublin 4','01 987 6543'),(2,'Trinity College Dublin','College Green','Dublin 2','01 987 5432'),(3,'Dublin City University','Glasnevin','Dublin 9','01 987 4321'),(4,'Dublin Institute of Technology','Kevin street','Dublin 2','01 987 9876'),(5,'IACT','Fitzwilliam Street Upper','Dublin 2','01 987 8765'),(6,'University of Limerick','Limerick','Co. Limerick','01 987 7654'),(7,'University College Cork','Cork','Co. Cork','01 876 9876'),(8,'Southern University','Tralee','Co. Kerry','01 876 8765'),(9,'Ireland University','Limerick','Co. Limerick','01 876 7654'),(10,'Art Institute of Ireland','O\'Connell Street','Dublin 1','01 876 6543'),(11,'Music School of Ireland','Glenageary','Co. Dublin','01 876 5432');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'omeara19200612'
--

--
-- Dumping routines for database 'omeara19200612'
--
/*!50003 DROP PROCEDURE IF EXISTS `01_find_uni_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `01_find_uni_by_name`(in p_uniname varchar(45))
BEGIN
SELECT * FROM omeara19200612.universities
where universityname = p_uniname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `02_find_uni_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `02_find_uni_by_id`(in p_uniid INT(11))
BEGIN
SELECT * FROM omeara19200612.universities
where un_id = p_uniid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `03_find_applicant_by_surname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `03_find_applicant_by_surname`(in p_surname varchar(45))
BEGIN
SELECT * FROM omeara19200612.applicants
where lastname = p_surname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `04_find_applicant_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `04_find_applicant_by_id`(in P_appid int(11))
BEGIN
SELECT * FROM omeara19200612.applicants
where app_id = p_appid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `05_find_applicant_by_job_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `05_find_applicant_by_job_id`(in p_descid int(11))
BEGIN
SELECT omeara19200612.applicants.app_id, firstname, lastname, address01, address02, address03, postcode, telephone, email  FROM omeara19200612.applicants, omeara19200612.applicants_with_skills, omeara19200612.skills_for_job_description
where omeara19200612.applicants.app_id=omeara19200612.applicants_with_skills.app_id and 
	omeara19200612.applicants_with_skills.skillcode=omeara19200612.skills_for_job_description.skillcode and
    omeara19200612.skills_for_job_description.descid = p_descid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `06_find_job_by_skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `06_find_job_by_skill`(in p_skillname varchar(45))
BEGIN
SELECT desc_id, jobtype, universityid, num_positions, interview_levels FROM omeara19200612.job_description, omeara19200612.skills_for_job_description, omeara19200612.skills
where omeara19200612.job_description.desc_id = omeara19200612.skills_for_job_description.descid and
omeara19200612.skills_for_job_description.skillcode = omeara19200612.skills.skillcode and
omeara19200612.skills.skillname = p_skillname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `07_find_job_descriptions_sorted_by_university` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `07_find_job_descriptions_sorted_by_university`()
BEGIN
SELECT universityname, jobtype, num_positions, interview_levels FROM omeara19200612.job_description, omeara19200612.universities
where omeara19200612.job_description.universityid = omeara19200612.universities.un_id
order by universityname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `08_applicants_offered_job` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `08_applicants_offered_job`()
BEGIN
SELECT count(app_id) FROM omeara19200612.interviews
where omeara19200612.interviews.interview_outcome="Offer Job";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `09_job_descriptions_requiring_research` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `09_job_descriptions_requiring_research`()
BEGIN
SELECT count(descid) FROM omeara19200612.skills_for_job_description
where omeara19200612.skills_for_job_description.skillcode = "XRE";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `10_interviews_on_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `10_interviews_on_date`(in p_date date )
BEGIN
SELECT * FROM omeara19200612.interviews
where omeara19200612.interviews.date = p_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `11_applicants_interviewed_twiceormore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `11_applicants_interviewed_twiceormore`()
BEGIN
SELECT omeara19200612.applicants.app_id, firstname, lastname  FROM omeara19200612.interviews, omeara19200612.applicants
where omeara19200612.interviews.app_id = omeara19200612.applicants.app_id
group by app_id
having count(omeara19200612.interviews.app_id) >= "2";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_applicants_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_applicants_insert_row`(in p_app_id int(11), in p_firstname varchar(45), in p_surname varchar(45), in p_address01 varchar(45), in p_address02 varchar(45), in p_address03 varchar(45), p_postcode varchar(45), p_telephone varchar(45), p_email varchar(45) )
BEGIN
INSERT INTO `omeara19200612`.`applicants` (`app_id`, `firstname`, `lastname`, `address01`, `address02`, `address03`, `postcode`, `telephone`, `email`) VALUES (p_app_id, p_firstname, p_surname, p_address01, p_address02, p_address03, p_postcode, p_telephone, p_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_applicants_with_skils_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_applicants_with_skils_insert_row`(in p_app_id int(11), in p_skillcode varchar(10) )
BEGIN
INSERT INTO `omeara19200612`.`applicants_with_skills` (`app_id`, `skillcode`) VALUES (p_app_id, p_skillcode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_interiews_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_interiews_insert_row`(in p_intid int(11), in p_appid int(11), in p_jobdesc int(11), in p_level int(3), in p_outcome varchar(45), in p_date date)
BEGIN
INSERT INTO `omeara19200612`.`interviews` (`int_id`, `app_id`, `job_desc`, `interview_level`, `interview_outcome`, `date`) VALUES (p_intid, p_appid, p_jobdesc, p_level, p_outcome, p_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_job_description_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_job_description_insert_row`(in p_descid int(11), in p_jobtype varchar(45), in p_universityid int(11), in p_numpositions int(11), in p_interviewlevels int(3))
BEGIN
INSERT INTO `omeara19200612`.`job_description` (`desc_id`, `jobtype`, `universityid`, `num_positions`, `interview_levels`) VALUES (p_descid, p_jobtype, p_universityid, p_numpositions, p_interviewlevels);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_positions_available_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_positions_available_insert_row`(in p_positionid int(11), in p_job_description int(11))
BEGIN
INSERT INTO `omeara19200612`.`positions_available` (`positionid`, `job_description`) VALUES (p_positionid, p_job_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_skills_for_job_description_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_skills_for_job_description_insert_row`(in p_skillcode varchar(10), in p_descid int(11))
BEGIN
INSERT INTO `omeara19200612`.`skills_for_job_description` (`skillcode`, `descid`) VALUES (p_skillcode, p_descid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_skils_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_skils_insert_row`(in p_skillcode varchar(10), in p_skillname varchar(45))
BEGIN
INSERT INTO `omeara19200612`.`skills` (`skillcode`, `skillname`) VALUES (p_skillcode, p_skillname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_universities_insert_row` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `table_universities_insert_row`(in p_unid int(11), in p_universityname varchar(45), in p_address01 varchar(45), in p_address02 varchar(45), in p_telephone varchar(45))
BEGIN
INSERT INTO `omeara19200612`.`universities` (`un_id`, `universityname`, `address01`, `address02`, `telephone`) VALUES (p_unid, p_universityname, p_address01, p_address02, p_telephone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-20 23:29:40
