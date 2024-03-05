-- MariaDB dump 10.19-11.1.3-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: compact
-- ------------------------------------------------------
-- Server version	11.1.3-MariaDB

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
  `latitude_degrees` float DEFAULT NULL,
  `longitude_degrees` float DEFAULT NULL,
  `elevation_meters` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `telescope_id` (`telescope_id`),
  CONSTRAINT `fk_antenna_telescope` FOREIGN KEY (`telescope_id`) REFERENCES `telescope` (`id`)
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
-- Table structure for table `beam`
--

DROP TABLE IF EXISTS `beam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ra_str` varchar(255) DEFAULT NULL,
  `dec_str` varchar(255) DEFAULT NULL,
  `pointing_id` int(11) NOT NULL,
  `beam_type_id` int(11) DEFAULT NULL,
  `tsamp_seconds` decimal(20,10) DEFAULT NULL,
  `is_coherent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pointing_id` (`pointing_id`),
  KEY `beam_type_id` (`beam_type_id`),
  CONSTRAINT `beam_ibfk_3` FOREIGN KEY (`pointing_id`) REFERENCES `pointing` (`id`),
  CONSTRAINT `beam_ibfk_4` FOREIGN KEY (`beam_type_id`) REFERENCES `beam_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beam`
--

LOCK TABLES `beam` WRITE;
/*!40000 ALTER TABLE `beam` DISABLE KEYS */;
/*!40000 ALTER TABLE `beam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beam_antenna`
--

DROP TABLE IF EXISTS `beam_antenna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_antenna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antenna_id` int(11) DEFAULT NULL,
  `beam_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `antenna_id` (`antenna_id`),
  KEY `beam_id` (`beam_id`),
  CONSTRAINT `beam_antenna_ibfk_1` FOREIGN KEY (`antenna_id`) REFERENCES `antenna` (`id`),
  CONSTRAINT `beam_antenna_ibfk_2` FOREIGN KEY (`beam_id`) REFERENCES `beam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beam_antenna`
--

LOCK TABLES `beam_antenna` WRITE;
/*!40000 ALTER TABLE `beam_antenna` DISABLE KEYS */;
/*!40000 ALTER TABLE `beam_antenna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beam_type`
--

DROP TABLE IF EXISTS `beam_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beam_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beam_type`
--

LOCK TABLES `beam_type` WRITE;
/*!40000 ALTER TABLE `beam_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `beam_type` ENABLE KEYS */;
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
-- Table structure for table `circular_orbit_search`
--

DROP TABLE IF EXISTS `circular_orbit_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circular_orbit_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_porb_h` decimal(20,10) DEFAULT NULL,
  `max_porb_h` decimal(20,10) DEFAULT NULL,
  `min_pulsar_mass_m0` decimal(20,10) DEFAULT NULL,
  `max_comp_mass_m0` decimal(20,10) DEFAULT NULL,
  `min_orb_phase_rad` decimal(20,10) DEFAULT NULL,
  `max_orb_phase_rad` decimal(20,10) DEFAULT NULL,
  `coverage` decimal(20,10) DEFAULT NULL,
  `mismatch` decimal(20,10) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circular_orbit_search`
--

LOCK TABLES `circular_orbit_search` WRITE;
/*!40000 ALTER TABLE `circular_orbit_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `circular_orbit_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_product`
--

DROP TABLE IF EXISTS `data_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beam_id` int(11) NOT NULL,
  `file_type_id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `filehash` varchar(255) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `metainfo` varchar(255) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `utc_start` datetime DEFAULT NULL,
  `tsamp_seconds` decimal(20,10) DEFAULT NULL,
  `tobs_seconds` decimal(20,10) DEFAULT NULL,
  `nsamples` bigint(20) DEFAULT NULL,
  `freq_start_mhz` decimal(20,10) DEFAULT NULL,
  `freq_end_mhz` decimal(20,10) DEFAULT NULL,
  `created_by_processing_id` int(11) DEFAULT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dp_beam_id` (`beam_id`),
  KEY `fk_dp_file_type_id` (`file_type_id`),
  KEY `fk_created_by_processing_id` (`created_by_processing_id`),
  KEY `fk_hardware_id` (`hardware_id`),
  CONSTRAINT `data_product_ibfk_2` FOREIGN KEY (`beam_id`) REFERENCES `beam` (`id`),
  CONSTRAINT `data_product_ibfk_6` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`id`),
  CONSTRAINT `fk_created_by_processing_id` FOREIGN KEY (`created_by_processing_id`) REFERENCES `processing` (`id`),
  CONSTRAINT `fk_hardware_id` FOREIGN KEY (`hardware_id`) REFERENCES `hardware` (`id`)
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
-- Table structure for table `elliptical_orbit_search`
--

