/// autosave_backup()

// Autosaving Backup
if (saveBackup == true)
{
    backupTimer ++;
    
    if (backupTimer >= backupTimerMax )
    {
        if (global.allowBackup == true) // don't save unless something has changed
        {
            save_backup();
            backupTimer = 0; // putting backupTimer=0 here means it will save a backup the moment something has changed, rather than waiting for 10 minutes to elapse
            global.allowBackup = false; // wait for a new change to occur.
        }
    }
}
