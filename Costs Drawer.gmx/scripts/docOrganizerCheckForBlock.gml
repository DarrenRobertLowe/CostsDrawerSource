///docOrganizerCheckForBlock(item);
var item        = argument0;
var itemRowEnd  = ((item.row + item.lines)-1);



/// BLOCK ITEM?
//if   exists(item.blockParent)
//if  (item.blockParent == -1)
{
    if (ds_list_size(item.blockChildList) > 0)  // and (isBlock)    // uncomment if you want to be able to turn on and off blocks.
    {
        var childList       = item.blockChildList;                              // get our child list
        var childListSize   = ds_list_size(childList);                          // get that size
        
        if (item.object_index == lastPage_WITNESSES)
          then childListSize = 1;                                               // witnesses only have 1
    
          
        ////
        /*
        if (item.object_index == WITNESS) then show_message("witness " + string(item) +" has block children");
        if (item.object_index == WITNESS) then show_message("witness " + string(item) +" row is " +string(item.row));
        if (item.object_index == WITNESS) then show_message("witness " + string(item) +" lines is " +string(item.lines));
        if (item.object_index == WITNESS) then show_message("witness " + string(item) +" item row+lines is " +string(item.row + item.lines));
        
        if (item.object_index == lastPage_WITNESSES) then show_message("lPW row is " +string(item.row));
        if (item.object_index == lastPage_WITNESSES) then show_message("lPW itemRowEnd is " +string(itemRowEnd));
        */////
        
        // find the last row of the last child item
        for(var ind=0; ind<childListSize; ind++)                                // loop through list
        {
            var childItem = ds_list_find_value(childList,ind);                  // get the child item id
            
            if  !(is_undefined(childItem))
            and (instance_exists(childItem))
            {
                if (childItem.object_index == VAT) then itemRowEnd --;          // VAT goes directly after item  //show_message("prev itemRowEnd = " +string(itemRowEnd));
                
                itemRowEnd += (childItem.lines);                                // that's the last row //show_message("new itemRowEnd for " +string(childItem) +" = " +string(itemRowEnd))
                
                
                //if (item.object_index == lastPage_WITNESSES) then show_message("lPW itemRowEnd is now " +string(itemRowEnd));
                //if (item.object_index == WITNESS) then show_message("witness " + string(item) +" itemRowEnd after block children is now " +string(itemRowEnd));
                
                if (childItem.blockChildList > 0)                               // unless there is a sub child list?
                {
                    var subList = childItem.blockChildList;
                    
                    //if (item.object_index == lastPage_WITNESSES) then show_message("child item has a childList too");
                    //if (item.object_index == WITNESS) then show_message("child item has a childList too");
                    
                    for(var subInd = 0; subInd < ds_list_size(subList); subInd++)
                    {
                        var subChildItem = ds_list_find_value(subList,subInd);
                        
                        if  !(is_undefined(subChildItem))
                        and (instance_exists(subChildItem))
                        {
                            itemRowEnd += subChildItem.lines;
                        }
                    }
                    
                    //if (item.object_index == lastPage_WITNESSES) then show_message("itemRowEnd is now " +string(itemRowEnd));
                    //if (item.object_index == WITNESS) then show_message("WITNESS itemRowEnd is now " +string(itemRowEnd));
                }
            }
        }
    }
}

//if (item.object_index == lastPage_WITNESSES) 
//or (item.object_index == WITNESS)
//  then show_message("returning itemRowEnd as "+string(itemRowEnd));

return itemRowEnd;
