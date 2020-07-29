/// copy_cut(startChar, endChar, workingString, 'C' or 'X');
/* @Returns void
 * @Param string
 * @argument0 : either 'C' or 'X' as strings, including the quotes.
 * @description: takes the above string and decides to Cut or Ccpy the
 * given text.
 */

var startC      = argument0;
var endC        = argument1;
var workingStr  = argument2;
var mode        = argument3;
var selected    = global.selected;


if  ( keyboard_check_pressed(ord(string(mode))) )
and (global.textHighlightable == true)
{
    if ( exists(selected) )
    {
        if ( selected.editingDescription == true )
        {
            with (selected)
            {
                // we need to have the lower pos as start
                var e = endC;
                var s = startC;
                
                if (s > e)
                {
                    s = endC;
                    e = startC;
                }
                
                // Do the thing
                var count = (e - s);
                var str = string_copy(workingStr, s+1, count);
                clipboard_set_text(str);
                
                if (string(mode) == 'X') then highlight_delete();
            }
        }
    }
}
