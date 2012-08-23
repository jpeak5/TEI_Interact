-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: apc
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `csv_import_imported_items`
--

DROP TABLE IF EXISTS `csv_import_imported_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csv_import_imported_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `import_id` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csv_import_imported_items`
--

LOCK TABLES `csv_import_imported_items` WRITE;
/*!40000 ALTER TABLE `csv_import_imported_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `csv_import_imported_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csv_import_imports`
--

DROP TABLE IF EXISTS `csv_import_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csv_import_imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `delimiter` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8_unicode_ci NOT NULL,
  `file_position` bigint(20) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipped_row_count` int(10) unsigned NOT NULL,
  `skipped_item_count` int(10) unsigned NOT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `is_featured` tinyint(1) DEFAULT '0',
  `serialized_column_maps` text COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csv_import_imports`
--

LOCK TABLES `csv_import_imports` WRITE;
/*!40000 ALTER TABLE `csv_import_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `csv_import_imports` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_sets`
--

LOCK TABLES `element_sets` WRITE;
/*!40000 ALTER TABLE `element_sets` DISABLE KEYS */;
INSERT INTO `element_sets` VALUES (1,1,'Dublin Core','The Dublin Core metadata element set. These elements are common to all Omeka resources, including items, files, collections, exhibits, and entities. See http://dublincore.org/documents/dces/.'),(3,2,'Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.'),(4,3,'Omeka Legacy File','The metadata element set that, in addition to the Dublin Core element set, was included in the `files` table in previous versions of Omeka. These elements are common to all Omeka files. This set may be deprecated in future versions.'),(5,3,'Omeka Image File','The metadata element set that was included in the `files_images` table in previous versions of Omeka. These elements are common to all image files.'),(6,3,'Omeka Video File','The metadata element set that was included in the `files_videos` table in previous versions of Omeka. These elements are common to all video files.'),(48,2,'TEI Interact','Elements used to describe items auto-created by the TEI Interact plugin');
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
) ENGINE=MyISAM AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_texts`
--

LOCK TABLES `element_texts` WRITE;
/*!40000 ALTER TABLE `element_texts` DISABLE KEYS */;
INSERT INTO `element_texts` VALUES (56,3,2,49,0,'Aznac'),(55,3,2,49,0,'Washington, D.C.'),(54,3,2,49,0,'Bowling-Green Fountain'),(53,3,2,49,0,'New York'),(52,3,2,49,0,'Nile'),(51,3,2,49,0,'Thebes'),(50,3,2,49,0,'Lybian Mountains'),(46,2,2,39,0,'Edgar Allan Poe'),(47,3,2,50,0,'Mummy'),(48,3,2,39,0,'Edgar Allan Poe'),(49,3,2,49,0,'Eleithias'),(59,3,2,49,0,'Egypt'),(58,3,2,49,0,'Great Oasis'),(57,3,2,49,0,'Carnac'),(45,2,2,49,0,'Political Commentary'),(44,2,2,49,0,'Metaphor'),(43,2,2,49,0,'Allegory'),(42,2,2,49,0,'Satire'),(41,2,2,49,0,'New York'),(40,2,2,49,0,'Charleston, SC'),(39,2,2,50,0,'\"The Oblong Box\"'),(38,2,2,50,0,'oblong-tei'),(29,4,3,39,0,'Edgar Allan Poe'),(30,4,3,49,0,'Charleston, SC'),(31,4,3,49,0,'New York'),(32,4,3,49,0,'Satire'),(33,4,3,49,0,'Allegory'),(34,4,3,49,0,'Metaphor'),(35,4,3,49,0,'Political Commentary'),(36,4,3,50,0,'\"The Oblong Box\"'),(37,4,3,51,0,'TEI Document'),(60,3,2,49,0,'Satire'),(61,3,2,49,0,'Metaphor'),(62,3,2,49,0,'Allegory'),(63,3,2,50,0,'Some Words with a Mummy'),(64,6,3,39,0,'Edgar Allan Poe'),(65,6,3,49,0,'Eleithias'),(66,6,3,49,0,'Lybian Mountains'),(67,6,3,49,0,'Thebes'),(68,6,3,49,0,'Nile'),(69,6,3,49,0,'New York'),(70,6,3,49,0,'Bowling-Green Fountain'),(71,6,3,49,0,'Washington, D.C.'),(72,6,3,49,0,'Aznac'),(73,6,3,49,0,'Carnac'),(74,6,3,49,0,'Great Oasis'),(75,6,3,49,0,'Egypt'),(76,6,3,49,0,'Satire'),(77,6,3,49,0,'Metaphor'),(78,6,3,49,0,'Allegory'),(79,6,3,50,0,'Some Words with a Mummy'),(80,6,3,51,0,'TEI Document'),(512,219,2,50,0,'Mrs. W.'),(513,219,2,117,0,'persName'),(514,220,2,50,0,'Mr. Wyatt'),(515,220,2,117,0,'persName'),(516,221,2,50,0,'Mr. Wyatt'),(111,18,2,97,0,'testing123'),(110,18,2,50,0,'My TEI Test Item'),(109,17,2,97,0,'testing123'),(108,17,2,50,0,'My TEI Test Item'),(517,221,2,117,0,'persName'),(518,222,2,50,0,'Captain Hardy'),(519,222,2,117,0,'persName'),(520,223,2,50,0,'Mr. Wyatt'),(521,223,2,117,0,'persName'),(522,224,2,50,0,'Mr. Wyatt'),(523,224,2,117,0,'persName'),(524,225,2,50,0,'Captain Hardy'),(525,225,2,117,0,'persName'),(526,226,2,50,0,'Mr. Wyatt'),(527,226,2,117,0,'persName'),(528,227,2,50,0,'Mr. Wyatt'),(529,227,2,117,0,'persName'),(530,228,2,50,0,''),(531,228,2,117,0,'persName'),(532,229,2,50,0,'Broadway'),(533,229,2,117,0,'persName'),(534,230,2,50,0,'Wyatt'),(535,230,2,117,0,'persName'),(536,231,2,50,0,'Captain Hardy'),(537,231,2,117,0,'persName'),(538,232,2,50,0,'Mr. Wyatt'),(539,232,2,117,0,'persName'),(540,233,2,50,0,'Charleston,'),(541,233,2,117,0,'geogName'),(542,234,2,50,0,' S. C.'),(543,234,2,117,0,'geogName'),(544,235,2,50,0,'New York'),(545,235,2,117,0,'geogName'),(546,236,2,50,0,'Florence'),(547,236,2,117,0,'geogName'),(548,237,2,50,0,'New York'),(549,237,2,117,0,'geogName'),(550,238,2,50,0,'Albany,'),(551,238,2,117,0,'geogName'),(552,239,2,50,0,' New York'),(553,239,2,117,0,'geogName'),(554,240,2,50,0,' type=\"city\">Albany'),(555,240,2,117,0,'geogName'),(556,241,2,50,0,' type=\"street\">Chambers Street,'),(557,241,2,117,0,'geogName'),(558,242,2,50,0,' New York'),(559,242,2,117,0,'geogName'),(560,243,2,50,0,'Cape Hatteras'),(561,243,2,117,0,'geogName'),(562,244,2,50,0,''),(563,244,2,117,0,'geogName'),(564,245,2,50,0,''),(565,245,2,117,0,'geogName'),(566,246,2,50,0,'New York'),(567,246,2,117,0,'geogName'),(511,218,2,117,0,'persName'),(510,218,2,50,0,'Mr. Wyatt'),(509,217,2,117,0,'persName'),(508,217,2,50,0,'Captain Hardy\'s'),(507,216,2,117,0,'persName'),(506,216,2,50,0,' Mr. Wyatt'),(505,215,2,117,0,'persName'),(504,215,2,50,0,'Mrs. Wyatt'),(503,214,2,117,0,'persName'),(502,214,2,50,0,'Mr. W.'),(501,213,2,117,0,'persName'),(500,213,2,50,0,'Mr. Wyatt'),(499,212,2,117,0,'persName'),(498,212,2,50,0,'Wyatt\'s'),(497,211,2,117,0,'persName'),(496,211,2,50,0,'Wyatt\'s'),(495,210,2,117,0,'persName'),(494,210,2,50,0,'Wyatt'),(493,209,2,117,0,'persName'),(492,209,2,50,0,'Mr. Wyatt.'),(491,208,2,117,0,'persName'),(490,208,2,50,0,'Wyatt'),(488,207,2,50,0,'Wyatt'),(489,207,2,117,0,'persName'),(487,206,2,117,0,'persName'),(486,206,2,50,0,'Mrs. W.'),(485,205,2,117,0,'persName'),(484,205,2,50,0,'Mrs. Wyatt'),(483,204,2,117,0,'persName'),(482,204,2,50,0,'Wyatt\'s'),(481,203,2,117,0,'persName'),(480,203,2,50,0,'Wyatt'),(479,202,2,117,0,'persName'),(478,202,2,50,0,'Mrs. Adelaide Curtis'),(477,201,2,117,0,'persName'),(476,201,2,50,0,'Cornelius Wyatt'),(475,200,2,117,0,'persName'),(474,200,2,50,0,'Mrs. Adelaide Curtis'),(473,199,2,117,0,'persName'),(472,199,2,50,0,'Wyatt\'s'),(471,198,2,117,0,'persName'),(470,198,2,50,0,' Wyatt'),(468,197,2,50,0,''),(469,197,2,117,0,'persName'),(467,196,2,117,0,'persName'),(466,196,2,50,0,'Rubini the younger'),(465,195,2,117,0,'persName'),(464,195,2,50,0,' Leonardo\'s'),(463,194,2,117,0,'persName'),(462,194,2,50,0,''),(461,193,2,117,0,'persName'),(460,193,2,50,0,'Mr. W.'),(459,192,2,117,0,'persName'),(458,192,2,50,0,'Mrs. Wyatt'),(457,191,2,117,0,'persName'),(456,191,2,50,0,'Mrs. Wyatt'),(455,190,2,117,0,'persName'),(454,190,2,50,0,'Marian'),(453,189,2,117,0,'persName'),(452,189,2,50,0,'Wyatt\'s'),(451,188,2,117,0,'persName'),(450,188,2,50,0,'Captain Hardy'),(449,187,2,117,0,'persName'),(448,187,2,50,0,'Mrs. W.'),(447,186,2,117,0,'persName'),(446,186,2,50,0,'Wyatt'),(445,185,2,117,0,'persName'),(444,185,2,50,0,'Wyatt\'s'),(443,184,2,117,0,'persName'),(442,184,2,50,0,' Nicolino'),(441,183,2,117,0,'persName'),(440,183,2,50,0,'Mr. Cornelius Wyatt'),(439,182,2,117,0,'persName'),(438,182,2,50,0,'Captain Hardy.');
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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,2,1,3,NULL,'Text','Any textual data included in the document.'),(2,2,2,3,NULL,'Interviewer','The person(s) performing the interview.'),(3,2,2,3,NULL,'Interviewee','The person(s) being interviewed.'),(4,2,2,3,NULL,'Location','The location of the interview.'),(5,2,1,3,NULL,'Transcription','Any written text transcribed from a sound.'),(6,2,2,3,NULL,'Local URL','The URL of the local directory containing all assets of the website.'),(7,2,2,3,NULL,'Original Format','If the image is of an object, state the type of object, such as painting, sculpture, paper, photo, and additional data'),(10,2,2,3,NULL,'Physical Dimensions','The actual physical size of the original image.'),(11,2,2,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)'),(12,2,2,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)'),(13,2,2,3,NULL,'Producer','Name (or names) of the person who produced the video.'),(14,2,2,3,NULL,'Director','Name (or names) of the person who produced the video.'),(15,2,2,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)'),(16,2,2,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview'),(17,2,1,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers.'),(18,2,2,3,NULL,'Subject Line','The content of the subject line of the email.'),(19,2,2,3,NULL,'From','The name and email address of the person sending the email.'),(20,2,2,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent.'),(21,2,2,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied.'),(22,2,2,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied.'),(23,2,2,3,NULL,'Number of Attachments','The number of attachments to the email.'),(24,2,1,3,NULL,'Standards',''),(25,2,1,3,NULL,'Objectives',''),(26,2,1,3,NULL,'Materials',''),(27,2,1,3,NULL,'Lesson Plan Text',''),(28,2,2,3,NULL,'URL',''),(29,2,2,3,NULL,'Event Type',''),(30,2,1,3,NULL,'Participants','Names of individuals or groups participating in the event.'),(31,2,9,3,NULL,'Birth Date',''),(32,2,2,3,NULL,'Birthplace',''),(33,2,9,3,NULL,'Death Date',''),(34,2,2,3,NULL,'Occupation',''),(35,2,1,3,NULL,'Biographical Text',''),(36,2,1,3,NULL,'Bibliography',''),(37,1,2,1,8,'Contributor','An entity responsible for making contributions to the resource. Examples of a Contributor include a person, an organization, or a service. Typically, the name of a Contributor should be used to indicate the entity.'),(38,1,2,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant. Spatial topic and spatial applicability may be a named place or a location specified by its geographic coordinates. Temporal topic may be a named period, date, or date range. A jurisdiction may be a named administrative entity or a geographic place to which the resource applies. Recommended best practice is to use a controlled vocabulary such as the Thesaurus of Geographic Names [TGN]. Where appropriate, named places or time periods can be used in preference to numeric identifiers such as sets of coordinates or date ranges.'),(39,1,2,1,4,'Creator','An entity primarily responsible for making the resource. Examples of a Creator include a person, an organization, or a service. Typically, the name of a Creator should be used to indicate the entity.'),(40,1,2,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource. Date may be used to express temporal information at any level of granularity. Recommended best practice is to use an encoding scheme, such as the W3CDTF profile of ISO 8601 [W3CDTF].'),(41,1,1,1,3,'Description','An account of the resource. Description may include but is not limited to: an abstract, a table of contents, a graphical representation, or a free-text account of the resource.'),(42,1,2,1,11,'Format','The file format, physical medium, or dimensions of the resource. Examples of dimensions include size and duration. Recommended best practice is to use a controlled vocabulary such as the list of Internet Media Types [MIME].'),(43,1,2,1,14,'Identifier','An unambiguous reference to the resource within a given context. Recommended best practice is to identify the resource by means of a string conforming to a formal identification system.'),(44,1,2,1,12,'Language','A language of the resource. Recommended best practice is to use a controlled vocabulary such as RFC 4646 [RFC4646].'),(45,1,2,1,6,'Publisher','An entity responsible for making the resource available. Examples of a Publisher include a person, an organization, or a service. Typically, the name of a Publisher should be used to indicate the entity.'),(46,1,2,1,10,'Relation','A related resource. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(47,1,2,1,9,'Rights','Information about rights held in and over the resource. Typically, rights information includes a statement about various property rights associated with the resource, including intellectual property rights.'),(48,1,2,1,5,'Source','A related resource from which the described resource is derived. The described resource may be derived from the related resource in whole or in part. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),(49,1,2,1,2,'Subject','The topic of the resource. Typically, the subject will be represented using keywords, key phrases, or classification codes. Recommended best practice is to use a controlled vocabulary. To describe the spatial or temporal topic of the resource, use the Coverage element.'),(50,1,2,1,1,'Title','A name given to the resource. Typically, a Title will be a name by which the resource is formally known.'),(51,1,2,1,13,'Type','The nature or genre of the resource. Recommended best practice is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE]. To describe the file format, physical medium, or dimensions of the resource, use the Format element.'),(58,3,1,4,1,'Additional Creator',''),(59,3,1,4,2,'Transcriber',''),(60,3,1,4,3,'Producer',''),(61,3,1,4,4,'Render Device',''),(62,3,1,4,5,'Render Details',''),(63,3,10,4,6,'Capture Date',''),(64,3,1,4,7,'Capture Device',''),(65,3,1,4,8,'Capture Details',''),(66,3,1,4,9,'Change History',''),(67,3,1,4,10,'Watermark',''),(69,3,1,4,12,'Encryption',''),(70,3,1,4,13,'Compression',''),(71,3,1,4,14,'Post Processing',''),(72,3,4,5,1,'Width',''),(73,3,4,5,2,'Height',''),(74,3,4,5,3,'Bit Depth',''),(75,3,4,5,4,'Channels',''),(76,3,1,5,5,'Exif String',''),(77,3,1,5,6,'Exif Array',''),(78,3,1,5,7,'IPTC String',''),(79,3,1,5,8,'IPTC Array',''),(80,3,4,6,1,'Bitrate',''),(81,3,4,6,2,'Duration',''),(82,3,4,6,3,'Sample Rate',''),(83,3,1,6,4,'Codec',''),(84,3,4,6,5,'Width',''),(85,3,4,6,6,'Height',''),(117,2,1,48,NULL,'tei-type','TEI type element');
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
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_relations`
--

