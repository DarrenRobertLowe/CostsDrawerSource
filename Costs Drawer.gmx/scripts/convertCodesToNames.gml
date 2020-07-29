/// convertCodesToNames(description)

var str = argument0;

/*if (global.SENIOR_COUNSEL != "")
  then str = string_replace(str,"[sc]",string(global.SENIOR_COUNSEL));
  else str = string_replace(str,"[sc]","senior counsel");

if (global.JUNIOR_COUNSEL != "")
  then str = string_replace(str,"[jc]",string(global.JUNIOR_COUNSEL));
  else str = string_replace(str,"[jc]","junior counsel");
*/

if (global.SENIOR_COUNSEL != "")
 then str = string_replace(str,"[senior counsel]",string(global.SENIOR_COUNSEL));

if (global.JUNIOR_COUNSEL != "")
 then str = string_replace(str,"[junior counsel]",string(global.JUNIOR_COUNSEL));
 
return str;
