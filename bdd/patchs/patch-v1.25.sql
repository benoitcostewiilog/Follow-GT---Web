--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.25
--	Commentaire : permission modification acheminement
--  --------------------------------

INSERT INTO `sf_guard_permission` (`id` ,`name` ,`description` ,`created_at` ,`updated_at`)
VALUES (NULL ,  'acheminement-modification',  'Permet de modifier un acheminement ',  '', CURRENT_TIMESTAMP);

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.25' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;