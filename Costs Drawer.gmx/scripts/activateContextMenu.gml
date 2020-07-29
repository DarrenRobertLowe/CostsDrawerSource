///activateContextMenu(item, fieldString, mouse used?);




item        = argument0;
field       = argument1;
usedMouse   = argument2;

/*
show_message
(
    "activating with activateContextMenu "
    +"#item is "+string(item)
    +"#field is "+string(field)
    +"#mouse is "+string(usedMouse)
);
*/

instance_activate_object(itemContextMenu);      // activate the context menu object

//if exists(itemContextMenu) then show_message("itemContextMenu exists!");

global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
//global.selected     = itemContextMenu.id;       // disable the ITEM underneath

itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
global.contextItemSelected = item;

itemContextMenu.selectedField = field;          // pass the field to the Context Menu

if (usedMouse = true)
{
    itemContextMenu.alarm[0] = 1;               // reposition the menu to MOUSE
}
else
{
    itemContextMenu.alarm[1] = 1;               // reposition the menu to KEYBOARD
}

//show_message("itemContextMenu.itemID is "+string(itemContextMenu.itemID));
