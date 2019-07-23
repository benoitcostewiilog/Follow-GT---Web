<?php
//Slot du titre de la page
slot('page_title', sprintf("Historique Mouvements"));
?>
<style>
    .nonDeposee{color:green;}
</style>

<div id="list-ajax-div">
    <div id="tpltLstHrchy" class="hidden">
        <ol class="breadcrumb">
            <li>
                <a href="#"><?php echo __('Historique'); ?></a>
            </li>
            <li class="active">
                <strong><?php echo __('Mouvements'); ?></strong>
            </li>
        </ol>
    </div>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><?php echo __('Filtrer les mouvements :') ?></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="formFiltre" action="<?php echo url_for('mouvements') ?>" class="form-horizontal" method="POST">

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label"><?php echo __('Unité de tracking'); ?></label>
                                            <div class="col-lg-8">
                                                <input  id="reference" value="<?php echo $reference ?>" name="reference" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-lg-offset-6">
                                            <div class="form-group">
                                                <button class="btn btn-primary" type="submit"><?php echo __('Filtrer'); ?></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label"><?php echo __('Début'); ?></label>
                                            <div class="col-lg-8">
                                                <input id="heureDebut" value="<?php echo $heureDebut ?>" name="heureDebut" class="form-control dateFiltre"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label"><?php echo __('Fin'); ?></label>
                                            <div class="col-lg-8">
                                                <input id="heureFin" value="<?php echo $heureFin ?>" name="heureFin" class="form-control dateFiltre"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label"><?php echo __('Emplacement'); ?></label>
                                            <div class="col-lg-8">
                                                <select id="emplacement" name="emplacement" class="form-control">
                                                    <option <?php echo ($emplacement == '' ? 'selected' : '') ?> value="">Aucun</option>
                                                    <?php foreach ($emplacements as $value) { ?>
                                                        <option <?php echo ($value->getCodeEmplacement() == $emplacement ? 'selected' : '') ?> value="<?php echo $value->getCodeEmplacement() ?>"><?php echo $value->getLibelle() ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label"><?php echo __('Action'); ?></label>
                                            <div class="col-lg-8">
                                                <select id="type" name="type" class="form-control">
                                                    <option <?php echo ($type === '' ? 'selected' : '') ?> value="">Aucune</option>
                                                    <?php foreach ($types as $value) { ?>
                                                        <option <?php echo ($value == $type ? 'selected' : '') ?> value="<?php echo $value ?>"><?php echo $value ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><?php echo __('Historique des mouvements de marchandises'); ?></h5>
                        <div class="ibox-tools">
                              <?php if ($sf_user->hasCredential('mouvements-ecriture')) { ?>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                              
                                    <li><a onclick="showForm('<?php echo url_for(array('sf_route' => 'mouvements-new')) ?>');"><?php echo __('Ajouter') ?></a>
                                   
                                <li><a onclick="exporter('excel');" >Export Excel</a></li>
                                <li><a onclick="exporter('excelDelais');" >Export Excel (Avec délais)</a></li>
                                <li><a onclick="exporter('word');" >Export Word</a></li>
                                <li><a onclick="exporter('print');" >Imprimer</a></li>
                              
                            </ul>
                               <?php } ?>
                        </div>
                    </div>
                    <div class="ibox-content" id="listMouvement">
                        <table class="table table-striped table-bordered table-hover dataTables display responsive no-wrap" width="100%" >
                            <thead>
                                <tr>
                                    <th><?php echo __('Unité de tracking'); ?></th>
                                    <th><?php echo __('Action'); ?></th>
                                    <th><?php echo __('Emplacement'); ?></th>
                                    <th><?php echo __('Commentaire'); ?></th>
                                    <th><?php echo __('Groupe'); ?></th>
                                    <th><?php echo __('Date/Heure'); ?></th>
                                    <th><?php echo __('Utilisateur'); ?></th>
                                    <th><?php echo __('Arrivage'); ?></th>
                                </tr>
                            </thead>
                            <tbody>    </tbody>
                            <tfoot>
                                <tr>
                                    <th><?php echo __('Unité de tracking'); ?></th>
                                    <th><?php echo __('Action'); ?></th>
                                    <th><?php echo __('Emplacement'); ?></th>
                                    <th><?php echo __('Commentaire'); ?></th>
                                    <th><?php echo __('Groupe'); ?></th>
                                    <th><?php echo __('Date/Heure'); ?></th>
                                    <th><?php echo __('Utilisateur'); ?></th>
                                    <th><?php echo __('Arrivage'); ?></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if ($sf_user->hasCredential('mouvements-ecriture')) { ?>
    <div class="modal inmodal fade" id="suppMouvement" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo __('Fermer'); ?></span></button>
                    <h4 class="modal-title"><?php echo __('Supprimer un mouvement'); ?></h4>
                </div>
                <div class="modal-body">
                    <p id="deleteMessage"><?php echo __('Voulez-vous vraiment supprimer ce mouvement ? '); ?><span id="objectName"></span><br><strong><?php echo __('Cette action est irréversible !'); ?></strong></p>
                </div>
                <div class="modal-footer">
                    <button id="cancelButton" type="button" class="btn btn-white" data-dismiss="modal"><?php echo __('Annuler'); ?></button>
                    <button id="deleteButton" type="button" class="btn btn-danger" onclick="doSuppMouvement();" ><?php echo __('Supprimer'); ?></button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
<div id="ajax-div"></div>
<script>
    var table = null;
    $(document).ready(function () {

        //Maj des slots du layout
        $('#lytHrchy').html($('#tpltLstHrchy').html());
        $("#ajax-div").hide();
        $.fn.dataTable.moment('DD/MM/YYYY HH:mm:ss');
        table = $('.dataTables').DataTable({
            order: [[5, 'desc']],
            pageLength: 100,
            lengthChange: true,
            responsive: true,
            processing: true,
            colReorder: true,
            stateSave: true,
            initComplete: function () {
                console.log("test");
                setTimeout(function () {
                    table.buttons().container().appendTo('#DataTables_Table_0_wrapper .col-sm-6:eq(0)');
                    $('#DataTables_Table_0_wrapper .col-sm-6:eq(0)').attr('class', 'col-sm-8');
                    $('#DataTables_Table_0_wrapper .col-sm-6:eq(0)').attr('class', 'col-sm-4');
                    $('#DataTables_Table_0_length').css('margin-right', '25px');
                }, 1000);
            },
            buttons: [
                <?php if ($sf_user->hasCredential('mouvements-ecriture')) { ?>
                {
                    text: 'Ajouter',
                    action: function (e, dt, node, config) {
                        showForm('<?php echo url_for(array('sf_route' => 'mouvements-new')) ?>');
                    }
                }, 'copy',
                {extend: 'print',
                    action: function (win) {
                       exporter("print");
                    }
                }, {extend: 'excel', title: 'export_mouvement',
                    action: function (win) {
                       exporter("excel");
                    }}, {extend: 'csv', title: 'export_mouvement',
                    action: function (win) {
                       exporter("csv");
                    }}, 'colvis'
                <?php } ?>],
            createdRow: function (row, data, index) {
                $(row).attr('onmousedown', 'setIdClic(event, this.id)')
            },
            serverSide: true,
            ajax: {
                url: "<?php echo url_for("mouvements-list-json") ?>",
                type: "POST",
                data: function (d) {
                    d.emplacement = $('#emplacement').val();
                    d.heureDebut = $('#heureDebut').val();
                    d.heureFin = $('#heureFin').val();
                    d.reference = $('#reference').val();
                    d.type = $('#type').val();
                }
            },
            "columns": [
                {"data": "reference"},
                {"data": "action"},
                {"data": "emplacement"},
                {"data": "commentaire"},
                {"data": "groupe"},
                {"data": "date"},
                {"data": "utilisateur"},
                {"data": "arrivage"}
            ],
            "language": {
                "sProcessing": "Traitement en cours...",
                "sSearch": "Rechercher&nbsp;:",
                "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
                "sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                "sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                "sInfoPostFix": "",
                "sLoadingRecords": "Chargement en cours...",
                "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
                "sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
                "oPaginate": {
                    "sFirst": "Premier",
                    "sPrevious": "Pr&eacute;c&eacute;dent",
                    "sNext": "Suivant",
                    "sLast": "Dernier"
                },
                "oAria": {
                    "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                    "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
                },
                "buttons": {
                    "copy": "Copier",
                    "print": "Imprimer",
                    "excel": "Export Excel",
                    "csv": "Export CSV",
                    "pdf": "Export PDF",
                    "colvis": "Affichage des colonnes",
                    "copyTitle": 'Ajouté au presse-papiers',
                    "copySuccess": {
                        _: '%d lignes ajoutées au presse-papiers',
                        1: 'Une ligne ajoutée au presse-papiers'
                    }
                },
            },
        });

        $('.dateFiltre').datetimepicker({
            format: 'DD/MM/YYYY HH:mm:ss',
            useCurrent: false,
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
        $("#heureDebut").on("dp.change", function (e) {
            $('#heureFin').data("DateTimePicker").minDate(e.date);
        });
        $("#heureFin").on("dp.change", function (e) {
            $('#heureDebut').data("DateTimePicker").maxDate(e.date);
        });
        var config = {
            disable_search_threshold: 10, //on cache le champs de recherche si il y a moins de 10 elements
            no_results_text: 'Aucun résultat!',
            allow_single_deselect: false
        };
        $('select').chosen(config);
    });
<?php if ($sf_user->hasCredential('mouvements-ecriture')) { ?>
        $(function () {

            jQuery("#context-menu-one box menu-1").contextMenu({
                selector: '.context-menu-one',
                events: {
                    show: function (opt) {
                        $('#' + m).css('background-color', '#e4e4e4');
                    },
                    hide: function () {
                        $('#' + m).css('background-color', '');
                    }
                },
                callback: function (key, options) {

                    if (key == "add") {
                        showForm('<?php echo url_for(array('sf_route' => 'mouvements-new')) ?>');
                    }
                    if (key == "edit") {
                        showForm('<?php echo url_for('mouvements-edit') ?>?id=' + m);
                    }
                    if (key == "delete") {
                        showSuppMouvementModal();
                    }
                },
                items: {
                    "add": {name: "<?php echo __('Ajouter'); ?>", icon: "add"},
                    "edit": {name: "<?php echo __('Modifier'); ?>", icon: "edit"},
                    "delete": {name: "<?php echo __('Supprimer'); ?>", icon: "delete"}
                }
            });
        });
        function showSuppMouvementModal() {
            $('#deleteMessage').html("<?php echo __('Voulez-vous vraiment supprimer ce mouvement ? '); ?>");
            $('#cancelButton').html("<?php echo __('Annuler'); ?>");
            $('#deleteButton').show();
            $('#suppMouvement').modal('show');
        }

        function doSuppMouvement() {
            $.ajax({
                url: '<?php echo url_for('mouvements-delete') ?>',
                type: 'post',
                data: {'id': m},
                success: function (data) {
                    if (data === '1') {
                        table.row('#' + m).remove().draw();
                        $('#loader').css('visibility', 'hidden');
                        $('#suppMouvement').modal('hide');
                    } else {
                        $('#deleteMessage').html("<?php echo __('Une erreur est survenue lors de la suppression!'); ?>");
                        $('#cancelButton').html("<?php echo __('OK'); ?>");
                        $('#deleteButton').hide();
                        $('#suppMouvement').modal('show');
                    }
                }
            });
        }
<?php } ?>
    function reloadList() {
        url = '<?php echo url_for(array('sf_route' => 'mouvements-list-ajax')) ?>';
        debut = $('#heureDebut').val();
        fin = $('#heureFin').val();
        emplacement = $('#emplacement').val();
        reference = $('#reference').val();
        action = $('#type').val();
        url = url + '?heureDebut=' + debut + '&heureFin=' + fin + '&emplacement=' + emplacement + '&reference=' + reference + '&type=' + action;
        $.ajax({
            url: url
        }).done(function (data) {
            table.destroy();
            $('#list-ajax-div #listMouvement').empty();
            $('#list-ajax-div #listMouvement').append(data);
            table = $('.dataTables').DataTable({
                order: [[5, 'desc']],
                pageLength: 100,
                lengthChange: false,
                responsive: true,
                processing: true,
                colReorder: true,
                stateSave: true,
                initComplete: function () {
                    console.log("test");
                    setTimeout(function () {
                        table.buttons().container().appendTo('#DataTables_Table_0_wrapper .col-sm-6:eq(0)');
                        $('#DataTables_Table_0_wrapper .col-sm-6:eq(0)').attr('class', 'col-sm-8');
                        $('#DataTables_Table_0_wrapper .col-sm-6:eq(0)').attr('class', 'col-sm-4');
                        $('#DataTables_Table_0_length').css('margin-right', '25px');
                    }, 100);
                },
                buttons: [
                    {
                        text: 'Ajouter',
                        action: function (e, dt, node, config) {
                            showForm('<?php echo url_for(array('sf_route' => 'mouvements-new')) ?>');
                        }
                    }, 'copy',
                    {extend: 'print',
                        customize: function (win) {
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
                        }
                    }, {extend: 'excel', title: 'export_vehicule'}, {extend: 'csv', title: 'export_vehicule'}, {extend: 'pdf', title: 'export_vehicule'}, 'colvis'],
                createdRow: function (row, data, index) {
                    $(row).attr('onmousedown', 'setIdClic(event, this.id)')
                },
                serverSide: true,
                ajax: {
                    url: "<?php echo url_for("mouvements-list-json") ?>",
                    type: "POST",
                    data: function (d) {
                        d.emplacement = $('#emplacement').val();
                        d.heureDebut = $('#heureDebut').val();
                        d.heureFin = $('#heureFin').val();
                        d.reference = $('#reference').val();
                        d.type = $('#type').val();
                    }
                },
                "columns": [
                    {"data": "reference"},
                    {"data": "action"},
                    {"data": "emplacement"},
                    {"data": "commentaire"},
                    {"data": "groupe"},
                    {"data": "date"},
                    {"data": "utilisateur"},
                    {"data": "arrivage"}
                ],
                "language": {
                    "sProcessing": "Traitement en cours...",
                    "sSearch": "Rechercher&nbsp;:",
                    "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
                    "sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    "sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                    "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    "sInfoPostFix": "",
                    "sLoadingRecords": "Chargement en cours...",
                    "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
                    "sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sPrevious": "Pr&eacute;c&eacute;dent",
                        "sNext": "Suivant",
                        "sLast": "Dernier"
                    },
                    "oAria": {
                        "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                        "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
                    },
                    "buttons": {
                        "copy": "Copier",
                        "print": "Imprimer",
                        "excel": "Export Excel",
                        "csv": "Export CSV",
                        "pdf": "Export PDF",
                        "colvis": "Affichage des colonnes",
                        "copyTitle": 'Ajouté au presse-papiers',
                        "copySuccess": {
                            _: '%d lignes ajoutées au presse-papiers',
                            1: 'Une ligne ajoutée au presse-papiers'
                        }
                    },
                },
            });


            jQuery("#context-menu-one box menu-1").contextMenu({
                selector: '.context-menu-one',
                events: {
                    show: function (opt) {
                        $('#' + m).css('background-color', '#e4e4e4');
                    },
                    hide: function () {
                        $('#' + m).css('background-color', '');
                    }
                },
                callback: function (key, options) {

                    if (key == "add") {
                        showForm('<?php echo url_for(array('sf_route' => 'mouvements-new')) ?>');
                    }
                    if (key == "edit") {
                        showForm('<?php echo url_for('mouvements-edit') ?>?id=' + m);
                    }
                    if (key == "delete") {
                        showSuppMouvementModal();
                    }
                },
                items: {
                    "add": {name: "<?php echo __('Ajouter'); ?>", icon: "add"},
                    "edit": {name: "<?php echo __('Modifier'); ?>", icon: "edit"},
                    "delete": {name: "<?php echo __('Supprimer'); ?>", icon: "delete"}
                }
            });

        });
    }
    function exporter(type) {
        url = '';
        switch (type) {
            case 'excel':
                url = '<?php echo url_for(array('sf_route' => 'mouvements-excel')) ?>';
                break;
            case 'word':
                url = '<?php echo url_for(array('sf_route' => 'mouvements-word')) ?>';
                break;
            case 'print':
                url = '<?php echo url_for(array('sf_route' => 'mouvements-print')) ?>';
                break;
            case 'excelDelais':
                url = '<?php echo url_for(array('sf_route' => 'mouvements-excel-delais')) ?>';
                break;
            case 'csv':
                url = '<?php echo url_for(array('sf_route' => 'mouvements-csv')) ?>';
                break;
        }
        debut = $('#heureDebut').val();
        fin = $('#heureFin').val();
        emplacement = $('#emplacement').val();
        reference = $('#reference').val();
        action = $('#type').val();
        url = url + '?heureDebut=' + debut + '&heureFin=' + fin + '&emplacement=' + emplacement + '&reference=' + reference + '&type=' + action;
        location.assign(url);
    }
</script>