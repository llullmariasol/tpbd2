-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: tpbd2
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `amarres`
--

DROP TABLE IF EXISTS `amarres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amarres` (
  `Cod_Muelle` tinyint NOT NULL,
  `Nro_Ubicación_Amarre` tinyint NOT NULL,
  `Cod_Tipo_Amarre` tinyint NOT NULL,
  `Metros_Largo` smallint NOT NULL,
  `Metros_Ancho` smallint NOT NULL,
  PRIMARY KEY (`Cod_Muelle`,`Nro_Ubicación_Amarre`),
  KEY `Cod_Tipo_Amarre` (`Cod_Tipo_Amarre`),
  CONSTRAINT `Cod_Muelle_FK` FOREIGN KEY (`Cod_Muelle`) REFERENCES `muelles` (`Cod_Muelle`),
  CONSTRAINT `Tipos_Amarres_FK` FOREIGN KEY (`Cod_Tipo_Amarre`) REFERENCES `tipos_amarres` (`Cod_Tipo_Amarre`),
  CONSTRAINT `checkmetros` CHECK ((`Metros_Largo` > `Metros_Ancho`)),
  CONSTRAINT `checkmetrosposit` CHECK ((`Metros_Largo` > 0)),
  CONSTRAINT `checkmetrospositiv` CHECK ((`Metros_Ancho` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amarres`
--

LOCK TABLES `amarres` WRITE;
/*!40000 ALTER TABLE `amarres` DISABLE KEYS */;
INSERT INTO `amarres` VALUES (1,1,3,320,45),(1,2,3,300,50),(1,3,2,160,25),(2,1,1,100,20),(2,2,1,110,21),(3,1,2,180,26),(3,2,1,120,18),(4,1,2,200,22),(4,2,2,210,23),(4,3,3,315,50),(5,1,1,89,10),(5,2,1,90,11),(5,3,1,95,12),(6,1,2,140,20),(6,2,3,350,55),(6,3,2,185,16),(7,1,3,350,46),(7,2,1,100,13),(7,3,1,110,15),(7,4,1,86,9),(7,5,2,220,22),(8,1,1,95,17),(8,2,1,65,10),(9,1,2,100,10),(9,2,3,320,43),(9,3,2,250,36);
/*!40000 ALTER TABLE `amarres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `amarresocupados`
--

DROP TABLE IF EXISTS `amarresocupados`;
/*!50001 DROP VIEW IF EXISTS `amarresocupados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `amarresocupados` AS SELECT 
 1 AS `Nro_Ubicación_Amarre`,
 1 AS `Matrícula_Navío`,
 1 AS `FechaSalida_Est`,
 1 AS `Desc_Servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `app_móvil`
--

DROP TABLE IF EXISTS `app_móvil`;
/*!50001 DROP VIEW IF EXISTS `app_móvil`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `app_móvil` AS SELECT 
 1 AS `Fecha_Solicitud`,
 1 AS `Cantidad Servicios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `app_móvil2`
--

DROP TABLE IF EXISTS `app_móvil2`;
/*!50001 DROP VIEW IF EXISTS `app_móvil2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `app_móvil2` AS SELECT 
 1 AS `Fecha_Solicitud`,
 1 AS `Matrícula_Navío`,
 1 AS `Desc_Servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categorías`
--

DROP TABLE IF EXISTS `categorías`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorías` (
  `Cod_Categ` tinyint NOT NULL AUTO_INCREMENT,
  `Desc_Categ` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Categ`),
  UNIQUE KEY `DescCatUNIQUE` (`Desc_Categ`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorías`
--

LOCK TABLES `categorías` WRITE;
/*!40000 ALTER TABLE `categorías` DISABLE KEYS */;
INSERT INTO `categorías` VALUES (5,'DBA'),(1,'Empleado'),(3,'Empresa naviera'),(4,'Otros'),(2,'Responsable general');
/*!40000 ALTER TABLE `categorías` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_navieras`
--

DROP TABLE IF EXISTS `emp_navieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_navieras` (
  `Cod_Emp_Naviera` smallint NOT NULL AUTO_INCREMENT,
  `Nombre_Emp_Naviera` varchar(30) NOT NULL,
  `Cod_País` tinyint NOT NULL,
  PRIMARY KEY (`Cod_Emp_Naviera`),
  KEY `Cod_País` (`Cod_País`),
  CONSTRAINT `emp_navieras_ibfk_1` FOREIGN KEY (`Cod_País`) REFERENCES `países` (`Cod_País`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_navieras`
--

LOCK TABLES `emp_navieras` WRITE;
/*!40000 ALTER TABLE `emp_navieras` DISABLE KEYS */;
INSERT INTO `emp_navieras` VALUES (1,'WanHai Lines',1),(2,'China Ocean',1),(3,'Bayerische',2),(4,'Alianca',3),(5,'Hapag Lloyd',4),(6,'CMA CGM',4);
/*!40000 ALTER TABLE `emp_navieras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `Cod_Equipo` tinyint NOT NULL AUTO_INCREMENT,
  `Cod_Puerto` tinyint NOT NULL,
  `Desc_Equipo` varchar(50) NOT NULL,
  `Año_Compra` smallint DEFAULT NULL,
  `Cod_Prov` tinyint NOT NULL,
  PRIMARY KEY (`Cod_Equipo`),
  KEY `Cod_Puerto` (`Cod_Puerto`),
  KEY `Cod_Prov` (`Cod_Prov`),
  CONSTRAINT `Cod_Prov_FK` FOREIGN KEY (`Cod_Prov`) REFERENCES `proveedores` (`Cod_Prov`),
  CONSTRAINT `Cod_Puerto_FK1` FOREIGN KEY (`Cod_Puerto`) REFERENCES `puertos` (`Cod_Puerto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,1,'Remolcador',1999,1),(2,2,'Remolcador',2005,2),(3,3,'Remolcador',2010,1),(4,4,'Remolcador',2000,1),(5,1,'Puente',2015,2),(6,4,'Puente',2016,2),(7,1,'Escalera',2018,2),(8,4,'Escalera',2013,2),(9,3,'Tanque de agua',2020,1),(10,2,'Camión para efluentes',2009,2),(11,1,'Grúa pórtico',2005,1),(12,2,'Straddle carrier',2010,1),(13,3,'Grúa pórtico',2011,2),(14,4,'Straddle carrier',2012,2);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_cab`
--

DROP TABLE IF EXISTS `facturas_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_cab` (
  `Nro_Factura` int NOT NULL AUTO_INCREMENT,
  `Fecha_Fact` datetime NOT NULL,
  `Monto_Total` int NOT NULL,
  PRIMARY KEY (`Nro_Factura`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_cab`
--

LOCK TABLES `facturas_cab` WRITE;
/*!40000 ALTER TABLE `facturas_cab` DISABLE KEYS */;
INSERT INTO `facturas_cab` VALUES (6,'2020-05-27 00:00:00',11000);
/*!40000 ALTER TABLE `facturas_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_servicios`
--

DROP TABLE IF EXISTS `historial_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_servicios` (
  `Cod_Solicitud` int NOT NULL,
  `Cod_Servicio` tinyint NOT NULL,
  `FechaHora_Inicio` datetime NOT NULL,
  `FechaHora_Fin` datetime NOT NULL,
  PRIMARY KEY (`Cod_Solicitud`,`Cod_Servicio`,`FechaHora_Inicio`),
  CONSTRAINT `historial_servicios_ibfk_1` FOREIGN KEY (`Cod_Solicitud`, `Cod_Servicio`) REFERENCES `servicios_solicitados` (`Cod_Solicitud`, `Cod_Servicio`),
  CONSTRAINT `checkfechahora` CHECK ((`FechaHora_Inicio` < `FechaHora_Fin`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_servicios`
--

LOCK TABLES `historial_servicios` WRITE;
/*!40000 ALTER TABLE `historial_servicios` DISABLE KEYS */;
INSERT INTO `historial_servicios` VALUES (17,1,'2020-05-25 07:00:00','2020-05-25 07:15:00'),(17,2,'2020-05-26 08:00:00','2020-05-26 08:10:00'),(17,3,'2020-05-25 07:00:00','2020-05-26 08:30:00');
/*!40000 ALTER TABLE `historial_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `Cod_Postal` varchar(10) NOT NULL,
  `Nombre_Loc` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Postal`),
  UNIQUE KEY `NombreLocUNIQUE` (`Nombre_Loc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES ('B1625','Buenos Aires'),('2000','Rosario'),('2900','San Nicolás'),('V9410','Ushuaia');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muelles`
--

DROP TABLE IF EXISTS `muelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muelles` (
  `Cod_Muelle` tinyint NOT NULL AUTO_INCREMENT,
  `Cod_Puerto` tinyint NOT NULL,
  `Metros_Calado` float NOT NULL,
  PRIMARY KEY (`Cod_Muelle`),
  KEY `Cod_Puerto_FK2` (`Cod_Puerto`),
  CONSTRAINT `Cod_Puerto_FK2` FOREIGN KEY (`Cod_Puerto`) REFERENCES `puertos` (`Cod_Puerto`),
  CONSTRAINT `checkcalado` CHECK ((`Metros_Calado` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muelles`
--

LOCK TABLES `muelles` WRITE;
/*!40000 ALTER TABLE `muelles` DISABLE KEYS */;
INSERT INTO `muelles` VALUES (1,1,12),(2,1,10),(3,1,11.5),(4,1,13.2),(5,2,9.3),(6,2,10),(7,3,16),(8,4,12.2),(9,4,13);
/*!40000 ALTER TABLE `muelles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navíos`
--

DROP TABLE IF EXISTS `navíos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navíos` (
  `Matrícula_Navío` varchar(10) NOT NULL,
  `Cod_Tipo_Navío` tinyint NOT NULL,
  `Metros_Eslora` smallint NOT NULL,
  `Metros_Manga` smallint NOT NULL,
  `Metros_Calado_Entrada` smallint NOT NULL,
  `Metros_Calado_Salida` smallint NOT NULL,
  `Cod_Emp_Naviera` smallint NOT NULL,
  PRIMARY KEY (`Matrícula_Navío`),
  KEY `Cod_Tipo_Navío` (`Cod_Tipo_Navío`),
  KEY `Cod_Emp_Naviera_FK_idx` (`Cod_Emp_Naviera`),
  CONSTRAINT `Cod_Emp_Naviera_FK` FOREIGN KEY (`Cod_Emp_Naviera`) REFERENCES `emp_navieras` (`Cod_Emp_Naviera`),
  CONSTRAINT `navíos_ibfk_1` FOREIGN KEY (`Cod_Tipo_Navío`) REFERENCES `tipos_navíos` (`Cod_Tipo_Navío`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navíos`
--

LOCK TABLES `navíos` WRITE;
/*!40000 ALTER TABLE `navíos` DISABLE KEYS */;
INSERT INTO `navíos` VALUES ('AL8870',2,300,35,10,11,3),('BR1005',1,220,21,9,10,4),('BR1122',7,300,40,12,12,4),('BR7622',3,100,16,6,6,4),('CH1102',1,130,20,8,8,2),('CH1347',3,175,14,7,8,1),('CH4213',6,120,16,9,9,1),('CH4463',5,250,30,12,12,2),('US2351',2,280,45,10,11,5),('US2356',4,160,23,8,9,6),('US9744',4,270,47,11,11,5);
/*!40000 ALTER TABLE `navíos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `países`
--

DROP TABLE IF EXISTS `países`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `países` (
  `Cod_País` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_País` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod_País`),
  UNIQUE KEY `NombrePaísUNIQUE` (`Nombre_País`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `países`
--

LOCK TABLES `países` WRITE;
/*!40000 ALTER TABLE `países` DISABLE KEYS */;
INSERT INTO `países` VALUES (2,'Alemania'),(3,'Brasil'),(1,'China'),(4,'Estados Unidos');
/*!40000 ALTER TABLE `países` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Cod_Prov` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Prov` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Prov`),
  UNIQUE KEY `NombreProvUNIQUE` (`Nombre_Prov`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Insumos W&T'),(2,'Maquinarias del Este');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puertos`
--

DROP TABLE IF EXISTS `puertos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puertos` (
  `Cod_Puerto` tinyint NOT NULL AUTO_INCREMENT,
  `Cod_Postal` varchar(10) NOT NULL,
  PRIMARY KEY (`Cod_Puerto`),
  KEY `Cod_Postal` (`Cod_Postal`),
  CONSTRAINT `Cod_Postal_FK` FOREIGN KEY (`Cod_Postal`) REFERENCES `localidades` (`Cod_Postal`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puertos`
--

LOCK TABLES `puertos` WRITE;
/*!40000 ALTER TABLE `puertos` DISABLE KEYS */;
INSERT INTO `puertos` VALUES (2,'2000'),(3,'2900'),(1,'B1625'),(4,'V9410');
/*!40000 ALTER TABLE `puertos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puertos_servicios`
--

DROP TABLE IF EXISTS `puertos_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puertos_servicios` (
  `Cod_Puerto` tinyint NOT NULL,
  `Cod_Servicio` tinyint NOT NULL,
  `Tarifa` int NOT NULL,
  `Capacidad_Total` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Puerto`,`Cod_Servicio`),
  KEY `Cod_Servicio` (`Cod_Servicio`),
  CONSTRAINT `Cod_Puerto_FK` FOREIGN KEY (`Cod_Puerto`) REFERENCES `puertos` (`Cod_Puerto`),
  CONSTRAINT `Cod_Servicio_FK` FOREIGN KEY (`Cod_Servicio`) REFERENCES `servicios` (`Cod_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puertos_servicios`
--

LOCK TABLES `puertos_servicios` WRITE;
/*!40000 ALTER TABLE `puertos_servicios` DISABLE KEYS */;
INSERT INTO `puertos_servicios` VALUES (1,1,5000,NULL),(1,2,5000,NULL),(1,3,1000,NULL),(1,4,1000,NULL),(1,5,3000,NULL),(1,6,2000,NULL),(1,7,8000,10000),(1,8,11000,9500),(1,9,500,NULL),(1,10,790,NULL),(2,1,1000,NULL),(2,2,1000,NULL),(2,3,700,NULL),(2,5,3000,NULL),(2,6,1500,NULL),(2,8,13000,3800),(2,12,3500,NULL),(3,1,2500,NULL),(3,2,2500,NULL),(3,3,550,NULL),(3,5,2200,NULL),(3,6,2500,NULL),(3,8,12000,4570),(3,11,2800,NULL),(4,1,900,NULL),(4,2,900,NULL),(4,3,550,NULL),(4,4,1000,NULL),(4,5,4000,NULL),(4,6,1950,NULL),(4,7,8300,8050),(4,8,11500,3250),(4,9,800,NULL),(4,10,770,NULL);
/*!40000 ALTER TABLE `puertos_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `Cod_Servicio` tinyint NOT NULL AUTO_INCREMENT,
  `Desc_Servicio` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Servicio`),
  UNIQUE KEY `DescServUNIQUE` (`Desc_Servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (7,'Almacenamiento de productos a granel'),(1,'Atraque'),(11,'Carga de agua'),(5,'Carga de materiales'),(4,'Carga peligrosa'),(2,'Desatraque'),(12,'Descarga de efluentes'),(6,'Descarga de materiales'),(10,'Escaleras'),(8,'Espacios destinados a contenedores'),(9,'Puentes'),(3,'Uso de amarradero');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_equipos`
--

DROP TABLE IF EXISTS `servicios_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_equipos` (
  `Cod_Puerto` tinyint NOT NULL,
  `Cod_Servicio` tinyint NOT NULL,
  `Cod_Equipo` tinyint NOT NULL,
  PRIMARY KEY (`Cod_Puerto`,`Cod_Servicio`,`Cod_Equipo`),
  KEY `Cod_Equipo` (`Cod_Equipo`),
  CONSTRAINT `Equipos_FK` FOREIGN KEY (`Cod_Equipo`) REFERENCES `equipos` (`Cod_Equipo`),
  CONSTRAINT `Puertos_Servicios_FK` FOREIGN KEY (`Cod_Puerto`, `Cod_Servicio`) REFERENCES `puertos_servicios` (`Cod_Puerto`, `Cod_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_equipos`
--

LOCK TABLES `servicios_equipos` WRITE;
/*!40000 ALTER TABLE `servicios_equipos` DISABLE KEYS */;
INSERT INTO `servicios_equipos` VALUES (1,1,1),(1,2,1),(2,1,2),(2,2,2),(3,1,3),(3,2,3),(4,1,4),(4,2,4),(1,9,5),(1,10,7),(4,10,8),(3,11,9),(2,12,10),(1,4,11),(1,5,11),(1,6,11),(2,5,12),(2,6,12),(3,5,13),(3,6,13),(4,5,14),(4,6,14);
/*!40000 ALTER TABLE `servicios_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_solicitados`
--

DROP TABLE IF EXISTS `servicios_solicitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_solicitados` (
  `Cod_Solicitud` int NOT NULL,
  `Cod_Servicio` tinyint NOT NULL,
  PRIMARY KEY (`Cod_Solicitud`,`Cod_Servicio`),
  KEY `Cod_Servicio` (`Cod_Servicio`),
  CONSTRAINT `servicios_solicitados_ibfk_1` FOREIGN KEY (`Cod_Solicitud`) REFERENCES `solicitudes` (`Cod_Solicitud`),
  CONSTRAINT `servicios_solicitados_ibfk_2` FOREIGN KEY (`Cod_Servicio`) REFERENCES `servicios` (`Cod_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_solicitados`
--

LOCK TABLES `servicios_solicitados` WRITE;
/*!40000 ALTER TABLE `servicios_solicitados` DISABLE KEYS */;
INSERT INTO `servicios_solicitados` VALUES (1,1),(2,1),(17,1),(1,2),(2,2),(17,2),(1,3),(2,3),(17,3),(2,6),(1,9);
/*!40000 ALTER TABLE `servicios_solicitados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `Cod_Solicitud` int NOT NULL AUTO_INCREMENT,
  `Matrícula_Navío` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fecha_Solicitud` date NOT NULL,
  `FechaArribo_Est` date NOT NULL,
  `FechaSalida_Est` date NOT NULL,
  `Estado` char(1) COLLATE utf8mb4_0900_as_cs DEFAULT '\0',
  `Cod_Muelle` tinyint DEFAULT NULL,
  `Nro_Ubicación_Amarre` tinyint DEFAULT NULL,
  `Usuario` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FechaArribo_Real` date DEFAULT NULL,
  `Cod_País_Origen` tinyint NOT NULL,
  `Cod_Tipo_Carga` tinyint DEFAULT NULL,
  `CantCargaOPasajeros` mediumint DEFAULT NULL,
  `MercPeligrosa` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '\0',
  `Nro_Factura` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Solicitud`),
  KEY `Matrícula_Navío` (`Matrícula_Navío`),
  KEY `Cod_Muelle` (`Cod_Muelle`,`Nro_Ubicación_Amarre`) /*!80000 INVISIBLE */,
  KEY `Usuario` (`Usuario`),
  KEY `Cod_Tipo_Carga_FK_idx` (`Cod_Tipo_Carga`),
  KEY `Cod_PaisOrig_FK_idx` (`Cod_País_Origen`),
  KEY `Nro_Fact_FK_idx` (`Nro_Factura`),
  CONSTRAINT `Cod_Tipo_Carga_FK` FOREIGN KEY (`Cod_Tipo_Carga`) REFERENCES `tipos_cargas` (`Cod_Tipo_Carga`),
  CONSTRAINT `Matrícula_Navio_FK` FOREIGN KEY (`Matrícula_Navío`) REFERENCES `navíos` (`Matrícula_Navío`),
  CONSTRAINT `NroFact_FK` FOREIGN KEY (`Nro_Factura`) REFERENCES `facturas_cab` (`Nro_Factura`),
  CONSTRAINT `PaisOrigen_FK` FOREIGN KEY (`Cod_País_Origen`) REFERENCES `países` (`Cod_País`),
  CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`Cod_Muelle`, `Nro_Ubicación_Amarre`) REFERENCES `amarres` (`Cod_Muelle`, `Nro_Ubicación_Amarre`),
  CONSTRAINT `solicitudes_ibfk_4` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`),
  CONSTRAINT `checkfechas` CHECK ((`FechaArribo_Est` < `FechaSalida_Est`))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,'AL8870','2020-05-20','2020-05-24','2020-05-26','0',NULL,NULL,'lenabk','2020-05-24',2,7,2500,'0',NULL),(2,'CH1102','2020-05-21','2020-05-25','2020-05-30','1',4,1,'xinjung','2020-05-25',1,5,850,'0',NULL),(17,'AL8870','2020-05-27','2020-05-25','2020-05-26','1',1,1,'lenabk','2020-05-25',2,7,5000,'0',6);
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `solicitudes` BEFORE INSERT ON `solicitudes` FOR EACH ROW BEGIN
	DECLARE tiponavio TINYINT;
    SET tiponavio = (SELECT N.Cod_Tipo_Navío
		FROM NAVÍOS N, TIPOS_NAVÍOS TN
		WHERE N.Matrícula_Navío = NEW.Matrícula_Navío AND TN.Cod_Tipo_Navío = N.Cod_Tipo_Navío);
    IF tiponavio = 1 THEN SET NEW.Cod_Tipo_Carga = 5;
    ELSEIF tiponavio = 2 THEN SET NEW.Cod_Tipo_Carga = 7;
	ELSEIF tiponavio = 3 THEN SET NEW.Cod_Tipo_Carga = 1;
    ELSEIF tiponavio = 4 THEN SET NEW.Cod_Tipo_Carga = 2;
    ELSEIF tiponavio = 5 THEN SET NEW.Cod_Tipo_Carga = 4;
    ELSEIF tiponavio = 6 THEN SET NEW.Cod_Tipo_Carga = 3;
    ELSEIF tiponavio = 7 THEN SET NEW.Cod_Tipo_Carga = 6, NEW.MercPeligrosa = '1'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `solicitudes_pendientes`
--

DROP TABLE IF EXISTS `solicitudes_pendientes`;
/*!50001 DROP VIEW IF EXISTS `solicitudes_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `solicitudes_pendientes` AS SELECT 
 1 AS `Código de Solicitud`,
 1 AS `Fecha de Arribo`,
 1 AS `Matrícula de Navío`,
 1 AS `Código Empresa Naviera`,
 1 AS `Tipo de Navío`,
 1 AS `Eslora`,
 1 AS `Manga`,
 1 AS `Calado de Entrada`,
 1 AS `Calado de Salida`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipos_amarres`
--

DROP TABLE IF EXISTS `tipos_amarres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_amarres` (
  `Cod_Tipo_Amarre` tinyint NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Amarre` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Amarre`),
  UNIQUE KEY `DescAmarreUNIQUE` (`Desc_Tipo_Amarre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_amarres`
--

LOCK TABLES `tipos_amarres` WRITE;
/*!40000 ALTER TABLE `tipos_amarres` DISABLE KEYS */;
INSERT INTO `tipos_amarres` VALUES (1,'Chico'),(3,'Grande'),(2,'Mediano');
/*!40000 ALTER TABLE `tipos_amarres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_cargas`
--

DROP TABLE IF EXISTS `tipos_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_cargas` (
  `Cod_Tipo_Carga` tinyint NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Carga` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Carga`),
  UNIQUE KEY `DescCargaUNIQUE` (`Desc_Tipo_Carga`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_cargas`
--

LOCK TABLES `tipos_cargas` WRITE;
/*!40000 ALTER TABLE `tipos_cargas` DISABLE KEYS */;
INSERT INTO `tipos_cargas` VALUES (2,'Alimentos'),(6,'Carga pesada'),(3,'Gas licuado'),(5,'General'),(1,'Granos'),(7,'Pasajeros'),(4,'Químicos');
/*!40000 ALTER TABLE `tipos_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_navíos`
--

DROP TABLE IF EXISTS `tipos_navíos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_navíos` (
  `Cod_Tipo_Navío` tinyint NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Navío` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Navío`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_navíos`
--

LOCK TABLES `tipos_navíos` WRITE;
/*!40000 ALTER TABLE `tipos_navíos` DISABLE KEYS */;
INSERT INTO `tipos_navíos` VALUES (1,'Portacontenedores'),(2,'Crucero'),(3,'Buque granelero'),(4,'Buque frigorífico'),(5,'Buque de cargas químicas'),(6,'Buque de gases licuados'),(7,'Buque para heavy lift');
/*!40000 ALTER TABLE `tipos_navíos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Usuario` varchar(30) NOT NULL,
  `Clave` varchar(30) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Cod_Categ` tinyint NOT NULL,
  `Cod_Puerto` tinyint NOT NULL,
  `Cod_Emp_Naviera` smallint DEFAULT NULL,
  PRIMARY KEY (`Usuario`),
  KEY `Cod_Categ` (`Cod_Categ`),
  KEY `Cod_Emp_Naviera_FK_idx` (`Cod_Emp_Naviera`),
  KEY `Cod_Puerto_FK4` (`Cod_Puerto`),
  CONSTRAINT `Cod_Categ_FK` FOREIGN KEY (`Cod_Categ`) REFERENCES `categorías` (`Cod_Categ`),
  CONSTRAINT `Cod_Emp_Naviera_FK1` FOREIGN KEY (`Cod_Emp_Naviera`) REFERENCES `emp_navieras` (`Cod_Emp_Naviera`),
  CONSTRAINT `Cod_Puerto_FK4` FOREIGN KEY (`Cod_Puerto`) REFERENCES `puertos` (`Cod_Puerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('carlaj','carlita888','Carla Juárez','carlajuarez@gmail.com',1,3,NULL),('carlosperes','carl54332','Carlos Pérez','carlosperez@gmail.com',1,1,NULL),('horaciow','hwhw123','Horacio Walker','horaciow@gmail.com',2,4,NULL),('jesidba','jesi123','Jesica Heit','jesiheit@gmail.com',5,1,NULL),('lenabk','lenalena','Lena Berkeley','germanbayer@gmail.com',3,1,3),('lopezpedrito','pedrito77','Pedro López','pedrolopez@gmail.com',2,2,NULL),('resusana','susan123','Susana Re','susanare@gmail.com',2,1,NULL),('sandradem','ss32rt','Sandra Demarchi','sandrad@gmail.com',2,3,NULL),('xinjung','1236xin','Xin Jung','wanhailines@gmail.com',3,1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_serviciosarealizar`
--

DROP TABLE IF EXISTS `vista_serviciosarealizar`;
/*!50001 DROP VIEW IF EXISTS `vista_serviciosarealizar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_serviciosarealizar` AS SELECT 
 1 AS `Número de Puerto`,
 1 AS `Nro. Solicitud`,
 1 AS `Servicio`,
 1 AS `Fecha inicio`,
 1 AS `Fecha fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'tpbd2'
--

--
-- Dumping routines for database 'tpbd2'
--
/*!50003 DROP PROCEDURE IF EXISTS `AltaFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AltaFactura`(IN codsolicitud int)
begin
	declare solic int;
    declare est char(1);
    declare fechapartida date;
    declare negative condition for sqlstate "45000";
    declare monto int;
    declare usu varchar(30);
    declare puerto tinyint;
    declare nrofact int;
    declare fact int;
    set solic = (select S.Cod_Solicitud from Solicitudes S where S.Cod_Solicitud = codsolicitud);
	set est = (select S.Estado from Solicitudes S where S.Cod_Solicitud = codsolicitud);
    set fechapartida = (select S.FechaSalida_Est from Solicitudes S where S.Cod_Solicitud = codsolicitud);
    set usu = (select S.Usuario from solicitudes S where S.Cod_Solicitud = solic);
    set puerto = (select U.Cod_Puerto from Usuarios U where U.Usuario = usu);
    set fact = (select S.Nro_Factura from solicitudes S where S.Cod_Solicitud = solic);
	if solic = null or fact > 0 or est = '0' or fechapartida > date_add(CURDATE(), INTERVAL -1 DAY) or fechapartida < date_add(CURDATE(), INTERVAL -1 DAY) then
		SIGNAL negative;
	else
		-- insertar datos en tablas correspondientes, antes calcular monto
        set monto = (select SUM(PS.Tarifa) from servicios_solicitados SS, puertos_servicios PS where SS.Cod_Solicitud = solic and 
        PS.Cod_Puerto = puerto and SS.Cod_Servicio = PS.Cod_Servicio);
		INSERT INTO facturas_cab(Fecha_Fact, Monto_Total) values(CURDATE(), monto); 
        set nrofact = (SELECT MAX(F.Nro_Factura) from facturas_cab F);
        UPDATE SOLICITUDES SET Nro_Factura = nrofact WHERE Cod_Solicitud = solic;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AltaYValidarSolicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AltaYValidarSolicitud`(IN usuario varchar(30), fechaarribo_est date, fechasalida_est date, matricula varchar(10), codpais tinyint, mercpeligrosa char(1), codtipocarga tinyint, cantidadcarga mediumint)
begin
	declare usu varchar(30);
    declare matric varchar(10);
    declare pais tinyint;
    declare tipocarga tinyint;
    declare solic int;
    declare categ tinyint;
    declare negative condition for sqlstate "45000";
    set usu = (select U.Usuario from Usuarios U where U.Usuario = usuario);
	set matric = (select N.Matrícula_Navío from Navíos N where N.Matrícula_Navío = matricula);
    set pais = (select P.Cod_País from Países P where P.Cod_País = codpais);
    set tipocarga = (select TC.Cod_Tipo_Carga from tipos_cargas TC where TC.Cod_Tipo_Carga = codtipocarga);
    set categ = (select U.Cod_Categ from Usuarios U where U.Usuario = usuario and U.Cod_Categ = 3);
    -- comprobar que tenga la categoría de usuario necesaria (3 en este caso) para dar de alta una solicitud
	if usu = null or matric = null or pais = null or tipocarga = null or categ = null then
		SIGNAL negative;
	else
		-- insertar datos de la solicitud 
		INSERT INTO solicitudes(Matrícula_Navío, Fecha_Solicitud, FechaArribo_Est, FechaSalida_Est, Usuario, Cod_País_Origen, Cod_Tipo_Carga,
        CantCargaOPasajeros, MercPeligrosa, Estado) values(matricula, CURDATE(), fechaarribo_est, fechasalida_est, usuario, codpais, codtipocarga, cantidadcarga, mercpeligrosa, '0');
        -- agregar a servicios_solicitados, los servicios seguros que son 1 2 3, y agregar 4 si la merc es peligrosa.
        -- buscar n° solicitud
        set solic = (SELECT MAX(Cod_Solicitud) FROM solicitudes);
		INSERT INTO servicios_solicitados(Cod_Solicitud, Cod_Servicio) values(solic, 1);
		INSERT INTO servicios_solicitados(Cod_Solicitud, Cod_Servicio) values(solic, 2);
		INSERT INTO servicios_solicitados(Cod_Solicitud, Cod_Servicio) values(solic, 3);
		if mercpeligrosa = 1 then
		 INSERT INTO servicios_solicitados(Cod_Solicitud, Cod_Servicio) values(solic, 4);
		end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `amarresocupados`
--

/*!50001 DROP VIEW IF EXISTS `amarresocupados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amarresocupados` AS select distinct `s`.`Nro_Ubicación_Amarre` AS `Nro_Ubicación_Amarre`,`s`.`Matrícula_Navío` AS `Matrícula_Navío`,`s`.`FechaSalida_Est` AS `FechaSalida_Est`,`se`.`Desc_Servicio` AS `Desc_Servicio` from (((`amarres` `a` join `solicitudes` `s`) join `servicios_solicitados` `ss`) join `servicios` `se`) where ((`s`.`Estado` = 1) and (`s`.`FechaArribo_Est` >= '2020-05-24') and (`s`.`FechaSalida_Est` <= '2020-05-27') and (`ss`.`Cod_Solicitud` = `s`.`Cod_Solicitud`) and (`ss`.`Cod_Servicio` = `se`.`Cod_Servicio`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `app_móvil`
--

/*!50001 DROP VIEW IF EXISTS `app_móvil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `app_móvil` AS select `soli`.`Fecha_Solicitud` AS `Fecha_Solicitud`,count(0) AS `Cantidad Servicios` from (`servicios_solicitados` `ss` join `solicitudes` `soli`) where (`ss`.`Cod_Solicitud` = `soli`.`Cod_Solicitud`) group by `soli`.`Fecha_Solicitud` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `app_móvil2`
--

/*!50001 DROP VIEW IF EXISTS `app_móvil2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `app_móvil2` AS select `soli`.`Fecha_Solicitud` AS `Fecha_Solicitud`,`na`.`Matrícula_Navío` AS `Matrícula_Navío`,`se`.`Desc_Servicio` AS `Desc_Servicio` from (((`servicios_solicitados` `ss` join `solicitudes` `soli`) join `navíos` `na`) join `servicios` `se`) where ((`ss`.`Cod_Solicitud` = `soli`.`Cod_Solicitud`) and (`ss`.`Cod_Servicio` = `se`.`Cod_Servicio`) and (`na`.`Matrícula_Navío` = `soli`.`Matrícula_Navío`)) group by `soli`.`Fecha_Solicitud`,`na`.`Matrícula_Navío`,`se`.`Desc_Servicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `solicitudes_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `solicitudes_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `solicitudes_pendientes` AS select `soli`.`Cod_Solicitud` AS `Código de Solicitud`,`soli`.`FechaArribo_Est` AS `Fecha de Arribo`,`na`.`Matrícula_Navío` AS `Matrícula de Navío`,`emp`.`Cod_Emp_Naviera` AS `Código Empresa Naviera`,`ti`.`Desc_Tipo_Navío` AS `Tipo de Navío`,`na`.`Metros_Eslora` AS `Eslora`,`na`.`Metros_Manga` AS `Manga`,`na`.`Metros_Calado_Entrada` AS `Calado de Entrada`,`na`.`Metros_Calado_Salida` AS `Calado de Salida` from (((`solicitudes` `soli` join `emp_navieras` `emp`) join `navíos` `na`) join `tipos_navíos` `ti`) where ((`soli`.`FechaArribo_Est` >= '2020-05-01') and (`soli`.`FechaSalida_Est` <= '2020-05-31') and (`na`.`Matrícula_Navío` = `soli`.`Matrícula_Navío`) and (`na`.`Cod_Emp_Naviera` = `emp`.`Cod_Emp_Naviera`) and (`ti`.`Cod_Tipo_Navío` = `na`.`Cod_Tipo_Navío`) and (`soli`.`Estado` = '0')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_serviciosarealizar`
--

/*!50001 DROP VIEW IF EXISTS `vista_serviciosarealizar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_serviciosarealizar` AS select distinct `muelles`.`Cod_Puerto` AS `Número de Puerto`,`servicios_solicitados`.`Cod_Solicitud` AS `Nro. Solicitud`,`servicios`.`Desc_Servicio` AS `Servicio`,`historial_servicios`.`FechaHora_Inicio` AS `Fecha inicio`,`historial_servicios`.`FechaHora_Fin` AS `Fecha fin` from (`solicitudes` join (`amarres` join (`muelles` join (`puertos_servicios` join (`servicios` join (`servicios_solicitados` join `historial_servicios` on(((`historial_servicios`.`Cod_Solicitud` = `servicios_solicitados`.`Cod_Solicitud`) and (`historial_servicios`.`Cod_Servicio` = `servicios_solicitados`.`Cod_Servicio`)))) on((`servicios_solicitados`.`Cod_Servicio` = `servicios`.`Cod_Servicio`))) on((`servicios`.`Cod_Servicio` = `puertos_servicios`.`Cod_Servicio`))) on((`puertos_servicios`.`Cod_Puerto` = `muelles`.`Cod_Puerto`))) on((`muelles`.`Cod_Muelle` = `amarres`.`Cod_Muelle`))) on((`solicitudes`.`Cod_Muelle` = `amarres`.`Cod_Muelle`))) where ((`muelles`.`Cod_Puerto` = 1) and (`historial_servicios`.`FechaHora_Inicio` >= '2020-05-25 07:00:00') and (`historial_servicios`.`FechaHora_Fin` <= '2020-05-25 07:30:00')) */;
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

-- Dump completed on 2020-05-27 13:39:23
