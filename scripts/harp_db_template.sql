-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: harp_dev
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.6-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `harp_dev`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `harp_dev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `harp_dev`;

--
-- Table structure for table `actions_history`
--

DROP TABLE IF EXISTS `actions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `obj_type` varchar(50) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `created_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_alerts`
--

DROP TABLE IF EXISTS `active_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_alerts` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_name` varchar(255) NOT NULL,
  `studio` int(11) NOT NULL,
  `ms` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `severity` int(11) NOT NULL,
  `notification_type` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL DEFAULT 0,
  `department` varchar(255) DEFAULT NULL,
  `additional_fields` longtext DEFAULT NULL,
  `ms_alert_id` varchar(255) DEFAULT NULL,
  `total_duration` bigint(20) NOT NULL DEFAULT 0,
  `acknowledged` int(11) NOT NULL DEFAULT 0,
  `assign_status` int(11) NOT NULL DEFAULT 0,
  `consolidation_name` varchar(40) DEFAULT NULL,
  `consolidation_state` int(11) NOT NULL DEFAULT 0,
  `consolidation_id` bigint(20) DEFAULT 0,
  `consolidation_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `downtime_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `snooze_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `handle_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `assigned_to` varchar(255) DEFAULT '{}',
  `action_by` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`alert_id`,`notification_type`),
  UNIQUE KEY `unique_component_commit` (`alert_id`,`notification_type`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type` int(11) NOT NULL,
  `notification_fields` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `resubmit` int(11) DEFAULT 0,
  `sticky` int(11) DEFAULT 0,
  `recipient_id` varchar(100) DEFAULT NULL,
  `notification_count` int(11) DEFAULT 0,
  `time_to` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `unique_component_commit` (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_integrations`
--

DROP TABLE IF EXISTS `available_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `available_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  `website_url` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_integrations`
--

LOCK TABLES `available_integrations` WRITE;
/*!40000 ALTER TABLE `available_integrations` DISABLE KEYS */;
INSERT INTO `available_integrations` VALUES (1,'zabbix','active','https://harpia.io/integration/zabbix/','2021-07-10 05:08:25','2021-07-10 05:08:25'),(2,'grafana','active','https://harpia.io/integration/grafana/','2021-07-10 05:08:25','2021-07-10 05:08:25'),(3,'prometheus','active','https://harpia.io/integration/prometheus/','2021-07-10 05:08:25','2021-07-10 05:08:25'),(4,'gcp','active','https://harpia.io/integration/gcp/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(5,'api','active','https://harpia.io/integration/api/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(6,'appdynamics','active','https://harpia.io/integration/appdynamics/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(7,'atatus','active','https://harpia.io/integration/atatus/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(8,'newrelic','active','https://harpia.io/integration/newrelic/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(9,'prtg','active','https://harpia.io/integration/prtg/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(10,'dynatrace','active','https://harpia.io/integration/prtg/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(11,'anodot','active','https://harpia.io/integration/anodot/','2021-07-15 17:01:15','2021-07-15 17:01:15'),(12,'cloudwatch','active','https://harpia.io/integration/cloudwatch/','2021-09-12 18:41:05','2021-07-15 17:01:15'),(13,'pingdom','active','https://harpia.io/integration/pingdom/','2021-09-12 18:41:05','2021-07-15 17:01:15');
/*!40000 ALTER TABLE `available_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `severity_mapping` longtext DEFAULT NULL,
  `notification_type_mapping` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'{\"ok\": 0, \"information\": 1, \"warning\": 2, \"critical\": 3, \"unknown\": 4, \"urgent\": 5, \"down\": 6}','{\"alert\": 1, \"email\": 2, \"jira\": 3, \"skype\": 4, \"teams\": 5, \"telegram\": 6}');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configured_integrations`
--

DROP TABLE IF EXISTS `configured_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configured_integrations` (
  `integration_id` int(11) NOT NULL AUTO_INCREMENT,
  `integration_key` varchar(70) DEFAULT NULL,
  `integration_name` varchar(70) DEFAULT NULL,
  `integration_type` varchar(70) DEFAULT NULL,
  `status` varchar(70) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `integration_key` (`integration_key`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configured_integrations`
--

LOCK TABLES `configured_integrations` WRITE;
/*!40000 ALTER TABLE `configured_integrations` DISABLE KEYS */;
INSERT INTO `configured_integrations` VALUES (32,'4a6af808-13e9-11ec-aa2d-ced972b85e1f','Airbrake Integration','api','active','{\"environment_id\":101,\"scenario_id\":1}','2021-11-22 15:07:47','2021-09-10 05:45:22'),(34,'6ac52d52-13ef-11ec-aa2d-ced972b85e1f','APM SignalFx','appdynamics','active','{\"environment_id\":102,\"scenario_id\":1}','2021-11-22 15:07:51','2021-09-10 05:45:22'),(37,'99840c9c-13f1-11ec-aa2d-ced972b85e1f','APM Atatus','atatus','active','{\"environment_id\":102,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(39,'9fd38680-13f2-11ec-aa2d-ced972b85e1f','Grafana Datastores','grafana','active','{\"environment_id\":103,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(42,'8976a9fc-13f3-11ec-aa2d-ced972b85e1f','APM NewRelic','newrelic','active','{\"environment_id\":102,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(44,'34bf2e9c-13f4-11ec-aa2d-ced972b85e1f','Prom Datastores','prometheus','active','{\"environment_id\":103,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(47,'6b1bb4d8-13f4-11ec-aa2d-ced972b85e1f','PRTG Network','prtg','active','{\"environment_id\":103,\"scenario_id\":1}','2021-11-22 15:08:00','2021-09-10 05:45:22'),(49,'138cf1cc-13f5-11ec-aa2d-ced972b85e1f','Zabbix Network','zabbix','active','{\"environment_id\":104,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(51,'5f7606fe-13f6-11ec-aa2d-ced972b85e1f','APM Dynatrace','dynatrace','active','{\"environment_id\":102,\"scenario_id\":1}','2021-09-20 18:56:34','2021-09-10 05:45:22'),(53,'5c4a9ab6-13f7-11ec-aa2d-ced972b85e1f','Marketing Anodot','anodot','active','{\"environment_id\":105,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(56,'8e2e3c76-13f8-11ec-aa2d-ced972b85e1f','AWS CloudWatch','cloud-watch','active','{\"environment_id\":126,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(58,'96238eee-13f9-11ec-aa2d-ced972b85e1f','GCP','gcp','active','{\"environment_id\":126,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(60,'3477f5de-13fb-11ec-aa2d-ced972b85e1f','Pingdom End User','pingdom','active','{\"environment_id\":129,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(63,'b3fddc8a-1926-11ec-aa2d-ced972b85e1f','newrelic integration','newrelic','active','{\"environment_id\":1,\"scenario_id\":1}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(64,'4246732c-1d2c-11ec-aa2d-ced972b85e1f','API Alerts Signl4','api','active','{\"environment_id\":1,\"scenario_id\":133}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(66,'d42dc910-1d37-11ec-aa2d-ced972b85e1f','Grafana Signl4','grafana','active','{\"environment_id\":1,\"scenario_id\":133}','2021-09-10 05:45:22','2021-09-10 05:45:22'),(68,'47ee0580-1fc3-11ec-aa2d-ced972b85e1f','New Harp Daemon','grafana','active','{\"environment_id\":1,\"scenario_id\":1}','2021-11-22 15:08:15','2021-09-10 05:45:22');
/*!40000 ALTER TABLE `configured_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environments`
--

DROP TABLE IF EXISTS `environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `env_name` varchar(70) NOT NULL,
  `env_settings` longtext DEFAULT NULL,
  `available_for_users_id` longtext DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `env_name` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environments`
--

LOCK TABLES `environments` WRITE;
/*!40000 ALTER TABLE `environments` DISABLE KEYS */;
INSERT INTO `environments` VALUES (1,'Unassigned','{\"description\": \"Notifications without Environments will be here\", \"default_scenario\": \"\"}','{\"visible_only\": [], \"hidden\": []}','2021-03-07 21:54:27','2021-03-07 21:54:27'),(101,'Kubernetes Prod','{\"description\": \"Test Env 1\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 16:41:11','2021-03-07 21:54:27'),(102,'Application Performance','{\"description\": \"Test Env 2\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 17:46:02','2021-03-07 21:54:27'),(103,'DataStores','{\"description\": \"Test Env 3\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 17:53:46','2021-03-07 21:54:27'),(104,'Network','{\"description\": \"Test Env 4\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 18:07:32','2021-03-07 21:54:27'),(105,'Marketing Events','{\"description\": \"Test Env 5\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 18:29:00','2021-03-07 21:54:27'),(126,'AWS/GCP Infrastructure','{\"description\": \"\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-12 18:44:57','2021-07-04 12:31:06'),(129,'End User Events','{\"description\": \"\", \"default_scenario\": 1}','{\"visible_only\": [], \"hidden\": []}','2021-09-10 05:46:01','2021-09-10 05:46:01');
/*!40000 ALTER TABLE `environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_config`
--

DROP TABLE IF EXISTS `filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_config` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_name` varchar(254) NOT NULL,
  `filter_config` longtext NOT NULL,
  `filter_status` varchar(254) NOT NULL,
  `created_by` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `columns` longtext NOT NULL,
  `grouping` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`filter_id`),
  UNIQUE KEY `filter_name` (`filter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_labels`
--

DROP TABLE IF EXISTS `filter_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_labels` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(254) NOT NULL,
  `label_values` longtext NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `harp_notification_columns`
--

DROP TABLE IF EXISTS `harp_notification_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_notification_columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(70) NOT NULL,
  PRIMARY KEY (`column_id`),
  UNIQUE KEY `column_name` (`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_notification_columns`
--

LOCK TABLES `harp_notification_columns` WRITE;
/*!40000 ALTER TABLE `harp_notification_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `harp_notification_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harp_user_environments`
--

DROP TABLE IF EXISTS `harp_user_environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_user_environments` (
  `user_id` int(11) NOT NULL,
  `environment_id` varchar(70) NOT NULL,
  PRIMARY KEY (`user_id`,`environment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_user_environments`
--

LOCK TABLES `harp_user_environments` WRITE;
/*!40000 ALTER TABLE `harp_user_environments` DISABLE KEYS */;
/*!40000 ALTER TABLE `harp_user_environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harp_users`
--

DROP TABLE IF EXISTS `harp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(70) DEFAULT NULL,
  `second_name` varchar(70) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `role` varchar(70) NOT NULL,
  `phone` varchar(70) DEFAULT NULL,
  `active_environment_ids` longtext DEFAULT NULL,
  `status` varchar(70) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_users`
--

LOCK TABLES `harp_users` WRITE;
/*!40000 ALTER TABLE `harp_users` DISABLE KEYS */;
INSERT INTO `harp_users` VALUES (1,'admin','admin','admin','admin@harpia.io','admin','+380986627571','{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$EUIIIcRYS2ntfU/JGSPkHA$L0mW1C4.IG2.Ze1E6E56L0encczcrS7tgpXrrGIA4lQ',NULL,'2021-10-01 21:29:12','2021-04-14 12:55:07','2021-10-01 21:29:12'),(101,'Vasyl','Profile 2','buhtik2','buhht3@gmail.com','admin','+43245253242','{\"visible_only\": [1, 103, 105, 109, 106, 126, 101, 102, 104, 129], \"hidden\": [102, 104]}','active','$pbkdf2-sha256$29000$NiZkrHVOCWGMMca4VyplbA$V9SLqaEpQFWsD0dvNSg.vn2VwOR5mbiSUi0vIr/b7mk',NULL,'2021-09-12 18:55:53','2021-04-14 15:45:19','2021-05-28 19:20:23'),(3382,'Buht3','','buhtik23','harp.buht@gmail.com','admin',NULL,'{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$Wss5h7BWau3dO6d0bk1JKQ$Nf6owam2/hQjou8NyzeAhGrA9gIzNDam3nUJgzJkcwU','ImhhcnAuYnVodEBnbWFpbC5jb20i.YJly0A.qAEb32rgnZVJ6LqBkbowrA4SEQQ','2022-01-06 14:23:03','2021-05-09 12:35:43','2022-01-06 14:23:03'),(3390,'admin','admin','nkondratyk','nkondratyk93@gmail.com','admin','+380986627571','{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$693be0/JeQ9hLAWg1FoLwQ$VimQ99Ae48MIVRjZyBHVnVLpEm3xvLVlb4Gf6jIY1Cs',NULL,'2021-07-04 12:31:28','2021-07-04 12:31:28','2021-07-14 05:44:11'),(3391,'demo','demo','harp-demo','harp-demo@harpia.io','admin','+380986627571','{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$bK3V.j.HECJkzLm3NuZ8zw$WmsObv9niLfm1RnJHkd2QgRJVULhIy5x7WcPbeBF/D8',NULL,'2022-01-06 21:42:26','2021-07-04 12:31:28','2022-01-06 21:42:26'),(3397,'Vlad','','grossmanvlad','grossman.vlad.it@gmail.com','admin',NULL,'{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$3xtjbA1hTOndGwMg5DxnjA$EzmaF2kYVgBRwnncRA3yP9cIb/HnWV7.AzLit3Iz744','Imdyb3NzbWFuLnZsYWQuaXRAZ21haWwuY29tIg.YTMapw.4YKWKm_-lRrgr_Gunrc9xLKP14Y','2021-09-10 13:34:44','2021-08-18 20:33:44','2021-09-10 13:34:44'),(3398,'Test','','harp.cloud.dev2','harp.cloud.dev2@gmail.com','admin',NULL,'{\"visible_only\": [], \"hidden\": []}','active','$pbkdf2-sha256$29000$VwohhBBCqJVSCsHYO8fYOw$6XcRSdbaZ3EnsTXozrZRTOY6wpFF27UJV/M31Zf.YKw','ImhhcnAuY2xvdWQuZGV2MkBnbWFpbC5jb20i.YUrJ0Q.sWEBjJCsuWuwUw4jM4W8kFqT8Gc','2021-12-17 12:25:35','2021-09-22 06:12:25','2021-12-17 12:25:35');
/*!40000 ALTER TABLE `harp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `description` varchar(70) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `logo` longtext DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  `website_url` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrations`
--

LOCK TABLES `integrations` WRITE;
/*!40000 ALTER TABLE `integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(70) DEFAULT NULL,
  `current_usage` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'alert',1116888,100000000,'active'),(2,'email',79005,100000000,'active'),(3,'jira',44606,100000000,'active'),(4,'skype',62974,100000000,'active'),(5,'teams',62780,100000000,'active'),(6,'telegram',80765,100000000,'active'),(7,'pagerduty',62812,100000000,'active'),(8,'sms',62848,100000000,'active'),(9,'voice',62876,100000000,'active'),(10,'whatsapp',31802,100000000,'active'),(11,'signl4',14,1000,'active');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_history`
--

DROP TABLE IF EXISTS `notification_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` int(11) NOT NULL,
  `notification_output` longtext DEFAULT NULL,
  `notification_action` varchar(255) NOT NULL,
  `comments` longtext DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2785102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_scheduler`
--

DROP TABLE IF EXISTS `notification_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_scheduler` (
  `alert_id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `execute` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`,`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_scheduler`
--

LOCK TABLES `notification_scheduler` WRITE;
/*!40000 ALTER TABLE `notification_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `studio` int(11) NOT NULL,
  `ms` varchar(40) NOT NULL,
  `source` varchar(100) NOT NULL,
  `object_name` varchar(100) NOT NULL,
  `service` varchar(100) NOT NULL,
  `severity` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `output` longtext DEFAULT NULL,
  `additional_fields` longtext DEFAULT NULL,
  `additional_urls` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ms_alert_id` varchar(100) DEFAULT NULL,
  `recipient_id` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `total_duration` bigint(20) NOT NULL DEFAULT 0,
  `notification_type` int(11) DEFAULT NULL,
  `notification_status` int(11) NOT NULL DEFAULT 0,
  `assign_status` int(11) NOT NULL DEFAULT 0,
  `snooze_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `sticky` int(11) NOT NULL DEFAULT 0,
  `procedure_id` int(11) NOT NULL,
  `last_update_ts` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_create_ts` timestamp NULL DEFAULT current_timestamp(),
  `assigned_to` varchar(255) DEFAULT '{}',
  `action_by` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_component_commit` (`id`,`name`,`studio`,`ms`,`source`,`ms_alert_id`,`object_name`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `studio_id` int(11) NOT NULL,
  `requested_by` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `wiki` varchar(150) DEFAULT NULL,
  `thresholds` longtext DEFAULT NULL,
  `tags` varchar(200) NOT NULL DEFAULT '[]',
  `procedure_type` int(11) NOT NULL,
  `procedure_review_status` varchar(30) DEFAULT NULL,
  `alert_fields` longtext DEFAULT NULL,
  `jira_fields` longtext DEFAULT NULL,
  `email_fields` longtext DEFAULT NULL,
  `skype_fields` longtext DEFAULT NULL,
  `teams_fields` longtext DEFAULT NULL,
  `telegram_fields` longtext DEFAULT NULL,
  `pagerduty_fields` longtext DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sms_fields` longtext DEFAULT NULL,
  `voice_fields` longtext DEFAULT NULL,
  `whatsapp_fields` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_component_commit` (`name`,`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,'Unassigned',3,'1','asd',NULL,'asd','',0,NULL,'{\"recipients\": [\"asd\"], \"description\": \"asd\", \"affected_func\": \"asd\", \"should_check\": [\"ads\"], \"players_expirience\": \"asd\", \"not_handled_effects\": \"ads\", \"notification_period\": {}}','{}','{}','{}','{}','{}','{}',1,'2021-01-27 13:40:25','{}','{}','{}'),(101,'Email procedure',2,'Email procedure','Email procedure',NULL,'Email procedure','\"\"',0,NULL,'{}','{}','{\"recipients\": [\"some@gmail.com\"], \"cc_recipients\": [], \"graph_ranges\": [], \"notification_period\": {}, \"description\": \"Email procedure\", \"resubmit\": null}','{}','{}','{}','{}',1,'2021-04-02 10:50:21','{}','{}','{}'),(102,'JIRA procedure',2,'JIRA procedure','JIRA procedure',NULL,'JIRA procedure','\"\"',0,NULL,'{}','{\"notification_period\": {}, \"project\": \"NTN\", \"description\": \"JIRA procedure\", \"resubmit\": null}','{}','{}','{}','{}','{}',1,'2021-04-02 10:50:21','{}','{}','{}'),(103,'Skype procedure',2,'Skype procedure','Skype procedure',NULL,'Skype procedure','\"\"',0,NULL,'{}','{}','{}','{\"ids\": [\"some_skype_id\"], \"notification_period\": {}, \"description\": \"Skype procedure\", \"resubmit\": null}','{}','{}','{}',1,'2021-04-02 10:50:21','{}','{}','{}'),(104,'Teams procedure',2,'Teams procedure','Teams procedure',NULL,'Teams procedure','\"\"',0,NULL,'{}','{}','{}','{}','{\"ids\": [\"some_teams_id\"], \"notification_period\": {}, \"description\": \"Teams procedure\", \"resubmit\": null}','{}','{}',1,'2021-04-02 10:50:21','{}','{}','{}'),(105,'Telegram procedure',2,'Telegram procedure','Telegram procedure',NULL,'Telegram procedure','\"\"',0,NULL,'{}','{}','{}','{}','{}','{\"ids\": [\"some_telegram_id\"], \"notification_period\": {}, \"description\": \"Telegram procedure\", \"resubmit\": null}','{}',1,'2021-04-02 10:50:22','{}','{}','{}'),(106,'PagerDuty procedure',2,'PagerDuty procedure','PagerDuty procedure',NULL,'PagerDuty procedure','\"\"',0,NULL,'{}','{}','{}','{}','{}','{}','{\"ids\": [\"pd_id\"], \"notification_period\": {}, \"description\": \"PagerDuty procedure\", \"resubmit\": null}',1,'2021-04-02 10:50:22','{}','{}','{}'),(107,'SMS procedure',2,'SMS procedure','SMS procedure',NULL,'SMS procedure','\"\"',0,NULL,'{}','{}','{}','{}','{}','{}','{}',1,'2021-04-02 10:50:38','{\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"SMS procedure\", \"resubmit\": null}','{}','{}'),(108,'Voice procedure',2,'Voice procedure','Voice procedure',NULL,'Voice procedure','\"\"',0,NULL,'{}','{}','{}','{}','{}','{}','{}',1,'2021-04-02 10:50:38','{}','{\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"Voice procedure\", \"resubmit\": null}','{}'),(109,'WhatsApp procedure',2,'WhatsApp procedure','WhatsApp procedure',NULL,'WhatsApp procedure','\"\"',0,NULL,'{}','{}','{}','{}','{}','{}','{}',1,'2021-04-02 10:50:39','{}','{}','{\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"WhatsApp procedure\", \"resubmit\": null}');
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenarios` (
  `scenario_id` int(11) NOT NULL AUTO_INCREMENT,
  `scenario_name` varchar(256) NOT NULL,
  `environment_id` varchar(256) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `external_url` varchar(200) DEFAULT NULL,
  `requested_by` varchar(100) NOT NULL,
  `tags` longtext NOT NULL,
  `scenario_type` int(11) NOT NULL,
  `scenario_review_status` varchar(50) DEFAULT NULL,
  `edited_by` varchar(50) DEFAULT NULL,
  `scenario_actions` longtext DEFAULT NULL,
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`scenario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenarios`
--

LOCK TABLES `scenarios` WRITE;
/*!40000 ALTER TABLE `scenarios` DISABLE KEYS */;
INSERT INTO `scenarios` VALUES (1,'Unassigned','12','Scenario description','','The reason of creating it','[]',1,NULL,'buhtik23','[{\"execute_after_seconds\": 0, \"type\": \"ui\", \"body\": {\"recipients\": [\"asd\"], \"description\": \"asd\", \"affected_func\": \"asd\", \"should_check\": [\"ads\"], \"players_expirience\": \"asd\", \"not_handled_effects\": \"ads\", \"notification_period\": {}, \"action_name\": \"some name of the action\"}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(101,'Email procedure','12','Scenario Email procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"email\", \"body\": {\"recipients\": [\"some@gmail.com\"], \"cc_recipients\": [], \"graph_ranges\": [], \"notification_period\": {}, \"description\": \"Email procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(102,'JIRA procedure','12','Scenario JIRA procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"jira\", \"body\": {\"notification_period\": {}, \"project\": \"NTN\", \"description\": \"JIRA procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(103,'Skype procedure','12','Scenario Skype procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"skype\", \"body\": {\"ids\": [\"some_skype_id\"], \"notification_period\": {}, \"description\": \"Skype procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(104,'Teams procedure','12','Scenario Teams procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"teams\", \"body\": {\"ids\": [\"some_teams_id\"], \"notification_period\": {}, \"description\": \"Teams procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(105,'Telegram procedure','12','Scenario Telegram procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"telegram\", \"body\": {\"ids\": [\"some_telegram_id\"], \"notification_period\": {}, \"description\": \"Telegram procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(106,'PagerDuty procedure','12','Scenario PagerDuty procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"pagerduty\", \"body\": {\"ids\": [\"pd_id\"], \"notification_period\": {}, \"description\": \"PagerDuty procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(107,'SMS procedure','12','Scenario SMS procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"sms\", \"body\": {\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"SMS procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(108,'Voice procedure','12','Scenario Voice procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"voice\", \"body\": {\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"Voice procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(109,'WhatsApp procedure','12','Scenario WhatsApp procedure','http://some_url','The reason of creating it','[\"tag1\", \"tag2\", \"tag3\"]',1,NULL,'nkondratyk','[{\"execute_after_seconds\": 0, \"type\": \"whatsapp\", \"body\": {\"ids\": [\"phone_number\"], \"notification_period\": {}, \"description\": \"WhatsApp procedure\", \"resubmit\": null}}]','2021-04-26 13:27:55','2021-04-26 13:27:55'),(133,'Signl4 Scenario Integration',NULL,'Some Description','','','[]',1,NULL,'harp.cloud.dev2','[{\"execute_after_seconds\": 30, \"type\": \"signl4\", \"enabled\": true, \"body\": {\"action_name\": \"Test Signl4 Notification\", \"ids\": [\"https://connect.signl4.com/webhook/cdhn1ttywb\"], \"notification_period\": {}, \"resubmit\": null, \"description\": \"Description\"}}]','2021-09-24 10:51:44','2021-09-24 10:51:44'),(138,'MonItoring',NULL,'','','','[]',1,NULL,'harp-demo','[{\"execute_after_seconds\": 30, \"type\": \"signl4\", \"enabled\": true, \"body\": {\"action_name\": \"SIGNL4 Alerting\", \"ids\": [\"https://connect.signl4.com/webhook/<team-secret>\"], \"notification_period\": {}, \"resubmit\": null}}]','2021-09-28 12:25:00','2021-09-24 10:51:44'),(144,'Multiaction Scenario',NULL,'Scenario to handle Kafka related alerts','','Requested by George J. after incident with Kafka','[]',1,NULL,'harp.cloud.dev2','[{\"execute_after_seconds\": 0, \"action_trigger_delay\": \"0s\", \"type\": \"email\", \"enabled\": true, \"body\": {\"action_name\": \"Notify Technology Owner\", \"recipients\": [\"nikolay.k@harpia.io\"], \"description\": \"\", \"notification_period\": {}, \"resubmit\": null}}, {\"execute_after_seconds\": 300, \"action_trigger_delay\": \"5m\", \"type\": \"teams\", \"enabled\": true, \"body\": {\"action_name\": \"Send reminder to Technology Owner\", \"ids\": [\"https://microsoft.teams/channel/23414\"], \"description\": \"\", \"notification_period\": {}, \"resubmit\": null}}, {\"execute_after_seconds\": 300, \"action_trigger_delay\": \"15m\", \"type\": \"webhook\", \"enabled\": true, \"body\": {\"action_name\": \"Run Jenkins Job to restart Kafka Cluster\", \"webhooks\": [{\"url\": \"https://your-company.com/remote-actions?max_retries=3&not_working_hours=true\", \"http_method\": \"POST\", \"json\": \"{\\\"server\\\": {{server}}, \\\"group\\\": {{group}} }\", \"basicAuth\": {\"login\": \"\", \"password\": \"\"}, \"headers\": \"\\\"ContentType\\\": \\\"application/json\\\"\"}], \"description\": \"\", \"notification_period\": {}, \"resubmit\": null}}, {\"execute_after_seconds\": 0, \"action_trigger_delay\": \"30m\", \"type\": \"ui\", \"enabled\": true, \"body\": {\"action_name\": \"Show alert to NOC team to start handle it as an Incident\", \"recipients\": [\"Nikolay K\"], \"description\": \"Kafka\", \"affected_func\": \"\", \"should_check\": [\"Check Dashboard\", \"Check deployements\"], \"environment_impact\": \"Daley in the system\", \"risks\": \"Downtime\", \"notification_period\": {}, \"resubmit\": null}}]','2021-10-04 18:44:39','2021-10-01 09:08:15'),(147,'Scenario',NULL,'','','','[]',1,NULL,'harp.cloud.dev2','[{\"execute_after_seconds\": 300, \"action_trigger_delay\": \"0s\", \"type\": \"teams\", \"enabled\": true, \"body\": {\"action_name\": \"Send to DB team\", \"ids\": [\"https://adadadad\"], \"description\": \"\", \"notification_period\": {}, \"resubmit\": null}}]','2021-11-22 10:52:52','2021-11-22 10:52:52');
/*!40000 ALTER TABLE `scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `close` int(11) DEFAULT 0,
  `create` int(11) DEFAULT 0,
  `reopen` int(11) DEFAULT 0,
  `update` int(11) DEFAULT 0,
  `change_severity` int(11) DEFAULT 0,
  `snooze` int(11) DEFAULT 0,
  `acknowledge` int(11) DEFAULT 0,
  `assign` int(11) DEFAULT 0,
  `update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `unique_component_commit` (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (184,2246,1,2244,2145,1,0,1,0,'2022-01-08 10:27:44'),(185,67845,1,67810,2200,26,0,0,0,'2022-01-08 10:34:47'),(187,2210,1,2210,2070,0,0,0,0,'2022-01-08 10:20:43'),(188,9961,1,9953,7577,6,0,0,0,'2022-01-08 10:34:40'),(190,9779,1,9765,7545,4,0,1,0,'2022-01-08 10:34:46'),(193,67892,1,67858,2063,27,0,0,0,'2022-01-08 10:34:42'),(194,0,1,0,255,0,1,0,0,'2021-12-24 09:56:57'),(196,128,1,126,120,1,0,0,0,'2021-10-06 06:47:52'),(197,56,1,55,43,0,0,0,0,'2021-10-04 18:19:27'),(199,9783,1,9779,7482,5,0,0,0,'2022-01-08 10:33:49'),(200,9883,1,9878,7587,4,1,0,0,'2022-01-08 10:34:45'),(202,52,1,51,41,1,0,0,0,'2021-10-04 18:10:50'),(204,2282,1,2279,2205,2,0,0,0,'2022-01-08 10:12:43'),(207,113,1,111,101,1,0,0,0,'2021-10-06 06:21:52'),(210,51,1,50,56,1,0,0,0,'2021-10-04 17:55:50'),(212,0,1,0,261,0,0,0,0,'2021-10-06 06:52:51'),(213,9857,1,9851,7587,5,1,1,0,'2022-01-08 10:30:45'),(216,2169,1,2169,2077,0,0,0,0,'2022-01-08 10:31:43'),(218,38,1,36,45,1,0,0,0,'2021-10-04 18:23:27'),(219,9774,1,9765,7554,3,1,0,0,'2022-01-08 10:34:45'),(221,9731,1,9727,7524,3,1,0,0,'2022-01-08 10:32:49'),(222,2235,1,2234,2111,0,2,0,0,'2022-01-08 10:30:44'),(223,9721,1,9713,7442,2,0,1,0,'2022-01-08 10:33:45'),(224,0,1,0,239,0,0,0,0,'2021-10-06 06:34:51'),(226,126,1,123,107,3,0,0,0,'2021-10-06 06:52:51'),(229,9996,1,9991,7559,3,0,1,0,'2022-01-08 10:33:45'),(231,50,1,49,47,1,0,0,0,'2021-10-04 18:09:50'),(233,2243,1,2241,2082,1,0,0,0,'2022-01-08 10:20:44'),(236,2260,1,2258,2201,2,3,0,0,'2022-01-08 10:28:43'),(237,0,1,0,218,0,0,0,0,'2021-10-06 06:48:51'),(239,123,1,123,99,0,0,0,0,'2021-10-06 06:51:51'),(241,51,1,51,41,0,0,0,0,'2021-10-04 18:23:27'),(242,9920,1,9914,7628,4,1,1,0,'2022-01-08 10:31:45'),(244,53,1,50,43,2,0,0,0,'2021-10-04 17:53:50'),(246,2206,1,2205,2090,1,0,0,0,'2022-01-08 10:25:44'),(249,2234,1,2232,2082,1,2,0,0,'2022-01-08 10:29:43'),(251,0,1,0,221,0,0,0,0,'2021-10-06 06:28:51'),(253,125,1,124,100,1,0,0,0,'2021-10-06 06:45:51'),(256,9726,1,9722,7344,3,1,0,0,'2022-01-08 10:32:49'),(258,35,1,32,49,3,0,0,0,'2021-10-04 18:07:50'),(260,2183,1,2182,2088,1,0,0,0,'2022-01-08 10:02:08'),(263,2256,1,2253,2152,2,0,1,0,'2022-01-08 10:02:43'),(265,9884,1,9878,7423,5,0,1,0,'2022-01-08 10:32:41'),(268,48,1,48,48,0,0,0,0,'2021-10-04 18:12:27'),(269,55,1,55,29,0,0,0,0,'2021-10-04 18:01:50'),(270,2209,1,2209,2155,0,0,0,0,'2022-01-08 10:30:44'),(273,2254,1,2253,2143,1,0,0,0,'2022-01-08 10:27:43'),(276,9824,1,9816,7334,2,0,0,0,'2022-01-08 10:32:46'),(278,0,1,0,232,0,0,0,0,'2021-10-06 06:45:51'),(280,112,1,112,137,0,0,0,0,'2021-10-06 06:47:51'),(283,41,1,41,42,0,0,0,0,'2021-10-04 18:02:50'),(285,2263,1,2262,2181,1,0,0,0,'2022-01-08 10:31:44'),(288,2273,1,2271,2128,1,0,0,0,'2022-01-08 09:27:43'),(290,0,1,0,222,0,0,0,0,'2021-10-06 06:51:51'),(292,122,1,120,123,1,0,0,0,'2021-10-06 06:25:52'),(294,37,1,36,42,1,0,0,0,'2021-10-04 18:22:27'),(295,0,1,0,235,0,0,0,0,'2021-10-06 06:38:51'),(297,120,1,118,114,2,0,0,0,'2021-10-06 06:43:51'),(299,58,1,56,44,1,0,0,0,'2021-10-04 18:10:49'),(302,2265,1,2265,2181,0,0,0,0,'2022-01-08 10:34:44'),(304,2276,1,2275,2134,0,1,1,0,'2022-01-08 10:09:43'),(307,0,1,0,245,0,0,0,0,'2021-10-06 06:37:51'),(310,57,1,56,29,1,0,0,0,'2021-10-04 18:29:27'),(312,9732,1,9724,7577,5,0,2,0,'2022-01-08 10:34:49'),(315,2290,1,2287,2176,2,2,3,0,'2022-01-08 10:34:44'),(318,9828,1,9827,7670,2,0,0,0,'2022-01-08 10:27:41'),(320,50,1,49,56,0,0,0,0,'2021-10-04 18:22:27'),(323,2242,1,2240,2161,2,1,0,0,'2022-01-08 10:34:43'),(325,54,1,53,58,1,0,0,0,'2021-10-04 18:26:27'),(326,41,1,39,62,2,0,0,0,'2021-10-04 18:21:27'),(327,47,1,45,44,2,0,0,0,'2021-10-04 17:58:50'),(329,2195,1,2193,2249,1,0,0,0,'2022-01-08 10:19:43'),(330,2204,1,2202,1973,1,0,0,0,'2022-01-08 10:32:44'),(332,0,1,0,214,0,0,0,0,'2021-10-06 05:56:51'),(333,136,1,134,93,2,0,0,0,'2021-10-06 06:49:51'),(336,47,1,46,48,0,0,0,0,'2021-10-04 17:52:50'),(338,2223,1,2222,2032,1,1,0,0,'2022-01-08 10:30:44'),(339,2193,1,2190,2187,2,0,0,0,'2022-01-08 10:01:59'),(341,116,1,115,105,0,0,0,0,'2021-10-06 06:48:51'),(344,2250,1,2249,2191,1,1,0,0,'2022-01-08 10:07:43'),(347,117,1,117,114,0,0,0,0,'2021-10-06 06:40:51'),(350,51,1,51,47,0,0,0,0,'2021-10-04 18:25:27'),(353,9889,1,9882,7755,5,0,0,0,'2022-01-08 10:31:41'),(356,129,1,127,112,1,0,0,0,'2021-10-06 06:51:51'),(359,50,1,50,46,0,0,0,0,'2021-10-04 18:05:50'),(362,47,1,46,39,1,0,0,0,'2021-10-04 17:54:50'),(363,0,1,0,217,0,0,0,0,'2021-10-06 06:41:51'),(365,106,1,105,111,0,0,0,0,'2021-10-06 06:40:51'),(368,0,1,0,228,0,0,0,0,'2021-10-06 06:43:51'),(371,116,1,113,101,2,0,0,0,'2021-10-06 06:09:52'),(372,43,1,40,22,2,0,0,0,'2021-10-04 18:29:27'),(374,2188,1,2186,2129,1,1,0,0,'2022-01-08 10:25:43'),(377,0,1,0,222,0,0,0,0,'2021-10-06 06:49:51'),(378,59,1,56,28,2,0,0,0,'2021-10-04 18:24:27'),(380,0,1,0,214,0,0,0,0,'2021-10-06 06:50:51'),(382,2277,1,2274,2216,1,1,1,0,'2022-01-08 10:33:44'),(383,0,1,0,217,0,0,0,0,'2021-10-06 06:23:51'),(384,115,1,114,97,0,0,0,0,'2021-10-06 06:52:51'),(385,2240,1,2239,2132,1,0,0,0,'2022-01-08 10:33:43'),(387,47,1,45,40,1,0,0,0,'2021-10-04 18:06:50'),(388,0,1,0,235,0,0,0,0,'2021-10-06 06:47:51'),(391,51,1,48,60,2,0,0,0,'2021-10-04 18:26:27'),(392,2257,1,2255,2090,1,0,0,0,'2022-01-08 10:02:26'),(393,52,1,51,44,0,0,0,0,'2021-10-04 17:55:50'),(394,2197,1,2196,2099,0,0,0,0,'2022-01-08 10:29:44'),(395,48,1,46,41,1,0,0,0,'2021-10-04 17:46:48'),(398,55,1,53,48,1,0,0,0,'2021-10-04 18:09:50'),(401,121,1,119,120,1,0,0,0,'2021-10-06 06:49:51'),(403,50,1,50,47,0,0,0,0,'2021-10-04 18:15:55'),(406,48,1,48,51,0,0,0,0,'2021-10-04 18:08:50'),(409,2237,1,2235,2163,2,0,0,0,'2022-01-08 10:32:44'),(411,49,1,47,39,1,0,0,0,'2021-10-04 18:10:50'),(414,2275,1,2272,2256,1,0,0,0,'2022-01-08 10:18:44'),(415,2294,1,2293,2059,0,2,0,0,'2022-01-08 10:09:43'),(416,2243,1,2242,2041,0,3,0,0,'2022-01-08 10:33:48'),(417,2215,1,2215,2121,0,1,1,0,'2022-01-08 10:24:48'),(420,1,1,0,0,0,0,0,0,'2021-10-04 19:05:13'),(423,2159,1,2159,2084,0,0,0,0,'2022-01-08 10:05:47'),(424,2149,1,2147,2108,0,0,0,0,'2022-01-08 10:26:48'),(427,2234,1,2234,2163,0,0,0,0,'2022-01-08 10:26:48'),(429,2196,1,2196,2004,0,0,2,0,'2022-01-08 10:29:48'),(432,2188,1,2188,2150,0,0,0,0,'2022-01-08 10:07:48'),(435,2158,1,2157,2053,0,0,0,0,'2022-01-08 10:23:48'),(436,2170,1,2169,2172,0,1,1,0,'2022-01-08 10:29:48'),(438,2228,1,2228,2152,0,0,0,0,'2022-01-08 10:23:48'),(441,2154,1,2154,2068,0,0,0,0,'2022-01-08 10:34:48'),(442,2215,1,2215,2058,0,0,0,0,'2022-01-08 10:32:48'),(444,2193,1,2192,2113,0,0,1,0,'2022-01-08 09:28:40'),(445,2209,1,2208,1984,0,0,0,0,'2022-01-08 10:29:40'),(447,2142,1,2141,2042,0,0,0,0,'2022-01-08 10:32:40'),(450,2165,1,2165,2069,0,0,0,0,'2022-01-08 10:31:39'),(453,2153,1,2152,2124,0,0,1,0,'2022-01-08 10:31:48'),(456,2163,1,2163,1978,0,0,0,0,'2022-01-08 10:28:39'),(457,2111,1,2111,2009,0,0,0,0,'2022-01-08 10:34:39'),(460,2149,1,2148,2071,0,0,0,0,'2022-01-08 10:25:40'),(463,2173,1,2172,2156,0,0,0,0,'2022-01-08 09:33:48'),(466,2125,1,2124,2012,0,0,1,0,'2022-01-08 10:07:40'),(469,2171,1,2171,2143,0,0,0,0,'2022-01-08 10:32:39'),(471,2162,1,2161,2080,0,0,0,0,'2022-01-08 10:31:40'),(474,2181,1,2180,2111,0,0,0,0,'2022-01-08 10:28:48'),(475,2167,1,2167,2131,0,0,0,0,'2022-01-08 10:30:39'),(477,2120,1,2119,2037,0,0,0,0,'2022-01-08 10:28:40'),(478,2128,1,2128,2065,0,0,0,0,'2022-01-08 10:24:39'),(480,2211,1,2211,2020,0,0,0,0,'2022-01-08 10:25:39'),(483,0,1,0,0,0,0,0,0,'2021-10-04 19:07:51'),(484,2133,1,2133,2107,0,0,0,0,'2022-01-08 10:33:39'),(486,2116,1,2115,2071,0,0,0,0,'2022-01-08 10:30:40'),(487,2150,1,2148,2019,0,0,0,0,'2022-01-08 10:32:48'),(490,0,1,0,0,0,1,0,0,'2021-12-26 09:15:24'),(495,2077,1,2077,1941,0,0,1,0,'2022-01-08 10:25:46'),(496,2091,1,2090,1992,0,0,0,0,'2022-01-08 10:34:46'),(498,2080,1,2078,1935,0,0,0,0,'2022-01-08 10:12:45'),(500,2197,1,2196,2026,0,0,0,0,'2022-01-08 10:18:46'),(502,2130,1,2129,2027,0,0,0,0,'2022-01-08 10:07:46'),(505,2057,1,2056,2017,0,1,1,0,'2022-01-08 10:19:45'),(508,2052,1,2052,2031,0,0,0,0,'2022-01-08 10:32:46'),(511,2022,1,2021,2022,0,0,1,0,'2022-01-08 10:11:46'),(514,2105,1,2103,1988,0,0,0,0,'2022-01-08 10:23:47'),(516,2124,1,2124,2062,0,0,0,0,'2022-01-08 10:31:46'),(518,2075,1,2074,1983,0,0,0,0,'2022-01-08 10:25:47'),(520,2139,1,2138,1906,0,1,0,0,'2022-01-08 10:30:47'),(521,2079,1,2079,1964,0,0,0,0,'2022-01-08 10:30:46'),(524,2111,1,2110,1969,0,0,0,0,'2022-01-08 10:31:46'),(527,2072,1,2071,1987,0,0,0,0,'2022-01-08 10:28:47'),(530,2051,1,2051,1961,0,0,0,0,'2022-01-08 10:33:46'),(533,2,1,0,0,0,1,0,0,'2021-12-07 12:15:08'),(535,3,1,3,0,0,2,0,0,'2021-12-07 12:23:35'),(538,0,1,0,0,0,1,0,0,'2021-12-07 20:48:22');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(40) NOT NULL,
  `item_value` varchar(2000) NOT NULL,
  `added_by` varchar(40) NOT NULL,
  `update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passwd` varchar(18) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 0,
  `user_schema` varchar(2000) NOT NULL,
  `studios` varchar(300) NOT NULL DEFAULT '[]',
  `notes` varchar(1000) DEFAULT NULL,
  `last_login_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin',7,'{\"theme\": \"dark\", \"time_zone\": \"UTC\", \"alert_details_panel_alligment\": \"bottom\", \"show_categories\": [-1, -2, 1, 2, 3], \"alerts_list_show_fields\": [{\"field\": \"monitoring_system\", \"show\": true, \"filtering\": true}, {\"field\": \"service\", \"show\": true, \"filtering\": true}, {\"field\": \"source\", \"show\": true, \"filtering\": true}, {\"field\": \"name\", \"show\": true, \"filtering\": true}, {\"field\": \"department\", \"show\": true, \"filtering\": true}, {\"field\": \"studio\", \"show\": true, \"filtering\": true}, {\"field\": \"object\", \"show\": true, \"filtering\": true}, {\"field\": \"current_duration\", \"show\": true, \"filtering\": false}, {\"field\": \"total_duration\", \"show\": true, \"filtering\": false}], \"alert_details_show_main_fields\": [{\"field\": \"monitoring_system\", \"show\": true}, {\"field\": \"name\", \"show\": true}, {\"field\": \"studio\", \"show\": true}, {\"field\": \"object\", \"show\": true}, {\"field\": \"source\", \"show\": true}, {\"field\": \"service\", \"show\": true}], \"alert_details_show_secondary_fields\": [{\"field\": \"description\", \"show\": true}, {\"field\": \"output\", \"show\": true}, {\"field\": \"additional_fields\", \"show\": true}]}','[]','','2021-01-20 22:56:06');
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

-- Dump completed on 2022-01-08 12:38:53
