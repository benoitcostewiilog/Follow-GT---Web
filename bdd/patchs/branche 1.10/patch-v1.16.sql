--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.16
--	Commentaire : Modification de wrk_arrivage_produit pour permettre de mettre un id_arrivage a NULL, rajout d'index sur la table wrk_arrivage_produit pour optimiser les requetes, insertion d'une permission en ecriture sur les arrivages
--  --------------------------------

ALTER TABLE `wrk_arrivage_produit` CHANGE `id_arrivage` `id_arrivage` INT(11) NULL;
ALTER TABLE `wrk_arrivage_produit` ADD INDEX(`br_sap`);
ALTER TABLE `wrk_arrivage_produit` ADD INDEX ( `ref_produit` );

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'arrivage-ecriture', NULL, '', CURRENT_TIMESTAMP); 

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.16' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;