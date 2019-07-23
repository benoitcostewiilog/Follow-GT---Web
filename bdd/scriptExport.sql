-- DEBUT REQUETE

TRUNCATE TABLE `exp_kpi` ;	

-- 01 unit br rec avec les plages de dates en params	
INSERT INTO exp_kpi (unite_tracking, br_sap, date_reception)
SELECT ref_produit, br_sap, created_at
FROM wrk_mouvement
WHERE wrk_mouvement.created_at < '2016-09-01%'
AND wrk_mouvement.created_at > '2016-08-01 00:00:00'	
AND wrk_mouvement.code_emplacement = 'Réception';

-- 02 Arrivage	
UPDATE exp_kpi ek, wrk_arrivage_produit wap 
SET ek.date_arrivage = wap.created_at
WHERE wap.ref_produit = ek.br_sap
AND ek.br_sap <> 'Absent'
AND wap.br_sap IS NULL; 	
	
-- 03 Dépose	
UPDATE exp_kpi ek SET ek.date_depose = 
(
	SELECT wm.created_at
	FROM wrk_mouvement wm
	WHERE wm.ref_produit = ek.unite_tracking
	AND wm.type = 'depose'
	AND wm.code_emplacement <> 'Réception'
	ORDER BY wm.created_at DESC
	LIMIT 1
);
	
-- Flux 1
UPDATE exp_kpi
  SET flux_1 = CASE 
    WHEN date_arrivage IS NULL THEN '0'
    ELSE '1'
  END; 
	
-- Flux 2	
UPDATE exp_kpi
  SET flux_2 = CASE 
    WHEN date_depose IS NULL THEN '0'
    ELSE '1'
  END; 
	
-- Flux complet	
UPDATE exp_kpi
  SET flux_complet = CASE 
    WHEN (flux_1 = 1 AND flux_2 = 1) THEN '1'
    ELSE '0'
  END; 	
  
-- Jour ouvrés Flux 1
UPDATE exp_kpi SET nb_jo_1 = ( DATEDIFF( date_reception, date_arrivage ) - ( WEEK( date_reception ) - WEEK( date_arrivage ) ) *2 ) +1 ;
  
-- Jour ouvrés Flux 2
UPDATE exp_kpi SET nb_jo_2 = ( DATEDIFF( date_depose, date_reception ) - ( WEEK( date_depose ) - WEEK( date_reception ) ) *2 ) +1 ;

-- Delais 1 
SELECT `date_arrivage`,`date_reception`, TIMEDIFF( `date_reception` , `date_arrivage` ) FROM exp_kpi; -- duree entre de timestamp
  
  
SELECT TIMEDIFF( '2017/04/03 09:04' ,'2017/03/31 17:46'  );

SET GLOBAL log_bin_trust_function_creators = 1;  
  
SELECT `WORKDAY_TIME_DIFF_HOLIDAY_TABLE` (
'ALL', '2016-07-29 12:29:42', '2016-08-01 07:03:09', '07:00', '17:00'
) /60  
  
  
  
  
  