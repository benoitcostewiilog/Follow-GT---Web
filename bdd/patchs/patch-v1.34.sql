--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.34
--	Commentaire : ajout droit acheminement
--  --------------------------------

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (NULL, 'acheminement-sans-export', NULL, '', CURRENT_TIMESTAMP);

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.34' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;