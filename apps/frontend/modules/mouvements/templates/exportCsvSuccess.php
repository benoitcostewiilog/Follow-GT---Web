<?php echo __('Date/Heure'); ?>;<?php echo __('Unité de tracking'); ?>;<?php echo __('Action'); ?>;<?php echo __('Emplacement'); ?>;<?php echo __('Commentaire'); ?>;<?php echo __('Groupe'); ?>;<?php echo __('Utilisateur'); ?>;<?php echo __('Arrivage'); ?><?php echo "\r\n"; ?>
<?php foreach ($mouvements as $mouvement): ?>
<?php echo date('d/m/Y H:i:s', strtotime($mouvement['heure_prise'])) ?>;<?php echo $mouvement['ref_produit'] ?>;<?php echo $mouvement['type'] ?>;<?php echo ($mouvement['RefEmplacement'] ? $mouvement['RefEmplacement']['libelle'] : $mouvement['code_emplacement']) ?>;<?php echo ($mouvement['commentaire'] != "") ? $mouvement['commentaire'] : 'N/C' ?>;<?php echo $mouvement['groupe'] ?>;<?php echo (isset($users[$mouvement['id_utilisateur']]) ? $users[$mouvement['id_utilisateur']] : $mouvement['id_utilisateur']) ?>;<?php echo ($mouvement['WrkArrivageProduit']) ? $mouvement['WrkArrivageProduit']['ref_produit'] : 'Absent' ?><?php echo "\r\n"; ?>
<?php endforeach; ?>

