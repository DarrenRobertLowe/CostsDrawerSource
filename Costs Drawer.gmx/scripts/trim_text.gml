///trim_text(string,width);

var originalStr = argument0;
var trimmedStr  = "";
var len         = string_length(originalStr)+1;
var width       = argument1;
var margin      = 4;

for (var i=0; i<len; i++)
{
    trimmedStr = string_copy(originalStr,1,i);          // add one letter at a time
    if (string_width(trimmedStr) >= (width-margin)) then i=len;  // exit the loop if we're over the width
}

return trimmedStr;
