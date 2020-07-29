// go line by line through description
for(var i=0; i<ds_list_size(shownDescriptionList); i+=1) 
{
    // go letter by letter
    var str = ds_list_find_value(shownDescriptionList,i);
    var length = string_length(str);
    
    var char = "";
    var previousChar = "";
    var tempLine = str;
    var wordStartX = 0;
    var yy = (textPosY + (i*rowHeight));
    
    
    while ( string_length(tempLine) > 0 )
    {
        draw_set_color(c_black);
        
        wordPos = find_first_punctuation_pos(tempLine);     // go word by word...
        
        if (wordPos == 0) // last word of line
        {
            wordPos = string_length(tempLine);
        }
        
        var word  = string_copy(tempLine, 1, wordPos   );   // word + " " (needed!)
        var wordX = string_copy(tempLine, 1, wordPos-1 );   // word
        
        previousChar = char;
        
        
        // [blue text] tags
        for (var n=1; n<( string_length(word) + 1 ); n++)
        {
            char = string_char_at(word,n);
            if (char == "[")
            {
                blueText = true;
            }
        }
        
        
        // draw the word
        if (blueText == true)
            then draw_set_color(c_blue);
            else draw_set_color(c_black);
        
        draw_text((descriptionX + wordStartX), yy, word);
        
        wordStartX += string_width(word);
        tempLine = string_delete(tempLine, 1, wordPos);

        
        // end [blue text] tags
        if (char == "]") 
        {
            //draw_set_color(c_black)
            blueText = false;
        }
    }
}
blueText = false;
