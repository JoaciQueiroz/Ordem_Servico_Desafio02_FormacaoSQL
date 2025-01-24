CREATE DATABASE  IF NOT EXISTS `dbcontroleordensservicos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbcontroleordensservicos`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcontroleordensservicos
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
-- Table structure for table `tblcliente`
--

DROP TABLE IF EXISTS `tblcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcliente`
--

LOCK TABLES `tblcliente` WRITE;
/*!40000 ALTER TABLE `tblcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblequipe`
--

DROP TABLE IF EXISTS `tblequipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblequipe` (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblequipe`
--

LOCK TABLES `tblequipe` WRITE;
/*!40000 ALTER TABLE `tblequipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblequipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblequipemecanico`
--

DROP TABLE IF EXISTS `tblequipemecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblequipemecanico` (
  `idEquipeMecanico` int NOT NULL AUTO_INCREMENT,
  `idMecanico` int NOT NULL,
  `idEquipe` int NOT NULL,
  PRIMARY KEY (`idEquipeMecanico`),
  KEY `fk_tblEquipeMecanico_tblMecanico1_idx` (`idMecanico`),
  KEY `fk_tblEquipeMecanico_tblEquipe1_idx` (`idEquipe`),
  CONSTRAINT `fk_tblEquipeMecanico_tblEquipe1` FOREIGN KEY (`idEquipe`) REFERENCES `tblequipe` (`idEquipe`),
  CONSTRAINT `fk_tblEquipeMecanico_tblMecanico1` FOREIGN KEY (`idMecanico`) REFERENCES `tblmecanico` (`idMecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblequipemecanico`
--

LOCK TABLES `tblequipemecanico` WRITE;
/*!40000 ALTER TABLE `tblequipemecanico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblequipemecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmecanico`
--

DROP TABLE IF EXISTS `tblmecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmecanico` (
  `idMecanico` int NOT NULL AUTO_INCREMENT,
  `nomeMecanico` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `tblMecanicocol` varchar(45) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `especializacao` varchar(60) NOT NULL,
  PRIMARY KEY (`idMecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmecanico`
--

LOCK TABLES `tblmecanico` WRITE;
/*!40000 ALTER TABLE `tblmecanico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblordemservico`
--

DROP TABLE IF EXISTS `tblordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblordemservico` (
  `idOrdemServico` int NOT NULL AUTO_INCREMENT,
  `idVeiculo` int NOT NULL,
  `idEquipe` int NOT NULL,
  PRIMARY KEY (`idOrdemServico`),
  KEY `fk_tblOrdemServico_tblVeiculo1_idx` (`idVeiculo`),
  KEY `fk_tblOrdemServico_tblEquipe1_idx` (`idEquipe`),
  CONSTRAINT `fk_tblOrdemServico_tblEquipe1` FOREIGN KEY (`idEquipe`) REFERENCES `tblequipe` (`idEquipe`),
  CONSTRAINT `fk_tblOrdemServico_tblVeiculo1` FOREIGN KEY (`idVeiculo`) REFERENCES `tblveiculo` (`idVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblordemservico`
--

LOCK TABLES `tblordemservico` WRITE;
/*!40000 ALTER TABLE `tblordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpeca`
--

DROP TABLE IF EXISTS `tblpeca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpeca` (
  `idPeca` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idPeca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpeca`
--

LOCK TABLES `tblpeca` WRITE;
/*!40000 ALTER TABLE `tblpeca` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpeca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpecaporordemservico`
--

DROP TABLE IF EXISTS `tblpecaporordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpecaporordemservico` (
  `idPecaPorOS` int NOT NULL AUTO_INCREMENT,
  `tblOrdemServico_idOrdemServico` int NOT NULL,
  `tblPeca_idPeca` int NOT NULL,
  PRIMARY KEY (`idPecaPorOS`),
  KEY `fk_tblPecaPorOrdemServico_tblOrdemServico1_idx` (`tblOrdemServico_idOrdemServico`),
  KEY `fk_tblPecaPorOrdemServico_tblPeca1_idx` (`tblPeca_idPeca`),
  CONSTRAINT `fk_tblPecaPorOrdemServico_tblOrdemServico1` FOREIGN KEY (`tblOrdemServico_idOrdemServico`) REFERENCES `tblordemservico` (`idOrdemServico`),
  CONSTRAINT `fk_tblPecaPorOrdemServico_tblPeca1` FOREIGN KEY (`tblPeca_idPeca`) REFERENCES `tblpeca` (`idPeca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpecaporordemservico`
--

LOCK TABLES `tblpecaporordemservico` WRITE;
/*!40000 ALTER TABLE `tblpecaporordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpecaporordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservico`
--

DROP TABLE IF EXISTS `tblservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblservico` (
  `tblServico` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tblServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservico`
--

LOCK TABLES `tblservico` WRITE;
/*!40000 ALTER TABLE `tblservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicoporordemservico`
--

DROP TABLE IF EXISTS `tblservicoporordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblservicoporordemservico` (
  `idServicoPorOS` int NOT NULL AUTO_INCREMENT,
  `tblServico` int NOT NULL,
  `idOrdemServico` int NOT NULL,
  PRIMARY KEY (`idServicoPorOS`),
  KEY `fk_tblServicoPorOrdemServico_tblServico1_idx` (`tblServico`),
  KEY `fk_tblServicoPorOrdemServico_tblOrdemServico1_idx` (`idOrdemServico`),
  CONSTRAINT `fk_tblServicoPorOrdemServico_tblOrdemServico1` FOREIGN KEY (`idOrdemServico`) REFERENCES `tblordemservico` (`idOrdemServico`),
  CONSTRAINT `fk_tblServicoPorOrdemServico_tblServico1` FOREIGN KEY (`tblServico`) REFERENCES `tblservico` (`tblServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicoporordemservico`
--

LOCK TABLES `tblservicoporordemservico` WRITE;
/*!40000 ALTER TABLE `tblservicoporordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservicoporordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblveiculo`
--

DROP TABLE IF EXISTS `tblveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblveiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `placa` varchar(20) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `ano` varchar(6) NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  KEY `fk_tblVeiculo_tblCliente_idx` (`idCliente`),
  CONSTRAINT `fk_tblVeiculo_tblCliente` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblveiculo`
--

LOCK TABLES `tblveiculo` WRITE;
/*!40000 ALTER TABLE `tblveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblveiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-24 15:00:24
