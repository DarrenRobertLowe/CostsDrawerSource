/// scrollbar_draw_content();


if ( ds_list_size(list) > 0 )
{
    // FONT
    if (global.GUI_SCALE == 1.5)
    {
        separation = (global.rightColumnItemsSeparation * 1.5)
        draw_set_font(font_GUI_large);
    }
    else
    {
        separation = global.rightColumnItemsSeparation;
        draw_set_font(font_GUI);
    }
    draw_set_halign(fa_left);
    var headerY = (windowY1 - global.rightColumnWindowHeaderHeight);
    var sep     = separation;
    var strLen  = 0;
    xx = view_xview[0] + ( global.rightColumnWindowsX1 + global.textMargin );
    yy = view_yview[0] + ( headerY + starty + separation );
    
    
    // calculation
    maxDrawn = (maxShown - hScrollBar.scrollbarShown);
    
    
    // draw the items and buttons
    for(i=0; i<(maxDrawn); i++)
    {
        if (i >= size)
        {
            i = maxDrawn;
            exit;
        }
        
        var 
        str = "";
        
        if (object_index == witnesses_SCROLLBAR)    // witnesses use object.name
        {
            var witness = ds_list_find_value(list, currentPos + i);
            if ( !is_undefined(witness) )
            {
                str = witness.name;
            }
        }
        else
        {
            str = ds_list_find_value(list, currentPos + i);
        }
        
        
        if ( !is_undefined(str) )
        {
            var finalString = hScrollbarCountChars(myScroll,str); // how many chars are drawn horizontally
            
            // draw the list text
            draw_set_color(global.itemTextColor);
            if (i < size) then draw_text(xx, yy+(i*sep), finalString);
        }
    }
    
    // CLEANUP
    reset_text();
}
