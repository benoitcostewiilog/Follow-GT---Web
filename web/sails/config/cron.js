module.exports.cron = {
  tableSyncCron: {
    schedule: '*/30 * * * * *',
    onTick: function () {
       TableSyncService.updateTableSync(WrkGroupe,true);
       TableSyncService.updateTableSync(RefEmplacement,true);
       TableSyncService.updateTableSync(SfGuardUser,true);
       TableSyncService.updateTableSync(WrkInventaire,true);
       TableSyncService.updateTableSync(WrkMouvement,true);
       TableSyncService.updateTableSync(AdmParametrage,true);
    },
    start: true
  }
};
