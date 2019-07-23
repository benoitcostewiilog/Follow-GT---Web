-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 12 Octobre 2015 à 14:23
-- Version du serveur :  5.6.17
-- Version de PHP :  5.4.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gt_log_tst_01`
--

-- --------------------------------------------------------

--
-- Structure de la table `adm_parametrage`
--

CREATE TABLE IF NOT EXISTS `adm_parametrage` (
  `id_parametrage` int(11) NOT NULL,
  `nom_parametrage` varchar(25) DEFAULT NULL,
  `actif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_parametrage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `adm_spool`
--

CREATE TABLE IF NOT EXISTS `adm_spool` (
  `id_spool` int(11) NOT NULL AUTO_INCREMENT,
  `code_etiq` varchar(45) DEFAULT NULL,
  `nb_etiq` int(2) DEFAULT NULL,
  `parametres` varchar(200) DEFAULT NULL,
  `imprimante` varchar(100) DEFAULT NULL,
  `imprimee` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_spool`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `adm_spool`
--

INSERT INTO `adm_spool` (`id_spool`, `code_etiq`, `nb_etiq`, `parametres`, `imprimante`, `imprimee`) VALUES
(1, 'ETAT_COLIS', 1, 'S15091614011728', NULL, 0),
(2, 'ETAT_ARRIVAGE', 1, '150916154649', NULL, 0),
(3, 'ETAT_COLIS', 1, 'C1509161733312', NULL, 0),
(4, 'ETAT_COLIS', 1, 'U1509161733313', NULL, 0),
(5, 'ETAT_ARRIVAGE', 1, '150916173331', NULL, 0),
(6, 'ETAT_ARRIVAGE', 1, '150917092944', NULL, 0),
(7, 'ETAT_EXPEDITION', 1, 'EX150917100715', NULL, 0),
(8, 'ETAT_EXPEDITION', 1, 'EX150917100715', NULL, 0),
(9, 'ETAT_EXPEDITION', 1, 'EX150917090246', NULL, 0),
(10, 'ETAT_EXPEDITION', 1, 'EX150917100905', NULL, 0),
(11, 'ETAT_EXPEDITION', 1, 'EX150917100715', NULL, 0),
(12, 'ETAT_EXPEDITION', 1, 'EX150917100905', NULL, 0),
(13, 'ETAT_COLIS', 1, 'C1509171034571', NULL, 0),
(14, 'ETAT_COLIS', 1, 'C1509171034572', NULL, 0),
(15, 'ETAT_COLIS', 1, 'C1509171034573', NULL, 0),
(16, 'ETAT_COLIS', 1, 'C1509171034574', NULL, 0),
(17, 'ETAT_ARRIVAGE', 1, '150917103457', NULL, 0),
(18, 'ETAT_EXPEDITION', 1, 'EX150917103727', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ref_chauffeur`
--

CREATE TABLE IF NOT EXISTS `ref_chauffeur` (
  `id_chauffeur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `num_doc_id` varchar(45) NOT NULL,
  `id_transporteur` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_chauffeur`),
  KEY `id_transporteur` (`id_transporteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `ref_chauffeur`
--

INSERT INTO `ref_chauffeur` (`id_chauffeur`, `nom`, `prenom`, `num_doc_id`, `id_transporteur`, `updated_at`, `created_at`) VALUES
(1, 'nom2', 'prenom', 'docId', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, ' Nom', ' Prénom', ' * N° document ID ', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'sdsd', 'sdsdsdsdsd', 'sdsds', 1, '0000-00-00 00:00:00', '2015-09-03 15:04:28'),
(7, 't', 'g', 'v', 6, '0000-00-00 00:00:00', '2015-09-17 10:38:36'),
(8, 'xcxc', 'xcxcxcxcxcxc', '', 1, '0000-00-00 00:00:00', '2015-09-21 15:01:07'),
(9, 'frdyd', 'dfgfgvhgf', '', 5, '0000-00-00 00:00:00', '2015-09-21 15:27:32');

-- --------------------------------------------------------

--
-- Structure de la table `ref_emplacement`
--

CREATE TABLE IF NOT EXISTS `ref_emplacement` (
  `code_emplacement` varchar(100) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`code_emplacement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ref_emplacement`
--

INSERT INTO `ref_emplacement` (`code_emplacement`, `libelle`, `updated_at`, `created_at`) VALUES
(' 000', ' 00000000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1', '1', '0000-00-00 00:00:00', '2015-08-27 17:55:29'),
('12', ' 12', '0000-00-00 00:00:00', '2015-08-26 10:49:04'),
('123', ' 12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('14', '14', '0000-00-00 00:00:00', '2015-08-26 10:40:58'),
('1598', '1598', '0000-00-00 00:00:00', '2015-08-26 10:02:50'),
('2', '2', '0000-00-00 00:00:00', '2015-08-26 10:50:51'),
('25', '25', '0000-00-00 00:00:00', '2015-08-26 10:40:58'),
('3', '  aaaaa', '0000-00-00 00:00:00', '2015-08-26 11:25:31'),
('336', '  sdfg', '0000-00-00 00:00:00', '2015-08-26 11:22:29'),
('36', '36', '0000-00-00 00:00:00', '2015-08-26 11:21:37'),
('52', '52', '0000-00-00 00:00:00', '2015-08-26 10:58:20'),
('54', '54', '0000-00-00 00:00:00', '2015-08-26 11:14:03'),
('56', '56', '0000-00-00 00:00:00', '2015-08-26 11:16:46'),
('58', '58', '0000-00-00 00:00:00', '2015-08-26 10:40:58'),
('63', '63', '0000-00-00 00:00:00', '2015-08-26 11:19:17'),
('74', '74', '0000-00-00 00:00:00', '2015-08-26 10:40:58'),
('78', '78', '0000-00-00 00:00:00', '2015-08-26 11:22:00'),
('785', '785', '0000-00-00 00:00:00', '2015-08-26 11:13:43'),
('8', '8', '0000-00-00 00:00:00', '2015-08-26 11:25:56'),
('A1B', 'A1B', '0000-00-00 00:00:00', '2015-08-26 11:28:31'),
('A2-56', 'A2-56', '0000-00-00 00:00:00', '2015-08-26 10:45:18'),
('asdcfvgbnhm,', ' 11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('asdfghjkxcvbnm', ' ddd', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('B1A', 'B1A', '0000-00-00 00:00:00', '2015-08-26 11:28:14'),
('B2A', 'B2A', '0000-00-00 00:00:00', '2015-08-26 10:42:06'),
('B3B', 'B3B', '0000-00-00 00:00:00', '2015-08-26 10:39:00'),
('H1A', 'H1A', '0000-00-00 00:00:00', '2015-08-26 10:40:58'),
('MAGASINIER1', 'MAGASINIER1', '0000-00-00 00:00:00', '2015-08-26 10:42:26'),
('QUAIEXPCOL', 'QUAIEXPCOL', '0000-00-00 00:00:00', '2015-08-26 10:42:30'),
('Réception', 'Réception centrale', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('sdsdsds', 'sdsd', '0000-00-00 00:00:00', '2015-09-03 15:04:38'),
('zxzxz', ' xzxzx', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `ref_fournisseur`
--

CREATE TABLE IF NOT EXISTS `ref_fournisseur` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `ref_fournisseur`
--

INSERT INTO `ref_fournisseur` (`id_fournisseur`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'Le fournisseur 2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Le fornisseur 3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'wdefrg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'dsdsdsds', '2015-09-03 15:04:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `ref_nature`
--

CREATE TABLE IF NOT EXISTS `ref_nature` (
  `id_nature` int(2) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `delais` time NOT NULL DEFAULT '00:00:00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `ref_nature`
--

INSERT INTO `ref_nature` (`id_nature`, `libelle`, `delais`, `created_at`, `updated_at`) VALUES
(1, 'Urgent', '02:00:00', '0000-00-00 00:00:00', '2015-08-31 10:34:02'),
(2, 'Surgeles', '00:30:00', '0000-00-00 00:00:00', '2015-08-31 10:35:16'),
(3, 'sdsdsd', '00:00:00', '2015-09-03 15:04:45', '0000-00-00 00:00:00'),
(4, 'test', '00:00:00', '2015-09-04 17:16:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `ref_transporteur`
--

CREATE TABLE IF NOT EXISTS `ref_transporteur` (
  `id_transporteur` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_transporteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `ref_transporteur`
--

INSERT INTO `ref_transporteur` (`id_transporteur`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'Transporteur 1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'asfgtyui', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'asdfgb', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '123456789', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'sdsdsdsdsdsd', '2015-09-03 15:04:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_forgot_password`
--

CREATE TABLE IF NOT EXISTS `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_group`
--

CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sf_guard_group`
--

INSERT INTO `sf_guard_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administrateur', 'administrateur', '2015-08-25 09:34:19', '2015-08-25 07:34:24'),
(3, 'reception', 'groupe reception', '2015-09-03 13:44:40', '2015-09-03 11:44:40');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_group_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sf_guard_group_permission`
--

INSERT INTO `sf_guard_group_permission` (`group_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-08-25 09:34:51', '2015-08-25 07:34:54'),
(1, 2, '2015-08-25 09:49:10', '2015-08-25 07:49:13'),
(1, 3, '2015-08-25 10:49:00', '2015-08-25 08:49:05'),
(1, 4, '2015-08-25 14:39:39', '2015-08-25 12:39:42'),
(1, 5, '2015-08-25 15:01:01', '2015-08-25 13:01:38'),
(1, 6, '2015-08-25 15:01:11', '2015-08-25 13:01:38'),
(1, 7, '2015-08-25 15:01:29', '2015-08-25 13:01:38'),
(1, 8, '2015-08-25 15:01:34', '2015-08-25 13:01:38'),
(1, 9, '2015-08-25 15:22:28', '2015-08-25 13:22:30'),
(1, 10, '2015-08-25 15:42:36', '2015-08-25 13:42:39'),
(1, 11, '0000-00-00 00:00:00', '2015-08-27 07:07:03'),
(1, 12, '0000-00-00 00:00:00', '2015-08-27 07:07:03'),
(1, 13, '0000-00-00 00:00:00', '2015-08-27 08:16:36'),
(1, 14, '0000-00-00 00:00:00', '2015-08-28 09:28:59'),
(1, 15, '0000-00-00 00:00:00', '2015-08-28 11:01:29'),
(1, 16, '0000-00-00 00:00:00', '2015-08-31 15:49:09'),
(1, 17, '0000-00-00 00:00:00', '2015-09-01 14:16:36'),
(1, 18, '0000-00-00 00:00:00', '2015-09-02 13:13:15'),
(1, 19, '0000-00-00 00:00:00', '2015-09-03 09:38:48'),
(2, 1, '2015-08-28 15:41:54', '2015-08-28 13:41:54'),
(2, 2, '2015-08-28 15:59:52', '2015-08-28 13:59:52'),
(2, 3, '2015-08-28 15:41:54', '2015-08-28 13:41:54'),
(3, 1, '2015-09-03 13:44:40', '2015-09-03 11:59:30'),
(3, 16, '2015-09-03 13:44:40', '2015-09-03 11:59:30');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `sf_guard_permission`
--

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'app_frontend', 'accès à l''appli frontend', '2015-08-25 09:21:31', '2015-08-25 07:21:34'),
(2, 'accueil', 'accès apge d''accueil', '2015-08-25 09:48:56', '2015-08-25 07:48:59'),
(3, 'mouvements', 'consultation des mouvements de marchandises', '2015-08-25 10:48:37', '2015-08-25 08:48:41'),
(4, 'arrivage', 'ecran de reception', '2015-08-25 14:39:22', '2015-08-25 12:39:25'),
(5, 'gestion des groupes', NULL, '2015-08-25 14:58:51', '2015-08-25 12:58:58'),
(6, 'gestion des utilisateurs', NULL, '2015-08-25 14:58:55', '2015-08-25 12:58:58'),
(7, 'gestion des utilisateurs niveau 1', 'gestion des utilisateurs niveau 1', '2015-08-25 14:59:16', '2015-08-25 13:00:42'),
(8, 'gestion des utilisateurs niveau 2', 'gestion des utilisateurs niveau 2', '2015-08-25 14:59:20', '2015-08-25 13:00:42'),
(9, 'referentiels-emplacement', 'referentiels-emplacement', '2015-08-25 15:20:52', '2015-08-25 13:41:22'),
(10, 'referentiels', 'referentiels', '2015-08-25 15:42:15', '2015-08-25 13:42:18'),
(11, 'referentiels-fournisseur', NULL, '0000-00-00 00:00:00', '2015-08-27 07:06:10'),
(12, 'referentiels-transporteur', NULL, '0000-00-00 00:00:00', '2015-08-27 07:06:10'),
(13, 'inventaires', NULL, '0000-00-00 00:00:00', '2015-08-27 08:16:20'),
(14, 'parametrage', 'Accès au paramètre général', '0000-00-00 00:00:00', '2015-08-28 09:26:30'),
(15, 'referentiels-nature', 'Droit sur le référentiel nature de colis', '0000-00-00 00:00:00', '2015-08-28 11:01:00'),
(16, 'association-br', NULL, '0000-00-00 00:00:00', '2015-08-31 15:48:58'),
(17, 'expedition', 'ecran d''expedition', '2015-08-25 14:39:22', '2015-08-25 12:39:25'),
(18, 'reception', NULL, '0000-00-00 00:00:00', '2015-09-02 13:12:59'),
(19, 'referentiels-chauffeur', NULL, '0000-00-00 00:00:00', '2015-09-03 09:38:38');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_remember_key`
--

CREATE TABLE IF NOT EXISTS `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user`
--

CREATE TABLE IF NOT EXISTS `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `password_nomade` varchar(121) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `codep` int(5) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `reg_id` int(11) DEFAULT NULL,
  `authentication_key` varchar(15) DEFAULT NULL,
  `admin_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `sf_guard_user`
--

INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `password_nomade`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`, `role`, `tel`, `adresse`, `codep`, `ville`, `photo`, `reg_id`, `authentication_key`, `admin_group`) VALUES
(1, '', '', '', 'admin', 'sha1', '874f81e78b04e8ddcb24a3dd0bcd33c6', '132d88a257bee37c9c658868b9308f5d763bf7a0', '123456789', 1, 0, '2015-10-12 13:58:23', '2013-01-01 12:00:00', '2015-10-12 11:58:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ntXwhXtfAvq9gIy', NULL),
(3, '', '', '', 'test', 'sha1', 'f3e51d30b3baf8942941999146b07bc3', 'b8b11935cc0489f4b91614c6381c100cd8112fbd', NULL, 1, 0, '2015-09-04 16:39:40', '2015-08-28 15:58:44', '2015-09-04 14:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '', '', '', '1234567', 'sha1', '8b938617f07160dd308d69566894921e', 'b977c7402b513a9d38a076086c974e21828cd074', NULL, 0, 0, NULL, '2015-09-01 11:41:39', '2015-09-01 09:41:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '', '', '', 'test2', 'sha1', '5b46d6f8539e097e2bd84af347d6dda7', '0e16986dd8a3272f79f73a507344f08eeacbe157', '5b6903492662ed46f3e24bf5abe49f975ab8e38e', 1, 0, NULL, '2015-09-02 12:28:45', '2015-09-02 11:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '', '', '', 'test3', 'sha1', '02228e6323832bb75ea6f388f0b75d3f', 'acbe4d2073b7e6355dd24b7380db59d22cba4463', 'qwerty', 1, 0, NULL, '2015-09-02 13:59:20', '2015-09-02 12:00:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '', '', '', 'qwerty', 'sha1', '31025b545a41c34d9bd74f6a8bc6223a', 'b512ea90404f3eff6929cae8074aa8f689144113', 'qwerty255', 1, 0, '2015-09-04 16:41:52', '2015-09-02 14:01:11', '2015-09-04 14:41:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '', '', '', 'reception', 'sha1', 'e744878bfcf2c199a519be68ce8bf0f0', '2686d2afdb338d844fa0498548c3b2b0e01de595', 'reception', 1, 0, '2015-09-04 12:09:10', '2015-09-03 13:45:28', '2015-09-04 10:09:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user_group`
--

CREATE TABLE IF NOT EXISTS `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sf_guard_user_group`
--

INSERT INTO `sf_guard_user_group` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-08-25 09:35:04', '2015-08-25 07:35:07');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `wrk_arrivage`
--

CREATE TABLE IF NOT EXISTS `wrk_arrivage` (
  `id_arrivage` int(11) NOT NULL AUTO_INCREMENT,
  `id_fournisseur` int(11) NOT NULL,
  `id_transporteur` int(4) NOT NULL,
  `id_chauffeur` int(11) DEFAULT NULL,
  `lettre_voiture` varchar(100) DEFAULT NULL,
  `nb_colis` int(11) DEFAULT NULL,
  `nb_palette` int(11) DEFAULT NULL,
  `immatriculation` varchar(45) DEFAULT NULL,
  `rep_signature` text,
  `id_nature` int(2) DEFAULT NULL,
  `br_sap` varchar(100) DEFAULT NULL,
  `statut` varchar(100) NOT NULL DEFAULT 'conforme',
  `commentaire` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_arrivage`),
  KEY `fk_arrivage_fournisseur_idx` (`id_fournisseur`),
  KEY `fk_arrivage_nature` (`id_nature`),
  KEY `id_chauffeur` (`id_chauffeur`),
  KEY `id_transporteur` (`id_transporteur`),
  KEY `id_transporteur_2` (`id_transporteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `wrk_arrivage`
--

INSERT INTO `wrk_arrivage` (`id_arrivage`, `id_fournisseur`, `id_transporteur`, `id_chauffeur`, `lettre_voiture`, `nb_colis`, `nb_palette`, `immatriculation`, `rep_signature`, `id_nature`, `br_sap`, `statut`, `commentaire`, `created_at`, `updated_at`) VALUES
(3, 1, 1, NULL, '', 0, 0, '', NULL, 4, '123456789', 'reserve', NULL, '2015-08-31 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 4, NULL, '', 10, 0, '', NULL, NULL, '123456789', 'reserve', NULL, '2015-08-30 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 1, 1, '', 0, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 11:22:47', '0000-00-00 00:00:00'),
(6, 1, 1, 1, '', 5, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 12:29:42', '0000-00-00 00:00:00'),
(7, 1, 1, 1, '', 3, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 12:33:16', '0000-00-00 00:00:00'),
(8, 1, 1, 1, '', 7, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 12:35:23', '0000-00-00 00:00:00'),
(9, 1, 1, 1, '', 5, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 12:36:03', '0000-00-00 00:00:00'),
(10, 1, 1, 1, '', 9, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(11, 1, 1, 1, '', 40, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(12, 1, 1, 1, '', 13, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(13, 1, 1, 1, '', 2, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 14:29:57', '0000-00-00 00:00:00'),
(14, 1, 1, 1, '', 5, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 14:31:16', '0000-00-00 00:00:00'),
(15, 1, 1, 1, '', 84, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(16, 1, 1, 1, '', 1, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-16 15:45:06', '0000-00-00 00:00:00'),
(17, 1, 1, 6, '', 4, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-16 15:46:49', '0000-00-00 00:00:00'),
(18, 4, 3, 3, '', 3, 0, '', NULL, NULL, NULL, 'reserve', NULL, '2015-09-16 17:33:11', '0000-00-00 00:00:00'),
(19, 1, 1, 1, '', 0, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-16 17:36:04', '0000-00-00 00:00:00'),
(20, 1, 1, 1, '', 12, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-17 09:21:18', '0000-00-00 00:00:00'),
(21, 1, 1, 1, '', 3, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-17 09:29:23', '0000-00-00 00:00:00'),
(22, 2, 3, 3, 'g', 4, 0, 'bdf45787', NULL, NULL, NULL, 'conforme', NULL, '2015-09-17 10:34:57', '0000-00-00 00:00:00'),
(23, 1, 1, 1, '', 0, 0, 'gggggggg', NULL, NULL, NULL, 'conforme', NULL, '2015-09-21 15:26:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_arrivage_produit`
--

CREATE TABLE IF NOT EXISTS `wrk_arrivage_produit` (
  `id_arrivage_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_arrivage` int(11) NOT NULL,
  `ref_produit` varchar(45) NOT NULL,
  `br_sap` varchar(100) DEFAULT NULL,
  `id_nature` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_arrivage_produit`),
  KEY `fk_arrivage_produit` (`id_arrivage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=245 ;

--
-- Contenu de la table `wrk_arrivage_produit`
--

INSERT INTO `wrk_arrivage_produit` (`id_arrivage_produit`, `id_arrivage`, `ref_produit`, `br_sap`, `id_nature`, `created_at`, `updated_at`) VALUES
(2, 3, 'QWERTY', 'sds', NULL, '0000-00-00 00:00:00', '2015-09-02 09:25:42'),
(3, 3, 'AZERTY', 'AZERTY', NULL, '0000-00-00 00:00:00', '2015-09-01 09:50:21'),
(4, 3, 'QWERTY', 'gdvdhd1', NULL, '0000-00-00 00:00:00', '2015-09-01 14:13:12'),
(5, 3, 'QWERTY', 'QWERTY', NULL, '2015-09-02 09:55:00', '0000-00-00 00:00:00'),
(6, 3, 'QWERTY', 'gshgdjjgabhgdskcdk', NULL, '2015-09-02 09:55:07', '0000-00-00 00:00:00'),
(7, 3, 'QWERTY', 'qetwotpfjcbgfgdlohfkfhfkvflb', NULL, '2015-09-02 09:57:27', '0000-00-00 00:00:00'),
(8, 3, 'AZERTY', 'sdsd', NULL, '2015-09-02 09:58:05', '0000-00-00 00:00:00'),
(9, 3, 'AZERTY', '1545wsd45d4d', NULL, '2015-09-02 09:58:56', '0000-00-00 00:00:00'),
(10, 3, 'qwerty', 'asdfghjkl;', NULL, '2015-09-02 09:59:23', '0000-00-00 00:00:00'),
(11, 3, 'qwerty', 'sdfghjk', NULL, '2015-09-02 10:00:48', '0000-00-00 00:00:00'),
(12, 3, 'qwerty', 'qwerty2', NULL, '2015-09-02 10:01:10', '0000-00-00 00:00:00'),
(13, 3, 'qwerty', 'sdsds', NULL, '2015-09-02 12:11:45', '0000-00-00 00:00:00'),
(14, 3, 'qwerty', '!', NULL, '2015-09-02 12:11:50', '0000-00-00 00:00:00'),
(15, 3, 'qwerty', '1', NULL, '2015-09-02 12:11:55', '0000-00-00 00:00:00'),
(16, 3, 'qwerty', '2', NULL, '2015-09-02 12:12:02', '0000-00-00 00:00:00'),
(17, 3, 'QWERTY', 'asdsfglhsdjv45f4', NULL, '2015-09-03 10:05:44', '0000-00-00 00:00:00'),
(18, 3, 'QWERTY', 'dfdfdf', NULL, '2015-09-03 10:49:23', '0000-00-00 00:00:00'),
(49, 3, 'qwerty', 'sdsdsd', NULL, '2015-09-03 14:25:16', '0000-00-00 00:00:00'),
(50, 3, 'qwerty', '1111111', NULL, '2015-09-03 14:26:22', '0000-00-00 00:00:00'),
(51, 3, 'qwerty', 'er', NULL, '2015-09-04 12:00:34', '0000-00-00 00:00:00'),
(52, 3, 'qwerty', 'fgfgffg', NULL, '2015-09-04 12:22:29', '0000-00-00 00:00:00'),
(53, 3, 'qwerty', '222', NULL, '2015-09-04 12:24:02', '0000-00-00 00:00:00'),
(54, 3, 'qwerty', 's', NULL, '2015-09-04 12:30:59', '0000-00-00 00:00:00'),
(55, 6, 'S14423993821', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 6, 'C14423993822', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 6, 'C14423993823', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 6, 'U14423993824', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 6, 'U14423993825', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 10, 'S1509161237061', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(61, 10, 'S1509161237062', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(62, 10, 'S1509161237063', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(63, 10, 'S1509161237064', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(64, 10, 'S1509161237065', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(65, 10, 'S1509161237066', NULL, 1, '2015-09-16 12:37:06', '0000-00-00 00:00:00'),
(66, 11, 'S1509161401171', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(67, 11, 'S1509161401172', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(68, 11, 'S1509161401173', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(69, 11, 'S1509161401174', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(70, 11, 'S1509161401175', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(71, 11, 'S1509161401176', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(72, 11, 'S1509161401177', NULL, 1, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(73, 11, 'C1509161401178', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(74, 11, 'C1509161401179', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(75, 11, 'C15091614011710', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(76, 11, 'C15091614011711', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(77, 11, 'C15091614011712', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(78, 11, 'C15091614011713', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(79, 11, 'C15091614011714', NULL, 3, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(80, 11, 'U15091614011715', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(81, 11, 'U15091614011716', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(82, 11, 'U15091614011717', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(83, 11, 'U15091614011718', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(84, 11, 'U15091614011719', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(85, 11, 'U15091614011720', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(86, 11, 'U15091614011721', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(87, 11, 'U15091614011722', NULL, 2, '2015-09-16 14:01:17', '0000-00-00 00:00:00'),
(88, 11, 'S1509161411521', NULL, 1, '2015-09-16 14:11:52', '0000-00-00 00:00:00'),
(89, 11, 'S15091614130424', NULL, 1, '2015-09-16 14:13:04', '0000-00-00 00:00:00'),
(90, 10, 'S1509161420067', NULL, 1, '2015-09-16 14:20:06', '0000-00-00 00:00:00'),
(91, 10, 'C1509161420068', NULL, 3, '2015-09-16 14:20:06', '0000-00-00 00:00:00'),
(92, 10, 'U1509161420069', NULL, 2, '2015-09-16 14:20:06', '0000-00-00 00:00:00'),
(93, 12, 'S1509161420361', NULL, 1, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(94, 12, 'C1509161420362', NULL, 3, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(95, 12, 'C1509161420363', NULL, 3, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(96, 12, 'U1509161420364', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(97, 12, 'U1509161420365', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(98, 12, 'U1509161420366', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(99, 12, 'U1509161420367', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(100, 12, 'U1509161420368', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(101, 12, 'U1509161420369', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(102, 12, 'U15091614203610', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(103, 12, 'U15091614203611', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(104, 12, 'U15091614203612', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(105, 12, 'U15091614203613', NULL, 2, '2015-09-16 14:20:36', '0000-00-00 00:00:00'),
(106, 13, 'S1509161429571', NULL, 1, '2015-09-16 14:29:57', '0000-00-00 00:00:00'),
(107, 13, 'C1509161429582', NULL, 3, '2015-09-16 14:29:58', '0000-00-00 00:00:00'),
(108, 14, 'S1509161431161', NULL, 1, '2015-09-16 14:31:16', '0000-00-00 00:00:00'),
(109, 14, 'S1509161431162', NULL, 1, '2015-09-16 14:31:16', '0000-00-00 00:00:00'),
(110, 14, 'C1509161431163', NULL, 3, '2015-09-16 14:31:16', '0000-00-00 00:00:00'),
(111, 14, 'U1509161431424', NULL, 2, '2015-09-16 14:31:42', '0000-00-00 00:00:00'),
(112, 14, 'U1509161432445', NULL, 2, '2015-09-16 14:32:44', '0000-00-00 00:00:00'),
(113, 15, 'S1509161502551', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(114, 15, 'S1509161502552', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(115, 15, 'S1509161502553', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(116, 15, 'S1509161502554', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(117, 15, 'S1509161502555', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(118, 15, 'S1509161502556', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(119, 15, 'S1509161502557', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(120, 15, 'S1509161502558', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(121, 15, 'S1509161502559', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(122, 15, 'S15091615025510', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(123, 15, 'S15091615025511', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(124, 15, 'S15091615025512', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(125, 15, 'S15091615025513', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(126, 15, 'S15091615025514', NULL, 1, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(127, 15, 'C15091615025515', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(128, 15, 'C15091615025516', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(129, 15, 'C15091615025517', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(130, 15, 'C15091615025518', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(131, 15, 'C15091615025519', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(132, 15, 'C15091615025520', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(133, 15, 'C15091615025521', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(134, 15, 'C15091615025522', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(135, 15, 'C15091615025523', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(136, 15, 'C15091615025524', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(137, 15, 'C15091615025525', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(138, 15, 'C15091615025526', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(139, 15, 'C15091615025527', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(140, 15, 'C15091615025528', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(141, 15, 'C15091615025529', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(142, 15, 'C15091615025530', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(143, 15, 'C15091615025531', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(144, 15, 'C15091615025532', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(145, 15, 'C15091615025533', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(146, 15, 'C15091615025534', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(147, 15, 'C15091615025535', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(148, 15, 'C15091615025536', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(149, 15, 'C15091615025537', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(150, 15, 'C15091615025538', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(151, 15, 'C15091615025539', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(152, 15, 'C15091615025540', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(153, 15, 'C15091615025541', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(154, 15, 'C15091615025542', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(155, 15, 'C15091615025543', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(156, 15, 'C15091615025544', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(157, 15, 'C15091615025545', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(158, 15, 'C15091615025546', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(159, 15, 'C15091615025547', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(160, 15, 'C15091615025548', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(161, 15, 'C15091615025549', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(162, 15, 'C15091615025550', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(163, 15, 'C15091615025551', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(164, 15, 'C15091615025552', NULL, 3, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(165, 15, 'U15091615025553', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(166, 15, 'U15091615025554', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(167, 15, 'U15091615025555', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(168, 15, 'U15091615025556', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(169, 15, 'U15091615025557', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(170, 15, 'U15091615025558', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(171, 15, 'U15091615025559', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(172, 15, 'U15091615025560', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(173, 15, 'U15091615025561', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(174, 15, 'U15091615025562', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(175, 15, 'U15091615025563', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(176, 15, 'U15091615025564', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(177, 15, 'U15091615025565', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(178, 15, 'U15091615025566', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(179, 15, 'U15091615025567', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(180, 15, 'U15091615025568', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(181, 15, 'U15091615025569', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(182, 15, 'U15091615025570', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(183, 15, 'U15091615025571', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(184, 15, 'U15091615025572', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(185, 15, 'U15091615025573', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(186, 15, 'U15091615025574', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(187, 15, 'U15091615025575', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(188, 15, 'U15091615025576', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(189, 15, 'U15091615025577', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(190, 15, 'U15091615025578', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(191, 15, 'U15091615025579', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(192, 15, 'U15091615025580', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(193, 15, 'U15091615025581', NULL, 2, '2015-09-16 15:02:55', '0000-00-00 00:00:00'),
(194, 15, 'U15091615025582', NULL, 2, '2015-09-16 15:02:56', '0000-00-00 00:00:00'),
(195, 15, 'S15091615025583', NULL, 1, '2015-09-16 15:03:37', '0000-00-00 00:00:00'),
(196, 15, 'U15091615025584', NULL, 2, '2015-09-16 15:06:47', '0000-00-00 00:00:00'),
(197, 15, 'S1509161502551', 'sadfgASDFGasdfgaas', 1, '2015-09-16 15:15:10', '0000-00-00 00:00:00'),
(198, 11, 'S15091614011725', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(199, 11, 'S15091614011726', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(200, 11, 'S15091614011727', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(201, 11, 'S15091614011728', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(202, 11, 'S15091614011729', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(203, 11, 'S15091614011730', NULL, 1, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(204, 11, 'C15091614011731', NULL, 3, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(205, 11, 'C15091614011732', NULL, 3, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(206, 11, 'C15091614011733', NULL, 3, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(207, 11, 'C15091614011734', NULL, 3, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(208, 11, 'C15091614011735', NULL, 3, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(209, 11, 'U15091614011736', NULL, 2, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(210, 11, 'U15091614011737', NULL, 2, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(211, 11, 'U15091614011738', NULL, 2, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(212, 11, 'U15091614011739', NULL, 2, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(213, 11, 'U15091614011740', NULL, 2, '2015-09-16 15:37:56', '0000-00-00 00:00:00'),
(214, 16, 'S1509161545061', NULL, 1, '2015-09-16 15:45:06', '0000-00-00 00:00:00'),
(215, 17, 'S1509161546491', NULL, 1, '2015-09-16 15:46:49', '0000-00-00 00:00:00'),
(216, 17, 'C1509161546492', NULL, 3, '2015-09-16 15:46:49', '0000-00-00 00:00:00'),
(217, 17, 'C1509161546493', NULL, 3, '2015-09-16 15:46:49', '0000-00-00 00:00:00'),
(218, 17, 'U1509161546494', NULL, 2, '2015-09-16 15:46:49', '0000-00-00 00:00:00'),
(219, 18, 'S1509161733311', NULL, 1, '2015-09-16 17:33:31', '0000-00-00 00:00:00'),
(220, 18, 'C1509161733312', NULL, 3, '2015-09-16 17:34:12', '0000-00-00 00:00:00'),
(221, 18, 'U1509161733313', NULL, 2, '2015-09-16 17:34:13', '0000-00-00 00:00:00'),
(222, 20, 'S1509170921181', NULL, 1, '2015-09-17 09:21:18', '0000-00-00 00:00:00'),
(223, 20, 'S1509170921182', NULL, 1, '2015-09-17 09:21:18', '0000-00-00 00:00:00'),
(224, 20, 'S1509170921183', NULL, 1, '2015-09-17 09:21:18', '0000-00-00 00:00:00'),
(225, 20, 'S1509170921184', NULL, 1, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(226, 20, 'S1509170921185', NULL, 1, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(227, 20, 'S1509170921186', NULL, 1, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(228, 20, 'S1509170921187', NULL, 1, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(229, 20, 'C1509170921188', NULL, 3, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(230, 20, 'C1509170921189', NULL, 3, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(231, 20, 'C15091709211810', NULL, 3, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(232, 20, 'C15091709211811', NULL, 3, '2015-09-17 09:21:19', '0000-00-00 00:00:00'),
(233, 20, 'U15091709211812', NULL, 2, '2015-09-17 09:22:29', '0000-00-00 00:00:00'),
(234, 21, 'S1509170929441', NULL, 1, '2015-09-17 09:29:44', '0000-00-00 00:00:00'),
(235, 21, 'S1509170929442', NULL, 1, '2015-09-17 09:30:02', '0000-00-00 00:00:00'),
(236, 21, 'U1509170929443', NULL, 2, '2015-09-17 09:30:02', '0000-00-00 00:00:00'),
(237, 22, 'C1509171034571', NULL, 3, '2015-09-17 10:34:57', '0000-00-00 00:00:00'),
(238, 22, 'C1509171034572', NULL, 3, '2015-09-17 10:34:57', '0000-00-00 00:00:00'),
(239, 22, 'C1509171034573', NULL, 3, '2015-09-17 10:34:57', '0000-00-00 00:00:00'),
(240, 22, 'C1509171034574', NULL, 3, '2015-09-17 10:34:57', '0000-00-00 00:00:00'),
(241, 22, 'C1509171034571', '741258963', 3, '2015-09-17 10:35:47', '0000-00-00 00:00:00'),
(242, 22, 'C1509171034572', '963258741', 3, '2015-09-17 10:35:58', '0000-00-00 00:00:00'),
(243, 22, 'C1509171034573', '852147963', 3, '2015-09-17 10:36:08', '0000-00-00 00:00:00'),
(244, 22, 'C1509171034574', '789654123', 3, '2015-09-17 10:36:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_expedition`
--

CREATE TABLE IF NOT EXISTS `wrk_expedition` (
  `id_expedition` int(11) NOT NULL AUTO_INCREMENT,
  `id_fournisseur` int(11) NOT NULL,
  `id_transporteur` int(11) NOT NULL,
  `id_chauffeur` int(11) DEFAULT NULL,
  `lettre_voiture` varchar(100) DEFAULT NULL,
  `nb_colis` int(11) DEFAULT NULL,
  `nb_palette` int(11) DEFAULT NULL,
  `immatriculation` varchar(45) DEFAULT NULL,
  `rep_signature` text,
  `id_nature` int(2) DEFAULT NULL,
  `br_sap` varchar(100) DEFAULT NULL,
  `statut` varchar(100) NOT NULL DEFAULT 'conforme',
  `commentaire` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_expedition`),
  KEY `fk_expedition_transporteur_idx` (`id_transporteur`),
  KEY `fk_expedition_fournisseur_idx` (`id_fournisseur`),
  KEY `fk_expedition_nature` (`id_nature`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `wrk_expedition`
--

INSERT INTO `wrk_expedition` (`id_expedition`, `id_fournisseur`, `id_transporteur`, `id_chauffeur`, `lettre_voiture`, `nb_colis`, `nb_palette`, `immatriculation`, `rep_signature`, `id_nature`, `br_sap`, `statut`, `commentaire`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'q', 5, 0, 'swdsd545', NULL, 2, '', 'conforme', NULL, '2015-09-01 00:00:00', '2015-09-04 11:36:55'),
(2, 1, 1, 6, '', 0, 0, '', NULL, NULL, '', 'conforme', NULL, '2015-09-16 15:28:30', '2015-09-16 15:37:15'),
(3, 1, 1, 6, '', 0, 0, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-16 15:50:11', '2015-09-16 15:50:19'),
(4, 0, 1, 1, '', 0, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-16 16:17:14', '0000-00-00 00:00:00'),
(5, 0, 1, 1, 'g', 9, 0, 'dfdf454', NULL, NULL, NULL, '', NULL, '2015-09-16 16:35:48', '0000-00-00 00:00:00'),
(6, 0, 3, 3, '', 0, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-16 16:37:20', '0000-00-00 00:00:00'),
(7, 0, 3, 3, '4', 3, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-16 16:37:56', '0000-00-00 00:00:00'),
(8, 0, 1, 1, 'k', 0, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-16 16:38:23', '0000-00-00 00:00:00'),
(9, 0, 1, 1, '', 4, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 09:02:46', '2015-09-17 10:06:23'),
(10, 0, 1, 1, '', 2, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 10:06:08', '0000-00-00 00:00:00'),
(11, 0, 1, 1, '', 3, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 10:07:15', '0000-00-00 00:00:00'),
(12, 0, 3, 3, 'f', 5, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 10:08:53', '0000-00-00 00:00:00'),
(13, 0, 3, 3, '', 50, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 10:09:05', '2015-09-17 10:30:17'),
(14, 0, 1, 1, 'c', 4, 0, 'dfg25447', NULL, NULL, NULL, '', NULL, '2015-09-17 10:37:27', '0000-00-00 00:00:00'),
(15, 0, 1, 1, '', 0, 0, '', NULL, NULL, NULL, '', NULL, '2015-09-17 10:57:17', '0000-00-00 00:00:00'),
(16, 0, 1, 1, '', 0, NULL, '', NULL, NULL, NULL, 'conforme', NULL, '2015-09-17 11:09:23', '2015-09-17 11:09:23'),
(17, 0, 3, 3, '', 0, NULL, 'xcv', NULL, NULL, NULL, 'conforme', NULL, '2015-09-21 15:11:16', '2015-09-21 15:11:16');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_expedition_produit`
--

CREATE TABLE IF NOT EXISTS `wrk_expedition_produit` (
  `id_expedition_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_expedition` int(11) NOT NULL,
  `ref_produit` varchar(45) NOT NULL,
  `br_sap` varchar(100) DEFAULT NULL,
  `id_nature` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_expedition_produit`),
  KEY `fk_expedition_produit` (`id_expedition`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `wrk_expedition_produit`
--

INSERT INTO `wrk_expedition_produit` (`id_expedition_produit`, `id_expedition`, `ref_produit`, `br_sap`, `id_nature`, `created_at`, `updated_at`) VALUES
(1, 1, 'QWERTY', NULL, NULL, '0000-00-00 00:00:00', '2015-09-01 16:07:40'),
(2, 1, 'AZERTY', NULL, NULL, '0000-00-00 00:00:00', '2015-09-01 16:07:40');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_groupe`
--

CREATE TABLE IF NOT EXISTS `wrk_groupe` (
  `id_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `ref_produit` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `retry` int(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_groupe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wrk_groupe`
--

INSERT INTO `wrk_groupe` (`id_groupe`, `libelle`, `ref_produit`, `date`, `id_utilisateur`, `retry`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '2015-08-31 13:00:00', 1, 0, '2015-08-31 06:00:00', '2015-08-31 14:07:20');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_inventaire`
--

CREATE TABLE IF NOT EXISTS `wrk_inventaire` (
  `id_inventaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `heure_prise` datetime NOT NULL,
  `ref_produit` varchar(45) DEFAULT NULL,
  `code_emplacement` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_inventaire`),
  KEY `fk_inventaire_emplacement_idx` (`code_emplacement`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `wrk_inventaire`
--

INSERT INTO `wrk_inventaire` (`id_inventaire`, `id_utilisateur`, `heure_prise`, `ref_produit`, `code_emplacement`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-08-26 10:04:51', '1', '1', '2015-08-26 10:04:51', '0000-00-00 00:00:00'),
(2, 1, '2015-08-26 10:04:51', 'sdhshds454545sds', '1598', '2015-08-26 10:04:51', '0000-00-00 00:00:00'),
(3, 1, '2015-08-26 10:38:58', 'B3B', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(4, 1, '2015-08-26 10:38:58', 'B6B', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(5, 1, '2015-08-26 10:38:58', 'B3C', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(6, 1, '2015-08-26 10:38:58', 'B4B', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(7, 1, '2015-08-26 10:38:58', 'QUAISEXP1', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(8, 1, '2015-08-26 10:38:58', 'H1A', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(9, 1, '2015-08-26 10:38:58', 'MASSE1', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(10, 1, '2015-08-26 10:38:58', 'ASSEMBKITS', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(11, 1, '2015-08-26 10:38:58', 'B4C', 'B3B', '2015-08-26 10:39:00', '0000-00-00 00:00:00'),
(12, 1, '2015-08-26 11:28:12', 'B1A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(13, 1, '2015-08-26 11:28:12', 'B2A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(14, 1, '2015-08-26 11:28:12', 'B4A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(15, 1, '2015-08-26 11:28:12', 'B3A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(16, 1, '2015-08-26 11:28:12', 'B5A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(17, 1, '2015-08-26 11:28:12', 'B6A', 'B1A', '2015-08-26 11:28:14', '0000-00-00 00:00:00'),
(18, 1, '2015-08-26 11:28:29', 'A1B', 'A1B', '2015-08-26 11:28:31', '0000-00-00 00:00:00'),
(19, 1, '2015-08-26 11:28:29', 'A2B', 'A1B', '2015-08-26 11:28:31', '0000-00-00 00:00:00'),
(20, 1, '2015-08-26 11:28:29', 'A3A', 'A1B', '2015-08-26 11:28:31', '0000-00-00 00:00:00'),
(21, 1, '2015-08-26 11:28:29', 'A4A', 'A1B', '2015-08-26 11:28:31', '0000-00-00 00:00:00'),
(22, 1, '2015-08-26 11:28:29', 'A5B', 'A1B', '2015-08-26 11:28:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `wrk_mouvement`
--

CREATE TABLE IF NOT EXISTS `wrk_mouvement` (
  `id_mouvement` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `heure_prise` datetime NOT NULL,
  `ref_produit` varchar(45) DEFAULT NULL,
  `br_sap` varchar(100) DEFAULT NULL,
  `code_emplacement` varchar(100) NOT NULL,
  `retry` int(11) DEFAULT NULL,
  `type` varchar(45) NOT NULL COMMENT 'prise, depose, passage',
  `groupe` varchar(45) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_mouvement`),
  KEY `fk_mouvement_emplacement_idx` (`code_emplacement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=256 ;

--
-- Contenu de la table `wrk_mouvement`
--

INSERT INTO `wrk_mouvement` (`id_mouvement`, `id_utilisateur`, `heure_prise`, `ref_produit`, `br_sap`, `code_emplacement`, `retry`, `type`, `groupe`, `commentaire`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-08-26 10:02:50', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-26 10:02:50', '0000-00-00 00:00:00'),
(2, 1, '2015-08-26 10:02:50', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-26 10:02:50', '0000-00-00 00:00:00'),
(3, 1, '2015-08-25 16:58:44', '', NULL, '14', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(4, 1, '2015-08-25 17:02:18', '', NULL, '14', 2, 'passage', '', 'Gare vide', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(5, 1, '2015-08-25 17:03:44', '', NULL, '14', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(6, 1, '2015-08-25 17:03:54', '', NULL, '25', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(7, 1, '2015-08-25 17:04:23', '', NULL, '25', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(8, 1, '2015-08-25 17:18:31', '', NULL, '25', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(9, 1, '2015-08-25 17:20:36', '', NULL, '74', 2, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(10, 1, '2015-08-25 17:40:46', '', NULL, '14', 2, 'passage', '', 'Gare vide', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(11, 1, '2015-08-25 17:41:28', '', NULL, '58', 1, 'passage', '', 'Navette pleine', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(12, 1, '2015-08-26 10:40:56', '', NULL, 'H1A', 0, 'passage', '', '', '2015-08-26 10:40:58', '0000-00-00 00:00:00'),
(13, 1, '2015-08-26 10:41:21', 'B4C', NULL, 'H1A', 0, 'prise', 'ASSEMBKITS', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(14, 1, '2015-08-26 10:41:21', 'B6B', NULL, 'H1A', 0, 'prise', 'ASSEMBKITS', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(15, 1, '2015-08-26 10:41:22', 'B3C', NULL, 'H1A', 0, 'prise', 'ASSEMBKITS', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(16, 1, '2015-08-26 10:41:22', 'B4B', NULL, 'H1A', 0, 'prise', 'ASSEMBKITS', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(17, 1, '2015-08-26 10:41:23', 'B3B', NULL, 'H1A', 0, 'prise', 'ASSEMBKITS', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(18, 1, '2015-08-26 10:41:29', 'MASSE1', NULL, 'H1A', 0, 'prise', '', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(19, 1, '2015-08-26 10:41:29', 'QUAISEXP1', NULL, 'H1A', 0, 'prise', '', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(20, 1, '2015-08-26 10:41:31', 'H1A', NULL, 'H1A', 0, 'prise', '', '', '2015-08-26 10:41:59', '0000-00-00 00:00:00'),
(21, 1, '2015-08-26 10:42:04', '', NULL, 'B2A', 0, 'passage', '', '', '2015-08-26 10:42:06', '0000-00-00 00:00:00'),
(22, 1, '2015-08-26 10:42:15', '1', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(23, 1, '2015-08-26 10:42:15', 'sdhshds454545sds', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(24, 1, '2015-08-26 10:42:06', 'B4C', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(25, 1, '2015-08-26 10:42:06', 'B6B', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(26, 1, '2015-08-26 10:42:06', 'B3C', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(27, 1, '2015-08-26 10:42:06', 'B4B', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(28, 1, '2015-08-26 10:42:06', 'B3B', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(29, 1, '2015-08-26 10:42:08', 'MASSE1', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(30, 1, '2015-08-26 10:42:08', 'QUAISEXP1', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(31, 1, '2015-08-26 10:42:09', 'H1A', NULL, 'B2A', 0, 'depose', '', '', '2015-08-26 10:42:17', '0000-00-00 00:00:00'),
(32, 1, '2015-08-26 10:42:25', '', NULL, 'MAGASINIER1', 0, 'passage', '', 'Navette pleine', '2015-08-26 10:42:26', '0000-00-00 00:00:00'),
(33, 1, '2015-08-26 10:42:29', '', NULL, 'QUAIEXPCOL', 0, 'passage', '', 'Gare vide', '2015-08-26 10:42:30', '0000-00-00 00:00:00'),
(34, 1, '2015-08-26 10:45:16', '', NULL, 'A2-56', 0, 'passage', '', '', '2015-08-26 10:45:18', '0000-00-00 00:00:00'),
(35, 1, '2015-08-26 10:49:01', '', NULL, '12', 0, 'passage', '', '', '2015-08-26 10:49:04', '0000-00-00 00:00:00'),
(36, 1, '2015-08-26 10:49:11', '1', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(37, 1, '2015-08-26 10:49:11', 'sdhshds454545sds', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(38, 1, '2015-08-26 10:49:13', 'B4C', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(39, 1, '2015-08-26 10:49:13', 'B6B', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(40, 1, '2015-08-26 10:49:13', 'B3C', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(41, 1, '2015-08-26 10:49:13', 'B4B', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(42, 1, '2015-08-26 10:49:13', 'B3B', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(43, 1, '2015-08-26 10:49:06', 'MASSE1', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(44, 1, '2015-08-26 10:49:08', 'QUAISEXP1', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(45, 1, '2015-08-26 10:49:09', 'H1A', NULL, '12', 0, 'depose', '', '', '2015-08-26 10:49:16', '0000-00-00 00:00:00'),
(46, 1, '2015-08-26 10:49:33', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 10:49:35', '0000-00-00 00:00:00'),
(47, 1, '2015-08-26 10:50:01', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-26 10:50:01', '0000-00-00 00:00:00'),
(48, 1, '2015-08-26 10:50:01', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-26 10:50:01', '0000-00-00 00:00:00'),
(49, 1, '2015-08-26 10:50:49', '', NULL, '2', 0, 'passage', '', '', '2015-08-26 10:50:51', '0000-00-00 00:00:00'),
(50, 1, '2015-08-26 10:50:53', '1', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(51, 1, '2015-08-26 10:50:53', 'sdhshds454545sds', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(52, 1, '2015-08-26 10:50:52', 'B4C', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(53, 1, '2015-08-26 10:50:52', 'B6B', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(54, 1, '2015-08-26 10:50:52', 'B3C', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(55, 1, '2015-08-26 10:50:52', 'B4B', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(56, 1, '2015-08-26 10:50:52', 'B3B', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(57, 1, '2015-08-26 10:50:55', 'MASSE1', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(58, 1, '2015-08-26 10:50:53', 'QUAISEXP1', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(59, 1, '2015-08-26 10:50:54', 'H1A', NULL, '2', 0, 'depose', '', '', '2015-08-26 10:50:57', '0000-00-00 00:00:00'),
(60, 1, '2015-08-26 10:52:57', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 10:53:00', '0000-00-00 00:00:00'),
(61, 1, '2015-08-26 10:58:18', '', NULL, '52', 0, 'passage', '', '', '2015-08-26 10:58:20', '0000-00-00 00:00:00'),
(62, 1, '2015-08-26 10:58:23', '1', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(63, 1, '2015-08-26 10:58:23', 'sdhshds454545sds', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(64, 1, '2015-08-26 10:58:24', 'B4C', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(65, 1, '2015-08-26 10:58:24', 'B6B', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(66, 1, '2015-08-26 10:58:24', 'B3C', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(67, 1, '2015-08-26 10:58:24', 'B4B', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(68, 1, '2015-08-26 10:58:24', 'B3B', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(69, 1, '2015-08-26 10:58:20', 'MASSE1', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(70, 1, '2015-08-26 10:58:21', 'QUAISEXP1', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(71, 1, '2015-08-26 10:58:22', 'H1A', NULL, '52', 0, 'depose', '', '', '2015-08-26 10:58:27', '0000-00-00 00:00:00'),
(72, 1, '2015-08-26 10:59:30', '', NULL, '12', 0, 'passage', '', '', '2015-08-26 10:59:33', '0000-00-00 00:00:00'),
(73, 1, '2015-08-26 10:59:58', '', NULL, '25', 0, 'passage', '', '', '2015-08-26 11:00:01', '0000-00-00 00:00:00'),
(74, 1, '2015-08-26 11:01:38', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 11:01:40', '0000-00-00 00:00:00'),
(75, 1, '2015-08-26 11:01:48', '', NULL, '25', 0, 'passage', '', '', '2015-08-26 11:01:51', '0000-00-00 00:00:00'),
(76, 1, '2015-08-26 11:01:51', '1', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(77, 1, '2015-08-26 11:01:51', 'sdhshds454545sds', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(78, 1, '2015-08-26 11:01:50', 'B4C', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(79, 1, '2015-08-26 11:01:50', 'B6B', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(80, 1, '2015-08-26 11:01:50', 'B3C', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(81, 1, '2015-08-26 11:01:50', 'B4B', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(82, 1, '2015-08-26 11:01:50', 'B3B', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(83, 1, '2015-08-26 11:01:54', 'MASSE1', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(84, 1, '2015-08-26 11:01:53', 'QUAISEXP1', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(85, 1, '2015-08-26 11:01:52', 'H1A', NULL, '25', 0, 'depose', '', '', '2015-08-26 11:02:05', '0000-00-00 00:00:00'),
(86, 1, '2015-08-26 11:04:18', '', NULL, '25', 0, 'passage', '', '', '2015-08-26 11:04:19', '0000-00-00 00:00:00'),
(87, 1, '2015-08-26 11:08:59', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 11:09:01', '0000-00-00 00:00:00'),
(88, 1, '2015-08-26 11:09:46', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 11:09:50', '0000-00-00 00:00:00'),
(89, 1, '2015-08-26 11:10:37', 'A2A', NULL, '1', 0, 'prise', 'gr', '', '2015-08-26 11:11:56', '0000-00-00 00:00:00'),
(90, 1, '2015-08-26 11:10:38', 'A1C', NULL, '1', 0, 'prise', 'gr', '', '2015-08-26 11:11:56', '0000-00-00 00:00:00'),
(91, 1, '2015-08-26 11:10:40', 'A2C', NULL, '1', 0, 'prise', 'gr', '', '2015-08-26 11:11:56', '0000-00-00 00:00:00'),
(92, 1, '2015-08-26 11:11:44', 'tst', NULL, '1', 0, 'prise', 'gr', '', '2015-08-26 11:11:56', '0000-00-00 00:00:00'),
(93, 1, '2015-08-26 11:12:10', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 11:12:11', '0000-00-00 00:00:00'),
(94, 1, '2015-08-26 11:13:14', '', NULL, '2', 0, 'passage', '', '', '2015-08-26 11:13:16', '0000-00-00 00:00:00'),
(95, 1, '2015-08-26 11:13:42', '', NULL, '785', 0, 'passage', '', 'Gare vide', '2015-08-26 11:13:43', '0000-00-00 00:00:00'),
(96, 1, '2015-08-26 11:14:01', '', NULL, '54', 0, 'passage', '', '', '2015-08-26 11:14:03', '0000-00-00 00:00:00'),
(97, 1, '2015-08-26 11:14:44', '', NULL, '25', 0, 'passage', '', '', '2015-08-26 11:14:46', '0000-00-00 00:00:00'),
(98, 1, '2015-08-26 11:13:01', 'A2A', NULL, '1', 3, 'depose', '', '', '2015-08-26 11:14:59', '0000-00-00 00:00:00'),
(99, 1, '2015-08-26 11:13:01', 'A1C', NULL, '1', 3, 'depose', '', '', '2015-08-26 11:14:59', '0000-00-00 00:00:00'),
(100, 1, '2015-08-26 11:13:01', 'A2C', NULL, '1', 3, 'depose', '', '', '2015-08-26 11:14:59', '0000-00-00 00:00:00'),
(101, 1, '2015-08-26 11:12:47', 'tst', NULL, '1', 3, 'depose', '', '', '2015-08-26 11:14:59', '0000-00-00 00:00:00'),
(102, 1, '2015-08-26 11:15:02', '', NULL, '52', 0, 'passage', '', '', '2015-08-26 11:15:03', '0000-00-00 00:00:00'),
(103, 1, '2015-08-26 11:15:35', '', NULL, '25', 0, 'passage', '', '', '2015-08-26 11:15:36', '0000-00-00 00:00:00'),
(104, 1, '2015-08-26 11:15:42', '1', NULL, '25', 0, 'prise', 'gr', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(105, 1, '2015-08-26 11:15:43', '2', NULL, '25', 0, 'prise', 'gr', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(106, 1, '2015-08-26 11:15:45', '3', NULL, '25', 0, 'prise', 'gr', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(107, 1, '2015-08-26 11:15:46', '4', NULL, '25', 0, 'prise', 'gr', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(108, 1, '2015-08-26 11:15:49', '5', NULL, '25', 0, 'prise', '', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(109, 1, '2015-08-26 11:15:51', '6', NULL, '25', 0, 'prise', '', '', '2015-08-26 11:15:55', '0000-00-00 00:00:00'),
(110, 1, '2015-08-26 11:16:44', '', NULL, '56', 0, 'passage', '', '', '2015-08-26 11:16:46', '0000-00-00 00:00:00'),
(111, 1, '2015-08-26 11:17:01', '1', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(112, 1, '2015-08-26 11:17:03', '2', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(113, 1, '2015-08-26 11:17:08', '3', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(114, 1, '2015-08-26 11:17:08', '4', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(115, 1, '2015-08-26 11:17:06', '5', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(116, 1, '2015-08-26 11:17:05', '6', NULL, '56', 0, 'depose', '', '', '2015-08-26 11:17:43', '0000-00-00 00:00:00'),
(117, 1, '2015-08-26 11:19:14', '', NULL, '63', 0, 'passage', '', '', '2015-08-26 11:19:17', '0000-00-00 00:00:00'),
(118, 1, '2015-08-26 11:20:04', '1', NULL, '63', 0, 'prise', '', '', '2015-08-26 11:20:32', '0000-00-00 00:00:00'),
(119, 1, '2015-08-26 11:20:18', '2', NULL, '63', 0, 'prise', 'ab', '', '2015-08-26 11:20:32', '0000-00-00 00:00:00'),
(120, 1, '2015-08-26 11:20:19', '3', NULL, '63', 0, 'prise', 'ab', '', '2015-08-26 11:20:32', '0000-00-00 00:00:00'),
(121, 1, '2015-08-26 11:20:21', '4', NULL, '63', 0, 'prise', 'ab', '', '2015-08-26 11:20:32', '0000-00-00 00:00:00'),
(122, 1, '2015-08-26 11:20:38', '', NULL, '63', 0, 'passage', '', '', '2015-08-26 11:20:41', '0000-00-00 00:00:00'),
(123, 1, '2015-08-26 11:21:35', '', NULL, '36', 0, 'passage', '', '', '2015-08-26 11:21:37', '0000-00-00 00:00:00'),
(124, 1, '2015-08-26 11:21:57', '', NULL, '78', 0, 'passage', '', '', '2015-08-26 11:22:00', '0000-00-00 00:00:00'),
(125, 1, '2015-08-26 11:22:03', '2', NULL, '78', 0, 'depose', '', '', '2015-08-26 11:22:24', '0000-00-00 00:00:00'),
(126, 1, '2015-08-26 11:22:06', '3', NULL, '78', 0, 'depose', '', '', '2015-08-26 11:22:24', '0000-00-00 00:00:00'),
(127, 1, '2015-08-26 11:22:06', '4', NULL, '78', 0, 'depose', '', '', '2015-08-26 11:22:24', '0000-00-00 00:00:00'),
(128, 1, '2015-08-26 11:22:26', '', NULL, '336', 0, 'passage', '', '', '2015-08-26 11:22:29', '0000-00-00 00:00:00'),
(129, 1, '2015-08-26 11:22:36', '', NULL, '78', 0, 'passage', '', '', '2015-08-26 11:22:39', '0000-00-00 00:00:00'),
(130, 1, '2015-08-26 11:22:39', '1', NULL, '78', 0, 'depose', '', '', '2015-08-26 11:22:49', '0000-00-00 00:00:00'),
(131, 1, '2015-08-26 11:22:54', '', NULL, '14', 0, 'passage', '', '', '2015-08-26 11:22:56', '0000-00-00 00:00:00'),
(132, 1, '2015-08-26 11:24:09', '', NULL, '1', 0, 'passage', '', '', '2015-08-26 11:24:11', '0000-00-00 00:00:00'),
(133, 1, '2015-08-26 11:24:46', 'RECEPTIONNEUR', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(134, 1, '2015-08-26 11:24:47', 'RECEPTION', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(135, 1, '2015-08-26 11:24:47', 'QUAIREC1', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(136, 1, '2015-08-26 11:24:48', 'CARISTE1', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(137, 1, '2015-08-26 11:24:49', 'CARISTE', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(138, 1, '2015-08-26 11:24:49', 'ECHANTILLON', NULL, '1', 0, 'prise', 'MAGASINIER1', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(139, 1, '2015-08-26 11:24:56', 'B1A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(140, 1, '2015-08-26 11:24:57', 'B2A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(141, 1, '2015-08-26 11:24:58', 'B4A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(142, 1, '2015-08-26 11:24:59', 'B6A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(143, 1, '2015-08-26 11:25:00', 'B5A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(144, 1, '2015-08-26 11:25:00', 'B3A', NULL, '1', 0, 'prise', '', '', '2015-08-26 11:25:08', '0000-00-00 00:00:00'),
(145, 1, '2015-08-26 11:25:12', '', NULL, '2', 0, 'passage', '', '', '2015-08-26 11:25:14', '0000-00-00 00:00:00'),
(146, 1, '2015-08-26 11:25:21', 'RECEPTIONNEUR', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(147, 1, '2015-08-26 11:25:21', 'RECEPTION', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(148, 1, '2015-08-26 11:25:21', 'QUAIREC1', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(149, 1, '2015-08-26 11:25:21', 'CARISTE1', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(150, 1, '2015-08-26 11:25:21', 'CARISTE', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(151, 1, '2015-08-26 11:25:21', 'ECHANTILLON', NULL, '2', 0, 'depose', '', '', '2015-08-26 11:25:27', '0000-00-00 00:00:00'),
(152, 1, '2015-08-26 11:25:28', '', NULL, '3', 0, 'passage', '', '', '2015-08-26 11:25:31', '0000-00-00 00:00:00'),
(153, 1, '2015-08-26 11:25:34', 'B2A', NULL, '3', 0, 'depose', '', '', '2015-08-26 11:25:38', '0000-00-00 00:00:00'),
(154, 1, '2015-08-26 11:25:33', 'B4A', NULL, '3', 0, 'depose', '', '', '2015-08-26 11:25:38', '0000-00-00 00:00:00'),
(155, 1, '2015-08-26 11:25:33', 'B6A', NULL, '3', 0, 'depose', '', '', '2015-08-26 11:25:38', '0000-00-00 00:00:00'),
(156, 1, '2015-08-26 11:25:42', '', NULL, '14', 0, 'passage', '', '', '2015-08-26 11:25:45', '0000-00-00 00:00:00'),
(157, 1, '2015-08-26 11:25:46', 'ASSEMBKITS', NULL, '14', 0, 'prise', '', '', '2015-08-26 11:25:53', '0000-00-00 00:00:00'),
(158, 1, '2015-08-26 11:25:47', 'MASSE1', NULL, '14', 0, 'prise', '', '', '2015-08-26 11:25:53', '0000-00-00 00:00:00'),
(159, 1, '2015-08-26 11:25:47', 'QUAISEXP1', NULL, '14', 0, 'prise', '', '', '2015-08-26 11:25:53', '0000-00-00 00:00:00'),
(160, 1, '2015-08-26 11:25:48', 'H1A', NULL, '14', 0, 'prise', '', '', '2015-08-26 11:25:53', '0000-00-00 00:00:00'),
(161, 1, '2015-08-26 11:25:54', '', NULL, '8', 0, 'passage', '', '', '2015-08-26 11:25:56', '0000-00-00 00:00:00'),
(162, 1, '2015-08-26 11:26:07', 'B1A', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(163, 1, '2015-08-26 11:26:05', 'B5A', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(164, 1, '2015-08-26 11:26:06', 'B3A', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(165, 1, '2015-08-26 11:25:58', 'ASSEMBKITS', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(166, 1, '2015-08-26 11:25:59', 'MASSE1', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(167, 1, '2015-08-26 11:25:59', 'QUAISEXP1', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(168, 1, '2015-08-26 11:26:00', 'H1A', NULL, '8', 0, 'depose', '', '', '2015-08-26 11:26:10', '0000-00-00 00:00:00'),
(169, 1, '2015-08-27 17:55:29', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-27 17:55:29', '0000-00-00 00:00:00'),
(170, 1, '2015-08-27 17:55:29', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-27 17:55:29', '0000-00-00 00:00:00'),
(171, 1, '2015-08-27 17:55:59', 'sdhshds454545sds', NULL, '1598', 0, 'depose', 'test', 'com test', '2015-08-27 17:55:59', '0000-00-00 00:00:00'),
(172, 1, '2015-08-28 08:00:00', 'QWERTY', NULL, 'EMP45', NULL, 'arrivage', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 1, '2015-08-28 09:00:00', 'QWERTY', NULL, 'EMP45', NULL, 'prise', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 1, '2015-08-28 09:00:00', 'QWERTY', NULL, 'EMP45', NULL, 'depose', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 1, '2015-08-31 16:42:47', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:42:47', '0000-00-00 00:00:00'),
(176, 1, '2015-08-31 16:42:47', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:42:47', '0000-00-00 00:00:00'),
(177, 1, '2015-08-31 16:42:47', 'azerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:42:47', '0000-00-00 00:00:00'),
(178, 1, '2015-08-31 16:43:13', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:43:13', '0000-00-00 00:00:00'),
(179, 1, '2015-08-31 16:43:13', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:43:13', '0000-00-00 00:00:00'),
(180, 1, '2015-08-31 16:43:13', 'azerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:43:13', '0000-00-00 00:00:00'),
(181, 1, '2015-08-31 16:45:32', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:45:32', '0000-00-00 00:00:00'),
(182, 1, '2015-08-31 16:45:32', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:45:32', '0000-00-00 00:00:00'),
(183, 1, '2015-08-31 16:45:32', 'azerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:45:32', '0000-00-00 00:00:00'),
(184, 1, '2015-08-31 16:46:10', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:46:10', '0000-00-00 00:00:00'),
(185, 1, '2015-08-31 16:46:10', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:46:10', '0000-00-00 00:00:00'),
(186, 1, '2015-08-31 16:46:10', 'azerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:46:10', '0000-00-00 00:00:00'),
(187, 1, '2015-08-31 16:47:22', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:47:22', '0000-00-00 00:00:00'),
(188, 1, '2015-08-31 16:47:22', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:47:22', '0000-00-00 00:00:00'),
(189, 1, '2015-08-31 16:47:22', 'qwerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:47:22', '0000-00-00 00:00:00'),
(190, 1, '2015-08-31 16:47:49', '1', NULL, '1', 0, 'prise', 'test', 'com test', '2015-08-31 16:47:49', '0000-00-00 00:00:00'),
(191, 1, '2015-08-31 16:47:49', 'sdhshds454545sds', NULL, '1598', 0, 'prise', 'test', 'com test', '2015-08-31 16:47:49', '0000-00-00 00:00:00'),
(192, 1, '2015-08-31 16:47:49', 'qwerty', NULL, '1598', 0, 'depose', '', 'com test', '2015-08-31 16:47:49', '0000-00-00 00:00:00'),
(193, 1, '2015-09-01 09:10:43', 'AZERTY', NULL, 'Réception centrale', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 1, '2015-09-01 09:13:44', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 1, '2015-09-01 09:32:28', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 1, '2015-09-01 09:40:41', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 1, '2015-09-01 09:41:42', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 1, '2015-09-01 09:41:55', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 1, '2015-09-01 09:48:26', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 1, '2015-09-01 09:48:26', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 1, '2015-09-01 09:48:36', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 1, '2015-09-01 09:48:36', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 1, '2015-09-01 09:49:08', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 1, '2015-09-01 09:49:09', 'QWERTY', NULL, 'RC', 0, 'reception', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 1, '2015-09-01 09:50:21', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '2015-09-01 09:50:21', '0000-00-00 00:00:00'),
(206, 1, '2015-09-01 09:50:21', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '2015-09-01 09:50:21', '0000-00-00 00:00:00'),
(207, 1, '2015-09-01 09:50:26', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '2015-09-01 09:50:26', '0000-00-00 00:00:00'),
(208, 1, '2015-09-01 09:50:27', 'AZERTY', NULL, 'RC', 0, 'reception', '', '', '2015-09-01 09:50:27', '0000-00-00 00:00:00'),
(209, 1, '2015-09-01 09:50:54', 'QWERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:50:54', '0000-00-00 00:00:00'),
(210, 1, '2015-09-01 09:50:55', 'QWERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:50:55', '0000-00-00 00:00:00'),
(211, 1, '2015-09-01 09:51:43', 'AZERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:51:43', '0000-00-00 00:00:00'),
(212, 1, '2015-09-01 09:55:44', 'AZERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:51:44', '0000-00-00 00:00:00'),
(213, 1, '2015-09-01 09:52:01', 'QWERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:52:01', '0000-00-00 00:00:00'),
(214, 1, '2015-09-01 09:52:18', 'QWERTY', NULL, 'Réception', 0, 'reception', '', '', '2015-09-01 09:52:18', '0000-00-00 00:00:00'),
(215, 1, '2015-09-01 10:44:20', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 10:44:20', '0000-00-00 00:00:00'),
(216, 0, '2015-09-01 05:00:00', 'AZERTY', NULL, '1', NULL, 'prise', NULL, NULL, '2015-09-01 05:00:05', '0000-00-00 00:00:00'),
(217, 1, '2015-09-01 05:00:00', 'QWERTY', NULL, '1', 0, 'prise', NULL, NULL, '2015-09-01 05:00:02', '0000-00-00 00:00:00'),
(218, 1, '2015-09-01 14:05:32', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:05:32', '0000-00-00 00:00:00'),
(219, 1, '2015-09-01 14:05:50', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:05:50', '0000-00-00 00:00:00'),
(220, 1, '2015-09-01 14:06:35', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:06:35', '0000-00-00 00:00:00'),
(221, 1, '2015-09-01 14:07:44', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:07:44', '0000-00-00 00:00:00'),
(222, 1, '2015-09-01 14:07:58', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:07:58', '0000-00-00 00:00:00'),
(223, 1, '2015-09-01 14:10:09', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:10:09', '0000-00-00 00:00:00'),
(224, 1, '2015-09-01 14:11:26', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:11:26', '0000-00-00 00:00:00'),
(225, 1, '2015-09-01 14:12:17', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:12:17', '0000-00-00 00:00:00'),
(226, 1, '2015-09-01 14:13:12', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 14:13:12', '0000-00-00 00:00:00'),
(227, 1, '2015-09-01 17:58:19', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 17:58:19', '0000-00-00 00:00:00'),
(228, 1, '2015-09-01 17:58:34', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 17:58:34', '0000-00-00 00:00:00'),
(229, 1, '2015-09-01 17:59:55', 'AZERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-01 17:59:55', '0000-00-00 00:00:00'),
(230, 1, '2015-09-02 09:25:42', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:25:42', '0000-00-00 00:00:00'),
(231, 1, '2015-09-02 09:55:00', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:55:00', '0000-00-00 00:00:00'),
(232, 1, '2015-09-02 09:55:07', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:55:07', '0000-00-00 00:00:00'),
(233, 1, '2015-09-02 09:57:27', 'QWERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:57:27', '0000-00-00 00:00:00'),
(234, 1, '2015-09-02 09:58:05', 'AZERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:58:05', '0000-00-00 00:00:00'),
(235, 1, '2015-09-02 09:58:56', 'AZERTY', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:58:56', '0000-00-00 00:00:00'),
(236, 1, '2015-09-02 09:59:23', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 09:59:23', '0000-00-00 00:00:00'),
(237, 1, '2015-09-02 10:00:48', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 10:00:48', '0000-00-00 00:00:00'),
(238, 1, '2015-09-02 10:01:10', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 10:01:10', '0000-00-00 00:00:00'),
(239, 1, '2015-09-02 12:11:45', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 12:11:45', '0000-00-00 00:00:00'),
(240, 1, '2015-09-02 12:11:50', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 12:11:50', '0000-00-00 00:00:00'),
(241, 1, '2015-09-02 12:11:55', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 12:11:55', '0000-00-00 00:00:00'),
(242, 1, '2015-09-02 12:12:02', 'qwerty', NULL, 'Réception', 0, 'réception', '', '', '2015-09-02 12:12:02', '0000-00-00 00:00:00'),
(243, 1, '2015-09-03 10:05:45', 'QWERTY', 'asdsfglhsdjv45f4', 'Réception', 0, 'réception', '', '', '2015-09-03 10:05:45', '0000-00-00 00:00:00'),
(244, 1, '2015-09-03 10:49:23', 'QWERTY', 'dfdfdf', 'Réception', 0, 'réception', '', '', '2015-09-03 10:49:23', '0000-00-00 00:00:00'),
(245, 1, '2015-09-03 14:25:16', 'qwerty', 'sdsdsd', 'Réception', 0, 'réception', '', '', '2015-09-03 14:25:16', '0000-00-00 00:00:00'),
(246, 1, '2015-09-03 14:26:22', 'qwerty', '1111111', 'Réception', 0, 'réception', '', '', '2015-09-03 14:26:22', '0000-00-00 00:00:00'),
(247, 10, '2015-09-04 12:00:34', 'qwerty', 'er', 'Réception', 0, 'réception', '', '', '2015-09-04 12:00:34', '0000-00-00 00:00:00'),
(248, 1, '2015-09-04 12:22:29', 'qwerty', 'fgfgffg', 'Réception', 0, 'réception', '', '', '2015-09-04 12:22:29', '0000-00-00 00:00:00'),
(249, 1, '2015-09-04 12:24:02', 'qwerty', '222', 'Réception', 0, 'réception', '', '', '2015-09-04 12:24:02', '0000-00-00 00:00:00'),
(250, 10, '2015-09-04 12:30:59', 'qwerty', 's', 'Réception', 0, 'réception', '', '', '2015-09-04 12:30:59', '0000-00-00 00:00:00'),
(251, 1, '2015-09-16 15:15:10', 'sadfgASDFGasdfgaas', 'S1509161502551', 'Réception', 0, 'depose', '', '', '2015-09-16 15:15:10', '0000-00-00 00:00:00'),
(252, 1, '2015-09-17 10:35:47', '741258963', 'C1509171034571', 'Réception', 0, 'depose', '', '', '2015-09-17 10:35:47', '0000-00-00 00:00:00'),
(253, 1, '2015-09-17 10:35:59', '963258741', 'C1509171034572', 'Réception', 0, 'depose', '', '', '2015-09-17 10:35:59', '0000-00-00 00:00:00'),
(254, 1, '2015-09-17 10:36:08', '852147963', 'C1509171034573', 'Réception', 0, 'depose', '', '', '2015-09-17 10:36:08', '0000-00-00 00:00:00'),
(255, 1, '2015-09-17 10:36:17', '789654123', 'C1509171034574', 'Réception', 0, 'depose', '', '', '2015-09-17 10:36:17', '0000-00-00 00:00:00');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ref_chauffeur`
--
ALTER TABLE `ref_chauffeur`
  ADD CONSTRAINT `fk_chauffeur_transporteur` FOREIGN KEY (`id_transporteur`) REFERENCES `ref_transporteur` (`id_transporteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD CONSTRAINT `sf_guard_user_group_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_group_ibfk_6` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wrk_arrivage`
--
ALTER TABLE `wrk_arrivage`
  ADD CONSTRAINT `fk_arrivage_nature` FOREIGN KEY (`id_nature`) REFERENCES `ref_nature` (`id_nature`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `wrk_arrivage_produit`
--
ALTER TABLE `wrk_arrivage_produit`
  ADD CONSTRAINT `fk_arrivage_produit` FOREIGN KEY (`id_arrivage`) REFERENCES `wrk_arrivage` (`id_arrivage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
