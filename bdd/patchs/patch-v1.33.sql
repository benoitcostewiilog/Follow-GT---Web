--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.33
--	Commentaire : ajout parametrage nomade
--  --------------------------------
ALTER TABLE `adm_supervision_parametrage` CHANGE `nom` `nom` VARCHAR( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ;

INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES
(18, 'input_method_emplacement_scan', NULL, '1', '0000-00-00 00:00:00', NOW( )),
(17, 'input_method_emplacement_input', NULL, '0', '0000-00-00 00:00:00', NOW( )),
(16, 'input_method_emplacement_list', NULL, '1', '0000-00-00 00:00:00', NOW( )),
(15, 'first_input_method_emplacement', NULL, 'scan', '0000-00-00 00:00:00', NOW( ));

UPDATE `adm_supervision_parametrage` SET `valeur` = 'http://test-gt.mobilestock.fr/uploads/FollowGT-v0.8.apk',`updated_at` = NOW( ) WHERE `adm_supervision_parametrage`.`id` =12;
UPDATE `adm_supervision_parametrage` SET `valeur` = '18',`updated_at` = NOW( ) WHERE `adm_supervision_parametrage`.`id` =13;
UPDATE `adm_supervision_parametrage` SET `valeur` = '1',`updated_at` = NOW( ) WHERE `adm_supervision_parametrage`.`id` =10;
UPDATE `wrk_mouvement` SET `updated_at` = NOW( ) LIMIT 5;
UPDATE `wrk_inventaire` SET `updated_at` = NOW( );

ALTER TABLE `wrk_mouvement` ENGINE = MYISAM;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.33' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;