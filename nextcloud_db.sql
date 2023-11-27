-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nextcloud_db
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('axis-admin','{\"displayname\":{\"value\":\"axis-admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'axis-admin','displayname','axis-admin'),(2,'axis-admin','address',''),(3,'axis-admin','website',''),(4,'axis-admin','email',''),(5,'axis-admin','phone',''),(6,'axis-admin','twitter',''),(7,'axis-admin','fediverse',''),(8,'axis-admin','organisation',''),(9,'axis-admin','role',''),(10,'axis-admin','headline',''),(11,'axis-admin','biography',''),(12,'axis-admin','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"7\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http:///nextcloud/index.php/apps/files/?dir=/','files',7),(2,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"7\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http:///nextcloud/index.php/apps/files/?dir=/','files',7),(3,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"8\":\"\\/Readme.md\"}]','','[]','/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/','files',8),(4,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"8\":\"\\/Readme.md\"}]','','[]','/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/','files',8),(5,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"9\":\"\\/Photos\"}]','','[]','/Photos','http:///nextcloud/index.php/apps/files/?dir=/','files',9),(6,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"10\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',10),(7,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"10\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',10),(8,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"11\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',11),(9,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"11\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',11),(10,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"12\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',12),(11,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"12\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',12),(12,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"13\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',13),(13,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"13\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',13),(14,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"14\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',14),(15,1700648578,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"14\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',14),(16,1700648578,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"15\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',15),(17,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"15\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',15),(18,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"16\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',16),(19,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"16\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',16),(20,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"17\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',17),(21,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"17\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',17),(22,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"18\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',18),(23,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"18\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http:///nextcloud/index.php/apps/files/?dir=/Photos','files',18),(24,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"19\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',19),(25,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"19\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',19),(26,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"20\":\"\\/Documents\"}]','','[]','/Documents','http:///nextcloud/index.php/apps/files/?dir=/','files',20),(27,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"21\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',21),(28,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"21\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',21),(29,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"22\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',22),(30,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"22\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',22),(31,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"23\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',23),(32,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"23\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',23),(33,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"24\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',24),(34,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"24\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http:///nextcloud/index.php/apps/files/?dir=/Documents','files',24),(35,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"25\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',25),(36,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"25\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http:///nextcloud/index.php/apps/files/?dir=/','files',25),(37,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"26\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http:///nextcloud/index.php/apps/files/?dir=/','files',26),(38,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"26\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http:///nextcloud/index.php/apps/files/?dir=/','files',26),(39,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"27\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http:///nextcloud/index.php/apps/files/?dir=/','files',27),(40,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"27\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http:///nextcloud/index.php/apps/files/?dir=/','files',27),(41,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"28\":\"\\/Templates\"}]','','[]','/Templates','http:///nextcloud/index.php/apps/files/?dir=/','files',28),(42,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"29\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',29),(43,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"29\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',29),(44,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"30\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',30),(45,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"30\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',30),(46,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"31\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',31),(47,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"31\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',31),(48,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"32\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',32),(49,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"32\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',32),(50,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"33\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',33),(51,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"33\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',33),(52,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"34\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',34),(53,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"34\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',34),(54,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"35\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',35),(55,1700648579,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"35\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',35),(56,1700648579,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"36\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',36),(57,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"36\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',36),(58,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"37\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',37),(59,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"37\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',37),(60,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"38\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',38),(61,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"38\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',38),(62,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"39\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',39),(63,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"39\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',39),(64,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"40\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',40),(65,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"40\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',40),(66,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"41\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',41),(67,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"41\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',41),(68,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"42\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',42),(69,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"42\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',42),(70,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"43\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',43),(71,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"43\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',43),(72,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"44\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',44),(73,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"44\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',44),(74,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"45\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',45),(75,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"45\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',45),(76,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"46\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',46),(77,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"46\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',46),(78,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"47\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',47),(79,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"47\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',47),(80,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"48\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',48),(81,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"48\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',48),(82,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"49\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',49),(83,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"49\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',49),(84,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"50\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',50),(85,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"50\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',50),(86,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"51\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',51),(87,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"51\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',51),(88,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"52\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',52),(89,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"52\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',52),(90,1700648580,30,'file_created','axis-admin','axis-admin','files','created_self','[{\"53\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',53),(91,1700648580,30,'file_changed','axis-admin','axis-admin','files','changed_self','[{\"53\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http:///nextcloud/index.php/apps/files/?dir=/Templates','files',53),(92,1700648580,30,'file_changed','axis-admin','axis-admin','files','renamed_self','[{\"28\":\"\\/\\/Mod\\u00e8les\"},{\"28\":\"\\/\\/Templates\"}]','','[]','//Modèles','http:///nextcloud/index.php/apps/files/?dir=/','files',28),(93,1700648580,30,'calendar','axis-admin','axis-admin','dav','calendar_add_self','{\"actor\":\"axis-admin\",\"calendar\":{\"id\":1,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',1),(94,1700648580,30,'contacts','axis-admin','axis-admin','dav','addressbook_add_self','{\"actor\":\"axis-admin\",\"addressbook\":{\"id\":1,\"uri\":\"contacts\",\"name\":\"Contacts\"}}','','[]','','','addressbook',1);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES (1,'principals/users/axis-admin','Contacts','contacts',NULL,1);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes'),('activity','installed_version','2.19.0'),('activity','types','filesystem'),('backgroundjob','lastjob','12'),('circles','enabled','yes'),('circles','installed_version','27.0.1'),('circles','loopback_tmp_path','/nextcloud'),('circles','loopback_tmp_scheme','http'),('circles','types','filesystem,dav'),('cloud_federation_api','enabled','yes'),('cloud_federation_api','installed_version','1.10.0'),('cloud_federation_api','types','filesystem'),('comments','enabled','yes'),('comments','installed_version','1.17.0'),('comments','types','logging'),('contactsinteraction','enabled','yes'),('contactsinteraction','installed_version','1.8.0'),('contactsinteraction','types','dav'),('core','installedat','1700648558.3028'),('core','lastcron','1700761224'),('core','lastupdateResult','[]'),('core','lastupdatedat','1700654486'),('core','oc.integritycheck.checker','[]'),('core','public_files','files_sharing/public.php'),('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),('core','vendor','nextcloud'),('dashboard','enabled','yes'),('dashboard','installed_version','7.7.0'),('dashboard','types',''),('dav','enabled','yes'),('dav','installed_version','1.27.0'),('dav','types','filesystem'),('federatedfilesharing','enabled','yes'),('federatedfilesharing','installed_version','1.17.0'),('federatedfilesharing','types',''),('federation','enabled','yes'),('federation','installed_version','1.17.0'),('federation','types','authentication'),('files','enabled','yes'),('files','installed_version','1.22.0'),('files','types','filesystem'),('files_external','enabled','yes'),('files_external','installed_version','1.19.0'),('files_external','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','2.8.0'),('files_pdfviewer','types',''),('files_reminders','enabled','yes'),('files_reminders','installed_version','1.0.0'),('files_reminders','types',''),('files_rightclick','enabled','yes'),('files_rightclick','installed_version','1.6.0'),('files_rightclick','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','1.19.0'),('files_sharing','types','filesystem'),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','1.17.0'),('files_trashbin','types','filesystem,dav'),('files_versions','enabled','yes'),('files_versions','installed_version','1.20.0'),('files_versions','types','filesystem,dav'),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','2.16.0'),('firstrunwizard','types','logging'),('logreader','enabled','yes'),('logreader','installed_version','2.12.0'),('logreader','types','logging'),('lookup_server_connector','enabled','yes'),('lookup_server_connector','installed_version','1.15.0'),('lookup_server_connector','types','authentication'),('nextcloud_announcements','enabled','yes'),('nextcloud_announcements','installed_version','1.16.0'),('nextcloud_announcements','types','logging'),('notifications','enabled','yes'),('notifications','installed_version','2.15.0'),('notifications','types','logging'),('oauth2','enabled','yes'),('oauth2','installed_version','1.15.1'),('oauth2','types','authentication'),('password_policy','enabled','yes'),('password_policy','installed_version','1.17.0'),('password_policy','types','authentication'),('photos','enabled','yes'),('photos','installed_version','2.3.0'),('photos','lastPlaceMappedUser','axis-admin'),('photos','lastPlaceMappingDone','true'),('photos','types','dav,authentication'),('privacy','enabled','yes'),('privacy','installed_version','1.11.0'),('privacy','types',''),('provisioning_api','enabled','yes'),('provisioning_api','installed_version','1.17.0'),('provisioning_api','types','prevent_group_restriction'),('recommendations','enabled','yes'),('recommendations','installed_version','1.6.0'),('recommendations','types',''),('related_resources','enabled','yes'),('related_resources','installed_version','1.2.0'),('related_resources','types',''),('serverinfo','enabled','yes'),('serverinfo','installed_version','1.17.0'),('serverinfo','types',''),('settings','enabled','yes'),('settings','installed_version','1.9.0'),('settings','types',''),('sharebymail','enabled','yes'),('sharebymail','installed_version','1.17.0'),('sharebymail','types','filesystem'),('support','enabled','yes'),('support','installed_version','1.10.0'),('support','types','session'),('survey_client','enabled','yes'),('survey_client','installed_version','1.15.0'),('survey_client','types',''),('systemtags','enabled','yes'),('systemtags','installed_version','1.17.0'),('systemtags','types','logging'),('text','enabled','yes'),('text','installed_version','3.8.0'),('text','types','dav'),('theming','enabled','yes'),('theming','installed_version','2.2.0'),('theming','types','logging'),('twofactor_backupcodes','enabled','yes'),('twofactor_backupcodes','installed_version','1.16.0'),('twofactor_backupcodes','types',''),('updatenotification','enabled','yes'),('updatenotification','installed_version','1.17.0'),('updatenotification','types',''),('updatenotification','update_check_errors','0'),('user_status','enabled','yes'),('user_status','installed_version','1.7.0'),('user_status','types',''),('viewer','enabled','yes'),('viewer','installed_version','2.1.0'),('viewer','types',''),('weather_status','enabled','yes'),('weather_status','installed_version','1.7.0'),('weather_status','types',''),('workflowengine','enabled','yes'),('workflowengine','installed_version','2.9.0'),('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL,
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'axis-admin','axis-admin','sKMGVryD1yFSbeRV5x6nRcHdsmiKttzcdN6VF+aPWJ3F5FPVppGMlds8uw6HOYARB6gGl2ig0M1Yt9MgCDuyhe+mW9CwV7Fo8jNQlpWfI42XGVu/LrzOI4Akt30xQ63O8RHg+4IZ4s+i0tmVSXFEX+eo5P5ODg1kVzfiqoz3WAEk4zfHpj1UMT7Gnmq79NSslIZDV0FhJKbKe11eX4yezAQyC8MN8kZYhxwLoE6bfC02qh77gvPVZlJvDZ+xpnnEEgLLaza3CXnnmK3ruRo/bEEVKJxOLpfa8Fk7nhmAz2c5d5zpr5BlxMv4KqxdXTB16RCg66SGE+czeBCmaVCgpQ==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','1ce159458ed31dc131fb5abafa24fa0bee521a7cdc8e248e9d0de4cdece3acce23f241c3fe6ca2d23472a5d522895121f24636ee0a3f07f27a23eea234fc1438',0,0,1700656368,1700656248,NULL,NULL,'a2810ffaa78f6dfebf9d419d843e96d562b6f43b3de19a46700a3a6521d764d1e434792049723600ee4fae405a273bfbfedd44c28cb1dea9d5bc4d59e4c977e5df4c1d16db1983c10180338566617b5de5006a578a587655ee971cd6270b52edcded73d46c2eb5409f58e9e9852055bec07bf9a433abb34d255ad906f5602ccdc89d4ca0f9204d12e68b21e4a48f9de0d34fbb24b9af02b358e58cc3326c85581592a21e06b7bd316a55a7899f611ee74f3b8de949394dc46c2f163f74e4eb7b29cea659da0c090d5e1af2ded527c45d1c37bc5d336bf944f637dfe134cc840d480188a08d8bbfd4e029971a80fdaf94af4a3f403b3cb50fc045aa62b24eaa48b4ff49390cd02f1562cba7178832345ba32afb584de3f0092f0894b2d90317277394ba6a661eb3750192c9f97d2f0d1927a79df187f0c05162217913785f013303384ff89840d0a622e84f7f4ec2d9c716ce4e42635e277e5cd32408228f64e87b48c867d2bc282c4ec46a5b07cb9cf06bca2e1c2a29cf0d140e59d86a33618a087aa1230bf5155b4926e928ba86b167e9440cb9fa1ad6b94301fe478507a5b278ed1c957f6c272c51a6aecaaa151792449dca9bc41e6aee1b30f76b6f25df7898432b501d735e6ce3240368c68a75ab7e34204ba2123cb00231f6739bbb741ddcda55f599f1562d93ebf944982ab7ed6eae772303f3c53b962139001ae3a5435e05028c348f7b323ea15cbded40e90c32fa94065236a98417a644dd9840b39764b41cc3cb4a07e8f1a2cef3ffcc5e736c7379f000c7be5fe82f3c74ca526edf0934bfccfe22630c51b9d84c2778659f1117052b0d901c4a13c1e11e7f12584d8abe92c899c35c01114268fcb57febcb6a07de2b56633891878e0c5821d587214e3a0887c05b569a690f646ed39ce8cb95ace104554d67e94b398ccc4eb096a2b82721e9f05d296560ab5c8e2a2ff813f504ea72f2aa0d0a003862c00f1cc1432333e83f1dc45436e96e6265b80b5eac9a54abbfdc01ac8277ab396a2ad3f8b0a6e02c43933389a3f33ce983036e136defbaeb8eba68688a1440c61a3e0c4779df618b380424b5ded012459c4318fa0fdd2a7748c1a5fdc80bbdb71cdc7239355185115cd65b760f41bbdb8c73658542c0f2047b297670d37a1176923c2550f6b3157fad1c183c84e54c2bcc02de2142dd7ab2124cbef459311f70f518063a928d734d291d8c02a1da3ac4d84bc24eed21c0680d78b580fd88a6d9ad8ec0644c3fd425b62267b79959cb388d028a79b81d37dabeaa5f3f3cbdfcc35f8eb3d04a9f30c941943e87ca6e3e7e92bfa91c5ca12464e3a7ce193e5878c2cd3fc526044ba643fe9cc450b76abadbbb22cdbb5c0c6f2c78f483e09d1bf82f9140057fa07b8870d9c5b6eb0260abbfddeec0f86a4c7f82ba74d1c51c369ce227c92f622e4f7c0ce0d6e186ea93d1520260e2c469610f161c23a442e7079078043bf071df8462b7190fef65d4626af7772654163795285d59ce88d082937c3d075eba2c6fe5d2d6ea711755bef36d51c1fa370e59344353953a00f62a97a2a5e9da9f2998b5af9fa182577f0b10eefd4a257d38021f99e9186d0ee26c29896408e44055e6ace9a022de7f80f41174cb687964c3cf53fc5fc596464d7bc22c7334c21a6f502dcd42d86a464ef06e58d0c52b621ae7d8aeb34a98bf4ca1294f7255522a48bef012af8e8192ab747d82f7ceac175bbd30b9be51f42ced3afabd5f39f35b882a76fc435bd855d6d28e5fd01c067392f377fb32d45af4fa2eb37b87be224ac21ec847e916717d4bb791f56d492c38e7ea16e1a6b6e3fc8a4ad9151af48e3492c1d81112b3fbb48a5fae109d8bb9aae46df24ed6b80772f4628a9e3e28918b238dfd8b6d0da46d24e52d83d968238949354c9b18068d2f3c45d241785e9c0cdef8e2f783ae04f5d573a959237879c8959942c18697f03ef34b63ea927162e7a22f2f387127469ab8b112ea1525a58c9bee1a98e86b21a9957c7b55f5ec20b9e777b37cbbde8ebb5c028fa877ca7f666d2961e549caf0a0c84dd44b0127ac5699cb2ea47d033d90296e787f2ec62870f855f78e0a102c128373f62e031ee877f03dc6b9b64ac8f3a64a266766812b370b16497f77cdf3bb4c06735823a5e15cb8a09af7eb9fa463f05268ec8d7ce397f10d9009cf212de7fa88a698b502e25348b696b29a638481cdeee88b2984949a0f60b4c8e9ec69bffe5a1d641e5c670d533c1f7b7fdc2b04c9e894c544f7827d52e0c7c5abe8b33af2c94e98e990d0a751bd2292ff1eaa9662a27df6d2360f98fec504b9483a56f24303ebd4353a93e40375077cb1adb8811647f68396c9ec0336140d9a1502a2bbc30bbc8ad711f262dbb529f233703198b268666eeb2115f90bf3|76c937155c70da392eb47207ff915b18|f5986c3bb84062f8acebbaddbd3a0e41a6a2d93125fe76e3d56d4c006e2acab1094759184dca534ce32934ae75b5b6d3c0ea964d64c30e03ddbce8d6f3f81b35|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz8uNWi7ihVAqCTsgnJRH\ngKgmk20unCeoUrzTW7XIRd3kgY17ZlM7Smz+pID9G3VaGeQOkChEi0j77WKW6Q1w\nxtQ7Alati+RdKUbfKyJmj88s+JOhH4MOyTW+8FDhvmc5Q+XkwFTwGXA+5kyiUjgU\nxQ+teNtlm5q29EehbwzyWD5KS3xcBhn7TQLI1qImdHc0YqKxdLegzKP37ORGmpM/\nWfkrSZ904lXoI1vHSHg9lOO17hRCmn8OVgkteg+PgV2YYruWqXK00uqzU3SV9QER\nQfbNzRs/NIILfIN2BRklyEm9kYStFTdLm19YJBxX6yOJuZtw5LS0JE7OTnqRzR7i\nzQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$VW1kSkJWTzFzUTBUVC91eg$SDyRLzb+pVigY/Z6Yk6fd2gj0u/71f88dbmiI3ozk50'),(2,'axis-admin','axis-admin','wGPGIY/IkmW+/+K3Wxn137KRiyOQerDem+65dHgK+blSHMqVtEc0vaLhXwilNZjjCN2cVwL5607P+3HONFyGDR3nVzgi0sR2UqL0yakEr8Tag3y8DJdBxRYbeBhg5a+5oZo6AOb4SVs9hoIdxScWv9dSBSVirIz9KhqcMZOZsAqtTnj63QGk4cYglzE3eTP9iZi0P/0ptc2mpd69mVOkfiilmb8KwBREG5cibkF2JP60Htt5a5RD592WpXfdSEehdNDOW962LXOfXYYhFMMJ0LQ+WhirBkWem2l8uhoSvb8JH1/GFDra2pBkR80CaJwD5oJZCj7yy+5jsZ7765VXjQ==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','55386f01770844e6b15cb43421ed37475a1d207f82ed57cefdd601d14ce996b62efd9511317adf9603ab357894f4d049e010f01326deb9667f971b3138ca2d4a',0,1,1700761525,1700761524,NULL,NULL,'39a4b65d00c3e9dd8904cb921b8f0bdf3bf34eb24e41c918d3e945cae1a88dad0345b804c8036663b9a1d80a2e2471942c8ba97defd28ade2ffd5602f18a6a2e43d5cafb509be3a0c02642f9bf98561991eff5a0d7edac6766224af2672585bed33fb72d1f7fe821179ab1e0463022c25eab80e47c1f9ce372bbc66cdd5d35ab4e72846b2fe242a8104d5f47349d80d040e937a448eb65e9300b8d3c548bccc4cc59d8894bdb7aa5bb30ac6e1ba094c04b71aa27d0dba3f8f66dba90a8260deb1e655ecdc46f53793a22e92e8b24c5ac325c08062398bf2b372839445e7645d442fe3c96f741cacd581a65d079136fca8b3b1e5f577a66454923ad8ec710c3e9c7fc6134368fa386746aeb087b7fdf26daf96b1f00dd7689c912d5ce841b54d1fb68fc390f1a8687812f742d419795466552222a41f673643a6dfdfa06fe65312a8c15a103487d9ee564fcff4682903a1235fecdeb1035e630e114d084d6d5fbae203b7d82e887a21239981e39acae007cb06c9032c0961cd8dcd022ecb1452899deb27a1e843838bb0075e38ca610bbb44cbabf9a9c03d729bc0f0bbe74184db65394e688f0de8a85eb0535b624d311ba535587f084539aaf04a28b56fc145c434e6a1bfe92da7fa2baaa6fcae1acd0113316d00c6dc93d1d1b0d32eb2b15c9ed683feb45d573afe4d48f24727c447d47c086e32183e0111eb9cd9505bf82a15f660ac8242ef724931348c2aaae7941fb6154988eb85a706ce8eed8c26aaf0bb99466558ea19b9dba3a1808c563c7c77bfb1650c6c92eccc7eb1aa18774ee1a7501de721314b5b97fa9948bd4a486796111ae1c8cf08e8822cd9c4784fdafb4c86e42bdc645c2403e5444ec39f704f81a12d9ffceeb67c134f6fd70764bc222b283d8bfe98dfa87eb532b985c0cf79c8ec528c255db67c3908b185e9990336a372fce66647730da412bd42d455974faeb489018914664126f67cb748c3852f458454f0876726536715e84fe5bce0da4ec67eba4cc0b92e6e802b4c2aa759f3d83b489cc6e17233544e149d58c56b66673373ad70b2793fec72e6deac6fdf829086878cc8f6ecc0bf77c5689734e28e584632c7cfcef253f9eb300b593934fbf9cc51587237882208e3c1d47ff355d3452c5a5bd2ba2c9f67eac88aea23b02a497361f3e1b763ac3fa09e3d0cc7fbe41a49978f9756ed0ea686f66fddd2f2fd98e041c2fe195a41acc4f635400ea029d47023bc3f8feda54bb03af2ed407c77cae74f080369966ca1591800d206ce273c56c8cd8d8a744166bb9ce4a71a0037be3148183f801dcc9e669d8405719cc68fac50b7edca8ed9ab7963f25a39de6e2c03b7499ada1ce7c96b898f81e5781db9a7b5685814a3e86def68653043316d9953161c1521ed5c6d9eb7fc4819282f5ef0c446ff663b9c46a954f071fb6b8bcbfdb545929f90d0b9766179b091fefbe541de11166cad2465744677fd2c8e0c7426fa2b4578adba6ff41665cb9b014f070eda09c72bf6be1044d9263564d559c158117c6d4b5f463ff7513a4a5433280090aa21f8f2337ff3864c72199dd6edd31bd05d5b757c64ac5735617d7a2a48d5d3098a792cf3cbbb917c2d7579fb531152933dd3d6b0e91b32aea442199a164e2f4cdde0b546c3cf8848becfcab0fe7d38f1466dacec4176d449353f02e1013eda0d4bbb44aecf327a53b3ad8fc40ad043fae752c41852f81333a6e80b704cb87e9d98ad585a8fbddb716808ae7e495c644ff4b09ed985ebfcbfbd2ff1f8ce1e86f408d896d87336deafaafe310b2136dd25e8a4bf0fb0ee5c1bdde47dfd927d1dc1fee48481c2964389d0348e25740a20ed563755b81863026d78fa64540f23174b5710899e261c0656246350e7d92abcde3ff12da5efda7d4bfd27b64d5d986ee1ea8ff8f9e160b8bec342c430af445785d0c757f9df1ba448a7ae7911b1498cc03ab38e65c12592f7cb0b0cd86b1168d6bcc2e7368568f957a4c38ecf0ef393db1d96fb161445de530e8b803e451f56ee1103a5f2c15951a99961d474dbd44aaeb461dbd524d5e001697df25697bbd74d17c5a75ab1e43c94a8094dd895d64a9f4546f17f07689f31861cbaa64a89a00b443edb3881a836fe29faf0faa3474b8726dd1c2f3e5c006645cff34ee64a1ee0e9afffeeae64a0cd17119dbffce9f10cc8b9dc4ba0930ededb889893ba3a59a6588305e98335040f646a2993173604d9464a2bb1434b4cbd926ab1a201aec4f46a9915a1247c61c89e717d2ae30a0b15728c6825def4f018cd35b9280ff684bcf07b204cfaad5e05811faf5fe8ff21d077c6dcf410a943166712f4cae69faee137c43c51f63907007a5fe1ff4427e93a00e29218ca20e558290d6b77ad945d0822979fbed71415ad1797e7d7d8a|beed61cc1217b29bb5dc8b059b63f35f|87e545cc70af13ff61a44f925468f2ae065bccee4f127ee3284093ce305519fc6400b24a8d64881dc23fe20e5ef58a150574a415b3cc6eaf4322d8a501f73363|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA8+f+JOTBT3F/+UcW0IGp\nb4YGQkque7XuOLKCPM1jrgKpmuWevAjreoetTyC1lnSFFAG9fLN2morg39/EoGp7\nvd1eoluveH1SohKycmve1Zafp7BDcjMUvPtN7V+nT6Cc908Ea7BYI/hBweKM0dx0\nELsMFIyFdYFHfCgkunjnbuZPLcWSxqeNPChwZowFbR8aLSEPsu/B4ITL2//Tv6i3\nk4mj8h9nR+nRi3vwaiMlUhjHO1yN32jLhPkAyl8vf3GagHQKX6AB7BKenGVRCwue\nkHPQZa+ytVLR7oz2E4p47Lz11caYbfURAg5GQ13MUTOdQC7pav03LHDIGbevn8P9\nAQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$VW1kSkJWTzFzUTBUVC91eg$SDyRLzb+pVigY/Z6Yk6fd2gj0u/71f88dbmiI3ozk50');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/users/axis-admin','Personal','personal',1,NULL,0,'#0082c9',NULL,'VEVENT',0,NULL);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abid` (`addressbookid`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`),
  KEY `dname` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','user:axis-admin:eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','axis-admin','','',1,1,'[]','','2023-11-22 10:22:58',0,''),(2,'SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','app:circles:SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','Circles','','',8193,10001,'[]','','2023-11-22 10:22:58',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','circles',10000,'',NULL,9,'Member','[]','Circles','2023-11-22 10:22:58','',NULL,'2023-11-22 10:22:58'),(2,'eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','axis-admin',1,'','SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL',9,'Member','[]','axis-admin','2023-11-22 10:22:58','',NULL,'2023-11-22 10:22:58');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL',9,'SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL','SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL',1,'[\"SnprzgR2IMi1YrdVUdqDnsxWWEEGNtL\"]'),('eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','eCYsfhXtbQZwur1sJBrJC3O9N11nT1s',9,'eCYsfhXtbQZwur1sJBrJC3O9N11nT1s','eCYsfhXtbQZwur1sJBrJC3O9N11nT1s',1,'[\"eCYsfhXtbQZwur1sJBrJC3O9N11nT1s\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_applicable`
--

DROP TABLE IF EXISTS `oc_external_applicable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_applicable` (
  `applicable_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`applicable_id`),
  UNIQUE KEY `applicable_type_value_mount` (`type`,`value`,`mount_id`),
  KEY `applicable_mount` (`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_applicable`
--

LOCK TABLES `oc_external_applicable` WRITE;
/*!40000 ALTER TABLE `oc_external_applicable` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_applicable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_config`
--

DROP TABLE IF EXISTS `oc_external_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_mount_key` (`mount_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_config`
--

LOCK TABLES `oc_external_config` WRITE;
/*!40000 ALTER TABLE `oc_external_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_mounts`
--

DROP TABLE IF EXISTS `oc_external_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_mounts` (
  `mount_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_point` varchar(128) NOT NULL,
  `storage_backend` varchar(64) NOT NULL,
  `auth_backend` varchar(64) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 100,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_mounts`
--

LOCK TABLES `oc_external_mounts` WRITE;
/*!40000 ALTER TABLE `oc_external_mounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_external_options`
--

DROP TABLE IF EXISTS `oc_external_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_external_options` (
  `option_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_mount_key` (`mount_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_external_options`
--

LOCK TABLES `oc_external_options` WRITE;
/*!40000 ALTER TABLE `oc_external_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_external_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/3ea0069ddd7447215976649a145e0f54',1700652220),(2,0,'files/bbbd4b38a03d4e5461546c0349d8e436',1700652221),(3,0,'files/edcb76cbacee3b6e03fee56cc2b34857',1700652221),(4,0,'files/89590d4338ec204db78163138b11d121',1700652221),(5,0,'files/06125cc86f0e9add3772f33c5de58ffb',1700652221),(6,0,'files/d1000a564548173c422f253fbd4bdf17',1700652221),(7,0,'files/a5246806dc851bfeac378b668a828029',1700652221),(8,0,'files/a49e70774666f5cfc3ffe86a1dba1c51',1700652221),(9,0,'files/8dfd337d47adac39d261cd12ee0e7dbc',1700652221),(10,0,'files/f6a3b1aa4bf80e05a6878f48922adbf4',1700652221),(11,0,'files/14a29aec5b4932b11e2dbd1e5297b352',1700652221),(12,0,'files/1ad62689c6e06b95deabb4c637fd8d2f',1700652221),(13,0,'files/a55b4c801d2a30959285906ff53a0c49',1700652221),(14,0,'files/3f511b20cf8668fc3d449c0be945134b',1700652221),(15,0,'files/14d7a5f6c1941566c6fa627fccb46f92',1700652221),(16,0,'files/bb5285b1181af2fd31a1dee2a7751e78',1700652221),(17,0,'files/0bb9851e017e9a459d6fc2a2bff44a90',1700652221),(18,0,'files/be1238b30361452f985b203c49584c62',1700652221),(19,0,'files/90ac5f47a25d0b10e2ef5279263fd85e',1700652221),(20,0,'files/6049de3d295cb2d1ad692fc014251a4c',1700652221),(21,0,'files/33beac7f6ef8e86baef2dc056ce9c0da',1700652221),(22,0,'files/3da334a7c9a73d9e3dc92327b5c6e620',1700652221),(23,0,'files/60a675568610f13f0d4d9eb01a363e45',1700652221),(24,0,'files/e284c3d4add703b07bb6467196c3286f',1700652221),(25,0,'files/6ef6776a186b487d937a9fd860944663',1700652221),(26,0,'files/a8ec017af51c0c802786996e114c06e4',1700652221),(28,0,'files/e929b3ad4237bff7b5beaea758e8198a',1700652221),(29,0,'files/88b27fb6a1b0923cfcb5b3580df8187a',1700658048),(30,0,'files/d34fdf55a03a4d4cd50b2f8dd28caa03',1700652306),(31,0,'files/561aac3320d01827fcfdeb691b5a31ba',1700652221),(32,0,'files/f7f6f7097a4052375ad48728e8c04d4c',1700652221),(36,0,'files/3e3180772ad15412dab5e258cf1081da',1700652221),(37,0,'files/fa908746aa88eae85ec4114db1aa66e0',1700652221),(38,0,'files/711e6d184e773ff367a18da5f3d3264c',1700652221),(39,0,'files/9050d7c50a083953261735de3737b4da',1700652221),(40,0,'files/1589c7d0d76161d709018a9d7cfae58d',1700652221),(41,0,'files/f1b43997649b447dfdf4e58bd3949bb6',1700652221),(44,0,'files/43e11044e3bd81a8e37099579efa0195',1700652221),(49,0,'files/d66d3ab6f963e50ff5a6544c79db05de',1700652221),(50,0,'files/884a907a7b7f064abd5c74d3ae6dde02',1700652221),(51,0,'files/3a467c17d9ca9e2e523e55df2d1dbe2d',1700652221),(52,0,'files/5e13ba06158d7aad15830b6953762273',1700652221),(53,0,'files/5e9a0139db156314bab5ad125600bc92',1700652221),(54,0,'files/33ff24c14eb89a7673d63e8da97c9691',1700652221),(55,0,'files/50c36ee84082bde3d7264cea3879b08d',1700652221),(59,0,'files/402729686ce19eb2e483526e2f384a56',1700652221),(63,0,'files/a85cb87f50a1f82775279f0d1e65a1c6',1700652221),(64,0,'files/a08d543eb711891e668a10bfa12867fc',1700652221),(65,0,'files/fb4f6be7a3a7450dc4ea361f75d5e39a',1700652221),(66,0,'files/9ed368f91d4c4ac2a6a9d0922d4cd8ed',1700652221),(67,0,'files/9907499acc085e25df7d6e3cc980b458',1700652221),(68,0,'files/953488ca8159798e46bb09498a26e6b7',1700652221),(69,0,'files/066c4b9da317887edbad687aacb14a6b',1700652221),(70,0,'files/8dcfc7737e42ab3b3c4e3e20e8796550',1700652221),(74,0,'files/b232c27a051f211e4c33fef214d53fe4',1700652304),(75,0,'files/c1976c83eba2c27c4911f14d5c44db94',1700652304),(76,0,'files/bead38cb580f6cea2c23b85cf2026461',1700652304),(77,0,'files/8d233fe20ebe3eb25498df4d6f5184ea',1700652304),(78,0,'files/4527733fbe3958cf3d92a174b169fee8',1700652304),(79,0,'files/c9d9cde723a74858543c64c9697b867c',1700652304),(80,0,'files/ff968a3254b33daa537b513f783793a8',1700652304),(81,0,'files/8f60c5c9a483ab3099e980c8d4fea0ce',1700652304),(84,0,'files/8b9f70aa10a22ace2209618ac280aeb5',1700652304),(85,0,'files/3caba5d1c7ed41b9c0b9569fd675360d',1700652304),(86,0,'files/9656bc5bc78120157825af3f5c4f1209',1700652304),(87,0,'files/34ff03a0af07e00eb929574f9f0691d4',1700652304),(88,0,'files/08fedd3ce01893ad03516c445f8d1fdf',1700652304),(89,0,'files/7ee3323943a00108e612173d0ab8ccc4',1700652304),(90,0,'files/872b8dcf270a104f3f63a3abef37a091',1700652304),(91,0,'files/395a92bc985870d14899a3556a83d0bb',1700652304),(92,0,'files/c5f08f62bac5fb0963c486f848d86c8a',1700652306),(98,0,'files/22ff9f9d80152078508dc14bfd32cc0d',1700658048);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_metadata`
--

DROP TABLE IF EXISTS `oc_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_metadata` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_metadata`
--

LOCK TABLES `oc_file_metadata` WRITE;
/*!40000 ALTER TABLE `oc_file_metadata` DISABLE KEYS */;
INSERT INTO `oc_file_metadata` VALUES (7,'size','{\"width\":500,\"height\":500}'),(11,'size','{\"width\":1600,\"height\":1066}'),(12,'size','{\"width\":1600,\"height\":1067}'),(13,'size','{\"width\":1600,\"height\":1067}'),(14,'size','{\"width\":1920,\"height\":1281}'),(15,'size','{\"width\":1600,\"height\":1067}'),(16,'size','{\"width\":1200,\"height\":1800}'),(17,'size','{\"width\":3000,\"height\":2000}'),(18,'size','{\"width\":1600,\"height\":1067}');
/*!40000 ALTER TABLE `oc_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_parent` (`parent`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,37549142,1700761218,1700761218,0,0,'655f8e82e9508',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,37549142,1700648580,1700648580,0,0,'655dd684d9995',31,''),(3,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1700654448,1700654448,0,0,'655ded7067b25',23,''),(4,2,'appdata_oc3a4dnnzqr6','c4ad071f46613cd84c2d9d580c86653a',3,'appdata_oc3a4dnnzqr6',2,1,0,1700654448,1700654448,0,0,'655dd6826fc2b',31,''),(5,2,'appdata_oc3a4dnnzqr6/photos','cb5986b1f15f681df5b215939a042fa0',4,'photos',2,1,0,1700648578,1700648578,0,0,'655dd6827278a',31,''),(6,2,'appdata_oc3a4dnnzqr6/photos/geonames','4f2bd9b3b37b7e5378549cc553c726c6',5,'geonames',2,1,0,1700648578,1700648578,0,0,'655dd68274d45',31,''),(7,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',4,3,50598,1700648578,1700648578,0,0,'feebfe668ab2c1a36586767e50389476',27,''),(8,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',6,5,206,1700648578,1700648578,0,0,'f245435dbf728dbdc694437f56ab4545',27,''),(9,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1700648579,1700648579,0,0,'655dd6832747e',31,''),(10,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',9,'Readme.md',6,5,150,1700648578,1700648578,0,0,'788ab759c7fbf61c53b8217a76604eb1',27,''),(11,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',9,'Library.jpg',7,3,2170375,1700648578,1700648578,0,0,'bec9645de249b19af0d59974d21383c8',27,''),(12,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',9,'Gorilla.jpg',7,3,474653,1700648578,1700648578,0,0,'bb85593c4ba26cae499c39b9e766d3a6',27,''),(13,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',9,'Toucan.jpg',7,3,167989,1700648578,1700648578,0,0,'437f65ec0f291d50d736bd7b0304bc12',27,''),(14,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',9,'Vineyard.jpg',7,3,427030,1700648578,1700648578,0,0,'84295622b8404c9e8d6a915799ecb381',27,''),(15,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',9,'Frog.jpg',7,3,457744,1700648578,1700648578,0,0,'84e672b2f69e918216f4e467f822e1b8',27,''),(16,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',9,'Steps.jpg',7,3,567689,1700648579,1700648579,0,0,'b06f82eefe3262b1cc58178bb456c875',27,''),(17,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',9,'Nextcloud community.jpg',7,3,797325,1700648579,1700648579,0,0,'6ce9643370e3951ef42210568fa84a2d',27,''),(18,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',9,'Birdie.jpg',7,3,593508,1700648579,1700648579,0,0,'e76c6bdc5b9fceda6f40ff72bbc4cc5f',27,''),(19,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',9,8,15069794,1700648579,1700648579,0,0,'1954b59295e9d4646bc72b521ae347bf',27,''),(20,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1700648579,1700648579,0,0,'655dd68373287',31,''),(21,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',20,'Readme.md',6,5,136,1700648579,1700648579,0,0,'5e367e0d78550751aee63c0f92850aa2',27,''),(22,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',20,'Nextcloud flyer.pdf',9,8,1083339,1700648579,1700648579,0,0,'e7eddcf6dc547c2cb12af4431a22bf5a',27,''),(23,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',20,'Example.md',6,5,1095,1700648579,1700648579,0,0,'26e6c69b0d8adf24e618c3140d947891',27,''),(24,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',20,'Welcome to Nextcloud Hub.docx',10,8,24295,1700648579,1700648579,0,0,'1a54c4afcf7573cfc03b7f8b309104a4',27,''),(25,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',9,8,976625,1700648579,1700648579,0,0,'80346d2ab90869169079460993ce8c2c',27,''),(26,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',12,11,3963036,1700648579,1700648579,0,0,'7974e5c1be0e76efc69ec1141565be2e',27,''),(27,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',2,'Templates credits.md',6,5,2403,1700648579,1700648579,0,0,'85a643d7b959cb702efdb355184971bf',27,''),(28,1,'files/Modèles','c383bdb412226c98c6aff8329740cf98',2,'Modèles',2,1,10721152,1700648580,1700648580,0,0,'655dd684c8da0',31,''),(29,1,'files/Modèles/Business model canvas.odg','ab9fcdff13d1fd859d7836413ddb5ca3',28,'Business model canvas.odg',13,8,16988,1700648579,1700648579,0,0,'1a002fcd7a8e3a3e4fb17e0d3efc8fbe',27,''),(30,1,'files/Modèles/Timesheet.ods','7f0cc5a61420a7f65ebdb765222a93f5',28,'Timesheet.ods',14,8,88394,1700648579,1700648579,0,0,'3083642d5449b5b62cdc073b4c54aec7',27,''),(31,1,'files/Modèles/Readme.md','b6707620836319e7d2283111008bb097',28,'Readme.md',6,5,554,1700648579,1700648579,0,0,'661ff4807bc0d11bded6cec3c90f9c61',27,''),(32,1,'files/Modèles/Gotong royong.odp','f79a4dc3abde3efafd469ca65373af8d',28,'Gotong royong.odp',15,8,3509628,1700648579,1700648579,0,0,'83911182e0770fb20d5295be893a50fd',27,''),(33,1,'files/Modèles/Resume.odt','3ea0ddbce77d993b4ecf4e6b6cc03975',28,'Resume.odt',16,8,39404,1700648579,1700648579,0,0,'9865ae4778909b7dd08da424f2745f33',27,''),(34,1,'files/Modèles/Business model canvas.ods','97d3836a244f26a79c8bd9f021738f69',28,'Business model canvas.ods',14,8,52843,1700648579,1700648579,0,0,'f809c57692eebbf9fa9f8d8312f62328',27,''),(35,1,'files/Modèles/Diagram & table.ods','3582ff36e4ee457de884283340ade535',28,'Diagram & table.ods',14,8,13378,1700648579,1700648579,0,0,'9980309ada2bbed3236aba220a8024d8',27,''),(36,1,'files/Modèles/Flowchart.odg','521b480aac3f23e4748d74af98a8139c',28,'Flowchart.odg',13,8,11836,1700648579,1700648579,0,0,'d601a3353f4bb31afe5e1541a4a47f39',27,''),(37,1,'files/Modèles/Expense report.ods','11abc7eb7c946bc057525db4a69470f9',28,'Expense report.ods',14,8,13441,1700648580,1700648580,0,0,'60a302567e69b6383920de670000d07f',27,''),(38,1,'files/Modèles/Meeting notes.md','47c4d16bb04ec460ab4b03949d5b5f4e',28,'Meeting notes.md',6,5,326,1700648580,1700648580,0,0,'22a2d6c6dd2475fcb586b620dcb85a51',27,''),(39,1,'files/Modèles/Yellow idea.odp','95cbfe8452366beab0cd3e23be704db3',28,'Yellow idea.odp',15,8,81196,1700648580,1700648580,0,0,'cb609a5e7d1ff043e71dbdda5de55bf5',27,''),(40,1,'files/Modèles/Party invitation.odt','6fc4fc09f040fadbcf8a440cb0e90fe0',28,'Party invitation.odt',16,8,868111,1700648580,1700648580,0,0,'5f21820d81fc9e882eb4af5f8fe487a0',27,''),(41,1,'files/Modèles/Photo book.odt','f17b1b56c3af45224c308c8ef2dafa7a',28,'Photo book.odt',16,8,5155877,1700648580,1700648580,0,0,'3a236e4483e226cfb92bd43ed4ed12f2',27,''),(42,1,'files/Modèles/Product plan.md','92725efee5a2092a27815b6d2ce55fc9',28,'Product plan.md',6,5,573,1700648580,1700648580,0,0,'9f1973e454201bce0bd247958bdf4e9d',27,''),(43,1,'files/Modèles/Mother\'s day.odt','3972ff8b7b08f725004c38b72af0f9f3',28,'Mother\'s day.odt',16,8,340061,1700648580,1700648580,0,0,'037e4b7609242d3d0819ba67179dbfd8',27,''),(44,1,'files/Modèles/Impact effort matrix.whiteboard','e352fe4a411e73546adb0a5b91a635d6',28,'Impact effort matrix.whiteboard',17,8,52674,1700648580,1700648580,0,0,'7e8a91bbb2f38c8dc5606455541361e3',27,''),(45,1,'files/Modèles/Simple.odp','d042bb9978ce8440e206259d07eef599',28,'Simple.odp',15,8,14810,1700648580,1700648580,0,0,'32d223b1482617d011b6a2d75d49478f',27,''),(46,1,'files/Modèles/Letter.odt','f4dc7dc422b42252acca40a95b6ac1c6',28,'Letter.odt',16,8,15961,1700648580,1700648580,0,0,'fa9cf1158d6fae708c3e72a47b58e46f',27,''),(47,1,'files/Modèles/Syllabus.odt','d1fcbeab1c3511c69729883f407057fb',28,'Syllabus.odt',16,8,30354,1700648580,1700648580,0,0,'e8af36dff705a65841f050674fefde58',27,''),(48,1,'files/Modèles/Modern company.odp','703aed025c59d4911d117dff167e5b81',28,'Modern company.odp',15,8,317015,1700648580,1700648580,0,0,'eefe079c6135b1618a4e99364a392cc6',27,''),(49,1,'files/Modèles/SWOT analysis.whiteboard','c2d40c422cb07ec685ebfff854e1b7f5',28,'SWOT analysis.whiteboard',17,8,38605,1700648580,1700648580,0,0,'aa43aca559c02a81db4351f9b5ff5795',27,''),(50,1,'files/Modèles/Invoice.odt','2a4ecb0ac12c5fd98b0843d1cc53b2e2',28,'Invoice.odt',16,8,17276,1700648580,1700648580,0,0,'d457a96c6d8cdd6312a7180529153dcd',27,''),(51,1,'files/Modèles/Mindmap.odg','6c1a96660bb6340a992bece06779862a',28,'Mindmap.odg',13,8,13653,1700648580,1700648580,0,0,'03d571138033309b85139999160e9ac4',27,''),(52,1,'files/Modèles/Org chart.odg','b659ac31f8ce8f469c9450b0223e63a2',28,'Org chart.odg',13,8,13878,1700648580,1700648580,0,0,'c800e72dde3f93e1061aa5621c5c198b',27,''),(53,1,'files/Modèles/Elegant.odp','45079a713138598a765cedcec432408c',28,'Elegant.odp',15,8,14316,1700648580,1700648580,0,0,'ebe92ed4466feca8d5093170827ec121',27,''),(54,2,'appdata_oc3a4dnnzqr6/js','508f75be776c08a3575b51e07d1f62b4',4,'js',2,1,0,1700648698,1700648698,0,0,'655dd6a79ff7f',31,''),(55,2,'appdata_oc3a4dnnzqr6/js/core','434f40ef148dd3badf33f2dd0e580457',54,'core',2,1,0,1700648615,1700648615,0,0,'655dd6a7a1a48',31,''),(56,2,'appdata_oc3a4dnnzqr6/js/core/merged-template-prepend.js','26d0b590da0a4b1c3ce6208a1513a252',55,'merged-template-prepend.js',18,8,12238,1700648615,1700648615,0,0,'8c3ba4be6952685bcb41f8468d8ee576',27,''),(57,2,'appdata_oc3a4dnnzqr6/js/core/merged-template-prepend.js.deps','776af2226c39ed5b6816b85b43ecb808',55,'merged-template-prepend.js.deps',17,8,290,1700648615,1700648615,0,0,'d44e2e012f64d9e0e61253633e002718',27,''),(58,2,'appdata_oc3a4dnnzqr6/js/core/merged-template-prepend.js.gzip','6a8c972d3534ef8760d4a88f9740271f',55,'merged-template-prepend.js.gzip',19,8,3098,1700648615,1700648615,0,0,'96aea4def9a6fd2db09ae94b92d08d24',27,''),(59,2,'appdata_oc3a4dnnzqr6/avatar','8a58d6837f68eeffd6602bad83f60fbb',4,'avatar',2,1,0,1700648620,1700648620,0,0,'655dd6ac017d5',31,''),(60,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin','19b541b3e1e1cbf29badfbd46759ffd6',59,'axis-admin',2,1,0,1700654698,1700654698,0,0,'655dd6ac044bf',31,''),(61,2,'appdata_oc3a4dnnzqr6/preview','58fada610d0905aabeba3dacd15006f5',4,'preview',2,1,0,1700648620,1700648620,0,0,'655dd6aceebad',31,''),(62,2,'appdata_oc3a4dnnzqr6/preview/d','d8b39d44a06cf7c6ad8136d700914df0',61,'d',2,1,-1,1700648620,1700648620,0,0,'655dd6ad0321a',31,''),(63,2,'appdata_oc3a4dnnzqr6/preview/d/6','bf139fc6a76382fb30eeca00a98855b1',62,'6',2,1,-1,1700648620,1700648620,0,0,'655dd6ad02a43',31,''),(64,2,'appdata_oc3a4dnnzqr6/preview/d/6/7','fe02d911680e9ba6355d38eebb545ebe',63,'7',2,1,-1,1700648620,1700648620,0,0,'655dd6ad02433',31,''),(65,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d','6d05b61b1616f5c93a6f0ff434e26bfe',64,'d',2,1,-1,1700648620,1700648620,0,0,'655dd6ad01f23',31,''),(66,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8','0d33f805d851bf6a464cae1512cea290',65,'8',2,1,-1,1700648620,1700648620,0,0,'655dd6ad01a03',31,''),(67,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8/a','1ca49b7cd393590db640aca6f1003daa',66,'a',2,1,-1,1700648620,1700648620,0,0,'655dd6ad008a3',31,''),(68,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8/a/b','ebcc8e111373b62882d4690a2ce3f724',67,'b',2,1,-1,1700648620,1700648620,0,0,'655dd6ad00337',31,''),(69,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8/a/b/39','3d7ecd51355d83b16fdf09e86038fead',68,'39',2,1,0,1700648621,1700648621,0,0,'655dd6acf3f7f',31,''),(70,2,'appdata_oc3a4dnnzqr6/preview/3','28853828fb8f1f95f6574d51f4974268',61,'3',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0ab8d',31,''),(71,2,'appdata_oc3a4dnnzqr6/preview/3/4','48c8b202aa03517066bb8d2b2c8294b8',70,'4',2,1,-1,1700648621,1700648621,0,0,'655dd6ad09777',31,''),(72,2,'appdata_oc3a4dnnzqr6/preview/a','299bb1f1fd7f321211c7d8c377be9b8a',61,'a',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0c1d2',31,''),(73,2,'appdata_oc3a4dnnzqr6/preview/3/4/1','9ee24168d37ac2dd48b734101fe9f9bd',71,'1',2,1,-1,1700648621,1700648621,0,0,'655dd6ad088c6',31,''),(74,2,'appdata_oc3a4dnnzqr6/preview/a/5','4d22c9cee52d0ace6d8854f19b508deb',72,'5',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0d8bc',31,''),(76,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6','80834180a363bfa81fa70f80d1774142',73,'6',2,1,-1,1700648621,1700648621,0,0,'655dd6ad07bae',31,''),(77,2,'appdata_oc3a4dnnzqr6/preview/a/5/b','1ce35d48f7d68ed63b41127f458938ae',74,'b',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0a447',31,''),(78,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a','eb4152e1970ba14d3951c1953013086b',76,'a',2,1,-1,1700648621,1700648621,0,0,'655dd6ad06ea3',31,''),(79,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f','640b965788b976b630064d8f24305d09',77,'f',2,1,-1,1700648621,1700648621,0,0,'655dd6ad08fd9',31,''),(80,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a/7','362d4d9a7c232d8c6bf5b0c16775969e',78,'7',2,1,-1,1700648621,1700648621,0,0,'655dd6ad063dc',31,''),(81,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin/avatar-dark.png','5bed4ceed7987653ab38a983d56ceb4d',60,'avatar-dark.png',4,3,18648,1700653243,1700653243,0,0,'6d777f95de1cd9e7aa1ba720e1529bdd',27,''),(82,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c','ba4aa18530771c2754c94c354b9fcf9e',79,'c',2,1,-1,1700648621,1700648621,0,0,'655dd6ad07fdb',31,''),(83,2,'appdata_oc3a4dnnzqr6/preview/a/5/7','3d4f2a1d4c32479d87d3b0997dea22a7',74,'7',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0b6f1',31,''),(84,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a/7/5','89fffbff12667952f5a96efdfe262238',80,'5',2,1,-1,1700648621,1700648621,0,0,'655dd6ad05b79',31,''),(85,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c/9','4627ffce1ff7cf2b195fe1518b697039',82,'9',2,1,-1,1700648621,1700648621,0,0,'655dd6ad07095',31,''),(86,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a/7/5/41','c5d7fdd1179382876a70e46b3f7a2cf1',84,'41',2,1,0,1700648621,1700648621,0,0,'655dd6ad039d4',31,''),(87,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7','bce8446c4e918ca4af0bc9b5d618098e',83,'7',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0a957',31,''),(88,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin/generated','c31d911343280013f8967d10cb137156',60,'generated',17,8,0,1700654698,1700654698,0,0,'5487d29beaeb3718bd61aa0d9258fb08',27,''),(89,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c/9/e','c75ec7ecd2d66dac99237351cc1156e0',85,'e',2,1,-1,1700648621,1700648621,0,0,'655dd6ad06625',31,''),(90,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1','471b1d18a6cc8055d3b3a8fecd34bbe4',87,'1',2,1,-1,1700648621,1700648621,0,0,'655dd6ad0995b',31,''),(91,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c/9/e/37','2e5c0f101d637ae3c202e056c281149c',89,'37',2,1,0,1700648621,1700648621,0,0,'655dd6ad048f7',31,''),(92,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1/b','8a621754a1f1774526aacd76599f4a7d',90,'b',2,1,-1,1700648621,1700648621,0,0,'655dd6ad08dce',31,''),(93,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8/a/b/39/512-288-max.png','71363d21a96e8ca957b3d2cf25efd053',69,'512-288-max.png',4,3,13279,1700648621,1700648621,0,0,'90061142656199a7ca1a9eef676ffab7',27,''),(94,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1/b/c','f009e547b7c80f3047d7ab401e943275',92,'c',2,1,-1,1700648621,1700648621,0,0,'655dd6ad07d72',31,''),(95,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1/b/c/38','07eece7be29a57528f57d4ec60aad4d1',94,'38',2,1,0,1700648622,1700648622,0,0,'655dd6ad05856',31,''),(96,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin/avatar-dark.64.png','bb7acd20465864d9e0ab5f90ed2ba0aa',60,'avatar-dark.64.png',4,3,930,1700648621,1700648621,0,0,'64967d83b8acb31d641469a661189e04',27,''),(97,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c/9/e/37/236-255-max.png','13724a072902676e58e1d4d136e1e719',91,'236-255-max.png',4,3,4699,1700648621,1700648621,0,0,'097c544922ba8e5495cd23f50c4f451f',27,''),(98,2,'appdata_oc3a4dnnzqr6/preview/a/5/b/f/c/9/e/37/236-236-crop.png','40bb365c6cfb0ad7db654bfd28cc8b37',91,'236-236-crop.png',4,3,14704,1700648621,1700648621,0,0,'2818ac59683ab6ba4c1cdde3eae97631',27,''),(99,2,'appdata_oc3a4dnnzqr6/preview/d/6/4','1b35ad526a6c4e1a9a0e7ec0cd53c915',63,'4',2,1,-1,1700648621,1700648621,0,0,'655dd6ad35f41',31,''),(100,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5','b8a8869830800d163097f7a4c3716676',99,'5',2,1,-1,1700648621,1700648621,0,0,'655dd6ad35a85',31,''),(101,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9','303aea5ae05dae4a4c2a11fab0dac219',100,'9',2,1,-1,1700648621,1700648621,0,0,'655dd6ad35593',31,''),(102,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9/2','10f13ef798cdcbafeef88fed02ecb726',101,'2',2,1,-1,1700648621,1700648621,0,0,'655dd6ad34f03',31,''),(103,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9/2/0','ae94a24384b8048007b633efa069108c',102,'0',2,1,-1,1700648621,1700648621,0,0,'655dd6ad34a3c',31,''),(104,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9/2/0/40','3a0842d4cca1110759cc67b04bac0572',103,'40',2,1,0,1700648621,1700648621,0,0,'655dd6ad344f6',31,''),(105,2,'appdata_oc3a4dnnzqr6/preview/d/6/7/d/8/a/b/39/256-256-crop.png','e73bc3f58dea13f31bebc30e078a65d3',69,'256-256-crop.png',4,3,35751,1700648621,1700648621,0,0,'17f2e02e47636356bad33dabcb8485e4',27,''),(106,2,'appdata_oc3a4dnnzqr6/preview/a/1','44d7f68e4e82e127eceedd177f5c9890',72,'1',2,1,-1,1700648621,1700648621,0,0,'655dd6ad68dc0',31,''),(107,2,'appdata_oc3a4dnnzqr6/preview/a/1/d','ff7f451fad9790253f5ac2cabf1245d0',106,'d',2,1,-1,1700648621,1700648621,0,0,'655dd6ad68933',31,''),(108,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0','ee50ae2e8731018999c7f55d1cc69fb5',107,'0',2,1,-1,1700648621,1700648621,0,0,'655dd6ad68470',31,''),(109,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c','907fdf1899adf7a58a8f6efd3e8aac75',108,'c',2,1,-1,1700648621,1700648621,0,0,'655dd6ad67f3b',31,''),(110,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c/6','5c29a7df5a31099d97e071e39c84a93b',109,'6',2,1,-1,1700648621,1700648621,0,0,'655dd6ad67a74',31,''),(111,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c/6/e','ab542307064176db680876fbb7686ea0',110,'e',2,1,-1,1700648621,1700648621,0,0,'655dd6ad67571',31,''),(112,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c/6/e/42','918b40443d41535d64a993ae4900b7f1',111,'42',2,1,0,1700648622,1700648622,0,0,'655dd6ad66ced',31,''),(113,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a/7/5/41/362-512-max.png','6af9f3508c72ed780c8674a7ddcafebd',86,'362-512-max.png',4,3,88877,1700648621,1700648621,0,0,'0d43927ee65deca1ae6007e7a47ab6b7',27,''),(114,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1/b/c/38/4096-4096-max.png','827b2afa823e1d3c2bfd7526efd72736',95,'4096-4096-max.png',4,3,69608,1700648621,1700648621,0,0,'b3d8281edf53539a11b23d470c2f6001',27,''),(115,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c/6/e/42/4096-4096-max.png','b833f12f393a5474db78f657557923bc',112,'4096-4096-max.png',4,3,67723,1700648621,1700648621,0,0,'f0b74ade2b405be936cdd86ee828cf53',27,''),(116,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9/2/0/40/361-512-max.png','f021af849ed2d2b5d08628eb46b7babc',104,'361-512-max.png',4,3,66899,1700648621,1700648621,0,0,'8911a607013befe927a6c105d5498540',27,''),(117,2,'appdata_oc3a4dnnzqr6/preview/3/4/1/6/a/7/5/41/256-256-crop.png','c425814c45f2624275cf1a03221cf0fe',86,'256-256-crop.png',4,3,131528,1700648621,1700648621,0,0,'73544d1f31db06c2e18413904bc7d388',27,''),(118,2,'appdata_oc3a4dnnzqr6/preview/d/6/4/5/9/2/0/40/256-256-crop.png','a68643d140271b038db4a5de57f57816',104,'256-256-crop.png',4,3,105636,1700648621,1700648621,0,0,'730d439527c94af8095a6e5ff13748ed',27,''),(119,2,'appdata_oc3a4dnnzqr6/preview/1','fd61cc5871db40bbde419b1f49df42c0',61,'1',2,1,-1,1700648621,1700648621,0,0,'655dd6ade2d9c',31,''),(120,2,'appdata_oc3a4dnnzqr6/preview/1/7','824c2c0db2b93e563c16ded078d46f0f',119,'7',2,1,-1,1700648621,1700648621,0,0,'655dd6ade2834',31,''),(121,2,'appdata_oc3a4dnnzqr6/preview/1/7/e','8f734f6e4097c5fdd82107c088019cbc',120,'e',2,1,-1,1700648621,1700648621,0,0,'655dd6ade2325',31,''),(122,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6','7fe4573836ccd27cadf099a48117fa31',121,'6',2,1,-1,1700648621,1700648621,0,0,'655dd6ade1ceb',31,''),(123,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2','935d0278ed920a49b4498ad270f4d0c0',122,'2',2,1,-1,1700648621,1700648621,0,0,'655dd6ade1820',31,''),(124,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2/1','5ae149aa9a3d4c7aef3ff9b4298f73a1',123,'1',2,1,-1,1700648621,1700648621,0,0,'655dd6ade1262',31,''),(125,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2/1/6','8529eb74318c57d46d30c5c628166988',124,'6',2,1,-1,1700648621,1700648621,0,0,'655dd6ade0a4b',31,''),(126,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2/1/6/43','6bb7ecc31ba304e0a551891528954917',125,'43',2,1,0,1700648622,1700648622,0,0,'655dd6ade043a',31,''),(127,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2/1/6/43/361-512-max.png','aaa2d7cee004b498654c4eb14248a32a',126,'361-512-max.png',4,3,76482,1700648622,1700648622,0,0,'f71fcb7d1165a88739029424335f4d1d',27,''),(128,2,'appdata_oc3a4dnnzqr6/preview/a/1/d/0/c/6/e/42/256-256-crop.png','652b86e53743660b598af58533255208',112,'256-256-crop.png',4,3,12156,1700648622,1700648622,0,0,'6f5f5e8de4de166ba027112a81949f9b',27,''),(129,2,'appdata_oc3a4dnnzqr6/preview/a/5/7/7/1/b/c/38/256-256-crop.png','0f4954bf253cde76b8b82453450606ea',95,'256-256-crop.png',4,3,12517,1700648622,1700648622,0,0,'e98de9201760f22d30a42d8a9f979483',27,''),(130,2,'appdata_oc3a4dnnzqr6/preview/1/7/e/6/2/1/6/43/256-256-crop.png','673d358c38d7a98f9160f2a325d93471',126,'256-256-crop.png',4,3,114521,1700648622,1700648622,0,0,'0c19bec9133b0853e84e6b3ca716c205',27,''),(131,2,'appdata_oc3a4dnnzqr6/theming','4462ea524318ba43c80ee9956c939c58',4,'theming',2,1,0,1700648622,1700648622,0,0,'655dd6aee2960',31,''),(132,2,'appdata_oc3a4dnnzqr6/theming/global','a041cf2730af07d32303cd6244b76004',131,'global',2,1,0,1700648622,1700648622,0,0,'655dd6aee50c4',31,''),(133,2,'appdata_oc3a4dnnzqr6/theming/global/0','07a900269fad4440ecae0fce26083c5d',132,'0',2,1,0,1700760424,1700760424,0,0,'655dd6aee8655',31,''),(134,2,'appdata_oc3a4dnnzqr6/theming/global/0/favIcon-dashboard#0082c9','90fcc59ee39e8fe80c1d0db37751a96d',133,'favIcon-dashboard#0082c9',17,8,90022,1700648623,1700648623,0,0,'75c0cf04f293b588d2792ee0e32995e1',27,''),(135,2,'appdata_oc3a4dnnzqr6/js/files','6fc3ea7fcc42adf4a6ebec717070742d',54,'files',2,1,0,1700648698,1700648698,0,0,'655dd6fa92fef',31,''),(136,2,'appdata_oc3a4dnnzqr6/js/files/merged-index.js','76d2435bff0a33bf92975e1092cc7b81',135,'merged-index.js',18,8,423882,1700648698,1700648698,0,0,'81fae0e2b935068747a4a0b3f37a4f36',27,''),(137,2,'appdata_oc3a4dnnzqr6/js/files/merged-index.js.deps','6bef8610ee23e9a5a31819125b1c07e7',135,'merged-index.js.deps',17,8,2371,1700648698,1700648698,0,0,'33f084c90beb18fe78c22e5358817a8e',27,''),(138,2,'appdata_oc3a4dnnzqr6/js/files/merged-index.js.gzip','7f0d1e72bb984578c36ef31d2f4b12c1',135,'merged-index.js.gzip',19,8,95988,1700648698,1700648698,0,0,'5b0e21771dcda77b1731c9d0a4fa8119',27,''),(139,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_x-office-spreadsheet.svg','9e417ed1b590f1acb0b5c0c51d384d3f',133,'icon-core-#0082c9filetypes_x-office-spreadsheet.svg',20,3,327,1700648703,1700648703,0,0,'a1a2b112d9ddf9b30da5ab2ca54f91e2',27,''),(140,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_text.svg','9a12e117e02a0b3a18b5183e90a17245',133,'icon-core-#0082c9filetypes_text.svg',20,3,295,1700648703,1700648703,0,0,'5ca82404cc076cab96c6beef239f3a33',27,''),(141,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_x-office-document.svg','0d69e5230dced98cdc593653f204300c',133,'icon-core-#0082c9filetypes_x-office-document.svg',20,3,295,1700648703,1700648703,0,0,'b6b111d23ea86ceb2d16f14f13743029',27,''),(142,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_x-office-presentation.svg','547947320c46fae62a14c70742fbe492',133,'icon-core-#0082c9filetypes_x-office-presentation.svg',20,3,261,1700648703,1700648703,0,0,'7c5d036d3151a8c834cd3ec142a7178d',27,''),(143,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_image.svg','2ef48c14f95e56533cf2dfff1c3b55a5',133,'icon-core-#0082c9filetypes_image.svg',20,3,352,1700648703,1700648703,0,0,'e40eb96f95e530809feb0a06c7467284',27,''),(144,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_video.svg','c2993cc550642c1897e19a4d75f30869',133,'icon-core-#0082c9filetypes_video.svg',20,3,277,1700648704,1700648704,0,0,'8cb8025ac54ff672f5673b9831e46274',27,''),(145,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_folder.svg','ee51f8cfdedb7988ea3957704ff7409f',133,'icon-core-#0082c9filetypes_folder.svg',20,3,255,1700648704,1700648704,0,0,'159aeb69fd03a9dd0fbec102878336ba',27,''),(146,2,'appdata_oc3a4dnnzqr6/theming/global/0/icon-core-#0082c9filetypes_application-pdf.svg','d6370a080cf547f6c4eb3788051fa6a1',133,'icon-core-#0082c9filetypes_application-pdf.svg',20,3,1038,1700648704,1700648704,0,0,'48de1c98a9f20ea3a87c5b8bc824cef1',27,''),(147,2,'appdata_oc3a4dnnzqr6/preview/0','737e9772756d7baf8c0d8672797ce9f0',61,'0',2,1,-1,1700648704,1700648704,0,0,'655dd7003b5aa',31,''),(148,2,'appdata_oc3a4dnnzqr6/preview/0/2','1d7f834c53ad3916f9806b3fba7204b4',147,'2',2,1,-1,1700648704,1700648704,0,0,'655dd7003aac3',31,''),(149,2,'appdata_oc3a4dnnzqr6/preview/0/2/e','8360d048613963438ec1ddd82a0c3196',148,'e',2,1,-1,1700648704,1700648704,0,0,'655dd7003a202',31,''),(150,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7','16129a4b7aabdf66c3a9a18ca00dfc9c',149,'7',2,1,-1,1700648704,1700648704,0,0,'655dd70039bc4',31,''),(151,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4','a0dd49a24d1eb513ef82e151db5b2ee4',150,'4',2,1,-1,1700648704,1700648704,0,0,'655dd70039642',31,''),(152,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4/f','b05b9588f3625b1458ad3ef41a07013b',151,'f',2,1,-1,1700648704,1700648704,0,0,'655dd700389d9',31,''),(153,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4/f/1','27188bb740d44e289eedaff6c3ea321a',152,'1',2,1,-1,1700648704,1700648704,0,0,'655dd700381f1',31,''),(154,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4/f/1/27','323ee6085f85df7b83f3152daa04ed93',153,'27',2,1,0,1700648705,1700648705,0,0,'655dd7003795d',31,''),(155,2,'appdata_oc3a4dnnzqr6/preview/8','267c24f8ba2874af441b6601334d6234',61,'8',2,1,-1,1700648705,1700648705,0,0,'655dd700718bd',31,''),(156,2,'appdata_oc3a4dnnzqr6/preview/8/f','16128d611837e5740e9517eacfecee18',155,'f',2,1,-1,1700648704,1700648704,0,0,'655dd700724d4',31,''),(157,2,'appdata_oc3a4dnnzqr6/preview/8/f/1','77c7659aae1550d024d99f213f1f7b33',156,'1',2,1,-1,1700648704,1700648704,0,0,'655dd70072b28',31,''),(158,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4','35fc5cb9dfa3966f9139f15885582ecc',157,'4',2,1,-1,1700648704,1700648704,0,0,'655dd700725c1',31,''),(159,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e','536468807b8d2f8feac3b2afb4a82243',158,'e',2,1,-1,1700648704,1700648704,0,0,'655dd70072123',31,''),(160,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e/4','8a4624789583c6131616f768337169fb',159,'4',2,1,-1,1700648704,1700648704,0,0,'655dd70071bb1',31,''),(161,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e/4/5','15e44cce0e1c0c773eb4d8ab8f7ecd6a',160,'5',2,1,-1,1700648704,1700648704,0,0,'655dd70071543',31,''),(162,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e/4/5/7','c4f48c9ae111ac7821e42c89a5729dfa',161,'7',2,1,0,1700648704,1700648704,0,0,'655dd7006f6d1',31,''),(163,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4/f/1/27/4096-4096-max.png','c537fcb44e1774750abbe3f02f0b3b42',154,'4096-4096-max.png',4,3,198113,1700648704,1700648704,0,0,'62f2f6b72f677b1a7593a368e3db5c95',27,''),(164,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e/4/5/7/500-500-max.png','cc8bcea0c8d2e2564ef8e34b816979f6',162,'500-500-max.png',4,3,50545,1700648704,1700648704,0,0,'fee149877ed0b13056d5d8da7be63ecf',27,''),(165,2,'appdata_oc3a4dnnzqr6/preview/8/4096-4096-max.png','7c6da00c01b5214089212b809291e966',155,'4096-4096-max.png',4,3,47775,1700648704,1700648704,0,0,'03b33746646138dd091cabb464bdee01',27,''),(166,2,'appdata_oc3a4dnnzqr6/preview/8/f/1/4/e/4/5/7/256-256.png','275ed20fd1b8c7da69e675eac11fdee8',162,'256-256.png',4,3,46474,1700648704,1700648704,0,0,'d09560234b2a6b950ce58aca9de190d1',27,''),(167,2,'appdata_oc3a4dnnzqr6/preview/8/256-256.png','30cf737fb120b4065153e07c50de8c63',155,'256-256.png',4,3,9083,1700648705,1700648705,0,0,'e9a42a1ad9f9546e238548f1b42aeeda',27,''),(168,2,'appdata_oc3a4dnnzqr6/preview/0/2/e/7/4/f/1/27/256-256.png','56d6841a5982d7b1d2636c75239b0c19',154,'256-256.png',4,3,34261,1700648705,1700648705,0,0,'53c80053b8f008c2c592da23c974db7c',27,''),(169,2,'appdata_oc3a4dnnzqr6/text','1d08747dde353a5fadb9baba3e0aa727',4,'text',2,1,0,1700648706,1700648706,0,0,'655dd702159b3',31,''),(170,2,'appdata_oc3a4dnnzqr6/text/documents','2e8999e28dc51bae101d4e10d30d483b',169,'documents',2,1,0,1700648706,1700648706,0,0,'655dd70219ad2',31,''),(171,2,'appdata_oc3a4dnnzqr6/theming/global/0/favIcon-files#0082c9','c1d493b2c0ff9e4a774f66b74c15efd7',133,'favIcon-files#0082c9',17,8,90022,1700648706,1700648706,0,0,'0e85996b485ad171d48a1208da5483b2',27,''),(172,2,'appdata_oc3a4dnnzqr6/theming/global/0/favIcon-settings#0082c9','7c3d137bc41441346052d9c1a3092785',133,'favIcon-settings#0082c9',17,8,90022,1700648717,1700648717,0,0,'0288e68b56e89324bfecccecf4a9b16c',27,''),(173,2,'appdata_oc3a4dnnzqr6/appstore','af05169075efdfa13e7e2c6bddad64ab',4,'appstore',2,1,0,1700654452,1700654452,0,0,'655ded705cc6c',31,''),(174,2,'appdata_oc3a4dnnzqr6/appstore/apps.json','8abe76c18c5da8159a4acd602039bf18',173,'apps.json',23,8,2428700,1700654450,1700654450,0,0,'b11d9276a6f1e1a15681017488b9497f',27,''),(175,2,'appdata_oc3a4dnnzqr6/appstore/categories.json','35ae282a06e7a99a4a6ac24f7647051d',173,'categories.json',23,8,162805,1700654452,1700654452,0,0,'cc0edfa687ca2166af32497f34c775d7',27,''),(176,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin/avatar.png','bfef87ec32826250f042949d4b21aa9c',60,'avatar.png',4,3,18609,1700654698,1700654698,0,0,'c1119c303cb757fb4273eaa3d93b6428',27,''),(177,2,'appdata_oc3a4dnnzqr6/avatar/axis-admin/avatar.64.png','aeab30746dd9c5a4f40ac9cbbcf120a1',60,'avatar.64.png',4,3,924,1700654698,1700654698,0,0,'8fb4613796127fbcddb9443993eac6df',27,''),(178,2,'appdata_oc3a4dnnzqr6/theming/global/0/favIcon-core#0082c9','01e3ae8cec40f12042d73dec219f452f',133,'favIcon-core#0082c9',17,8,90022,1700760424,1700760424,0,0,'ec47bc74d6f63c1fa7acc6128e9fb159',27,''),(179,1,'cache','0fea6a13c52b4d4725368f24b045ca84',1,'cache',2,1,0,1700761218,1700761218,0,0,'655f8e82e6cef',31,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_reminders`
--

DROP TABLE IF EXISTS `oc_files_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `due_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `notified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reminders_uniq_idx` (`user_id`,`file_id`,`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_reminders`
--

LOCK TABLES `oc_files_reminders` WRITE;
/*!40000 ALTER TABLE `oc_files_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,7,1700648578,50598,4,'[]'),(2,8,1700648578,206,6,'[]'),(3,10,1700648578,150,6,'[]'),(4,11,1700648578,2170375,7,'[]'),(5,12,1700648578,474653,7,'[]'),(6,13,1700648578,167989,7,'[]'),(7,14,1700648578,427030,7,'[]'),(8,15,1700648578,457744,7,'[]'),(9,16,1700648579,567689,7,'[]'),(10,17,1700648579,797325,7,'[]'),(11,18,1700648579,593508,7,'[]'),(12,19,1700648579,15069794,9,'[]'),(13,21,1700648579,136,6,'[]'),(14,22,1700648579,1083339,9,'[]'),(15,23,1700648579,1095,6,'[]'),(16,24,1700648579,24295,10,'[]'),(17,25,1700648579,976625,9,'[]'),(18,26,1700648579,3963036,12,'[]'),(19,27,1700648579,2403,6,'[]'),(20,29,1700648579,16988,13,'[]'),(21,30,1700648579,88394,14,'[]'),(22,31,1700648579,554,6,'[]'),(23,32,1700648579,3509628,15,'[]'),(24,33,1700648579,39404,16,'[]'),(25,34,1700648579,52843,14,'[]'),(26,35,1700648579,13378,14,'[]'),(27,36,1700648579,11836,13,'[]'),(28,37,1700648580,13441,14,'[]'),(29,38,1700648580,326,6,'[]'),(30,39,1700648580,81196,15,'[]'),(31,40,1700648580,868111,16,'[]'),(32,41,1700648580,5155877,16,'[]'),(33,42,1700648580,573,6,'[]'),(34,43,1700648580,340061,16,'[]'),(35,44,1700648580,52674,17,'[]'),(36,45,1700648580,14810,15,'[]'),(37,46,1700648580,15961,16,'[]'),(38,47,1700648580,30354,16,'[]'),(39,48,1700648580,317015,15,'[]'),(40,49,1700648580,38605,17,'[]'),(41,50,1700648580,17276,16,'[]'),(42,51,1700648580,13653,13,'[]'),(43,52,1700648580,13878,13,'[]'),(44,53,1700648580,14316,15,'[]');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','axis-admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1700648619,1700648619,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(2,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1700648702,1700648702,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(3,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',1700648717,1700648717,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(4,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',1700649536,1700649536,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',1700653242,1700653242,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(6,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',1700653246,1700653246,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(7,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',1700654451,1700654451,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(8,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',1700654488,1700654488,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(9,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',1700654493,1700654493,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(10,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1700760423,1700760423,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',1700761206,1700761206,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(12,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1700761224,1700761224,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(13,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1700648562,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1700648562,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1700648564,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1700648566,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1700648567,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(18,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1700648567,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1700648567,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1700648568,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(22,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(24,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(26,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1700648569,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\Federation\\SyncJob','null',0,1700648572,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1700648574,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1700648574,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1700648574,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\Text\\Cron\\Cleanup','null',0,1700648575,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\Circles\\Cron\\Maintenance','null',0,1700648576,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1700648577,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1700648577,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OC\\Log\\Rotate','null',0,1700648577,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OC\\Preview\\BackgroundCleanupJob','null',0,1700648577,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(38,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1700648577,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[7]',0,1700648578,0,0,'9b264f7a3d69a4d3335fb7b43eb133e4',1),(40,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[11]',0,1700648578,0,0,'08125771f76bc5a8b30ae86dc46559b9',1),(41,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[12]',0,1700648578,0,0,'d0d0c96e4d7b5e589fb4b259e6a1b548',1),(42,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[13]',0,1700648578,0,0,'15f019b4deb70b75c09cbc1ae50533a4',1),(43,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[14]',0,1700648578,0,0,'3e81ce73386e4533046fd31398e88dc5',1),(44,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[15]',0,1700648579,0,0,'be4250996b46a3bbb1c883641080c756',1),(45,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[16]',0,1700648579,0,0,'862b1a80c2e208d065f30ab219e9d4ee',1),(46,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[17]',0,1700648579,0,0,'509256506b03a8cdb6c4d551ab925465',1),(47,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[18]',0,1700648579,0,0,'2b31d81be4acf04664cbf25a4eeefa4e',1),(48,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"axis-admin\"}',0,1700648615,0,0,'f174eb927dc034186bb29724a10df0eb',1),(49,'OCA\\Files_External\\BackgroundJob\\CredentialsCleanup','null',0,1700654478,0,0,'37a6259cc0c1dae299a7866489dff0bd',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1027Date20230504122946'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_external','1011Date20200630192246'),('files_external','1015Date20211104103506'),('files_external','1016Date20220324154536'),('files_external','22000Date20210216084416'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','2301Date20210809144824'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (8,'application'),(19,'application/gzip'),(18,'application/javascript'),(23,'application/json'),(17,'application/octet-stream'),(9,'application/pdf'),(13,'application/vnd.oasis.opendocument.graphics'),(15,'application/vnd.oasis.opendocument.presentation'),(14,'application/vnd.oasis.opendocument.spreadsheet'),(16,'application/vnd.oasis.opendocument.text'),(10,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(3,'image'),(7,'image/jpeg'),(4,'image/png'),(20,'image/svg+xml'),(5,'text'),(6,'text/markdown'),(11,'video'),(12,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_user_root_path_index` (`user_id`,`root_id`,`mount_point`(128)),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'axis-admin','/axis-admin/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','axis-admin',1700648615,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(2,'firstrunwizard','axis-admin',1700648615,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(3,'firstrunwizard','axis-admin',1700648615,'app','forms','apphint-forms','[]','','[]','','','[]'),(4,'firstrunwizard','axis-admin',1700648615,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','axis-admin',1700648615,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'axis-admin',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('axis-admin','activity','configured','yes'),('axis-admin','avatar','generated','true'),('axis-admin','core','lang','fr'),('axis-admin','core','templateDirectory','Modèles/'),('axis-admin','core','timezone','Europe/Paris'),('axis-admin','dashboard','firstRun','0'),('axis-admin','firstrunwizard','apphint','18'),('axis-admin','firstrunwizard','show','0'),('axis-admin','login','lastLogin','1700761218'),('axis-admin','login_token','+HkqMCQp11TCIbgC2bgfqMV+8FomNiTM','1700761220'),('axis-admin','notifications','sound_notification','no'),('axis-admin','notifications','sound_talk','no'),('axis-admin','password_policy','failedLoginAttempts','0');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::axis-admin',1,NULL),(2,'local::/var/www/html/nextcloud/data/',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`),
  KEY `systag_by_tagid` (`systemtagid`,`objecttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
INSERT INTO `oc_text_documents` VALUES (8,0,0,1700648578,'f245435dbf728dbdc694437f56ab4545','f245435dbf728dbdc694437f56ab4545');
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
INSERT INTO `oc_text_sessions` VALUES (1,'axis-admin',NULL,'#795aab','xiPpvhk4ZRJPAMixoTZ3864Sk8QMvUen7/6PQoMhyc2bosNH4o4TNuNfg9E8aTON',8,1700648706,'AWYB+4Dwhw8BXnsidXNlciI6eyJuYW1lIjoiYXhpcy1hZG1pbiIsImNsaWVudElkIjo0MDQzMDQ3MDM1LCJjb2xvciI6IiM3OTVhYWIiLCJsYXN0VXBkYXRlIjoxNzAwNjQ4NzA0fX0='),(63,'axis-admin',NULL,'#795aab','ngjYhtHWW4BnICKPcnH42UTZ4ZIsc8N6hBrRTiOtrPYa/PzaWOw4txp9gGjh9qe/',8,1700653209,'AWYBuqeyxwRJXnsidXNlciI6eyJuYW1lIjoiYXhpcy1hZG1pbiIsImNsaWVudElkIjoxMjIzNDYzODY2LCJjb2xvciI6IiM3OTVhYWIiLCJsYXN0VXBkYXRlIjoxNzAwNjQ5NTM1fX0='),(64,'axis-admin',NULL,'#795aab','ZwUmiG1a8bEtK1JVxNNYYLLK7SwDeDnnezUNkHQYCb4jMczX3WOP2JdvSi5e+Ui+',8,1700653243,NULL);
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`),
  KEY `textstep_session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
INSERT INTO `oc_text_steps` VALUES (1,8,1,'[\"AALcAgEK+4Dwhw8ABwEHZGVmYXVsdAMHaGVhZGluZwcA+4Dwhw8ABgQA+4Dwhw8BJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KAD7gPCHDwAFbGV2ZWwBfQEoAPuA8IcPAAJpZAF\\/KAD7gPCHDwAEdXVpZAF\\/h\\/uA8IcPAAMJcGFyYWdyYXBoBwD7gPCHDyMGBAD7gPCHDySkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3Auh\\/uA8IcPIwMJcGFyYWdyYXBoAA==\",\"AAJgAQL7gPCHD8oBqPuA8IcPIQF3Fmgtd2VsY29tZS10by1uZXh0Y2xvdWSo+4Dwhw8iAXckZDMyN2YyNTYtZTM3Zi00OTYzLTk1MjctODM4YmYwZjBlZjlhAfuA8IcPASEC\"]',2);
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_textprocessing_tasks`
--

DROP TABLE IF EXISTS `oc_textprocessing_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_textprocessing_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `input` longtext NOT NULL,
  `output` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `last_updated` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tp_tasks_updated` (`last_updated`),
  KEY `tp_tasks_status_type_nonunique` (`status`,`type`),
  KEY `tp_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_textprocessing_tasks`
--

LOCK TABLES `oc_textprocessing_tasks` WRITE;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','axis-admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'axis-admin','online',1700761223,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('axis-admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$c3puUXNPSXNSUUl2bXFsWA$pzsh5hBjrletVqLlg14z4qU0D10pcIW3ZO4XCx15Rfs','axis-admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 20:09:47
