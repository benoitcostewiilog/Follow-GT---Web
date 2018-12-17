<?php
foreach ($produitEnRetard as $prod) {
    ?>
    <tr>
        <td><small><?php echo $prod['ref_produit'] ?></small></td>
         <td><i class="fa fa-clock-o"></i> <?php echo $prod['dtearrivage']?date('d/m/Y H:i:s', strtotime($prod['dtearrivage'])):"N/C" ?></td>
        <td><i class="fa fa-clock-o"></i> <?php echo date('d/m/Y H:i:s', strtotime($prod['heure_prise'])) ?></td>
        <td class="<?php echo $prod['secondes'] < 0 ? "text-warning" : "text-danger" ?> " > <i class="fa fa-warning"></i> <?php echo $prod['time'] ?> </td>
    </tr>
<?php
} 