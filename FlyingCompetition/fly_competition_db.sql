-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: fly_competition
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `aliante`
--

DROP TABLE IF EXISTS `aliante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliante` (
  `produttore_piva` varchar(11) NOT NULL,
  `apertura_alare` double DEFAULT NULL,
  `modello` varchar(30) NOT NULL,
  PRIMARY KEY (`produttore_piva`,`modello`),
  CONSTRAINT `produttore_fk` FOREIGN KEY (`produttore_piva`, `modello`) REFERENCES `modello_produttore` (`produttore`, `modello`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliante`
--

LOCK TABLES `aliante` WRITE;
/*!40000 ALTER TABLE `aliante` DISABLE KEYS */;
INSERT INTO `aliante` VALUES ('ABCDE12345F',18,'AC-21'),('ABCDE12345F',20,'Combat GT'),('ABCDE12345G',20,'Taurus-M'),('ABCDE12345H',18,'Axiom'),('ABCDE12345H',26,'Jeta');
/*!40000 ALTER TABLE `aliante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classifica`
--

DROP TABLE IF EXISTS `classifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classifica` (
  `id_pilota` varchar(16) NOT NULL,
  `punteggio` int NOT NULL,
  `posizione` int NOT NULL AUTO_INCREMENT,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  PRIMARY KEY (`posizione`,`id_pilota`,`nome_competizione`,`edizione_competizione`),
  KEY `classifica_cf_fk_idx` (`id_pilota`),
  KEY `classifica_competiz_fk_idx` (`nome_competizione`,`edizione_competizione`),
  CONSTRAINT `classifica_cf_fk` FOREIGN KEY (`id_pilota`) REFERENCES `pilota_dati_da_gara` (`cf`),
  CONSTRAINT `classifica_competiz_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifica`
--

LOCK TABLES `classifica` WRITE;
/*!40000 ALTER TABLE `classifica` DISABLE KEYS */;
/*!40000 ALTER TABLE `classifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competizione`
--

DROP TABLE IF EXISTS `competizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competizione` (
  `nome` varchar(50) NOT NULL,
  `edizione` int NOT NULL,
  `costo_iscrizione` int NOT NULL,
  `tipo_competizione` char(1) NOT NULL,
  PRIMARY KEY (`nome`,`edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competizione`
--

LOCK TABLES `competizione` WRITE;
/*!40000 ALTER TABLE `competizione` DISABLE KEYS */;
INSERT INTO `competizione` VALUES ('Campionati Italiani',2022,220,'G'),('Campionati Moldavi',2022,120,'G'),('Trofeo Montegrappa',2022,300,'G');
/*!40000 ALTER TABLE `competizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `data_comp_da_inserire`
--

DROP TABLE IF EXISTS `data_comp_da_inserire`;
/*!50001 DROP VIEW IF EXISTS `data_comp_da_inserire`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_comp_da_inserire` AS SELECT 
 1 AS `nuova_data`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `date`
--

DROP TABLE IF EXISTS `date`;
/*!50001 DROP VIEW IF EXISTS `date`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `date` AS SELECT 
 1 AS `cf_pilota`,
 1 AS `nome_competizione`,
 1 AS `edizione_competizione`,
 1 AS `data_inizio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `date_competizioni`
--

DROP TABLE IF EXISTS `date_competizioni`;
/*!50001 DROP VIEW IF EXISTS `date_competizioni`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `date_competizioni` AS SELECT 
 1 AS `data_competizioni`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dati_merged`
--

DROP TABLE IF EXISTS `dati_merged`;
/*!50001 DROP VIEW IF EXISTS `dati_merged`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dati_merged` AS SELECT 
 1 AS `km_percorsi`,
 1 AS `mezzo`,
 1 AS `cf_pilota`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `deltaplano`
--

DROP TABLE IF EXISTS `deltaplano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deltaplano` (
  `produttore_piva` varchar(11) NOT NULL,
  `classe` char(1) DEFAULT NULL,
  `modello` varchar(30) NOT NULL,
  PRIMARY KEY (`produttore_piva`,`modello`),
  CONSTRAINT `deltaplano_prod_fk` FOREIGN KEY (`produttore_piva`, `modello`) REFERENCES `modello_produttore` (`produttore`, `modello`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deltaplano`
--

LOCK TABLES `deltaplano` WRITE;
/*!40000 ALTER TABLE `deltaplano` DISABLE KEYS */;
INSERT INTO `deltaplano` VALUES ('ABCDE12345E','1','Laminar'),('ABCDE12345E','3','Piuma'),('ABCDE12345F','5','Discus');
/*!40000 ALTER TABLE `deltaplano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direttore_di_gara`
--

DROP TABLE IF EXISTS `direttore_di_gara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direttore_di_gara` (
  `cf` varchar(16) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `anni_di_esperienza` int DEFAULT NULL,
  PRIMARY KEY (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direttore_di_gara`
--

LOCK TABLES `direttore_di_gara` WRITE;
/*!40000 ALTER TABLE `direttore_di_gara` DISABLE KEYS */;
/*!40000 ALTER TABLE `direttore_di_gara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direzione`
--

DROP TABLE IF EXISTS `direzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direzione` (
  `cf_direttore` varchar(16) NOT NULL,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  PRIMARY KEY (`cf_direttore`,`nome_competizione`,`edizione_competizione`),
  KEY `competiz_idx` (`nome_competizione`,`edizione_competizione`),
  CONSTRAINT `cf_direttore_est` FOREIGN KEY (`cf_direttore`) REFERENCES `direttore_di_gara` (`cf`),
  CONSTRAINT `competiz` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direzione`
--

LOCK TABLES `direzione` WRITE;
/*!40000 ALTER TABLE `direzione` DISABLE KEYS */;
/*!40000 ALTER TABLE `direzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gara_cross_country`
--

DROP TABLE IF EXISTS `gara_cross_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gara_cross_country` (
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `data_inizio` date NOT NULL,
  `luogo` varchar(50) DEFAULT NULL,
  `orario_start` time DEFAULT NULL,
  `punteggio_attribuito` int DEFAULT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`data_inizio`),
  CONSTRAINT `competizione_est` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gara_cross_country`
--

LOCK TABLES `gara_cross_country` WRITE;
/*!40000 ALTER TABLE `gara_cross_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `gara_cross_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gara_cross_country_finita`
--

DROP TABLE IF EXISTS `gara_cross_country_finita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gara_cross_country_finita` (
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `orario_fine` time DEFAULT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`data_inizio`),
  CONSTRAINT `competizione` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gara_cross_country_finita`
--

LOCK TABLES `gara_cross_country_finita` WRITE;
/*!40000 ALTER TABLE `gara_cross_country_finita` DISABLE KEYS */;
/*!40000 ALTER TABLE `gara_cross_country_finita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gara_di_campionato`
--

DROP TABLE IF EXISTS `gara_di_campionato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gara_di_campionato` (
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `data_inizio` date NOT NULL,
  `luogo` varchar(50) DEFAULT NULL,
  `geolocalizzazione` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`data_inizio`),
  CONSTRAINT `competizione_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gara_di_campionato`
--

LOCK TABLES `gara_di_campionato` WRITE;
/*!40000 ALTER TABLE `gara_di_campionato` DISABLE KEYS */;
INSERT INTO `gara_di_campionato` VALUES ('Campionati Italiani',2022,'2022-06-08','Feltre','46°1\'27\"84 N'),('Campionati Moldavi',2022,'2022-06-15','Moldav','wowwww no way'),('Trofeo Montegrappa',2022,'2022-06-10','Montegrappa','noweonwoe');
/*!40000 ALTER TABLE `gara_di_campionato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizione`
--

DROP TABLE IF EXISTS `iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizione` (
  `cf_pilota` varchar(16) NOT NULL,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `num_seriale_mezzo` int DEFAULT NULL,
  PRIMARY KEY (`cf_pilota`,`nome_competizione`,`edizione_competizione`),
  KEY `iscrizione_competizione_fk_idx` (`nome_competizione`,`edizione_competizione`),
  KEY `iscrizione_mezzo_fk_idx` (`num_seriale_mezzo`),
  CONSTRAINT `iscrizione_cf_fk` FOREIGN KEY (`cf_pilota`) REFERENCES `pilota_dati_da_gara` (`cf`),
  CONSTRAINT `iscrizione_competizione_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`),
  CONSTRAINT `iscrizione_mezzo_fk` FOREIGN KEY (`num_seriale_mezzo`) REFERENCES `mezzo` (`num_seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione`
--

LOCK TABLES `iscrizione` WRITE;
/*!40000 ALTER TABLE `iscrizione` DISABLE KEYS */;
INSERT INTO `iscrizione` VALUES ('12345','Campionati Italiani',2022,111),('1234','Campionati Italiani',2022,444),('98989','Campionati Italiani',2022,999);
/*!40000 ALTER TABLE `iscrizione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_BEFORE_INSERT_age` BEFORE INSERT ON `iscrizione` FOR EACH ROW BEGIN
	DECLARE bornYearPilot date;
	SET bornYearPilot = (SELECT data_nascita FROM fly_competition.pilota_dati_anagrafici WHERE new.cf_pilota = cf);
    
	IF( year(curDate())-year(bornYearPilot)<18 ) THEN
		signal sqlstate '45000' set message_text = 'Non è possibile iscrivere un pilota minorenne';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_BEFORE_INSERT_dataCheck` BEFORE INSERT ON `iscrizione` FOR EACH ROW BEGIN
	DECLARE num_invalid_events INTEGER;
    SET num_invalid_events =
    (SELECT count(*) 
    FROM (SELECT * FROM (SELECT data_inizio as data_competizione FROM iscrizione
	INNER JOIN  gara_di_campionato
	ON iscrizione.nome_competizione = gara_di_campionato.nome_competizione AND 
	iscrizione.edizione_competizione = gara_di_campionato.edizione_competizione
	WHERE iscrizione.cf_pilota = new.cf_pilota) as date_competizioni
    CROSS JOIN (SELECT data_inizio as nuova_data FROM gara_di_campionato
    WHERE new.nome_competizione = gara_di_campionato.nome_competizione AND
    new.edizione_competizione = gara_di_campionato.edizione_competizione) as data_comp_da_inserire) as prod_cart
    WHERE data_competizione != nuova_data AND abs(datediff(nuova_data,data_competizione)<7));
    
	IF( num_invalid_events >0  ) THEN
		signal sqlstate '45000' set message_text = 'Non è possibile iscriversi a due competizioni nello stesso periodo';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_BEFORE_INSERT_checkVehicleAge` BEFORE INSERT ON `iscrizione` FOR EACH ROW BEGIN
	DECLARE yearVehicle date;
    SET yearVehicle = 
    (
    SELECT anno_produzione
	FROM produzione
	INNER JOIN modello_produttore
	ON produzione.piva = modello_produttore.produttore AND produzione.modello = modello_produttore.modello
	WHERE numero_seriale_mezzo = new.num_seriale_mezzo
    );
	IF( datediff(curDate(), yearVehicle) >= (365*20)) THEN
		signal sqlstate '45000' set message_text = 'Il mezzo da iscrivere non è sicuro (ha più di 20 anni)';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `iscrizione_BEFORE_INSERT_checkProprietarioMezzo` BEFORE INSERT ON `iscrizione` FOR EACH ROW BEGIN
	DECLARE propr VARCHAR(16);
    SET propr = (
    SELECT cf_pilota
	FROM possesso AS P1
	WHERE num_seriale_mezzo = new.num_seriale_mezzo
    );
	IF( propr != new.cf_pilota) THEN
		signal sqlstate '45000' set message_text = 'Il mezzo non appartiene al pilota indicato';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `km_per_mezzo`
--

DROP TABLE IF EXISTS `km_per_mezzo`;
/*!50001 DROP VIEW IF EXISTS `km_per_mezzo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `km_per_mezzo` AS SELECT 
 1 AS `cf_pilota`,
 1 AS `mezzo`,
 1 AS `km_effettuati`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `live_tracking`
--

DROP TABLE IF EXISTS `live_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_tracking` (
  `cf_pilota` varchar(16) NOT NULL,
  `data` date NOT NULL,
  `ora_partenza` time NOT NULL,
  `coordinate_geografiche` varchar(30) DEFAULT NULL,
  `tempo_aggiornamento` time DEFAULT NULL,
  PRIMARY KEY (`cf_pilota`,`data`,`ora_partenza`),
  CONSTRAINT `lt_traccia` FOREIGN KEY (`cf_pilota`, `data`, `ora_partenza`) REFERENCES `traccia` (`cf_pilota`, `data`, `ora_partenza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_tracking`
--

LOCK TABLES `live_tracking` WRITE;
/*!40000 ALTER TABLE `live_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mezzo`
--

DROP TABLE IF EXISTS `mezzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mezzo` (
  `num_seriale` int NOT NULL,
  `modello` varchar(30) NOT NULL,
  PRIMARY KEY (`num_seriale`,`modello`),
  CONSTRAINT `mezzo_fk` FOREIGN KEY (`num_seriale`, `modello`) REFERENCES `produzione` (`numero_seriale_mezzo`, `modello`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mezzo`
--

LOCK TABLES `mezzo` WRITE;
/*!40000 ALTER TABLE `mezzo` DISABLE KEYS */;
INSERT INTO `mezzo` VALUES (101,'Cure2'),(111,'Enzo3'),(444,'Combat GT'),(888,'Cure2'),(999,'Enzo3');
/*!40000 ALTER TABLE `mezzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `miglior_mezzo_per_pilota`
--

DROP TABLE IF EXISTS `miglior_mezzo_per_pilota`;
/*!50001 DROP VIEW IF EXISTS `miglior_mezzo_per_pilota`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `miglior_mezzo_per_pilota` AS SELECT 
 1 AS `cf_pilota`,
 1 AS `seriale_mezzo`,
 1 AS `km_totali`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `modello_produttore`
--

DROP TABLE IF EXISTS `modello_produttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modello_produttore` (
  `produttore` varchar(11) NOT NULL,
  `modello` varchar(50) NOT NULL,
  `anno_produzione` date DEFAULT NULL,
  `categoria` char(1) NOT NULL,
  PRIMARY KEY (`produttore`,`modello`),
  CONSTRAINT `prod_fk` FOREIGN KEY (`produttore`) REFERENCES `produttore` (`piva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello_produttore`
--

LOCK TABLES `modello_produttore` WRITE;
/*!40000 ALTER TABLE `modello_produttore` DISABLE KEYS */;
INSERT INTO `modello_produttore` VALUES ('ABCDE12345A','Base2','2021-04-04','P'),('ABCDE12345A','Cure2','2021-07-10','P'),('ABCDE12345B','Artik6','2021-10-12','P'),('ABCDE12345B','Hook5','2019-05-21','P'),('ABCDE12345B','Peak5','2022-04-10','P'),('ABCDE12345C','Delta4','2022-04-11','P'),('ABCDE12345C','Enzo3','2010-08-02','P'),('ABCDE12345C','Zeno','2011-09-12','P'),('ABCDE12345C','Zeno2','2022-05-10','P'),('ABCDE12345C','Zeolite GT','2014-05-10','P'),('ABCDE12345D','Eden7','2019-01-02','P'),('ABCDE12345D','Elan3','2018-08-10','P'),('ABCDE12345D','Magnus','2016-08-20','P'),('ABCDE12345E','Laminar','2015-09-11','D'),('ABCDE12345E','Piuma','2014-03-12','D'),('ABCDE12345F','AC-21','2017-01-12','A'),('ABCDE12345F','Combat GT','2000-10-04','A'),('ABCDE12345F','Discus','2020-10-11','D'),('ABCDE12345G','Taurus-M','2019-06-06','A'),('ABCDE12345H','Axiom','2018-04-04','A'),('ABCDE12345H','Jeta','2020-01-01','A'),('ABCDE12345I','Boomerang12','2022-05-06','P'),('ABCDE12345I','Leopard','2021-02-01','P');
/*!40000 ALTER TABLE `modello_produttore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root2`@`%`*/ /*!50003 TRIGGER `modello_produttore_BEFORE_INSERT` BEFORE INSERT ON `modello_produttore` FOR EACH ROW BEGIN
	DECLARE prod VARCHAR(50);
    SET prod = (SELECT COUNT(produttore) FROM modello_produttore WHERE new.modello = ANY(SELECT modello FROM modello_produttore));
    IF(prod>1) THEN
		signal sqlstate '45000' set message_text = 'Il modello appartiene già ad un produttore';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parapendio`
--

DROP TABLE IF EXISTS `parapendio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parapendio` (
  `categoria` char(3) DEFAULT NULL,
  `modello` varchar(30) NOT NULL,
  `produttore_piva` varchar(11) NOT NULL,
  PRIMARY KEY (`produttore_piva`,`modello`),
  CONSTRAINT `parapendio_prod_fk` FOREIGN KEY (`produttore_piva`, `modello`) REFERENCES `modello_produttore` (`produttore`, `modello`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parapendio`
--

LOCK TABLES `parapendio` WRITE;
/*!40000 ALTER TABLE `parapendio` DISABLE KEYS */;
INSERT INTO `parapendio` VALUES ('B','Base2','ABCDE12345A'),('C','Cure2','ABCDE12345A'),('C','Artik6','ABCDE12345B'),('B','Hook5','ABCDE12345B'),('D','Peak5','ABCDE12345B'),('C','Delta4','ABCDE12345C'),('CCC','Enzo3','ABCDE12345C'),('D','Zeno','ABCDE12345C'),('D','Zeno2','ABCDE12345C'),('D','Zeolite GT','ABCDE12345C'),('C','Eden7','ABCDE12345D'),('B','Elan3','ABCDE12345D'),('D','Magnus','ABCDE12345D'),('CCC','Boomerang12','ABCDE12345I'),('D','Leopard','ABCDE12345I');
/*!40000 ALTER TABLE `parapendio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pilota_con_tracce_camp`
--

DROP TABLE IF EXISTS `pilota_con_tracce_camp`;
/*!50001 DROP VIEW IF EXISTS `pilota_con_tracce_camp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pilota_con_tracce_camp` AS SELECT 
 1 AS `cf`,
 1 AS `data`,
 1 AS `ora_partenza`,
 1 AS `ora_arrivo`,
 1 AS `tipologia_traccia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pilota_dati_anagrafici`
--

DROP TABLE IF EXISTS `pilota_dati_anagrafici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilota_dati_anagrafici` (
  `cf` varchar(16) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  PRIMARY KEY (`cf`),
  CONSTRAINT `pda_cf_fk` FOREIGN KEY (`cf`) REFERENCES `pilota_dati_da_gara` (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilota_dati_anagrafici`
--

LOCK TABLES `pilota_dati_anagrafici` WRITE;
/*!40000 ALTER TABLE `pilota_dati_anagrafici` DISABLE KEYS */;
INSERT INTO `pilota_dati_anagrafici` VALUES ('1234','Mik','Palm','1999-04-04'),('12345','Gio','Rgia','2001-10-11'),('98989','Gab','Rod','2000-10-10'),('CLRTMS04B92DG01E','Tommaso','Carlini','2006-10-10'),('giorginaCF','Giorgina','Giorgetta','2001-11-11');
/*!40000 ALTER TABLE `pilota_dati_anagrafici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilota_dati_da_gara`
--

DROP TABLE IF EXISTS `pilota_dati_da_gara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilota_dati_da_gara` (
  `cf` varchar(16) NOT NULL,
  `num_seriale_brevetto` int DEFAULT NULL,
  `soprannome` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilota_dati_da_gara`
--

LOCK TABLES `pilota_dati_da_gara` WRITE;
/*!40000 ALTER TABLE `pilota_dati_da_gara` DISABLE KEYS */;
INSERT INTO `pilota_dati_da_gara` VALUES ('1234',12345678,'erMik','erM'),('12345',1234569,'zoZO','ZO'),('98989',98765431,'Gabba','ErGa'),('CLRTMS04B92DG01E',18232871,'carlinss','a'),('giorginaCF',12345678,'giorgette9929','giorgi@gmail.com');
/*!40000 ALTER TABLE `pilota_dati_da_gara` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pilota_dati_da_gara_BEFORE_INSERT_checkBrevetto` BEFORE INSERT ON `pilota_dati_da_gara` FOR EACH ROW BEGIN
	IF( new.num_seriale_brevetto <10000000 OR new.num_seriale_brevetto>99999999) THEN
		signal sqlstate '45000' set message_text = 'Il brevetto deve avere un seriale di 8 cifre';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `possesso`
--

DROP TABLE IF EXISTS `possesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possesso` (
  `num_seriale_mezzo` int NOT NULL,
  `cf_pilota` varchar(16) NOT NULL,
  PRIMARY KEY (`num_seriale_mezzo`,`cf_pilota`),
  KEY `possesso_cf_fk_idx` (`cf_pilota`),
  KEY `possesso_num_seriale_fk_idx` (`num_seriale_mezzo`),
  CONSTRAINT `possesso_cf_fk` FOREIGN KEY (`cf_pilota`) REFERENCES `pilota_dati_da_gara` (`cf`),
  CONSTRAINT `possesso_num_seriale_fk` FOREIGN KEY (`num_seriale_mezzo`) REFERENCES `produzione` (`numero_seriale_mezzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possesso`
--

LOCK TABLES `possesso` WRITE;
/*!40000 ALTER TABLE `possesso` DISABLE KEYS */;
INSERT INTO `possesso` VALUES (101,'1234'),(111,'12345'),(404,'CLRTMS04B92DG01E'),(444,'1234'),(888,'98989'),(999,'1234');
/*!40000 ALTER TABLE `possesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premio` (
  `cf_pilota` varchar(16) NOT NULL,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `vincita` int DEFAULT NULL,
  `posizione` int DEFAULT NULL,
  PRIMARY KEY (`cf_pilota`,`nome_competizione`,`edizione_competizione`),
  KEY `premio_competiz_fk_idx` (`nome_competizione`,`edizione_competizione`),
  CONSTRAINT `premio_competiz_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT INTO `premio` VALUES ('1234','Campionati Italiani',2022,2000,1),('12345','Campionati Italiani',2022,1900,2),('98989','Campionati Italiani',2022,1800,3);
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `premio_BEFORE_INSERT_checkPremi` BEFORE INSERT ON `premio` FOR EACH ROW BEGIN
    
	IF( new.posizione = 2 AND  new.vincita>(SELECT vincita FROM premio WHERE posizione =1)) THEN
		signal sqlstate '45000' set message_text = 'Il premio del secondo posto non può essere maggiore del primo';
    END IF;
    
    IF( new.posizione = 3 AND  new.vincita>(SELECT vincita FROM premio WHERE posizione =2)) THEN
		signal sqlstate '45000' set message_text = 'Il premio del terzo posto non può essere maggiore del secondo';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `presidio_medico`
--

DROP TABLE IF EXISTS `presidio_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presidio_medico` (
  `targa_ambulanza` varchar(10) NOT NULL,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  PRIMARY KEY (`targa_ambulanza`,`nome_competizione`,`edizione_competizione`),
  KEY `presidioM_competizione_fk_idx` (`nome_competizione`,`edizione_competizione`),
  CONSTRAINT `presidioM_competizione_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presidio_medico`
--

LOCK TABLES `presidio_medico` WRITE;
/*!40000 ALTER TABLE `presidio_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `presidio_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prod_cart`
--

DROP TABLE IF EXISTS `prod_cart`;
/*!50001 DROP VIEW IF EXISTS `prod_cart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prod_cart` AS SELECT 
 1 AS `data_competizioni`,
 1 AS `nuova_data`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produttore`
--

DROP TABLE IF EXISTS `produttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produttore` (
  `piva` varchar(11) NOT NULL,
  `indirizzo` varchar(20) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`piva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produttore`
--

LOCK TABLES `produttore` WRITE;
/*!40000 ALTER TABLE `produttore` DISABLE KEYS */;
INSERT INTO `produttore` VALUES ('ABCDE12345A','Via Roma 12','Bruce Goldsmith Design'),('ABCDE12345B','Via Napoli 1','Niviuk'),('ABCDE12345C','Via Torino 115','Ozone'),('ABCDE12345D','Via Londra 6','Mac Para'),('ABCDE12345E','Via Sasso 9','Icaro'),('ABCDE12345F','Via Roma 4','Aeros'),('ABCDE12345G','Via Libia 2','Pipistrel'),('ABCDE12345H','Via Milano 8','Gp Gliders'),('ABCDE12345I','Via Palermo 244','Gin Gliders');
/*!40000 ALTER TABLE `produttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produzione`
--

DROP TABLE IF EXISTS `produzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produzione` (
  `numero_seriale_mezzo` int NOT NULL,
  `piva` varchar(11) NOT NULL,
  `modello` varchar(30) NOT NULL,
  PRIMARY KEY (`numero_seriale_mezzo`,`piva`,`modello`),
  KEY `produzione_piva_fk_idx` (`piva`),
  KEY `mezzo_fk` (`numero_seriale_mezzo`,`modello`),
  CONSTRAINT `produzione_piva_fk` FOREIGN KEY (`piva`) REFERENCES `produttore` (`piva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produzione`
--

LOCK TABLES `produzione` WRITE;
/*!40000 ALTER TABLE `produzione` DISABLE KEYS */;
INSERT INTO `produzione` VALUES (101,'ABCDE12345A','Cure2'),(888,'ABCDE12345A','Cure2'),(111,'ABCDE12345C','Enzo3'),(404,'ABCDE12345C','Enzo3'),(999,'ABCDE12345C','Enzo3'),(444,'ABCDE12345F','Combat GT');
/*!40000 ALTER TABLE `produzione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `produzione_BEFORE_INSERT` BEFORE INSERT ON `produzione` FOR EACH ROW BEGIN
	IF( new.numero_seriale_mezzo <100 OR new.numero_seriale_mezzo>999) THEN
		signal sqlstate '45000' set message_text = 'Il numero seriale dev\'essere un numero a 3 cifre';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `soccorso_medico`
--

DROP TABLE IF EXISTS `soccorso_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soccorso_medico` (
  `targa_ambulanza` varchar(10) NOT NULL,
  `numero_unita` int DEFAULT NULL,
  PRIMARY KEY (`targa_ambulanza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccorso_medico`
--

LOCK TABLES `soccorso_medico` WRITE;
/*!40000 ALTER TABLE `soccorso_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `soccorso_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spon_competizione`
--

DROP TABLE IF EXISTS `spon_competizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spon_competizione` (
  `piva` varchar(11) NOT NULL,
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`piva`),
  KEY `spon_compet_fk_competizione_idx` (`nome_competizione`,`edizione_competizione`),
  KEY `spon_compet_fk_piva_idx` (`piva`),
  CONSTRAINT `spon_compet_fk_competizione` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`),
  CONSTRAINT `spon_compet_fk_piva` FOREIGN KEY (`piva`) REFERENCES `sponsor` (`piva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spon_competizione`
--

LOCK TABLES `spon_competizione` WRITE;
/*!40000 ALTER TABLE `spon_competizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `spon_competizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spon_pilota`
--

DROP TABLE IF EXISTS `spon_pilota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spon_pilota` (
  `piva` varchar(11) NOT NULL,
  `cf_pilota` varchar(16) NOT NULL,
  PRIMARY KEY (`piva`,`cf_pilota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Add FK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spon_pilota`
--

LOCK TABLES `spon_pilota` WRITE;
/*!40000 ALTER TABLE `spon_pilota` DISABLE KEYS */;
/*!40000 ALTER TABLE `spon_pilota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `piva` varchar(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`piva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_online`
--

DROP TABLE IF EXISTS `streaming_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streaming_online` (
  `data_orario_inizio` date NOT NULL,
  `data_orario_fine` date NOT NULL,
  `nome_streamer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`data_orario_inizio`,`data_orario_fine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_online`
--

LOCK TABLES `streaming_online` WRITE;
/*!40000 ALTER TABLE `streaming_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `streaming_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `data_inizio` date NOT NULL,
  `data_task` date NOT NULL,
  `punteggio_attribuito` int DEFAULT NULL,
  `numero_boe` int DEFAULT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`data_inizio`,`data_task`),
  CONSTRAINT `task:competizione_fk` FOREIGN KEY (`nome_competizione`, `edizione_competizione`, `data_inizio`) REFERENCES `gara_di_campionato` (`nome_competizione`, `edizione_competizione`, `data_inizio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('Campionati Italiani',2022,'2022-06-08','2022-06-08',250,3),('Campionati Moldavi',2022,'2022-06-15','2022-06-15',120,7),('Trofeo Montegrappa',2022,'2022-06-10','2022-06-17',900,20);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `task_BEFORE_INSERT_check_data_task` BEFORE INSERT ON `task` FOR EACH ROW BEGIN
	DECLARE diff_dates INT;
    SET diff_dates = datediff(new.data_task,new.data_inizio);

	IF( diff_dates<0 OR diff_dates>7) THEN
		signal sqlstate '45000' set message_text = 'La task può avvenire il giorno dell\'inizio del campionato o entro 7 giorni dall\'inizio di essa';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `telefoni_piloti`
--

DROP TABLE IF EXISTS `telefoni_piloti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefoni_piloti` (
  `numero` int NOT NULL,
  `cf_pilota` varchar(16) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `telefoni_cf_fk_idx` (`cf_pilota`),
  CONSTRAINT `telefoni_cf_fk` FOREIGN KEY (`cf_pilota`) REFERENCES `pilota_dati_da_gara` (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefoni_piloti`
--

LOCK TABLES `telefoni_piloti` WRITE;
/*!40000 ALTER TABLE `telefoni_piloti` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefoni_piloti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traccia`
--

DROP TABLE IF EXISTS `traccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traccia` (
  `cf_pilota` varchar(16) NOT NULL,
  `data` date NOT NULL,
  `ora_partenza` time NOT NULL,
  `km_percorsi` double NOT NULL,
  `ora_arrivo` time NOT NULL,
  `luogo_arrivo` varchar(30) NOT NULL,
  `media_oraria` double NOT NULL,
  `luogo_decollo` varchar(30) NOT NULL,
  `tipologia_traccia` char(1) NOT NULL,
  `mezzo` int NOT NULL,
  PRIMARY KEY (`cf_pilota`,`data`,`ora_partenza`),
  KEY `lt_traccia` (`cf_pilota`,`data`,`ora_partenza`),
  KEY `traccia_mezzo_fk_idx` (`mezzo`),
  CONSTRAINT `cf` FOREIGN KEY (`cf_pilota`) REFERENCES `pilota_dati_da_gara` (`cf`),
  CONSTRAINT `traccia_mezzo_fk` FOREIGN KEY (`mezzo`) REFERENCES `possesso` (`num_seriale_mezzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traccia`
--

LOCK TABLES `traccia` WRITE;
/*!40000 ALTER TABLE `traccia` DISABLE KEYS */;
INSERT INTO `traccia` VALUES ('CLRTMS04B92DG01E','2022-06-08','13:14:21',214,'19:31:01','Feltre',35.6,'Feltre','C',404);
/*!40000 ALTER TABLE `traccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trasmissione`
--

DROP TABLE IF EXISTS `trasmissione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trasmissione` (
  `nome_competizione` varchar(50) NOT NULL,
  `edizione_competizione` int NOT NULL,
  `data_orario_inizio` date NOT NULL,
  `data_orario_fine` date NOT NULL,
  PRIMARY KEY (`nome_competizione`,`edizione_competizione`,`data_orario_inizio`,`data_orario_fine`),
  KEY `trasmissione_so_fk_idx` (`data_orario_inizio`,`data_orario_fine`),
  KEY `trasmissione_competizione_fl_idx` (`nome_competizione`,`edizione_competizione`),
  CONSTRAINT `trasmissione_competizione_fl` FOREIGN KEY (`nome_competizione`, `edizione_competizione`) REFERENCES `competizione` (`nome`, `edizione`),
  CONSTRAINT `trasmissione_so_fk` FOREIGN KEY (`data_orario_inizio`, `data_orario_fine`) REFERENCES `streaming_online` (`data_orario_inizio`, `data_orario_fine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Add FK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasmissione`
--

LOCK TABLES `trasmissione` WRITE;
/*!40000 ALTER TABLE `trasmissione` DISABLE KEYS */;
/*!40000 ALTER TABLE `trasmissione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fly_competition'
--

--
-- Dumping routines for database 'fly_competition'
--

--
-- Final view structure for view `data_comp_da_inserire`
--

/*!50001 DROP VIEW IF EXISTS `data_comp_da_inserire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_comp_da_inserire` AS select `gara_di_campionato`.`data_inizio` AS `nuova_data` from `gara_di_campionato` where (('Campionati Italiani' = `gara_di_campionato`.`nome_competizione`) and (2022 = `gara_di_campionato`.`edizione_competizione`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `date`
--

/*!50001 DROP VIEW IF EXISTS `date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `date` AS select `iscrizione`.`cf_pilota` AS `cf_pilota`,`iscrizione`.`nome_competizione` AS `nome_competizione`,`iscrizione`.`edizione_competizione` AS `edizione_competizione`,`gara_di_campionato`.`data_inizio` AS `data_inizio` from (`iscrizione` join `gara_di_campionato` on(((`iscrizione`.`nome_competizione` = `gara_di_campionato`.`nome_competizione`) and (`iscrizione`.`edizione_competizione` = `gara_di_campionato`.`edizione_competizione`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `date_competizioni`
--

/*!50001 DROP VIEW IF EXISTS `date_competizioni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `date_competizioni` AS select `gara_di_campionato`.`data_inizio` AS `data_competizioni` from (`iscrizione` join `gara_di_campionato` on(((`iscrizione`.`nome_competizione` = `gara_di_campionato`.`nome_competizione`) and (`iscrizione`.`edizione_competizione` = `gara_di_campionato`.`edizione_competizione`)))) where (`iscrizione`.`cf_pilota` = 1234) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dati_merged`
--

/*!50001 DROP VIEW IF EXISTS `dati_merged`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dati_merged` AS select `traccia`.`km_percorsi` AS `km_percorsi`,`traccia`.`mezzo` AS `mezzo`,`traccia`.`cf_pilota` AS `cf_pilota` from (`traccia` join `pilota_dati_da_gara` on((`traccia`.`cf_pilota` = `pilota_dati_da_gara`.`cf`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `km_per_mezzo`
--

/*!50001 DROP VIEW IF EXISTS `km_per_mezzo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `km_per_mezzo` AS select `t`.`cf_pilota` AS `cf_pilota`,`t`.`mezzo` AS `mezzo`,sum(`t`.`km_percorsi`) AS `km_effettuati` from (`traccia` `t` join `produzione` `p`) where (`t`.`mezzo` = `p`.`numero_seriale_mezzo`) group by `t`.`cf_pilota`,`t`.`mezzo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `miglior_mezzo_per_pilota`
--

/*!50001 DROP VIEW IF EXISTS `miglior_mezzo_per_pilota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `miglior_mezzo_per_pilota` AS select `km`.`cf_pilota` AS `cf_pilota`,`km`.`mezzo` AS `seriale_mezzo`,max(`km`.`km_effettuati`) AS `km_totali` from `km_per_mezzo` `km` group by `km`.`cf_pilota` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pilota_con_tracce_camp`
--

/*!50001 DROP VIEW IF EXISTS `pilota_con_tracce_camp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pilota_con_tracce_camp` AS select `pdg`.`cf` AS `cf`,`t`.`data` AS `data`,`t`.`ora_partenza` AS `ora_partenza`,`t`.`ora_arrivo` AS `ora_arrivo`,`t`.`tipologia_traccia` AS `tipologia_traccia` from ((`traccia` `t` join `pilota_dati_da_gara` `pdg`) join `iscrizione` `i`) where ((`t`.`cf_pilota` = `pdg`.`cf`) and (`pdg`.`cf` = `i`.`cf_pilota`) and (`t`.`tipologia_traccia` = 'G') and (`t`.`cf_pilota`,`i`.`nome_competizione`,`i`.`edizione_competizione`) in (select `isr`.`cf_pilota`,`gdc`.`nome_competizione`,`gdc`.`edizione_competizione` from (`iscrizione` `isr` join `gara_di_campionato` `gdc`) where ((`isr`.`nome_competizione` = `gdc`.`nome_competizione`) and (`isr`.`edizione_competizione` = `gdc`.`edizione_competizione`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prod_cart`
--

/*!50001 DROP VIEW IF EXISTS `prod_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prod_cart` AS select `date_competizioni`.`data_competizioni` AS `data_competizioni`,`data_comp_da_inserire`.`nuova_data` AS `nuova_data` from (`date_competizioni` join `data_comp_da_inserire`) */;
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23 21:27:43
