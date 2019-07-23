--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.17
--	Commentaire : ajout du widget processus reception
--  --------------------------------

INSERT INTO `ref_widget` (`id_widget` ,`name` ,`created_at` ,`updated_at`) VALUES (NULL , 'Processus de réception', '', '0000-00-00 00:00:00');


UPDATE `adm_supervision_parametrage` SET `valeur` = '1.17' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;