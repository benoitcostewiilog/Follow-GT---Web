--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.14
--	Commentaire : Ajout des tables ref_widget et de l'association widget group
--  --------------------------------

CREATE TABLE IF NOT EXISTS `ref_widget` (
  `id_widget` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_widget`)
) ENGINE=InnoDB ;

CREATE TABLE IF NOT EXISTS `wrk_group_widget` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `id_widget` int(11) NOT NULL DEFAULT '0',
  `ordre` int(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`id_widget`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`id_widget`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `wrk_group_widget`
 ADD CONSTRAINT `fk_widget_widget` FOREIGN KEY (`id_widget`) REFERENCES `ref_widget` (`id_widget`) ON DELETE CASCADE ON UPDATE CASCADE,
 ADD CONSTRAINT `fk_widget_group` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `ref_widget` CHANGE `updated_at` `updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.14' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;