--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.15
--	Commentaire : Ajout des donnees pour les widgets
--  --------------------------------

INSERT INTO `ref_widget` ( `id_widget` , `name` , `created_at` )
VALUES ( 1, 'Arrivages (UM)', '0000-00-00 00:00:00' ) , 
( 2, 'Réceptions (UM)', '0000-00-00 00:00:00' ) , 
( 3, 'Unités de tracking en retard', '0000-00-00 00:00:00' );

--Permet d'optimiser le calcul des retards
ALTER TABLE `wrk_mouvement` ADD INDEX ( `ref_produit` ) 

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.15' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;