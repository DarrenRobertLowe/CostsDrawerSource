
var myScroll    = argument0;
var str         = argument1;

strLen = string_length(str);
var chars = strLen-(myScroll-1)
var charWidth = global.estimatedCharacterWidth;         // the width of a single character (estimated)

//var scrollAW = scrollAreaWidth;
//if (scrollbarShown == false) then scrollAW -= width;       // if the vertical scrollbar is shown, we can't show as many chars

var maxChars = ((scrollAreaWidth - 35) / charWidth);    // -30 to leave room for the edit and delete buttons
if (chars > maxChars) then chars = maxChars;
str = string_copy(str,myScroll,chars);
return str;
