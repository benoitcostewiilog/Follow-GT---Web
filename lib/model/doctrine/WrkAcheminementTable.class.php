<?php

/**
 * WrkAcheminementTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class WrkAcheminementTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object WrkAcheminementTable
     */
    public static function getInstance() {
        return Doctrine_Core::getTable('WrkAcheminement');
    }

    public function getAcheminements() {
        return $this->createQuery()->select('a.*,e1.*,e2.*')->from('WrkAcheminement a')
                        ->leftJoin('a.RefEmplacementPrise e1')
                        ->leftJoin('a.RefEmplacementDepose e2')
                        ->execute();
    }

}