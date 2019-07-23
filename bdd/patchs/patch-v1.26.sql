--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.26
--	Commentaire : ajout chp demandeur wrkAcheminement
--  --------------------------------

ALTER TABLE `wrk_acheminement` ADD `demandeur` VARCHAR( 45 ) NULL ;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.26' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;