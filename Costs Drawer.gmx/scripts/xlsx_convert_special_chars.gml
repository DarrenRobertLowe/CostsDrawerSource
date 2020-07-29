/// xlsx_convert_special_chars(string);
/* returns string
 * Converts special characters that break xlsx documents into
 * their "Entity Reference" so that everything displays
 * correctly.
*/

var str = argument0;


str = string_replace_all(str,"&","&amp;");    // ampersand
str = string_replace_all(str,"<","&lt;");     // less than
//string_replace_all(str,">","&gt;");     // greater than
//string_replace_all(str,"'","&apos;");   // apostrophe
//string_replace_all(str,'"',"&quot;");   // double-quote

return str;
