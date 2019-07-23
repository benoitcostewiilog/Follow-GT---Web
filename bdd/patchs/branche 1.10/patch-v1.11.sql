--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.11
--	Commentaire : Ajout table parametrage, jour feries, parametre version BDD
--  --------------------------------

CREATE TABLE IF NOT EXISTS `adm_supervision_parametrage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `description` longtext,
  `valeur` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`) VALUES
(1, 'version_BDD', '', '1.11');


CREATE TABLE IF NOT EXISTS `ref_ferie` (
  `id_ferie` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ferie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ref_horaire` (
  `id_horaire` int(4) NOT NULL AUTO_INCREMENT,
  `jour` int(1) NOT NULL,
  `fermer` TINYINT(1) NOT NULL,
  `heure_debut` time NULL DEFAULT NULL,
  `heure_fin` time NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL ,
  `updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_horaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


UPDATE `adm_supervision_parametrage` SET `valeur` = '1.11' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;