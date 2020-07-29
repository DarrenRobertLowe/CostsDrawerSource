///write_log(string);
/* Writes a log entry with the given string.
 * Also writes the time the event took place.
*/

var cSecond  = date_get_second(date_current_datetime());
var cMinute  = date_get_minute(date_current_datetime());
var cHour    = date_get_hour(date_current_datetime());
var cDay     = date_get_day(date_current_datetime()); 
var cMonth   = date_get_month(date_current_datetime());
var cYear    = date_get_year(date_current_datetime());
var dateStr  = string(string(cYear) +"-" +string(cMonth) +"-" +string(cDay) +"-" +string(cHour) +"-" +string(cMinute) +"-" +string(cSecond));
var event    = string( string(dateStr) +" : " +string(argument0) );
fileContents[0] = "";



// get existing contents so we can append it
if file_exists("log")
{
    var file = file_text_open_read("log");
    
    var i=0;
    while !(file_text_eof(file))
    {
        i++;
        fileContents[i] = file_text_read_string(file);
        file_text_readln(file);
    }
    
    file_text_close(file);
}


// write new log file
var log = file_text_open_write("log");

file_text_write_string(log, event);
file_text_writeln(log);

for (var i=0; i<array_length_1d(fileContents); i++)
{
    file_text_write_string(log, fileContents[i]);
    file_text_writeln(log);
}


file_text_close(log);
