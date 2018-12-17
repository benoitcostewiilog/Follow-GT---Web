{
"draw": <?php echo $draw ?>,
"recordsTotal": <?php echo $mouvementsTotal ?>,
"recordsFiltered": <?php echo $mouvementsFiltrer ?>,
"data": [
<?php
$class = "";
$i=0;
foreach ($mouvements as $mouvement):
    $action = $mouvement['type'];
    if (!is_null($mvtEnCours)) {
        if (in_array($mouvement['id_mouvement'], $sf_data->getRaw('mvtEnCours'))) {
            $class = "context-menu-one box menu-1 nonDeposee";
            $action = 'prise non déposée';
        } else {
            $class = "context-menu-one box menu-1";
        }
    }
    ?>
    {
    "DT_RowId": "<?php echo $mouvement['id_mouvement'] ?>",
    "DT_RowClass": "<?php echo $class ?>",
    "reference": "<?php echo $mouvement['ref_produit'] ?>",
    "action": "<?php echo $action ?>",
    "emplacement": "<?php echo ($mouvement['RefEmplacement']['libelle'] ? $mouvement['RefEmplacement']['libelle'] : $mouvement['code_emplacement']) ?>",
    "commentaire": "<?php echo ($mouvement['commentaire'] != "") ? $mouvement['commentaire'] : 'N/C' ?>",
    "groupe": "<?php echo $mouvement['groupe'] ?>",
    "date": "<?php echo date('d/m/Y H:i:s', strtotime($mouvement['heure_prise'])) ?>",
    "arrivage": "<?php echo ($mouvement['WrkArrivageProduit']) ? $mouvement['WrkArrivageProduit']['ref_produit'] : 'Absent' ?>",
    "utilisateur": "<?php echo (isset($users[$mouvement['id_utilisateur']]) ? $users[$mouvement['id_utilisateur']] : $mouvement['id_utilisateur']) ?>"
    }<?php echo $i==(count($mouvements)-1)?"":"," ?>

<?php
$i++;
endforeach; ?>
]
}