///activateDescriptionContextMenu(item, fieldString, mouse used?);

item        = argument0;
field       = argument1;
usedMouse   = argument2;


//instance_activate_object(descriptionContextMenu);      // activate the context menu object


global.menuSelected = descriptionContextMenu.id;       // only allow this GUI menu item to show
//global.selected     = itemContextMenu.id;       // disable the ITEM underneath

descriptionContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
descriptionContextMenu.selectedField = field;          // pass the field to the Context Menu

if (usedMouse = true)
{
    with (descriptionContextMenu)
    {
        event_user(0);
    }
    //descriptionContextMenu.alarm[0] = 1;               // reposition the menu to MOUSE
}
else
{
    with (descriptionContextMenu)
    {
        event_user(1);
    }
    //descriptionContextMenu.alarm[1] = 1;               // reposition the menu to KEYBOARD
}
