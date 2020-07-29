/// text_remove_special_characters(string);

var str = argument0;
str = string_replace_all(str,"[",""); // prevents tags from being used
str = string_replace_all(str,"]",""); // prevents tags from being used

str = string_replace_all(str,"^","");
str = string_replace_all(str,";","");
str = string_replace_all(str,">","");
str = string_replace_all(str,"<","");
str = string_replace_all(str,"%","");
str = string_replace_all(str,"*","");
str = string_replace_all(str,"/","");
str = string_replace_all(str,"\","");
str = string_replace_all(str,'"','');

return str;

