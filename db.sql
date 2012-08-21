-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2012 at 06:57 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apc`
--

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE IF NOT EXISTS `collections` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `csv_import_imported_items`
--

CREATE TABLE IF NOT EXISTS `csv_import_imported_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `import_id` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `csv_import_imports`
--

CREATE TABLE IF NOT EXISTS `csv_import_imports` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `description`) VALUES
(1, 'Text', 'A long, typically multi-line text string. Up to 65535 characters.'),
(2, 'Tiny Text', 'A short, typically one-line text string. Up to 255 characters.'),
(3, 'Date Range', 'A date range, begin to end. In format yyyy-mm-dd yyyy-mm-dd.'),
(4, 'Integer', 'Set of numbers consisting of the natural numbers including 0 (0, 1, 2, 3, ...) and their negatives (0, âˆ’1, âˆ’2, âˆ’3, ...).'),
(9, 'Date', 'A date in format yyyy-mm-dd'),
(10, 'Date Time', 'A date and time combination in the format: yyyy-mm-dd hh:mm:ss');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=97 ;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `record_type_id`, `data_type_id`, `element_set_id`, `order`, `name`, `description`) VALUES
(1, 2, 1, 3, NULL, 'Text', 'Any textual data included in the document.'),
(2, 2, 2, 3, NULL, 'Interviewer', 'The person(s) performing the interview.'),
(3, 2, 2, 3, NULL, 'Interviewee', 'The person(s) being interviewed.'),
(4, 2, 2, 3, NULL, 'Location', 'The location of the interview.'),
(5, 2, 1, 3, NULL, 'Transcription', 'Any written text transcribed from a sound.'),
(6, 2, 2, 3, NULL, 'Local URL', 'The URL of the local directory containing all assets of the website.'),
(7, 2, 2, 3, NULL, 'Original Format', 'If the image is of an object, state the type of object, such as painting, sculpture, paper, photo, and additional data'),
(10, 2, 2, 3, NULL, 'Physical Dimensions', 'The actual physical size of the original image.'),
(11, 2, 2, 3, NULL, 'Duration', 'Length of time involved (seconds, minutes, hours, days, class periods, etc.)'),
(12, 2, 2, 3, NULL, 'Compression', 'Type/rate of compression for moving image file (i.e. MPEG-4)'),
(13, 2, 2, 3, NULL, 'Producer', 'Name (or names) of the person who produced the video.'),
(14, 2, 2, 3, NULL, 'Director', 'Name (or names) of the person who produced the video.'),
(15, 2, 2, 3, NULL, 'Bit Rate/Frequency', 'Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)'),
(16, 2, 2, 3, NULL, 'Time Summary', 'A summary of an interview given for different time stamps throughout the interview'),
(17, 2, 1, 3, NULL, 'Email Body', 'The main body of the email, including all replied and forwarded text and headers.'),
(18, 2, 2, 3, NULL, 'Subject Line', 'The content of the subject line of the email.'),
(19, 2, 2, 3, NULL, 'From', 'The name and email address of the person sending the email.'),
(20, 2, 2, 3, NULL, 'To', 'The name(s) and email address(es) of the person to whom the email was sent.'),
(21, 2, 2, 3, NULL, 'CC', 'The name(s) and email address(es) of the person to whom the email was carbon copied.'),
(22, 2, 2, 3, NULL, 'BCC', 'The name(s) and email address(es) of the person to whom the email was blind carbon copied.'),
(23, 2, 2, 3, NULL, 'Number of Attachments', 'The number of attachments to the email.'),
(24, 2, 1, 3, NULL, 'Standards', ''),
(25, 2, 1, 3, NULL, 'Objectives', ''),
(26, 2, 1, 3, NULL, 'Materials', ''),
(27, 2, 1, 3, NULL, 'Lesson Plan Text', ''),
(28, 2, 2, 3, NULL, 'URL', ''),
(29, 2, 2, 3, NULL, 'Event Type', ''),
(30, 2, 1, 3, NULL, 'Participants', 'Names of individuals or groups participating in the event.'),
(31, 2, 9, 3, NULL, 'Birth Date', ''),
(32, 2, 2, 3, NULL, 'Birthplace', ''),
(33, 2, 9, 3, NULL, 'Death Date', ''),
(34, 2, 2, 3, NULL, 'Occupation', ''),
(35, 2, 1, 3, NULL, 'Biographical Text', ''),
(36, 2, 1, 3, NULL, 'Bibliography', ''),
(37, 1, 2, 1, 8, 'Contributor', 'An entity responsible for making contributions to the resource. Examples of a Contributor include a person, an organization, or a service. Typically, the name of a Contributor should be used to indicate the entity.'),
(38, 1, 2, 1, 15, 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant. Spatial topic and spatial applicability may be a named place or a location specified by its geographic coordinates. Temporal topic may be a named period, date, or date range. A jurisdiction may be a named administrative entity or a geographic place to which the resource applies. Recommended best practice is to use a controlled vocabulary such as the Thesaurus of Geographic Names [TGN]. Where appropriate, named places or time periods can be used in preference to numeric identifiers such as sets of coordinates or date ranges.'),
(39, 1, 2, 1, 4, 'Creator', 'An entity primarily responsible for making the resource. Examples of a Creator include a person, an organization, or a service. Typically, the name of a Creator should be used to indicate the entity.'),
(40, 1, 2, 1, 7, 'Date', 'A point or period of time associated with an event in the lifecycle of the resource. Date may be used to express temporal information at any level of granularity. Recommended best practice is to use an encoding scheme, such as the W3CDTF profile of ISO 8601 [W3CDTF].'),
(41, 1, 1, 1, 3, 'Description', 'An account of the resource. Description may include but is not limited to: an abstract, a table of contents, a graphical representation, or a free-text account of the resource.'),
(42, 1, 2, 1, 11, 'Format', 'The file format, physical medium, or dimensions of the resource. Examples of dimensions include size and duration. Recommended best practice is to use a controlled vocabulary such as the list of Internet Media Types [MIME].'),
(43, 1, 2, 1, 14, 'Identifier', 'An unambiguous reference to the resource within a given context. Recommended best practice is to identify the resource by means of a string conforming to a formal identification system.'),
(44, 1, 2, 1, 12, 'Language', 'A language of the resource. Recommended best practice is to use a controlled vocabulary such as RFC 4646 [RFC4646].'),
(45, 1, 2, 1, 6, 'Publisher', 'An entity responsible for making the resource available. Examples of a Publisher include a person, an organization, or a service. Typically, the name of a Publisher should be used to indicate the entity.'),
(46, 1, 2, 1, 10, 'Relation', 'A related resource. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),
(47, 1, 2, 1, 9, 'Rights', 'Information about rights held in and over the resource. Typically, rights information includes a statement about various property rights associated with the resource, including intellectual property rights.'),
(48, 1, 2, 1, 5, 'Source', 'A related resource from which the described resource is derived. The described resource may be derived from the related resource in whole or in part. Recommended best practice is to identify the related resource by means of a string conforming to a formal identification system.'),
(49, 1, 2, 1, 2, 'Subject', 'The topic of the resource. Typically, the subject will be represented using keywords, key phrases, or classification codes. Recommended best practice is to use a controlled vocabulary. To describe the spatial or temporal topic of the resource, use the Coverage element.'),
(50, 1, 2, 1, 1, 'Title', 'A name given to the resource. Typically, a Title will be a name by which the resource is formally known.'),
(51, 1, 2, 1, 13, 'Type', 'The nature or genre of the resource. Recommended best practice is to use a controlled vocabulary such as the DCMI Type Vocabulary [DCMITYPE]. To describe the file format, physical medium, or dimensions of the resource, use the Format element.'),
(58, 3, 1, 4, 1, 'Additional Creator', ''),
(59, 3, 1, 4, 2, 'Transcriber', ''),
(60, 3, 1, 4, 3, 'Producer', ''),
(61, 3, 1, 4, 4, 'Render Device', ''),
(62, 3, 1, 4, 5, 'Render Details', ''),
(63, 3, 10, 4, 6, 'Capture Date', ''),
(64, 3, 1, 4, 7, 'Capture Device', ''),
(65, 3, 1, 4, 8, 'Capture Details', ''),
(66, 3, 1, 4, 9, 'Change History', ''),
(67, 3, 1, 4, 10, 'Watermark', ''),
(69, 3, 1, 4, 12, 'Encryption', ''),
(70, 3, 1, 4, 13, 'Compression', ''),
(71, 3, 1, 4, 14, 'Post Processing', ''),
(72, 3, 4, 5, 1, 'Width', ''),
(73, 3, 4, 5, 2, 'Height', ''),
(74, 3, 4, 5, 3, 'Bit Depth', ''),
(75, 3, 4, 5, 4, 'Channels', ''),
(76, 3, 1, 5, 5, 'Exif String', ''),
(77, 3, 1, 5, 6, 'Exif Array', ''),
(78, 3, 1, 5, 7, 'IPTC String', ''),
(79, 3, 1, 5, 8, 'IPTC Array', ''),
(80, 3, 4, 6, 1, 'Bitrate', ''),
(81, 3, 4, 6, 2, 'Duration', ''),
(82, 3, 4, 6, 3, 'Sample Rate', ''),
(83, 3, 1, 6, 4, 'Codec', ''),
(84, 3, 4, 6, 5, 'Width', ''),
(85, 3, 4, 6, 6, 'Height', '');

-- --------------------------------------------------------

--
-- Table structure for table `element_sets`
--

CREATE TABLE IF NOT EXISTS `element_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `record_type_id` (`record_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `element_sets`
--

INSERT INTO `element_sets` (`id`, `record_type_id`, `name`, `description`) VALUES
(1, 1, 'Dublin Core', 'The Dublin Core metadata element set. These elements are common to all Omeka resources, including items, files, collections, exhibits, and entities. See http://dublincore.org/documents/dces/.'),
(3, 2, 'Item Type Metadata', 'The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.'),
(4, 3, 'Omeka Legacy File', 'The metadata element set that, in addition to the Dublin Core element set, was included in the `files` table in previous versions of Omeka. These elements are common to all Omeka files. This set may be deprecated in future versions.'),
(5, 3, 'Omeka Image File', 'The metadata element set that was included in the `files_images` table in previous versions of Omeka. These elements are common to all image files.'),
(6, 3, 'Omeka Video File', 'The metadata element set that was included in the `files_videos` table in previous versions of Omeka. These elements are common to all video files.');

-- --------------------------------------------------------

--
-- Table structure for table `element_texts`
--

CREATE TABLE IF NOT EXISTS `element_texts` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=108 ;

--
-- Dumping data for table `element_texts`
--

INSERT INTO `element_texts` (`id`, `record_id`, `record_type_id`, `element_id`, `html`, `text`) VALUES
(56, 3, 2, 49, 0, 'Aznac'),
(55, 3, 2, 49, 0, 'Washington, D.C.'),
(54, 3, 2, 49, 0, 'Bowling-Green Fountain'),
(53, 3, 2, 49, 0, 'New York'),
(52, 3, 2, 49, 0, 'Nile'),
(51, 3, 2, 49, 0, 'Thebes'),
(50, 3, 2, 49, 0, 'Lybian Mountains'),
(46, 2, 2, 39, 0, 'Edgar Allan Poe'),
(47, 3, 2, 50, 0, 'Mummy'),
(48, 3, 2, 39, 0, 'Edgar Allan Poe'),
(49, 3, 2, 49, 0, 'Eleithias'),
(59, 3, 2, 49, 0, 'Egypt'),
(58, 3, 2, 49, 0, 'Great Oasis'),
(57, 3, 2, 49, 0, 'Carnac'),
(45, 2, 2, 49, 0, 'Political Commentary'),
(44, 2, 2, 49, 0, 'Metaphor'),
(43, 2, 2, 49, 0, 'Allegory'),
(42, 2, 2, 49, 0, 'Satire'),
(41, 2, 2, 49, 0, 'New York'),
(40, 2, 2, 49, 0, 'Charleston, SC'),
(39, 2, 2, 50, 0, '"The Oblong Box"'),
(38, 2, 2, 50, 0, 'oblong-tei'),
(29, 4, 3, 39, 0, 'Edgar Allan Poe'),
(30, 4, 3, 49, 0, 'Charleston, SC'),
(31, 4, 3, 49, 0, 'New York'),
(32, 4, 3, 49, 0, 'Satire'),
(33, 4, 3, 49, 0, 'Allegory'),
(34, 4, 3, 49, 0, 'Metaphor'),
(35, 4, 3, 49, 0, 'Political Commentary'),
(36, 4, 3, 50, 0, '"The Oblong Box"'),
(37, 4, 3, 51, 0, 'TEI Document'),
(60, 3, 2, 49, 0, 'Satire'),
(61, 3, 2, 49, 0, 'Metaphor'),
(62, 3, 2, 49, 0, 'Allegory'),
(63, 3, 2, 50, 0, 'Some Words with a Mummy'),
(64, 6, 3, 39, 0, 'Edgar Allan Poe'),
(65, 6, 3, 49, 0, 'Eleithias'),
(66, 6, 3, 49, 0, 'Lybian Mountains'),
(67, 6, 3, 49, 0, 'Thebes'),
(68, 6, 3, 49, 0, 'Nile'),
(69, 6, 3, 49, 0, 'New York'),
(70, 6, 3, 49, 0, 'Bowling-Green Fountain'),
(71, 6, 3, 49, 0, 'Washington, D.C.'),
(72, 6, 3, 49, 0, 'Aznac'),
(73, 6, 3, 49, 0, 'Carnac'),
(74, 6, 3, 49, 0, 'Great Oasis'),
(75, 6, 3, 49, 0, 'Egypt'),
(76, 6, 3, 49, 0, 'Satire'),
(77, 6, 3, 49, 0, 'Metaphor'),
(78, 6, 3, 49, 0, 'Allegory'),
(79, 6, 3, 50, 0, 'Some Words with a Mummy'),
(80, 6, 3, 51, 0, 'TEI Document');

-- --------------------------------------------------------

--
-- Table structure for table `entities`
--

CREATE TABLE IF NOT EXISTS `entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE utf8_unicode_ci,
  `middle_name` text COLLATE utf8_unicode_ci,
  `last_name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `institution` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `entities`
--

INSERT INTO `entities` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `institution`) VALUES
(1, 'Super', NULL, 'User', 'jpeak5@lsu.edu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `entities_relations`
--

CREATE TABLE IF NOT EXISTS `entities_relations` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `entities_relations`
--

INSERT INTO `entities_relations` (`id`, `entity_id`, `relation_id`, `relationship_id`, `type`, `time`) VALUES
(4, 1, 2, 2, 'Item', '2012-08-19 12:22:03'),
(2, 1, 2, 1, 'Item', '2012-08-06 17:43:16'),
(3, 1, 2, 2, 'Item', '2012-08-06 18:52:36'),
(5, 1, 3, 1, 'Item', '2012-08-19 12:10:04'),
(6, 1, 4, 1, 'Item', '2012-08-19 21:23:31'),
(7, 1, 4, 2, 'Item', '2012-08-19 21:39:02'),
(18, 1, 14, 1, 'Item', '2012-08-20 21:52:08'),
(17, 1, 13, 1, 'Item', '2012-08-20 21:51:12'),
(19, 1, 15, 1, 'Item', '2012-08-20 22:59:03'),
(20, 1, 16, 1, 'Item', '2012-08-21 18:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `entity_relationships`
--

CREATE TABLE IF NOT EXISTS `entity_relationships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `entity_relationships`
--

INSERT INTO `entity_relationships` (`id`, `name`, `description`) VALUES
(1, 'added', NULL),
(2, 'modified', NULL),
(3, 'favorite', NULL),
(4, 'collector', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `item_id`, `order`, `size`, `has_derivative_image`, `authentication`, `mime_browser`, `mime_os`, `type_os`, `archive_filename`, `original_filename`, `modified`, `added`, `stored`) VALUES
(5, 2, NULL, 46067, 0, 'c492f80b5701188e4a014f15c3dec3e6', 'application/xml', 'application/xml; charset=us-ascii', 'XML document text', 'c0c0afbd733b953ceb2bc62a9c7ae284.xml', 'OblongBoxehdAnalytic2.xml', '2012-08-19 17:22:03', '2012-08-19 16:22:02', 1),
(4, 2, NULL, 37022, 0, 'e1d4d4fd4f7282e5898a8836012e3fc3', 'application/xml', 'application/xml; charset=us-ascii', 'XML  document text', '96b2bc58a9291e87845ba1c98132ed81.xml', 'oblong.xml', '2012-08-19 17:22:03', '2012-08-06 22:52:36', 1),
(6, 3, NULL, 55232, 0, 'f81d4d8eabb1853487bbe0b0b52db0ee', 'application/xml', 'application/xml; charset=us-ascii', 'XML document text', 'bad7097dac0288283196123f7ad442b9.xml', 'mummy.xml', '2012-08-19 18:10:05', '2012-08-19 17:10:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_type_id`, `collection_id`, `featured`, `public`, `modified`, `added`) VALUES
(3, 14, NULL, 0, 0, '2012-08-19 17:10:04', '2012-08-19 17:10:04'),
(2, 14, NULL, 0, 0, '2012-08-19 17:22:03', '2012-08-06 22:43:16'),
(4, 12, NULL, 0, 0, '2012-08-20 02:39:02', '2012-08-20 02:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE IF NOT EXISTS `item_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`id`, `name`, `description`) VALUES
(1, 'Document', 'A resource containing textual data.  Note that facsimiles or images of texts are still of the genre text.'),
(3, 'Moving Image', 'A series of visual representations that, when shown in succession, impart an impression of motion.'),
(4, 'Oral History', 'A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),
(5, 'Sound', 'A resource whose content is primarily intended to be rendered as audio.'),
(6, 'Still Image', 'A static visual representation. Examples of still images are: paintings, drawings, graphic designs, plans and maps.  Recommended best practice is to assign the type "text" to images of textual materials.'),
(7, 'Website', 'A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),
(8, 'Event', 'A non-persistent, time-based occurrence.  Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),
(9, 'Email', 'A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),
(10, 'Lesson Plan', 'Instructional materials.'),
(11, 'Hyperlink', 'Title, URL, Description or annotation.'),
(12, 'Person', 'An individual, biographical data, birth and death, etc.'),
(13, 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),
(14, 'TEI Document', 'TEIDisplay is a plugin created by the Scholars'' Lab at the University of Virginia Library. This plugin will render an uploaded TEI file attached to an item in the display. The default XSLT stylesheet allows for two display types: entire and segmental. The entire display type will render out the entire document in HTML while the segmental display type includes a table of contents for displaying a selected div1 or div2, which is a useful feature for larger documents. The display type and XSLT stylesheet can be customized for each TEI File in the database through the TEI Config tab in the administrative interface. Additionally, metadata from the TEI Header is automatically mapped to Dublin Core fields for both the item and file.');

-- --------------------------------------------------------

--
-- Table structure for table `item_types_elements`
--

CREATE TABLE IF NOT EXISTS `item_types_elements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
  KEY `item_type_id` (`item_type_id`),
  KEY `element_id` (`element_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `item_types_elements`
--

INSERT INTO `item_types_elements` (`id`, `item_type_id`, `element_id`, `order`) VALUES
(1, 1, 7, NULL),
(2, 1, 1, NULL),
(3, 6, 7, NULL),
(6, 6, 10, NULL),
(7, 3, 7, NULL),
(8, 3, 11, NULL),
(9, 3, 12, NULL),
(10, 3, 13, NULL),
(11, 3, 14, NULL),
(12, 3, 5, NULL),
(13, 5, 7, NULL),
(14, 5, 11, NULL),
(15, 5, 15, NULL),
(16, 5, 5, NULL),
(17, 4, 7, NULL),
(18, 4, 11, NULL),
(19, 4, 15, NULL),
(20, 4, 5, NULL),
(21, 4, 2, NULL),
(22, 4, 3, NULL),
(23, 4, 4, NULL),
(24, 4, 16, NULL),
(25, 9, 17, NULL),
(26, 9, 18, NULL),
(27, 9, 20, NULL),
(28, 9, 19, NULL),
(29, 9, 21, NULL),
(30, 9, 22, NULL),
(31, 9, 23, NULL),
(32, 10, 24, NULL),
(33, 10, 25, NULL),
(34, 10, 26, NULL),
(35, 10, 11, NULL),
(36, 10, 27, NULL),
(37, 7, 6, NULL),
(38, 11, 28, NULL),
(39, 8, 29, NULL),
(40, 8, 30, NULL),
(41, 8, 11, NULL),
(42, 12, 31, NULL),
(43, 12, 32, NULL),
(44, 12, 33, NULL),
(45, 12, 34, NULL),
(46, 12, 35, NULL),
(47, 12, 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mime_element_set_lookup`
--

CREATE TABLE IF NOT EXISTS `mime_element_set_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `element_set_id` int(10) unsigned NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mime` (`mime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `mime_element_set_lookup`
--

INSERT INTO `mime_element_set_lookup` (`id`, `element_set_id`, `mime`) VALUES
(1, 5, 'image/bmp'),
(2, 5, 'image/gif'),
(3, 5, 'image/ief'),
(4, 5, 'image/jpeg'),
(5, 5, 'image/pict'),
(6, 5, 'image/pjpeg'),
(7, 5, 'image/png'),
(8, 5, 'image/tiff'),
(9, 5, 'image/vnd.rn-realflash'),
(10, 5, 'image/vnd.rn-realpix'),
(11, 5, 'image/vnd.wap.wbmp'),
(12, 5, 'image/x-icon'),
(13, 5, 'image/x-jg'),
(14, 5, 'image/x-jps'),
(15, 5, 'image/x-niff'),
(16, 5, 'image/x-pcx'),
(17, 5, 'image/x-pict'),
(18, 5, 'image/x-quicktime'),
(19, 5, 'image/x-rgb'),
(20, 5, 'image/x-tiff'),
(21, 5, 'image/x-windows-bmp'),
(22, 5, 'image/x-xbitmap'),
(23, 5, 'image/x-xbm'),
(24, 5, 'image/x-xpixmap'),
(25, 5, 'image/x-xwd'),
(26, 5, 'image/x-xwindowdump'),
(27, 6, 'video/x-msvideo'),
(28, 6, 'video/avi'),
(29, 6, 'video/msvideo'),
(30, 6, 'video/x-mpeg'),
(31, 6, 'video/x-ms-asf'),
(32, 6, 'video/mpeg'),
(33, 6, 'video/quicktime'),
(34, 6, 'video/x-ms-wmv');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'omeka_version', '1.5.2'),
(2, 'administrator_email', 'jpeak5@lsu.edu'),
(3, 'copyright', ''),
(4, 'site_title', 'apc'),
(5, 'author', ''),
(6, 'description', 'dev for cct-apc'),
(7, 'thumbnail_constraint', '200'),
(8, 'square_thumbnail_constraint', '200'),
(9, 'fullsize_constraint', '800'),
(10, 'per_page_admin', '10'),
(11, 'per_page_public', '10'),
(12, 'show_empty_elements', '0'),
(13, 'path_to_convert', ''),
(14, 'admin_theme', 'default'),
(15, 'public_theme', 'default'),
(28, 'file_extension_whitelist', 'aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg, pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt, wav,wax,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xml,xlw,zip'),
(29, 'file_mime_type_whitelist', 'application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/x-ms-wmv,video/x-msvideo,text/xml,application/xml'),
(27, 'disable_default_file_validation', '0'),
(19, 'display_system_info', '1'),
(20, 'tag_delimiter', ','),
(44, 'omeka_update', 'a:2:{s:14:"latest_version";s:5:"1.5.3";s:12:"last_updated";i:1345589018;}'),
(39, 'tei_display_type', NULL),
(30, 'recaptcha_public_key', ''),
(31, 'recaptcha_private_key', ''),
(40, 'tei_default_stylesheet', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `version` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `active_idx` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `active`, `version`) VALUES
(23, 'TeiDisplay', 1, '1.0'),
(39, 'TeiInteract', 1, '0.1'),
(40, 'CsvImport', 1, '1.3.4');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE IF NOT EXISTS `processes` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_types`
--

CREATE TABLE IF NOT EXISTS `record_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `record_types`
--

INSERT INTO `record_types` (`id`, `name`, `description`) VALUES
(1, 'All', 'Elements, element sets, and element texts assigned to this record type relate to all possible records.'),
(2, 'Item', 'Elements, element sets, and element texts assigned to this record type relate to item records.'),
(3, 'File', 'Elements, element sets, and element texts assigned to this record type relate to file records.');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20100401000000'),
('20100810120000'),
('20110113000000'),
('20110124000001'),
('20110301103900'),
('20110328192100'),
('20110426181300'),
('20110601112200'),
('20110627223000'),
('20110824110000'),
('20120112100000');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` bigint(20) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `modified`, `lifetime`, `data`) VALUES
('0b6e33edmba40d6ufdffhp89o1', 1344383728, 1209600, ''),
('0milmo9g6djpibkvvae1tdqh67', 1344383935, 1209600, ''),
('0o5jmsvghjq0fl2qiaklis9di2', 1344293208, 1209600, ''),
('1ldhiob5jlkhsj9vop5fnv4ra0', 1344384531, 1209600, ''),
('1tqf6smc0m5dnodelaajehbs31', 1344086292, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}flash|a:1:{s:6:"status";N;}'),
('2bgm5qaqsfge4c9kbnf0qk6qs2', 1344384506, 1209600, ''),
('2tdc1mt2boqak0o2c4tilus0g1', 1345411487, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}flash|a:1:{s:6:"status";N;}'),
('3muk8mp0pa1f5vonglo3g78h56', 1344383932, 1209600, ''),
('8344t74jn0hc030utefmkm4k01', 1344383935, 1209600, ''),
('a1dhbqm4ts4k1oa6vh90hjsbc0', 1344384552, 1209600, ''),
('a6c3ogt66boa51g2uk2oupnss1', 1344384542, 1209600, ''),
('c7gol23ekq3cpb7v1tlsfq3g21', 1344384542, 1209600, ''),
('c7mqfhfitiavt36r3q8hllcf72', 1344294116, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}Zend_Auth|a:1:{s:7:"storage";i:1;}'),
('cl39f1vhg3f79scbkk24rg4fc6', 1344383729, 1209600, ''),
('df4u3hdioij592nqt42ojv7l72', 1344384547, 1209600, ''),
('dgenudbdpog7e17d3nghg0sbh5', 1343780269, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}flash|a:1:{s:6:"status";N;}Zend_Auth|a:1:{s:7:"storage";i:1;}'),
('dkh0848q0kbpkeknmuj6krqha7', 1344383729, 1209600, ''),
('e1f2rc5p2j40ukq8tu98t2vo53', 1345592755, 1209600, 'Default|a:1:{s:8:"redirect";s:26:"/tei-interact/files/browse";}Zend_Auth|a:1:{s:7:"storage";i:1;}flash|a:1:{s:6:"status";N;}'),
('e56mbcc1oit14uq8tdh0k1jfo1', 1344383931, 1209600, ''),
('hhe71m4864rfq15lue7u7v0rf3', 1344384506, 1209600, ''),
('i0ojrrc1d3fh1o60a73cq6rhv1', 1344384542, 1209600, ''),
('oim5pqa53ddjrnrlg9o4jsdch0', 1345078045, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}flash|a:1:{s:6:"status";N;}Zend_Auth|a:1:{s:7:"storage";i:1;}'),
('qt21q0harn24rau3761csggqg2', 1344383934, 1209600, ''),
('rf2p2c7vmde6npk96r73nkcq23', 1344474483, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}flash|a:1:{s:6:"status";N;}Zend_Auth|a:1:{s:7:"storage";i:1;}'),
('toj3ri38da58knklco26q583e5', 1344384139, 1209600, 'Default|a:1:{s:8:"redirect";s:1:"/";}flash|a:1:{s:6:"status";N;}Zend_Auth|a:1:{s:7:"storage";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `taggings`
--

CREATE TABLE IF NOT EXISTS `taggings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`relation_id`,`tag_id`,`entity_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `taggings`
--

INSERT INTO `taggings` (`id`, `relation_id`, `tag_id`, `entity_id`, `type`, `time`) VALUES
(1, 4, 1, 1, 'Item', '2012-08-20 02:43:37'),
(2, 4, 2, 1, 'Item', '2012-08-20 02:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'test'),
(2, 'item-types');

-- --------------------------------------------------------

--
-- Table structure for table `tei_display_configs`
--

CREATE TABLE IF NOT EXISTS `tei_display_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned DEFAULT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `is_fedora_datastream` tinyint(1) unsigned NOT NULL,
  `fedoraconnector_id` int(10) unsigned DEFAULT NULL,
  `tei_id` tinytext COLLATE utf8_unicode_ci,
  `stylesheet` tinytext COLLATE utf8_unicode_ci,
  `display_type` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tei_display_configs`
--

INSERT INTO `tei_display_configs` (`id`, `item_id`, `file_id`, `is_fedora_datastream`, `fedoraconnector_id`, `tei_id`, `stylesheet`, `display_type`) VALUES
(1, 2, 4, 0, NULL, 'The Oblong Box', 'default.xsl', 'entire'),
(2, 3, 6, 0, NULL, 'some-words-with-a-mummy-ehd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tei_interact_cleanup`
--

CREATE TABLE IF NOT EXISTS `tei_interact_cleanup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `omeka_table_name` varchar(80) NOT NULL,
  `omeka_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tei_interact_configs`
--

CREATE TABLE IF NOT EXISTS `tei_interact_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `create_item` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_tag` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tei_interact_configs`
--

INSERT INTO `tei_interact_configs` (`id`, `tag_name`, `create_item`, `create_tag`) VALUES
(1, 'name', 'type,value', 'ana,key,type,value'),
(2, 'geogName', 'type,value', 'ana,key,type,value'),
(5, 'persName', 'value', 'value'),
(3, 'interp', 'ana,type,value', 'type,value'),
(7, 'orgName', 'ana,key,type,value', 'type,value');

-- --------------------------------------------------------

--
-- Table structure for table `tei_interact_names`
--

CREATE TABLE IF NOT EXISTS `tei_interact_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teiHeader` tinyint(1) NOT NULL COMMENT 'whether or not this name appears in the header or in the main text...1 for header, 0 for text',
  `occurrenceCount` int(5) NOT NULL COMMENT 'how many times does this name occur in the file',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=166 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `active`, `role`, `entity_id`) VALUES
(1, 'admin', '37ab11b9fad1b8a72a5f34dca0af87f3208125b6', '9a6d325daaf3f03d', 1, 'super', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_activations`
--

CREATE TABLE IF NOT EXISTS `users_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
