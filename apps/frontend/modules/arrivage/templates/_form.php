<div class="form-group">
    <label class="col-sm-2 control-label">
        <?php echo __('N° d\'arrivage') ?>
    </label>
    <div class="col-sm-10">
        <div class="input-group">
            <input id="numArrivage" name="numArrivage" class="form-control" readonly="" value="<?php echo (isset($arrivage) ? $arrivage->getNumArrivage() : '') ?>"/>
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary" onclick="showEditNumArrivage()">
                    <i class="fa fa-edit"></i>
                </button>
            </span>
        </div>
    </div>
</div>
<div id="editNumArrivage" style="display: none;">
    <hr>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Date/Heure') ?>
        </label>
        <div class="col-sm-10">
            <input name="dateArrivage" type="date" class="form-control dateHeure" id="numArrivageDate"> </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('N° d\'arrivage généré') ?>
        </label>
        <div class="col-sm-10">
            <input id="numArrivageGenerated"class="form-control i-checks" readonly=""> </div>
    </div>
    <hr>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Fournisseur') ?>
    </label>
    <div class="col-sm-10">
        <select id="fournisseur" name="fournisseur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
            <?php foreach ($fournisseurs as $fournisseur) { ?>
                <option <?php echo (isset($arrivage) && $fournisseur->getIdFournisseur() == $arrivage->getIdFournisseur() ? 'selected' : '') ?> value="<?php echo $fournisseur->getIdFournisseur(); ?>"><?php echo $fournisseur->getLibelle() ?></option>
            <?php } ?>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Transporteur') ?>
    </label>
    <div class="col-sm-10">
        <select id="transporteur" name="transporteur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
            <?php foreach ($transporteurs as $transporteur) { ?>
                <option <?php echo ( isset($arrivage) && $transporteur->getIdTransporteur() == $arrivage->getIdTransporteur() ? 'selected' : '') ?> value="<?php echo $transporteur->getIdTransporteur(); ?>"><?php echo $transporteur->getLibelle() ?></option>
            <?php } ?>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Chauffeur') ?>
    </label>
    <div class="col-sm-10">
        <select id="chauffeur" name="chauffeur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
            <?php foreach ($chauffeurs as $chauffeur) { ?>
                <option <?php echo ( isset($arrivage) && $chauffeur->getIdTransporteur() === $arrivage->getIdTransporteur() ? '' : 'disabled') ?> <?php echo ( isset($arrivage) && $chauffeur->getIdChauffeur() == $arrivage->getIdChauffeur() ? 'selected' : '') ?> value="<?php echo $chauffeur->getIdChauffeur(); ?>" idTransporteur="<?php echo $chauffeur->getIdTransporteur(); ?>"><?php echo $chauffeur ?></option>
            <?php } ?>
        </select>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <?php echo __('Lettre voiture') ?>
    </label>
    <div class="col-sm-10">
        <input id="lVoiture" name="lVoiture" class="form-control" value="<?php echo (isset($arrivage) ? $arrivage->getLettreVoiture() : '') ?>"/>
    </div>
</div>
<?php if (isset($arrivage)) { ?>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Nombre d\'UM') ?>
        </label>
        <div class=" col-sm-10">
            <div class="input-group">
                <input readonly="" id="colis" name="colis" class="form-control" value="<?php echo (isset($arrivage) ? $arrivage->getNbColis() : '') ?>"/>
                <span class="input-group-btn">
                    <button type="button" class="btn btn-primary" onclick="showNbUMAdd();">
                        <i class="fa fa-plus"></i>
                    </button>
                </span>
            </div>
        </div>
    </div>
<?php } ?>
<div id="addUM" style="<?php echo (isset($arrivage) ? 'display: none' : ''); ?>">
    <hr>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Nombre d\'UM à ajouter') ?>
        </label>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-lg-4">
                    <label class="col-sm-3 control-label">Standard</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input class="form-control spineEdit" name="umStandard">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <label class="col-sm-3 control-label">Congelée/Mat. Dgx</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input class="form-control spineEdit" name="umCongelee"> 
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <label class="col-sm-3 control-label">Urgent</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input class="form-control spineEdit" name="umUrgent">
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Imprimer ?') ?>
        </label>
        <div class="col-sm-10">
            <input type="checkbox" class="form-control i-checks" name="autoPrint"> </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Imprimer le numéro d\'arrivage ?') ?>
        </label>
        <div class="col-sm-10">
            <input type="checkbox" class="form-control i-checks" name="printNumArrivage"> </div>
    </div>
    <hr>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Immatriculation') ?>
    </label>
    <div class="col-sm-10">
        <input id="immatriculation" name="immatriculation" class="form-control" value="<?php echo (isset($arrivage) ? $arrivage->getImmatriculation() : '') ?>"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Statut') ?>
    </label>
    <div class="col-sm-10">
        <select id="statut" name="statut" class="form-control chosen-select" data-placeholder="Choisir une valeur">
            <?php
            $statuts = array('conforme', 'réserve');
            foreach ($statuts as $statut) {
                ?>
                <option <?php echo ( isset($arrivage) && $statut == $arrivage->getStatut() ? 'selected' : '') ?> value="<?php echo $statut; ?>"><?php echo $statut ?></option>
            <?php } ?>
        </select>
    </div>