DROP TABLE IF EXISTS `elliptical_orbit_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elliptical_orbit_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_porb_h` decimal(20,10) DEFAULT NULL,
  `max_porb_h` decimal(20,10) DEFAULT NULL,
  `min_pulsar_mass_m0` decimal(20,10) DEFAULT NULL,
  `max_comp_mass_m0` decimal(20,10) DEFAULT NULL,
  `min_orb_phase_rad` decimal(20,10) DEFAULT NULL,
  `max_orb_phase_rad` decimal(20,10) DEFAULT NULL,
  `min_ecc` decimal(20,10) DEFAULT NULL,
  `max_ecc` decimal(20,10) DEFAULT NULL,
  `min_periastron_rad` decimal(20,10) DEFAULT NULL,
  `max_periastron_rad` decimal(20,10) DEFAULT NULL,
  `coverage` decimal(20,10) DEFAULT NULL,
  `mismatch` decimal(20,10) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elliptical_orbit_search`
--

LOCK TABLES `elliptical_orbit_search` WRITE;
/*!40000 ALTER TABLE `elliptical_orbit_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `elliptical_orbit_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_type`
--

DROP TABLE IF EXISTS `file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `context` enum('Antenna','Beam','General') NOT NULL DEFAULT 'General',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_type`
--

