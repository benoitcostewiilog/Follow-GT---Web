--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.32
--	Commentaire : ajout Widget et parametres
--  --------------------------------

INSERT INTO `adm_supervision_parametrage` (`id`, `nom`, `description`, `valeur`, `created_at`, `updated_at`) VALUES
(19, 'delai_retard_A ', NULL, '03:30:00', '0000-00-00 00:00:00', '2017-11-16 11:24:13'),
(20, 'delai_retard_B', NULL, '01:30:00', '0000-00-00 00:00:00', '2017-11-16 11:24:13'),
(21, 'delai_retard_C', NULL, '01:00:00', '0000-00-00 00:00:00', '2017-11-16 11:24:34');

INSERT INTO `ref_widget` (`id_widget`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Arrivages en retard', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Réception en retard', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Dépose en retard', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.32' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;