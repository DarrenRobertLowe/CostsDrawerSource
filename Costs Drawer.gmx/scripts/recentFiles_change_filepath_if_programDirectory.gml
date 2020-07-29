//recentFiles_change_filepath_if_programDirectory(fileFromList)

/* Checks if the filepath is the program directory
 * and changes it to the appdata folder if it is.
 * This was done as a hotfix due to Game Maker sandboxing
 * automatically moving files saved to the program directory
 * to the local appdata folder, which meant Costs Drawer
 * couldn't find files using recent files if they were
 * saved to that folder.
 * e.g. "c:\users\___\costs drawer\asdf.cdf" --> "%localappdata%\costs_drawer\asdf.cdf"
*/

var filePath = argument0;
var str = filePath;
var pos = string_length(str);
var fileDirectory = "";
var fileNameOnly  = "";

//show_message("The program_directory is : " +string(program_directory));

// find the directory (iterate backwards through the string until we find "\")
while (pos > 0) 
{
    // check for "\"
    if (string_char_at(str, pos) == "\")
    {
        fileDirectory = string_copy(str, 1, pos);                       // grab everything up to the last "\"
        fileNameOnly  = string_copy(str, pos+1, string_length(str));    // grab everything after the "\"
        //show_message("The target file's directory is : " +string(fileDirectory));
        //show_message("The target files fileNameOnly is : " +string(fileNameOnly));
        break;
    }
    
    // iterate backwards
    pos--;
}

// change the directory to appdata if it's found to be the same as program_directory
if (fileDirectory == program_directory)
{
    //show_message("program directory and target directory match! we need to change it to appdata.");
    filePath = ( string(PROGRAM_APPDATA) +"\" +string(fileNameOnly) );
    //show_message("filePath is now " + string(filePath));
    show_message("WARNING!: This file will be recovered from one of Costs Drawer's folders.#It is not recommended to save files directly in the Costs Drawer directory.#To avoid any issues, please save this file and all future documents in a dedicated folder! (e.g. a folder in My Documents)");
}

return filePath;