LOCK TABLES `entities_relations` WRITE;
/*!40000 ALTER TABLE `entities_relations` DISABLE KEYS */;
INSERT INTO `entities_relations` VALUES (4,1,2,2,'Item','2012-08-19 12:22:03'),(2,1,2,1,'Item','2012-08-06 17:43:16'),(3,1,2,2,'Item','2012-08-06 18:52:36'),(5,1,3,1,'Item','2012-08-19 12:10:04'),(18,1,14,1,'Item','2012-08-20 21:52:08'),(17,1,13,1,'Item','2012-08-20 21:51:12'),(19,1,15,1,'Item','2012-08-20 22:59:03'),(20,1,16,1,'Item','2012-08-21 18:45:48'),(21,1,17,1,'Item','2012-08-21 19:06:36'),(22,1,18,1,'Item','2012-08-21 19:07:36'),(230,1,226,1,'Item','2012-08-22 19:47:24'),(231,1,227,1,'Item','2012-08-22 19:47:24'),(232,1,228,1,'Item','2012-08-22 19:47:24'),(233,1,229,1,'Item','2012-08-22 19:47:24'),(234,1,230,1,'Item','2012-08-22 19:47:24'),(235,1,231,1,'Item','2012-08-22 19:47:24'),(236,1,232,1,'Item','2012-08-22 19:47:24'),(237,1,233,1,'Item','2012-08-22 19:49:18'),(238,1,234,1,'Item','2012-08-22 19:49:18'),(239,1,235,1,'Item','2012-08-22 19:49:18'),(240,1,236,1,'Item','2012-08-22 19:49:19'),(241,1,237,1,'Item','2012-08-22 19:49:19'),(242,1,238,1,'Item','2012-08-22 19:49:19'),(243,1,239,1,'Item','2012-08-22 19:49:19'),(244,1,240,1,'Item','2012-08-22 19:49:19'),(245,1,241,1,'Item','2012-08-22 19:49:19'),(246,1,242,1,'Item','2012-08-22 19:49:19'),(247,1,243,1,'Item','2012-08-22 19:49:19'),(248,1,244,1,'Item','2012-08-22 19:49:19'),(249,1,245,1,'Item','2012-08-22 19:49:19'),(250,1,246,1,'Item','2012-08-22 19:49:19'),(229,1,225,1,'Item','2012-08-22 19:47:24'),(228,1,224,1,'Item','2012-08-22 19:47:24'),(227,1,223,1,'Item','2012-08-22 19:47:24'),(226,1,222,1,'Item','2012-08-22 19:47:24'),(225,1,221,1,'Item','2012-08-22 19:47:24'),(224,1,220,1,'Item','2012-08-22 19:47:24'),(223,1,219,1,'Item','2012-08-22 19:47:24'),(222,1,218,1,'Item','2012-08-22 19:47:24'),(221,1,217,1,'Item','2012-08-22 19:47:23'),(220,1,216,1,'Item','2012-08-22 19:47:23'),(219,1,215,1,'Item','2012-08-22 19:47:23'),(218,1,214,1,'Item','2012-08-22 19:47:23'),(217,1,213,1,'Item','2012-08-22 19:47:23'),(216,1,212,1,'Item','2012-08-22 19:47:23'),(215,1,211,1,'Item','2012-08-22 19:47:23'),(214,1,210,1,'Item','2012-08-22 19:47:23'),(213,1,209,1,'Item','2012-08-22 19:47:23'),(212,1,208,1,'Item','2012-08-22 19:47:23'),(211,1,207,1,'Item','2012-08-22 19:47:23'),(210,1,206,1,'Item','2012-08-22 19:47:23'),(209,1,205,1,'Item','2012-08-22 19:47:23'),(208,1,204,1,'Item','2012-08-22 19:47:23'),(207,1,203,1,'Item','2012-08-22 19:47:23'),(206,1,202,1,'Item','2012-08-22 19:47:23'),(205,1,201,1,'Item','2012-08-22 19:47:23'),(204,1,200,1,'Item','2012-08-22 19:47:22'),(203,1,199,1,'Item','2012-08-22 19:47:22'),(202,1,198,1,'Item','2012-08-22 19:47:22'),(201,1,197,1,'Item','2012-08-22 19:47:22'),(200,1,196,1,'Item','2012-08-22 19:47:22'),(199,1,195,1,'Item','2012-08-22 19:47:22'),(198,1,194,1,'Item','2012-08-22 19:47:22'),(197,1,193,1,'Item','2012-08-22 19:47:22'),(196,1,192,1,'Item','2012-08-22 19:47:22'),(195,1,191,1,'Item','2012-08-22 19:47:22'),(194,1,190,1,'Item','2012-08-22 19:47:22'),(193,1,189,1,'Item','2012-08-22 19:47:22'),(192,1,188,1,'Item','2012-08-22 19:47:22'),(191,1,187,1,'Item','2012-08-22 19:47:22'),(190,1,186,1,'Item','2012-08-22 19:47:22'),(189,1,185,1,'Item','2012-08-22 19:47:22'),(188,1,184,1,'Item','2012-08-22 19:47:21'),(187,1,183,1,'Item','2012-08-22 19:47:21'),(186,1,182,1,'Item','2012-08-22 19:47:21');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (5,2,NULL,46067,0,'c492f80b5701188e4a014f15c3dec3e6','application/xml','application/xml; charset=us-ascii','XML document text','c0c0afbd733b953ceb2bc62a9c7ae284.xml','OblongBoxehdAnalytic2.xml','2012-08-19 17:22:03','2012-08-19 16:22:02',1),(4,2,NULL,37022,0,'e1d4d4fd4f7282e5898a8836012e3fc3','application/xml','application/xml; charset=us-ascii','XML  document text','96b2bc58a9291e87845ba1c98132ed81.xml','oblong.xml','2012-08-19 17:22:03','2012-08-06 22:52:36',1),(6,3,NULL,55232,0,'f81d4d8eabb1853487bbe0b0b52db0ee','application/xml','application/xml; charset=us-ascii','XML document text','bad7097dac0288283196123f7ad442b9.xml','mummy.xml','2012-08-19 18:10:05','2012-08-19 17:10:04',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'Document','A resource containing textual data.  Note that facsimiles or images of texts are still of the genre text.'),(3,'Moving Image','A series of visual representations that, when shown in succession, impart an impression of motion.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource whose content is primarily intended to be rendered as audio.'),(6,'Still Image','A static visual representation. Examples of still images are: paintings, drawings, graphic designs, plans and maps.  Recommended best practice is to assign the type \"text\" to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence.  Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','Instructional materials.'),(11,'Hyperlink','Title, URL, Description or annotation.'),(12,'Person','An individual, biographical data, birth and death, etc.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'TEI Document','TEIDisplay is a plugin created by the Scholars\' Lab at the University of Virginia Library. This plugin will render an uploaded TEI file attached to an item in the display. The default XSLT stylesheet allows for two display types: entire and segmental. The entire display type will render out the entire document in HTML while the segmental display type includes a table of contents for displaying a selected div1 or div2, which is a useful feature for larger documents. The display type and XSLT stylesheet can be customized for each TEI File in the database through the TEI Config tab in the administrative interface. Additionally, metadata from the TEI Header is automatically mapped to Dublin Core fields for both the item and file.'),(27,'TEI Auto','item created programmatically by the TEI Interact plugin');
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
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,14,NULL,0,0,'2012-08-19 17:10:04','2012-08-19 17:10:04'),(2,14,NULL,0,0,'2012-08-19 17:22:03','2012-08-06 22:43:16'),(227,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(228,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(229,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(230,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(231,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(232,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(233,25,NULL,0,1,'2012-08-23 00:49:18','2012-08-23 00:49:18'),(234,25,NULL,0,1,'2012-08-23 00:49:18','2012-08-23 00:49:18'),(235,25,NULL,0,1,'2012-08-23 00:49:18','2012-08-23 00:49:18'),(236,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(237,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(238,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(239,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(240,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(241,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(242,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(243,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(244,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(245,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(246,25,NULL,0,1,'2012-08-23 00:49:19','2012-08-23 00:49:19'),(226,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(225,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(224,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(223,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(222,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(221,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(220,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(219,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(218,25,NULL,0,1,'2012-08-23 00:47:24','2012-08-23 00:47:24'),(217,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(216,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(215,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(214,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(213,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(212,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(211,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(210,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(209,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(208,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(207,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(206,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(205,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(204,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(203,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(202,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(201,25,NULL,0,1,'2012-08-23 00:47:23','2012-08-23 00:47:23'),(200,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(199,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(198,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(197,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(196,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(195,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(194,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(193,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(192,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(191,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(190,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(189,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(188,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(187,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(186,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(185,25,NULL,0,1,'2012-08-23 00:47:22','2012-08-23 00:47:22'),(184,25,NULL,0,1,'2012-08-23 00:47:21','2012-08-23 00:47:21'),(183,25,NULL,0,1,'2012-08-23 00:47:21','2012-08-23 00:47:21'),(182,25,NULL,0,1,'2012-08-23 00:47:21','2012-08-23 00:47:21');
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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'omeka_version','1.5.2'),(2,'administrator_email','jpeak5@lsu.edu'),(3,'copyright',''),(4,'site_title','apc'),(5,'author',''),(6,'description','dev for cct-apc'),(7,'thumbnail_constraint','200'),(8,'square_thumbnail_constraint','200'),(9,'fullsize_constraint','800'),(10,'per_page_admin','10'),(11,'per_page_public','10'),(12,'show_empty_elements','0'),(13,'path_to_convert',''),(14,'admin_theme','default'),(15,'public_theme','default'),(28,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xml,xlw,zip'),(29,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo,text/xml,application/xml'),(27,'disable_default_file_validation','0'),(19,'display_system_info','1'),(20,'tag_delimiter',','),(44,'omeka_update','a:2:{s:14:\"latest_version\";s:5:\"1.5.3\";s:12:\"last_updated\";i:1345589018;}'),(39,'tei_display_type',NULL),(30,'recaptcha_public_key',''),(31,'recaptcha_private_key',''),(40,'tei_default_stylesheet',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (23,'TeiDisplay',1,'1.0'),(43,'TeiInteract',1,'0.1'),(40,'CsvImport',1,'1.3.4');
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
INSERT INTO `sessions` VALUES ('0b6e33edmba40d6ufdffhp89o1',1344383728,1209600,''),('0milmo9g6djpibkvvae1tdqh67',1344383935,1209600,''),('0o5jmsvghjq0fl2qiaklis9di2',1344293208,1209600,''),('1ldhiob5jlkhsj9vop5fnv4ra0',1344384531,1209600,''),('1tqf6smc0m5dnodelaajehbs31',1344086292,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('2bgm5qaqsfge4c9kbnf0qk6qs2',1344384506,1209600,''),('2tdc1mt2boqak0o2c4tilus0g1',1345411487,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('3muk8mp0pa1f5vonglo3g78h56',1344383932,1209600,''),('8344t74jn0hc030utefmkm4k01',1344383935,1209600,''),('a1dhbqm4ts4k1oa6vh90hjsbc0',1344384552,1209600,''),('a6c3ogt66boa51g2uk2oupnss1',1344384542,1209600,''),('c7gol23ekq3cpb7v1tlsfq3g21',1344384542,1209600,''),('c7mqfhfitiavt36r3q8hllcf72',1344294116,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('cl39f1vhg3f79scbkk24rg4fc6',1344383729,1209600,''),('df4u3hdioij592nqt42ojv7l72',1344384547,1209600,''),('dgenudbdpog7e17d3nghg0sbh5',1343780269,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('dkh0848q0kbpkeknmuj6krqha7',1344383729,1209600,''),('e1f2rc5p2j40ukq8tu98t2vo53',1345603831,1209600,'Default|a:1:{s:8:\"redirect\";s:26:\"/tei-interact/files/browse\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}'),('e56mbcc1oit14uq8tdh0k1jfo1',1344383931,1209600,''),('hhe71m4864rfq15lue7u7v0rf3',1344384506,1209600,''),('i0ojrrc1d3fh1o60a73cq6rhv1',1344384542,1209600,''),('oim5pqa53ddjrnrlg9o4jsdch0',1345078045,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('qt21q0harn24rau3761csggqg2',1344383934,1209600,''),('rf2p2c7vmde6npk96r73nkcq23',1344474483,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('toj3ri38da58knklco26q583e5',1344384139,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}flash|a:1:{s:6:\"status\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('ul1fprufqshlsr8913vo0vo1c4',1345683015,1209600,'Default|a:1:{s:8:\"redirect\";s:7:\"/config\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}flash|a:1:{s:6:\"status\";N;}');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'test'),(2,'item-types');
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
INSERT INTO `tei_display_configs` VALUES (1,2,4,0,NULL,'The Oblong Box','default.xsl','entire'),(2,3,6,0,NULL,'some-words-with-a-mummy-ehd',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tei_interact_cleanups`
--

LOCK TABLES `tei_interact_cleanups` WRITE;
/*!40000 ALTER TABLE `tei_interact_cleanups` DISABLE KEYS */;
INSERT INTO `tei_interact_cleanups` VALUES (197,'ElementSet',48),(198,'Element',117),(199,'ItemType',27),(200,'Item',182),(201,'Item',183),(202,'Item',184),(203,'Item',185),(204,'Item',186),(205,'Item',187),(206,'Item',188),(207,'Item',189),(208,'Item',190),(209,'Item',191),(210,'Item',192),(211,'Item',193),(212,'Item',194),(213,'Item',195),(214,'Item',196),(215,'Item',197),(216,'Item',198),(217,'Item',199),(218,'Item',200),(219,'Item',201),(220,'Item',202),(221,'Item',203),(222,'Item',204),(223,'Item',205),(224,'Item',206),(225,'Item',207),(226,'Item',208),(227,'Item',209),(228,'Item',210),(229,'Item',211),(230,'Item',212),(231,'Item',213),(232,'Item',214),(233,'Item',215),(234,'Item',216),(235,'Item',217),(236,'Item',218),(237,'Item',219),(238,'Item',220),(239,'Item',221),(240,'Item',222),(241,'Item',223),(242,'Item',224),(243,'Item',225),(244,'Item',226),(245,'Item',227),(246,'Item',228),(247,'Item',229),(248,'Item',230),(249,'Item',231),(250,'Item',232),(251,'Item',233),(252,'Item',234),(253,'Item',235),(254,'Item',236),(255,'Item',237),(256,'Item',238),(257,'Item',239),(258,'Item',240),(259,'Item',241),(260,'Item',242),(261,'Item',243),(262,'Item',244),(263,'Item',245),(264,'Item',246);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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

-- Dump completed on 2012-08-23 17:44:08
