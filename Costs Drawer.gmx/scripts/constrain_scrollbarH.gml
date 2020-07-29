/// constrain_scrollbarH()
/* 
 * Keeps the scrollbar's x position within
 * the scrollbar area.
*/


if (x + width) > scrollAreaEndX
    then x = (scrollAreaEndX - width);

if x < (scrollAreaStartX)
    then x = (scrollAreaStartX);
