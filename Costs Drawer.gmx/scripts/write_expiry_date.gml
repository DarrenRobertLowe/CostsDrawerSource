/// write_expiry_date();

var fname = "chkd";

if ( file_exists(fname) )
{
    show_debug_message("write_expiry_date: A chkd file found! We'll delete it before continuing!");
    file_delete(fname);
}

//show_message("file name not found, so we'll add it");
file = file_text_open_write(fname);



/// SET THE DATE FOR EXPIRATION
//var year    = (current_year + 1);
//var month   = current_month;
//var day     = min(current_day,27);

// these must be set for each customer manually
// until we get online validation going.
// See the database file in business docs folder.
//var year    = 2021;// (current_year + 1);
//var month   = 01;
//var day     = 01;


debug_message("date we'll be writing : "+string(year)+string(month)+string(day));
var dateString = encrypt_date(year,month,day);

file_text_write_string(file,dateString);
file_text_close(file);




