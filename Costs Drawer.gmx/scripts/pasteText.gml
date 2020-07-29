/// pasteText
var tempChar;
var clipboard   = clipboard_get_text();
var len         = string_length(clipboard);
if  (len == 0) then clipboard = " ";     // prevents program locking up!

var limit = (global.maxDescriptionChars - string_length(workingString));


// FORMAT THE CLIPBOARD TEXT FIRST...
// Trim
if (len > limit)
{
    clipboard = string_copy(clipboard,1,limit);
}
clipboard = formatPastedText(clipboard);

// Remove newlines #
for (var i = 1; i <= len; i += 1)
{
    tempChar = string_char_at(clipboard, i );
    if (tempChar == "#")
    {
        clipboard = string_delete(clipboard,i,1);
    }
}


// GRAB LENGTH FOR LATER USE
var clipLength = string_length(clipboard);


// INSERT TEXT INTO DESCRIPTION
workingString  = string_insert(clipboard,workingString,stringPosition+1);    // paste the text

// Don't go over max chars
if (workingString > global.maxDescriptionChars)
{
    workingString = string_copy(workingString,1,global.maxDescriptionChars);
}


// I THINK THIS IS FOR SPLITTING ON SPACES
var word   = "";
var buffer = 50;
for(var i=0; i<string_length(workingString); i++)
{
    var char = string_char_at(workingString,i);
    
    if ( (string_width(word) + string_width(char) ) > (global.descriptionColumnWidth - buffer) )
    {
        //show_message("reached the limit!");
        workingString = string_delete(workingString, i, string_length(workingString));
        i = string_length(workingString);
        
        //show_message("working string is now " +string(workingString));
    }
    else
    {
        word = string_insert(char, word, string_length(word));
    }
    
    if (char == " ") then word = "";
}


// UPDATE STRING POSITION
show_debug_message("pasteText stringPosition = "+string(stringPosition));
stringPosition += clipLength;
show_debug_message("clipLength = "+string(clipLength));
show_debug_message("pasteText stringPosition now is = "+string(stringPosition));

if (highlightingText == false) then refresh_string_position(stringPosition); // or clicking around and highlighting will be broken

set_unsaved();
