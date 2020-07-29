//mouseIsOverWindowResizeArea();

var mouseX = argument0;
var mouseY = argument1;
var windowWidth  = window_get_width();
var windowHeight = window_get_height();
var margin = 10;

if ( mouseX <= margin )
or ( mouseX >= ( windowWidth-margin) )
or ( mouseY <= margin )
or ( mouseY >= ( windowHeight-margin) )
 then return true;
 else return false;
