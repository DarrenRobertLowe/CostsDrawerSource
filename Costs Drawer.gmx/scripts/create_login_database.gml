/// create_login_database()
show_debug_message("create_login_database() running");

ds_list_clear(loginDatabase);
show_debug_message("cleared loginDatabase!");

// we have to grab the text AFTER "----START DATA----"
var pos1 = string_pos("-START DATA-",r_str);
pos1 += string_length("-START DATA-");        // start at the end of that string
var pos2 = string_pos("-END DATA-",r_str);    // end at the start of that string

var count = (pos2 - pos1);
database = string_copy(r_str, pos1, count);
show_debug_message(database);



// CREATE THE DATABASE
while (string_length(database) > 0)
{
    //show_debug_message("separating list into separate strings!");
    var pos = string_pos(";;",database);
    var val = string_copy(database,1,pos);
    
    show_debug_message("ripped string: "+string(val));
    
    val = base64_decode(val);
    val = base64_decode(val);
    show_debug_message("decoded string: "+string(val));
    
    //var val2 = decrypt_database_entry(val);
    
    ds_list_add(loginDatabase,val);
    
    database = string_delete(database,1,pos+2);
}


//EXTRACT THE DATE LIST
ds_list_clear(dateList);
var size = ds_list_size(loginDatabase);
for(var i=0; i<size; i++)
{
    // remove all but the dates
    var str  = ds_list_find_value(loginDatabase,i);
    var pos  = string_pos("^",str);
    var date = string_copy(str,pos+1,8);
    //show_debug_message("Date extracted as "+string(date));
    ds_list_add(dateList,date);
}


//EXTRACT THE CODES LIST
ds_list_clear(codeList);
var size = ds_list_size(loginDatabase);
for(var i=0; i<size; i++)
{
    // remove all but the dates
    var str  = ds_list_find_value(loginDatabase,i);
    var pos  = string_pos("^",str);
    var code = string_copy(str,1,pos-1);
    //show_debug_message("Code extracted as "+string(code));
    ds_list_add(codeList,code);
}
