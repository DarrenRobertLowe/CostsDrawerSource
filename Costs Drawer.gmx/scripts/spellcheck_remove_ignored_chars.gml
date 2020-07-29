/// spellcheck_remove_ignored_chars(string)
// returns string

var str = argument0;

string_replace_all(str,"(","");
string_replace_all(str,")","");
string_replace_all(str,"]","");
string_replace_all(str,"[","");

return str;
