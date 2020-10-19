/// load_customItems_getDescription()

// find up to the ;
var pos = string_pos("^", line)

// escape if there's a problem
if (pos == 0)
{
    write_log("ERROR loading custom items! Could not find separator char for description!");
    return "";
}

// add description to array
var desc = string_copy(line, 0, pos-1);

// delete the description from the line
line = string_copy(line, pos+1, string_length(line));

return desc;
