-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 06 Décembre 2018 à 09:20
-- Version du serveur :  5.6.17-log
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
-- Structure de la vue `v_mouvement_retard`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mouvement_retard` AS select `m`.`id_mouvement` AS `id_mouvement`,`m`.`ref_produit` AS `ref_produit`,`m`.`heure_prise` AS `heure_prise`,`m`.`type` AS `type`,`m`.`code_emplacement` AS `code_emplacement`,`m`.`groupe` AS `groupe`,timestampdiff(SECOND,addtime(`m`.`heure_prise`,`n`.`delais`),now()) AS `secondes` from ((`wrk_mouvement` `m` join `wrk_arrivage_produit` `ap` on((`ap`.`br_sap` = convert(`m`.`ref_produit` using utf8)))) join `ref_nature` `n` on((`n`.`id_nature` = `ap`.`id_nature`)));

--
-- VIEW  `v_mouvement_retard`
-- Données :  Aucune
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
