<table class="table table-striped table-bordered table-hover dataTables display responsive no-wrap" width="100%" >
    <thead>
        <tr>
            <th><?php echo __('N° d\'arrivage'); ?></th>
            <th><?php echo __('Transporteur'); ?></th>
            <th><?php echo __('Chauffeur'); ?></th>
            <th><?php echo __('Immatriculation'); ?></th>
            <th><?php echo __('Lettre voiture'); ?></th>
            <th><?php echo __('Fournisseur'); ?></th>
            <th><?php echo __('Nb UM'); ?></th>
            <th><?php echo __('Statut'); ?></th>
            <th><?php echo __('Date'); ?></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($arrivages as $arrivage): ?>
            <tr id="<?php echo $arrivage->getIdArrivage() ?>" onmousedown="setIdClic(event, '<?php echo $arrivage->getIdArrivage() ?>');"  class="context-menu-one box menu-1">
                <?php
                $numArrivage = '';
                if ($arrivage->getWrkArrivageProduit()->getFirst()) {
                    $refProduit = $arrivage->getWrkArrivageProduit()->getFirst()->getRefProduit();
                }
                $numArrivage = substr($refProduit, 1, 12);
                ?>
                <td class="click"><?php echo $numArrivage ?></td>
                <td class="click"><?php echo ($arrivage->getRefTransporteur() ? $arrivage->getRefTransporteur()->getLibelle() : $arrivage->getIdTransporteur()) ?></td>
                <td class="click"><?php echo ($arrivage->getRefChauffeur() ? $arrivage->getRefChauffeur() : '') ?></td>
                <td class="click"><?php echo $arrivage->getImmatriculation() ?></td>
                <td class="click"><?php echo $arrivage->getLettreVoiture() ?></td>
                <td class="click"><?php echo ($arrivage->getRefFournisseur() ? $arrivage->getRefFournisseur()->getLibelle() : '') ?></td>
                <td class="click"><?php echo $arrivage->getNbColis() ?></td>
                <td class="click" title="<?php echo $arrivage->getCommentaire() ?>"><?php echo $arrivage->getStatut() ?></td>
                <td class="click"><?php echo date('d/m/Y H:i:s', strtotime($arrivage->getCreatedAt())) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
    <tfoot>
        <tr>
            <th><?php echo __('N° d\'arrivage'); ?></th>
            <th><?php echo __('Transporteur'); ?></th>
            <th><?php echo __('Chauffeur'); ?></th>
            <th><?php echo __('Immatriculation'); ?></th>
            <th><?php echo __('Lettre voiture'); ?></th>
            <th><?php echo __('Fournisseur'); ?></th>
            <th><?php echo __('Nb UM'); ?></th>
            <th><?php echo __('Statut'); ?></th>
            <th><?php echo __('Date'); ?></th>
        </tr>
    </tfoot>
</table>
<?php
foreach ($arrivages as $arrivage) {
    $produits = array();
    foreach ($arrivage->getWrkArrivageProduit() as $arrivageProduits) {
        $produits[] = $arrivageProduits->getRefProduit();
    }
    include_partial('modalProduit', array('idArrivage' => $arrivage->getIdArrivage(), 'produits' => $produits));
}
?>
<script>
    var table = null;
    $(document).ready(function () {
        $('.modalProduit').appendTo('body');
        $('table tr td.click').click(function () {
            showProduits($(this).parent().attr('id'));
        });
    });
</script>
<style>
    .mignature{
        width: 25px;
        height: 25px;
        cursor:zoom-in;
    }
    table tr td:not(.click){
        cursor: default;
    }
</style>