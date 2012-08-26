-- MySQL dump 10.13  Distrib 5.5.27, for Linux (i686)
--
-- Host: localhost    Database: omeka
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `collectors` text COLLATE utf8_unicode_ci,
  `public` tinyint(4) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'Text','A long, typically multi-line text string. Up to 65535 characters.'),(2,'Tiny Text','A short, typically one-line text string. Up to 255 characters.'),(3,'Date Range','A date range, begin to end. In format yyyy-mm-dd yyyy-mm-dd.'),(4,'Integer','Set of numbers consisting of the natural numbers including 0 (0, 1, 2, 3, ...) and their negatives (0, âˆ’1, âˆ’2, âˆ’3, ...).'),(9,'Date','A date in format yyyy-mm-dd'),(10,'Date Time','A date and time combination in the format: yyyy-mm-dd hh:mm:ss');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_sets`
--

DROP TABLE IF EXISTS `element_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `record_type_id` (`record_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_sets`
--

LOCK TABLES `element_sets` WRITE;
/*!40000 ALTER TABLE `element_sets` DISABLE KEYS */;
INSERT INTO `element_sets` VALUES (1,1,'Dublin Core','The Dublin Core metadata element set. These elements are common to all Omeka resources, including items, files, collections, exhibits, and entities. See http://dublincore.org/documents/dces/.'),(3,2,'Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.'),(4,3,'Omeka Legacy File','The metadata element set that, in addition to the Dublin Core element set, was included in the `files` table in previous versions of Omeka. These elements are common to all Omeka files. This set may be deprecated in future versions.'),(5,3,'Omeka Image File','The metadata element set that was included in the `files_images` table in previous versions of Omeka. These elements are common to all image files.'),(6,3,'Omeka Video File','The metadata element set that was included in the `files_videos` table in previous versions of Omeka. These elements are common to all video files.'),(82,2,'TEI Interact','Elements used to describe items \n                    auto-created by the TEI Interact plugin');
/*!40000 ALTER TABLE `element_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_texts`
--

DROP TABLE IF EXISTS `element_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL,
  `record_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `html` tinyint(4) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`),
  KEY `record_type_id` (`record_type_id`),
  KEY `element_id` (`element_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM AUTO_INCREMENT=5130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_texts`
--

LOCK TABLES `element_texts` WRITE;
/*!40000 ALTER TABLE `element_texts` DISABLE KEYS */;
INSERT INTO `element_texts` VALUES (56,3,2,49,0,'Aznac'),(55,3,2,49,0,'Washington, D.C.'),(54,3,2,49,0,'Bowling-Green Fountain'),(53,3,2,49,0,'New York'),(52,3,2,49,0,'Nile'),(51,3,2,49,0,'Thebes'),(50,3,2,49,0,'Lybian Mountains'),(46,2,2,39,0,'Edgar Allan Poe'),(47,3,2,50,0,'Mummy'),(48,3,2,39,0,'Edgar Allan Poe'),(49,3,2,49,0,'Eleithias'),(59,3,2,49,0,'Egypt'),(58,3,2,49,0,'Great Oasis'),(57,3,2,49,0,'Carnac'),(45,2,2,49,0,'Political Commentary'),(44,2,2,49,0,'Metaphor'),(43,2,2,49,0,'Allegory'),(42,2,2,49,0,'Satire'),(41,2,2,49,0,'New York'),(40,2,2,49,0,'Charleston, SC'),(39,2,2,50,0,'\"The Oblong Box\"'),(38,2,2,50,0,'oblong-tei'),(29,4,3,39,0,'Edgar Allan Poe'),(30,4,3,49,0,'Charleston, SC'),(31,4,3,49,0,'New York'),(32,4,3,49,0,'Satire'),(33,4,3,49,0,'Allegory'),(34,4,3,49,0,'Metaphor'),(35,4,3,49,0,'Political Commentary'),(36,4,3,50,0,'\"The Oblong Box\"'),(37,4,3,51,0,'TEI Document'),(60,3,2,49,0,'Satire'),(61,3,2,49,0,'Metaphor'),(62,3,2,49,0,'Allegory'),(63,3,2,50,0,'Some Words with a Mummy'),(64,6,3,39,0,'Edgar Allan Poe'),(65,6,3,49,0,'Eleithias'),(66,6,3,49,0,'Lybian Mountains'),(67,6,3,49,0,'Thebes'),(68,6,3,49,0,'Nile'),(69,6,3,49,0,'New York'),(70,6,3,49,0,'Bowling-Green Fountain'),(71,6,3,49,0,'Washington, D.C.'),(72,6,3,49,0,'Aznac'),(73,6,3,49,0,'Carnac'),(74,6,3,49,0,'Great Oasis'),(75,6,3,49,0,'Egypt'),(76,6,3,49,0,'Satire'),(77,6,3,49,0,'Metaphor'),(78,6,3,49,0,'Allegory'),(79,6,3,50,0,'Some Words with a Mummy'),(80,6,3,51,0,'TEI Document'),(111,18,2,97,0,'testing123'),(110,18,2,50,0,'My TEI Test Item'),(109,17,2,97,0,'testing123'),(108,17,2,50,0,'My TEI Test Item'),(3026,7,3,77,0,'a:7:{s:8:\"FileName\";s:36:\"78378f7c54541179772e2fb0fafbcab4.jpg\";s:12:\"FileDateTime\";i:1345918473;s:8:\"FileSize\";i:26541;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";s:8:\"COMPUTED\";a:4:{s:4:\"html\";s:24:\"width=\"400\" height=\"256\"\";s:6:\"Height\";i:256;s:5:\"Width\";i:400;s:7:\"IsColor\";i:1;}}'),(3025,7,3,76,0,'FileName:78378f7c54541179772e2fb0fafbcab4.jpg\nFileDateTime:1345918473\nFileSize:26541\nFileType:2\nMimeType:image/jpeg\nSectionsFound:\nCOMPUTED:\n	html:width=\"400\" height=\"256\"\n	Height:256\n	Width:400\n	IsColor:1\n\n'),(3023,7,3,74,0,'8'),(3024,7,3,75,0,'3'),(3028,1568,2,50,0,'Packet Ship'),(3021,7,3,72,0,'400'),(3022,7,3,73,0,'256'),(5129,2426,2,164,0,'publisher'),(5126,2425,2,164,0,'geogName'),(5127,2426,2,50,0,'Broadway Journal 2:345-352'),(5128,2426,2,163,0,'Broadway Journal 2:345-352'),(5125,2424,2,164,0,'geogName'),(5124,2423,2,164,0,'persName'),(5123,2422,2,164,0,'persName'),(5117,2420,2,50,0,'Independence'),(5118,2420,2,163,0,'Independence'),(5119,2420,2,164,0,'name'),(5114,2417,2,164,0,'geogName'),(5115,2418,2,164,0,'geogName'),(5116,2419,2,164,0,'geogName'),(5111,2416,2,164,0,'geogName'),(5112,2417,2,50,0,'Cape Hatteras'),(5113,2417,2,163,0,'Cape Hatteras'),(5110,2416,2,163,0,'type=\"street\">Chambers Street,'),(5107,2415,2,163,0,'type=\"city\">Albany'),(5108,2415,2,164,0,'geogName'),(5109,2416,2,50,0,'type=\"street\">Chambers Street,'),(5103,2414,2,50,0,'Albany,'),(5104,2414,2,163,0,'Albany,'),(5105,2414,2,164,0,'geogName'),(5106,2415,2,50,0,'type=\"city\">Albany'),(5100,2413,2,50,0,'Florence'),(5101,2413,2,163,0,'Florence'),(5102,2413,2,164,0,'geogName'),(5097,2412,2,50,0,'New York'),(5098,2412,2,163,0,'New York'),(5099,2412,2,164,0,'geogName'),(5093,2410,2,164,0,'geogName'),(5094,2411,2,50,0,'S C'),(5095,2411,2,163,0,'S C'),(5096,2411,2,164,0,'geogName'),(5090,2409,2,164,0,'persName'),(5091,2410,2,50,0,'Charleston,'),(5092,2410,2,163,0,'Charleston,'),(5086,2407,2,164,0,'persName'),(5087,2408,2,164,0,'persName'),(5088,2409,2,50,0,'Broadway'),(5089,2409,2,163,0,'Broadway'),(5083,2406,2,164,0,'persName'),(5084,2407,2,50,0,'Mr Wyatt'),(5085,2407,2,163,0,'Mr Wyatt'),(5080,2405,2,164,0,'persName'),(5081,2406,2,50,0,'Cornelius Wyatt'),(5082,2406,2,163,0,'Cornelius Wyatt'),(5078,2405,2,50,0,'Mrs Adelaide Curtis'),(5079,2405,2,163,0,'Mrs Adelaide Curtis'),(5075,2404,2,50,0,'Rubini the younger'),(5076,2404,2,163,0,'Rubini the younger'),(5077,2404,2,164,0,'persName'),(5072,2403,2,50,0,'Leonardo'),(5073,2403,2,163,0,'Leonardo'),(5074,2403,2,164,0,'persName'),(5069,2401,2,163,0,'Mr W'),(5070,2401,2,164,0,'persName'),(5071,2402,2,164,0,'persName'),(5066,2400,2,163,0,'Mrs Wyatt'),(5067,2400,2,164,0,'persName'),(5068,2401,2,50,0,'Mr W'),(5062,2399,2,50,0,'Marian'),(5063,2399,2,163,0,'Marian'),(5064,2399,2,164,0,'persName'),(5065,2400,2,50,0,'Mrs Wyatt'),(5057,2397,2,163,0,'Wyatt'),(5058,2397,2,164,0,'persName'),(5059,2398,2,50,0,'Mrs W'),(5060,2398,2,163,0,'Mrs W'),(5061,2398,2,164,0,'persName'),(5054,2396,2,163,0,'Nicolino'),(5055,2396,2,164,0,'persName'),(5056,2397,2,50,0,'Wyatt'),(5047,2394,2,50,0,'Captain Hardy'),(5048,2394,2,163,0,'Captain Hardy'),(5049,2394,2,164,0,'persName'),(5050,2395,2,50,0,'Mr Cornelius Wyatt'),(5051,2395,2,163,0,'Mr Cornelius Wyatt'),(5052,2395,2,164,0,'persName'),(5053,2396,2,50,0,'Nicolino');
/*!40000 ALTER TABLE `element_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type_id` int(10) unsigned NOT NULL,
  `data_type_id` int(10) unsigned NOT NULL,
  `element_set_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`),
  UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`),
  KEY `record_type_id` (`record_type_id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `element_set_id` (`element_set_id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,2,1,3,NULL,'Text','Any textual data included in the document.'),(2,2,2,3,NULL,'Interviewer','The person(s) performing the interview.'),(3,2,2,3,NULL,'Interviewee','The person(s) being interviewed.'),(4,2,2,3,NULL,'Location','The location of the interview.'),(5,2,1,3,NULL,'Transcription','Any written text transcribed from a sound.'),(6,2,2,3,NULL,'Local URL','The URL of the local directory containing all assets of the website.'),(7,2,2,3,NULL,'Original Format','If the image is of an object, state the type of object, such as painting, sculpture, paper, photo, and additional data'),(10,2,2,3,NULL,'Physical Dimensions','The actual physical size of the original image.'),(11,2,2,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)'),(12,2,2,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)'),(13,2,2,3,NULL,'Producer','Name (or names) of the person who produced the video.'),(14,2,2,3,NULL,'Director','Name (or names) of the person who produced the video.'),(15,2,2,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)'),(16,2,2,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview'),(17,2,1,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers.'),(18,2,2,3,NULL,'Subject Line','The content of the subject line of the email.'),(19,2,2,3,NULL,'From','The name and email address of the person sending the email.'),(20,2,2,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent.'),(21,2,2,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied.'),(22,2,2,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied.'),(23,2,2,3,NULL,'Number of Attachments','The number of attachments to the email.'),(24,2,1,3,NULL,'Standards',''),(25,2,1,3,NULL,'Objectives',''),(26,2,1,3,NULL,'Materials',''),(27,2,1,3,NULL,'Lesson Plan Text',''),(28,2,2,3,NULL,'URL',''),(29,2,2,3,NULL,'Event Type',''),(30,2,1,3,NULL,'Participants','Names of individuals or groups participating in the event.'),(31,2,9,3,NULL,'Birth Date',''),(32,2,2,3,NULL,'Birthplace',''),(33,2,9,3,NULL,'Death Date',''),(34,2,2,3,NULL,'Occupation',''),(35,2,1,3,NULL,'Biographical Text',''),(36,2,1,3,NULL,'Bibliography',''),(37,1,2,1,8,'Contributor','An entity responsible for making contributions to the resource. Examples of a Contributor include a person, an organization, or a service. Typically, the name of a Contributor should be used to indicate the entity.'),(38,1,2,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant. Spatial topic and spatial applicability may be a named place or a location specified by its geographic coordinates. Temporal topic may be a named period, date, or date range. A jurisdiction may be a named administrative entity or a geographic place to which the resource applies. Recommended best practice is to use a controlled vocabulary such as the Thesaurus of Geographic Names [TGN]. Where appropriate, named places or time periods can be used in preference to numeric identifiers such as sets of coordinates or date ranges.'),(39,1,2,1,4,'Creator','An entity primarily responsible for making the resource. Examples of a Creator include a person, an organization, or a service. Typically, the name of a Creator should be used to indicate the entity.'),(40,1,2,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource. Date may be used to express temporal information at any level of granularity. Recommended best practice is to use an encoding scheme, such as the W3CDTF profile of ISO 8601 [W3CDTF].'),(41,1,1,1,3,'Description','An account of the resource. Description may include but is not limited to: an abstract, a table of contents, a graphical representation, or a free-text account of the resource.'),(42,1,2,1,11,'Format','The file format, physical medium, or dimensions of the resource. Examples of dimensions include size and duration. Recommended best practice is to use a controlled vocabulary such as the list of Internet Media Types [MIME].'),(43,1,2,1,14,'Identifier','An unambiguous reference to the resource within a given context. Recommended best practice is to identify the resource by means of a string conforming to a formal identification system.'),(44,1,2,1,12,'Language','A language of the resource. Recommended best practice is to use a controlled vocabulary such as RFC 4646 [RFC4646].'),(45,1,2,1,6,'Publisher','An entity responsible for making the resource available. Examples of a Publisher include a person, an organization, or a service. Typically, the name of a Publisher should be used to indicate the entity.'),(46,1,2,1,10,'Relation','A related resource. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(47,1,2,1,9,'Rights','Information about rights held in and over the resource. Typically, rights information includes a statement about various property rights associated with the resource, including intellectual property rights.'),(48,1,2,1,5,'Source','A related resource from which the described resource is derived. The described resource may be derived from the related resource in whole or in part. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(49,1,2,1,2,'Subject','The topic of the resource. Typically, the subject will be represented using keywords, key phrases, or classification codes. Recommended best practice is to use a controlled vocabulary. To describe the spatial or temporal topic of the resource, use the Coverage element.'),(50,1,2,1,1,'Title','A name given to the resource. Typically, a Title will be a name by which the resource is formally known.'),(51,1,2,1,13,'Type','The nature or genre of the resource. Recommended best practice is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE]. To describe the file format, physical medium, or dimensions of the resource, use the Format element.'),(58,3,1,4,1,'Additional Creator',''),(59,3,1,4,2,'Transcriber',''),(60,3,1,4,3,'Producer',''),(61,3,1,4,4,'Render Device',''),(62,3,1,4,5,'Render Details',''),(63,3,10,4,6,'Capture Date',''),(64,3,1,4,7,'Capture Device',''),(65,3,1,4,8,'Capture Details',''),(66,3,1,4,9,'Change History',''),(67,3,1,4,10,'Watermark',''),(69,3,1,4,12,'Encryption',''),(70,3,1,4,13,'Compression',''),(71,3,1,4,14,'Post Processing',''),(72,3,4,5,1,'Width',''),(73,3,4,5,2,'Height',''),(74,3,4,5,3,'Bit Depth',''),(75,3,4,5,4,'Channels',''),(76,3,1,5,5,'Exif String',''),(77,3,1,5,6,'Exif Array',''),(78,3,1,5,7,'IPTC String',''),(79,3,1,5,8,'IPTC Array',''),(80,3,4,6,1,'Bitrate',''),(81,3,4,6,2,'Duration',''),(82,3,4,6,3,'Sample Rate',''),(83,3,1,6,4,'Codec',''),(84,3,4,6,5,'Width',''),(85,3,4,6,6,'Height',''),(164,2,1,82,NULL,'TEI Element','name of the source TEI-XML element (\'name\', \'persName\', \'interp\', etc)'),(163,2,1,82,NULL,'TEI Tag','TEI tags for identifying items as related to a certain TEI-tagged value');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE utf8_unicode_ci,
  `middle_name` text COLLATE utf8_unicode_ci,
  `last_name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `institution` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,'Super',NULL,'User','jpeak5@lsu.edu',NULL);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_relations`
--

DROP TABLE IF EXISTS `entities_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `relation_id` int(10) unsigned DEFAULT NULL,
  `relationship_id` int(10) unsigned DEFAULT NULL,
  `type` enum('Item','Collection','Exhibit') COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relation_type` (`type`),
  KEY `relation` (`relation_id`),
  KEY `relationship` (`relationship_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2434 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_relations`
--

LOCK TABLES `entities_relations` WRITE;
/*!40000 ALTER TABLE `entities_relations` DISABLE KEYS */;
INSERT INTO `entities_relations` VALUES (4,1,2,2,'Item','2012-08-19 12:22:03'),(2,1,2,1,'Item','2012-08-06 17:43:16'),(3,1,2,2,'Item','2012-08-06 18:52:36'),(5,1,3,1,'Item','2012-08-19 12:10:04'),(18,1,14,1,'Item','2012-08-20 21:52:08'),(17,1,13,1,'Item','2012-08-20 21:51:12'),(19,1,15,1,'Item','2012-08-20 22:59:03'),(20,1,16,1,'Item','2012-08-21 18:45:48'),(21,1,17,1,'Item','2012-08-21 19:06:36'),(22,1,18,1,'Item','2012-08-21 19:07:36'),(2418,1,2411,1,'Item','2012-08-26 14:03:08'),(2419,1,2412,1,'Item','2012-08-26 14:03:08'),(2420,1,2413,1,'Item','2012-08-26 14:03:08'),(2421,1,2414,1,'Item','2012-08-26 14:03:08'),(2422,1,2415,1,'Item','2012-08-26 14:03:08'),(1575,1,1568,2,'Item','2012-08-25 18:22:15'),(1574,1,1568,2,'Item','2012-08-25 14:14:34'),(1573,1,1568,2,'Item','2012-08-25 17:57:12'),(1572,1,1568,1,'Item','2012-08-25 17:56:26'),(2401,1,2394,1,'Item','2012-08-26 14:03:06'),(2404,1,2397,1,'Item','2012-08-26 14:03:06'),(2409,1,2402,1,'Item','2012-08-26 14:03:07'),(2410,1,2403,1,'Item','2012-08-26 14:03:07'),(2411,1,2404,1,'Item','2012-08-26 14:03:07'),(2412,1,2405,1,'Item','2012-08-26 14:03:07'),(2413,1,2406,1,'Item','2012-08-26 14:03:07'),(2414,1,2407,1,'Item','2012-08-26 14:03:07'),(2415,1,2408,1,'Item','2012-08-26 14:03:07'),(2416,1,2409,1,'Item','2012-08-26 14:03:08'),(2417,1,2410,1,'Item','2012-08-26 14:03:08'),(2423,1,2416,1,'Item','2012-08-26 14:03:08'),(2424,1,2417,1,'Item','2012-08-26 14:03:08'),(2425,1,2418,1,'Item','2012-08-26 14:03:08'),(2426,1,2419,1,'Item','2012-08-26 14:03:09'),(2427,1,2420,1,'Item','2012-08-26 14:03:09'),(2429,1,2422,1,'Item','2012-08-26 14:48:44'),(2430,1,2423,1,'Item','2012-08-26 14:48:45'),(2431,1,2424,1,'Item','2012-08-26 14:48:45'),(2432,1,2425,1,'Item','2012-08-26 14:48:45'),(2433,1,2426,1,'Item','2012-08-26 14:48:45'),(2403,1,2396,1,'Item','2012-08-26 14:03:06'),(2402,1,2395,1,'Item','2012-08-26 14:03:06'),(2405,1,2398,1,'Item','2012-08-26 14:03:07'),(2406,1,2399,1,'Item','2012-08-26 14:03:07'),(2407,1,2400,1,'Item','2012-08-26 14:03:07'),(2408,1,2401,1,'Item','2012-08-26 14:03:07');
/*!40000 ALTER TABLE `entities_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_relationships`
--

DROP TABLE IF EXISTS `entity_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relationships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_relationships`
--

LOCK TABLES `entity_relationships` WRITE;
/*!40000 ALTER TABLE `entity_relationships` DISABLE KEYS */;
INSERT INTO `entity_relationships` VALUES (1,'added',NULL),(2,'modified',NULL),(3,'favorite',NULL),(4,'collector',NULL);
/*!40000 ALTER TABLE `entity_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `size` int(10) unsigned NOT NULL,
  `has_derivative_image` tinyint(1) NOT NULL,
  `authentication` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_browser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archive_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (5,2,NULL,46067,0,'c492f80b5701188e4a014f15c3dec3e6','application/xml','application/xml; charset=us-ascii','XML document text','c0c0afbd733b953ceb2bc62a9c7ae284.xml','OblongBoxehdAnalytic2.xml','2012-08-19 17:22:03','2012-08-19 16:22:02',1),(4,2,NULL,37022,0,'e1d4d4fd4f7282e5898a8836012e3fc3','application/xml','application/xml; charset=us-ascii','XML  document text','96b2bc58a9291e87845ba1c98132ed81.xml','oblong.xml','2012-08-19 17:22:03','2012-08-06 22:52:36',1),(6,3,NULL,55232,0,'f81d4d8eabb1853487bbe0b0b52db0ee','application/xml','application/xml; charset=us-ascii','XML document text','bad7097dac0288283196123f7ad442b9.xml','mummy.xml','2012-08-19 18:10:05','2012-08-19 17:10:04',1),(7,1568,NULL,26541,1,'4e5bbd82b074053a381694ad4a59653c','image/jpeg','image/jpeg; charset=binary','JPEG image data, JFIF standard 1.01','78378f7c54541179772e2fb0fafbcab4.jpg','packet-ship.jpg','2012-08-25 23:22:15','2012-08-25 23:14:34',1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'Document','A resource containing textual data.  Note that facsimiles or images of texts are still of the genre text.'),(3,'Moving Image','A series of visual representations that, when shown in succession, impart an impression of motion.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource whose content is primarily intended to be rendered as audio.'),(6,'Still Image','A static visual representation. Examples of still images are: paintings, drawings, graphic designs, plans and maps.  Recommended best practice is to assign the type \"text\" to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence.  Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','Instructional materials.'),(11,'Hyperlink','Title, URL, Description or annotation.'),(12,'Person','An individual, biographical data, birth and death, etc.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'TEI Document','TEIDisplay is a plugin created by the Scholars\' Lab at the University of Virginia Library. This plugin will render an uploaded TEI file attached to an item in the display. The default XSLT stylesheet allows for two display types: entire and segmental. The entire display type will render out the entire document in HTML while the segmental display type includes a table of contents for displaying a selected div1 or div2, which is a useful feature for larger documents. The display type and XSLT stylesheet can be customized for each TEI File in the database through the TEI Config tab in the administrative interface. Additionally, metadata from the TEI Header is automatically mapped to Dublin Core fields for both the item and file.'),(138,'Publisher','The publisher of a tale'),(139,'Place','A geographic place referenced within a tale'),(140,'Character','a character in a tale'),(141,'Ship','A Ship');
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types_elements`
--

DROP TABLE IF EXISTS `item_types_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `element_id` (`element_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types_elements`
--

LOCK TABLES `item_types_elements` WRITE;
/*!40000 ALTER TABLE `item_types_elements` DISABLE KEYS */;
INSERT INTO `item_types_elements` VALUES (1,1,7,NULL),(2,1,1,NULL),(3,6,7,NULL),(6,6,10,NULL),(7,3,7,NULL),(8,3,11,NULL),(9,3,12,NULL),(10,3,13,NULL),(11,3,14,NULL),(12,3,5,NULL),(13,5,7,NULL),(14,5,11,NULL),(15,5,15,NULL),(16,5,5,NULL),(17,4,7,NULL),(18,4,11,NULL),(19,4,15,NULL),(20,4,5,NULL),(21,4,2,NULL),(22,4,3,NULL),(23,4,4,NULL),(24,4,16,NULL),(25,9,17,NULL),(26,9,18,NULL),(27,9,20,NULL),(28,9,19,NULL),(29,9,21,NULL),(30,9,22,NULL),(31,9,23,NULL),(32,10,24,NULL),(33,10,25,NULL),(34,10,26,NULL),(35,10,11,NULL),(36,10,27,NULL),(37,7,6,NULL),(38,11,28,NULL),(39,8,29,NULL),(40,8,30,NULL),(41,8,11,NULL),(42,12,31,NULL),(43,12,32,NULL),(44,12,33,NULL),(45,12,34,NULL),(46,12,35,NULL),(47,12,36,NULL);
/*!40000 ALTER TABLE `item_types_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `featured` tinyint(4) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `collection_id` (`collection_id`),
  KEY `public` (`public`),
  KEY `featured` (`featured`)
) ENGINE=MyISAM AUTO_INCREMENT=2427 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,14,NULL,0,0,'2012-08-19 17:10:04','2012-08-19 17:10:04'),(2,14,NULL,0,0,'2012-08-19 17:22:03','2012-08-06 22:43:16'),(2414,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2415,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2416,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2417,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2418,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(1568,6,NULL,0,1,'2012-08-25 23:22:15','2012-08-25 17:56:26'),(2394,140,NULL,0,0,'2012-08-26 19:03:06','2012-08-26 14:03:06'),(2397,140,NULL,0,0,'2012-08-26 19:03:06','2012-08-26 14:03:06'),(2402,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2403,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2404,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2405,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2406,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2407,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2408,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2409,140,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2410,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2411,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2412,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2413,139,NULL,0,0,'2012-08-26 19:03:08','2012-08-26 14:03:08'),(2419,139,NULL,0,0,'2012-08-26 19:03:09','2012-08-26 14:03:09'),(2420,141,NULL,0,0,'2012-08-26 19:03:09','2012-08-26 14:03:09'),(2422,140,NULL,0,0,'2012-08-26 19:48:44','2012-08-26 14:48:44'),(2423,140,NULL,0,0,'2012-08-26 19:48:45','2012-08-26 14:48:45'),(2424,139,NULL,0,0,'2012-08-26 19:48:45','2012-08-26 14:48:45'),(2425,139,NULL,0,0,'2012-08-26 19:48:45','2012-08-26 14:48:45'),(2426,138,NULL,0,0,'2012-08-26 19:48:45','2012-08-26 14:48:45'),(2396,140,NULL,0,0,'2012-08-26 19:03:06','2012-08-26 14:03:06'),(2395,140,NULL,0,0,'2012-08-26 19:03:06','2012-08-26 14:03:06'),(2398,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2399,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2400,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07'),(2401,140,NULL,0,0,'2012-08-26 19:03:07','2012-08-26 14:03:07');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mime_element_set_lookup`
--

DROP TABLE IF EXISTS `mime_element_set_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_element_set_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `element_set_id` int(10) unsigned NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mime` (`mime`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mime_element_set_lookup`
--

LOCK TABLES `mime_element_set_lookup` WRITE;
/*!40000 ALTER TABLE `mime_element_set_lookup` DISABLE KEYS */;
INSERT INTO `mime_element_set_lookup` VALUES (1,5,'image/bmp'),(2,5,'image/gif'),(3,5,'image/ief'),(4,5,'image/jpeg'),(5,5,'image/pict'),(6,5,'image/pjpeg'),(7,5,'image/png'),(8,5,'image/tiff'),(9,5,'image/vnd.rn-realflash'),(10,5,'image/vnd.rn-realpix'),(11,5,'image/vnd.wap.wbmp'),(12,5,'image/x-icon'),(13,5,'image/x-jg'),(14,5,'image/x-jps'),(15,5,'image/x-niff'),(16,5,'image/x-pcx'),(17,5,'image/x-pict'),(18,5,'image/x-quicktime'),(19,5,'image/x-rgb'),(20,5,'image/x-tiff'),(21,5,'image/x-windows-bmp'),(22,5,'image/x-xbitmap'),(23,5,'image/x-xbm'),(24,5,'image/x-xpixmap'),(25,5,'image/x-xwd'),(26,5,'image/x-xwindowdump'),(27,6,'video/x-msvideo'),(28,6,'video/avi'),(29,6,'video/msvideo'),(30,6,'video/x-mpeg'),(31,6,'video/x-ms-asf'),(32,6,'video/mpeg'),(33,6,'video/quicktime'),(34,6,'video/x-ms-wmv');
/*!40000 ALTER TABLE `mime_element_set_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'omeka_version','1.5.2'),(91,'administrator_email','jpeak5@lsu.edu'),(92,'copyright',''),(89,'site_title','apc'),(93,'author',''),(90,'description','dev for cct-apc'),(96,'thumbnail_constraint','200'),(97,'square_thumbnail_constraint','200'),(95,'fullsize_constraint','800'),(98,'per_page_admin','10'),(99,'per_page_public','10'),(100,'show_empty_elements','0'),(102,'path_to_convert','/bin/'),(14,'admin_theme','default'),(15,'public_theme','default'),(28,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xml,xlw,zip'),(29,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo,text/xml,application/xml'),(27,'disable_default_file_validation','0'),(19,'display_system_info','1'),(94,'tag_delimiter',','),(103,'omeka_update','a:2:{s:14:\"latest_version\";s:5:\"1.5.3\";s:12:\"last_updated\";i:1345986885;}'),(39,'tei_display_type',NULL),(30,'recaptcha_public_key',''),(31,'recaptcha_private_key',''),(40,'tei_default_stylesheet',NULL),(101,'enable_prototype','0');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `version` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (23,'TeiDisplay',1,'1.0'),(82,'TeiInteract',1,'0.1');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processes`
--

DROP TABLE IF EXISTS `processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` enum('starting','in progress','completed','paused','error','stopped') COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stopped` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pid` (`pid`),
  KEY `started` (`started`),
  KEY `stopped` (`stopped`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processes`
--

LOCK TABLES `processes` WRITE;
/*!40000 ALTER TABLE `processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_types`
--

DROP TABLE IF EXISTS `record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_types`
--

LOCK TABLES `record_types` WRITE;
/*!40000 ALTER TABLE `record_types` DISABLE KEYS */;
INSERT INTO `record_types` VALUES (1,'All','Elements, element sets, and element texts assigned to this record type relate to all possible records.'),(2,'Item','Elements, element sets, and element texts assigned to this record type relate to item records.'),(3,'File','Elements, element sets, and element texts assigned to this record type relate to file records.');
/*!40000 ALTER TABLE `record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100401000000'),('20100810120000'),('20110113000000'),('20110124000001'),('20110301103900'),('20110328192100'),('20110426181300'),('20110601112200'),('20110627223000'),('20110824110000'),('20120112100000');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` bigint(20) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('16bm5am8p8d567cv59girk0uq2',1345764469,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('2tdc1mt2boqak0o2c4tilus0g1',1345411487,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('81nkajod39tqfmh2em2haksse4',1345769392,1209600,''),('dqahdia4tdlfq1fbdik2hl2kf7',1345856104,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('e1f2rc5p2j40ukq8tu98t2vo53',1345603831,1209600,'Default|a:1:{s:8:\"redirect\";s:26:\"/tei-interact/files/browse\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('mld8sjfljse3dddn91i64349j2',1345992535,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('oim5pqa53ddjrnrlg9o4jsdch0',1345078045,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('u5t3vr3oqfqbbnl2gmjhiru3n3',1345767215,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('ul1fprufqshlsr8913vo0vo1c4',1345683015,1209600,'Default|a:1:{s:8:\"redirect\";s:7:\"/config\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`relation_id`,`tag_id`,`entity_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (3,1568,3,1,'Item','2012-08-25 18:22:15');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'test'),(2,'item-types'),(3,'packet ship');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tei_display_configs`
--

DROP TABLE IF EXISTS `tei_display_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tei_display_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned DEFAULT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `is_fedora_datastream` tinyint(1) unsigned NOT NULL,
  `fedoraconnector_id` int(10) unsigned DEFAULT NULL,
  `tei_id` tinytext COLLATE utf8_unicode_ci,
  `stylesheet` tinytext COLLATE utf8_unicode_ci,
  `display_type` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_display_configs`
--

LOCK TABLES `tei_display_configs` WRITE;
/*!40000 ALTER TABLE `tei_display_configs` DISABLE KEYS */;
INSERT INTO `tei_display_configs` VALUES (1,2,4,0,NULL,'The Oblong Box','default.xsl','entire'),(2,3,6,0,NULL,'some-words-with-a-mummy-ehd','default.xsl','entire');
/*!40000 ALTER TABLE `tei_display_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tei_interact_cleanups`
--

DROP TABLE IF EXISTS `tei_interact_cleanups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tei_interact_cleanups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `omeka_table_name` varchar(80) NOT NULL,
  `omeka_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_interact_cleanups`
--

LOCK TABLES `tei_interact_cleanups` WRITE;
/*!40000 ALTER TABLE `tei_interact_cleanups` DISABLE KEYS */;
INSERT INTO `tei_interact_cleanups` VALUES (1,'ItemType',138),(2,'ItemType',139),(3,'ItemType',140),(4,'ItemType',141),(5,'ElementSet',82),(6,'Element',163),(7,'Element',164),(8,'Item',2394),(9,'Item',2395),(10,'Item',2396),(11,'Item',2397),(12,'Item',2398),(13,'Item',2399),(14,'Item',2400),(15,'Item',2401),(16,'Item',2402),(17,'Item',2403),(18,'Item',2404),(19,'Item',2405),(20,'Item',2406),(21,'Item',2407),(22,'Item',2408),(23,'Item',2409),(24,'Item',2410),(25,'Item',2411),(26,'Item',2412),(27,'Item',2413),(28,'Item',2414),(29,'Item',2415),(30,'Item',2416),(31,'Item',2417),(32,'Item',2418),(33,'Item',2419),(34,'Item',2420),(35,'Item',2421),(36,'Item',2422),(37,'Item',2423),(38,'Item',2424),(39,'Item',2425),(40,'Item',2426);
/*!40000 ALTER TABLE `tei_interact_cleanups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tei_interact_configs`
--

DROP TABLE IF EXISTS `tei_interact_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tei_interact_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `create_item` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_tag` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_interact_configs`
--

LOCK TABLES `tei_interact_configs` WRITE;
/*!40000 ALTER TABLE `tei_interact_configs` DISABLE KEYS */;
INSERT INTO `tei_interact_configs` VALUES (1,'name','type,value',NULL),(2,'geogName','type,value',NULL),(5,'persName','value',NULL),(3,'interp','ana,type,value',NULL),(6,'persName','ana,key,type,value',NULL),(7,'orgName','ana,key,type,value',NULL);
/*!40000 ALTER TABLE `tei_interact_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tei_interact_names`
--

DROP TABLE IF EXISTS `tei_interact_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tei_interact_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teiHeader` tinyint(1) NOT NULL COMMENT 'whether or not this name appears in the header or in the main text...1 for header, 0 for text',
  `occurrenceCount` int(5) NOT NULL COMMENT 'how many times does this name occur in the file',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_interact_names`
--

LOCK TABLES `tei_interact_names` WRITE;
/*!40000 ALTER TABLE `tei_interact_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `tei_interact_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `role` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `active_idx` (`active`),
  KEY `entity_id` (`entity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','37ab11b9fad1b8a72a5f34dca0af87f3208125b6','9a6d325daaf3f03d',1,'super',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_activations`
--

DROP TABLE IF EXISTS `users_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activations`
--

LOCK TABLES `users_activations` WRITE;
/*!40000 ALTER TABLE `users_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_activations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-26  9:50:15
