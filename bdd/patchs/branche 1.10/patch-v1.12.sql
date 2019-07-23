--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.12
--	Commentaire : Ajout table acheminement
--  --------------------------------


CREATE TABLE IF NOT EXISTS `wrk_acheminement` (
  `id_acheminement` int(11) NOT NULL AUTO_INCREMENT,
  `ref_produit` varchar(45) DEFAULT NULL,
  `code_emplacement_prise` varchar(100) NOT NULL,
  `code_emplacement_depose` varchar(100) NOT NULL,
  `delais` varchar(45) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_fait` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_acheminement`),
  KEY `fk_acheminement_emplacement_idx` (`id_acheminement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'acheminement', 'Droit sur les acheminments', '', CURRENT_TIMESTAMP);

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.12' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;