LOCK TABLES `file_type` WRITE;
/*!40000 ALTER TABLE `file_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtool`
--

DROP TABLE IF EXISTS `filtool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfi_filter` varchar(255) DEFAULT NULL,
  `telescope_name` varchar(255) DEFAULT NULL,
  `threads` int(11) DEFAULT NULL,
  `extra_args` varchar(255) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtool`
--

LOCK TABLES `filtool` WRITE;
/*!40000 ALTER TABLE `filtool` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fold_candidate`
--

DROP TABLE IF EXISTS `fold_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fold_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointing_id` int(11) NOT NULL,
  `beam_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  `spin_period` decimal(20,10) DEFAULT NULL,
  `dm` decimal(20,10) DEFAULT NULL,
  `acc` decimal(20,10) DEFAULT NULL,
  `jerk` decimal(20,10) DEFAULT NULL,
  `omega` decimal(20,10) DEFAULT NULL,
  `tau` decimal(20,10) DEFAULT NULL,
  `phi` decimal(20,10) DEFAULT NULL,
  `long_periastron` decimal(20,10) DEFAULT NULL,
  `ecc` decimal(20,10) DEFAULT NULL,
  `fold_snr` decimal(20,10) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `file_type_id` int(11) DEFAULT NULL,
  `search_candidate_id` int(11) DEFAULT NULL,
  `metadata_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_pointing_id` (`pointing_id`),
  KEY `fk_fc_beam_id` (`beam_id`),
  KEY `fk_fc_processing_id` (`processing_id`),
  KEY `file_type_id` (`file_type_id`),
  KEY `search_candidate_id` (`search_candidate_id`),
  CONSTRAINT `fk_fold_candidate_beam_id` FOREIGN KEY (`beam_id`) REFERENCES `beam` (`id`),
  CONSTRAINT `fk_fold_candidate_file_type_id` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`id`),
  CONSTRAINT `fk_fold_candidate_pointing_id` FOREIGN KEY (`pointing_id`) REFERENCES `pointing` (`id`),
  CONSTRAINT `fk_fold_candidate_processing_id` FOREIGN KEY (`processing_id`) REFERENCES `processing` (`id`),
  CONSTRAINT `fold_candidate_ibfk_2` FOREIGN KEY (`search_candidate_id`) REFERENCES `search_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fold_candidate`
--

LOCK TABLES `fold_candidate` WRITE;
/*!40000 ALTER TABLE `fold_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `fold_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_scheduler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware`
--

LOCK TABLES `hardware` WRITE;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peasoup`
--

DROP TABLE IF EXISTS `peasoup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peasoup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_start` decimal(20,10) DEFAULT NULL,
  `acc_end` decimal(20,10) DEFAULT NULL,
  `min_snr` decimal(20,10) DEFAULT NULL,
  `ram_limit_gb` decimal(20,10) DEFAULT NULL,
  `nharmonics` int(11) DEFAULT NULL,
  `ngpus` int(11) DEFAULT NULL,
  `total_cands_limit` int(11) DEFAULT NULL,
  `fft_size` bigint(20) DEFAULT NULL,
  `dm_file` varchar(255) DEFAULT NULL,
  `accel_tol` decimal(20,10) DEFAULT NULL,
  `birdie_list` varchar(255) DEFAULT NULL,
  `chan_mask` varchar(255) DEFAULT NULL,
  `extra_args` varchar(255) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peasoup`
--

LOCK TABLES `peasoup` WRITE;
/*!40000 ALTER TABLE `peasoup` DISABLE KEYS */;
/*!40000 ALTER TABLE `peasoup` ENABLE KEYS */;
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
  `github_repo_name` varchar(255) DEFAULT NULL,
  `github_commit_hash` char(40) DEFAULT NULL,
  `github_branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `pointing`
--

DROP TABLE IF EXISTS `pointing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utc_start` datetime DEFAULT NULL,
  `tobs_seconds` decimal(20,10) DEFAULT NULL,
  `nchan_raw` int(11) DEFAULT NULL,
  `freq_band` varchar(50) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `freq_start_mhz` decimal(20,10) DEFAULT NULL,
  `freq_end_mhz` decimal(20,10) DEFAULT NULL,
  `tsamp_raw_seconds` decimal(20,10) DEFAULT NULL,
  `telescope_id` int(11) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `telescope_id` (`telescope_id`),
  CONSTRAINT `fk_pointing_target` FOREIGN KEY (`target_id`) REFERENCES `target` (`id`),
  CONSTRAINT `fk_pointing_telescope` FOREIGN KEY (`telescope_id`) REFERENCES `telescope` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointing`
--

