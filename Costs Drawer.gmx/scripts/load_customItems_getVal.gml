///load_customItems_getVal()

// find up to the ;
var pos = string_pos(";", line)

// escape if there's a problem
if (pos == 0)
{
    show_message("ERROR loading custom items!");
    return -1;
}

// add description to array
val  = real(string_copy(line,0,pos));
array[0, 1] = val;

// delete the description from the line
line = string_delete(line,0,pos);


// PROFESSIONAL
// find up to the ;
var pos = string_pos(";", line)

// escape if there's a problem
if (pos == 0)
{
    show_message("ERROR loading custom items!");
    exit;
}


// add description to array
val  = real(string_copy(line,0,pos));
return val;
