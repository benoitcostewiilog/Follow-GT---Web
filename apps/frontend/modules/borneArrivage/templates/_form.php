<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Fournisseur') ?>
    </label>
    <div class="col-sm-10">
        <div class="input-group">
            <select id="fournisseur" name="fournisseur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
                <?php foreach ($fournisseurs as $fournisseur) { ?>
                    <option <?php echo (isset($arrivage) && $fournisseur->getIdFournisseur() == $arrivage->getIdFournisseur() ? 'selected' : '') ?> value="<?php echo $fournisseur->getIdFournisseur(); ?>"><?php echo $fournisseur->getLibelle() ?></option>
                <?php } ?>
            </select>
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary" onclick="showFrnModal()">
                    <i class="fa fa-plus"></i>
                </button>
            </span>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Transporteur') ?>
    </label>
    <div class="col-sm-10">
        <div class="input-group">
            <select id="transporteur" name="transporteur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
                <?php foreach ($transporteurs as $transporteur) { ?>
                    <option <?php echo ( isset($arrivage) && $transporteur->getIdTransporteur() == $arrivage->getIdTransporteur() ? 'selected' : '') ?> value="<?php echo $transporteur->getIdTransporteur(); ?>"><?php echo $transporteur->getLibelle() ?></option>
                <?php } ?>
            </select>
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary" onclick="showTrsptModal()">
                    <i class="fa fa-plus"></i>
                </button>
            </span>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Chauffeur') ?>
    </label>
    <div class="col-sm-10">
        <div class="input-group">
            <select id="chauffeur" name="chauffeur" class="form-control chosen-select" data-placeholder="Choisir une valeur">
                <?php foreach ($chauffeurs as $chauffeur) { ?>
                    <option <?php echo ( isset($arrivage) && $chauffeur->getIdTransporteur() === $arrivage->getIdTransporteur() ? '' : 'disabled') ?> <?php echo ( isset($arrivage) && $chauffeur->getIdChauffeur() == $arrivage->getIdChauffeur() ? 'selected' : '') ?> value="<?php echo $chauffeur->getIdChauffeur(); ?>" idTransporteur="<?php echo $chauffeur->getIdTransporteur(); ?>"><?php echo $chauffeur ?></option>
                <?php } ?>
            </select>
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary" onclick="showDriverModal()()">
                    <i class="fa fa-plus"></i>
                </button>
            </span>
        </div>
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
<div class="form-group">
    <label class="col-sm-2 control-label">
        <span class="form-mandatory">* </span>
        <?php echo __('Immatriculation') ?>
    </label>
    <div class="col-sm-10">
        <input id="immatriculation" name="immatriculation" class="form-control" value="<?php echo (isset($arrivage) ? $arrivage->getImmatriculation() : '') ?>"/>
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
            <input type="checkbox" class="form-control i-checks" name="autoPrint" checked> </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <?php echo __('Imprimer le numéro d\'arrivage ?') ?>
        </label>
        <div class="col-sm-10">
            <input type="checkbox" class="form-control i-checks" name="printNumArrivage" checked> </div>
    </div>
    <hr>
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

