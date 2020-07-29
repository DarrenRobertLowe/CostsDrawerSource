/// getTempDescription()
/* Returns STRING
 *
 * Argument0 = tempDescriptionList
 *
 * Event:
 * Called when done editing a description field.
 *
 * Description:
 *  Iterates through an existing description list and converts each
 *    list item into to a string in order to be edited.
 *  Also changes selectedField to "description".
 *
 * Related to:
 * confirmDescription()
*/

var tempDescription = "";                                               // clear our description string
var tempString  = "";                                                   // create a temporary string to store each line


/* Descriptions are separated into lines of text, in the form of a list.
 * Take each list item and concatonate it to a string for editing while 
 * removing the extra spaces added to each line.*/
for(i=0; i<ds_list_size(argument0); i+=1) {                             // iterate through the list...
    tempString = string(ds_list_find_value(argument0,i))                // add each list item to a string
    tempDescription += tempString; // SOLUTION TO PROBLEM: don't remove any spaces, we'll do that in tempFormatDescription
    //if i == 0 then tempDescription += tempString;                     // if we're on the first line just add tempString to tempDescription string.
    //else tempDescription += string_delete(tempString,1,2);            // otherwise, remove extra starting spaces from tempString before adding to tempDescription.
}

selectedField = "description";
return tempDescription;                                                 // keyboard_string = tempDescription;
