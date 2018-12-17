--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.31
--	Commentaire : ajout table export KPI retard  + ajout chp statu achm_colis
--  --------------------------------

CREATE TABLE IF NOT EXISTS `exp_kpi_retard` (
  `num_arrivage` varchar(45) DEFAULT NULL,
  `date_arrivage` varchar(45) DEFAULT NULL,
  `zone_attente1` varchar(45) DEFAULT NULL,
  `date_attente1` varchar(45) DEFAULT NULL,
  `unite_tracking` varchar(45) DEFAULT NULL,
  `date_reception` varchar(45) DEFAULT NULL,
  `zone_attente2` varchar(45) DEFAULT NULL,
  `date_attente2` varchar(45) DEFAULT NULL,  
  `date_depose` varchar(45) DEFAULT NULL,  
  `zone_depose` varchar(45) DEFAULT NULL,
  `date_depose_suivante` varchar(45) DEFAULT NULL,  
  `delai_brut` time DEFAULT NULL,
  `delai` time DEFAULT NULL,
  `retard` time DEFAULT NULL,
  `retard_A` time DEFAULT NULL,
  `retard_B` time DEFAULT NULL,
  `retard_C` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

ALTER TABLE `exp_kpi_retard` CHANGE `date_arrivage` `date_arrivage` DATETIME NULL DEFAULT NULL ,
CHANGE `date_attente1` `date_attente1` DATETIME NULL DEFAULT NULL ,
CHANGE `date_reception` `date_reception` DATETIME NULL DEFAULT NULL ,
CHANGE `date_attente2` `date_attente2` DATETIME NULL DEFAULT NULL ,
CHANGE `date_depose` `date_depose` DATETIME NULL DEFAULT NULL ,
CHANGE `date_depose_suivante` `date_depose_suivante` DATETIME NULL DEFAULT NULL ;

ALTER TABLE `wrk_colis_acheminement` ADD `statut` VARCHAR( 100 ) NULL AFTER `designation` ;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.31' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;