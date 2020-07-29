/// confirmed()
if keyboard_check_released(vk_escape)
or keyboard_check_released(vk_enter)
or mouseClickOutsideArea(global.descriptionColumnX,borderStartY,global.outlayColumnX,borderEndY + global.rowHeight)
return true;
else return false;
