/// retrieve_update_link(scraped string);
var t_str = argument0;

show_debug_message("retrieve_update_link() running");

var dataBlock = "";


// GET FILE FORMAT
    var verpos1 = string_pos("-UPDATE FORMAT-",t_str);
    verpos1 += string_length("-UPDATE FORMAT-");                // start at the end of that string
    var verpos2 = string_pos("-END UPDATE FORMAT-",t_str);      // end at the start of that string
    
    var count = (verpos2 - verpos1);
    dataBlock = string_copy(t_str, verpos1, count);
    show_debug_message("Scraped format as "+string(dataBlock));
    write_log("Update Format expect is "+string(dataBlock));
    global.UPDATE_FORMAT = string_letters(string('"') + (dataBlock) +('"'));
    
    

    
// FIND RELEVANT LINK
var pos1 = 0;
var pos2 = 0;

if (global.UPDATE_FORMAT == "exe")
{
    // POSITION OF EXE LINK
    pos1 = string_pos("-START EXE ONLY LINK-",t_str);
    pos1 += string_length("-START EXE ONLY LINK-");        // start at the end of that string
    pos2 = string_pos("-END EXE ONLY LINK-",t_str);    // end at the start of that string
}
else //(global.UPDATE_FORMAT == "installer")
{
    // POSITION OF INSTALLER LINK
    pos1 = string_pos("-START INSTALLER LINK-",t_str);
    pos1 += string_length("-START INSTALLER LINK-");        // start at the end of that string
    pos2 = string_pos("-END INSTALLER LINK-",t_str);    // end at the start of that string
}

// EXTRACT THE LINK
var count = (pos2 - pos1);
dataBlock = string_copy(t_str, pos1, count);
show_debug_message("Scraped download link as "+string(dataBlock));
global.UPDATE_LINK = string(dataBlock);//string('"') + (dataBlock) +('"');
show_debug_message("Finished download link as "+string(global.UPDATE_LINK));



// WRITE LINK TO FILE
var fileName = "preferences.ini";

if ( file_exists(fileName) )
{
    var section = "UPDATE";
    var key   = "";
    var value = 0;
    
    
    ini_open(fileName);
    file_text_open_write(fileName);
    
    value = global.UPDATE_LINK;
    key   = "last_update_link";
    ini_write_string(section, key, value);
    
    value = global.UPDATE_FORMAT;
    key   = "last_update_format";
    ini_write_string(section, key, value);
    
    ini_close();
}
