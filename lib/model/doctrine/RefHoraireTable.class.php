<?php

/**
 * RefHoraireTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class RefHoraireTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object RefHoraireTable
     */
    public static function getInstance() {
        return Doctrine_Core::getTable('RefHoraire');
    }

    public function getHorairesArray() {
        $horaires = $this->createQuery()->select("*")->from("RefHoraire h")->orderBy("heure_debut asc")->execute();
        $horairesArray = array();
        foreach ($horaires as $horaire) {
            if (!isset($horairesArray[$horaire->getJour()])) {
                $horairesArray[$horaire->getJour()] = array();
            }
            $horairesArray[$horaire->getJour()][] = array($horaire->getHeureDebut(), $horaire->getHeureFin());
        }
        return $horairesArray;
    }

    /**
     * Retourne le nombre de seconde non travaille entre 2 dates en fonction des horaires de travail et des jour non travaille
     * @param type $dateTimeDebut date debut
     * @param type $dateTimeFin date fin
     * @param type $horaires tableau des horaires travaille ($horaire[jour][index]=[heure debut,heure fin])
     * @param type $feries tableau des jours non travaille ($feries[date feries]=date feries)
     * @param type $limitSeconds permet de limiter le calcul, l'algo s'arretera une fois le nb seconde atteint
     * @return type un nb secondes
     */
    public function getNbSecondeNonTravaille($dateTimeDebut, $dateTimeFin, $horaires = null, $feries = null, $nbHeureParJour = null, $limitSeconds = PHP_INT_MAX) {
        if ($horaires === null)
            $horaires = $this->getHorairesArray();
        if ($feries === null)
            $feries = RefFerieTable::getInstance()->getFeriesArrayUnique();
        if ($nbHeureParJour === null)
            $nbHeureParJour = $this->getNbSecondeNonTravailleParJours($horaires);

        $timeEnd = strtotime($dateTimeFin);
        $seconds = 0;

        $date = date('Y-m-d', strtotime($dateTimeDebut));
        $time = date('H:i:s', strtotime($dateTimeDebut));

        while (strtotime($date . ' ' . $time) < $timeEnd) {
            if ($seconds >= $limitSeconds) {
                return $limitSeconds;
            }

            if ($time == "00:00:00") {
                $diff = $timeEnd - strtotime($date . ' ' . $time);
                if ($diff > 86400) { //1 jours, si inferieur le calcul groupé n'est pas interessant
                    $end = $timeEnd - 86400; //- 1 jour
                    $start = strtotime($date . ' ' . $time);
                    while ($start < $end) {
                        $dayofweek = $this->getDayOfWeek($date);
                        if (isset($feries[$date]) || !isset($nbHeureParJour[$dayofweek])) {
                            $seconds +=86400; // +1 jour si le jours n'est pas travaille
                        } else {
                            $seconds += $nbHeureParJour[$dayofweek]; //sinon on ajoute le temps non travaille du jour
                        }

                        $start+=86400; // +1 jour (on passe au jour suivant)
                        $date = date('Y-m-d', $start);
                    }
                    $time = "00:00:00";
                }
            }

            $dayofweek = $this->getDayOfWeek($date . ' ' . $time);

            if (isset($feries[$date]) || !isset($horaires[$dayofweek])) {
                $timeFirst = strtotime($date . ' ' . $time);
                $date = date('Y-m-d', strtotime('+1 day', strtotime($date)));
                $time = "00:00:00";
                $timeSecond = strtotime($date . ' ' . $time);
                if ($timeSecond > $timeEnd) {
                    $timeSecond = $timeEnd;
                }
                $seconds += $timeSecond - $timeFirst;
            } else {
                foreach ($horaires[$dayofweek] as $horaire) {
                    $timeFirst = strtotime($date . ' ' . $time);
                    $timeSecond = strtotime($date . ' ' . $horaire[0]);
                    if ($timeSecond >= $timeEnd) {
                        break;
                    }
                    if ($timeSecond > $timeFirst) {
                        $seconds += $timeSecond - $timeFirst;
                    }
                    $timeEndHoraire = strtotime($date . ' ' . $horaire[1]);
                    if ($timeEndHoraire > $timeFirst) {
                        if ($timeEndHoraire >= $timeEnd) {
                            $time = date('H:i:s', $timeEnd);
                        } else {
                            $time = $horaire[1];
                        }
                    }
                }
                $timeFirst = strtotime($date . ' ' . $time);
                $date = date('Y-m-d', strtotime('+1 day', strtotime($date)));
                $time = "00:00:00";
                $timeSecond = strtotime($date . ' ' . $time);
                if ($timeSecond > $timeEnd) {
                    $timeSecond = $timeEnd;
                }
                $seconds += $timeSecond - $timeFirst;
            }
        }

        return $seconds;
    }

    private function getDayOfWeek($date) {
        $dayofweek = date('w', strtotime($date));
        if ($dayofweek == 0) {
            return 6;
        }

        return $dayofweek - 1;
    }

    public function getNbSecondeNonTravailleParJours($horaires = null) {
        $joursHeures = array();
        $date = date('Y-m-d');
        foreach ($horaires as $key => $days) {
            $nbSecondes = 0;
            $timeFinPrec = -1;
            foreach ($days as $horaire) {
                $timeSecond = strtotime($date . ' ' . $horaire[0]);
                $timeEndHoraire = strtotime($date . ' ' . $horaire[1]);
                if ($timeSecond < $timeFinPrec) {
                    $timeSecond = $timeFinPrec;
                }
                if ($timeSecond < $timeEndHoraire) {
                    $nbSecondes+=$timeEndHoraire - $timeSecond;
                    $timeFinPrec = $timeEndHoraire;
                } else {
                    $timeFinPrec = $timeSecond;
                }
            }
            $joursHeures[$key] = 86400 - $nbSecondes; // 1 jours - temps travaille
        }
        return $joursHeures;
    }

}