CREATE DATABASE  IF NOT EXISTS `modava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `modava`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: modava
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `idCita` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `IdSede` int DEFAULT NULL,
  `Idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  KEY `fkcliente_idx` (`Idcliente`),
  KEY `fkidcitasedes_idx` (`IdSede`),
  CONSTRAINT `fkcita` FOREIGN KEY (`IdSede`) REFERENCES `sedes` (`idsedes`),
  CONSTRAINT `fkcliente` FOREIGN KEY (`Idcliente`) REFERENCES `clientes` (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (111,'2023-11-04 00:00:00',1,123),(112,'2023-11-18 00:00:00',2,123456),(113,'2023-11-11 00:00:00',15,1234),(114,'2023-12-02 00:00:00',10,1234567),(115,'2023-12-09 00:00:00',50,12345);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL,
  `Nombre` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Cedula` int DEFAULT NULL,
  `Telefono` varchar(25) COLLATE utf8mb3_bin DEFAULT NULL,
  `Correo` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `Direccion` varchar(150) COLLATE utf8mb3_bin DEFAULT NULL,
  `Contraseña` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (123,'Monica',0,'3042423914','Monicadaza@gmail.com','Av Clle 21A #20-14','monica123'),(1234,'Vanesa',0,'3107808996','Vanesapuello@gmail.com','Cra 103B #133 A - 27','Vanesa1234'),(12345,'Daniel',0,'3108218785','jdasilvab@hotmail.com','Clle 47A Sur # 31-39','Daniel12345'),(123456,'Cesar',0,'3214918285','leonarcef@gmail.com','Cra 93B # 34- 54 Sur','Cesar123456'),(1234567,'Mateo',0,'3108827892','mateonaranjo@gmail.com','Av Clle 170 # 08 - 70','Mateo1234567');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_cita`
--

DROP TABLE IF EXISTS `detalle_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cita` (
  `idDetalle_Cita` int NOT NULL,
  `IdProfesional` int DEFAULT NULL,
  `Idcita` int DEFAULT NULL,
  `Calificacion` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `IdServicio` int DEFAULT NULL,
  PRIMARY KEY (`idDetalle_Cita`),
  KEY `fkprofesionalcita_idx` (`IdProfesional`),
  KEY `fkDetallecita_idx` (`Idcita`),
  KEY `fkdetalle_servicio_idx` (`IdServicio`),
  CONSTRAINT `fkdetalle_servicio` FOREIGN KEY (`IdServicio`) REFERENCES `servicio` (`idServicio`),
  CONSTRAINT `fkdetallecedula` FOREIGN KEY (`IdProfesional`) REFERENCES `profesional` (`idcedula`),
  CONSTRAINT `fkDetallecita` FOREIGN KEY (`Idcita`) REFERENCES `cita` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cita`
--

LOCK TABLES `detalle_cita` WRITE;
/*!40000 ALTER TABLE `detalle_cita` DISABLE KEYS */;
INSERT INTO `detalle_cita` VALUES (1,2,111,'Bueno',3),(2,1,115,'Excelente',2),(3,4,113,'Excelente',1),(4,3,112,'Buena',2),(5,5,114,'Regular',1);
/*!40000 ALTER TABLE `detalle_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugar` (
  `idLugar` int NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idLugar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (11,'Calle 134'),(12,'CC Palatino/Cedritos'),(13,'Usaquen'),(14,'Rosales'),(15,'Chapinero'),(16,'Calle 96'),(17,'Cabrera'),(18,'Parque El Virrey'),(19,'CC Titan Plaza'),(20,'CC Niza'),(21,'Colina Campestre'),(22,'CC Parque La Colina'),(23,'CC Santa Fe'),(24,'Mallplaza'),(25,'CC Centro Mayor'),(26,'CC Salitre Plaza'),(27,'CC Gran Estacion'),(28,'CC Hayuelos'),(29,'CC Multiplaza'),(30,'Calle 109'),(31,'CC Santa Ana'),(32,'Calle 122'),(33,'CC Unicentro');
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesional`
--

DROP TABLE IF EXISTS `profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesional` (
  `idcedula` int NOT NULL,
  `Nombre` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Telefono` varchar(25) COLLATE utf8mb3_bin DEFAULT NULL,
  `Direccion` varchar(150) COLLATE utf8mb3_bin DEFAULT NULL,
  `Cedula` bigint DEFAULT NULL,
  `Foto` blob,
  `Especialidad` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idcedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesional`
--

LOCK TABLES `profesional` WRITE;
/*!40000 ALTER TABLE `profesional` DISABLE KEYS */;
INSERT INTO `profesional` VALUES (1,'Dayana Gonzalez','3002149884','Av.Clle 15#155A-61',1012352091,NULL,'Esteticista'),(2,'Rosario Villegas','3103560790','Diag.156 B # 14A-40',1014185016,NULL,'Esteticista'),(3,'Maria Romero','3212824523','Clle 25 #68B-30',1049604445,NULL,'Esteticista'),(4,'Gregoria Blanco','3014120812','Cra 73B-#6B-12',1116992450,NULL,'Esteticista'),(5,'Sonia Muñoz','3164576389','Clle 71 #10-07',1091656951,NULL,'Esteticista');
/*!40000 ALTER TABLE `profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `nombre_sede` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `idsedes` int NOT NULL,
  `idspa` int DEFAULT NULL,
  PRIMARY KEY (`idsedes`),
  KEY `fkspa_sede_idx` (`idspa`),
  CONSTRAINT `fkspa_sede` FOREIGN KEY (`idspa`) REFERENCES `spa` (`idSpa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES ('Tanoodle','5675 Carpenter Alley','860-546-3320','Liyang',1,987654321),('Skynoodle','6 Westridge Park','839-614-0767','Pułtusk',2,123456789),('Mydo','9 Longview Way','972-380-9271','Boleiros',3,123456789),('Midel','541 Merchant Avenue','261-190-6460','Krajan Satu',4,123456789),('Realblab','597 Declaration Way','838-647-9300','Sitovo',5,987654321),('Wordware','8491 Maple Wood Lane','102-274-9296','Saḩāb',6,987654321),('Edgewire','62 Monica Way','806-445-6932','Saint-Augustin',7,987654321),('Tagchat','67 Birchwood Park','371-586-1729','Yangzhuang',8,123456789),('Buzzster','38401 Summerview Lane','111-325-7803','Mingjiu',9,987654321),('Mycat','08663 Nobel Point','143-999-1734','Vista Hermosa',10,123456789),('Plajo','0 Steensland Circle','216-106-1219','Aketi',11,123456789),('Jetpulse','117 Corben Hill','695-278-1383','Bene \'Ayish',12,987654321),('Photobug','6412 Burrows Point','347-275-8801','Dongsheng',13,123456789),('Riffpedia','73 Corben Drive','487-705-3512','Piasek',14,987654321),('Dazzlesphere','5167 Cambridge Lane','816-401-9885','Kansas City',15,123456789),('Topdrive','8600 Village Green Lane','850-516-3702','Douentza',50,987654321);
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `idServicio` int NOT NULL,
  `Nombre` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  `Foto` blob,
  `Tipo_servicio` int DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `fktiposervicios_idx` (`Tipo_servicio`),
  CONSTRAINT `fktiposervicios1` FOREIGN KEY (`Tipo_servicio`) REFERENCES `tipos_servicios` (`idTipos_servicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Laminado de cejas',50,NULL,1),(2,'Sombreado de cejas',30,NULL,1),(3,'Semipermanente',50,NULL,2),(4,'Extension de uñas acrilicas',120,NULL,2),(5,'Pedicura tradicional',30,NULL,3);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa`
--

DROP TABLE IF EXISTS `spa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spa` (
  `idSpa` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSpa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa`
--

LOCK TABLES `spa` WRITE;
/*!40000 ALTER TABLE `spa` DISABLE KEYS */;
INSERT INTO `spa` VALUES (123456789,'Barberia'),(987654321,'SuperWow');
/*!40000 ALTER TABLE `spa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_servicios`
--

DROP TABLE IF EXISTS `tipos_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_servicios` (
  `idTipos_servicios` int NOT NULL,
  `Nombre` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idTipos_servicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_servicios`
--

LOCK TABLES `tipos_servicios` WRITE;
/*!40000 ALTER TABLE `tipos_servicios` DISABLE KEYS */;
INSERT INTO `tipos_servicios` VALUES (1,'facial'),(2,'manos'),(3,'pies');
/*!40000 ALTER TABLE `tipos_servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 17:38:59
