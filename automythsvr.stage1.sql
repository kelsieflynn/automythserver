-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: automythsvr-g36fe0ce    Database: mythconverg
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

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
-- Table structure for table `bdbookmark`
--

DROP TABLE IF EXISTS `bdbookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdbookmark` (
  `serialid` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(128) DEFAULT NULL,
  `bdstate` varchar(4096) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`serialid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdbookmark`
--

LOCK TABLES `bdbookmark` WRITE;
/*!40000 ALTER TABLE `bdbookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdbookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturecard`
--

DROP TABLE IF EXISTS `capturecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capturecard` (
  `cardid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `videodevice` varchar(128) DEFAULT NULL,
  `audiodevice` varchar(128) DEFAULT NULL,
  `vbidevice` varchar(128) DEFAULT NULL,
  `cardtype` varchar(32) DEFAULT 'V4L',
  `defaultinput` varchar(32) DEFAULT 'Television',
  `audioratelimit` int(11) DEFAULT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `dvb_swfilter` int(11) DEFAULT '0',
  `dvb_sat_type` int(11) NOT NULL DEFAULT '0',
  `dvb_wait_for_seqstart` int(11) NOT NULL DEFAULT '1',
  `skipbtaudio` tinyint(1) DEFAULT '0',
  `dvb_on_demand` tinyint(4) NOT NULL DEFAULT '0',
  `dvb_diseqc_type` smallint(6) DEFAULT NULL,
  `firewire_speed` int(10) unsigned NOT NULL DEFAULT '0',
  `firewire_model` varchar(32) DEFAULT NULL,
  `firewire_connection` int(10) unsigned NOT NULL DEFAULT '0',
  `signal_timeout` int(11) NOT NULL DEFAULT '1000',
  `channel_timeout` int(11) NOT NULL DEFAULT '3000',
  `dvb_tuning_delay` int(10) unsigned NOT NULL DEFAULT '0',
  `contrast` int(11) NOT NULL DEFAULT '0',
  `brightness` int(11) NOT NULL DEFAULT '0',
  `colour` int(11) NOT NULL DEFAULT '0',
  `hue` int(11) NOT NULL DEFAULT '0',
  `diseqcid` int(10) unsigned DEFAULT NULL,
  `dvb_eitscan` tinyint(1) NOT NULL DEFAULT '1',
  `inputname` varchar(32) NOT NULL DEFAULT 'None',
  `sourceid` int(10) unsigned NOT NULL DEFAULT '0',
  `externalcommand` varchar(128) DEFAULT NULL,
  `changer_device` varchar(128) DEFAULT NULL,
  `changer_model` varchar(128) DEFAULT NULL,
  `tunechan` varchar(10) DEFAULT NULL,
  `startchan` varchar(10) DEFAULT NULL,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  `dishnet_eit` tinyint(1) NOT NULL DEFAULT '0',
  `recpriority` int(11) NOT NULL DEFAULT '0',
  `quicktune` tinyint(4) NOT NULL DEFAULT '0',
  `schedorder` int(10) unsigned NOT NULL DEFAULT '1',
  `livetvorder` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cardid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturecard`
--

LOCK TABLES `capturecard` WRITE;
/*!40000 ALTER TABLE `capturecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `capturecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardinput`
--

DROP TABLE IF EXISTS `cardinput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardinput` (
  `cardinputid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardid` int(10) unsigned NOT NULL DEFAULT '0',
  `sourceid` int(10) unsigned NOT NULL DEFAULT '0',
  `inputname` varchar(32) NOT NULL DEFAULT '',
  `externalcommand` varchar(128) DEFAULT NULL,
  `changer_device` varchar(128) DEFAULT NULL,
  `changer_model` varchar(128) DEFAULT NULL,
  `tunechan` varchar(10) DEFAULT NULL,
  `startchan` varchar(10) DEFAULT NULL,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  `dishnet_eit` tinyint(1) NOT NULL DEFAULT '0',
  `recpriority` int(11) NOT NULL DEFAULT '0',
  `quicktune` tinyint(4) NOT NULL DEFAULT '0',
  `schedorder` int(10) unsigned NOT NULL DEFAULT '0',
  `livetvorder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cardinputid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardinput`
--

LOCK TABLES `cardinput` WRITE;
/*!40000 ALTER TABLE `cardinput` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardinput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `channum` varchar(10) NOT NULL DEFAULT '',
  `freqid` varchar(10) DEFAULT NULL,
  `sourceid` int(10) unsigned DEFAULT NULL,
  `callsign` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `finetune` int(11) DEFAULT NULL,
  `videofilters` varchar(255) NOT NULL DEFAULT '',
  `xmltvid` varchar(255) NOT NULL DEFAULT '',
  `recpriority` int(10) NOT NULL DEFAULT '0',
  `contrast` int(11) DEFAULT '32768',
  `brightness` int(11) DEFAULT '32768',
  `colour` int(11) DEFAULT '32768',
  `hue` int(11) DEFAULT '32768',
  `tvformat` varchar(10) NOT NULL DEFAULT 'Default',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `outputfilters` varchar(255) NOT NULL DEFAULT '',
  `useonairguide` tinyint(1) DEFAULT '0',
  `mplexid` smallint(6) DEFAULT NULL,
  `serviceid` mediumint(8) unsigned DEFAULT NULL,
  `tmoffset` int(11) NOT NULL DEFAULT '0',
  `atsc_major_chan` int(10) unsigned NOT NULL DEFAULT '0',
  `atsc_minor_chan` int(10) unsigned NOT NULL DEFAULT '0',
  `last_record` datetime NOT NULL,
  `default_authority` varchar(32) NOT NULL DEFAULT '',
  `commmethod` int(11) NOT NULL DEFAULT '-1',
  `iptvid` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`chanid`),
  KEY `channel_src` (`channum`,`sourceid`),
  KEY `sourceid` (`sourceid`,`xmltvid`,`chanid`),
  KEY `visible` (`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelgroup`
--

DROP TABLE IF EXISTS `channelgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chanid` int(11) unsigned NOT NULL DEFAULT '0',
  `grpid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelgroup`
--

LOCK TABLES `channelgroup` WRITE;
/*!40000 ALTER TABLE `channelgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelgroupnames`
--

DROP TABLE IF EXISTS `channelgroupnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelgroupnames` (
  `grpid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`grpid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelgroupnames`
--

LOCK TABLES `channelgroupnames` WRITE;
/*!40000 ALTER TABLE `channelgroupnames` DISABLE KEYS */;
INSERT INTO `channelgroupnames` VALUES (1,'Favorites');
/*!40000 ALTER TABLE `channelgroupnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelscan`
--

DROP TABLE IF EXISTS `channelscan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelscan` (
  `scanid` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `cardid` int(3) unsigned NOT NULL,
  `sourceid` int(3) unsigned NOT NULL,
  `processed` tinyint(1) unsigned NOT NULL,
  `scandate` datetime NOT NULL,
  PRIMARY KEY (`scanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelscan`
--

LOCK TABLES `channelscan` WRITE;
/*!40000 ALTER TABLE `channelscan` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelscan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelscan_channel`
--

DROP TABLE IF EXISTS `channelscan_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelscan_channel` (
  `transportid` int(6) unsigned NOT NULL,
  `scanid` int(3) unsigned NOT NULL,
  `mplex_id` smallint(6) NOT NULL,
  `source_id` int(3) unsigned NOT NULL,
  `channel_id` int(3) unsigned NOT NULL DEFAULT '0',
  `callsign` varchar(20) NOT NULL DEFAULT '',
  `service_name` varchar(64) NOT NULL DEFAULT '',
  `chan_num` varchar(10) NOT NULL DEFAULT '',
  `service_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `atsc_major_channel` int(4) unsigned NOT NULL DEFAULT '0',
  `atsc_minor_channel` int(4) unsigned NOT NULL DEFAULT '0',
  `use_on_air_guide` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `hidden_in_guide` tinyint(1) NOT NULL DEFAULT '0',
  `freqid` varchar(10) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `tvformat` varchar(10) NOT NULL DEFAULT 'Default',
  `xmltvid` varchar(64) NOT NULL DEFAULT '',
  `pat_tsid` int(5) unsigned NOT NULL DEFAULT '0',
  `vct_tsid` int(5) unsigned NOT NULL DEFAULT '0',
  `vct_chan_tsid` int(5) unsigned NOT NULL DEFAULT '0',
  `sdt_tsid` int(5) unsigned NOT NULL DEFAULT '0',
  `orig_netid` int(5) unsigned NOT NULL DEFAULT '0',
  `netid` int(5) unsigned NOT NULL DEFAULT '0',
  `si_standard` varchar(10) NOT NULL,
  `in_channels_conf` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_pat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_pmt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_vct` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_nit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_sdt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_encrypted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_data_service` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_audio_service` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_opencable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `could_be_opencable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decryption_status` smallint(2) unsigned NOT NULL DEFAULT '0',
  `default_authority` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelscan_channel`
--

LOCK TABLES `channelscan_channel` WRITE;
/*!40000 ALTER TABLE `channelscan_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelscan_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelscan_dtv_multiplex`
--

DROP TABLE IF EXISTS `channelscan_dtv_multiplex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelscan_dtv_multiplex` (
  `transportid` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `scanid` int(3) unsigned NOT NULL,
  `mplexid` smallint(6) unsigned NOT NULL,
  `frequency` bigint(12) unsigned NOT NULL,
  `inversion` char(1) NOT NULL DEFAULT 'a',
  `symbolrate` bigint(12) unsigned NOT NULL DEFAULT '0',
  `fec` varchar(10) NOT NULL DEFAULT 'auto',
  `polarity` char(1) NOT NULL DEFAULT '',
  `hp_code_rate` varchar(10) NOT NULL DEFAULT 'auto',
  `mod_sys` varchar(10) DEFAULT NULL,
  `rolloff` varchar(4) DEFAULT NULL,
  `lp_code_rate` varchar(10) NOT NULL DEFAULT 'auto',
  `modulation` varchar(10) NOT NULL DEFAULT 'auto',
  `transmission_mode` char(1) NOT NULL DEFAULT 'a',
  `guard_interval` varchar(10) NOT NULL DEFAULT 'auto',
  `hierarchy` varchar(10) NOT NULL DEFAULT 'auto',
  `bandwidth` char(1) NOT NULL DEFAULT 'a',
  `sistandard` varchar(10) NOT NULL,
  `tuner_type` smallint(2) unsigned NOT NULL,
  `default_authority` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`transportid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelscan_dtv_multiplex`
--

LOCK TABLES `channelscan_dtv_multiplex` WRITE;
/*!40000 ALTER TABLE `channelscan_dtv_multiplex` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelscan_dtv_multiplex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codecparams`
--

DROP TABLE IF EXISTS `codecparams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codecparams` (
  `profile` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`profile`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codecparams`
--

LOCK TABLES `codecparams` WRITE;
/*!40000 ALTER TABLE `codecparams` DISABLE KEYS */;
/*!40000 ALTER TABLE `codecparams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `person` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role` set('actor','director','producer','executive_producer','writer','guest_star','host','adapter','presenter','commentator','guest') NOT NULL DEFAULT '',
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`person`,`role`),
  KEY `person` (`person`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customexample`
--

DROP TABLE IF EXISTS `customexample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customexample` (
  `rulename` varchar(64) NOT NULL,
  `fromclause` varchar(10000) NOT NULL DEFAULT '',
  `whereclause` varchar(10000) NOT NULL DEFAULT '',
  `search` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rulename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customexample`
--

LOCK TABLES `customexample` WRITE;
/*!40000 ALTER TABLE `customexample` DISABLE KEYS */;
INSERT INTO `customexample` VALUES ('New Flix','','program.category_type = \'movie\' AND program.airdate >= \n     YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR)) \nAND program.stars > 0.5 ',1);
/*!40000 ALTER TABLE `customexample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseqc_config`
--

DROP TABLE IF EXISTS `diseqc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diseqc_config` (
  `cardinputid` int(10) unsigned NOT NULL,
  `diseqcid` int(10) unsigned NOT NULL,
  `value` varchar(16) NOT NULL DEFAULT '',
  KEY `id` (`cardinputid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseqc_config`
--

LOCK TABLES `diseqc_config` WRITE;
/*!40000 ALTER TABLE `diseqc_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseqc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseqc_tree`
--

DROP TABLE IF EXISTS `diseqc_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diseqc_tree` (
  `diseqcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `ordinal` tinyint(3) unsigned NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `subtype` varchar(16) NOT NULL DEFAULT '',
  `description` varchar(32) NOT NULL DEFAULT '',
  `switch_ports` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rotor_hi_speed` float NOT NULL DEFAULT '0',
  `rotor_lo_speed` float NOT NULL DEFAULT '0',
  `rotor_positions` varchar(255) NOT NULL DEFAULT '',
  `lnb_lof_switch` int(10) NOT NULL DEFAULT '0',
  `lnb_lof_hi` int(10) NOT NULL DEFAULT '0',
  `lnb_lof_lo` int(10) NOT NULL DEFAULT '0',
  `cmd_repeat` int(11) NOT NULL DEFAULT '1',
  `lnb_pol_inv` tinyint(4) NOT NULL DEFAULT '0',
  `address` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `scr_userband` int(10) unsigned NOT NULL DEFAULT '0',
  `scr_frequency` int(10) unsigned NOT NULL DEFAULT '1400',
  `scr_pin` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`diseqcid`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseqc_tree`
--

LOCK TABLES `diseqc_tree` WRITE;
/*!40000 ALTER TABLE `diseqc_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseqc_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `displayprofilegroups`
--

DROP TABLE IF EXISTS `displayprofilegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `displayprofilegroups` (
  `name` varchar(128) NOT NULL,
  `hostname` varchar(64) NOT NULL,
  `profilegroupid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`name`,`hostname`),
  UNIQUE KEY `profilegroupid` (`profilegroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `displayprofilegroups`
--

LOCK TABLES `displayprofilegroups` WRITE;
/*!40000 ALTER TABLE `displayprofilegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `displayprofilegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `displayprofiles`
--

DROP TABLE IF EXISTS `displayprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `displayprofiles` (
  `profilegroupid` int(10) unsigned NOT NULL,
  `profileid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  KEY `profilegroupid` (`profilegroupid`),
  KEY `profileid` (`profileid`,`value`),
  KEY `profileid_2` (`profileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `displayprofiles`
--

LOCK TABLES `displayprofiles` WRITE;
/*!40000 ALTER TABLE `displayprofiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `displayprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtv_multiplex`
--

DROP TABLE IF EXISTS `dtv_multiplex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtv_multiplex` (
  `mplexid` smallint(6) NOT NULL AUTO_INCREMENT,
  `sourceid` smallint(6) DEFAULT NULL,
  `transportid` int(11) DEFAULT NULL,
  `networkid` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `inversion` char(1) DEFAULT 'a',
  `symbolrate` int(11) DEFAULT NULL,
  `fec` varchar(10) DEFAULT 'auto',
  `polarity` char(1) DEFAULT NULL,
  `modulation` varchar(10) DEFAULT 'auto',
  `bandwidth` char(1) DEFAULT 'a',
  `lp_code_rate` varchar(10) DEFAULT 'auto',
  `transmission_mode` char(1) DEFAULT 'a',
  `guard_interval` varchar(10) DEFAULT 'auto',
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `constellation` varchar(10) DEFAULT 'auto',
  `hierarchy` varchar(10) DEFAULT 'auto',
  `hp_code_rate` varchar(10) DEFAULT 'auto',
  `mod_sys` varchar(10) DEFAULT NULL,
  `rolloff` varchar(4) DEFAULT NULL,
  `sistandard` varchar(10) DEFAULT 'dvb',
  `serviceversion` smallint(6) DEFAULT '33',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `default_authority` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`mplexid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtv_multiplex`
--

LOCK TABLES `dtv_multiplex` WRITE;
/*!40000 ALTER TABLE `dtv_multiplex` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtv_multiplex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtv_privatetypes`
--

DROP TABLE IF EXISTS `dtv_privatetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtv_privatetypes` (
  `sitype` varchar(4) NOT NULL DEFAULT '',
  `networkid` int(11) NOT NULL DEFAULT '0',
  `private_type` varchar(20) NOT NULL DEFAULT '',
  `private_value` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtv_privatetypes`
--

LOCK TABLES `dtv_privatetypes` WRITE;
/*!40000 ALTER TABLE `dtv_privatetypes` DISABLE KEYS */;
INSERT INTO `dtv_privatetypes` VALUES ('dvb',9018,'channel_numbers','131'),('dvb',9018,'guide_fixup','2'),('dvb',256,'guide_fixup','1'),('dvb',257,'guide_fixup','1'),('dvb',256,'tv_types','1,150,134,133'),('dvb',257,'tv_types','1,150,134,133'),('dvb',4100,'sdt_mapping','1'),('dvb',4101,'sdt_mapping','1'),('dvb',4102,'sdt_mapping','1'),('dvb',4103,'sdt_mapping','1'),('dvb',4104,'sdt_mapping','1'),('dvb',4105,'sdt_mapping','1'),('dvb',4106,'sdt_mapping','1'),('dvb',4107,'sdt_mapping','1'),('dvb',4097,'sdt_mapping','1'),('dvb',4098,'sdt_mapping','1'),('dvb',4100,'tv_types','1,145,154'),('dvb',4101,'tv_types','1,145,154'),('dvb',4102,'tv_types','1,145,154'),('dvb',4103,'tv_types','1,145,154'),('dvb',4104,'tv_types','1,145,154'),('dvb',4105,'tv_types','1,145,154'),('dvb',4106,'tv_types','1,145,154'),('dvb',4107,'tv_types','1,145,154'),('dvb',4097,'tv_types','1,145,154'),('dvb',4098,'tv_types','1,145,154'),('dvb',4100,'guide_fixup','1'),('dvb',4101,'guide_fixup','1'),('dvb',4102,'guide_fixup','1'),('dvb',4103,'guide_fixup','1'),('dvb',4104,'guide_fixup','1'),('dvb',4105,'guide_fixup','1'),('dvb',4106,'guide_fixup','1'),('dvb',4107,'guide_fixup','1'),('dvb',4096,'guide_fixup','5'),('dvb',4097,'guide_fixup','1'),('dvb',4098,'guide_fixup','1'),('dvb',94,'tv_types','1,128'),('atsc',1793,'guide_fixup','3'),('dvb',40999,'guide_fixup','4'),('dvb',70,'force_guide_present','yes'),('dvb',70,'guide_ranges','80,80,96,96'),('dvb',4112,'channel_numbers','131'),('dvb',4115,'channel_numbers','131'),('dvb',4116,'channel_numbers','131'),('dvb',12802,'channel_numbers','131'),('dvb',12803,'channel_numbers','131'),('dvb',12829,'channel_numbers','131'),('dvb',40999,'parse_subtitle_list','1070,1308,1041,1306,1307,1030,1016,1131,1068,1069'),('dvb',4096,'guide_fixup','5');
/*!40000 ALTER TABLE `dtv_privatetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvdbookmark`
--

DROP TABLE IF EXISTS `dvdbookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvdbookmark` (
  `serialid` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT NULL,
  `title` smallint(6) NOT NULL DEFAULT '0',
  `audionum` tinyint(4) NOT NULL DEFAULT '-1',
  `subtitlenum` tinyint(4) NOT NULL DEFAULT '-1',
  `framenum` bigint(20) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dvdstate` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`serialid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvdbookmark`
--

LOCK TABLES `dvdbookmark` WRITE;
/*!40000 ALTER TABLE `dvdbookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvdbookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvdinput`
--

DROP TABLE IF EXISTS `dvdinput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvdinput` (
  `intid` int(10) unsigned NOT NULL,
  `hsize` int(10) unsigned DEFAULT NULL,
  `vsize` int(10) unsigned DEFAULT NULL,
  `ar_num` int(10) unsigned DEFAULT NULL,
  `ar_denom` int(10) unsigned DEFAULT NULL,
  `fr_code` int(10) unsigned DEFAULT NULL,
  `letterbox` tinyint(1) DEFAULT NULL,
  `v_format` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvdinput`
--

LOCK TABLES `dvdinput` WRITE;
/*!40000 ALTER TABLE `dvdinput` DISABLE KEYS */;
INSERT INTO `dvdinput` VALUES (1,720,480,16,9,1,1,'ntsc'),(2,720,480,16,9,1,0,'ntsc'),(3,720,480,4,3,1,1,'ntsc'),(4,720,480,4,3,1,0,'ntsc'),(5,720,576,16,9,3,1,'pal'),(6,720,576,16,9,3,0,'pal'),(7,720,576,4,3,3,1,'pal'),(8,720,576,4,3,3,0,'pal');
/*!40000 ALTER TABLE `dvdinput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvdtranscode`
--

DROP TABLE IF EXISTS `dvdtranscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvdtranscode` (
  `intid` int(11) NOT NULL AUTO_INCREMENT,
  `input` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `sync_mode` int(10) unsigned DEFAULT NULL,
  `use_yv12` tinyint(1) DEFAULT NULL,
  `cliptop` int(11) DEFAULT NULL,
  `clipbottom` int(11) DEFAULT NULL,
  `clipleft` int(11) DEFAULT NULL,
  `clipright` int(11) DEFAULT NULL,
  `f_resize_h` int(11) DEFAULT NULL,
  `f_resize_w` int(11) DEFAULT NULL,
  `hq_resize_h` int(11) DEFAULT NULL,
  `hq_resize_w` int(11) DEFAULT NULL,
  `grow_h` int(11) DEFAULT NULL,
  `grow_w` int(11) DEFAULT NULL,
  `clip2top` int(11) DEFAULT NULL,
  `clip2bottom` int(11) DEFAULT NULL,
  `clip2left` int(11) DEFAULT NULL,
  `clip2right` int(11) DEFAULT NULL,
  `codec` varchar(128) NOT NULL,
  `codec_param` varchar(128) DEFAULT NULL,
  `bitrate` int(11) DEFAULT NULL,
  `a_sample_r` int(11) DEFAULT NULL,
  `a_bitrate` int(11) DEFAULT NULL,
  `two_pass` tinyint(1) DEFAULT NULL,
  `tc_param` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvdtranscode`
--

LOCK TABLES `dvdtranscode` WRITE;
/*!40000 ALTER TABLE `dvdtranscode` DISABLE KEYS */;
INSERT INTO `dvdtranscode` VALUES (1,1,'Good',2,1,16,16,0,0,2,0,0,0,0,0,32,32,8,8,'divx5',NULL,1618,NULL,NULL,0,NULL),(2,2,'Excellent',2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'divx5',NULL,0,NULL,NULL,1,NULL),(3,2,'Good',2,1,0,0,8,8,0,0,0,0,0,0,0,0,0,0,'divx5',NULL,1618,NULL,NULL,0,NULL),(4,2,'Medium',2,1,0,0,8,8,5,5,0,0,0,0,0,0,0,0,'divx5',NULL,1200,NULL,NULL,0,NULL),(5,3,'Good',2,1,0,0,0,0,0,0,0,0,2,0,80,80,8,8,'divx5',NULL,0,NULL,NULL,0,NULL),(6,4,'Excellent',2,1,0,0,0,0,0,0,0,0,2,0,0,0,0,0,'divx5',NULL,0,NULL,NULL,1,NULL),(7,4,'Good',2,1,0,0,8,8,0,2,0,0,0,0,0,0,0,0,'divx5',NULL,1618,NULL,NULL,0,NULL),(8,5,'Good',1,1,16,16,0,0,5,0,0,0,0,0,40,40,8,8,'divx5',NULL,1618,NULL,NULL,0,NULL),(9,6,'Good',1,1,0,0,16,16,5,0,0,0,0,0,0,0,0,0,'divx5',NULL,1618,NULL,NULL,0,NULL),(10,7,'Good',1,1,0,0,0,0,1,0,0,0,0,0,76,76,8,8,'divx5',NULL,1618,NULL,NULL,0,NULL),(11,8,'Good',1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,'divx5',NULL,1618,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `dvdtranscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eit_cache`
--

DROP TABLE IF EXISTS `eit_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eit_cache` (
  `chanid` int(10) NOT NULL,
  `eventid` int(10) unsigned NOT NULL DEFAULT '0',
  `tableid` tinyint(3) unsigned NOT NULL,
  `version` tinyint(3) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chanid`,`eventid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eit_cache`
--

LOCK TABLES `eit_cache` WRITE;
/*!40000 ALTER TABLE `eit_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `eit_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filemarkup`
--

DROP TABLE IF EXISTS `filemarkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filemarkup` (
  `filename` text NOT NULL,
  `mark` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `offset` bigint(20) unsigned DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  KEY `filename` (`filename`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filemarkup`
--

LOCK TABLES `filemarkup` WRITE;
/*!40000 ALTER TABLE `filemarkup` DISABLE KEYS */;
/*!40000 ALTER TABLE `filemarkup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_directories`
--

DROP TABLE IF EXISTS `gallery_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_directories` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `dir_count` int(11) NOT NULL DEFAULT '0',
  `file_count` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dir_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_directories`
--

LOCK TABLES `gallery_directories` WRITE;
/*!40000 ALTER TABLE `gallery_directories` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_files`
--

DROP TABLE IF EXISTS `gallery_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `dir_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `modtime` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `extension` varchar(255) NOT NULL,
  `angle` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `zoom` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `orientation` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_files`
--

LOCK TABLES `gallery_files` WRITE;
/*!40000 ALTER TABLE `gallery_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeping`
--

DROP TABLE IF EXISTS `housekeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeping` (
  `tag` varchar(64) NOT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `lastrun` datetime DEFAULT NULL,
  `lastsuccess` datetime DEFAULT NULL,
  UNIQUE KEY `task` (`tag`,`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeping`
--

LOCK TABLES `housekeeping` WRITE;
/*!40000 ALTER TABLE `housekeeping` DISABLE KEYS */;
INSERT INTO `housekeeping` VALUES ('BackupDB',NULL,'2017-11-04 02:12:10','2017-11-04 02:12:10');
/*!40000 ALTER TABLE `housekeeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inputgroup`
--

DROP TABLE IF EXISTS `inputgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inputgroup` (
  `cardinputid` int(10) unsigned NOT NULL,
  `inputgroupid` int(10) unsigned NOT NULL,
  `inputgroupname` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inputgroup`
--

LOCK TABLES `inputgroup` WRITE;
/*!40000 ALTER TABLE `inputgroup` DISABLE KEYS */;
INSERT INTO `inputgroup` VALUES (1,1,''),(2,2,''),(3,3,''),(4,4,''),(5,5,''),(6,6,''),(7,7,''),(8,8,''),(9,9,''),(10,10,''),(11,11,''),(12,12,''),(13,13,''),(14,14,''),(15,15,''),(16,16,'');
/*!40000 ALTER TABLE `inputgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internetcontent`
--

DROP TABLE IF EXISTS `internetcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internetcontent` (
  `name` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `type` smallint(3) NOT NULL,
  `author` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `commandline` text NOT NULL,
  `version` double NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `search` tinyint(1) NOT NULL,
  `tree` tinyint(1) NOT NULL,
  `podcast` tinyint(1) NOT NULL,
  `download` tinyint(1) NOT NULL,
  `host` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internetcontent`
--

LOCK TABLES `internetcontent` WRITE;
/*!40000 ALTER TABLE `internetcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `internetcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internetcontentarticles`
--

DROP TABLE IF EXISTS `internetcontentarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internetcontentarticles` (
  `feedtitle` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `paththumb` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `season` smallint(5) NOT NULL DEFAULT '0',
  `episode` smallint(5) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `url` text NOT NULL,
  `type` smallint(3) NOT NULL,
  `thumbnail` text NOT NULL,
  `mediaURL` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time` int(11) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `filesize` bigint(20) NOT NULL,
  `player` varchar(255) NOT NULL,
  `playerargs` text NOT NULL,
  `download` varchar(255) NOT NULL,
  `downloadargs` text NOT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `language` varchar(128) NOT NULL,
  `podcast` tinyint(1) NOT NULL,
  `downloadable` tinyint(1) NOT NULL,
  `customhtml` tinyint(1) NOT NULL,
  `countries` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internetcontentarticles`
--

LOCK TABLES `internetcontentarticles` WRITE;
/*!40000 ALTER TABLE `internetcontentarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `internetcontentarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inuseprograms`
--

DROP TABLE IF EXISTS `inuseprograms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inuseprograms` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recusage` varchar(128) NOT NULL DEFAULT '',
  `lastupdatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hostname` varchar(64) NOT NULL DEFAULT '',
  `rechost` varchar(64) NOT NULL,
  `recdir` varchar(255) NOT NULL DEFAULT '',
  KEY `chanid` (`chanid`,`starttime`),
  KEY `recusage` (`recusage`,`lastupdatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inuseprograms`
--

LOCK TABLES `inuseprograms` WRITE;
/*!40000 ALTER TABLE `inuseprograms` DISABLE KEYS */;
/*!40000 ALTER TABLE `inuseprograms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iptv_channel`
--

DROP TABLE IF EXISTS `iptv_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_channel` (
  `iptvid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `chanid` int(10) unsigned NOT NULL,
  `url` text NOT NULL,
  `type` set('data','rfc2733-1','rfc2733-2','rfc5109-1','rfc5109-2','smpte2022-1','smpte2022-2') DEFAULT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iptvid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iptv_channel`
--

LOCK TABLES `iptv_channel` WRITE;
/*!40000 ALTER TABLE `iptv_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `iptv_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobqueue`
--

DROP TABLE IF EXISTS `jobqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chanid` int(10) NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inserttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` int(11) NOT NULL DEFAULT '0',
  `cmds` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `statustime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hostname` varchar(64) NOT NULL DEFAULT '',
  `args` blob NOT NULL,
  `comment` varchar(128) NOT NULL DEFAULT '',
  `schedruntime` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`type`,`inserttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobqueue`
--

LOCK TABLES `jobqueue` WRITE;
/*!40000 ALTER TABLE `jobqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jumppoints`
--

DROP TABLE IF EXISTS `jumppoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jumppoints` (
  `destination` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `keylist` varchar(128) DEFAULT NULL,
  `hostname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`destination`,`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jumppoints`
--

LOCK TABLES `jumppoints` WRITE;
/*!40000 ALTER TABLE `jumppoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `jumppoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keybindings`
--

DROP TABLE IF EXISTS `keybindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keybindings` (
  `context` varchar(32) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `keylist` varchar(128) DEFAULT NULL,
  `hostname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`context`,`action`,`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keybindings`
--

LOCK TABLES `keybindings` WRITE;
/*!40000 ALTER TABLE `keybindings` DISABLE KEYS */;
INSERT INTO `keybindings` VALUES ('Global','UP','Up Arrow','Up','automythsvr-g36fe0ce'),('Global','DOWN','Down Arrow','Down','automythsvr-g36fe0ce'),('Global','LEFT','Left Arrow','Left','automythsvr-g36fe0ce'),('Global','RIGHT','Right Arrow','Right','automythsvr-g36fe0ce'),('Global','NEXT','Move to next widget','Tab','automythsvr-g36fe0ce'),('Global','PREVIOUS','Move to preview widget','Backtab','automythsvr-g36fe0ce'),('Global','SELECT','Select','Return,Enter,Space','automythsvr-g36fe0ce'),('Global','BACKSPACE','Backspace','Backspace','automythsvr-g36fe0ce'),('Global','ESCAPE','Escape','Esc','automythsvr-g36fe0ce'),('Global','MENU','Pop-up menu','M','automythsvr-g36fe0ce'),('Global','INFO','More information','I','automythsvr-g36fe0ce'),('Global','DELETE','Delete','D','automythsvr-g36fe0ce'),('Global','EDIT','Edit','E','automythsvr-g36fe0ce'),('Global','SCREENSHOT','Save screenshot','','automythsvr-g36fe0ce'),('Global','HANDLEMEDIA','Play a media resource','','automythsvr-g36fe0ce'),('Global','PAGEUP','Page Up','PgUp','automythsvr-g36fe0ce'),('Global','PAGEDOWN','Page Down','PgDown','automythsvr-g36fe0ce'),('Global','PAGETOP','Page to top of list','','automythsvr-g36fe0ce'),('Global','PAGEMIDDLE','Page to middle of list','','automythsvr-g36fe0ce'),('Global','PAGEBOTTOM','Page to bottom of list','','automythsvr-g36fe0ce'),('Global','PREVVIEW','Previous View','Home','automythsvr-g36fe0ce'),('Global','NEXTVIEW','Next View','End','automythsvr-g36fe0ce'),('Global','HELP','Help','F1','automythsvr-g36fe0ce'),('Global','EJECT','Eject Removable Media','','automythsvr-g36fe0ce'),('Global','CUT','Cut text from textedit','Ctrl+X','automythsvr-g36fe0ce'),('Global','COPY','Copy text from textedit','Ctrl+C','automythsvr-g36fe0ce'),('Global','PASTE','Paste text into textedit','Ctrl+V','automythsvr-g36fe0ce'),('Global','NEWLINE','Insert newline into textedit','Ctrl+Return','automythsvr-g36fe0ce'),('Global','UNDO','Undo','Ctrl+Z','automythsvr-g36fe0ce'),('Global','REDO','Redo','Ctrl+Y','automythsvr-g36fe0ce'),('Global','SEARCH','Show incremental search dialog','Ctrl+S','automythsvr-g36fe0ce'),('Global','0','0','0','automythsvr-g36fe0ce'),('Global','1','1','1','automythsvr-g36fe0ce'),('Global','2','2','2','automythsvr-g36fe0ce'),('Global','3','3','3','automythsvr-g36fe0ce'),('Global','4','4','4','automythsvr-g36fe0ce'),('Global','5','5','5','automythsvr-g36fe0ce'),('Global','6','6','6','automythsvr-g36fe0ce'),('Global','7','7','7','automythsvr-g36fe0ce'),('Global','8','8','8','automythsvr-g36fe0ce'),('Global','9','9','9','automythsvr-g36fe0ce'),('Global','TVPOWERON','Turn the display on','','automythsvr-g36fe0ce'),('Global','TVPOWEROFF','Turn the display off','','automythsvr-g36fe0ce'),('Global','SYSEVENT01','Trigger System Key Event #1','','automythsvr-g36fe0ce'),('Global','SYSEVENT02','Trigger System Key Event #2','','automythsvr-g36fe0ce'),('Global','SYSEVENT03','Trigger System Key Event #3','','automythsvr-g36fe0ce'),('Global','SYSEVENT04','Trigger System Key Event #4','','automythsvr-g36fe0ce'),('Global','SYSEVENT05','Trigger System Key Event #5','','automythsvr-g36fe0ce'),('Global','SYSEVENT06','Trigger System Key Event #6','','automythsvr-g36fe0ce'),('Global','SYSEVENT07','Trigger System Key Event #7','','automythsvr-g36fe0ce'),('Global','SYSEVENT08','Trigger System Key Event #8','','automythsvr-g36fe0ce'),('Global','SYSEVENT09','Trigger System Key Event #9','','automythsvr-g36fe0ce'),('Global','SYSEVENT10','Trigger System Key Event #10','','automythsvr-g36fe0ce'),('Browser','ZOOMIN','Zoom in on browser window','.,>','automythsvr-g36fe0ce'),('Browser','ZOOMOUT','Zoom out on browser window',',,<','automythsvr-g36fe0ce'),('Browser','TOGGLEINPUT','Toggle where keyboard input goes to','F1','automythsvr-g36fe0ce'),('Browser','MOUSEUP','Move mouse pointer up','2','automythsvr-g36fe0ce'),('Browser','MOUSEDOWN','Move mouse pointer down','8','automythsvr-g36fe0ce'),('Browser','MOUSELEFT','Move mouse pointer left','4','automythsvr-g36fe0ce'),('Browser','MOUSERIGHT','Move mouse pointer right','6','automythsvr-g36fe0ce'),('Browser','MOUSELEFTBUTTON','Mouse Left button click','5','automythsvr-g36fe0ce'),('Browser','PAGEDOWN','Scroll down half a page','9','automythsvr-g36fe0ce'),('Browser','PAGEUP','Scroll up half a page','3','automythsvr-g36fe0ce'),('Browser','PAGELEFT','Scroll left half a page','7','automythsvr-g36fe0ce'),('Browser','PAGERIGHT','Scroll right half a page','1','automythsvr-g36fe0ce'),('Browser','NEXTLINK','Move selection to next link','Z','automythsvr-g36fe0ce'),('Browser','PREVIOUSLINK','Move selection to previous link','Q','automythsvr-g36fe0ce'),('Browser','FOLLOWLINK','Follow selected link','Return,Space,Enter','automythsvr-g36fe0ce'),('Browser','HISTORYBACK','Go back to previous page','R,Backspace','automythsvr-g36fe0ce'),('Browser','HISTORYFORWARD','Go forward to previous page','F','automythsvr-g36fe0ce'),('Main Menu','EXITPROMPT','Display System Exit Prompt','Esc','automythsvr-g36fe0ce'),('Main Menu','EXIT','System Exit','','automythsvr-g36fe0ce'),('Main Menu','STANDBYMODE','Enter Standby Mode','','automythsvr-g36fe0ce');
/*!40000 ALTER TABLE `keybindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `phrase` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `searchtype` int(10) unsigned NOT NULL DEFAULT '3',
  UNIQUE KEY `phrase` (`phrase`,`searchtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livestream`
--

DROP TABLE IF EXISTS `livestream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livestream` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `audiobitrate` int(10) unsigned NOT NULL,
  `samplerate` int(10) unsigned NOT NULL,
  `audioonlybitrate` int(10) unsigned NOT NULL,
  `segmentsize` int(10) unsigned NOT NULL DEFAULT '10',
  `maxsegments` int(10) unsigned NOT NULL DEFAULT '0',
  `startsegment` int(10) unsigned NOT NULL DEFAULT '0',
  `currentsegment` int(10) unsigned NOT NULL DEFAULT '0',
  `segmentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `percentcomplete` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `lastmodified` datetime NOT NULL,
  `relativeurl` varchar(512) NOT NULL,
  `fullurl` varchar(1024) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `statusmessage` varchar(256) NOT NULL,
  `sourcefile` varchar(512) NOT NULL,
  `sourcehost` varchar(64) NOT NULL,
  `sourcewidth` int(10) unsigned NOT NULL DEFAULT '0',
  `sourceheight` int(10) unsigned NOT NULL DEFAULT '0',
  `outdir` varchar(256) NOT NULL,
  `outbase` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livestream`
--

LOCK TABLES `livestream` WRITE;
/*!40000 ALTER TABLE `livestream` DISABLE KEYS */;
/*!40000 ALTER TABLE `livestream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) NOT NULL DEFAULT '',
  `application` varchar(64) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `thread` varchar(64) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `line` int(11) NOT NULL DEFAULT '0',
  `function` varchar(255) NOT NULL DEFAULT '',
  `msgtime` datetime NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `message` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `host` (`host`,`application`,`pid`,`msgtime`),
  KEY `msgtime` (`msgtime`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mythlog`
--

DROP TABLE IF EXISTS `mythlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mythlog` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(32) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `acknowledged` tinyint(1) DEFAULT '0',
  `logdate` datetime DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `details` varchar(16000) NOT NULL DEFAULT '',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mythlog`
--

LOCK TABLES `mythlog` WRITE;
/*!40000 ALTER TABLE `mythlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mythlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldfind`
--

DROP TABLE IF EXISTS `oldfind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldfind` (
  `recordid` int(11) NOT NULL DEFAULT '0',
  `findid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recordid`,`findid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldfind`
--

LOCK TABLES `oldfind` WRITE;
/*!40000 ALTER TABLE `oldfind` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldfind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldprogram`
--

DROP TABLE IF EXISTS `oldprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldprogram` (
  `oldtitle` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `airdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`oldtitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldprogram`
--

LOCK TABLES `oldprogram` WRITE;
/*!40000 ALTER TABLE `oldprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldrecorded`
--

DROP TABLE IF EXISTS `oldrecorded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldrecorded` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(128) NOT NULL DEFAULT '',
  `subtitle` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `season` smallint(5) NOT NULL,
  `episode` smallint(5) NOT NULL,
  `category` varchar(64) NOT NULL DEFAULT '',
  `seriesid` varchar(64) DEFAULT NULL,
  `programid` varchar(64) DEFAULT NULL,
  `inetref` varchar(40) NOT NULL,
  `findid` int(11) NOT NULL DEFAULT '0',
  `recordid` int(11) NOT NULL DEFAULT '0',
  `station` varchar(20) NOT NULL DEFAULT '',
  `rectype` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `recstatus` int(11) NOT NULL DEFAULT '0',
  `reactivate` smallint(6) NOT NULL DEFAULT '0',
  `generic` tinyint(1) NOT NULL,
  `future` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`station`,`starttime`,`title`),
  KEY `endtime` (`endtime`),
  KEY `title` (`title`),
  KEY `seriesid` (`seriesid`),
  KEY `programid` (`programid`),
  KEY `recordid` (`recordid`),
  KEY `recstatus` (`recstatus`,`programid`,`seriesid`),
  KEY `recstatus_2` (`recstatus`,`title`,`subtitle`),
  KEY `future` (`future`),
  KEY `chanid` (`chanid`,`starttime`),
  KEY `subtitle` (`subtitle`),
  KEY `description` (`description`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldrecorded`
--

LOCK TABLES `oldrecorded` WRITE;
/*!40000 ALTER TABLE `oldrecorded` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldrecorded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `person` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`person`),
  UNIQUE KEY `name` (`name`(41))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pidcache`
--

DROP TABLE IF EXISTS `pidcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pidcache` (
  `chanid` smallint(6) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '-1',
  `tableid` int(11) NOT NULL DEFAULT '-1',
  KEY `chanid` (`chanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pidcache`
--

LOCK TABLES `pidcache` WRITE;
/*!40000 ALTER TABLE `pidcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `pidcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playgroup`
--

DROP TABLE IF EXISTS `playgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playgroup` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `titlematch` varchar(255) NOT NULL DEFAULT '',
  `skipahead` int(11) NOT NULL DEFAULT '0',
  `skipback` int(11) NOT NULL DEFAULT '0',
  `timestretch` int(11) NOT NULL DEFAULT '0',
  `jump` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playgroup`
--

LOCK TABLES `playgroup` WRITE;
/*!40000 ALTER TABLE `playgroup` DISABLE KEYS */;
INSERT INTO `playgroup` VALUES ('Default','',30,5,100,0);
/*!40000 ALTER TABLE `playgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerpriority`
--

DROP TABLE IF EXISTS `powerpriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerpriority` (
  `priorityname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `recpriority` int(10) NOT NULL DEFAULT '0',
  `selectclause` varchar(16000) NOT NULL DEFAULT '',
  PRIMARY KEY (`priorityname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerpriority`
--

LOCK TABLES `powerpriority` WRITE;
/*!40000 ALTER TABLE `powerpriority` DISABLE KEYS */;
/*!40000 ALTER TABLE `powerpriority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilegroups`
--

DROP TABLE IF EXISTS `profilegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profilegroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `cardtype` varchar(32) NOT NULL DEFAULT 'V4L',
  `is_default` int(1) DEFAULT '0',
  `hostname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`hostname`),
  KEY `cardtype` (`cardtype`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilegroups`
--

LOCK TABLES `profilegroups` WRITE;
/*!40000 ALTER TABLE `profilegroups` DISABLE KEYS */;
INSERT INTO `profilegroups` VALUES (1,'Software Encoders (v4l based)','V4L',1,NULL),(2,'IVTV MPEG-2 Encoders','MPEG',1,NULL),(3,'Hardware MJPEG Encoders (Matrox G200-TV, Miro DC10, etc)','MJPEG',1,NULL),(4,'Hardware HDTV','HDTV',1,NULL),(5,'Hardware DVB Encoders','DVB',1,NULL),(6,'Transcoders','TRANSCODE',1,NULL),(7,'FireWire Input','FIREWIRE',1,NULL),(8,'USB Mpeg-4 Encoder (Plextor ConvertX, etc)','GO7007',1,NULL),(14,'Import Recorder','IMPORT',1,NULL),(10,'Freebox Input','FREEBOX',1,NULL),(11,'HDHomeRun Recorders','HDHOMERUN',1,NULL),(12,'CRC IP Recorders','CRC_IP',1,NULL),(13,'HD-PVR Recorders','HDPVR',1,NULL),(15,'ASI Recorder (DVEO)','ASI',1,NULL),(16,'OCUR Recorder (CableLabs)','OCUR',1,NULL),(17,'Ceton Recorder','CETON',1,NULL),(18,'VBox Recorder','VBOX',1,NULL);
/*!40000 ALTER TABLE `profilegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(128) NOT NULL DEFAULT '',
  `subtitle` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `category` varchar(64) NOT NULL DEFAULT '',
  `category_type` varchar(64) NOT NULL DEFAULT '',
  `airdate` year(4) NOT NULL DEFAULT '0000',
  `stars` float NOT NULL DEFAULT '0',
  `previouslyshown` tinyint(4) NOT NULL DEFAULT '0',
  `title_pronounce` varchar(128) NOT NULL DEFAULT '',
  `stereo` tinyint(1) NOT NULL DEFAULT '0',
  `subtitled` tinyint(1) NOT NULL DEFAULT '0',
  `hdtv` tinyint(1) NOT NULL DEFAULT '0',
  `closecaptioned` tinyint(1) NOT NULL DEFAULT '0',
  `partnumber` int(11) NOT NULL DEFAULT '0',
  `parttotal` int(11) NOT NULL DEFAULT '0',
  `seriesid` varchar(64) NOT NULL DEFAULT '',
  `originalairdate` date DEFAULT NULL,
  `showtype` varchar(30) NOT NULL DEFAULT '',
  `colorcode` varchar(20) NOT NULL DEFAULT '',
  `syndicatedepisodenumber` varchar(20) NOT NULL DEFAULT '',
  `programid` varchar(64) NOT NULL DEFAULT '',
  `manualid` int(10) unsigned NOT NULL DEFAULT '0',
  `generic` tinyint(1) DEFAULT '0',
  `listingsource` int(11) NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `last` tinyint(1) NOT NULL DEFAULT '0',
  `audioprop` set('STEREO','MONO','SURROUND','DOLBY','HARDHEAR','VISUALIMPAIR') NOT NULL,
  `subtitletypes` set('HARDHEAR','NORMAL','ONSCREEN','SIGNED') NOT NULL,
  `videoprop` set('HDTV','WIDESCREEN','AVC') NOT NULL,
  `inetref` varchar(40) DEFAULT '',
  `season` int(4) NOT NULL DEFAULT '0',
  `episode` int(4) NOT NULL DEFAULT '0',
  `totalepisodes` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chanid`,`starttime`,`manualid`),
  KEY `endtime` (`endtime`),
  KEY `title_pronounce` (`title_pronounce`),
  KEY `seriesid` (`seriesid`),
  KEY `id_start_end` (`chanid`,`starttime`,`endtime`),
  KEY `program_manualid` (`manualid`),
  KEY `previouslyshown` (`previouslyshown`),
  KEY `programid` (`programid`,`starttime`),
  KEY `starttime` (`starttime`),
  KEY `subtitle` (`subtitle`),
  KEY `description` (`description`(255)),
  KEY `title_subtitle_start` (`title`,`subtitle`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programgenres`
--

DROP TABLE IF EXISTS `programgenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programgenres` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `relevance` char(1) NOT NULL DEFAULT '',
  `genre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`chanid`,`starttime`,`relevance`),
  KEY `genre` (`genre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programgenres`
--

LOCK TABLES `programgenres` WRITE;
/*!40000 ALTER TABLE `programgenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `programgenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programrating`
--

DROP TABLE IF EXISTS `programrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programrating` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `system` varchar(8) DEFAULT NULL,
  `rating` varchar(16) DEFAULT NULL,
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`system`,`rating`),
  KEY `starttime` (`starttime`,`system`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programrating`
--

LOCK TABLES `programrating` WRITE;
/*!40000 ALTER TABLE `programrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `programrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recgrouppassword`
--

DROP TABLE IF EXISTS `recgrouppassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recgrouppassword` (
  `recgroup` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`recgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recgrouppassword`
--

LOCK TABLES `recgrouppassword` WRITE;
/*!40000 ALTER TABLE `recgrouppassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `recgrouppassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recgroups`
--

DROP TABLE IF EXISTS `recgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recgroups` (
  `recgroupid` smallint(4) NOT NULL AUTO_INCREMENT,
  `recgroup` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `special` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recgroupid`),
  UNIQUE KEY `recgroup` (`recgroup`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recgroups`
--

LOCK TABLES `recgroups` WRITE;
/*!40000 ALTER TABLE `recgroups` DISABLE KEYS */;
INSERT INTO `recgroups` VALUES (1,'Default','','',1),(2,'LiveTV','','',1),(3,'Deleted','','',1);
/*!40000 ALTER TABLE `recgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `recordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `chanid` int(10) unsigned DEFAULT NULL,
  `starttime` time NOT NULL DEFAULT '00:00:00',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `endtime` time NOT NULL DEFAULT '00:00:00',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `title` varchar(128) NOT NULL DEFAULT '',
  `subtitle` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `season` smallint(5) NOT NULL,
  `episode` smallint(5) NOT NULL,
  `category` varchar(64) NOT NULL DEFAULT '',
  `profile` varchar(128) NOT NULL DEFAULT 'Default',
  `recpriority` int(10) NOT NULL DEFAULT '0',
  `autoexpire` int(11) NOT NULL DEFAULT '0',
  `maxepisodes` int(11) NOT NULL DEFAULT '0',
  `maxnewest` int(11) NOT NULL DEFAULT '0',
  `startoffset` int(11) NOT NULL DEFAULT '0',
  `endoffset` int(11) NOT NULL DEFAULT '0',
  `recgroup` varchar(32) NOT NULL DEFAULT 'Default',
  `dupmethod` int(11) NOT NULL DEFAULT '6',
  `dupin` int(11) NOT NULL DEFAULT '15',
  `station` varchar(20) NOT NULL DEFAULT '',
  `seriesid` varchar(64) DEFAULT NULL,
  `programid` varchar(64) DEFAULT NULL,
  `inetref` varchar(40) NOT NULL,
  `search` int(10) unsigned NOT NULL DEFAULT '0',
  `autotranscode` tinyint(1) NOT NULL DEFAULT '0',
  `autocommflag` tinyint(1) NOT NULL DEFAULT '0',
  `autouserjob1` tinyint(1) NOT NULL DEFAULT '0',
  `autouserjob2` tinyint(1) NOT NULL DEFAULT '0',
  `autouserjob3` tinyint(1) NOT NULL DEFAULT '0',
  `autouserjob4` tinyint(1) NOT NULL DEFAULT '0',
  `autometadata` tinyint(1) NOT NULL DEFAULT '0',
  `findday` tinyint(4) NOT NULL DEFAULT '0',
  `findtime` time NOT NULL DEFAULT '00:00:00',
  `findid` int(11) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `parentid` int(11) NOT NULL DEFAULT '0',
  `transcoder` int(11) NOT NULL DEFAULT '0',
  `playgroup` varchar(32) NOT NULL DEFAULT 'Default',
  `prefinput` int(10) NOT NULL DEFAULT '0',
  `next_record` datetime DEFAULT NULL,
  `last_record` datetime DEFAULT NULL,
  `last_delete` datetime DEFAULT NULL,
  `storagegroup` varchar(32) NOT NULL DEFAULT 'Default',
  `avg_delay` int(11) NOT NULL DEFAULT '100',
  `filter` int(10) unsigned NOT NULL DEFAULT '0',
  `recgroupid` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`recordid`),
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`startdate`,`title`,`type`),
  KEY `title` (`title`),
  KEY `seriesid` (`seriesid`),
  KEY `programid` (`programid`),
  KEY `maxepisodes` (`maxepisodes`),
  KEY `search` (`search`),
  KEY `type` (`type`),
  KEY `recgroupid` (`recgroupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,11,0,'21:57:44','2012-08-11','21:57:44','2012-08-11','Default (Template)','','',0,0,'Default','Default',0,0,0,0,0,0,'Default',6,15,'','','','',0,0,1,0,0,0,0,1,-1,'00:00:00',735091,0,0,0,'Default',0,NULL,NULL,NULL,'Default',100,0,1);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorded`
--

DROP TABLE IF EXISTS `recorded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recorded` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(128) NOT NULL DEFAULT '',
  `subtitle` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `season` smallint(5) NOT NULL,
  `episode` smallint(5) NOT NULL,
  `category` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(64) NOT NULL DEFAULT '',
  `bookmark` tinyint(1) NOT NULL DEFAULT '0',
  `editing` int(10) unsigned NOT NULL DEFAULT '0',
  `cutlist` tinyint(1) NOT NULL DEFAULT '0',
  `autoexpire` int(11) NOT NULL DEFAULT '0',
  `commflagged` int(10) unsigned NOT NULL DEFAULT '0',
  `recgroup` varchar(32) NOT NULL DEFAULT 'Default',
  `recordid` int(11) DEFAULT NULL,
  `seriesid` varchar(64) DEFAULT NULL,
  `programid` varchar(64) DEFAULT NULL,
  `inetref` varchar(40) NOT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `filesize` bigint(20) NOT NULL DEFAULT '0',
  `stars` float NOT NULL DEFAULT '0',
  `previouslyshown` tinyint(1) DEFAULT '0',
  `originalairdate` date DEFAULT NULL,
  `preserve` tinyint(1) NOT NULL DEFAULT '0',
  `findid` int(11) NOT NULL DEFAULT '0',
  `deletepending` tinyint(1) NOT NULL DEFAULT '0',
  `transcoder` int(11) NOT NULL DEFAULT '0',
  `timestretch` float NOT NULL DEFAULT '1',
  `recpriority` int(11) NOT NULL DEFAULT '0',
  `basename` varchar(255) NOT NULL,
  `progstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `progend` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `playgroup` varchar(32) NOT NULL DEFAULT 'Default',
  `profile` varchar(32) NOT NULL DEFAULT '',
  `duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `transcoded` tinyint(1) NOT NULL DEFAULT '0',
  `watched` tinyint(4) NOT NULL DEFAULT '0',
  `storagegroup` varchar(32) NOT NULL DEFAULT 'Default',
  `bookmarkupdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recgroupid` smallint(4) NOT NULL DEFAULT '1',
  `recordedid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inputname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`recordedid`),
  UNIQUE KEY `chanid` (`chanid`,`starttime`),
  KEY `endtime` (`endtime`),
  KEY `seriesid` (`seriesid`),
  KEY `programid` (`programid`),
  KEY `title` (`title`),
  KEY `recordid` (`recordid`),
  KEY `deletepending` (`deletepending`,`lastmodified`),
  KEY `recgroup` (`recgroup`,`endtime`),
  KEY `recgroupid` (`recgroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorded`
--

LOCK TABLES `recorded` WRITE;
/*!40000 ALTER TABLE `recorded` DISABLE KEYS */;
/*!40000 ALTER TABLE `recorded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedartwork`
--

DROP TABLE IF EXISTS `recordedartwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedartwork` (
  `inetref` varchar(255) NOT NULL,
  `season` smallint(5) NOT NULL,
  `host` text NOT NULL,
  `coverart` text NOT NULL,
  `fanart` text NOT NULL,
  `banner` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedartwork`
--

LOCK TABLES `recordedartwork` WRITE;
/*!40000 ALTER TABLE `recordedartwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedartwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedcredits`
--

DROP TABLE IF EXISTS `recordedcredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedcredits` (
  `person` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role` set('actor','director','producer','executive_producer','writer','guest_star','host','adapter','presenter','commentator','guest') NOT NULL DEFAULT '',
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`person`,`role`),
  KEY `person` (`person`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedcredits`
--

LOCK TABLES `recordedcredits` WRITE;
/*!40000 ALTER TABLE `recordedcredits` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedcredits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedfile`
--

DROP TABLE IF EXISTS `recordedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedfile` (
  `basename` varchar(128) NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT '0',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fps` float(6,3) NOT NULL DEFAULT '0.000',
  `aspect` float(8,6) NOT NULL DEFAULT '0.000000',
  `audio_sample_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `audio_channels` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `audio_codec` varchar(255) NOT NULL DEFAULT '',
  `video_codec` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `hostname` varchar(64) NOT NULL,
  `storagegroup` varchar(32) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recordedid` int(10) unsigned NOT NULL,
  `container` varchar(255) NOT NULL DEFAULT '',
  `total_bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `video_avg_bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `video_max_bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `audio_avg_bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `audio_max_bitrate` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordedid` (`recordedid`),
  KEY `basename` (`basename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedfile`
--

LOCK TABLES `recordedfile` WRITE;
/*!40000 ALTER TABLE `recordedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedmarkup`
--

DROP TABLE IF EXISTS `recordedmarkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedmarkup` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `data` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`chanid`,`starttime`,`type`,`mark`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedmarkup`
--

LOCK TABLES `recordedmarkup` WRITE;
/*!40000 ALTER TABLE `recordedmarkup` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedmarkup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedprogram`
--

DROP TABLE IF EXISTS `recordedprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedprogram` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(128) NOT NULL DEFAULT '',
  `subtitle` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(16000) NOT NULL DEFAULT '',
  `category` varchar(64) NOT NULL DEFAULT '',
  `category_type` varchar(64) NOT NULL DEFAULT '',
  `airdate` year(4) NOT NULL DEFAULT '0000',
  `stars` float unsigned NOT NULL DEFAULT '0',
  `previouslyshown` tinyint(4) NOT NULL DEFAULT '0',
  `title_pronounce` varchar(128) NOT NULL DEFAULT '',
  `stereo` tinyint(1) NOT NULL DEFAULT '0',
  `subtitled` tinyint(1) NOT NULL DEFAULT '0',
  `hdtv` tinyint(1) NOT NULL DEFAULT '0',
  `closecaptioned` tinyint(1) NOT NULL DEFAULT '0',
  `partnumber` int(11) NOT NULL DEFAULT '0',
  `parttotal` int(11) NOT NULL DEFAULT '0',
  `seriesid` varchar(64) DEFAULT NULL,
  `originalairdate` date DEFAULT NULL,
  `showtype` varchar(30) NOT NULL DEFAULT '',
  `colorcode` varchar(20) NOT NULL DEFAULT '',
  `syndicatedepisodenumber` varchar(20) NOT NULL DEFAULT '',
  `programid` varchar(64) DEFAULT NULL,
  `manualid` int(10) unsigned NOT NULL DEFAULT '0',
  `generic` tinyint(1) DEFAULT '0',
  `listingsource` int(11) NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `last` tinyint(1) NOT NULL DEFAULT '0',
  `audioprop` set('STEREO','MONO','SURROUND','DOLBY','HARDHEAR','VISUALIMPAIR') NOT NULL,
  `subtitletypes` set('HARDHEAR','NORMAL','ONSCREEN','SIGNED') NOT NULL,
  `videoprop` set('HDTV','WIDESCREEN','AVC','720','1080','DAMAGED') NOT NULL,
  `inetref` varchar(40) DEFAULT '',
  `season` int(4) NOT NULL DEFAULT '0',
  `episode` int(4) NOT NULL DEFAULT '0',
  `totalepisodes` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chanid`,`starttime`,`manualid`),
  KEY `endtime` (`endtime`),
  KEY `title` (`title`),
  KEY `title_pronounce` (`title_pronounce`),
  KEY `seriesid` (`seriesid`),
  KEY `programid` (`programid`),
  KEY `id_start_end` (`chanid`,`starttime`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedprogram`
--

LOCK TABLES `recordedprogram` WRITE;
/*!40000 ALTER TABLE `recordedprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedrating`
--

DROP TABLE IF EXISTS `recordedrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedrating` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `system` varchar(8) DEFAULT NULL,
  `rating` varchar(16) DEFAULT NULL,
  UNIQUE KEY `chanid` (`chanid`,`starttime`,`system`,`rating`),
  KEY `starttime` (`starttime`,`system`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedrating`
--

LOCK TABLES `recordedrating` WRITE;
/*!40000 ALTER TABLE `recordedrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordedseek`
--

DROP TABLE IF EXISTS `recordedseek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordedseek` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mark` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `offset` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chanid`,`starttime`,`type`,`mark`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordedseek`
--

LOCK TABLES `recordedseek` WRITE;
/*!40000 ALTER TABLE `recordedseek` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordedseek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordfilter`
--

DROP TABLE IF EXISTS `recordfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordfilter` (
  `filterid` int(10) unsigned NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  `clause` varchar(256) DEFAULT NULL,
  `newruledefault` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`filterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordfilter`
--

LOCK TABLES `recordfilter` WRITE;
/*!40000 ALTER TABLE `recordfilter` DISABLE KEYS */;
INSERT INTO `recordfilter` VALUES (0,'New episode','program.previouslyshown = 0',0),(1,'Identifiable episode','program.generic = 0',0),(2,'First showing','program.first > 0',0),(3,'Prime time','HOUR(CONVERT_TZ(program.starttime, \'Etc/UTC\', \'SYSTEM\')) >= 19 AND HOUR(CONVERT_TZ(program.starttime, \'Etc/UTC\', \'SYSTEM\')) < 22',0),(4,'Commercial free','channel.commmethod = -2',0),(5,'High definition','program.hdtv > 0',0),(6,'This episode','(RECTABLE.programid <> \'\' AND program.programid = RECTABLE.programid) OR (RECTABLE.programid = \'\' AND program.subtitle = RECTABLE.subtitle AND program.description = RECTABLE.description)',0),(7,'This series','(RECTABLE.seriesid <> \'\' AND program.seriesid = RECTABLE.seriesid)',0),(8,'This time','ABS(TIMESTAMPDIFF(MINUTE, CONVERT_TZ(  ADDTIME(RECTABLE.startdate, RECTABLE.starttime), \'Etc/UTC\', \'SYSTEM\'),   CONVERT_TZ(program.starttime, \'Etc/UTC\', \'SYSTEM\'))) MOD 1440   NOT BETWEEN 11 AND 1429',0),(9,'This day and time','ABS(TIMESTAMPDIFF(MINUTE, CONVERT_TZ(  ADDTIME(RECTABLE.startdate, RECTABLE.starttime), \'Etc/UTC\', \'SYSTEM\'),   CONVERT_TZ(program.starttime, \'Etc/UTC\', \'SYSTEM\'))) MOD 10080   NOT BETWEEN 11 AND 10069',0),(10,'This channel','channel.callsign = RECTABLE.station',0),(11,'No episodes','program.category_type <> \'series\'',0);
/*!40000 ALTER TABLE `recordfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordingprofiles`
--

DROP TABLE IF EXISTS `recordingprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordingprofiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `videocodec` varchar(128) DEFAULT NULL,
  `audiocodec` varchar(128) DEFAULT NULL,
  `profilegroup` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `profilegroup` (`profilegroup`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordingprofiles`
--

LOCK TABLES `recordingprofiles` WRITE;
/*!40000 ALTER TABLE `recordingprofiles` DISABLE KEYS */;
INSERT INTO `recordingprofiles` VALUES (1,'Default',NULL,NULL,1),(2,'Live TV',NULL,NULL,1),(3,'High Quality',NULL,NULL,1),(4,'Low Quality',NULL,NULL,1),(5,'Default',NULL,NULL,2),(6,'Live TV',NULL,NULL,2),(7,'High Quality',NULL,NULL,2),(8,'Low Quality',NULL,NULL,2),(9,'Default',NULL,NULL,3),(10,'Live TV',NULL,NULL,3),(11,'High Quality',NULL,NULL,3),(12,'Low Quality',NULL,NULL,3),(13,'Default',NULL,NULL,4),(14,'Live TV',NULL,NULL,4),(15,'High Quality',NULL,NULL,4),(16,'Low Quality',NULL,NULL,4),(17,'Default',NULL,NULL,5),(18,'Live TV',NULL,NULL,5),(19,'High Quality',NULL,NULL,5),(20,'Low Quality',NULL,NULL,5),(21,'RTjpeg/MPEG4',NULL,NULL,6),(22,'MPEG2',NULL,NULL,6),(23,'Default',NULL,NULL,8),(24,'Live TV',NULL,NULL,8),(25,'High Quality',NULL,NULL,8),(26,'Low Quality',NULL,NULL,8),(27,'High Quality',NULL,NULL,6),(28,'Medium Quality',NULL,NULL,6),(29,'Low Quality',NULL,NULL,6),(30,'Default',NULL,NULL,10),(31,'Live TV',NULL,NULL,10),(32,'High Quality',NULL,NULL,10),(33,'Low Quality',NULL,NULL,10),(34,'Default',NULL,NULL,11),(35,'Live TV',NULL,NULL,11),(36,'High Quality',NULL,NULL,11),(37,'Low Quality',NULL,NULL,11),(38,'Default',NULL,NULL,12),(39,'Live TV',NULL,NULL,12),(40,'High Quality',NULL,NULL,12),(41,'Low Quality',NULL,NULL,12),(42,'Default',NULL,NULL,7),(43,'Live TV',NULL,NULL,7),(44,'High Quality',NULL,NULL,7),(45,'Low Quality',NULL,NULL,7),(46,'Default',NULL,NULL,9),(47,'Live TV',NULL,NULL,9),(48,'High Quality',NULL,NULL,9),(49,'Low Quality',NULL,NULL,9),(50,'Default',NULL,NULL,13),(51,'Live TV',NULL,NULL,13),(52,'High Quality',NULL,NULL,13),(53,'Low Quality',NULL,NULL,13),(54,'Default',NULL,NULL,14),(55,'Live TV',NULL,NULL,14),(56,'High Quality',NULL,NULL,14),(57,'Low Quality',NULL,NULL,14),(58,'Default',NULL,NULL,15),(59,'Live TV',NULL,NULL,15),(60,'High Quality',NULL,NULL,15),(61,'Low Quality',NULL,NULL,15),(62,'Default',NULL,NULL,16),(63,'Live TV',NULL,NULL,16),(64,'High Quality',NULL,NULL,16),(65,'Low Quality',NULL,NULL,16),(66,'Default',NULL,NULL,17),(67,'Live TV',NULL,NULL,17),(68,'High Quality',NULL,NULL,17),(69,'Low Quality',NULL,NULL,17),(70,'Default',NULL,NULL,18),(71,'Live TV',NULL,NULL,18),(72,'High Quality',NULL,NULL,18),(73,'Low Quality',NULL,NULL,18);
/*!40000 ALTER TABLE `recordingprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordmatch`
--

DROP TABLE IF EXISTS `recordmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordmatch` (
  `recordid` int(10) unsigned NOT NULL,
  `chanid` int(10) unsigned NOT NULL,
  `starttime` datetime NOT NULL,
  `manualid` int(10) unsigned NOT NULL,
  `oldrecduplicate` tinyint(1) DEFAULT NULL,
  `recduplicate` tinyint(1) DEFAULT NULL,
  `findduplicate` tinyint(1) DEFAULT NULL,
  `oldrecstatus` int(11) DEFAULT NULL,
  `findid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `recordid` (`recordid`,`chanid`,`starttime`),
  KEY `chanid` (`chanid`,`starttime`,`manualid`),
  KEY `recordid_2` (`recordid`,`findid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordmatch`
--

LOCK TABLES `recordmatch` WRITE;
/*!40000 ALTER TABLE `recordmatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scannerfile`
--

DROP TABLE IF EXISTS `scannerfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scannerfile` (
  `fileid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `filehash` varchar(64) NOT NULL DEFAULT '',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `filehash` (`filehash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scannerfile`
--

LOCK TABLES `scannerfile` WRITE;
/*!40000 ALTER TABLE `scannerfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `scannerfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scannerpath`
--

DROP TABLE IF EXISTS `scannerpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scannerpath` (
  `fileid` bigint(20) unsigned NOT NULL,
  `hostname` varchar(64) NOT NULL DEFAULT 'automythsvr-g36fe0ce',
  `storagegroup` varchar(32) NOT NULL DEFAULT 'Default',
  `filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scannerpath`
--

LOCK TABLES `scannerpath` WRITE;
/*!40000 ALTER TABLE `scannerpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `scannerpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `value` varchar(128) NOT NULL DEFAULT '',
  `data` varchar(16000) NOT NULL DEFAULT '',
  `hostname` varchar(64) DEFAULT NULL,
  KEY `value` (`value`,`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('mythfilldatabaseLastRunStart','2017-11-04T02:17:11Z',NULL),('mythfilldatabaseLastRunEnd','2017-11-04T02:17:11Z',NULL),('mythfilldatabaseLastRunStatus','Successful.',NULL),('DataDirectMessage','',NULL),('HaveRepeats','0',NULL),('DBSchemaVer','1344',NULL),('WebBrowserZoomLevel','1','automythsvr-g36fe0ce'),('Language','en_US',NULL),('Country','US',NULL),('BackupDBLastRunStart','2017-11-04 02:12:09',NULL),('BackupDBLastRunEnd','2017-11-04 02:12:10',NULL),('HardwareProfileEnabled','0',NULL),('ImageStorageGroupName','Images',NULL),('ImageSortOrder','0',NULL),('ImageShowHiddenFiles','0',NULL),('ImageSlideShowTime','3500',NULL),('ImageTransitionType','1',NULL),('ImageTransitionTime','1000',NULL),('MythFillSuggestedRunTime','2017-11-05T02:17:11Z',NULL),('BackendServerIP','127.0.0.1','automythsvr-g36fe0ce'),('BackendServerIP6','::1','automythsvr-g36fe0ce'),('AllowLinkLocal','1','automythsvr-g36fe0ce'),('BackendServerPort','6543','automythsvr-g36fe0ce'),('BackendStatusPort','6544','automythsvr-g36fe0ce'),('SecurityPin','0000','automythsvr-g36fe0ce'),('MasterServerIP','127.0.0.1','automythsvr-g36fe0ce'),('MasterServerPort','6543','automythsvr-g36fe0ce'),('TVFormat','NTSC',NULL),('VbiFormat','None',NULL),('FreqTable','us-bcast',NULL),('MasterBackendOverride','1',NULL),('DeletesFollowLinks','0',NULL),('TruncateDeletesSlowly','0','automythsvr-g36fe0ce'),('HDRingbufferSize','9400',NULL),('StorageScheduler','BalancedFreeSpace',NULL),('UPnP/WMPSource','0',NULL),('DisableAutomaticBackup','0',NULL),('DisableFirewireReset','0','automythsvr-g36fe0ce'),('EITTransportTimeout','5',NULL),('EITCrawIdleStart','60',NULL),('blockSDWUwithoutClient','1',NULL),('idleTimeoutSecs','0',NULL),('idleWaitForRecordingTime','15',NULL),('StartupSecsBeforeRecording','120',NULL),('WakeupTimeFormat','hh:mm yyyy-MM-dd',NULL),('ServerHaltCommand','sudo /sbin/halt -p',NULL),('WOLbackendReconnectWaitTime','0',NULL),('WOLbackendConnectRetry','5',NULL),('BackendStopCommand','killall mythbackend',NULL),('BackendStartCommand','mythbackend',NULL),('JobQueueMaxSimultaneousJobs','1','automythsvr-g36fe0ce'),('JobQueueCheckFrequency','60','automythsvr-g36fe0ce'),('JobQueueWindowStart','00:00','automythsvr-g36fe0ce'),('JobQueueWindowEnd','23:59','automythsvr-g36fe0ce'),('JobQueueCPU','0','automythsvr-g36fe0ce'),('JobAllowMetadata','0','automythsvr-g36fe0ce'),('JobAllowCommFlag','1','automythsvr-g36fe0ce'),('JobAllowTranscode','1','automythsvr-g36fe0ce'),('JobAllowUserJob1','0','automythsvr-g36fe0ce'),('JobAllowUserJob2','0','automythsvr-g36fe0ce'),('JobAllowUserJob3','0','automythsvr-g36fe0ce'),('JobAllowUserJob4','0','automythsvr-g36fe0ce'),('JobsRunOnRecordHost','0',NULL),('AutoCommflagWhileRecording','0',NULL),('JobQueueCommFlagCommand','mythcommflag',NULL),('JobQueueTranscodeCommand','mythtranscode',NULL),('AutoTranscodeBeforeAutoCommflag','0',NULL),('SaveTranscoding','0',NULL),('UserJobDesc1','User Job #1',NULL),('UserJobDesc2','User Job #2',NULL),('UserJobDesc3','User Job #3',NULL),('UserJobDesc4','User Job #4',NULL),('MythFillEnabled','1',NULL),('MythFillDatabasePath','mythfilldatabase',NULL),('MythFillMinHour','0',NULL),('MythFillMaxHour','23',NULL),('MythFillGrabberSuggestsTime','1',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagegroup`
--

DROP TABLE IF EXISTS `storagegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(32) NOT NULL,
  `hostname` varchar(64) NOT NULL DEFAULT '',
  `dirname` varchar(235) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouphostdir` (`groupname`,`hostname`,`dirname`),
  KEY `hostname` (`hostname`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagegroup`
--

LOCK TABLES `storagegroup` WRITE;
/*!40000 ALTER TABLE `storagegroup` DISABLE KEYS */;
INSERT INTO `storagegroup` VALUES (1,'Default','automythsvr-g36fe0ce','/myth/'),(2,'Recordings','automythsvr-g36fe0ce','/myth/recordings/'),(3,'LiveTV','automythsvr-g36fe0ce','/myth/livetv/'),(4,'DB Backups','automythsvr-g36fe0ce','/myth/dbbackups/'),(5,'Videos','automythsvr-g36fe0ce','/myth/videos/'),(6,'Trailers','automythsvr-g36fe0ce','/myth/trailers/'),(7,'Coverart','automythsvr-g36fe0ce','/myth/coverart/'),(8,'Fanart','automythsvr-g36fe0ce','/myth/fanart/'),(9,'Screenshots','automythsvr-g36fe0ce','/myth/screenshots/'),(10,'Banners','automythsvr-g36fe0ce','/myth/banners/'),(11,'Photographs','automythsvr-g36fe0ce','/myth/photographs/'),(12,'Music','automythsvr-g36fe0ce','/myth/music/'),(13,'MusicArt','automythsvr-g36fe0ce','/myth/music/musicArt/'),(14,'Streaming','automythsvr-g36fe0ce','/myth/streaming/');
/*!40000 ALTER TABLE `storagegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvchain`
--

DROP TABLE IF EXISTS `tvchain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvchain` (
  `chanid` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `chainid` varchar(128) NOT NULL DEFAULT '',
  `chainpos` int(10) NOT NULL DEFAULT '0',
  `discontinuity` tinyint(1) NOT NULL DEFAULT '0',
  `watching` int(10) NOT NULL DEFAULT '0',
  `hostprefix` varchar(128) NOT NULL DEFAULT '',
  `cardtype` varchar(32) NOT NULL DEFAULT 'V4L',
  `input` varchar(32) NOT NULL DEFAULT '',
  `channame` varchar(32) NOT NULL DEFAULT '',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`chanid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvchain`
--

LOCK TABLES `tvchain` WRITE;
/*!40000 ALTER TABLE `tvchain` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvchain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvosdmenu`
--

DROP TABLE IF EXISTS `tvosdmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvosdmenu` (
  `osdcategory` varchar(32) NOT NULL,
  `livetv` tinyint(4) NOT NULL DEFAULT '0',
  `recorded` tinyint(4) NOT NULL DEFAULT '0',
  `video` tinyint(4) NOT NULL DEFAULT '0',
  `dvd` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`osdcategory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvosdmenu`
--

LOCK TABLES `tvosdmenu` WRITE;
/*!40000 ALTER TABLE `tvosdmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvosdmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upnpmedia`
--

DROP TABLE IF EXISTS `upnpmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upnpmedia` (
  `intid` int(10) unsigned NOT NULL DEFAULT '0',
  `class` varchar(64) NOT NULL DEFAULT '',
  `itemtype` varchar(128) NOT NULL DEFAULT '',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemproperties` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(512) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(512) NOT NULL DEFAULT '',
  `coverart` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`intid`),
  KEY `class` (`class`),
  KEY `filepath` (`filepath`(333)),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upnpmedia`
--

LOCK TABLES `upnpmedia` WRITE;
/*!40000 ALTER TABLE `upnpmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `upnpmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `userid` int(5) unsigned NOT NULL,
  `permission` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sessions` (
  `sessiontoken` varchar(40) NOT NULL DEFAULT '',
  `userid` int(5) unsigned NOT NULL,
  `client` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `lastactive` datetime NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`sessiontoken`),
  UNIQUE KEY `userid_client` (`userid`,`client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '',
  `password_digest` varchar(32) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','bcd911b2ecb15ffbd6d8e6e744d60cf6','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocast`
--

DROP TABLE IF EXISTS `videocast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocast` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cast` varchar(128) NOT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocast`
--

LOCK TABLES `videocast` WRITE;
/*!40000 ALTER TABLE `videocast` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocategory`
--

DROP TABLE IF EXISTS `videocategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocategory` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(128) NOT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocategory`
--

LOCK TABLES `videocategory` WRITE;
/*!40000 ALTER TABLE `videocategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocollection`
--

DROP TABLE IF EXISTS `videocollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocollection` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `contenttype` set('MOVIE','TELEVISION','ADULT','MUSICVIDEO','HOMEVIDEO') NOT NULL DEFAULT '',
  `plot` text,
  `network` varchar(128) DEFAULT NULL,
  `collectionref` varchar(128) NOT NULL,
  `certification` varchar(128) DEFAULT NULL,
  `genre` varchar(128) DEFAULT '',
  `releasedate` date DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `rating` float DEFAULT '0',
  `ratingcount` int(10) DEFAULT '0',
  `runtime` smallint(5) unsigned DEFAULT '0',
  `banner` text,
  `fanart` text,
  `coverart` text,
  PRIMARY KEY (`intid`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocollection`
--

LOCK TABLES `videocollection` WRITE;
/*!40000 ALTER TABLE `videocollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocountry`
--

DROP TABLE IF EXISTS `videocountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videocountry` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(128) NOT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocountry`
--

LOCK TABLES `videocountry` WRITE;
/*!40000 ALTER TABLE `videocountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogenre`
--

DROP TABLE IF EXISTS `videogenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videogenre` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(128) NOT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogenre`
--

LOCK TABLES `videogenre` WRITE;
/*!40000 ALTER TABLE `videogenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `videogenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videometadata`
--

DROP TABLE IF EXISTS `videometadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videometadata` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `subtitle` text NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `director` varchar(128) NOT NULL,
  `studio` varchar(128) DEFAULT NULL,
  `plot` text,
  `rating` varchar(128) NOT NULL,
  `inetref` varchar(255) NOT NULL,
  `collectionref` int(10) NOT NULL DEFAULT '-1',
  `homepage` text NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `releasedate` date NOT NULL,
  `userrating` float NOT NULL,
  `length` int(10) unsigned NOT NULL,
  `playcount` int(10) NOT NULL DEFAULT '0',
  `season` smallint(5) unsigned NOT NULL DEFAULT '0',
  `episode` smallint(5) unsigned NOT NULL DEFAULT '0',
  `showlevel` int(10) unsigned NOT NULL,
  `filename` text NOT NULL,
  `hash` varchar(128) NOT NULL,
  `coverfile` text NOT NULL,
  `childid` int(11) NOT NULL DEFAULT '-1',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `watched` tinyint(1) NOT NULL DEFAULT '0',
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `playcommand` varchar(255) DEFAULT NULL,
  `category` int(10) unsigned NOT NULL DEFAULT '0',
  `trailer` text,
  `host` text NOT NULL,
  `screenshot` text,
  `banner` text,
  `fanart` text,
  `insertdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `contenttype` set('MOVIE','TELEVISION','ADULT','MUSICVIDEO','HOMEVIDEO') NOT NULL DEFAULT '',
  PRIMARY KEY (`intid`),
  KEY `director` (`director`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videometadata`
--

LOCK TABLES `videometadata` WRITE;
/*!40000 ALTER TABLE `videometadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `videometadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videometadatacast`
--

DROP TABLE IF EXISTS `videometadatacast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videometadatacast` (
  `idvideo` int(10) unsigned NOT NULL,
  `idcast` int(10) unsigned NOT NULL,
  UNIQUE KEY `idvideo` (`idvideo`,`idcast`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videometadatacast`
--

LOCK TABLES `videometadatacast` WRITE;
/*!40000 ALTER TABLE `videometadatacast` DISABLE KEYS */;
/*!40000 ALTER TABLE `videometadatacast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videometadatacountry`
--

DROP TABLE IF EXISTS `videometadatacountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videometadatacountry` (
  `idvideo` int(10) unsigned NOT NULL,
  `idcountry` int(10) unsigned NOT NULL,
  UNIQUE KEY `idvideo_2` (`idvideo`,`idcountry`),
  KEY `idvideo` (`idvideo`),
  KEY `idcountry` (`idcountry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videometadatacountry`
--

LOCK TABLES `videometadatacountry` WRITE;
/*!40000 ALTER TABLE `videometadatacountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `videometadatacountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videometadatagenre`
--

DROP TABLE IF EXISTS `videometadatagenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videometadatagenre` (
  `idvideo` int(10) unsigned NOT NULL,
  `idgenre` int(10) unsigned NOT NULL,
  UNIQUE KEY `idvideo_2` (`idvideo`,`idgenre`),
  KEY `idvideo` (`idvideo`),
  KEY `idgenre` (`idgenre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videometadatagenre`
--

LOCK TABLES `videometadatagenre` WRITE;
/*!40000 ALTER TABLE `videometadatagenre` DISABLE KEYS */;
/*!40000 ALTER TABLE `videometadatagenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videopart`
--

DROP TABLE IF EXISTS `videopart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videopart` (
  `fileid` bigint(20) unsigned NOT NULL,
  `videoid` int(10) unsigned NOT NULL,
  `order` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`videoid`,`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videopart`
--

LOCK TABLES `videopart` WRITE;
/*!40000 ALTER TABLE `videopart` DISABLE KEYS */;
/*!40000 ALTER TABLE `videopart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videopathinfo`
--

DROP TABLE IF EXISTS `videopathinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videopathinfo` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` text,
  `contenttype` set('MOVIE','TELEVISION','ADULT','MUSICVIDEO','HOMEVIDEO') NOT NULL DEFAULT '',
  `collectionref` int(10) DEFAULT '0',
  `recurse` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videopathinfo`
--

LOCK TABLES `videopathinfo` WRITE;
/*!40000 ALTER TABLE `videopathinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `videopathinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videosource`
--

DROP TABLE IF EXISTS `videosource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videosource` (
  `sourceid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `xmltvgrabber` varchar(128) DEFAULT NULL,
  `userid` varchar(128) NOT NULL DEFAULT '',
  `freqtable` varchar(16) NOT NULL DEFAULT 'default',
  `lineupid` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `useeit` smallint(6) NOT NULL DEFAULT '0',
  `configpath` varchar(4096) DEFAULT NULL,
  `dvb_nit_id` int(6) DEFAULT '-1',
  PRIMARY KEY (`sourceid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videosource`
--

LOCK TABLES `videosource` WRITE;
/*!40000 ALTER TABLE `videosource` DISABLE KEYS */;
INSERT INTO `videosource` VALUES (1,'EIT','eitonly','','default',NULL,NULL,1,NULL,-1);
/*!40000 ALTER TABLE `videosource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videotypes`
--

DROP TABLE IF EXISTS `videotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videotypes` (
  `intid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(128) NOT NULL,
  `playcommand` varchar(255) NOT NULL,
  `f_ignore` tinyint(1) DEFAULT NULL,
  `use_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`intid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videotypes`
--

LOCK TABLES `videotypes` WRITE;
/*!40000 ALTER TABLE `videotypes` DISABLE KEYS */;
INSERT INTO `videotypes` VALUES (1,'txt','',1,0),(2,'log','',1,0),(3,'mpg','Internal',0,0),(4,'avi','',0,1),(5,'vob','Internal',0,0),(6,'mpeg','Internal',0,0),(8,'iso','Internal',0,0),(9,'img','Internal',0,0),(10,'mkv','Internal',0,0),(11,'mp4','Internal',0,0),(12,'m2ts','Internal',0,0),(13,'evo','Internal',0,0),(14,'divx','Internal',0,0),(15,'mov','Internal',0,0),(16,'qt','Internal',0,0),(17,'wmv','Internal',0,0),(18,'3gp','Internal',0,0),(19,'asf','Internal',0,0),(20,'ogg','Internal',0,0),(21,'ogm','Internal',0,0),(22,'flv','Internal',0,0),(23,'ogv','Internal',0,0),(25,'nut','Internal',0,0),(26,'mxf','Internal',0,0),(27,'m4v','Internal',0,0),(28,'rm','Internal',0,0),(29,'ts','Internal',0,0),(30,'swf','Internal',0,0),(31,'f4v','Internal',0,0),(32,'nuv','Internal',0,0);
/*!40000 ALTER TABLE `videotypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-18 10:35:14
