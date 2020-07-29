/* DRAW ITEM NUMBERS
 * 
 * Iterates through every item and displays their
 * item number, if they are set to be counted.
 *
*/

draw_set_font_scaled("font_Times");
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(itemNoColor);

ds_list_clear(list);
ds_list_clear(list2);

ds_list_copy(list, global.listOfItems);
ds_list_copy(list2,global.LAST_PAGE_ITEMS);

var size = ds_list_size(list2);

for(var i=0; i<size; i++)
{
    var item = ds_list_find_value(list2,i);
    ds_list_add(list,item);
}


size = ds_list_size(list);
var myItemNumber = 0;                                               // this is the number used for drawing

for(i=0; i<size; i++)
{
    var item = ds_list_find_value(list,i);
    
    if ( instance_exists(item) )
    {
        // draw the itemNo text on each item
        //var xx = ( global.cColumnX - global.textMargin );
        var yy = 0;
        
        if  !(is_undefined(item.row))
          then yy = getYFromRow(item.row + 1);                      // item.textPosY
        
        if (item.countMyItemNumber == true)
        {
            draw_set_color(c_black);
            myItemNumber += 1;                                      // increase the number drawn
            draw_text(xx,yy,myItemNumber);
        }
        else
        {
            if  (item.canToggleItemNumber == true)
            and (global.PRINT_VIEW == false)
            {
                draw_set_color(c_gray);
                draw_text(xx,yy,"»");//"¤");//"o");
            }
        }
    }
}

reset_text();
