--Permet de calculer si une UM est en retard, par rapport a son heure de prise et l'heure courante

CREATE VIEW `v_mouvement_retard` AS select `m`.`id_mouvement` AS `id_mouvement`,`m`.`ref_produit` AS `ref_produit`,`m`.`heure_prise` AS `heure_prise`,`m`.`type` AS `type`,`m`.`code_emplacement` AS `code_emplacement`,`m`.`groupe` AS `groupe`,timestampdiff(SECOND,addtime(`m`.`heure_prise`,`n`.`delais`),now()) AS `secondes` 
from ((`wrk_mouvement` `m` 
join `wrk_arrivage_produit` `ap` on((`ap`.`br_sap` = convert(`m`.`ref_produit` using utf8)))) 
join `ref_nature` `n` on((`n`.`id_nature` = `ap`.`id_nature`)));
