/// instructionsFee_create_destroy()


// SEE FEE LATER and INSTRUCTIONS FEE
if (seeFeeLater == true)            // if we should have an instructions fee
{
    draw_set_halign(fa_center);                                                 // align to the centre
    draw_text
    (
        global.descriptionColumnX+(global.descriptionColumnWidth/2),            // centre of the column
        seeFeeLaterY,                                                           // y position
        "see fee later"                                                         // draw "see fee later" text
    );
    
    reset_text();
    
    if (myFee == -3) then exit;
    
    if  (instructionsFee == true)    // if we CAN have an instructions fee
    {
        if  (myFee != -2)           // -2 means we will be given the ID of myFee by the instructions_fee_item itself (after loading)
        {
            if !(instance_exists(myFee))    // if fee does NOT exist...
            or (myFee == -1)                // -1 means we need to create a new instructions fee
            {
                if (object_index == item_CC_attendingForTheOrder)
                then show_message("myFee is "+string(myFee) +" - creating an instructions fee");
                
                /// find the relevant item after ours
                myFeePosition = 0;
                itemsList = global.listOfItems;
                myPos = ds_list_find_index(itemsList,id);
                
                if ( (myPos < ds_list_size(itemsList)-1) ) // if we're not the last item
                {
                    show_debug_message("id "+string(id) + " myPos is "+string(myPos));
                    
                    for (var i = (myPos+1); i<ds_list_size(itemsList); i++)
                    {
                        var nextItem = ds_list_find_value(itemsList,i);
                        show_debug_message("nextItem is "+string(nextItem));
                        
                        if  (nextItem.object_index != PAGE_NUMBER)
                        and (nextItem.object_index != TOTALS)
                        and (nextItem.instructionsFee == true)
                        and (nextItem.seeFeeLater == true)
                        {
                            if (nextItem.myFee > 0)
                            {
                                var targetFee = nextItem.myFee;
                                myFeePosition = ds_list_find_index(global.LAST_PAGE_ITEMS,targetFee);
                                
                                if (myFeePosition > -1)
                                {
                                    show_debug_message("found item with existing fee :"+string(nextItem));
                                    show_debug_message("myFeePosition is now "+string(myFeePosition));
                                    i = ds_list_size(itemsList); // exit the loop
                                }
                            }
                        }
                    }
                }
                
                var defaultPos = ds_list_find_index(global.LAST_PAGE_ITEMS,INSTRUCTIONS_FEE_TOTAL.id)
                if (myFeePosition > 0)
                  then myFee = insert_lastPage_item(INSTRUCTIONS_FEE_ITEM,myFeePosition) // create in relevent position
                  else myFee = insert_lastPage_item(INSTRUCTIONS_FEE_ITEM,defaultPos)    // create at end of instructions
                
                
                // pass values to the new instructions fee
                //myFee = instance_create(x,y,INSTRUCTIONS_FEE_ITEM) // create in relevent position
                myFee.masterID    = myID;
                myFee.master      = id;
                myFee.description = description;
                myFee.alarm[1] = 1;                   // create event
                
                if exists(POPUP)
                {
                    POPUP.alarm[0] = 1;
                    POPUP.description = "Created Instructions Fee row "+string(myFee.row);
                }
            }
            else // if we have a fee
            {
                
            }
        }
    }
}
