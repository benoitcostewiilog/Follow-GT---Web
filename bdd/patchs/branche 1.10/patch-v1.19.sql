--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.19
--	Commentaire : creation de la table destinataire acheminement
--  --------------------------------

CREATE TABLE IF NOT EXISTS `ref_destinataire_acheminement` (
  `id_destinataire_acheminement` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_destinataire_acheminement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'destinataire-acheminement', NULL, '', CURRENT_TIMESTAMP); 

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.19' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;