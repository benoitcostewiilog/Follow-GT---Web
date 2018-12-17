--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.22
--	Commentaire : creation table export KPI
--  --------------------------------

CREATE TABLE IF NOT EXISTS `exp_kpi` (
  `unite_tracking` varchar(45) DEFAULT NULL,
  `br_sap` varchar(45) DEFAULT NULL,
  `date_douane` varchar(45) DEFAULT NULL,
  `date_arrivage` varchar(45) DEFAULT NULL,
  `date_reception` varchar(45) DEFAULT NULL,
  `date_depose` varchar(45) DEFAULT NULL,
  `flux_1` varchar(45) DEFAULT NULL,
  `nb_jo_1` varchar(45) DEFAULT NULL,
  `delai_1` time DEFAULT NULL,
  `flux_2` varchar(45) DEFAULT NULL,
  `nb_jo_2` varchar(45) DEFAULT NULL,
  `delai_2` time DEFAULT NULL,
  `flux_complet` varchar(45) DEFAULT NULL,
  `delai_total` time DEFAULT NULL,
  `prochain_jo` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



UPDATE `adm_supervision_parametrage` SET `valeur` = '1.22' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;