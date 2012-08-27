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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_sets`
--

LOCK TABLES `element_sets` WRITE;
/*!40000 ALTER TABLE `element_sets` DISABLE KEYS */;
INSERT INTO `element_sets` VALUES (1,1,'Dublin Core','The Dublin Core metadata element set. These elements are common to all Omeka resources, including items, files, collections, exhibits, and entities. See http://dublincore.org/documents/dces/.'),(3,2,'Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.'),(4,3,'Omeka Legacy File','The metadata element set that, in addition to the Dublin Core element set, was included in the `files` table in previous versions of Omeka. These elements are common to all Omeka files. This set may be deprecated in future versions.'),(5,3,'Omeka Image File','The metadata element set that was included in the `files_images` table in previous versions of Omeka. These elements are common to all image files.'),(6,3,'Omeka Video File','The metadata element set that was included in the `files_videos` table in previous versions of Omeka. These elements are common to all video files.'),(94,2,'TEI Interact','Elements used to describe items \n                    auto-created by the TEI Interact plugin');
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
) ENGINE=MyISAM AUTO_INCREMENT=6008 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_texts`
--

LOCK TABLES `element_texts` WRITE;
/*!40000 ALTER TABLE `element_texts` DISABLE KEYS */;
INSERT INTO `element_texts` VALUES (56,3,2,49,0,'Aznac'),(55,3,2,49,0,'Washington, D.C.'),(54,3,2,49,0,'Bowling-Green Fountain'),(53,3,2,49,0,'New York'),(52,3,2,49,0,'Nile'),(51,3,2,49,0,'Thebes'),(50,3,2,49,0,'Lybian Mountains'),(46,2,2,39,0,'Edgar Allan Poe'),(47,3,2,50,0,'Mummy'),(48,3,2,39,0,'Edgar Allan Poe'),(49,3,2,49,0,'Eleithias'),(59,3,2,49,0,'Egypt'),(58,3,2,49,0,'Great Oasis'),(57,3,2,49,0,'Carnac'),(45,2,2,49,0,'Political Commentary'),(44,2,2,49,0,'Metaphor'),(43,2,2,49,0,'Allegory'),(42,2,2,49,0,'Satire'),(41,2,2,49,0,'New York'),(40,2,2,49,0,'Charleston, SC'),(39,2,2,50,0,'\"The Oblong Box\"'),(38,2,2,50,0,'oblong-tei'),(29,4,3,39,0,'Edgar Allan Poe'),(30,4,3,49,0,'Charleston, SC'),(31,4,3,49,0,'New York'),(32,4,3,49,0,'Satire'),(33,4,3,49,0,'Allegory'),(34,4,3,49,0,'Metaphor'),(35,4,3,49,0,'Political Commentary'),(36,4,3,50,0,'\"The Oblong Box\"'),(37,4,3,51,0,'TEI Document'),(60,3,2,49,0,'Satire'),(61,3,2,49,0,'Metaphor'),(62,3,2,49,0,'Allegory'),(63,3,2,50,0,'Some Words with a Mummy'),(64,6,3,39,0,'Edgar Allan Poe'),(65,6,3,49,0,'Eleithias'),(66,6,3,49,0,'Lybian Mountains'),(67,6,3,49,0,'Thebes'),(68,6,3,49,0,'Nile'),(69,6,3,49,0,'New York'),(70,6,3,49,0,'Bowling-Green Fountain'),(71,6,3,49,0,'Washington, D.C.'),(72,6,3,49,0,'Aznac'),(73,6,3,49,0,'Carnac'),(74,6,3,49,0,'Great Oasis'),(75,6,3,49,0,'Egypt'),(76,6,3,49,0,'Satire'),(77,6,3,49,0,'Metaphor'),(78,6,3,49,0,'Allegory'),(79,6,3,50,0,'Some Words with a Mummy'),(80,6,3,51,0,'TEI Document'),(111,18,2,97,0,'testing123'),(110,18,2,50,0,'My TEI Test Item'),(109,17,2,97,0,'testing123'),(108,17,2,50,0,'My TEI Test Item'),(6003,2810,2,188,0,'publisher'),(6001,2810,2,50,0,'Broadway Journal 2:345-352'),(6002,2810,2,187,0,'Broadway Journal 2:345-352'),(5997,2808,2,188,0,'geogName'),(6006,2809,2,188,0,'name'),(6005,2809,2,50,0,'Independence'),(5994,2806,2,187,0,'Cape Hatteras'),(5995,2806,2,188,0,'geogName'),(5996,2807,2,188,0,'geogName'),(5991,2805,2,187,0,'type=\"street\">Chambers Street,'),(5992,2805,2,188,0,'geogName'),(5993,2806,2,50,0,'Cape Hatteras'),(5988,2804,2,187,0,'type=\"city\">Albany'),(5989,2804,2,188,0,'geogName'),(5990,2805,2,50,0,'type=\"street\">Chambers Street,'),(5985,2803,2,187,0,'Albany,'),(5986,2803,2,188,0,'geogName'),(5987,2804,2,50,0,'type=\"city\">Albany'),(5981,2802,2,50,0,'Florence'),(5982,2802,2,187,0,'Florence'),(5983,2802,2,188,0,'geogName'),(5984,2803,2,50,0,'Albany,'),(5978,2801,2,50,0,'New York'),(5979,2801,2,187,0,'New York'),(5980,2801,2,188,0,'geogName'),(5975,2800,2,50,0,'S C'),(5976,2800,2,187,0,'S C'),(5977,2800,2,188,0,'geogName'),(5972,2799,2,50,0,'Charleston,'),(5973,2799,2,187,0,'Charleston,'),(5974,2799,2,188,0,'geogName'),(5969,2798,2,50,0,'Broadway'),(5970,2798,2,187,0,'Broadway'),(5971,2798,2,188,0,'persName'),(5966,2796,2,187,0,'Mr Wyatt'),(5967,2796,2,188,0,'persName'),(5968,2797,2,188,0,'persName'),(5963,2795,2,187,0,'Cornelius Wyatt'),(5964,2795,2,188,0,'persName'),(5965,2796,2,50,0,'Mr Wyatt'),(5960,2794,2,187,0,'Mrs Adelaide Curtis'),(5961,2794,2,188,0,'persName'),(5962,2795,2,50,0,'Cornelius Wyatt'),(5957,2793,2,187,0,'Rubini the younger'),(5958,2793,2,188,0,'persName'),(5959,2794,2,50,0,'Mrs Adelaide Curtis'),(5952,2791,2,188,0,'persName'),(5953,2792,2,50,0,'Leonardo'),(5954,2792,2,187,0,'Leonardo'),(5955,2792,2,188,0,'persName'),(5956,2793,2,50,0,'Rubini the younger'),(5949,2790,2,50,0,'Mr W'),(5950,2790,2,187,0,'Mr W'),(5951,2790,2,188,0,'persName'),(5629,2634,2,50,0,'Cape Hatteras'),(3026,7,3,77,0,'a:7:{s:8:\"FileName\";s:36:\"78378f7c54541179772e2fb0fafbcab4.jpg\";s:12:\"FileDateTime\";i:1345918473;s:8:\"FileSize\";i:26541;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";s:8:\"COMPUTED\";a:4:{s:4:\"html\";s:24:\"width=\"400\" height=\"256\"\";s:6:\"Height\";i:256;s:5:\"Width\";i:400;s:7:\"IsColor\";i:1;}}'),(3025,7,3,76,0,'FileName:78378f7c54541179772e2fb0fafbcab4.jpg\nFileDateTime:1345918473\nFileSize:26541\nFileType:2\nMimeType:image/jpeg\nSectionsFound:\nCOMPUTED:\n	html:width=\"400\" height=\"256\"\n	Height:256\n	Width:400\n	IsColor:1\n\n'),(3023,7,3,74,0,'8'),(3024,7,3,75,0,'3'),(6004,1568,2,50,0,'Packet Ship'),(3021,7,3,72,0,'400'),(3022,7,3,73,0,'256'),(6007,2809,2,187,0,'Independence'),(5928,2783,2,50,0,'Captain Hardy'),(5929,2783,2,187,0,'Captain Hardy'),(5930,2783,2,188,0,'persName'),(5931,2784,2,50,0,'Mr Cornelius Wyatt'),(5932,2784,2,187,0,'Mr Cornelius Wyatt'),(5933,2784,2,188,0,'persName'),(5934,2785,2,50,0,'Nicolino'),(5935,2785,2,187,0,'Nicolino'),(5936,2785,2,188,0,'persName'),(5937,2786,2,50,0,'Wyatt'),(5938,2786,2,187,0,'Wyatt'),(5939,2786,2,188,0,'persName'),(5940,2787,2,50,0,'Mrs W'),(5941,2787,2,187,0,'Mrs W'),(5942,2787,2,188,0,'persName'),(5943,2788,2,50,0,'Marian'),(5944,2788,2,187,0,'Marian'),(5945,2788,2,188,0,'persName'),(5946,2789,2,50,0,'Mrs Wyatt'),(5947,2789,2,187,0,'Mrs Wyatt'),(5948,2789,2,188,0,'persName'),(5594,2613,2,50,0,'Charleston,'),(5599,2616,2,50,0,'S C'),(5503,2570,2,50,0,'Charleston,'),(5508,2573,2,50,0,'S C'),(5624,2631,2,50,0,'type=\"street\">Chambers Street,'),(5513,2576,2,50,0,'New York'),(5518,2579,2,50,0,'Florence'),(5619,2628,2,50,0,'type=\"city\">Albany'),(5523,2582,2,50,0,'Albany,'),(5614,2625,2,50,0,'Albany,'),(5528,2585,2,50,0,'type=\"city\">Albany'),(5609,2622,2,50,0,'Florence'),(5604,2619,2,50,0,'New York');
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
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,2,1,3,NULL,'Text','Any textual data included in the document.'),(2,2,2,3,NULL,'Interviewer','The person(s) performing the interview.'),(3,2,2,3,NULL,'Interviewee','The person(s) being interviewed.'),(4,2,2,3,NULL,'Location','The location of the interview.'),(5,2,1,3,NULL,'Transcription','Any written text transcribed from a sound.'),(6,2,2,3,NULL,'Local URL','The URL of the local directory containing all assets of the website.'),(7,2,2,3,NULL,'Original Format','If the image is of an object, state the type of object, such as painting, sculpture, paper, photo, and additional data'),(10,2,2,3,NULL,'Physical Dimensions','The actual physical size of the original image.'),(11,2,2,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)'),(12,2,2,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)'),(13,2,2,3,NULL,'Producer','Name (or names) of the person who produced the video.'),(14,2,2,3,NULL,'Director','Name (or names) of the person who produced the video.'),(15,2,2,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)'),(16,2,2,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview'),(17,2,1,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers.'),(18,2,2,3,NULL,'Subject Line','The content of the subject line of the email.'),(19,2,2,3,NULL,'From','The name and email address of the person sending the email.'),(20,2,2,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent.'),(21,2,2,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied.'),(22,2,2,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied.'),(23,2,2,3,NULL,'Number of Attachments','The number of attachments to the email.'),(24,2,1,3,NULL,'Standards',''),(25,2,1,3,NULL,'Objectives',''),(26,2,1,3,NULL,'Materials',''),(27,2,1,3,NULL,'Lesson Plan Text',''),(28,2,2,3,NULL,'URL',''),(29,2,2,3,NULL,'Event Type',''),(30,2,1,3,NULL,'Participants','Names of individuals or groups participating in the event.'),(31,2,9,3,NULL,'Birth Date',''),(32,2,2,3,NULL,'Birthplace',''),(33,2,9,3,NULL,'Death Date',''),(34,2,2,3,NULL,'Occupation',''),(35,2,1,3,NULL,'Biographical Text',''),(36,2,1,3,NULL,'Bibliography',''),(37,1,2,1,8,'Contributor','An entity responsible for making contributions to the resource. Examples of a Contributor include a person, an organization, or a service. Typically, the name of a Contributor should be used to indicate the entity.'),(38,1,2,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant. Spatial topic and spatial applicability may be a named place or a location specified by its geographic coordinates. Temporal topic may be a named period, date, or date range. A jurisdiction may be a named administrative entity or a geographic place to which the resource applies. Recommended best practice is to use a controlled vocabulary such as the Thesaurus of Geographic Names [TGN]. Where appropriate, named places or time periods can be used in preference to numeric identifiers such as sets of coordinates or date ranges.'),(39,1,2,1,4,'Creator','An entity primarily responsible for making the resource. Examples of a Creator include a person, an organization, or a service. Typically, the name of a Creator should be used to indicate the entity.'),(40,1,2,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource. Date may be used to express temporal information at any level of granularity. Recommended best practice is to use an encoding scheme, such as the W3CDTF profile of ISO 8601 [W3CDTF].'),(41,1,1,1,3,'Description','An account of the resource. Description may include but is not limited to: an abstract, a table of contents, a graphical representation, or a free-text account of the resource.'),(42,1,2,1,11,'Format','The file format, physical medium, or dimensions of the resource. Examples of dimensions include size and duration. Recommended best practice is to use a controlled vocabulary such as the list of Internet Media Types [MIME].'),(43,1,2,1,14,'Identifier','An unambiguous reference to the resource within a given context. Recommended best practice is to identify the resource by means of a string conforming to a formal identification system.'),(44,1,2,1,12,'Language','A language of the resource. Recommended best practice is to use a controlled vocabulary such as RFC 4646 [RFC4646].'),(45,1,2,1,6,'Publisher','An entity responsible for making the resource available. Examples of a Publisher include a person, an organization, or a service. Typically, the name of a Publisher should be used to indicate the entity.'),(46,1,2,1,10,'Relation','A related resource. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(47,1,2,1,9,'Rights','Information about rights held in and over the resource. Typically, rights information includes a statement about various property rights associated with the resource, including intellectual property rights.'),(48,1,2,1,5,'Source','A related resource from which the described resource is derived. The described resource may be derived from the related resource in whole or in part. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(49,1,2,1,2,'Subject','The topic of the resource. Typically, the subject will be represented using keywords, key phrases, or classification codes. Recommended best practice is to use a controlled vocabulary. To describe the spatial or temporal topic of the resource, use the Coverage element.'),(50,1,2,1,1,'Title','A name given to the resource. Typically, a Title will be a name by which the resource is formally known.'),(51,1,2,1,13,'Type','The nature or genre of the resource. Recommended best practice is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE]. To describe the file format, physical medium, or dimensions of the resource, use the Format element.'),(58,3,1,4,1,'Additional Creator',''),(59,3,1,4,2,'Transcriber',''),(60,3,1,4,3,'Producer',''),(61,3,1,4,4,'Render Device',''),(62,3,1,4,5,'Render Details',''),(63,3,10,4,6,'Capture Date',''),(64,3,1,4,7,'Capture Device',''),(65,3,1,4,8,'Capture Details',''),(66,3,1,4,9,'Change History',''),(67,3,1,4,10,'Watermark',''),(69,3,1,4,12,'Encryption',''),(70,3,1,4,13,'Compression',''),(71,3,1,4,14,'Post Processing',''),(72,3,4,5,1,'Width',''),(73,3,4,5,2,'Height',''),(74,3,4,5,3,'Bit Depth',''),(75,3,4,5,4,'Channels',''),(76,3,1,5,5,'Exif String',''),(77,3,1,5,6,'Exif Array',''),(78,3,1,5,7,'IPTC String',''),(79,3,1,5,8,'IPTC Array',''),(80,3,4,6,1,'Bitrate',''),(81,3,4,6,2,'Duration',''),(82,3,4,6,3,'Sample Rate',''),(83,3,1,6,4,'Codec',''),(84,3,4,6,5,'Width',''),(85,3,4,6,6,'Height',''),(188,2,1,94,NULL,'TEI Element','name of the source TEI-XML element (\'name\', \'persName\', \'interp\', etc)'),(187,2,1,94,NULL,'TEI Tag','TEI tags for identifying items as related to a certain TEI-tagged value');
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
) ENGINE=MyISAM AUTO_INCREMENT=2831 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_relations`
--

LOCK TABLES `entities_relations` WRITE;
/*!40000 ALTER TABLE `entities_relations` DISABLE KEYS */;
INSERT INTO `entities_relations` VALUES (4,1,2,2,'Item','2012-08-19 12:22:03'),(2,1,2,1,'Item','2012-08-06 17:43:16'),(3,1,2,2,'Item','2012-08-06 18:52:36'),(5,1,3,1,'Item','2012-08-19 12:10:04'),(18,1,14,1,'Item','2012-08-20 21:52:08'),(17,1,13,1,'Item','2012-08-20 21:51:12'),(19,1,15,1,'Item','2012-08-20 22:59:03'),(20,1,16,1,'Item','2012-08-21 18:45:48'),(21,1,17,1,'Item','2012-08-21 19:06:36'),(22,1,18,1,'Item','2012-08-21 19:07:36'),(2640,1,2622,1,'Item','2012-08-26 23:13:48'),(1575,1,1568,2,'Item','2012-08-25 18:22:15'),(1574,1,1568,2,'Item','2012-08-25 14:14:34'),(1573,1,1568,2,'Item','2012-08-25 17:57:12'),(1572,1,1568,1,'Item','2012-08-25 17:56:26'),(2597,1,2579,1,'Item','2012-08-26 23:02:44'),(2437,1,1568,2,'Item','2012-08-26 16:12:11'),(2801,1,2783,1,'Item','2012-08-27 00:12:15'),(2661,1,2643,1,'Item','2012-08-26 23:20:20'),(2658,1,2640,1,'Item','2012-08-26 23:18:20'),(2655,1,2637,1,'Item','2012-08-26 23:17:26'),(2652,1,2634,1,'Item','2012-08-26 23:16:51'),(2614,1,2596,1,'Item','2012-08-26 23:07:44'),(2823,1,2805,1,'Item','2012-08-27 00:12:19'),(2822,1,2804,1,'Item','2012-08-27 00:12:19'),(2821,1,2803,1,'Item','2012-08-27 00:12:18'),(2820,1,2802,1,'Item','2012-08-27 00:12:18'),(2819,1,2801,1,'Item','2012-08-27 00:12:18'),(2685,1,2667,1,'Item','2012-08-26 23:31:55'),(2818,1,2800,1,'Item','2012-08-27 00:12:18'),(2817,1,2799,1,'Item','2012-08-27 00:12:18'),(2682,1,2664,1,'Item','2012-08-26 23:31:12'),(2816,1,2798,1,'Item','2012-08-27 00:12:18'),(2815,1,2797,1,'Item','2012-08-27 00:12:17'),(2679,1,2661,1,'Item','2012-08-26 23:27:37'),(2814,1,2796,1,'Item','2012-08-27 00:12:17'),(2813,1,2795,1,'Item','2012-08-27 00:12:17'),(2676,1,2658,1,'Item','2012-08-26 23:26:33'),(2812,1,2794,1,'Item','2012-08-27 00:12:17'),(2811,1,2793,1,'Item','2012-08-27 00:12:17'),(2673,1,2655,1,'Item','2012-08-26 23:25:33'),(2810,1,2792,1,'Item','2012-08-27 00:12:16'),(2809,1,2791,1,'Item','2012-08-27 00:12:16'),(2670,1,2652,1,'Item','2012-08-26 23:24:27'),(2808,1,2790,1,'Item','2012-08-27 00:12:16'),(2807,1,2789,1,'Item','2012-08-27 00:12:16'),(2667,1,2649,1,'Item','2012-08-26 23:23:26'),(2806,1,2788,1,'Item','2012-08-27 00:12:16'),(2805,1,2787,1,'Item','2012-08-27 00:12:16'),(2664,1,2646,1,'Item','2012-08-26 23:21:25'),(2535,1,2517,1,'Item','2012-08-26 22:32:25'),(2591,1,2573,1,'Item','2012-08-26 22:58:33'),(2634,1,2616,1,'Item','2012-08-26 23:10:01'),(2588,1,2570,1,'Item','2012-08-26 22:54:49'),(2637,1,2619,1,'Item','2012-08-26 23:13:06'),(2646,1,2628,1,'Item','2012-08-26 23:15:15'),(2649,1,2631,1,'Item','2012-08-26 23:16:08'),(2631,1,2613,1,'Item','2012-08-26 23:08:39'),(2594,1,2576,1,'Item','2012-08-26 22:59:24'),(2600,1,2582,1,'Item','2012-08-26 23:03:07'),(2603,1,2585,1,'Item','2012-08-26 23:05:11'),(2803,1,2785,1,'Item','2012-08-27 00:12:15'),(2804,1,2786,1,'Item','2012-08-27 00:12:16'),(2796,1,2778,1,'Item','2012-08-27 00:07:25'),(2701,1,2683,1,'Item','2012-08-26 23:42:51'),(2830,1,2809,2,'Item','2012-08-27 00:20:55'),(2829,1,1568,2,'Item','2012-08-27 00:19:42'),(2698,1,2680,1,'Item','2012-08-26 23:42:09'),(2828,1,2810,1,'Item','2012-08-27 00:12:19'),(2827,1,2809,1,'Item','2012-08-27 00:12:19'),(2695,1,2677,1,'Item','2012-08-26 23:39:52'),(2826,1,2808,1,'Item','2012-08-27 00:12:19'),(2825,1,2807,1,'Item','2012-08-27 00:12:19'),(2692,1,2674,1,'Item','2012-08-26 23:37:44'),(2824,1,2806,1,'Item','2012-08-27 00:12:19'),(2643,1,2625,1,'Item','2012-08-26 23:14:55'),(2802,1,2784,1,'Item','2012-08-27 00:12:15');
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
INSERT INTO `files` VALUES (5,2,NULL,46067,0,'c492f80b5701188e4a014f15c3dec3e6','application/xml','application/xml; charset=us-ascii','XML document text','c0c0afbd733b953ceb2bc62a9c7ae284.xml','OblongBoxehdAnalytic2.xml','2012-08-19 17:22:03','2012-08-19 16:22:02',1),(4,2,NULL,37022,0,'e1d4d4fd4f7282e5898a8836012e3fc3','application/xml','application/xml; charset=us-ascii','XML  document text','96b2bc58a9291e87845ba1c98132ed81.xml','oblong.xml','2012-08-19 17:22:03','2012-08-06 22:52:36',1),(6,3,NULL,55232,0,'f81d4d8eabb1853487bbe0b0b52db0ee','application/xml','application/xml; charset=us-ascii','XML document text','bad7097dac0288283196123f7ad442b9.xml','mummy.xml','2012-08-19 18:10:05','2012-08-19 17:10:04',1),(7,1568,NULL,26541,1,'4e5bbd82b074053a381694ad4a59653c','image/jpeg','image/jpeg; charset=binary','JPEG image data, JFIF standard 1.01','78378f7c54541179772e2fb0fafbcab4.jpg','packet-ship.jpg','2012-08-27 05:19:42','2012-08-25 23:14:34',1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_relations_item_relations`
--

