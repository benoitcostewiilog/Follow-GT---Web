<?php

/**
 * arrivage actions.
 *
 * @package    MobileStockV3
 * @subpackage arrivage
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class arrivageActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        $this->initList($request);
        $this->fournisseurs = RefFournisseurTable::getInstance()->findAll();
        $this->transporteurs = RefTransporteurTable::getInstance()->findAll();
    }

    public function executeListAjax(sfWebRequest $request) {
        $this->initList($request);

        return $this->renderPartial('list', array('arrivages' => $this->arrivages));
    }

    private function initList(sfWebRequest $request) {
        $this->heureDebut = $request->getParameter('heureDebut', date('d/m/Y') . ' 00:00:00');
        $this->heureFin = $request->getParameter('heureFin', date('d/m/Y') . ' 23:59:59');
        $this->fournisseur = $request->getParameter('fournisseur', '');
        $this->transporteur = $request->getParameter('transporteur', '');
        $this->statut = $request->getParameter('statut', '');
        $this->produit = $request->getParameter('produit', '');

        $heureDebut = '';
        if ($this->heureDebut != '') {
            $heureDebut = DateTime::createFromFormat('d/m/Y H:i:s', $this->heureDebut)->format('y-m-d H:i:s');
        }
        $heureFin = '';
        if ($this->heureFin != '') {
            $heureFin = DateTime::createFromFormat('d/m/Y H:i:s', $this->heureFin)->format('y-m-d H:i:s');
        }

        $this->arrivages = WrkArrivageTable::getInstance()->getArrivages($heureDebut, $heureFin, $this->fournisseur, $this->transporteur, $this->statut, $this->produit);
    }

    public function executeNew(sfWebRequest $request) {
        $this->fournisseurs = RefFournisseurTable::getInstance()->findAll();
        $this->transporteurs = RefTransporteurTable::getInstance()->findAll();
        $this->chauffeurs = RefChauffeurTable::getInstance()->findAll();
        $this->natures = RefNatureTable::getInstance()->findAll();
    }

    public function executeCreate(sfWebRequest $request) {
        $this->forward404Unless($request->isMethod(sfRequest::POST));
        $statut = 0;
        if ($this->build($request)) {
            $statut = 1;
        }
        return $this->renderText($statut);
    }

    private function generateNumColis(WrkArrivage $arrivage, $standard, $congelee, $urgent, $print, $numArrivage = "") {
        $collectionArrivageProduit = $arrivage->getWrkArrivageProduit();

        $dateArrivage = "";
        if ($numArrivage != "") {
            $dateArrivage = DateTime::createFromFormat('ymdHis', $numArrivage)->format('Y-m-d H:i:s');
        }
        if ($numArrivage != "" && count($collectionArrivageProduit) > 0) {//si c'est une modification et qu'on a modifier le num arrivage
            foreach ($collectionArrivageProduit as $arrivageProduit) {
                $refProduit = $arrivageProduit->getRefProduit();
                $type = substr($refProduit, 0, 1);
                $increment = substr($refProduit, 13);
                $numArrivageRef = $type . $numArrivage . $increment;

                $arrivageProduit->setRefProduit($numArrivageRef);
                $arrivageProduit->setCreatedAt($dateArrivage);

                $receptionsAssocies = WrkArrivageProduitTable::getInstance()->getReceptions('', '', $refProduit, '');
                foreach ($receptionsAssocies as $receptionAssocie) {
                    $receptionAssocie->setRefProduit($numArrivageRef);
                }
                $receptionsAssocies->save();
                $arrivageProduit->save();
            }
        }

        $standardArray = array();
        $congeleeArray = array();
        $urgentArray = array();
        if ($standard > 0)
            $standardArray = array_fill(0, $standard, array('S', RefNature::NATURE_STANDARD));
        if ($congelee > 0)
            $congeleeArray = array_fill(0, $congelee, array('C', RefNature::NATURE_CONGELEE));
        if ($urgent > 0)
            $urgentArray = array_fill(0, $urgent, array('U', RefNature::NATURE_URGENT));
        $colis = array_merge($standardArray, $congeleeArray, $urgentArray);
        if (count($colis) > 0) {
            $increment = count($collectionArrivageProduit) + 1;
            if (count($collectionArrivageProduit) > 0) { //si c'est une modification
                $arrivageProduit = $collectionArrivageProduit->getFirst();
                $refProduit = $arrivageProduit->getRefProduit();
                $numArrivage = substr($refProduit, 1, 12);
            } else {
                if ($numArrivage == "") {
                    $numArrivage = date('ymdHis');
                    $dateArrivage = date('Y-m-d H:i:s');
                }
            }
            foreach ($colis as $value) {
                $refProduit = $value[0] . $numArrivage . $increment;
                $arrivageProd = new WrkArrivageProduit();
                $arrivageProd->setWrkArrivage($arrivage);
                $arrivageProd->setIdNature($value[1]);
                $arrivageProd->setRefProduit($refProduit);
                $arrivageProd->setCreatedAt($dateArrivage);

                if ($print != null) {
                    $this->printCodeBarre($refProduit);
                }
                $collectionArrivageProduit->add($arrivageProd);
                $increment++;
            }
        }
        return $collectionArrivageProduit;
    }

    public function executeEdit(sfWebRequest $request) {
        $this->forward404Unless($arrivage = WrkArrivageTable::getInstance()->find(array($request->getParameter('idArrivage'))), sprintf('Object wrk_arrivage does not exist (%s).', $request->getParameter('idArrivage')));
        $this->arrivage = $arrivage;
        $this->fournisseurs = RefFournisseurTable::getInstance()->findAll();
        $this->transporteurs = RefTransporteurTable::getInstance()->findAll();
        $this->chauffeurs = RefChauffeurTable::getInstance()->findAll();
        $this->natures = RefNatureTable::getInstance()->findAll();
    }

    public function executeUpdate(sfWebRequest $request) {
        $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
        $this->forward404Unless($arrivage = WrkArrivageTable::getInstance()->find(array($request->getParameter('idArrivage'))), sprintf('Object wrk_arrivage does not exist (%s).', $request->getParameter('idArrivage')));

        $statut = 0;
        if ($this->build($request, $arrivage)) {
            $statut = 1;
        }
        return $this->renderText($statut);
    }

    public function executeDelete(sfWebRequest $request) {
        $this->forward404Unless($arrivage = WrkArrivageTable::getInstance()->find(array($request->getParameter('idArrivage'))), sprintf('Object wrk_arrivage does not exist (%s).', $request->getParameter('idArrivage')));
        $statut = 1;
        try {
            WrkArrivageProduitTable::getInstance()->getConnection()->beginTransaction();
            $arrivage->getWrkArrivageProduit()->delete();
            $arrivage->delete();
            WrkArrivageProduitTable::getInstance()->getConnection()->commit();
        } catch (Exception $e) {
            $statut = 0;
        }


        return $this->renderText($statut);
    }

    public function build(sfWebRequest $request, WrkArrivage $arrivage = null) {
        $dateArrivage = $request->getParameter('dateArrivage', '');
        $idFournisseur = $request->getParameter('fournisseur');
        $idTransporteur = $request->getParameter('transporteur');
        $chauffeur = $request->getParameter('chauffeur');
        $lVoiture = $request->getParameter('lVoiture');
        $colis = $request->getParameter('colis', 0);
        $palette = $request->getParameter('palette', 0);
        $immatriculation = $request->getParameter('immatriculation');
//        $idNature = $request->getParameter('nature');
//        $brSap = $request->getParameter('brSap');
        $statut = $request->getParameter('statut');
        $commentaire = $request->getParameter('commentaire');

        $standard = intval($request->getParameter('umStandard', 0));
        $congelee = intval($request->getParameter('umCongelee', 0));
        $urgent = intval($request->getParameter('umUrgent', 0));
        $print = $request->getParameter('autoPrint', null);
        $printNumArrivage = $request->getParameter('printNumArrivage', null);
        $colis+=$standard + $congelee + $urgent;

        $isOk = $this->checkValue($idFournisseur, $idTransporteur, $chauffeur, $lVoiture, $colis, $palette, $immatriculation);

        if (!$isOk) {
            return false;
        }
        if ($arrivage == null) {
            $arrivage = new WrkArrivage();
            $arrivage->setCreatedAt(date('Y-m-d H:i:s'));
        }

        $numArrivage = '';
        if ($dateArrivage != "") { //si on a une date d'arrivage on creer un num arrivage
            $numArrivage = DateTime::createFromFormat('d/m/Y H:i:s', $dateArrivage)->format('ymdHis');
            $dateArrivage = DateTime::createFromFormat('d/m/Y H:i:s', $dateArrivage)->format('Y-m-d H:i:s');
            $arrivage->setCreatedAt($dateArrivage);
        }

        $arrivage->setIdFournisseur($idFournisseur);
        $arrivage->setIdTransporteur($idTransporteur);
        $arrivage->setIdChauffeur($chauffeur);
        $arrivage->setLettreVoiture($lVoiture);
        $arrivage->setNbColis($colis);
        $arrivage->setNbPalette($palette);
        $arrivage->setImmatriculation($immatriculation);

        $arrivage->setStatut($statut);
        $arrivage->setCommentaire($commentaire);

        try {
            WrkArrivageTable::getInstance()->getConnection()->beginTransaction();
            $collectionArrivageProduit = $this->generateNumColis($arrivage, $standard, $congelee, $urgent, $print, $numArrivage);
            $arrivage->save();
            $collectionArrivageProduit->save();
            WrkArrivageTable::getInstance()->getConnection()->commit();

            if ($printNumArrivage != null) {
                $this->printNumArrivage($arrivage);
            }
        } catch (Exception $e) {
            return false;
        }
        return true;
    }

    public function executeExcel(sfWebRequest $request) {
        $this->setLayout(false);
        $this->setTemplate('exportExcel');
        $this->date = date('d/m/Y');
        $this->print = false;

        $this->initList($request);

        $this->getResponse()->setContentType('application/vnd.ms-excel;charset=utf-8');
        $this->getResponse()->setHttpHeader('Content-Disposition:attachment', 'inline;filename="export_arrivage.xls"');
    }

    public function executeWord(sfWebRequest $request) {
        $this->setLayout(false);
        $this->setTemplate('export');
        $this->date = date('d/m/Y');
        $this->print = false;


        $this->initList($request);

        $this->getResponse()->setContentType('application/vnd.ms-word;charset=utf-8');
        $this->getResponse()->setHttpHeader('Content-Disposition:attachment', 'inline;filename="export_arrivage.doc"');
    }

    public function executePrint(sfWebRequest $request) {
        $this->setLayout(false);
        $this->setTemplate('export');
        $this->date = date('d/m/Y');
        sfConfig::set('sf_web_debug', false);
        $this->print = 'true';

        $this->initList($request);
    }

    public function executePrintCodeBarre(sfWebRequest $request) {
        $refProduit = $request->getParameter('refProduit');
        $statut = 1;
        try {
            $this->printCodeBarre($refProduit);
        } catch (Exception $e) {
            $statut = 0;
        }
        return $this->renderText($statut);
    }

    public function executePrintCodesBarres(sfWebRequest $request) {
        $this->forward404Unless($arrivage = WrkArrivageTable::getInstance()->find(array($request->getParameter('idArrivage'))), sprintf('Object wrk_arrivage does not exist (%s).', $request->getParameter('idArrivage')));
        $statut = 1;
        try {
            $arrivagesProduits = WrkArrivageProduitTable::getInstance()->getProduits($request->getParameter('idArrivage'));
            foreach ($arrivagesProduits as $arrivageProduit) {
                $this->printCodeBarre($arrivageProduit->getRefProduit());
            }
        } catch (Exception $e) {
            $statut = 0;
        }
        return $this->renderText($statut);
    }

    public function executePrintNumArrivage(sfWebRequest $request) {
        $this->forward404Unless($arrivage = WrkArrivageTable::getInstance()->find(array($request->getParameter('idArrivage'))), sprintf('Object wrk_arrivage does not exist (%s).', $request->getParameter('idArrivage')));
        $statut = 1;
        try {
            $this->printNumArrivage($arrivage);
        } catch (Exception $e) {
            $statut = 0;
        }
        return $this->renderText($statut);
    }

    public function executeCheckNumArrivage(sfWebRequest $request) {
        $res = array('numArrivage' => '', 'unique' => true);
        $date = $request->getParameter('date', date('d/m/Y H:i:s'));
        $numArrivage = DateTime::createFromFormat('d/m/Y H:i:s', $date)->format('ymdHis');

        $res['numArrivage'] = $numArrivage;
        $res['unique'] = WrkArrivageTable::getInstance()->checkNumArrivageUnique($numArrivage);

        return $this->renderText(json_encode($res));
    }

    private function printCodeBarre($refProduit) {
        if (!$refProduit || $refProduit === '') {
            return false;
        }
        $spool = new AdmSpool();
        $spool->setCodeEtiq('ETAT_COLIS');
        $spool->setNbEtiq(1);
        $spool->setParametres($refProduit);
        $spool->setImprimee(0);
        $spool->save();
        return true;
    }

    private function printNumArrivage(WrkArrivage $arrivage) {
        $arrivagesProds = $arrivage->getWrkArrivageProduit();
        if (count($arrivagesProds) > 0) {
            $arrivageProduit = $arrivagesProds->getFirst();
            $refProduit = $arrivageProduit->getRefProduit();
            $numArrivage = substr($refProduit, 1, 12);
            $spool = new AdmSpool();
            $spool->setCodeEtiq('ETAT_ARRIVAGE');
            $spool->setNbEtiq(1);
            $spool->setParametres($numArrivage);
            $spool->setImprimee(0);
            $spool->save();
        }
    }

    public function checkValue($idFournisseur, $idTransporteur, $chauffeur, $lVoiture, $colis, $palette, $immatriculation) {
        if ($idFournisseur === '' || $idTransporteur === '' || $chauffeur == '' || $immatriculation === '') {
            return false;
        }

        if ($colis !== '' && !is_numeric($colis)) {
            return false;
        }
        if ($palette !== '' && !is_numeric($palette)) {
            return false;
        }

        return true;
    }

}
