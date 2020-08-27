/// load_customItems_getDescription()

// find up to the ;
var pos = string_pos(";", line)

// escape if there's a problem
if (pos == 0)
{
    show_message("ERROR loading custom items!");
    exit;
}

// add description to array
str  = string_copy(line,0,pos);
array[0,0] = str;

// delete the description from the line
line = string_delete(line,0,pos);
