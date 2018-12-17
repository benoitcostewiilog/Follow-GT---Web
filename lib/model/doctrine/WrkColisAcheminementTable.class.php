<?php

/**
 * WrkColisAcheminementTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class WrkColisAcheminementTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object WrkColisAcheminementTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('WrkColisAcheminement');
    }
    
    /* Créer les colis d'un acheminement */
    public function createColisAcheminement($nbColis, WrkAcheminement $acheminement){
        
        $numTracking = 'TRC' . $acheminement->getNumAcheminement();
        
        for($i = 1; $i <= $nbColis; $i++){
                    
            $colis = new WrkColisAcheminement();
            $colis->setIdAcheminement($acheminement->getIdAcheminement());
            $colis->setTracking($numTracking.$i);
            $colis->setNumeroColis($i);
            $colis->setStatut('initial');
            $colis->setCreatedAt(date('Y-m-d H:i:s'));
            $colis->save();
        }
            
    }
    
    /* Supprime tous les colis d'un acheminement */
    public function deleteColisAcheminement(WrkAcheminement $acheminement){
        
        $con = Doctrine_Manager::getInstance()->connection();
        $req = $con->execute("DELETE FROM wrk_colis_acheminement WHERE id_acheminement = '".$acheminement->getIdAcheminement()."'");
           
    }
}