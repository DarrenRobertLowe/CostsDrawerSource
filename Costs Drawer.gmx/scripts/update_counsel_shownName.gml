/// update_counsel_shownName(senior or junior counsel name)


var str = string(argument0);
var len = string_length(str);
var str2 = "";

for(var i=0; i<len; i++)
{
    str2 = string_copy(str,1,i);
    var strWidth = string_width(str2);
    
    if (strWidth >= boxWidth)
    then i = len;
}

shownName = str2;
