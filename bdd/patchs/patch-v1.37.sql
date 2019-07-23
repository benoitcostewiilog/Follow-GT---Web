--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.36
--	Commentaire : 
--  --------------------------------


ALTER TABLE `wrk_mouvement` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);

ALTER TABLE `adm_supervision_parametrage` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);

ALTER TABLE `ref_emplacement` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);


ALTER TABLE `sf_guard_user` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);


ALTER TABLE `wrk_groupe` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);

ALTER TABLE `wrk_inventaire` ADD `sync_id` VARCHAR( 50 ) NULL DEFAULT NULL ,
ADD UNIQUE (
`sync_id`
);


UPDATE `adm_supervision_parametrage` SET `valeur` = '1.37' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;