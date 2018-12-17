<?php

/**
 * WrkInventaireTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class WrkInventaireTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object WrkInventaireTable
     */
    public static function getInstance() {
        return Doctrine_Core::getTable('WrkInventaire');
    }

    public function getInventaires($heureDebut = '', $heureFin = '', $emplacement = '', $reference = '') {
        $req = $this->createQuery()
                ->select('w.*,e.*')
                ->from('WrkInventaire w')
                ->leftJoin('w.RefEmplacement e')
                ->orderBy('w.heure_prise desc');
        if ($heureDebut != '') {
            $req->andWhere('w.heure_prise >=?', $heureDebut);
        }
        if ($heureFin != '') {
            $req->andWhere('w.heure_prise <=?', $heureFin);
        }
        if ($emplacement != '') {
            $req->andWhere('w.code_emplacement = ?', $emplacement);
        }
        if ($reference != '') {
            $subReq = $this->createQuery()->select('i2.code_emplacement')->from('wrk_inventaire i2')->where('i2.ref_produit = ?', $reference);
            $req->andWhere('w.code_emplacement IN(' . $subReq->getDql() . ')', $reference);
        }

        $inventaires = $req->execute();
        $emplacement = array();
        foreach ($inventaires as $inventaire) {
            if (!isset($emplacement[$inventaire->getCodeEmplacement()])) {
                $emplacement[$inventaire->getCodeEmplacement()] = array();
            }
            if (!isset($emplacement[$inventaire->getCodeEmplacement()][$inventaire->getHeurePrise()])) {
                $emplacement[$inventaire->getCodeEmplacement()][$inventaire->getHeurePrise()] = array();
            }
            if (!isset($emplacement[$inventaire->getCodeEmplacement()][$inventaire->getHeurePrise()][$inventaire->getIdUtilisateur()])) {
                $emplacement[$inventaire->getCodeEmplacement()][$inventaire->getHeurePrise()][$inventaire->getIdUtilisateur()] = array();
            }
            $emplacement[$inventaire->getCodeEmplacement()][$inventaire->getHeurePrise()][$inventaire->getIdUtilisateur()][] = $inventaire->getRefProduit();
        }

        return $emplacement;
    }

    /**
     * Retourne la date du dernier inventaire ou la date du jour si il n'y a pas d'inventaire
     * @return type
     */
    public function getDernierInventaireDate() {
        $dateArray = $this->createQuery()
                ->select('MAX(DATE(i.heure_prise))')
                ->from('WrkInventaire i')
                ->fetchArray();

        if (count($dateArray) > 0) {
            return date('d/m/Y', strtotime($dateArray[0]['MAX']));
        }
        return date('d/m/Y');
    }
    
    /* Retourne les déposes non reprises sur un emplacement */
    public function getDeposeEmplacement($heureDebut = '', $heureFin = '', $emplacement = ''){

        $db = Doctrine_Manager::getInstance()->connection();

        $result = $db->execute("SELECT * FROM wrk_mouvement m 
                 WHERE m.code_emplacement = '$emplacement' AND m.type='depose' AND m.heure_prise >= (SELECT MAX(m2.heure_prise) FROM wrk_mouvement m2 WHERE m2.ref_produit=m.ref_produit) 
                 AND m.heure_prise >= '$heureDebut' 
                 AND m.heure_prise <= '$heureFin'");

        $res = $result->fetchAll();

        return $res;
    }
        
}