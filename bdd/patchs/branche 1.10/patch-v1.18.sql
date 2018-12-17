--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.18
--	Commentaire : insertion d une permission en ecriture sur les expeditions, mouvements, reception
--  --------------------------------

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'expedition-ecriture', NULL, '', CURRENT_TIMESTAMP); 
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'mouvements-ecriture', NULL, '', CURRENT_TIMESTAMP); 
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'reception-ecriture', NULL, '', CURRENT_TIMESTAMP); 

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.18' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;