# Backups and Snapshots

!!! Note
    NodeSpace automatically creates backups of your server daily. You can create manual backups at any time through the control panel.

    Snapshots are also available for your server, allowing you to capture the current state of your server at any point in time. This can be useful for testing changes or rolling back to a previous state if needed.

## Managing Backups
To manage your backups, you will need to access the My NodeSpace portal and select your VPS instance. Once on the service page, you will need to click on "Login to Panel" button to login to the Server Management Panel. 

!!! Note
    Backup functionality is not yet built into the My NodeSpace portal. You will need to use the Server Manager directly.

![VPS Service Page](images/vps-service-login-to-panel.png)

When the Server Manager loads, select your VPS and then select the "Backups" tab to manage your backups. You will see all current backups we have for your server.

![VPS Backups](images/vps-backups.png)

You can select a backup to restore your server to a previous state. Keep in mind that restoring a backup will overwrite any changes made after the backup was created. 

![VPS Backup Restore](images/vps-backup-restore.png)

If you delete any backups, they cannot be recovered. Please ensure that you have the necessary backups before making any deletions.

!!! warning "VPS Will Be Offline During Backup Restore"
    Restoring a backup will require your VPS to be temporarily taken offline. Please plan accordingly and schedule downtime if necessary. Contact support if you would like to have a "live restore" completed. A live restore allows your VPS to remain online while the backup is being restored, but it may take longer to complete and could impact performance.

