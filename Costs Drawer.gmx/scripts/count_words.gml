/// count_words()
/* goes through each item
 * goes through each description
 * Counts each space as a word (double spaces aren't allowed in Costs Drawer, handy!)
 * adds words to the word count variable
 * returns the total word count
*/
global.WORD_COUNT_COUNT++;
show_debug_message("***************** STARTING WORD COUNT *****************" +string(global.WORD_COUNT_COUNT));
var wordCount = 0;

wordCount += 3; // AN CHUIRT CHUARDA
wordCount += 3; // CIRCUIT COURT
wordCount += 3; // Record Number
wordCount += 3; // COSTS OF PLAINTIFF

wordCount += 7; // estimate of address length
/*
if exists(firstPage_Address)
{
    with (firstPage_Address)
    {
        repeat 2 // firstpage and lastpage
        {
            if (addressLine1 != defaultAddressLine1)
            {
                wordCount += (string_count(" ",addressLine1)+1);
            }
            
            if (addressLine2 != defaultAddressLine2)
            {
                wordCount += (string_count(" ",addressLine2)+1);
            }
            
            if (addressLine3 != defaultAddressLine3)
            {
                wordCount += (string_count(" ",addressLine3)+1);
            }
            
            if (addressLine4 != defaultAddressLine4)
            {
                wordCount += (string_count(" ",addressLine4)+1);
            }
            
            if (addressLine5 != defaultAddressLine5)
            {
                wordCount += (string_count(" ",addressLine5)+1);
            }
            
            if (addressLine6 != defaultAddressLine6)
            {
                wordCount += (string_count(" ",addressLine6)+1);
            }
            
            if (addressLine7 != defaultAddressLine7)
            {
                wordCount += (string_count(" ",addressLine7)+1);
            }
        }
    }
}
*/

with (ITEM)
{
    if (object_index != BUTTON_CreateNewItem)
    {
        if (hasDescription == true)
        {
            //show_debug_message("counting words in " +string(object_get_name(object_index)));
            var list = shownDescriptionList;
            var size = ds_list_size(list);
            
            //show_debug_message("starting item "+string(object_get_name(object_index)));
            var debugCount = 0;
            for (var i=0; i<size; i++)
            {
                var str = ds_list_find_value(list,i);
                
                debugCount += string_count(" ",str);
                wordCount  += string_count(" ",str);
                
                if (i > 0)
                {
                    //debugCount -=2;
                    wordCount  -=2; // each space implies a word, sub lines start with 2 spaces
                }
            }
            wordCount++;  // add 1 because first word won't be counted
            debugCount++; // add 1 because first word won't be counted

            if (object_index == PLAINTIFF)
            or (object_index == DEFENDANT)
            {
                if (andOthers == true)
                { 
                    wordCount+=2;
                    debugCount+=2;
                    //show_debug_message("added 2 words for 'and others'");
                }
            }
            //show_debug_message("item had " +string(debugCount) +" words.");
        }
        
        
        if  (yearString  != "")
        and (yearString  != "0")
        {
            wordCount++; // add a word for year
            //show_debug_message(string(object_get_name(object_index)) +" added a word due to year " +string(yearString))
        }
        
        if  (monthString != "")
        and (monthString != "0")
        {
            wordCount++; // add a word for month
            //show_debug_message(string(object_get_name(object_index)) +" added a word due to month " +string(monthString))
        }
        
        if  (dayString   != "")
        and (dayString   != "0")
        {   
            wordCount++; // add a word for day
            //show_debug_message(string(object_get_name(object_index)) +" added a word due to day " +string(dayString))
        }
    
        
        
        if (object_index == WITNESS)
        {
            var debugCount = 0;
            var listW = nameList;
            var sizeW = ds_list_size(listW);
            for (var i=0; i<sizeW; i++)
            {
                var line = ds_list_find_value(listW,i);
                
                wordCount += string_count(" ",line)+1;
                debugCount += string_count(" ",line)+1;
                //show_debug_message("WITNESS has "+string(debugCount) +" words in its namelist")
            }
        }
    }
}

//show_message("words counted = " +string(wordCount));
return wordCount;