</div>
<div id="form-group-commentaire" class="form-group" style="<?php echo ( isset($arrivage) && $arrivage->getStatut() === 'réserve' ? '' : 'display: none;') ?>">
    <label class="col-sm-2 control-label">
        <?php echo __('Commentaire') ?>
    </label>
    <div class="col-sm-10">
        <textarea id="commentaire" name="commentaire" class="form-control"><?php echo (isset($arrivage) ? $arrivage->getCommentaire() : '') ?></textarea>
    </div>
</div>

<script>
    $(document).ready(function () {
        var config = {
            disable_search_threshold: 10, //on cache le champs de recherche si il y a moins de 10 elements
            no_results_text: 'Aucun résultat!',
            allow_single_deselect: false,
            display_disabled_options: false
        };
        $('.chosen-select').chosen(config);
        $(".chosen-container").css("width", "100%");

        $('#statut').change(function () {
            if ($('#statut').val() === 'réserve') {
                $('#form-group-commentaire').show();
            } else {
                $('#form-group-commentaire').hide();
            }
        });

        $('.spineEdit').spinedit({
            minimum: 0,
            maximum: 100,
            step: 1,
            value: 0,
            numberOfDecimals: 0
        });

        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_flat-blue'
        });

        $('#formEdit,#formNew').ajaxForm({
            beforeSubmit: controleValeur,
            success: function (res) {
                if (res === '1') {
                    goBack();
                    reloadList();
                } else {
                }
            }});

        $('#transporteur').on('change', function (evt, params) {
            if (params.selected !== undefined) {
                updateChauffeurSelect(params.selected);
            }
        });

        $('.dateHeure').datetimepicker({
            format: 'DD/MM/YYYY HH:mm:ss',
            useCurrent: true,
            locale: moment.locale('fr'),
            icons: {
                time: 'fa fa-clock-o',
                date: 'fa fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-crosshairs',
                clear: 'fa fa-trash',
                close: 'fa fa-remove'
            }
        });
        $("#numArrivageDate").on("dp.change", function (e) {
            removeAllSet("#numArrivageGenerated");
            removeAllSet("#numArrivageDate");
            url = '<?php echo url_for('arrivages-check-num-arrivage') ?>';
            data = {date: $("#numArrivageDate").val()};
            $.post(url, data, function (json) {
                var res = JSON.parse(json);
                $('#numArrivageGenerated').val(res.numArrivage);
                if (!res.unique) {
                    setHasError("#numArrivageGenerated");
                    setHasError("#numArrivageDate");
                }
            });
        });
    });

    function updateChauffeurSelect(idSelect) {
        $('#chauffeur').find('option').attr('disabled', '');
        $('#chauffeur').find('option').removeAttr('selected');

        $('#chauffeur').find('option[idTransporteur="' + idSelect + '"]').removeAttr('disabled');
        $('#chauffeur').find('option[idTransporteur="' + idSelect + '"]').first().prop('selected', true);
        $('#chauffeur').trigger('chosen:updated');

    }
    function controleValeur() {
        var erreur = false;
        removeAllSet("#fournisseur");
        removeAllSet("#chauffeur");
        removeAllSet("#transporteur");
        removeAllSet("#immatriculation");
//        removeAllSet("#palette");

        if ($("#fournisseur").val() === "") {
            erreur = true;
            setHasError("#fournisseur");
        }

        if ($("#chauffeur").val() === "" || $("#chauffeur").val() === null) {
            erreur = true;
            setHasError("#chauffeur");
        }

        if ($("#immatriculation").val() === "") {
            erreur = true;
            setHasError("#immatriculation");
        }

        if ($("#transporteur").val() === "") {
            erreur = true;
            setHasError("#transporteur");
        }

//        if ($("#colis").val() !== "") {
//            if (isNaN(parseInt($("#colis").val()))) {
//                erreur = true;
//                setHasError("#colis");
//            }
//        }
//        if ($("#palette").val() !== "") {
//            if (isNaN(parseInt($("#palette").val()))) {
//                erreur = true;
//                setHasError("#palette");
//            }
//        }

        return !erreur;
    }

    function showNbUMAdd() {
        $('#addUM').show();
    }
    
    function showEditNumArrivage(){
         $('#editNumArrivage').show();
     }
        
</script>