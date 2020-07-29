///mouseInsideWindow()
var mouseX      = argument0;
var mouseY      = argument1;
var windowWidth = argument2;

if  ( mouseX < (windowWidth-5) )
and ( mouseX > 5 )
and ( mouseY < (windowWidth-5) )
and ( mouseY > 5 )
  then return true;
  else return false;

