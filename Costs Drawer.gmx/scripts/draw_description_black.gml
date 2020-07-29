for(var i=0; i<ds_list_size(shownDescriptionList); i+=1)        // go line by line through description
{
    draw_text
    (                                                   // draw_text(...
        descriptionX,                                   // x,
        textPosY + (i*rowHeight),                       // y,
        ds_list_find_value(shownDescriptionList,i)      // "string" )
    );
}
