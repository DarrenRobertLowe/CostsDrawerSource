
var val = false;

if mouseOverGuiTop()         then val = true;
if mouseOverGuiFooter()      then val = true;
if mouseOverGuiRightColumn() then val = true;
if mouseOverScrollbarH()     then val = true;
if (global.menuSelected > 0) then val = true;

return val
