-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empresa_tech
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `funcionarios_projetos`
--

DROP TABLE IF EXISTS `funcionarios_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios_projetos` (
  `Funcionarios_idFuncionarios` int NOT NULL,
  `Projetos_idProjetos` int NOT NULL,
  PRIMARY KEY (`Funcionarios_idFuncionarios`,`Projetos_idProjetos`),
  KEY `fk_Funcionarios_has_Projetos_Projetos1_idx` (`Projetos_idProjetos`),
  KEY `fk_Funcionarios_has_Projetos_Funcionarios1_idx` (`Funcionarios_idFuncionarios`),
  CONSTRAINT `fk_Funcionarios_has_Projetos_Funcionarios1` FOREIGN KEY (`Funcionarios_idFuncionarios`) REFERENCES `funcionarios` (`idFuncionarios`),
  CONSTRAINT `fk_Funcionarios_has_Projetos_Projetos1` FOREIGN KEY (`Projetos_idProjetos`) REFERENCES `projetos` (`idProjetos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios_projetos`
--

LOCK TABLES `funcionarios_projetos` WRITE;
/*!40000 ALTER TABLE `funcionarios_projetos` DISABLE KEYS */;
INSERT INTO `funcionarios_projetos` VALUES (2,1),(3,1),(1,2),(6,2),(5,3),(4,4);
/*!40000 ALTER TABLE `funcionarios_projetos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-21 23:15:26
