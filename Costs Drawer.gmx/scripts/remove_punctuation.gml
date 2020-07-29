/// remove_punctuation(string)
/* Note: this script will not remove "-" or "'".
 *
 */
 
var str = argument0;

str = string_replace_all(str," ","");
str = string_replace_all(str,".","");
str = string_replace_all(str,",","");
str = string_replace_all(str,")","");
str = string_replace_all(str,"(","");
str = string_replace_all(str,"]","");
str = string_replace_all(str,"[","");
str = string_replace_all(str,"!","");
str = string_replace_all(str,"?","");

return str;