LOCK TABLES `pointing` WRITE;
/*!40000 ALTER TABLE `pointing` DISABLE KEYS */;
/*!40000 ALTER TABLE `pointing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prepfold`
--

DROP TABLE IF EXISTS `prepfold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepfold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ncpus` int(11) DEFAULT NULL,
  `rfifind_mask` varchar(255) DEFAULT NULL,
  `extra_args` varchar(1000) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepfold`
--

LOCK TABLES `prepfold` WRITE;
/*!40000 ALTER TABLE `prepfold` DISABLE KEYS */;
/*!40000 ALTER TABLE `prepfold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing`
--

DROP TABLE IF EXISTS `processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pipeline_id` int(11) DEFAULT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `process_status` varchar(255) DEFAULT NULL,
  `attempt_number` int(11) DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `peasoup_id` int(11) DEFAULT NULL,
  `pulsarx_id` int(11) DEFAULT NULL,
  `prepfold_id` int(11) DEFAULT NULL,
  `filtool_id` int(11) DEFAULT NULL,
  `circular_orbit_search_id` int(11) DEFAULT NULL,
  `elliptical_orbit_search_id` int(11) DEFAULT NULL,
  `rfifind_id` int(11) DEFAULT NULL,
  `candidate_filter_id` int(11) DEFAULT NULL,
  `execution_order` int(11) DEFAULT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pr_pipeline_id` (`pipeline_id`),
  KEY `fk_pr_cluster_id` (`hardware_id`),
  KEY `fk_peasoup_id` (`peasoup_id`),
  KEY `fk_pulsarx_id` (`pulsarx_id`),
  KEY `fk_prepfold_id` (`prepfold_id`),
  KEY `fk_filtool_id` (`filtool_id`),
  KEY `fk_circular_orbit_search_id` (`circular_orbit_search_id`),
  KEY `fk_elliptical_orbit_search_id` (`elliptical_orbit_search_id`),
  KEY `fk_rfifind_id` (`rfifind_id`),
  KEY `fk_candidate_filter_id` (`candidate_filter_id`),
  CONSTRAINT `fk_candidate_filter_id` FOREIGN KEY (`candidate_filter_id`) REFERENCES `candidate_filter` (`id`),
  CONSTRAINT `fk_circular_orbit_search_id` FOREIGN KEY (`circular_orbit_search_id`) REFERENCES `circular_orbit_search` (`id`),
  CONSTRAINT `fk_elliptical_orbit_search_id` FOREIGN KEY (`elliptical_orbit_search_id`) REFERENCES `elliptical_orbit_search` (`id`),
  CONSTRAINT `fk_filtool_id` FOREIGN KEY (`filtool_id`) REFERENCES `filtool` (`id`),
  CONSTRAINT `fk_peasoup_id` FOREIGN KEY (`peasoup_id`) REFERENCES `peasoup` (`id`),
  CONSTRAINT `fk_pr_hardware_id` FOREIGN KEY (`hardware_id`) REFERENCES `hardware` (`id`),
  CONSTRAINT `fk_pr_pipeline_id` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
  CONSTRAINT `fk_prepfold_id` FOREIGN KEY (`prepfold_id`) REFERENCES `prepfold` (`id`),
  CONSTRAINT `fk_pulsarx_id` FOREIGN KEY (`pulsarx_id`) REFERENCES `pulsarx` (`id`),
  CONSTRAINT `fk_rfifind_id` FOREIGN KEY (`rfifind_id`) REFERENCES `rfifind` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing`
--

LOCK TABLES `processing` WRITE;
/*!40000 ALTER TABLE `processing` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing_dp_inputs`
--

DROP TABLE IF EXISTS `processing_dp_inputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processing_dp_inputs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dp_id` (`dp_id`),
  KEY `processing_id` (`processing_id`),
  CONSTRAINT `processing_dp_inputs_ibfk_1` FOREIGN KEY (`dp_id`) REFERENCES `data_product` (`id`),
  CONSTRAINT `processing_dp_inputs_ibfk_2` FOREIGN KEY (`processing_id`) REFERENCES `processing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing_dp_inputs`
--

LOCK TABLES `processing_dp_inputs` WRITE;
/*!40000 ALTER TABLE `processing_dp_inputs` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing_dp_inputs` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `idx_project_name` (`name`)
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
-- Table structure for table `pulsarx`
--

DROP TABLE IF EXISTS `pulsarx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pulsarx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subbands_number` int(11) DEFAULT NULL,
  `subint_length` decimal(20,10) DEFAULT NULL,
  `clfd_q_value` decimal(20,10) DEFAULT NULL,
  `fast_nbins` int(11) DEFAULT NULL,
  `slow_nbins` int(11) DEFAULT NULL,
  `rfi_filter` varchar(255) DEFAULT NULL,
  `extra_args` varchar(1000) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `threads` int(11) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pulsarx`
--

LOCK TABLES `pulsarx` WRITE;
/*!40000 ALTER TABLE `pulsarx` DISABLE KEYS */;
/*!40000 ALTER TABLE `pulsarx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfifind`
--

DROP TABLE IF EXISTS `rfifind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfifind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` decimal(20,10) DEFAULT NULL,
  `time_sigma` decimal(20,10) DEFAULT NULL,
  `freq_sigma` decimal(20,10) DEFAULT NULL,
  `chan_frac` decimal(20,10) DEFAULT NULL,
  `int_frac` decimal(20,10) DEFAULT NULL,
  `ncpus` int(11) DEFAULT NULL,
  `extra_args` varchar(255) DEFAULT NULL,
  `container_image_name` varchar(255) DEFAULT NULL,
  `container_image_version` varchar(255) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `argument_hash` varchar(255) DEFAULT NULL,
  `container_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfifind`
--

LOCK TABLES `rfifind` WRITE;
/*!40000 ALTER TABLE `rfifind` DISABLE KEYS */;
/*!40000 ALTER TABLE `rfifind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_candidate`
--

DROP TABLE IF EXISTS `search_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointing_id` int(11) NOT NULL,
  `beam_id` int(11) NOT NULL,
  `processing_id` int(11) NOT NULL,
  `spin_period` decimal(20,10) DEFAULT NULL,
  `dm` decimal(20,10) DEFAULT NULL,
  `acc` decimal(20,10) DEFAULT NULL,
  `jerk` decimal(20,10) DEFAULT NULL,
  `omega` decimal(20,10) DEFAULT NULL,
  `tau` decimal(20,10) DEFAULT NULL,
  `phi` decimal(20,10) DEFAULT NULL,
  `long_periastron` decimal(20,10) DEFAULT NULL,
  `ecc` decimal(20,10) DEFAULT NULL,
  `snr` decimal(20,10) DEFAULT NULL,
  `ddm_count_ratio` decimal(20,10) DEFAULT NULL,
  `ddm_snr_ratio` decimal(20,10) DEFAULT NULL,
  `nassoc` int(11) DEFAULT NULL,
  `tstart` decimal(20,10) DEFAULT NULL,
  `fft_size` bigint(20) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `nh` int(11) DEFAULT NULL,
  `candidate_filter_id` int(11) DEFAULT NULL,
  `metadata_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_pointing_id` (`pointing_id`),
  KEY `fk_sc_beam_id` (`beam_id`),
  KEY `fk_sc_processing_id` (`processing_id`),
  KEY `filter_id` (`candidate_filter_id`),
  CONSTRAINT `search_candidate_ibfk_1` FOREIGN KEY (`candidate_filter_id`) REFERENCES `candidate_filter` (`id`),
  CONSTRAINT `search_candidate_ibfk_2` FOREIGN KEY (`beam_id`) REFERENCES `beam` (`id`),
  CONSTRAINT `search_candidate_ibfk_3` FOREIGN KEY (`pointing_id`) REFERENCES `pointing` (`id`),
  CONSTRAINT `search_candidate_ibfk_4` FOREIGN KEY (`processing_id`) REFERENCES `processing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_candidate`
--

LOCK TABLES `search_candidate` WRITE;
/*!40000 ALTER TABLE `search_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(255) DEFAULT NULL,
  `ra` varchar(255) DEFAULT NULL,
  `dec` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `core_radius_arcmin_harris` float DEFAULT NULL,
  `core_radius_arcmin_baumgardt` float DEFAULT NULL,
  `half_mass_radius_arcmin_harris` float DEFAULT NULL,
  `half_mass_radius_arcmin_baumgardt` float DEFAULT NULL,
  `half_light_radius_arcmin_harris` float DEFAULT NULL,
  `half_light_radius_arcmin_baumgardt` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_id` (`project_id`),
  KEY `idx_source_name_ra_dec` (`target_name`,`ra`,`dec`),
  CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope`
--

DROP TABLE IF EXISTS `telescope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telescope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope`
--

LOCK TABLES `telescope` WRITE;
/*!40000 ALTER TABLE `telescope` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_labels`
--

DROP TABLE IF EXISTS `user_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fold_candidate_id` int(11) DEFAULT NULL,
  `rfi` tinyint(1) DEFAULT NULL,
  `noise` tinyint(1) DEFAULT NULL,
  `t1_cand` tinyint(1) DEFAULT NULL,
  `t2_cand` tinyint(1) DEFAULT NULL,
  `known_pulsar` tinyint(1) DEFAULT NULL,
  `nb_psr` tinyint(1) DEFAULT NULL,
  `is_harmonic` tinyint(1) DEFAULT NULL,
  `is_confirmed_pulsar` tinyint(1) DEFAULT NULL,
  `pulsar_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fold_candidate_id` (`fold_candidate_id`),
  CONSTRAINT `user_labels_ibfk_1` FOREIGN KEY (`fold_candidate_id`) REFERENCES `fold_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_labels`
--

LOCK TABLES `user_labels` WRITE;
/*!40000 ALTER TABLE `user_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_labels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 23:49:30