DROP TABLE IF EXISTS `item_relations_item_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_relations_item_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_item_id` int(10) unsigned NOT NULL,
  `property_id` int(10) unsigned NOT NULL,
  `object_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_relations_item_relations`
--

LOCK TABLES `item_relations_item_relations` WRITE;
/*!40000 ALTER TABLE `item_relations_item_relations` DISABLE KEYS */;
INSERT INTO `item_relations_item_relations` VALUES (1,2417,8,2),(2,2420,27,1568),(3,1568,28,2420),(4,2440,89,2),(5,2439,89,2),(6,2438,89,2),(7,2437,89,2),(8,2436,89,2),(9,2434,89,2),(10,2433,89,2),(247,2,154,2798),(248,2798,153,2),(252,2800,158,2),(251,2,157,2800),(250,2799,158,2),(249,2,157,2799),(232,2790,153,2),(231,2,154,2790),(230,2789,153,2),(229,2,154,2789),(228,2788,153,2),(227,2,154,2788),(226,2787,153,2),(225,2,154,2787),(246,2797,153,2),(245,2,154,2797),(244,2796,153,2),(243,2,154,2796),(242,2795,153,2),(241,2,154,2795),(240,2794,153,2),(239,2,154,2794),(238,2793,153,2),(237,2,154,2793),(236,2792,153,2),(235,2,154,2792),(234,2791,153,2),(233,2,154,2791),(253,2,157,2801),(254,2801,158,2),(255,2,157,2802),(256,2802,158,2),(257,2,157,2803),(258,2803,158,2),(259,2,157,2804),(260,2804,158,2),(261,2,157,2805),(262,2805,158,2),(263,2,157,2806),(264,2806,158,2),(265,2,157,2807),(266,2807,158,2),(267,2,157,2808),(268,2808,158,2),(269,2810,160,2),(270,2,159,2810),(271,1568,155,2809),(272,2809,156,1568),(224,2786,153,2),(223,2,154,2786),(222,2785,153,2),(221,2,154,2785),(220,2784,153,2),(219,2,154,2784),(218,2783,153,2),(217,2,154,2783);
/*!40000 ALTER TABLE `item_relations_item_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_relations_properties`
--

DROP TABLE IF EXISTS `item_relations_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_relations_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vocabulary_id` int(10) unsigned NOT NULL,
  `local_part` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_relations_properties`
--

LOCK TABLES `item_relations_properties` WRITE;
/*!40000 ALTER TABLE `item_relations_properties` DISABLE KEYS */;
INSERT INTO `item_relations_properties` VALUES (1,1,'relation','Relation','A related resource.'),(2,1,'conformsTo','Conforms To','An established standard to which the described resource conforms.'),(3,1,'hasFormat','Has Format','A related resource that is substantially the same as the pre-existing described resource, but in another format.'),(4,1,'hasPart','Has Part','A related resource that is included either physically or logically in the described resource.'),(5,1,'hasVersion','Has Version','A related resource that is a version, edition, or adaptation of the described resource.'),(6,1,'isFormatOf','Is Format Of','A related resource that is substantially the same as the described resource, but in another format.'),(7,1,'isPartOf','Is Part Of','A related resource in which the described resource is physically or logically included.'),(8,1,'isReferencedBy','Is Referenced By','A related resource that references, cites, or otherwise points to the described resource.'),(9,1,'isReplacedBy','Is Replaced By','A related resource that supplants, displaces, or supersedes the described resource.'),(10,1,'isRequiredBy','Is Required By','A related resource that requires the described resource to support its function, delivery, or coherence.'),(11,1,'isVersionOf','Is Version Of','A related resource of which the described resource is a version, edition, or adaptation.'),(12,1,'references','References','A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),(13,1,'replaces','Replaces','A related resource that is supplanted, displaced, or superseded by the described resource.'),(14,1,'requires','Requires','A related resource that is required by the described resource to support its function, delivery, or coherence.'),(15,1,'source','Source','A related resource from which the described resource is derived.'),(16,2,'annotates','annotates','Critical or explanatory note for a Document.'),(17,2,'citedBy','cited by','Relates a document to another document that cites the first document.'),(18,2,'cites','cites','Relates a document to another document that is cited by the first document as reference, comment, review, quotation or for another purpose.'),(19,2,'reviewOf','review of','Relates a review document to a reviewed thing (resource, item, etc.).'),(20,2,'reproducedIn','reproduced in','The resource in which another resource is reproduced.'),(21,2,'affirmedBy','affirmed by','A legal decision that affirms a ruling.'),(22,2,'reversedBy','reversed by','A legal decision that reverses a ruling.'),(23,2,'subsequentLegalDecision','subsequent legal decision','A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),(24,2,'transcriptOf','transcript of','Relates a document to some transcribed original.'),(25,2,'translationOf','translation of','Relates a translated document to the original document.'),(26,3,'based_near','based near','A location that something is based near, for some broadly human notion of near.'),(27,3,'depiction','depiction','A depiction of some thing.'),(28,3,'depicts','depicts','A thing depicted in this representation.'),(29,3,'fundedBy','funded by','An organization funding a project or person.'),(30,3,'img','image','An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),(31,3,'isPrimaryTopicOf','is primary topic of','A document that this thing is the primary topic of.'),(32,3,'knows','knows','A person known by this person (indicating some level of reciprocated interaction between the parties).'),(33,3,'logo','logo','A logo representing some thing.'),(34,3,'made','made','Something that was made by this agent.'),(35,3,'maker','maker','An agent that made this thing.'),(36,3,'member','member','Indicates a member of a Group.'),(37,3,'page','page','A page or document about this thing.'),(38,3,'primaryTopic','primary topic','The primary topic of some page or document.'),(39,3,'thumbnail','thumbnail','A derived thumbnail image.'),(40,4,'abridgement','abridgement','A property representing an abridgment of an expression.'),(41,4,'abridgementOf','abridgement of','A property representing an expression that is abridged.'),(42,4,'adaption','adaption','A property representing an adaption of a work or expression.'),(43,4,'adaptionOf','adaption of','A property representing a work or expression that is adapted.'),(44,4,'alternate','alternate','A property representing an alternative to a manifestation.'),(45,4,'alternateOf','alternate of','A property representing a manifestation that is alternated.'),(46,4,'arrangement','arrangement','A property representing an arrangement of an expression.'),(47,4,'arrangementOf','arrangement of','A property representing an expression that is arranged.'),(48,4,'complement','complement','A property representing a complement to a work or expression.'),(49,4,'complementOf','complement of','A property representing a work or expression that is complemented.'),(50,4,'creator','creator','A property representing an entity in some way responsible for the creation of a work.'),(51,4,'creatorOf','creator of','A property representing a work that was in some way created by of an entity.'),(52,4,'embodiment','embodiment','A property representing a manifestation that embodies an expression.'),(53,4,'embodimentOf','embodiment of','A property representing an expression that is embodied by a manifestation.'),(54,4,'exemplar','exemplar','A property representing an item that is an exemplar of a manifestation.'),(55,4,'exemplarOf','exemplar of','A property representing the manifestation that is exemplified by a item.'),(56,4,'imitation','imitation','A property representing an imitation of a work or expression.'),(57,4,'imitationOf','imitation of','A property representing a work or expression that is imitated.'),(58,4,'owner','owner','A property representing an entity that owns an item.'),(59,4,'ownerOf','owner of','A property representing an item that is in some way owned an entity.'),(60,4,'part','part','A property representing a part of an endeavour.'),(61,4,'partOf','part of','A property representing an endeavour incorporating an endeavour.'),(62,4,'producer','producer','A property representing an entity in some way responsible for producing a manifestation.'),(63,4,'producerOf','producer of','A property representing a manifestation that was in some way produced an entity.'),(64,4,'realization','realization','A property representing an expression that is an intellectual or artistic realization of a work.'),(65,4,'realizationOf','realization of','A property representing the work that has been realized by an expression.'),(66,4,'realizer','realizer','A property representing an entity in some way responsible for realizing an expression.'),(67,4,'realizerOf','realizer of','A property representing an expression that was in some way realized by an entity.'),(68,4,'reconfiguration','reconfiguration','A property representing a recongifuration of an item.'),(69,4,'reconfigurationOf','reconfiguration of','A property representing an item that is reconfigured.'),(70,4,'relatedEndeavour','related endeavour','A property representing another endeavour that is related in some way to an endeavour.'),(71,4,'reproduction','reproduction','A property representing a reproduction of a manifestation or item.'),(72,4,'reproductionOf','reproduction of','A property representing a manifestation or item that is reproduced.'),(73,4,'responsibleEntity','responsible entity','A property representing an entity in some way responsible for an endeavour.'),(74,4,'responsibleEntityOf','responsible entity of','A property representing an endeavour that is the responsibility of an entity.'),(75,4,'revision','revision','A property representing a revision of an expression.'),(76,4,'revisionOf','revision of','A property representing an expression that is revised.'),(77,4,'successor','successor','A property representing a successor to a work or expression.'),(78,4,'successorOf','successor of','A property representing a work or expression that is succeeded.'),(79,4,'summarization','summarization','A property representing a summarization of a work or expression.'),(80,4,'summarizationOf','summarization of','A property representing a work or expression that is summarized.'),(81,4,'supplement','supplement','A property representing a supplement to a work or expression.'),(82,4,'supplementOf','supplement of','A property representing a work or expression that is supplemented.'),(83,4,'transformation','transformation','A property representing a transformation of a work or expression.'),(84,4,'transformationOf','transformation of','A property representing a work or expression that is transformed.'),(85,4,'translation','translation','A property representing a translation of an expression.'),(86,4,'translationOf','translation of','A property representing an expression that is translated.'),(160,18,'published','Published','Publisher published this item'),(153,18,'characterBelongsToStory','Character Belongs to Story','for characters, this links them with their story.'),(154,18,'storyHasCharacter','Story has Character','handle to a story\'s character.'),(155,18,'depicts','Depicts','that which an image represents; based on the FOAF element'),(156,18,'depiction','Depiction','The object of this triple is the depiction itself'),(157,18,'hasSetting','Has Setting','the geographic places that are the setting for a tale'),(158,18,'settingOf','Is Setting Of','for a geographic place, these are the tales that use it as a setting'),(159,18,'hasPublisher','Publisher','the Publisher of a tale'),(152,18,'generalRelation','General Relation','the weakest link that can exist between two items.');
/*!40000 ALTER TABLE `item_relations_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_relations_vocabularies`
--

DROP TABLE IF EXISTS `item_relations_vocabularies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_relations_vocabularies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `namespace_prefix` varchar(100) NOT NULL,
  `namespace_uri` varchar(200) DEFAULT NULL,
  `custom` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_relations_vocabularies`
--

LOCK TABLES `item_relations_vocabularies` WRITE;
/*!40000 ALTER TABLE `item_relations_vocabularies` DISABLE KEYS */;
INSERT INTO `item_relations_vocabularies` VALUES (1,'Dublin Core','Relations defined by DCMI Metadata Terms: http://dublincore.org/documents/dcmi-terms/','dcterms','http://purl.org/dc/terms/',0),(2,'BIBO','Relations defined by the Bibliographic Ontology (BIBO): http://bibotools.googlecode.com/svn/bibo-ontology/trunk/doc/index.html','bibo','http://purl.org/ontology/bibo/',0),(3,'FOAF','Relations defined by the Friend of a Friend vocabulary (FOAF): http://xmlns.com/foaf/spec/','foaf','http://xmlns.com/foaf/0.1/',0),(4,'FRBR','Relations defined by the Functional Requirements for Bibliographic Records (FRBR): http://vocab.org/frbr/core.html','frbr','http://purl.org/vocab/frbr/core#',0),(5,'Custom','Custom vocabulary containing relations defined for this Omeka instance.','',NULL,1),(18,'TEI Interact Vocabulary #1','first attempt vocabulary that will glue together our disparate items','teiterms','http://literati.cct.lsu.edu',0);
/*!40000 ALTER TABLE `item_relations_vocabularies` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'Document','A resource containing textual data.  Note that facsimiles or images of texts are still of the genre text.'),(3,'Moving Image','A series of visual representations that, when shown in succession, impart an impression of motion.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource whose content is primarily intended to be rendered as audio.'),(6,'Still Image','A static visual representation. Examples of still images are: paintings, drawings, graphic designs, plans and maps.  Recommended best practice is to assign the type \"text\" to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence.  Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','Instructional materials.'),(11,'Hyperlink','Title, URL, Description or annotation.'),(12,'Person','An individual, biographical data, birth and death, etc.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'TEI Document','TEIDisplay is a plugin created by the Scholars\' Lab at the University of Virginia Library. This plugin will render an uploaded TEI file attached to an item in the display. The default XSLT stylesheet allows for two display types: entire and segmental. The entire display type will render out the entire document in HTML while the segmental display type includes a table of contents for displaying a selected div1 or div2, which is a useful feature for larger documents. The display type and XSLT stylesheet can be customized for each TEI File in the database through the TEI Config tab in the administrative interface. Additionally, metadata from the TEI Header is automatically mapped to Dublin Core fields for both the item and file.'),(186,'Publisher','The publisher of a tale'),(187,'Place','A geographic place referenced within a tale'),(188,'Character','a character in a tale'),(189,'Ship','A Ship');
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
) ENGINE=MyISAM AUTO_INCREMENT=2811 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,14,NULL,0,0,'2012-08-19 17:10:04','2012-08-19 17:10:04'),(2,14,NULL,0,0,'2012-08-19 17:22:03','2012-08-06 22:43:16'),(2628,171,NULL,0,0,'2012-08-27 04:15:15','2012-08-26 23:15:15'),(2631,171,NULL,0,0,'2012-08-27 04:16:08','2012-08-26 23:16:08'),(1568,6,NULL,0,1,'2012-08-27 05:19:42','2012-08-25 17:56:26'),(2579,167,NULL,0,0,'2012-08-27 04:02:44','2012-08-26 23:02:44'),(2646,171,NULL,0,0,'2012-08-27 04:21:25','2012-08-26 23:21:25'),(2783,188,NULL,0,0,'2012-08-27 05:12:15','2012-08-27 00:12:15'),(2643,171,NULL,0,0,'2012-08-27 04:20:20','2012-08-26 23:20:20'),(2640,171,NULL,0,0,'2012-08-27 04:18:20','2012-08-26 23:18:20'),(2637,171,NULL,0,0,'2012-08-27 04:17:26','2012-08-26 23:17:26'),(2634,171,NULL,0,0,'2012-08-27 04:16:51','2012-08-26 23:16:51'),(2576,167,NULL,0,0,'2012-08-27 03:59:24','2012-08-26 22:59:24'),(2613,171,NULL,0,0,'2012-08-27 04:08:39','2012-08-26 23:08:39'),(2596,167,NULL,0,0,'2012-08-27 04:07:44','2012-08-26 23:07:44'),(2806,187,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2805,187,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2804,187,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2803,187,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2802,187,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2801,187,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2667,171,NULL,0,0,'2012-08-27 04:31:55','2012-08-26 23:31:55'),(2800,187,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2799,187,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2664,171,NULL,0,0,'2012-08-27 04:31:12','2012-08-26 23:31:12'),(2798,188,NULL,0,0,'2012-08-27 05:12:18','2012-08-27 00:12:18'),(2797,188,NULL,0,0,'2012-08-27 05:12:17','2012-08-27 00:12:17'),(2661,171,NULL,0,0,'2012-08-27 04:27:37','2012-08-26 23:27:37'),(2796,188,NULL,0,0,'2012-08-27 05:12:17','2012-08-27 00:12:17'),(2795,188,NULL,0,0,'2012-08-27 05:12:17','2012-08-27 00:12:17'),(2658,171,NULL,0,0,'2012-08-27 04:26:33','2012-08-26 23:26:33'),(2794,188,NULL,0,0,'2012-08-27 05:12:17','2012-08-27 00:12:17'),(2793,188,NULL,0,0,'2012-08-27 05:12:17','2012-08-27 00:12:17'),(2655,171,NULL,0,0,'2012-08-27 04:25:33','2012-08-26 23:25:33'),(2792,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2791,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2652,171,NULL,0,0,'2012-08-27 04:24:27','2012-08-26 23:24:27'),(2790,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2789,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2649,171,NULL,0,0,'2012-08-27 04:23:26','2012-08-26 23:23:26'),(2788,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2787,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2616,171,NULL,0,0,'2012-08-27 04:10:01','2012-08-26 23:10:01'),(2570,167,NULL,0,0,'2012-08-27 03:54:49','2012-08-26 22:54:49'),(2619,171,NULL,0,0,'2012-08-27 04:13:06','2012-08-26 23:13:06'),(2622,171,NULL,0,0,'2012-08-27 04:13:48','2012-08-26 23:13:48'),(2625,171,NULL,0,0,'2012-08-27 04:14:55','2012-08-26 23:14:55'),(2582,167,NULL,0,0,'2012-08-27 04:03:07','2012-08-26 23:03:07'),(2585,167,NULL,0,0,'2012-08-27 04:05:11','2012-08-26 23:05:11'),(2674,171,NULL,0,0,'2012-08-27 04:37:44','2012-08-26 23:37:44'),(2807,187,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2808,187,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2784,188,NULL,0,0,'2012-08-27 05:12:15','2012-08-27 00:12:15'),(2785,188,NULL,0,0,'2012-08-27 05:12:15','2012-08-27 00:12:15'),(2786,188,NULL,0,0,'2012-08-27 05:12:16','2012-08-27 00:12:16'),(2778,184,NULL,0,0,'2012-08-27 05:07:25','2012-08-27 00:07:25'),(2683,171,NULL,0,0,'2012-08-27 04:42:51','2012-08-26 23:42:51'),(2680,171,NULL,0,0,'2012-08-27 04:42:09','2012-08-26 23:42:09'),(2810,186,NULL,0,0,'2012-08-27 05:12:19','2012-08-27 00:12:19'),(2809,189,NULL,0,0,'2012-08-27 05:20:55','2012-08-27 00:12:19'),(2677,171,NULL,0,0,'2012-08-27 04:39:52','2012-08-26 23:39:52'),(2517,159,NULL,0,0,'2012-08-27 03:32:25','2012-08-26 22:32:25'),(2573,167,NULL,0,0,'2012-08-27 03:58:33','2012-08-26 22:58:33');
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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'omeka_version','1.5.2'),(91,'administrator_email','jpeak5@lsu.edu'),(92,'copyright',''),(89,'site_title','apc'),(93,'author',''),(90,'description','dev for cct-apc'),(96,'thumbnail_constraint','200'),(97,'square_thumbnail_constraint','200'),(95,'fullsize_constraint','800'),(98,'per_page_admin','10'),(99,'per_page_public','10'),(100,'show_empty_elements','0'),(102,'path_to_convert','/bin/'),(14,'admin_theme','default'),(15,'public_theme','default'),(28,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xml,xlw,zip'),(29,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo,text/xml,application/xml'),(27,'disable_default_file_validation','0'),(19,'display_system_info','1'),(94,'tag_delimiter',','),(103,'omeka_update','a:2:{s:14:\"latest_version\";s:5:\"1.5.3\";s:12:\"last_updated\";i:1345986885;}'),(39,'tei_display_type',NULL),(30,'recaptcha_public_key',''),(31,'recaptcha_private_key',''),(40,'tei_default_stylesheet',NULL),(101,'enable_prototype','0'),(108,'item_relations_public_append_to_items_show','1'),(109,'item_relations_relation_format','label');
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
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (23,'TeiDisplay',1,'1.0'),(101,'TeiInteract',1,'0.1'),(83,'ItemRelations',1,'1.1');
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
INSERT INTO `sessions` VALUES ('16bm5am8p8d567cv59girk0uq2',1345764469,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('1pvhdp3op2bcs06n09rdatu712',1346015935,1209600,''),('2tdc1mt2boqak0o2c4tilus0g1',1345411487,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('30upa88o20jebblkhf3kvbt8n7',1346015988,1209600,''),('44tvj3qih08bbe8vqoeok6ek03',1346015930,1209600,''),('81nkajod39tqfmh2em2haksse4',1345769392,1209600,''),('bc56imp8ccasmsnugk90caf2r4',1346015988,1209600,''),('bpjo4labdumrfmo09i5vf2nic3',1346015993,1209600,''),('dqahdia4tdlfq1fbdik2hl2kf7',1345856104,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('e1f2rc5p2j40ukq8tu98t2vo53',1345603831,1209600,'Default|a:1:{s:8:\"redirect\";s:26:\"/tei-interact/files/browse\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('ejbfvj0h6o13pgu26uo0ml20o2',1346015934,1209600,''),('f6biepc2jqem2igsh29gou6g42',1346015929,1209600,''),('ga467a8sqb20k7cpddv86lpt53',1346015988,1209600,''),('gud6sm4bkqpe26jq1lad6knpn7',1346015938,1209600,''),('h4efi59f4kh7iibuunqvd2dob1',1346015929,1209600,''),('ju4s11579monfv7km7bdosmvk3',1346015930,1209600,''),('mld8sjfljse3dddn91i64349j2',1346001399,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('n0g9jaerps693q9ctap2q7opq6',1346015943,1209600,''),('oe8dbkgr4tpcl2pg6ek1mfsj45',1346015992,1209600,''),('oim5pqa53ddjrnrlg9o4jsdch0',1345078045,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('qh2o57dg4o8aas9gvala3sh2r7',1346027009,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('u5t3vr3oqfqbbnl2gmjhiru3n3',1345767215,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('ul1fprufqshlsr8913vo0vo1c4',1345683015,1209600,'Default|a:1:{s:8:\"redirect\";s:7:\"/config\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('vhi56s762a1jurgs4s7616d563',1346015988,1209600,'');
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
INSERT INTO `taggings` VALUES (3,1568,3,1,'Item','2012-08-27 00:19:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_interact_cleanups`
--

LOCK TABLES `tei_interact_cleanups` WRITE;
/*!40000 ALTER TABLE `tei_interact_cleanups` DISABLE KEYS */;
INSERT INTO `tei_interact_cleanups` VALUES (1,'ItemRelationsVocabulary',18),(2,'ItemRelationsProperty',152),(3,'ItemRelationsProperty',153),(4,'ItemRelationsProperty',154),(5,'ItemRelationsProperty',155),(6,'ItemRelationsProperty',156),(7,'ItemRelationsProperty',157),(8,'ItemRelationsProperty',158),(9,'ItemRelationsProperty',159),(10,'ItemRelationsProperty',160),(11,'ItemType',186),(12,'ItemType',187),(13,'ItemType',188),(14,'ItemType',189),(15,'ElementSet',94),(16,'Element',187),(17,'Element',188),(18,'ItemRelationsItemRelation',217),(19,'ItemRelationsItemRelation',218),(20,'Item',2783),(21,'ItemRelationsItemRelation',219),(22,'ItemRelationsItemRelation',220),(23,'Item',2784),(24,'ItemRelationsItemRelation',221),(25,'ItemRelationsItemRelation',222),(26,'Item',2785),(27,'ItemRelationsItemRelation',223),(28,'ItemRelationsItemRelation',224),(29,'Item',2786),(30,'ItemRelationsItemRelation',225),(31,'ItemRelationsItemRelation',226),(32,'Item',2787),(33,'ItemRelationsItemRelation',227),(34,'ItemRelationsItemRelation',228),(35,'Item',2788),(36,'ItemRelationsItemRelation',229),(37,'ItemRelationsItemRelation',230),(38,'Item',2789),(39,'ItemRelationsItemRelation',231),(40,'ItemRelationsItemRelation',232),(41,'Item',2790),(42,'ItemRelationsItemRelation',233),(43,'ItemRelationsItemRelation',234),(44,'Item',2791),(45,'ItemRelationsItemRelation',235),(46,'ItemRelationsItemRelation',236),(47,'Item',2792),(48,'ItemRelationsItemRelation',237),(49,'ItemRelationsItemRelation',238),(50,'Item',2793),(51,'ItemRelationsItemRelation',239),(52,'ItemRelationsItemRelation',240),(53,'Item',2794),(54,'ItemRelationsItemRelation',241),(55,'ItemRelationsItemRelation',242),(56,'Item',2795),(57,'ItemRelationsItemRelation',243),(58,'ItemRelationsItemRelation',244),(59,'Item',2796),(60,'ItemRelationsItemRelation',245),(61,'ItemRelationsItemRelation',246),(62,'Item',2797),(63,'ItemRelationsItemRelation',247),(64,'ItemRelationsItemRelation',248),(65,'Item',2798),(66,'ItemRelationsItemRelation',249),(67,'ItemRelationsItemRelation',250),(68,'Item',2799),(69,'ItemRelationsItemRelation',251),(70,'ItemRelationsItemRelation',252),(71,'Item',2800),(72,'ItemRelationsItemRelation',253),(73,'ItemRelationsItemRelation',254),(74,'Item',2801),(75,'ItemRelationsItemRelation',255),(76,'ItemRelationsItemRelation',256),(77,'Item',2802),(78,'ItemRelationsItemRelation',257),(79,'ItemRelationsItemRelation',258),(80,'Item',2803),(81,'ItemRelationsItemRelation',259),(82,'ItemRelationsItemRelation',260),(83,'Item',2804),(84,'ItemRelationsItemRelation',261),(85,'ItemRelationsItemRelation',262),(86,'Item',2805),(87,'ItemRelationsItemRelation',263),(88,'ItemRelationsItemRelation',264),(89,'Item',2806),(90,'ItemRelationsItemRelation',265),(91,'ItemRelationsItemRelation',266),(92,'Item',2807),(93,'ItemRelationsItemRelation',267),(94,'ItemRelationsItemRelation',268),(95,'Item',2808),(96,'Item',2809),(97,'ItemRelationsItemRelation',269),(98,'ItemRelationsItemRelation',270),(99,'Item',2810);
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

-- Dump completed on 2012-08-26 19:27:28
