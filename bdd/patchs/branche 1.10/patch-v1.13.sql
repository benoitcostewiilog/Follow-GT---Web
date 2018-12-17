--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.13
--	Commentaire : Ajout champ id_utilisateur dans la table wrkArrivageProduit
--  --------------------------------

ALTER TABLE `wrk_arrivage_produit` ADD `id_utilisateur` INT( 11 ) NULL AFTER `id_nature`;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.13' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;