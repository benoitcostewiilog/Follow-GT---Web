--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch1.27-v1.30
--	Commentaire : ajout de permission pour les stats
--              : ajout chp destinataire wrkAcheminement
--              : ajout table wrk_colis_acheminement
--	            : ajout des parametres pour la nouvelle application nomade
--              : creation table de synchro, ajout champ quantite sur mouvement, groupe, inventaire
--              : ajout id sur ref_emplacement, ajout CURRENT_TIMESTAMP updated_at wrk_mouvement
--	            : ajout de permission pour la borne d'accueil
--  --------------------------------


ALTER TABLE `wrk_acheminement` ADD `destinataire` VARCHAR( 45 ) NULL AFTER `demandeur` ;

CREATE TABLE IF NOT EXISTS `wrk_colis_acheminement` (
  `id_colis` int(11) NOT NULL AUTO_INCREMENT,
  `id_acheminement` int(11) NOT NULL,
  `tracking` varchar(45) NOT NULL,
  `numero_colis` int(11) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_colis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `tables` (
  `name` varchar(255) DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `nbRow` int(11) DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


ALTER TABLE `wrk_mouvement` ADD `quantite` INT(4) NULL DEFAULT NULL AFTER `commentaire`;
ALTER TABLE `wrk_groupe` ADD `quantite` INT(4) NULL DEFAULT NULL AFTER `id_utilisateur`;
ALTER TABLE `wrk_inventaire` ADD `quantite` INT(4) NULL DEFAULT NULL AFTER `code_emplacement`;
ALTER TABLE `adm_supervision_parametrage` CHANGE `valeur` `valeur` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES
(2, 'type_passage', NULL, '[{ "id": 1, "text": "Gare vide", "icon": "ios-cube-outline", "value": "Gare vide" },{ "id": 2, "text": "Navette pleine", "icon": "ios-cube", "value": "Navette pleine" }]', '0000-00-00 00:00:00', '2017-10-04 15:46:05');
ALTER TABLE `ref_emplacement` DROP PRIMARY KEY;
ALTER TABLE `ref_emplacement` ADD `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES 
(NULL, 'gestion_emplacement', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP), 
(NULL, 'auto_create_emplacement', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'logout_possible_prise', NULL, '0', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'domaine_connexion', NULL, 'Ratier Figeac', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES 
(NULL, 'show_colis_en_prise', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP), 
(NULL, 'vidage_um_prise_produit', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'vidage_um_depose_um', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'scan_depose_obligatoire', NULL, '0', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'toggle_vidage_complet_um', NULL, '1', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
ALTER TABLE `wrk_mouvement` CHANGE `updated_at` `updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL; 
ALTER TABLE `ref_emplacement` CHANGE `updated_at` `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL; 
ALTER TABLE `wrk_inventaire` CHANGE `updated_at` `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL; 
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'url_download_apk', NULL, 'http://test-gt.mobilestock.fr/uploads/GTracking.apk', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'version_nomade', NULL, '5', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);
INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES (NULL, 'depose_produit_non_pris', NULL, '0', '0000-00-00 00:00:00', CURRENT_TIMESTAMP);


INSERT INTO `sf_guard_permission` (`id`,`name`,`description`,`created_at`,`updated_at`)VALUES (NULL ,'borne-arrivage', NULL, '',CURRENT_TIMESTAMP), (NULL, 'borne-expedition', NULL , '',CURRENT_TIMESTAMP);
INSERT INTO `sf_guard_permission` (`id`,`name`,`description`,`created_at`,`updated_at`)VALUES (NULL ,'statistiques-retard', NULL, '',CURRENT_TIMESTAMP), (NULL, 'statistiques-globale', NULL , '',CURRENT_TIMESTAMP);

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.30' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;