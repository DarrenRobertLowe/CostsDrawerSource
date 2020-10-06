///text_remove_special_chars_lite();

var str = argument0;

str = string_replace_all(str,"#",""); // these will break description
str = string_replace_all(str,";",""); // these will break save files
str = string_replace_all(str,"^",""); // these will break save files

return str;
