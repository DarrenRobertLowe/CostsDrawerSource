/// backups_create_date_for_deletion();
// create the new target date for prompting

var currentTime = date_current_datetime();
        
var year   = date_get_year(currentTime);
var month  = date_get_month(currentTime);
var day    = date_get_day(currentTime);
var hour   = date_get_hour(currentTime);

var targetDateTime = date_create_datetime(year,month,day+backupDelay,hour,1,1)

session_write_backupDeleteDate(targetDateTime);
