///load_customItems_getVal()

// find up to the ;
var pos = string_pos("^", line)

// escape if there's a problem
if (pos == 0)
{
    write_log("ERROR loading custom items! Could not find separator char for quantum value!");
    return -1;
}

// add value to array
val  = string_copy(line, 0, pos-1);
line = string_copy(line, pos+1, string_length(line));
return val;
