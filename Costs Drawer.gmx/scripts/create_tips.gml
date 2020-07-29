/// create_tips();
show_debug_message("create_tips() running");

var dataBlock = "";
var list = global.tipsList;
ds_list_clear(list);
show_debug_message("Cleared tips. Creating again from webserver.");

// we have to grab the text AFTER "-START DATA-"
var pos1 = string_pos("-START TIPS-",t_str);
pos1 += string_length("-START TIPS-");        // start at the end of that string
var pos2 = string_pos("-END TIPS-",t_str);    // end at the start of that string

var count = (pos2 - pos1);
dataBlock = string_copy(t_str, pos1, count);
show_debug_message("Scraped "+string(dataBlock));



// CREATE THE dataBlock
while (string_length(dataBlock) > 0)
{
    show_debug_message("separating tips into individual strings...");
    var pos = string_pos(";",dataBlock);
    var val = string_copy(dataBlock,1,pos-1);
    
    show_debug_message("ripped string: "+string(val));
    
    ds_list_add(list,val);
    
    dataBlock = string_delete(dataBlock,1,pos+1);
}

save_tips();
