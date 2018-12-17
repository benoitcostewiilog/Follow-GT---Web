--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.20
--	Commentaire : ajout permission statistiques
--  --------------------------------


INSERT INTO `sf_guard_permission` (
`id` ,
`name` ,
`description` ,
`created_at` ,
`updated_at`
)
VALUES (
NULL , 'statistiques', NULL , '',
CURRENT_TIMESTAMP
);

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.20' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;