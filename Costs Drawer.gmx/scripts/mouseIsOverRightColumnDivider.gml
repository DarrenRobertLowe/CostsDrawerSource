///mouseIsOverRightColumnDivider(mouseX, mouseY)
var mouseX = argument0;
var mouseY = argument1;

if  (mouseX < (right_column_x + 3))
and (mouseX > (right_column_x - 3))
and (mouseY > global.pageStart + global.scrollbarButtonSize)
and (mouseY < SCROLLBAR.scrollAreaEndY)
  then return true;
  else return false;

