<div class="wrapper wrapper-content animated fadeInRight">
    <div id="tpltNvuHrchy" class="hidden">
        <ol class="breadcrumb">
            <li>
                <a href="#"><?php echo __('Paramétrages'); ?></a>
            </li>
            <li>
                <a onclick="goBack();"><?php echo __('Utilisateurs'); ?></a>
            </li>
            <li class="active">
                <strong><?php echo __('Ajouter un utilisateur'); ?></strong>
            </li>
        </ol>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><?php echo __('Formulaire d\'ajout d\'un utilisateur'); ?></small></h5>
                </div>
                <div class="ibox-content">
                    <form action="<?php echo url_for('@utilisateur-create') ?>" id="formAjout" class="form-horizontal" method="POST">
                        <?php
                        echo $form['_csrf_token'];
                        echo $form['id'];
                        ?>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Nom d\'utilisateur'); ?></label>
                            <div class="col-sm-10"><?php echo $form['username']->render(array('class' => 'form-control')); ?></div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Mot de passe'); ?></label>
                            <div class="col-sm-10"><?php echo $form['password']->render(array('class' => 'form-control')); ?></div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Confirmation'); ?></label>
                            <div class="col-sm-10"><?php echo $form['password_again']->render(array('class' => 'form-control')); ?></div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Mot de passe nomade'); ?></label>
                            <div class="col-sm-10"><?php echo $form['password_nomade']->render(array('class' => 'form-control')); ?></div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Groupe'); ?></label>
                            <div class="col-sm-10"><?php echo $form['groups_list']->render(array('class' => 'form-control')); ?></div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group"><label class="col-sm-2 control-label"><?php echo __('Utilisateur actif'); ?></label>
                            <div class="col-sm-10">
                                <?php echo $form['is_active']->render(array('class' => 'i-checks')); ?>
                                <span class="help-block m-b-none"><?php echo __('Si l\'utilisateur est inactif, il ne pourra pas se connecter à l\'application'); ?></span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-white" onclick="goBack();" type="button"><?php echo __('Annuler'); ?></button>
                                <button class="btn btn-primary" onclick="enregistrerUtilisateur();" type="button"><?php echo __('Enregistrer'); ?></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var erreurPrenom = false;
    var erreurNom = false;
    var erreurMail = true;
    var erreurUser = true;
    var erreurMdp = true;
    var erreurConf = true;
    var erreurTel = false;

    $(document).ready(function () {
        //Maj des slots du layout
        $('#lytHrchy').html($('#tpltNvuHrchy').html());

        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_flat-blue'
        });

        $("#sf_guard_user_username").focusout(function () {
            if ($("#sf_guard_user_username").val() != "") {
                if (controlNomUser($('#sf_guard_user_username').val())) {
                    erreurUser = false;
                }
            } else {
                setHasError("#sf_guard_user_username");
                erreurUser = true;
            }
        });

        $("#sf_guard_user_password").focusout(function () {
            if ($("#sf_guard_user_password").val() != "" && $("#sf_guard_user_password").val().length >= 6) {
                setHasSuccess("#sf_guard_user_password");
                erreurMdp = false;
            } else {
                setHasError("#sf_guard_user_password");
                erreurMdp = true;
                if ($("#sf_guard_user_password").val().length < 6 && $("#sf_guard_user_password").val() != "")
                    controleLongMdp();
            }
        });

        $("#sf_guard_user_password_again").focusout(function () {
            if ($("#sf_guard_user_password").val() != $("#sf_guard_user_password_again").val() || ($("#sf_guard_user_password_again").val() == "" && $("#sf_guard_user_password").val() != "")) {
                setHasError("#sf_guard_user_password_again");
                erreurConf = true;
                if ($("#sf_guard_user_password").val() != $("#sf_guard_user_password_again").val() && !erreurMdp)
                    controleVerifMdp();
            } else {
                if ($("#sf_guard_user_password_again").val() == "" || $("#sf_guard_user_password").val().length < 6) {
                    setHasError("#sf_guard_user_password_again");
                    erreurConf = true;
                } else {
                    setHasSuccess("#sf_guard_user_password_again");
                    erreurConf = false;
                }
            }
        });
        var config = {
            disable_search_threshold: 10, //on cache le champs de recherche si il y a moins de 10 elements
            no_results_text: 'Aucun résultat!',
            allow_single_deselect: false,
            width: "100%",
            placeholder_text_multiple: 'Choisir des groupes'
        };
        $('#sf_guard_user_groups_list').chosen(config);
    });


    function controleLongMdp() {
        $('#sf_guard_user_password').qtip({
            position: {
                corner: {
                    target: 'topRight',
                    tooltip: 'bottomLeft'
                }
            },
            content: 'Le mot de passe doit contenir au moins 6 caractères',
            show: {
                ready: true,
                when: {event: false}
            },
            hide: {when: {event: 'click'}},
            style: {
                name: 'dark',
                tip: true
            }
        });
    }

    function controleVerifMdp() {
        $('#sf_guard_user_password_again').qtip({
            position: {
                corner: {
                    target: 'topRight',
                    tooltip: 'bottomLeft'
                }
            },
            content: 'Les deux mots de passes ne correspondent pas',
            show: {
                ready: true,
                when: {event: false}
            },
            hide: {when: {event: 'click'}},
            style: {
                name: 'dark',
                tip: true
            }
        });
    }


    function controleNomUserTip() {
        $('#sf_guard_user_username').qtip({
            position: {
                corner: {
                    target: 'topRight',
                    tooltip: 'bottomLeft'
                }
            },
            content: 'Ce nom d\'utilisateur existe déjà !',
            show: {
                ready: true,
                when: {event: false}
            },
            hide: {when: {event: 'click'}},
            style: {
                name: 'dark',
                tip: true


            }
        });
    }

    function controlNomUser(nom) {
        var retour;
        $.ajaxSetup({async: false});
        $.post("<?php echo url_for('controleNomUser') ?>", {'name': nom},
        function (data)
        {
            if (data == "") {
                setHasSuccess("#sf_guard_user_username");
                retour = true;
            }
            else {
                setHasError("#sf_guard_user_username");
                controleNomUserTip();
                retour = false;
            }
        });
        return retour;
    }


    function enregistrerUtilisateur() {
        var erreur = false;

        if (erreurUser) {
            setHasError('#sf_guard_user_username');
            erreur = true;
        }
        if (erreurMdp) {
            setHasError('#sf_guard_user_password');
            erreur = true;
        }
        if (erreurConf) {
            setHasError('#sf_guard_user_password_again');
            erreur = true;
        }

        if ($("#sf_guard_user_password").val() != $("#sf_guard_user_password_again").val() && !erreurConf) {
            setHasError('#sf_guard_user_password');
            setHasError('#sf_guard_user_password_again');
            erreurMdp = true;
            erreurConf = true;
            erreur = true;
        }

        if ($("#sf_guard_user_password").val().length < 6)
            controleLongMdp();
        else if ($("#sf_guard_user_password").val() != $("#sf_guard_user_password_again").val())
            controleVerifMdp();


        if (!erreur) {
            $('#formAjout').submit();
        }

    }


</script>