// reposition_menu()
/* repositions the menu items depending 
 * on the global.GUI_SCALE
*/
if (global.GUI_SCALE == 1)
{
    menu_File.x = global.fileMenuX;
    menu_Edit.x = global.editMenuX;
    menu_View.x = global.viewMenuX;
    menu_Help.x = global.helpMenuX;
}

if (global.GUI_SCALE == 1.5)
{
    menu_File.x = global.fileMenuX;
    menu_Edit.x = global.editMenuX + 7;
    menu_View.x = global.viewMenuX + 17;
    menu_Help.x = global.helpMenuX + 30;
}


menu_File.startX = menu_File.x;
menu_Edit.startX = menu_Edit.x;
menu_View.startX = menu_View.x;
menu_Help.startX = menu_Help.x;
