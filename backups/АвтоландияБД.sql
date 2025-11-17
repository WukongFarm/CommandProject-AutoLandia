-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auto_service
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id_records` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_service` int NOT NULL,
  `start_time_record` datetime NOT NULL,
  `end_time_record` datetime NOT NULL,
  `status_record` enum('Подтвердение','В работе','Завершена','Отменена') NOT NULL,
  `status_pay` enum('Ожидание оплаты','Оплаченно') NOT NULL,
  PRIMARY KEY (`id_records`),
  KEY `FK_record_idx` (`id_user`),
  KEY `SK_record_idx` (`id_service`),
  CONSTRAINT `FK_record` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `SK_record` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,1,1,'2025-10-26 09:00:00','2025-10-26 10:00:00','В работе','Ожидание оплаты'),(2,1,2,'2025-10-26 10:30:00','2025-10-26 11:30:00','Подтвердение','Ожидание оплаты'),(3,1,3,'2025-10-26 14:00:00','2025-10-26 16:00:00','В работе','Ожидание оплаты'),(4,1,4,'2025-10-27 09:00:00','2025-10-27 12:00:00','Завершена','Ожидание оплаты'),(5,1,5,'2025-10-28 10:00:00','2025-10-28 14:00:00','Подтвердение','Ожидание оплаты'),(6,1,1,'2025-10-29 09:00:00','2025-10-29 10:00:00','Отменена','Ожидание оплаты'),(7,1,1,'2025-10-29 09:00:00','2025-10-29 10:00:00','Отменена','Ожидание оплаты'),(8,1,1,'2025-10-29 09:00:00','2025-10-29 10:00:00','Отменена','Ожидание оплаты'),(9,1,1,'2025-10-29 09:00:00','2025-10-29 10:00:00','Подтвердение','Ожидание оплаты');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `name_role` varchar(90) NOT NULL,
  PRIMARY KEY (`id_role`),
  KEY `FK_role_idx` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Клиент'),(2,'Менеджер'),(3,'Бухгалтер'),(4,'Автомеханик');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `name_service` varchar(145) NOT NULL,
  `coast_service` float NOT NULL,
  `description` varchar(145) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Замена масла',1500,'Замена моторного масла и масляного фильтра','https://static.mashagpt.ru/dl/mashagpt/gujwrlza0lv6uyptqqp4qfpl.webp'),(2,'Диагностика',500,'Компьютерная диагностика автомобиля','https://static.mashagpt.ru/dl/mashagpt/aa775eeus1aviru1emv0h77m.webp'),(3,'Замена тормозных колодок',3000,'Замена передних или задних тормозных колодок','https://static.mashagpt.ru/dl/mashagpt/aiuk0m0fwedsc0a33ure0la4.webp'),(4,'Техническое обслуживание',5000,'Полное ТО-1 с заменой расходников','https://static.mashagpt.ru/dl/mashagpt/ldy7r1bnldmuuf971vflql7o.webp'),(5,'Кузовной ремонт',8000,'Рихтовка и покраска кузова','https://static.mashagpt.ru/dl/mashagpt/e1jgtc5lwf908xpth016lplk.webp');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userban`
--

DROP TABLE IF EXISTS `userban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userban` (
  `id_userBan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `descrip` varchar(145) NOT NULL,
  PRIMARY KEY (`id_userBan`),
  KEY `Fk_Ban_idx` (`id_user`),
  CONSTRAINT `Fk_Ban` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userban`
--

LOCK TABLES `userban` WRITE;
/*!40000 ALTER TABLE `userban` DISABLE KEYS */;
INSERT INTO `userban` VALUES (1,1,'Неоплаченные услуги');
/*!40000 ALTER TABLE `userban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `patronymic` varchar(120) NOT NULL,
  `phone_number` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role_user` int NOT NULL,
  `user_status` enum('Активен','Удалён','Забанен') NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FK_idx` (`role_user`),
  KEY `FK_idxR` (`role_user`),
  CONSTRAINT `RoleKey` FOREIGN KEY (`role_user`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иванов','Иван','Иванович','+7-900-123-45-67','ivan.ivanov@mail.ru','pass123',1,'Активен'),(2,'qwe','qwe','qwe','qwe','qwe@qwe','qwe',2,'Активен'),(3,'qwe','qwe','qwe','123','123','123',3,'Активен'),(46,'Швец','Руслан','Сергеевич','89677370084','lainiwhite7886@gmail.com','Pass123@',1,'Активен');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 10:11:15
