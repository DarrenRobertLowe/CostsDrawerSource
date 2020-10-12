    /// I'm not sure the below code should actually be here.
    global.selected = -1;

    var size = ds_list_size(global.listOfItems);
    var lastItem = -1;
    
    for(var i=(size-1); i>0; i--)
    {
        var item = ds_list_find_value(global.listOfItems,i);
        
        if  (item.object_index != PAGE_NUMBER)
        and (item.object_index != TOTALS)
        and (item.object_index != firstPage_Address)
        and (item.object_index != firstPage_CostsType)
        and (item.object_index != firstPage_Defendants)
        and (item.object_index != firstPage_Plaintiffs)
        and (item.object_index != firstPage_record_number)
        and (item.object_index != firstPage_CourtInfo)
        and (item.object_index != firstPage_regionInfo_line1_docVer21)
        and (item.object_index != firstPage_regionInfo_line2_docVer21)
        and (item.object_index != firstPage_regionInfo_line3_docVer21)
        and !(object_is_ancestor(item.object_index,CONSTANT_ITEM))
        {
            lastItem = item;
            i = 0;
        }
    }
    var lastRow = 0;
    if (lastItem > -1) then lastRow = (lastItem.row + lastItem.lines);
    /// I'm not sure the above code should actually be here.
    
    
    if !instance_exists(BUTTON_CreateNewItem)   then create_item(BUTTON_CreateNewItem,lastRow)//0,0,BUTTON_CreateNewItem);
    if !instance_exists(keyboard_CURSOR)        then instance_create(0,0,keyboard_CURSOR);
    if !instance_exists(itemContextMenu)        then instance_create(mouse_x,mouse_y,itemContextMenu);
    if !instance_exists(descriptionContextMenu) then instance_create(mouse_x,mouse_y,descriptionContextMenu);
    if !instance_exists(menu_File)              then instance_create(global.fileMenuX,global.menuY,menu_File);
    if !instance_exists(menu_Edit)              then instance_create(global.editMenuX,global.menuY,menu_Edit);
    if !instance_exists(menu_View)              then instance_create(global.viewMenuX,global.menuY,menu_View);
    if !instance_exists(menu_Help)              then instance_create(global.helpMenuX,global.menuY,menu_Help);
    
    reposition_menu();
    
    if !instance_exists(button_new)             then instance_create(5,32,button_new);                      
    if !instance_exists(button_open)            then instance_create(35,32,button_open);            // 30 apart within a section
    if !instance_exists(button_save)            then instance_create(65,32,button_save);  
          
    if !instance_exists(button_xlsx)            then instance_create(105,32,button_xlsx);           // 40 apart between sections      
    //if !instance_exists(button_print)           then instance_create(135,32,button_print);
    
    if !instance_exists(button_create_new_item) then instance_create(145,31,button_create_new_item);//175    
    if !instance_exists(button_delete_item)     then instance_create(175,31,button_delete_item);    //205
    if !instance_exists(button_split_tool)      then instance_create(205,31,button_split_tool);     //235
    
    if !instance_exists(button_moveItemUp)      then instance_create(245,31,button_moveItemUp);     //275
    if !instance_exists(button_moveItemDown)    then instance_create(275,31,button_moveItemDown);   //305
    
    if !instance_exists(button_zoom_in)         then instance_create(315,31,button_zoom_in);        //345
    if !instance_exists(button_zoom_out)        then instance_create(345,31,button_zoom_out);       //375
    
    if !instance_exists(button_create_new_instructions_fee) then instance_create(385,31,button_create_new_instructions_fee); //415
    
    if !instance_exists(button_print_view)      then instance_create(425,31,button_print_view);     //455
    if !instance_exists(button_spellcheck)      then instance_create(455,31,button_spellcheck);     //485
    if !instance_exists(button_bluetext)        then instance_create(485,31,button_bluetext);       //515
    
    // create main window scroll bars
    if !instance_exists(SCROLLBAR)              then instance_create(0,0,SCROLLBAR);
    if !instance_exists(SCROLLBAR_H)            then instance_create(global.scrollbarH_X1,global.scrollbarH_Y1,SCROLLBAR_H);
    if !instance_exists(warnings_SCROLLBAR)     then instance_create(0,0,warnings_SCROLLBAR);

    if !instance_exists(seniorCounsel)          then instance_create(0,0,seniorCounsel);
    if !instance_exists(juniorCounsel)          then instance_create(0,0,juniorCounsel);  
    if !instance_exists(witnesses_SCROLLBAR)    then instance_create(0,0,witnesses_SCROLLBAR);
    if !instance_exists(items_SCROLLBAR)        then instance_create(0,0,items_SCROLLBAR);
    
    // CONTROLLER OBJECTS
    if !instance_exists(WARNINGS_MASTER)        then instance_create(0,0,WARNINGS_MASTER);
    if !instance_exists(HIGHLIGHT_MULTI_ITEM)   then instance_create(0,0,HIGHLIGHT_MULTI_ITEM);
    if !instance_exists(ITEM_NUMBERS_DRAWER)    then instance_create(0,0,ITEM_NUMBERS_DRAWER);
    if !instance_exists(POPUP)                  then instance_create(0,0,POPUP);
    if !instance_exists(PROGRESS_BAR)           then instance_create(0,0,PROGRESS_BAR);
    if !instance_exists(TOOLTIPS)               then instance_create(0,0,TOOLTIPS);
    if !instance_exists(COMMON_ITEMS_CHECKER)   then instance_create(0,0,COMMON_ITEMS_CHECKER);
    if !instance_exists(SEARCH_TEXT)            then instance_create(0,0,SEARCH_TEXT);
    
    
    
    // LOAD CUSTOM ITEM VALUES FOR DEFAULT ITEMS EDITOR
    load_customItems();
