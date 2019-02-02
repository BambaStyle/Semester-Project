CREATE DATABASE  IF NOT EXISTS `obl-db2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `obl-db2`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: obl-db2
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authors` (
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES ('J.K. Rowling'),('Yossi Ghinsberg');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_author`
--

DROP TABLE IF EXISTS `book_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_has_author` (
  `CatalogueNumber` varchar(45) NOT NULL,
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`CatalogueNumber`,`authorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_author`
--

LOCK TABLES `book_has_author` WRITE;
/*!40000 ALTER TABLE `book_has_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_genre`
--

DROP TABLE IF EXISTS `book_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_has_genre` (
  `books_CatalogueNumber` varchar(45) NOT NULL,
  `genre_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`books_CatalogueNumber`,`genre_Type`),
  KEY `fk_books_has_genre_genre1_idx` (`genre_Type`),
  KEY `fk_books_has_genre_books1_idx` (`books_CatalogueNumber`),
  CONSTRAINT `fk_books_has_genre_books1` FOREIGN KEY (`books_CatalogueNumber`) REFERENCES `books` (`cataloguenumber`),
  CONSTRAINT `fk_books_has_genre_genre1` FOREIGN KEY (`genre_Type`) REFERENCES `genre` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_genre`
--

LOCK TABLES `book_has_genre` WRITE;
/*!40000 ALTER TABLE `book_has_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books` (
  `CatalogueNumber` varchar(45) NOT NULL,
  `PurchaseDate` varchar(45) DEFAULT NULL,
  `ShelfLocation` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Copies` varchar(45) NOT NULL COMMENT 'the total copies in the libarary',
  `AvailableCopies` int(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PrintDate` varchar(45) DEFAULT NULL,
  `Edition` varchar(45) DEFAULT NULL,
  `IsWanted` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `TableOfContents` longblob,
  `Ordered` varchar(45) DEFAULT '0',
  `TableOfContentsFileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CatalogueNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension_tbl`
--

DROP TABLE IF EXISTS `extension_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `extension_tbl` (
  `subscriber_SubscriberNumber` int(11) NOT NULL,
  `CatalogueNumber` varchar(45) NOT NULL,
  `subscriber_user_ID` varchar(45) NOT NULL,
  `requestDate` varchar(45) NOT NULL,
  `isApproved` varchar(45) DEFAULT NULL,
  `LendingDate` varchar(45) NOT NULL,
  `LibrarianName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subscriber_SubscriberNumber`,`subscriber_user_ID`,`CatalogueNumber`,`requestDate`,`LendingDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_tbl`
--

LOCK TABLES `extension_tbl` WRITE;
/*!40000 ALTER TABLE `extension_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `extension_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genre` (
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('Action'),('Drama'),('Educational'),('Fantasy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lendinghistory_tbl`
--

DROP TABLE IF EXISTS `lendinghistory_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lendinghistory_tbl` (
  `CatalogueNumber` varchar(45) NOT NULL,
  `subscriber_SubscriberNumber` varchar(45) NOT NULL,
  `subscriber_user_ID` varchar(10) NOT NULL,
  `BookName` varchar(45) DEFAULT NULL,
  `LendingDate` varchar(45) NOT NULL,
  `ReturnDate` varchar(45) DEFAULT NULL,
  `estBookReturn` varchar(45) DEFAULT NULL,
  `lateReturn` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `BookLost` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`CatalogueNumber`,`subscriber_SubscriberNumber`,`subscriber_user_ID`,`LendingDate`),
  KEY `fk_activityhistory_subscriber1_idx` (`subscriber_SubscriberNumber`,`subscriber_user_ID`),
  KEY `ID_idx` (`subscriber_user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lendinghistory_tbl`
--

LOCK TABLES `lendinghistory_tbl` WRITE;
/*!40000 ALTER TABLE `lendinghistory_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `lendinghistory_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `librarian` (
  `EmployeeNumber` int(11) NOT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `Position` varchar(45) NOT NULL DEFAULT 'Librarian',
  `permission` varchar(45) NOT NULL,
  `user_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`EmployeeNumber`,`user_ID`),
  KEY `fk_librarian_user1_idx` (`user_ID`),
  CONSTRAINT `fk_librarian_user1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1,'A','Manager','All','0');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_to_librarian`
--

DROP TABLE IF EXISTS `messages_to_librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages_to_librarian` (
  `LibrarianID` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Message` varchar(300) NOT NULL,
  `isRead` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LibrarianID`,`Date`,`Message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_to_librarian`
--

LOCK TABLES `messages_to_librarian` WRITE;
/*!40000 ALTER TABLE `messages_to_librarian` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_to_librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_to_subscriber`
--

DROP TABLE IF EXISTS `messages_to_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages_to_subscriber` (
  `ID` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Message` varchar(300) NOT NULL,
  `isRead` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Date`,`Message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_to_subscriber`
--

LOCK TABLES `messages_to_subscriber` WRITE;
/*!40000 ALTER TABLE `messages_to_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_to_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_history_tbl`
--

DROP TABLE IF EXISTS `orders_history_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_history_tbl` (
  `subscriber_SubscriberNumber` int(11) NOT NULL,
  `subscriber_user_ID` varchar(45) NOT NULL,
  `CatalogueNumber` varchar(45) NOT NULL,
  `orderDate` varchar(45) NOT NULL,
  `LendingDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subscriber_SubscriberNumber`,`subscriber_user_ID`,`CatalogueNumber`,`orderDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_history_tbl`
--

LOCK TABLES `orders_history_tbl` WRITE;
/*!40000 ALTER TABLE `orders_history_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_history_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber` (
  `SubscriberNumber` int(11) NOT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'Active' COMMENT 'Active\\\\Frozen\\\\Lock',
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `user_ID` varchar(10) NOT NULL,
  `lateReturns` int(11) DEFAULT '0',
  `IsFirstLogin` varchar(45) DEFAULT '1',
  `IsStudent` varchar(45) DEFAULT NULL,
  `isThirdLate` int(11) DEFAULT NULL,
  PRIMARY KEY (`SubscriberNumber`,`user_ID`),
  KEY `fk_subscriber_user1_idx` (`user_ID`),
  CONSTRAINT `fk_subscriber_user1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_has_book`
--

DROP TABLE IF EXISTS `subscriber_has_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber_has_book` (
  `Subscriber_SubscriberNumber` int(11) NOT NULL,
  `Subscriber_User_ID` varchar(10) NOT NULL,
  `books_CatalogueNumber` varchar(45) NOT NULL,
  `LendingDate` varchar(45) NOT NULL,
  `ReturningDate` varchar(45) DEFAULT NULL,
  `ExtensionDate` varchar(45) DEFAULT NULL,
  `LibrarianName` varchar(45) DEFAULT NULL,
  `estBookReturn` varchar(45) DEFAULT NULL,
  `returningLibrarianName` varchar(45) DEFAULT NULL,
  `extendingLibrarianName` varchar(45) DEFAULT NULL,
  `LibrarianID` varchar(45) DEFAULT NULL,
  `messageSent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Subscriber_SubscriberNumber`,`Subscriber_User_ID`,`books_CatalogueNumber`),
  KEY `fk_Subscriber_has_Book_Subscriber1_idx` (`Subscriber_SubscriberNumber`,`Subscriber_User_ID`),
  KEY `fk_subscriber_has_book_books1_idx` (`books_CatalogueNumber`),
  CONSTRAINT `fk_Subscriber_has_Book_Subscriber1` FOREIGN KEY (`Subscriber_SubscriberNumber`) REFERENCES `subscriber` (`subscribernumber`),
  CONSTRAINT `fk_subscriber_has_book_books1` FOREIGN KEY (`books_CatalogueNumber`) REFERENCES `books` (`cataloguenumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_has_book`
--

LOCK TABLES `subscriber_has_book` WRITE;
/*!40000 ALTER TABLE `subscriber_has_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber_has_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_order_book`
--

DROP TABLE IF EXISTS `subscriber_order_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber_order_book` (
  `Subscriber_SubscriberNumber` int(11) NOT NULL,
  `Subscriber_User_ID` varchar(10) NOT NULL,
  `OrderDate` varchar(45) NOT NULL,
  `ArrivalDate` varchar(45) DEFAULT NULL,
  `books_CatalogueNumber` varchar(45) NOT NULL,
  `PlaceInQueue` int(11) DEFAULT NULL,
  `messageSent` varchar(45) DEFAULT '0',
  PRIMARY KEY (`Subscriber_SubscriberNumber`,`Subscriber_User_ID`,`books_CatalogueNumber`),
  KEY `fk_Subscriber_has_Book1_Subscriber1_idx` (`Subscriber_SubscriberNumber`,`Subscriber_User_ID`),
  KEY `fk_subscriber_order_book_books1_idx` (`books_CatalogueNumber`),
  CONSTRAINT `fk_Subscriber_has_Book1_Subscriber1` FOREIGN KEY (`Subscriber_SubscriberNumber`) REFERENCES `subscriber` (`subscribernumber`),
  CONSTRAINT `fk_subscriber_order_book_books1` FOREIGN KEY (`books_CatalogueNumber`) REFERENCES `books` (`cataloguenumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_order_book`
--

LOCK TABLES `subscriber_order_book` WRITE;
/*!40000 ALTER TABLE `subscriber_order_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber_order_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `ID` varchar(10) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Type` varchar(45) NOT NULL,
  `IsLoggedIn` tinyint(4) DEFAULT '0',
  `DateOfBirth` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0','a','a','check@gmail.com','Checker','Check','Manager',0,'1991-09-13','0542326896');
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

-- Dump completed on 2019-02-02 19:09:30
