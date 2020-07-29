/// constrain_scrollbar()
/* 
 * Keeps the scrollbar's y position within
 * the scrollbar area.
*/


if (y+height) > (scrollAreaEndY)
    then y = (scrollAreaEndY - height);

if y < (scrollAreaStartY)
    then y = (scrollAreaStartY);
