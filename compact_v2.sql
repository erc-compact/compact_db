-- MariaDB dump 10.19-11.1.3-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: compact
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB

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
-- Table structure for table `Beam`
--

DROP TABLE IF EXISTS `Beam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Beam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ra` float DEFAULT NULL,
  `dec` float DEFAULT NULL,
  `ra_str` varchar(255) DEFAULT NULL,
  `dec_str` varchar(255) DEFAULT NULL,
  `pointing_id` int(11) NOT NULL,
  `beam_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pointing_id` (`pointing_id`),
  KEY `beam_type_id` (`beam_type_id`),
  CONSTRAINT `beam_ibfk_2` FOREIGN KEY (`beam_type_id`) REFERENCES `BeamTypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beam`
--

LOCK TABLES `Beam` WRITE;
/*!40000 ALTER TABLE `Beam` DISABLE KEYS */;
/*!40000 ALTER TABLE `Beam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BeamTypes`
--

DROP TABLE IF EXISTS `BeamTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BeamTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BeamTypes`
--

LOCK TABLES `BeamTypes` WRITE;
/*!40000 ALTER TABLE `BeamTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `BeamTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileTypes`
--

DROP TABLE IF EXISTS `FileTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `context` enum('Antenna','Beam','General') NOT NULL DEFAULT 'General',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileTypes`
--

LOCK TABLES `FileTypes` WRITE;
/*!40000 ALTER TABLE `FileTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hardware`
--

DROP TABLE IF EXISTS `Hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hardware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hardware`
--

LOCK TABLES `Hardware` WRITE;
/*!40000 ALTER TABLE `Hardware` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pointing`
--

DROP TABLE IF EXISTS `Pointing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pointing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utc_start` datetime DEFAULT NULL,
  `tobs` float DEFAULT NULL,
  `nchan_raw` int(11) DEFAULT NULL,
  `FREQ_BAND` varchar(50) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `freq_start_mhz` float DEFAULT NULL,
  `freq_end_mhz` float DEFAULT NULL,
  `tsamp_raw_seconds` float DEFAULT NULL,
  `telescope_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `Receiver` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `telescope_id` (`telescope_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `pointing_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `Target` (`id`),
  CONSTRAINT `pointing_ibfk_2` FOREIGN KEY (`telescope_id`) REFERENCES `telescope` (`id`),
  CONSTRAINT `pointing_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pointing`
--

LOCK TABLES `Pointing` WRITE;
/*!40000 ALTER TABLE `Pointing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pointing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Processing`
--

DROP TABLE IF EXISTS `Processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pipeline_id` int(11) DEFAULT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `process_status` varchar(255) DEFAULT NULL,
  `attempt_number` int(11) DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pr_pipeline_id` (`pipeline_id`),
  KEY `fk_pr_cluster_id` (`hardware_id`),
  CONSTRAINT `fk_pr_cluster_id` FOREIGN KEY (`hardware_id`) REFERENCES `Hardware` (`id`),
  CONSTRAINT `fk_pr_pipeline_id` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Processing`
--

LOCK TABLES `Processing` WRITE;
/*!40000 ALTER TABLE `Processing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Target`
--

DROP TABLE IF EXISTS `Target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) DEFAULT NULL,
  `ra` varchar(255) DEFAULT NULL,
  `dec` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_id` (`project_id`),
  CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Target`
--

LOCK TABLES `Target` WRITE;
/*!40000 ALTER TABLE `Target` DISABLE KEYS */;
/*!40000 ALTER TABLE `Target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antenna`
--

DROP TABLE IF EXISTS `antenna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antenna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `telescope_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `telescope_id` (`telescope_id`),
  CONSTRAINT `antenna_ibfk_1` FOREIGN KEY (`telescope_id`) REFERENCES `telescope` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antenna`
--

LOCK TABLES `antenna` WRITE;
/*!40000 ALTER TABLE `antenna` DISABLE KEYS */;
/*!40000 ALTER TABLE `antenna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beam_antenna_mapping`
--

DROP TABLE IF EXISTS `beam_antenna_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_antenna_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antenna_id` int(11) DEFAULT NULL,
  `beam_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `antenna_id` (`antenna_id`),
  KEY `beam_id` (`beam_id`),
  CONSTRAINT `beam_antenna_mapping_ibfk_1` FOREIGN KEY (`antenna_id`) REFERENCES `antenna` (`id`),
  CONSTRAINT `beam_antenna_mapping_ibfk_2` FOREIGN KEY (`beam_id`) REFERENCES `Beam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beam_antenna_mapping`
--

LOCK TABLES `beam_antenna_mapping` WRITE;
/*!40000 ALTER TABLE `beam_antenna_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `beam_antenna_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_filter`
--

DROP TABLE IF EXISTS `candidate_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_filter`
--

LOCK TABLES `candidate_filter` WRITE;
/*!40000 ALTER TABLE `candidate_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_product`
--

DROP TABLE IF EXISTS `data_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointing_id` int(11) NOT NULL,
  `beam_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  `file_type_id` int(11) NOT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `filehash` varchar(255) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `metainfo` text DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `beam_type_id` int(11) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `utc_start` datetime DEFAULT NULL,
  `tsamp_seconds` float DEFAULT NULL,
  `tobs` float DEFAULT NULL,
  `nsamples` bigint(20) DEFAULT NULL,
  `freq_start_mhz` float DEFAULT NULL,
  `freq_end_mhz` float DEFAULT NULL,
  `antenna_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dp_pointing_id` (`pointing_id`),
  KEY `fk_dp_beam_id` (`beam_id`),
  KEY `fk_dp_processing_id` (`processing_id`),
  KEY `fk_dp_file_type_id` (`file_type_id`),
  KEY `fk_dp_cluster_id` (`hardware_id`),
  KEY `fk_dp_beam_type_id` (`beam_type_id`),
  KEY `target_id` (`target_id`),
  KEY `antenna_id` (`antenna_id`),
  CONSTRAINT `data_product_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `Target` (`id`),
  CONSTRAINT `data_product_ibfk_2` FOREIGN KEY (`antenna_id`) REFERENCES `antenna` (`id`),
  CONSTRAINT `fk_dp_beam_id` FOREIGN KEY (`beam_id`) REFERENCES `Beam` (`id`),
  CONSTRAINT `fk_dp_beam_type_id` FOREIGN KEY (`beam_type_id`) REFERENCES `BeamTypes` (`id`),
  CONSTRAINT `fk_dp_file_type_id` FOREIGN KEY (`file_type_id`) REFERENCES `FileTypes` (`id`),
  CONSTRAINT `fk_dp_hardware_id` FOREIGN KEY (`hardware_id`) REFERENCES `Hardware` (`id`),
  CONSTRAINT `fk_dp_pointing_id` FOREIGN KEY (`pointing_id`) REFERENCES `Pointing` (`id`),
  CONSTRAINT `fk_dp_processing_id` FOREIGN KEY (`processing_id`) REFERENCES `Processing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_product`
--

LOCK TABLES `data_product` WRITE;
/*!40000 ALTER TABLE `data_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fold_candidates`
--

DROP TABLE IF EXISTS `fold_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fold_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointing_id` int(11) NOT NULL,
  `beam_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  `pipeline_id` int(11) NOT NULL,
  `spin_period` float DEFAULT NULL,
  `dm` float DEFAULT NULL,
  `acc` float DEFAULT NULL,
  `jerk` float DEFAULT NULL,
  `omega` float DEFAULT NULL,
  `tau` float DEFAULT NULL,
  `phi` float DEFAULT NULL,
  `long_periastron` float DEFAULT NULL,
  `ecc` float DEFAULT NULL,
  `fold_snr` float DEFAULT NULL,
  `fold_archive` varchar(255) DEFAULT NULL,
  `fold_archive_path` varchar(255) DEFAULT NULL,
  `file_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_pointing_id` (`pointing_id`),
  KEY `fk_fc_beam_id` (`beam_id`),
  KEY `fk_fc_processing_id` (`processing_id`),
  KEY `fk_fc_pipeline_id` (`pipeline_id`),
  KEY `file_type_id` (`file_type_id`),
  CONSTRAINT `fk_fc_beam_id` FOREIGN KEY (`beam_id`) REFERENCES `Beam` (`id`),
  CONSTRAINT `fk_fc_pipeline_id` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
  CONSTRAINT `fk_fc_pointing_id` FOREIGN KEY (`pointing_id`) REFERENCES `Pointing` (`id`),
  CONSTRAINT `fk_fc_processing_id` FOREIGN KEY (`processing_id`) REFERENCES `Processing` (`id`),
  CONSTRAINT `fold_candidates_ibfk_1` FOREIGN KEY (`file_type_id`) REFERENCES `FileTypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fold_candidates`
--

LOCK TABLES `fold_candidates` WRITE;
/*!40000 ALTER TABLE `fold_candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `fold_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline`
--

DROP TABLE IF EXISTS `pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pipeline_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipeline_config_id` (`pipeline_config_id`),
  CONSTRAINT `pipeline_ibfk_1` FOREIGN KEY (`pipeline_config_id`) REFERENCES `pipeline_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline`
--

LOCK TABLES `pipeline` WRITE;
/*!40000 ALTER TABLE `pipeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline_config`
--

DROP TABLE IF EXISTS `pipeline_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peasoup_acc_start` float DEFAULT NULL,
  `peasoup_acc_end` float DEFAULT NULL,
  `peasoup_min_snr` float DEFAULT NULL,
  `peasoup_ram_limit_gb` float DEFAULT NULL,
  `peasoup_nh` int(11) DEFAULT NULL,
  `peasoup_ngpus` int(11) DEFAULT NULL,
  `peasoup_total_cands_limit` int(11) DEFAULT NULL,
  `peasoup_fft_size` bigint(20) DEFAULT NULL,
  `peasoup_dm_file` varchar(255) DEFAULT NULL,
  `rfifind_time` float DEFAULT NULL,
  `rfifind_freqsig` float DEFAULT NULL,
  `rfifind_timesig` float DEFAULT NULL,
  `rfifind_intfrac` float DEFAULT NULL,
  `rfifind_chanfrac` float DEFAULT NULL,
  `rfifind_nthreads` int(11) DEFAULT NULL,
  `pulsarx_fold_script` varchar(255) DEFAULT NULL,
  `pulsarx_fold_template` varchar(255) DEFAULT NULL,
  `filtool_rfi_filter` varchar(255) DEFAULT NULL,
  `kepler_3param_min_porb_h` float DEFAULT NULL,
  `kepler_3param_max_porb_h` float DEFAULT NULL,
  `kepler_3param_min_pulsar_mass_m0` float DEFAULT NULL,
  `kepler_3param_max_comp_mass_m0` float DEFAULT NULL,
  `kepler_3param_min_orb_phase_rad` float DEFAULT NULL,
  `kepler_3param_max_orb_phase_rad` float DEFAULT NULL,
  `kepler_5param_min_porb_h` float DEFAULT NULL,
  `kepler_5param_max_porb_h` float DEFAULT NULL,
  `kepler_5param_min_pulsar_mass_m0` float DEFAULT NULL,
  `kepler_5param_max_comp_mass_m0` float DEFAULT NULL,
  `kepler_5param_min_orb_phase_rad` float DEFAULT NULL,
  `kepler_5param_max_orb_phase_rad` float DEFAULT NULL,
  `kepler_5param_min_ecc` float DEFAULT NULL,
  `kepler_5param_max_ecc` float DEFAULT NULL,
  `kepler_5param_min_periastron_rad` float DEFAULT NULL,
  `kepler_5param_max_periastron_rad` float DEFAULT NULL,
  `candidate_filter_order` varchar(255) DEFAULT NULL,
  `pulsarx_subint_length_s` float DEFAULT NULL,
  `pulsarx_threads` int(11) DEFAULT NULL,
  `pulsarx_fast_nbins` int(11) DEFAULT NULL,
  `pulsarx_slow_nbins` int(11) DEFAULT NULL,
  `pulsarx_nsubbands` int(11) DEFAULT NULL,
  `prepfold_ncpus` int(11) DEFAULT NULL,
  `prepfold_mask` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline_config`
--

LOCK TABLES `pipeline_config` WRITE;
/*!40000 ALTER TABLE `pipeline_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES
(1,'COMPACT','ERC funded MeerKAT baseband pulsar search survey'),
(2,'TRAPUM_GC_SEARCHES','GC Searches for the Transients and Pulsars with MeerKAT survey'),
(3,'HTRU_S_LOWLAT','HTRU South Lowlat survey');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_candidates`
--

DROP TABLE IF EXISTS `search_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointing_id` int(11) NOT NULL,
  `beam_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  `pipeline_id` int(11) NOT NULL,
  `spin_period` float DEFAULT NULL,
  `dm` float DEFAULT NULL,
  `acc` float DEFAULT NULL,
  `jerk` float DEFAULT NULL,
  `omega` float DEFAULT NULL,
  `tau` float DEFAULT NULL,
  `phi` float DEFAULT NULL,
  `long_periastron` float DEFAULT NULL,
  `ecc` float DEFAULT NULL,
  `snr` float DEFAULT NULL,
  `ddm_count_ratio` int(11) DEFAULT NULL,
  `ddm_snr_ratio` float DEFAULT NULL,
  `nassoc` int(11) DEFAULT NULL,
  `tstart` float DEFAULT NULL,
  `fft_size` float DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `nh` int(11) DEFAULT NULL,
  `filter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_pointing_id` (`pointing_id`),
  KEY `fk_sc_beam_id` (`beam_id`),
  KEY `fk_sc_processing_id` (`processing_id`),
  KEY `fk_sc_pipeline_id` (`pipeline_id`),
  KEY `filter_id` (`filter_id`),
  CONSTRAINT `fk_sc_beam_id` FOREIGN KEY (`beam_id`) REFERENCES `Beam` (`id`),
  CONSTRAINT `fk_sc_pipeline_id` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
  CONSTRAINT `fk_sc_pointing_id` FOREIGN KEY (`pointing_id`) REFERENCES `Pointing` (`id`),
  CONSTRAINT `fk_sc_processing_id` FOREIGN KEY (`processing_id`) REFERENCES `Processing` (`id`),
  CONSTRAINT `search_candidates_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `candidate_filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_candidates`
--

LOCK TABLES `search_candidates` WRITE;
/*!40000 ALTER TABLE `search_candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope`
--

DROP TABLE IF EXISTS `telescope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telescope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_telescope_id` FOREIGN KEY (`id`) REFERENCES `Pointing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope`
--

LOCK TABLES `telescope` WRITE;
/*!40000 ALTER TABLE `telescope` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28 18:12:25
