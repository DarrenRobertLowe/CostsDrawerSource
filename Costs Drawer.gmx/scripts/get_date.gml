/// getDate()
/* Event:
 * Called when left clicking on a date field.
 * 
 * Description:
 *  Displays a selection of dates and allows the
 *  user to select one.
 *
 * Related To:
 *  create_global_lists     // global.yearList is created there
*/

// draw the years
var xx = 100;
var yy = 100;
var textHeight = 20;
draw_set_colour(c_black);

for(i=current_year;i>(current_year-8);i--){
    draw_text(
            xx,
            yy + (i*textHeight),
            ds_list_find_value(global.yearList,i)
            );
}
