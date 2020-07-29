/// highlight_delete();
// we need to have the lower pos as start
var e = endChar;
var s = startChar;

if (s > e)
{
    s = endChar;
    e = startChar;
}


var count = (e - s);
var str = string_copy(workingString, s+1, count);

workingString       = string_delete(workingString, s+1, count);
highlightingText    = false;
refresh_string_position(stringPosition);

set_unsaved();

startChar = 0;
endChar = 0;
editingDescription  = false;
global.selected     = -1;
