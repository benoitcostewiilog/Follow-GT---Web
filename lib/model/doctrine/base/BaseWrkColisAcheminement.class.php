<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('WrkColisAcheminement', 'doctrine');

/**
 * BaseWrkColisAcheminement
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id_colis
 * @property integer $id_acheminement
 * @property string $tracking
 * @property integer $numero_colis
 * @property string $designation
 * @property string $statut
 * @property timestamp $updated_at
 * @property timestamp $created_at
 * @property WrkAcheminement $WrkAcheminement
 * 
 * @method integer              getId_colIs()        Returns the current record's "id_colis" value
 * @method integer              getId_achemInement() Returns the current record's "id_acheminement" value
 * @method string               getTracking()        Returns the current record's "tracking" value
 * @method integer              getNumero_colis()    Returns the current record's "numero_colis" value
 * @method string               getDesignation()     Returns the current record's "designation" value
 * @method string               getStatut()          Returns the current record's "statut" value
 * @method timestamp            getUpdated_at()      Returns the current record's "updated_at" value
 * @method timestamp            getCreated_at()      Returns the current record's "created_at" value
 * @method WrkAcheminement      getWrkAcheminement() Returns the current record's "WrkAcheminement" value
 * @method WrkColisAcheminement setId_colIs()        Sets the current record's "id_colis" value
 * @method WrkColisAcheminement setId_achemInement() Sets the current record's "id_acheminement" value
 * @method WrkColisAcheminement setTracking()        Sets the current record's "tracking" value
 * @method WrkColisAcheminement setNumero_colis()    Sets the current record's "numero_colis" value
 * @method WrkColisAcheminement setDesignation()     Sets the current record's "designation" value
 * @method WrkColisAcheminement setStatut()          Sets the current record's "statut" value
 * @method WrkColisAcheminement setUpdated_at()      Sets the current record's "updated_at" value
 * @method WrkColisAcheminement setCreated_at()      Sets the current record's "created_at" value
 * @method WrkColisAcheminement setWrkAcheminement() Sets the current record's "WrkAcheminement" value
 * 
 * @package    MobileStockV3
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseWrkColisAcheminement extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('wrk_colis_acheminement');
        $this->hasColumn('id_colis', 'integer', 11, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             'length' => 11,
             ));
        $this->hasColumn('id_acheminement', 'integer', 11, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 11,
             ));
        $this->hasColumn('tracking', 'string', 45, array(
             'type' => 'string',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 45,
             ));
        $this->hasColumn('numero_colis', 'integer', 11, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 11,
             ));
        $this->hasColumn('designation', 'string', 100, array(
             'type' => 'string',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 100,
             ));
        $this->hasColumn('statut', 'string', 100, array(
             'type' => 'string',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => false,
             'autoincrement' => false,
             'length' => 100,
             ));
        $this->hasColumn('updated_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 25,
             ));
        $this->hasColumn('created_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => 25,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('WrkAcheminement', array(
             'local' => 'id_acheminement',
             'foreign' => 'id_acheminement'));
    }
}