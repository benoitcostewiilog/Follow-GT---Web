--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.21
--	Commentaire : modification table acheminement
--  --------------------------------


ALTER TABLE `wrk_acheminement` ADD `num_acheminement` VARCHAR( 45 ) NULL AFTER `id_acheminement` ,
ADD `suffix_colis` INT( 11 ) NULL AFTER `num_acheminement` ,
ADD `nb_colis` INT( 11 ) NULL AFTER `suffix_colis` ;
ALTER TABLE `wrk_acheminement` CHANGE `updated_at` `updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ;
ALTER TABLE `wrk_acheminement` ADD `tracking` VARCHAR( 45 ) NULL AFTER `nb_colis` ;
ALTER TABLE `wrk_acheminement` ADD `statut` VARCHAR( 45 ) NULL AFTER `date_fait` ;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.21' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;