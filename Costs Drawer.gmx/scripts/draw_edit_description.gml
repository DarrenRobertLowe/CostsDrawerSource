/// draw_edit_description(descriptionList,tempString);
//reset_zoom();
ds_list_clear(argument0);
var description = string(argument1);                                                // the string to be formatted
var char = "";
var previousChar = char;
var previousPreviousChar = "";

// SETUP //
draw_set_font(font_Times)                                                                       // TIMES 11 NEEDS TO BE USED FOR CALCULATING WORDS PER ROW!
var descriptionAreaWidth = global.descriptionTextWidth;                                         // WE DON'T TAKE SCALE INTO CONSIDERATION FOR THIS CALCULATION!
if (object_index == PLAINTIFF) or (object_index == DEFENDANT) then descriptionAreaWidth /= 1.5; // because these use a bold font

//spellcheck setup
wrongWordOut = 0;
wrongWordIn  = 0;

//show_debug_message("descriptionAreaWidth = "+string(descriptionAreaWidth));


// SEPARATE DESCRIPTION INTO LINES
for (var n=0; string_length(description)>0; n++)                                    // while there's still some string left...
{
    var nextLine   = "";
    
    // get the next line of characters...
    if (string_width(description) >= descriptionAreaWidth)                          // if there's more than 1 row left...
    {
        // Get a line's worth of characters by adding 1 char at a time until we reach descriptionAreaWidth
        var stringWidth = 0;
        var count;
        
        /* stringWidth is the width from 1st char to the "count" char.
         * nextLine is really the current line being added.
         * each loop, stringWidth gets 1 character added, unless it goes over the area width, which ends the loop.
         */
        for (count = 1; (stringWidth < descriptionAreaWidth); stringWidth = string_width(nextLine))          // while the width is less than a row...
        {
            count++;
            nextLine    = string_copy(description,1,count);                       // add one character at a time
        }
        
        //nextLine     = string_copy(description,1,count);    // removing this makes everything narrower than the descriptionAreaWidth for some reason
        description  = string_delete(description,1,count);                          // delete that line from the full description string
        
        
        // break on a space instead of the middle of a word
        if (string_count(" ", nextLine) > 0)                                        // if there's a space in the string...
        {
            var count  = 0;
            var length = string_length(nextLine);
            
            for(var i=(length-1); i>0; i--)                                         // iterate backwards through the string until we find a space.
            {
                count ++;                                                           // how many characters to be separated to the next line
                if (string_char_at(nextLine, i) = " ")                              // once we've found a space...
                {
                    var str = string_copy(nextLine, length-(count-1), count);       // copy that word
                    description = (str + description);                              // re-add that word to the string
                    
                    nextLine = string_delete(nextLine, length-(count-1), count);    // delete the word from the end of the line
                    break;                                                          // stop the loop
                }
            }
        }
        else{} // THIS IS WHERE THE PROGRAM USED TO CRASH DUE TO NO SPACES
        
        
        description = ("  " + description); // add the 2 extra spaces for each subsequent line
    }
    else // we've reached the last line
    {
         nextLine    = description;  // nextLine = the rest of the description
         description = "";           // clear the description, faster than doing the string_delete() stuff.
    }
    
    
    
    
    // BLUE TEXT AND SPELLCHECK
    var tempLine    = nextLine;
    var wordStartX  = 0;
    var yy          = ( (textPosY +((n-1)*rowHeight)) + 4);
    
    
    while ( string_length(tempLine) > 0 )
    {
        var redText     = false;
        var do_a_check  = false;
        
        wordPos = find_first_punctuation_pos(tempLine);     // go word by word...
        
        if (wordPos == 0) // last word of line
        {
            wordPos = string_length(tempLine);
        }
        
        var word        = string_copy(tempLine, 1, wordPos   );   // word + pos (needed!)
        var wordX       = string_copy(tempLine, 1, wordPos-1 );   // word
        var wordLength  = string_length(word);
        var wordXLength = string_length(wordX);
        
        previousPreviousChar = previousChar;
        previousChar = char;
        
        
        // [blue text] tags
        var limit = (wordLength+1);
        if (global.BLUE_TEXT == true)                       // if user is allowing blue text at all...
        {
            for (var i=1; i<(limit); i++)                   // iterate through each char
            {
                char = string_char_at(word, i);
                if (char == "[")
                {
                    blueText = true;
                }
            }
        }
        
        
        // spell check
        if  (blueText == false)
        and (global.SPELLCHECK == true)
        {
            var lastChar = string_char_at(word, wordLength);
            
            if  (is_punctuation(lastChar))                                  // if the word has ended
            and (lastChar != "(")
            and (wordXLength > 1)
            {
                do_a_check = true;
            }
            
            if (wordXLength == 1)
            and !(is_punctuation(wordX))
            {
                do_a_check = true;
            }
            
            if (do_a_check == true)
            {
                //show_debug_message("checking "+string(wordX));
                if  (ds_list_find_index(checkedWords, wordX) == -1)                         // if we haven't checked this word yet
                and (ds_list_find_index(wrongWords, wordX) == -1)                           // if we haven't checked this word yet
                {
                    if (spellcheck(wordX) == false) // failed the spellcheck //spellcheck(wordX, previousChar, previousPreviousChar)
                    {
                        redText = true;
                        ds_list_add_exclusive(wrongWords, wordX);
                    }
                    else // spellcheck passed
                    {
                        ds_list_add_exclusive(checkedWords, wordX);  // removing this makes spellcheck check every word continuously, which can fix some issues but will cut FPS in half!
                    }
                }
                else if (ds_list_find_index(wrongWords, wordX) > -1)
                {
                    redText = true;
                }
            }
        }
        
        
        /// auto change these words...
        word = spellcheck_auto_correct(word);
        
        
        // draw the word
        if (redText == true)
          then draw_set_color(c_red);
        else
        {
            if (blueText == true)
              then draw_set_color(c_blue);
              else draw_set_color(c_black);
        }
        
        draw_set_font_scaled(font_Times);
        draw_text((descriptionX + wordStartX), yy, word);
        
        wordStartX += string_width(word);
        tempLine    = string_delete(tempLine, 1, wordPos);
        
        
        // end [blue text] tags
        if (char == "]")
        {
            blueText = false;
        }
    }
    
    // DO NOT MOVE THIS! IT WILL PREVENT TEXT SCALING WHEN EDITING TEXT!
    draw_set_font(font_Times);
}
blueText = false;


// reset the scaling for drawing
draw_set_font_scaled(font_Times);

// if ds_exists(checkedWords,ds_type_list) then ds_list_destroy(checkedWords);
// if ds_exists(wrongWords,ds_type_list) then ds_list_destroy(wrongWords);
